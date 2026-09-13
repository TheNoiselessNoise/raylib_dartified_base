part of '../../raylib_dartified_base.dart';

/// Extends [RaylibTempAllocator] with string allocation, handling
/// UTF-8 encoding and null-termination into temporary slots.
final class RaylibTempStringAllocator extends RaylibTempAllocator<RChar> {

  /// Number of anonymous (ring-buffer) string slots pre-reserved on construction.
  int slotCount;

  RaylibTempStringAllocator(super.temp, {
    required super.byteSize,
    required this.slotCount,
  });

  @override
  String get name => 'String';

  int stringAnonIndex = 0;
  List<MemoryPointer<RChar>> stringSlots = [];
  List<int> stringCapacities = [];
  final Map<String, int> stringSlotsKeyed = {};
  final Map<String, (MemoryPointer<RPointer<RChar>>, int)> stringSlotsPtrsKeyed = {};
  
  /// Resets all slot bookkeeping structures to their initial state.
  ///
  /// Called during construction and at the end of [dispose].
  void reset() {
    // NOTE: needs to be growable
    stringSlots = .generate(slotCount, (_) => MemoryPointer.nullptr(), growable: true);
    stringCapacities = .filled(slotCount, 0, growable: true);
    stringAnonIndex = 0;
  }

  MemoryPointer<RChar> _allocateString(String text, [int? bufferSize]) {
    final bytes = utf8.encode(text);
    final len = bytes.length + 1; // +1 for NUL
    final bufSize = (bufferSize != null && bufferSize > len) ? bufferSize : len;

    final ptr = MemoryPointer.calloc<RChar>(bufSize, RChar.scalarByteSize);
    ptr.asView<Uint8List>(bufSize)
      ..setRange(0, bytes.length, bytes)
      ..fillRange(bytes.length, bufSize, 0); // NUL + pad rest of buffer

    return ptr;
  }

  MemoryPointer<RPointer<RChar>> AtPtr(String key, [int count = 1]) {
    final existing = stringSlotsPtrsKeyed[key];
    if (existing != null) {
      final (ptr, currentCount) = existing;
      if (count <= currentCount) {
        stringSlotsPtrsKeyed[key] = (ptr, count);
        return ptr;
      }
      ptr.free();
    }
    final ptr = _allocatePointer<RChar>(count);
    ptr._allocationKey = key;
    stringSlotsPtrsKeyed[key] = (ptr, count);
    return ptr;
  }

  /// Writes each string in [array] into keyed sub-slots and returns a tracked
  /// pointer of length `array.length`.
  ///
  /// Sub-slot keys follow the pattern `<key>_<i>`. [key] defaults to
  /// `default`.
  MemoryPointer<RPointer<RChar>> Array(List<String> array, {String? key}) {
    final arrayKey = _slotKey(key);
    final pp = AtPtr(arrayKey, array.length);
    for (int i = 0; i < array.length; i++) {
      final innerPtr = ValueAt('${arrayKey}_$i', array[i]);
      pp.writePtr(innerPtr, i * RType.nativeWordSize);
    }
    return pp;
  }

  /// Returns the pointer of pointers.
  /// 
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<RPointer<RChar>> RawPtr(int count) => _allocatePointer(count);

  /// Returns the pointer for [text].
  /// 
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<RChar> RawValue(String text, [int? bufferSize]) => _allocateString(text, bufferSize);

  /// Returns the pointer for [text] using the next anonymous ring-buffer slot.
  /// 
  /// Anonymous slots cycle modulo [slotCount], so older anonymous strings may be overwritten.
  /// 
  /// If [key] is provided, delegates to [ValueAt] instead.
  MemoryPointer<RChar> Value(String text, [String? key, int? bufferSize]) {
    if (key != null) return ValueAt(key, text, bufferSize);
    final slot = stringAnonIndex;
    stringAnonIndex = (stringAnonIndex + 1) % slotCount;
    _ensureSlotExists(slot);
    return _writeToSlot(slot, text, bufferSize);
  }

  /// Writes [text] into slot using `Value` and returns its pointer, or returns `nullptr`
  /// if [text] is `null`.
  ///
  /// Use this instead of [Value] when the C API uses a null pointer to signal "no value".
  MemoryPointer<RChar> ValueOrNull([String? text, String? key, int? bufferSize])
    => text == null ? MemoryPointer.nullptr() : Value(text, key, bufferSize);

  /// Returns the pointer for the keyed slot [key], optionally writing
  /// [text] into it.
  ///
  /// Allocates the slot on first use. If [text] is `null` the existing string
  /// is returned; asserts that the slot has been initialised at least once.
  MemoryPointer<RChar> ValueAt(String key, [String? text, int? bufferSize]) {
    final int slot = stringSlotsKeyed.putIfAbsent(
      key, () => slotCount + stringSlotsKeyed.length,
    );

    _ensureSlotExists(slot);

    if (text != null) {
      return _writeToSlot(slot, text, bufferSize);
    }

    assert(
      !stringSlots[slot].isNull,
      '[TEMP] String.ValueAt("$key") used before initialization'
    );

    return stringSlots[slot];
  }

  /// Returns the pointer for the slot identified by a unique [key] suffix
  /// optionally writing [text] into it.
  ///
  /// Behaves like [ValueAt], but prepends a monotonic ID from [RaylibTemp.nextId] to
  /// [key], ensuring the slot is never accidentally shared with an unrelated
  /// call that happens to use the same base key.
  MemoryPointer<RChar> ValueAtUnique(String text, {String key = '@valueUnique:', int? bufferSize})
    => ValueAt(_uniqueSlotKey(key), text, bufferSize);

  /// Ensures the slot list is large enough to hold index [slot], growing it
  /// with null-pointer sentinels if necessary.
  void _ensureSlotExists(int slot) {
    if (slot < stringSlots.length) return;

    final growBy = slot + 1 - stringSlots.length;

    stringSlots.addAll(List.generate(growBy, (_) => MemoryPointer.nullptr()));
    stringCapacities.addAll(List.filled(growBy, 0));
  }

  late Uint8List _lastBytes;

  int Length(String text, [int? bufferSize]) {
    _lastBytes = utf8.encode(text);
    return bufferSize ?? _lastBytes.length + 1;
  }

  /// Writes [text] into slot [slot], reallocating if the current capacity is
  /// insufficient for the UTF-8 encoded length.
  ///
  /// Always null-terminates the written string.
  MemoryPointer<RChar> _writeToSlot(int slot, String text, [int? bufferSize]) {
    final requiredBytes = Length(text, bufferSize);

    _reallocSlotIfRequired(slot, requiredBytes);

    final dst = stringSlots[slot].asView<Uint8List>(requiredBytes);
    dst.setAll(0, _lastBytes);
    dst.fillRange(_lastBytes.length, requiredBytes, 0); // NUL + zero any trailing pad

    return stringSlots[slot];
  }

  void _reallocSlotIfRequired(int slot, int length) {
    if (stringSlots[slot].isNull || stringCapacities[slot] < length) {
      if (!stringSlots[slot].isNull) stringSlots[slot].free();
      stringSlots[slot] = Raw(length);
      stringCapacities[slot] = length;
    }
  }

  @override
  void Free(String key) {
    if (!stringSlotsKeyed.containsKey(key)) {
      throw StateError('[FREE] Cannot free unallocated String slot $key');
    }

    int slot = stringSlotsKeyed[key]!;
    stringSlots[slot].free();
    stringSlotsKeyed.remove(key);
    stringSlots[slot] = MemoryPointer.nullptr();
    stringCapacities[slot] = 0;
  }

  @override
  void dispose() {
    if (stringSlots.isNotEmpty) {
      final nonNulls = stringSlots.where((e) => !e.isNull);
      temp.debugFreeInfo('Freeing preallocated $slotCount $name slots (used ${nonNulls.length})');
      nonNulls.forEach((p) => p.free());
    }
    if (stringSlotsKeyed.isNotEmpty) {
      temp.debugFreeInfo('Freeing user-defined ${stringSlotsKeyed.length} $name slots');
    }
    if (stringSlotsPtrsKeyed.isNotEmpty) {
      temp.debugFreeInfo('Freeing user-defined ${stringSlotsPtrsKeyed.length} $name Array slots');
      stringSlotsPtrsKeyed.values.forEach((v) => v.$1.free());
    }
    reset();
  }

  /// Writes [o] into slot `@slot:1` and returns its pointer.
  ///
  /// Use [RefOrNull1] if [o] may be `null` and the callee expects `nullptr` in that case.
  MemoryPointer<RChar> Ref1([String? o, int? bufferSize]) => ValueAt('@slot:1', o, bufferSize);

  /// Writes [o] into slot `@slot:2` and returns its pointer.
  ///
  /// Use [RefOrNull2] if [o] may be `null` and the callee expects `nullptr` in that case.
  MemoryPointer<RChar> Ref2([String? o, int? bufferSize]) => ValueAt('@slot:2', o, bufferSize);

  /// Writes [o] into slot `@slot:3` and returns its pointer.
  ///
  /// Use [RefOrNull3] if [o] may be `null` and the callee expects `nullptr` in that case.
  MemoryPointer<RChar> Ref3([String? o, int? bufferSize]) => ValueAt('@slot:3', o, bufferSize);

  /// Writes [o] into slot `@slot:4` and returns its pointer.
  ///
  /// Use [RefOrNull4] if [o] may be `null` and the callee expects `nullptr` in that case.
  MemoryPointer<RChar> Ref4([String? o, int? bufferSize]) => ValueAt('@slot:4', o, bufferSize);

  /// Writes [o] into slot `@slot:1` and returns its pointer, or returns `nullptr` if [o] is `null`.
  ///
  /// Use this instead of [Ref1] when the C API uses a null pointer to signal "no value".
  MemoryPointer<RChar> RefOrNull1(String? o, [int? bufferSize]) => o == null ? MemoryPointer.nullptr() : Ref1(o, bufferSize);

  /// Writes [o] into slot `@slot:2` and returns its pointer, or returns `nullptr` if [o] is `null`.
  ///
  /// Use this instead of [Ref2] when the C API uses a null pointer to signal "no value".
  MemoryPointer<RChar> RefOrNull2(String? o, [int? bufferSize]) => o == null ? MemoryPointer.nullptr() : Ref2(o, bufferSize);

  /// Writes [o] into slot `@slot:3` and returns its pointer, or returns `nullptr` if [o] is `null`.
  ///
  /// Use this instead of [Ref3] when the C API uses a null pointer to signal "no value".
  MemoryPointer<RChar> RefOrNull3(String? o, [int? bufferSize]) => o == null ? MemoryPointer.nullptr() : Ref3(o, bufferSize);

  /// Writes [o] into slot `@slot:4` and returns its pointer, or returns `nullptr` if [o] is `null`.
  ///
  /// Use this instead of [Ref4] when the C API uses a null pointer to signal "no value".
  MemoryPointer<RChar> RefOrNull4(String? o, [int? bufferSize]) => o == null ? MemoryPointer.nullptr() : Ref4(o, bufferSize);
}