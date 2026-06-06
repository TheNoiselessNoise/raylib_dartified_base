part of 'raylib_dartified_base.dart';

/// Base class for Raylib temporary allocators, managing typed memory slots
/// with a consistent allocation/free lifecycle.
///
/// Type parameters:
/// - [TempType] the temp context this allocator belongs to
/// - [P] the pointer type (`WasmPointer` on WASM, `Pointer<C>` on native)
/// - [S] the source type that pointers are created from (`int` on WASM, `Pointer<C>` on native)
abstract class RaylibTempAllocatorBase<TempType extends RaylibTempBase, P, S> {
  final TempType temp;

  /// Debug name for this allocator, used in logging and diagnostics.
  final String name;

  /// Size in bytes of a single element this allocator manages.
  final int byteSize;

  /// Allocates [count] elements and returns the raw source pointer.
  final S Function([int count]) allocatorFunc;

  /// Frees the memory at [ptr].
  final void Function(S ptr) freeFunc;

  /// Wraps a source pointer [ptr] into the platform pointer type [P].
  final P Function(S ptr) pointerFactory;

  /// Unwraps a platform pointer [ptr] back to its source type [S].
  final S Function(P ptr) pointerToSource;

  /// Returns a null/zero pointer of type [P].
  final P Function() nullptrFactory;

  /// Returns a human-readable string representation of [ptr].
  final String Function(P ptr) printerFunc;

  /// Returns `true` if [ptr] is null or zero.
  final bool Function(P ptr) isPointerNull;

  RaylibTempAllocatorBase(this.temp, this.name, {
    required this.byteSize,
    required this.allocatorFunc,
    required this.freeFunc,
    required this.pointerFactory,
    required this.pointerToSource,
    required this.nullptrFactory,
    required this.printerFunc,
    required this.isPointerNull,
  });

  /// Active allocation slots, keyed by slot name.
  /// Each entry holds the pointer and its element count.
  final Map<String, (P, int)> slots = {};

  /// Returns a string that identifies the concrete type of this allocator,
  /// including its type parameters.
  String signature() => runtimeType.toString();

  /// Returns the canonical slot key for [key], falling back to `'struct'`
  /// when [key] is `null`.
  String slotKey([String? key]) => key ?? 'default';

  /// Returns a slot key guaranteed to be unique within this temp context,
  /// by prefixing [key] with the next available ID.
  String uniqueSlotKey(String key) => '${temp.nextId()}_$key';

  /// Allocates [count] raw elements and returns the wrapped pointer.
  P Raw([int count = 1]) => pointerFactory(allocatorFunc(count));

  /// Returns the `P` stored in [key], allocating (or reallocating)
  /// if necessary.
  ///
  /// If the slot already exists and its current capacity is >= [count], the
  /// existing pointer is reused. If capacity is insufficient the old block is
  /// freed and a new one of size [count] is allocated.
  ///
  /// [key]   – slot identifier (must not be null).
  /// [count] – minimum element capacity required (default: 1).
  P At(String key, [int count = 1]) {
    final existing = slots[key];
    if (existing != null) {
      final (ptr, currentCount) = existing;

      if (count <= currentCount) {
        slots[key] = (ptr, count);
        return ptr;
      }

      freeFunc(pointerToSource(ptr));
    }

    final ptr = pointerFactory(allocatorFunc(count));
    slots[key] = (ptr, count);
    return ptr;
  }

  /// Allocates (or reuses) a slot identified by a unique [key] suffix.
  ///
  /// Behaves like [At], but prepends a monotonic ID from [RaylibTempBase.nextId] to
  /// [key], ensuring the slot is never accidentally shared with an unrelated
  /// call that happens to use the same base key.
  ///
  /// Useful when the same allocation site may be called multiple times within
  /// a single scope and each call must get its own independent buffer.
  P AtUnique(String key, [int count = 1]) => At(uniqueSlotKey(key), count);

  /// Returns the total byte size for [count] elements.
  int Size([int count = 1]) => byteSize * count;

  /// Returns the pointer stored under [key], or `null` if the slot does not
  /// exist. Does **not** allocate.
  P? Slot(String key) => slots[slotKey(key)]?.$1;

  /// Returns `true` if a slot with the given [key] exists.
  bool Has(String key) => slots.containsKey(slotKey(key));

  /// Frees the native memory owned by slot [key] and removes it from the
  /// table.
  ///
  /// Throws if [key] has not been allocated.
  void Free(String key) {
    if (!slots.containsKey(key)) throw StateError('[FREE] Cannot free unallocated slot $key');
    freeFunc(pointerToSource(slots[key]!.$1));
    slots.remove(key);
  }

  /// Removes the slot entry for [key] from the table **without** freeing the
  /// underlying memory.
  ///
  /// Use when ownership of the pointer has been transferred elsewhere.
  void Unslot(String key) => slots.remove(slotKey(key));

  /// Frees all currently tracked slots and clears the slot table.
  ///
  /// Called automatically by the owning [RaylibTempBase] during disposal.
  void dispose() {
    if (slots.isNotEmpty) {
      temp.debugFreeInfo('Freeing user-defined ${slots.length} $name slots');
      slots.entries.forEach((x) {
        temp.debugFreeInfo('[FREE] ${x.key}');
        freeFunc(pointerToSource(x.value.$1));
      });
      slots.clear();
    }
  }
}

/// Extends [RaylibTempAllocatorBase] with the ability to write individual
/// Dart values directly into allocated memory.
///
/// Type parameters:
/// - [X] the Dart-side value type being written (e.g. `int`, `double`)
mixin RaylibTempLiteralAllocatorBase<
  TempType extends RaylibTempBase, X, P, S
> on RaylibTempAllocatorBase<
  TempType, P, S
> {
  /// Writes [value] into the [i]-th element of the array at [ptr].
  void Function(P ptr, int i, X value) get indexSetterFunc;
  
  /// Writes a single Dart value [value] into the memory pointed to by [ptr].
  void Function(P ptr, X value) get literalSetterFunc;

  /// Allocates an unslotted array and populates it from [array].
  ///
  /// The caller is responsible for freeing the returned pointer.
  P RawArray(List<X> array) {
    final p = Raw(array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(p, i, array[i]);
    return p;
  }

  /// Returns the pointer for the slot identified by [key] (default: `'struct'`),
  /// writing [value] into it when provided.
  ///
  /// Allocates the slot on first use.
  P Value([X? value, String? key]) {
    final p = At(slotKey(key));
    if (value != null) literalSetterFunc(p, value);
    return p;
  }

  /// Writes [array] into a slot of sufficient capacity and returns the pointer.
  ///
  /// [key] defaults to `'struct'`. The slot is grown automatically if the
  /// current capacity is smaller than `array.length`.
  P Array(List<X> array, {String? key}) {
    final p = At(slotKey(key), array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(p, i, array[i]);
    return p;
  }

  /// Allocates (or reuses) a slot of [count] elements, populating each index
  /// [i] with the value returned by `init(i)`.
  P Fill(int count, X Function(int) init, {String? key}) {
    final p = At(slotKey(key), count);
    for (int i = 0; i < count; i++) indexSetterFunc(p, i, init(i));
    return p;
  }

  /// Writes [o] into slot `'1'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '1')`. Use [RefOrNull1] if [o] may be `null`
  /// and the callee expects `nullptr` in that case.
  P Ref1([X? o]) => Value(o, '1');

  /// Writes [o] into slot `'2'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '2')`. Use [RefOrNull2] if [o] may be `null`
  /// and the callee expects `nullptr` in that case.
  P Ref2([X? o]) => Value(o, '2');

  /// Writes [o] into slot `'3'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '3')`. Use [RefOrNull3] if [o] may be `null`
  /// and the callee expects `nullptr` in that case.
  P Ref3([X? o]) => Value(o, '3');

  /// Writes [o] into slot `'4'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '4')`. Use [RefOrNull4] if [o] may be `null`
  /// and the callee expects `nullptr` in that case.
  P Ref4([X? o]) => Value(o, '4');

  /// Writes [o] into slot `'1'` and returns its pointer, or returns `nullptr`
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref1] when the C API uses a null pointer to signal "no value".
  P RefOrNull1(X? o) => o == null ? nullptrFactory() : Ref1(o);

  /// Writes [o] into slot `'2'` and returns its pointer, or returns `nullptr`
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref2] when the C API uses a null pointer to signal "no value".
  P RefOrNull2(X? o) => o == null ? nullptrFactory() : Ref2(o);

  /// Writes [o] into slot `'3'` and returns its pointer, or returns `nullptr`
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref3] when the C API uses a null pointer to signal "no value".
  P RefOrNull3(X? o) => o == null ? nullptrFactory() : Ref3(o);

  /// Writes [o] into slot `'4'` and returns its pointer, or returns `nullptr`
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref4] when the C API uses a null pointer to signal "no value".
  P RefOrNull4(X? o) => o == null ? nullptrFactory() : Ref4(o);
}

/// Extends [RaylibTempLiteralAllocatorBase] with typed list interop,
/// the ability to view allocated memory as a Dart `List<X>` and construct
/// a typed list from an iterable.
///
/// Type parameters:
/// - [X] the Dart-side element type (e.g. `int`, `double`)
/// - [L] the concrete [TypedDataList] type (e.g. `Uint8List`, `Float32List`)
mixin RaylibTempLiteralTypedListAllocatorBase<
  TempType extends RaylibTempBase, X, L extends TypedDataList, P, S
> on RaylibTempLiteralAllocatorBase<
  TempType, X, P, S
> {
  /// Returns a Dart `List<X>` with [length] elements copied from [ptr].
  List<X> Function(S ptr, int length) get asDartList;

  /// Returns a [L] with [length] elements copied from [ptr].
  L Function(S ptr, int length) get asTypedList;

  /// Constructs a typed list [L] from an iterable of [X] values.
  L Function(Iterable<X> list) get fromList;

  /// Wraps [ptr] as a Dart [TypedDataList] of [length] elements.
  ///
  /// The list is a **view** into native memory, so mutations are reflected
  /// immediately in the native buffer.
  L Function(S ptr, int length) get asView;

  /// Wraps a region of [buffer] as a Dart [L] list without copying.
  ///
  /// Acts as the inverse of [asView]: where [asView] views native
  /// memory as a Dart typed list, [fromBuffer] views an existing Dart
  /// [ByteBuffer] as an [L], allowing [FromTypedData] to bulk-copy foreign
  /// typed data into a slot without going through raw bytes.
  ///
  /// [offsetInBytes] and [length] are forwarded directly to the underlying
  /// `buffer.asXxxList()` call, so the usual alignment and bounds rules apply.
  L Function(ByteBuffer buffer, int offsetInBytes, int length) get fromBuffer;

  /// Allocates (or reuses) a slot of [length] elements and returns its pointer,
  /// without writing any data into it.
  ///
  /// Unlike [Array] or [Fill], the contents are left uninitialized, useful when
  /// the buffer will be populated by a C call rather than from Dart.
  /// [key] defaults to `'Sized<C>'`.
  P Sized(int length, {String? key}) => At(key ?? 'Sized$X', length);

  /// Copies [length] elements from [src] into a slot and returns the pointer.
  ///
  /// Uses [asView] for the bulk copy, which avoids an element-by-element
  /// loop. [key] defaults to `'struct'`.
  P Copy(S src, int length, {String? key}) {
    final p = At(slotKey(key), length);
    asView(pointerToSource(p), length).setAll(0, asView(src, length));
    return p;
  }

  /// Copies [length] elements from a typed list [list] into a slot.
  P FromTypedList(L list, {String? key}) {
    final p = Sized(list.length, key: key);
    asView(pointerToSource(p), list.length).setAll(0, list);
    return p;
  }

  /// Copies [data] into a slot by reinterpreting its bytes as elements of type [X].
  ///
  /// Unlike [FromTypedList], accepts any [TypedData] regardless of its element
  /// type, converting via the underlying byte buffer. [data] must be a whole
  /// number of [byteSize]-sized elements.
  P FromTypedData(TypedData data, {String? key}) {
    final byteCount = data.lengthInBytes;
    assert(byteCount % byteSize == 0);
    final length = byteCount ~/ byteSize;
    final p = Sized(length, key: key);
    final src = fromBuffer(data.buffer, data.offsetInBytes, length);
    asView(pointerToSource(p), length).setAll(0, src);
    return p;
  }
}

/// Specializes [RaylibTempLiteralTypedListAllocatorBase] for integer element types,
/// adding integer-specific allocation helpers on top of the typed list interop.
mixin RaylibTempLiteralIntAllocatorBase<
  TempType extends RaylibTempBase, L extends TypedDataList, P, S
> on RaylibTempLiteralTypedListAllocatorBase<
  TempType, num, L, P, S
> {
  /// Serialises [length] words starting at [ptr] to a flat big-endian byte list.
  ///
  /// Each word is split into `byteSize` bytes, most-significant byte first.
  L ToBEBytes(S ptr, int length) =>
    fromList(asDartList(ptr, length).expand((word) =>
      .generate(byteSize, (i) => (word.toInt() >> ((byteSize - 1 - i) * 8)) & 0xFF)
    ));

  /// Serialises [length] words starting at [ptr] to a flat little-endian byte list.
  ///
  /// Each word is split into `byteSize` bytes, least-significant byte first.
  L ToLEBytes(S ptr, int length) =>
    fromList(asDartList(ptr, length).expand((word) =>
      .generate(byteSize, (i) => (word.toInt() >> (i * 8)) & 0xFF)
    ));
}

/// Specializes [RaylibTempLiteralTypedListAllocatorBase] for floating-point element types.
mixin RaylibTempLiteralFloatAllocatorBase<
  TempType extends RaylibTempBase, L extends TypedDataList, P, S
> on RaylibTempLiteralTypedListAllocatorBase<
  TempType, num, L, P, S
> {}

/// Extends [RaylibTempAllocatorBase] with the ability to allocate pointer-to-pointer
/// slots, where [PP] is the outer pointer type and [X] is the pointee's Dart-side value.
mixin RaylibTempLiteralPointerAllocatorBase<
  TempType extends RaylibTempBase, X, PP, P, S
> on RaylibTempAllocatorBase<
  TempType, PP, S
> {
  /// Converts a flat `List<X>` into an allocated `P` array.
  ///
  /// The caller is responsible for the lifetime of the inner pointers.
  P Function(List<X> array) get rawArrayFunc;

  /// Overwrites the [i]-th element of the array at [ptr] with [value].
  void Function(PP ptrptr, int i, P ptr) get indexSetterFunc;

  /// Allocates an unslotted pointer-of-pointers from a list of value arrays.
  ///
  /// Each `arrays[i]` is converted via [rawArrayFunc].
  ///
  /// The caller is responsible for freeing the returned pointer.
  PP RawArray(List<List<X>> arrays) {
    final pp = Raw(arrays.length);
    for (int i = 0; i < arrays.length; i++) indexSetterFunc(pp, i, rawArrayFunc(arrays[i]));
    return pp;
  }

  /// Writes each sub-array in [arrays] into a tracked slot via [rawArrayFunc]
  /// and returns the outer `PP`
  PP Fill(List<List<X>> arrays, {String? key}) {
    final pp = At(slotKey(key), arrays.length);
    for (int i = 0; i < arrays.length; i++) indexSetterFunc(pp, i, rawArrayFunc(arrays[i]));
    return pp;
  }

  /// Fills a tracked slot of [count] pointers by calling `init(i)` for each
  /// index and storing the result.
  PP FillRaw(int count, P Function(int) init, {String? key}) {
    final pp = At(slotKey(key), count);
    for (int i = 0; i < count; i++) indexSetterFunc(pp, i, init(i));
    return pp;
  }
}

/// Extends [RaylibTempAllocatorBase] with struct allocation, providing
/// [PointerTo], [_Ref], [_RefOrNull], [_RefUpdate], and [_Extract] helpers for
/// Dart mirror objects ([X]) backed by native structs ([V]).
mixin RaylibTempStructAllocatorBase<
  TempType extends RaylibTempBase,            // RaylibTemp
  X extends RaylibStructBase<TempType, P, X>, // Dart mirror object
  V,                                          // Value (WASM: X, NATIVE: C)
  P,                                          // Pointer (WASM: WasmPointer, NATIVE: Pointer<C>)
  S                                           // "source" type (WASM: int, NATIVE: Pointer<C>)
> on RaylibTempAllocatorBase<
  TempType, P, S
> {

  /// Returns the [V] struct value referenced by [ptr].
  V Function(P ptr) get refFunc;

  /// Assigns [value] to the struct referenced by [ptr].
  P Function(P ptr, V value) get setRefFunc;

  /// Writes the Dart value [value] into the [i]-th element of the array at [ptr].
  void Function(P ptr, int i, X value) get writeIntoIndexedFunc;
  
  /// Writes the Dart value [value] into the struct at [ptr].
  void Function(P ptr, X value) get writeIntoFunc;
  
  /// Copies the raw C struct [value] into the [i]-th element of the array at [ptr].
  void Function(P ptr, int i, V value) get setCFunc;
  
  /// Returns the [C] struct at index [i] of the array at [ptr].
  V Function(P ptr, int i) get indexerFunc;
  
  /// Overwrites the [i]-th element of the array at [ptr] with [value].
  void Function(P ptr, int i, V value) get indexSetterFunc;

  /// Converts a `P` to its Dart-side [X] wrapper, referencing the memory at that pointer.
  X Function(P ptr) get pointerToStruct;

  /// Copies the fields of [source] into the native memory at [ptr].
  void Function(P ptr, X source) get updateFunc;

  /// Builds a [RaylibTempBase] slot key from [value]'s `structName`, `tag`, and an optional [inner] suffix.
  @nonVirtual
  String getBaseKey(X value, [String? inner]) => '${value.structName}_${value.$state.tag}_$inner';

  /// Like [getBaseKey] but prefixed with [value]'s `internalId`, used for
  /// pointer-owning structs to prevent cross-instance key collisions.
  @nonVirtual
  String getBaseKeyWithId(X value, [String? inner]) => '${value.$state.nextId}_${getBaseKey(value, inner)}';

  /// Allocates or syncs [value] to a tracked slot at [key].
  P PointerTo(X value, [String? key]) {
    if (!value.structRequiresOriginalPointer) {
      String baseKey = getBaseKey(value, slotKey(key));
      value.$state.allocKey = baseKey;
      final p = At(baseKey);
      value.structAllocateInto(temp, p, baseKey);
      value.structSyncInto(temp, p, baseKey);
      return p;
    }

    final op = value.originalPointer;

    if (op != null) {
      String allocKey = value.$state.allocKey ??= '<CHILD-POINTER>';

      if (value.$state.isFirstSync) {
        if (value.$state.isDisposed) return op;
        if (!temp.doSync) return op;

        // full sync once to push pre-promotion Dart state to memory
        temp.debugSyncInfo('[SYNC] ${value.structName} first sync into $allocKey');
        value.structSyncInto(temp, op, allocKey);
        value.$state.isFirstSync = false;
      } else {
        // already live, setters handle write-through, skip full sync
        temp.debugSyncInfo('[SYNC] ${value.structName} skipping sync (live) $allocKey');
      }
      
      return op;
    }

    if (value.$state.isDisposed) {
      throw StateError('You are trying to allocate disposed object!');
    }

    String baseKey = getBaseKeyWithId(value, slotKey(key));
    temp.debugSyncInfo('[SYNC] ${value.structName} allocate into $baseKey');
    value.$state.allocKey = baseKey;
    final p = At(baseKey);
    value.structAllocateInto(temp, p, baseKey);
    value.structSyncInto(temp, p, baseKey);
    value.originalPointer = p;
    return p;
  }

  /// Allocates an unslotted array and populates it from [array].
  ///
  /// The caller is responsible for freeing the returned pointer.
  P RawArray(List<X> array) {
    final p = Raw(array.length);
    for (int i = 0; i < array.length; i++) writeIntoIndexedFunc(p, i, array[i]);
    return p;
  }

  /// Allocates an unslotted array of [count] structs, populating each via
  /// `init(i, struct)` which writes directly into the native memory.
  ///
  /// The caller is responsible for freeing the returned pointer.
  P RawFillInto(int count, void Function(int, V) init) {
    final p = Raw(count);
    for (int i = 0; i < count; i++) init(i, indexerFunc(p, i));
    return p;
  }

  /// Allocates an unslotted array of [count] structs, setting each element to
  /// the [C] returned by `init(ptr, i)`.
  ///
  /// The caller is responsible for freeing the returned pointer.
  P RawFillWith(int count, V Function(P, int) init) {
    final p = Raw(count);
    for (int i = 0; i < count; i++) indexSetterFunc(p, i, init(p, i));
    return p;
  }

  /// Copies [length] structs from [src] into a tracked slot using [setCFunc].
  P Copy(P src, int length, {String? key}) {
    final p = At(slotKey(key), length);
    for (int i = 0; i < length; i++) setCFunc(p, i, indexerFunc(src, i));
    return p;
  }

  /// Returns the pointer for slot [key], optionally writing [value] into it.
  ///
  /// Allocates the slot on first use.
  P Value([X? value, String? key]) {
    final p = At(slotKey(key));
    if (value != null) writeIntoFunc(p, value);
    return p;
  }

  /// Writes [array] into a tracked slot of sufficient capacity.
  P Array(List<X> array, {String? key}) {
    final p = At(slotKey(key), array.length);
    for (int i = 0; i < array.length; i++) writeIntoIndexedFunc(p, i, array[i]);
    return p;
  }

  /// Fills a tracked slot of [count] structs, producing each element via
  /// `init(i)` and writing it through [writeIntoIndexedFunc].
  P Fill(int count, X Function(int) init, {String? key}) {
    final p = At(slotKey(key), count);
    for (int i = 0; i < count; i++) writeIntoIndexedFunc(p, i, init(i));
    return p;
  }

  /// Fills a tracked slot of [count] structs by calling `init(i, struct)`
  /// which writes directly into the native struct fields.
  P FillInto(int count, void Function(int, V) init, {String? key}) {
    final p = At(slotKey(key), count);
    for (int i = 0; i < count; i++) init(i, indexerFunc(p, i));
    return p;
  }

  /// Fills a tracked slot of [count] structs by setting each element to the
  /// [C] returned by `init(ptr, i)`.
  P FillWith(int count, V Function(P, int) init, {String? key}) {
    final p = At(slotKey(key), count);
    for (int i = 0; i < count; i++) indexSetterFunc(p, i, init(p, i));
    return p;
  }

  /// Returns a `P` for the given [V] value, using the existing allocation at [key]
  /// when [x] is `null`, or allocating [x] into [key] via [PointerTo].
  ///
  /// Unlike [_RefOrNull], a `null` [x] does not produce a nullptr, it reuses
  /// the slot's current allocation via [At]. Use [_RefOrNull] when a null input
  /// should produce a nullptr instead.
  P _Ref(X? x, String key) => x == null ? At(key) : PointerTo(x, key);

  /// Allocates [o] into slot `'1'`, or reuses the existing slot `'1'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate1] if the callee may write back into the pointer.
  P Ref1([X? o]) => _Ref(o, '1');

  /// Allocates [o] into slot `'2'`, or reuses the existing slot `'2'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate2] if the callee may write back into the pointer.
  P Ref2([X? o]) => _Ref(o, '2');

  /// Allocates [o] into slot `'3'`, or reuses the existing slot `'3'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate3] if the callee may write back into the pointer.
  P Ref3([X? o]) => _Ref(o, '3');

  /// Allocates [o] into slot `'4'`, or reuses the existing slot `'4'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate4] if the callee may write back into the pointer.
  P Ref4([X? o]) => _Ref(o, '4');

  /// Allocates [o] into slot `'5'`, or reuses the existing slot `'5'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate5] if the callee may write back into the pointer.
  P Ref5([X? o]) => _Ref(o, '5');

  /// Allocates [o] into slot `'6'`, or reuses the existing slot `'6'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate6] if the callee may write back into the pointer.
  P Ref6([X? o]) => _Ref(o, '6');

  /// Allocates [o] into slot `'7'`, or reuses the existing slot `'7'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate7] if the callee may write back into the pointer.
  P Ref7([X? o]) => _Ref(o, '7');

  /// Allocates [o] into slot `'8'`, or reuses the existing slot `'8'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate8] if the callee may write back into the pointer.
  P Ref8([X? o]) => _Ref(o, '8');

  /// Returns a `P` for the given [V] value, using `nullptr` when [x] is `null`.
  ///
  /// Allocates into a numbered slot (1–8) via the corresponding [PointerTo] call,
  /// so the lifetime is tied to the owning [RaylibTempBase].
  P _RefOrNull(X? x, String key) => x == null ? nullptrFactory() : PointerTo(x, key);

  /// Allocates [o] into slot `'1'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate1] if the callee may write back into the pointer.
  P Ref1OrNull([X? o]) => _RefOrNull(o, '1');

  /// Allocates [o] into slot `'2'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate2] if the callee may write back into the pointer.
  P Ref2OrNull([X? o]) => _RefOrNull(o, '2');

  /// Allocates [o] into slot `'3'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate3] if the callee may write back into the pointer.
  P Ref3OrNull([X? o]) => _RefOrNull(o, '3');

  /// Allocates [o] into slot `'4'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate4] if the callee may write back into the pointer.
  P Ref4OrNull([X? o]) => _RefOrNull(o, '4');

  /// Allocates [o] into slot `'5'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate5] if the callee may write back into the pointer.
  P Ref5OrNull([X? o]) => _RefOrNull(o, '5');

  /// Allocates [o] into slot `'6'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate6] if the callee may write back into the pointer.
  P Ref6OrNull([X? o]) => _RefOrNull(o, '6');

  /// Allocates [o] into slot `'7'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate7] if the callee may write back into the pointer.
  P Ref7OrNull([X? o]) => _RefOrNull(o, '7');

  /// Allocates [o] into slot `'8'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate8] if the callee may write back into the pointer.
  P Ref8OrNull([X? o]) => _RefOrNull(o, '8');

  /// Allocates [o] into a numbered slot, invokes [fn] with the resulting
  /// pointer, then syncs any mutations back from native memory into [o] via
  /// [updateFunc].
  ///
  /// If [o] is `null`, passes `nullptr` to [fn] and skips the sync step.
  /// This is the foundation for the [RefUpdate1]–[RefUpdate8] helpers, covering
  /// the common pattern of passing a mutable struct pointer to a C function that
  /// may write into it.
  R _RefUpdate<R>(
    X? o,
    R Function(P p) fn,
    P Function(X) alloc,
  ) {
    final p = o != null ? alloc(o) : nullptrFactory();
    final result = fn(p);
    if (o != null) updateFunc(p, o);
    return result;
  }

  /// Allocates [o] into slot `'1'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o] via [updateFunc].
  ///
  /// Use this instead of [Ref1] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate1<R>(X? o, R Function(P p) fn) => _RefUpdate(o, fn, Ref1);

  /// Allocates [o] into slot `'2'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o] via [updateFunc].
  ///
  /// Use this instead of [Ref2] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate2<R>(X? o, R Function(P p) fn) => _RefUpdate(o, fn, Ref2);

  /// Allocates [o] into slot `'3'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o] via [updateFunc].
  ///
  /// Use this instead of [Ref3] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate3<R>(X? o, R Function(P p) fn) => _RefUpdate(o, fn, Ref3);

  /// Allocates [o] into slot `'4'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o] via [updateFunc].
  ///
  /// Use this instead of [Ref4] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate4<R>(X? o, R Function(P p) fn) => _RefUpdate(o, fn, Ref4);

  /// Allocates [o] into slot `'5'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o] via [updateFunc].
  ///
  /// Use this instead of [Ref5] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate5<R>(X? o, R Function(P p) fn) => _RefUpdate(o, fn, Ref5);

  /// Allocates [o] into slot `'6'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o] via [updateFunc].
  ///
  /// Use this instead of [Ref6] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate6<R>(X? o, R Function(P p) fn) => _RefUpdate(o, fn, Ref6);

  /// Allocates [o] into slot `'7'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o] via [updateFunc].
  ///
  /// Use this instead of [Ref7] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate7<R>(X? o, R Function(P p) fn) => _RefUpdate(o, fn, Ref7);

  /// Allocates [o] into slot `'8'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o] via [updateFunc].
  ///
  /// Use this instead of [Ref8] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate8<R>(X? o, R Function(P p) fn) => _RefUpdate(o, fn, Ref8);

  /// Copies the native struct return by [fn] into a uniquely-keyed tracked slot and
  /// returns its Dart-side [X] wrapper via [pointerToStruct].
  ///
  /// Unique key of the form `'<id>_<key>'` is generated from the allocator's
  /// ID counter. The returned [X] holds a live reference into temp-managed
  /// memory.
  /// 
  /// [fn] can either:
  /// - return [V] directly (native: struct returned by value)
  /// - return void/null and mutate [ptr] in place (WASM: sret convention)
  X RefCapture(String key, dynamic Function(S ptr) fn) {
    key = uniqueSlotKey(key);

    final ptr = At(key);
    final result = fn(pointerToSource(ptr));

    final X value;

    if (result is V) {
      value = pointerToStruct(setRefFunc(ptr, result));
    } else {
      value = pointerToStruct(ptr);
    }

    value.$state.allocKey = key;
    value.$state.nextId; // trigger the ID
    
    return value;
  }

  /// Allocates an uninitialized slot via [alloc], passes the raw [S] pointer to
  /// [fn] (which is expected to write a complete value into it, the sret
  /// pattern), then reads the resulting struct back out via [pointerToStruct].
  ///
  /// This is the inverse of [_RefUpdate]: instead of pushing a Dart object into
  /// native memory before a call, it lets the callee populate native memory and
  /// then pulls the result back into Dart.
  ///
  /// Only meaningful in the WASM implementation, where C functions returning
  /// structs by value use an explicit sret pointer argument. The native backend
  /// does not use this path, but the method lives here so the base API surface
  /// is complete regardless of implementation.
  X _Extract(
    P Function([X]) alloc,
    void Function(S ptr) fn,
  ) {
    final ptr = alloc();
    fn(pointerToSource(ptr));
    return pointerToStruct(ptr);
  }

  /// Allocates slot `'1'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTempBase].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate1] for the
  /// complementary write-then-read pattern.
  X Extract1(void Function(S ptr) fn) => _Extract(Ref1, fn);

  /// Allocates slot `'2'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTempBase].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate2] for the
  /// complementary write-then-read pattern.
  X Extract2(void Function(S ptr) fn) => _Extract(Ref2, fn);

  /// Allocates slot `'3'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTempBase].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate3] for the
  /// complementary write-then-read pattern.
  X Extract3(void Function(S ptr) fn) => _Extract(Ref3, fn);

  /// Allocates slot `'4'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTempBase].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate4] for the
  /// complementary write-then-read pattern.
  X Extract4(void Function(S ptr) fn) => _Extract(Ref4, fn);

  /// Allocates slot `'5'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTempBase].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate5] for the
  /// complementary write-then-read pattern.
  X Extract5(void Function(S ptr) fn) => _Extract(Ref5, fn);

  /// Allocates slot `'6'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTempBase].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate6] for the
  /// complementary write-then-read pattern.
  X Extract6(void Function(S ptr) fn) => _Extract(Ref6, fn);

  /// Allocates slot `'7'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTempBase].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate7] for the
  /// complementary write-then-read pattern.
  X Extract7(void Function(S ptr) fn) => _Extract(Ref7, fn);

  /// Allocates slot `'8'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTempBase].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate8] for the
  /// complementary write-then-read pattern.
  X Extract8(void Function(S ptr) fn) => _Extract(Ref8, fn);
}

/// Extends [RaylibTempAllocatorBase] with pointer-to-struct allocation,
/// where [PP] holds a pointer to [P] rather than the struct itself.
/// Used when a C function expects a `Struct**` argument.
mixin RaylibTempStructPointerAllocatorBase<
  TempType extends RaylibTempBase,            // RaylibTemp
  X extends RaylibStructBase<TempType, P, X>, // Dart mirror object
  PP,                                         // PointerPointer
  P,                                          // Pointer
  S                                           // "source" type (WASM: int, NATIVE: Pointer<C>)
> on RaylibTempAllocatorBase<
  TempType, PP, S
> {

  /// Converts an `D` of Dart struct wrapper into an allocated `P` pointer.
  P Function([X?, String?]) get valueFunc;

  /// Converts a `List<D>` of Dart struct wrappers into an allocated `P` array.
  P Function(List<X> array) get rawArrayFunc;

  /// Overwrites the [i]-th element of the array at [ptr] with [value].
  void Function(PP ptr, int i, P value) get indexSetterFunc;

  /// Allocates an unslotted pointer-of-pointers from a list of struct [arrays].
  ///
  /// The caller is responsible for freeing the returned pointer.
  PP RawArray(List<List<X>> arrays) {
    final p = Raw(arrays.length);
    for (int i = 0; i < arrays.length; i++) indexSetterFunc(p, i, rawArrayFunc(arrays[i]));
    return p;
  }

  /// Writes [array] into a tracked slot of sufficient capacity.
  PP Array(List<X> array, {String? key}) {
    key ??= slotKey(key);
    final p = At(key, array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(p, i, valueFunc(array[i], '${key}_$i'));
    return p;
  }

  /// Writes each sub-array in [arrays] into a tracked slot and returns the
  /// outer `PP`
  PP Fill(List<List<X>> arrays, {String? key}) {
    final p = At(slotKey(key), arrays.length);
    for (int i = 0; i < arrays.length; i++) indexSetterFunc(p, i, rawArrayFunc(arrays[i]));
    return p;
  }

  /// Fills a tracked slot of [count] pointers by calling `init(i)` for each index.
  PP FillRaw(int count, P Function(int) init, {String? key}) {
    final pp = At(slotKey(key), count);
    for (int i = 0; i < count; i++) indexSetterFunc(pp, i, init(i));
    return pp;
  }
}

/// Dispatches a [TypedDataList] to the correct typed allocator on [temp],
/// allowing callers to allocate any supported typed list without knowing
/// the concrete element type at the call site.
abstract class RaylibTempTypedDataListAllocator<
  TempType extends RaylibTempBase,
  ResultPointerType
> {
  final TempType temp;

  RaylibTempTypedDataListAllocator(this.temp);

  ResultPointerType Array(TypedDataList data, {String? key}) {
    if (data is Int8List) return temp.Int8$.Array(data, key: key);
    if (data is Uint8List) return temp.Uint8$.Array(data, key: key);
    if (data is Int16List) return temp.Int16$.Array(data, key: key);
    if (data is Uint16List) return temp.Uint16$.Array(data, key: key);
    if (data is Int32List) return temp.Int32$.Array(data, key: key);
    if (data is Uint32List) return temp.Uint32$.Array(data, key: key);
    if (data is Int64List) return temp.Int64$.Array(data, key: key);
    if (data is Uint64List) return temp.Uint64$.Array(data, key: key);
    if (data is Float32List) return temp.Float32$.Array(data, key: key);
    if (data is Float64List) return temp.Float64$.Array(data, key: key);
    throw UnimplementedError('Unknown typed list: ${data.runtimeType}');
  }
}

/// Extends [RaylibTempAllocatorBase] with string allocation, handling
/// UTF-8 encoding and null-termination into temporary slots.
/// [PP] is the char-pointer-pointer type, [P] the char-pointer type.
mixin RaylibTempStringAllocatorBase<
  TempType extends RaylibTempBase, PP, P, S
> on RaylibTempAllocatorBase<
  TempType, P, S
> {

  /// Number of anonymous (ring-buffer) string slots pre-reserved on construction.
  int get slotCount;

  int get ptrByteSize;

  PP Function(int count) get ptrAllocatorFunc;

  void Function(PP ptr) get freePPFunc;

  void Function(PP ptrptr, int i, P ptr) get indexSetterFunc;

  int stringAnonIndex = 0;
  List<P> stringSlots = [];
  List<int> stringCapacities = [];
  final Map<String, int> stringSlotsKeyed = {};
  final Map<String, (PP, int)> stringSlotsPtrsKeyed = {};
  
  /// Resets all slot bookkeeping structures to their initial state.
  ///
  /// Called during construction and at the end of [dispose].
  void reset() {
    // NOTE: needs to be growable
    stringSlots = .filled(slotCount, nullptrFactory(), growable: true);
    stringCapacities = .filled(slotCount, 0, growable: true);
    stringAnonIndex = 0;
  }

  PP AtPtr(String key, [int count = 1]) {
    final existing = stringSlotsPtrsKeyed[key];
    if (existing != null) {
      final (ptr, currentCount) = existing;
      if (count <= currentCount) {
        stringSlotsPtrsKeyed[key] = (ptr, count);
        return ptr;
      }
      freePPFunc(ptr);
    }
    final ptr = ptrAllocatorFunc(ptrByteSize * count);
    stringSlotsPtrsKeyed[key] = (ptr, count);
    return ptr;
  }

  /// Writes each string in [array] into keyed sub-slots and returns a tracked
  /// `PP` of length `array.length`.
  ///
  /// Sub-slot keys follow the pattern `'<key>_<i>'`. [key] defaults to
  /// `'struct'`.
  PP Array(List<String> array, {String? key}) {
    final arrayKey = slotKey(key);
    final pp = AtPtr(arrayKey, array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(pp, i, ValueAt('${arrayKey}_$i', array[i]));
    return pp;
  }

  /// Fills a tracked [PP] of [count] elements by calling
  /// [init](i) for each index.
  PP Fill(int count, P Function(int) init, {String? key}) {
    final pp = AtPtr(slotKey(key), count);
    for (int i = 0; i < count; i++) indexSetterFunc(pp, i, init(i));
    return pp;
  }

  /// Returns a `P` for [text] using the next anonymous ring-buffer slot.
  /// 
  /// Anonymous slots cycle modulo [slotCount], so older anonymous strings may be overwritten.
  /// 
  /// If [key] is provided, delegates to [ValueAt] instead.
  P Value(String text, [String? key]) {
    if (key != null) return ValueAt(key, text);
    final slot = stringAnonIndex;
    stringAnonIndex = (stringAnonIndex + 1) % slotCount;
    _ensureSlotExists(slot);
    return writeToSlot(slot, text);
  }

  /// Writes [text] into slot using `Value` and returns its pointer, or returns [nullptr]
  /// if [text] is `null`.
  ///
  /// Use this instead of [Value] when the C API uses a null pointer to signal "no value".
  P ValueOrNull([String? text, String? key])
    => text == null ? nullptrFactory() : Value(text, key);

  /// Returns the `P` for the keyed slot [key], optionally writing
  /// [text] into it.
  ///
  /// Allocates the slot on first use. If [text] is `null` the existing string
  /// is returned; asserts that the slot has been initialised at least once.
  P ValueAt(String key, [String? text, int? bufferSize]) {
    final slot = stringSlotsKeyed.putIfAbsent(
      key, () => stringSlots.length
    );

    _ensureSlotExists(slot);

    if (text != null) {
      return writeToSlot(slot, text, bufferSize);
    }

    assert(
      !isPointerNull(stringSlots[slot]),
      '[TEMP] String.ValueAt("$key") used before initialization'
    );

    return stringSlots[slot];
  }

  /// Ensures the slot list is large enough to hold index [slot], growing it
  /// with null-pointer sentinels if necessary.
  void _ensureSlotExists(int slot) {
    if (slot < stringSlots.length) return;

    final growBy = slot + 1 - stringSlots.length;

    stringSlots.addAll(List.filled(growBy, nullptrFactory()));
    stringCapacities.addAll(List.filled(growBy, 0));
  }

  int Length(String text, [int? bufferSize]);

  void reallocSlotIfRequired(int slot, int length) {
    if (isPointerNull(stringSlots[slot]) || stringCapacities[slot] < length) {
      if (!isPointerNull(stringSlots[slot])) freeFunc(pointerToSource(stringSlots[slot]));
      stringSlots[slot] = pointerFactory(allocatorFunc(length));
      stringCapacities[slot] = length;
    }
  }

  /// Writes [text] into slot [slot], reallocating if the current capacity is
  /// insufficient for the UTF-8 encoded length.
  ///
  /// Always null-terminates the written string.
  P writeToSlot(int slot, String text, [int? bufferSize]);

  @override
  void Free(String key) {
    if (!stringSlotsKeyed.containsKey(key)) {
      throw StateError('[FREE] Cannot free unallocated String slot $key');
    }

    int slot = stringSlotsKeyed[key]!;
    freeFunc(pointerToSource(stringSlots[slot]));
    stringSlotsKeyed.remove(key);
    stringSlots[slot] = nullptrFactory();
    stringCapacities[slot] = 0;
  }

  @override
  void dispose() {
    if (stringSlots.isNotEmpty) {
      final nonNulls = stringSlots.where((e) => !isPointerNull(e));
      temp.debugFreeInfo('Freeing preallocated $slotCount $name slots (used ${nonNulls.length})');
      nonNulls.map(pointerToSource).forEach(freeFunc);
    }
    if (stringSlotsKeyed.isNotEmpty) {
      temp.debugFreeInfo('Freeing user-defined ${stringSlotsKeyed.length} $name slots');
    }
    if (stringSlotsPtrsKeyed.isNotEmpty) {
      temp.debugFreeInfo('Freeing user-defined ${stringSlotsPtrsKeyed.length} $name Array slots');
      stringSlotsPtrsKeyed.values.map((v) => v.$1).forEach(freePPFunc);
    }
    reset();
  }

  /// Writes [o] into slot `'1'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '1')`. Use [RefOrNull1] if [o] may be `null`
  /// and the callee expects [nullptr] in that case.
  P Ref1([String? o, int? bufferSize]) => ValueAt('1', o, bufferSize);

  /// Writes [o] into slot `'2'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '2')`. Use [RefOrNull2] if [o] may be `null`
  /// and the callee expects [nullptr] in that case.
  P Ref2([String? o, int? bufferSize]) => ValueAt('2', o, bufferSize);

  /// Writes [o] into slot `'3'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '3')`. Use [RefOrNull3] if [o] may be `null`
  /// and the callee expects [nullptr] in that case.
  P Ref3([String? o, int? bufferSize]) => ValueAt('3', o, bufferSize);

  /// Writes [o] into slot `'4'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '4')`. Use [RefOrNull4] if [o] may be `null`
  /// and the callee expects [nullptr] in that case.
  P Ref4([String? o, int? bufferSize]) => ValueAt('4', o, bufferSize);

  /// Returns a `P` for the given [o] value, using `nullptr` when [o] is `null`.
  P _RefOrNull(String? o, P Function([String]) alloc) => o == null ? nullptrFactory() : alloc(o);

  /// Writes [o] into slot `'1'` and returns its pointer, or returns [nullptr]
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref1] when the C API uses a null pointer to signal "no value".
  P RefOrNull1(String? o) => _RefOrNull(o, Ref1);

  /// Writes [o] into slot `'2'` and returns its pointer, or returns [nullptr]
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref2] when the C API uses a null pointer to signal "no value".
  P RefOrNull2(String? o) => _RefOrNull(o, Ref2);

  /// Writes [o] into slot `'3'` and returns its pointer, or returns [nullptr]
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref3] when the C API uses a null pointer to signal "no value".
  P RefOrNull3(String? o) => _RefOrNull(o, Ref3);

  /// Writes [o] into slot `'4'` and returns its pointer, or returns [nullptr]
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref4] when the C API uses a null pointer to signal "no value".
  P RefOrNull4(String? o) => _RefOrNull(o, Ref4);
}

/// Per-instance allocation state for a [RaylibStructBase] mirror object,
/// tracking its current slot key, tag, disposal status, and stable identity
/// across repeated [RaylibTempStructAllocatorBase.PointerTo] calls.
class RaylibTempStructState {
  /// The slot tag used to disambiguate [RaylibTempBase] keys for this instance.
  ///
  /// Defaults to `'struct'`. Change via [RaylibStructBase.structSetTag].
  String tag = 'struct';
  
  /// The [RaylibTempBase] slot key used during the most recent [RaylibTempStructAllocatorBase.PointerTo] allocation.
  String? allocKey;
  
  /// Whether [RaylibStructBase.structMarkDisposed] has been called on this instance.
  bool isDisposed = false;
  
  /// Whether [RaylibTempStructAllocatorBase.PointerTo] has never been called for this instance.
  ///
  /// Used to full sync once to push pre-promotion Dart state to memory on the first
  /// [RaylibTempStructAllocatorBase.PointerTo] allocation.
  bool isFirstSync = true;

  /// A stable numeric ID assigned on first [RaylibTempStructAllocatorBase.PointerTo] call for pointer-owning structs.
  ///
  /// Incorporated into slot keys to prevent collisions between distinct instances
  /// of the same struct type sharing the same [tag].
  int? internalId;
  
  static int _internalIdCounter = 0;
  int get nextId => internalId ??= ++_internalIdCounter;
}

/// Root of the temporary allocator hierarchy for a given [RaylibBase] context.
///
/// Owns the set of typed allocators (e.g. [Int8$], [Float32$], struct allocators)
/// and governs the lifetime of all slots allocated.
/// 
/// All allocated slots are freed on [dispose].
abstract class RaylibTempBase<R extends RaylibBase> extends RaylibModule<R> {
  final RaylibTempBaseOptions options;

  RaylibTempBase(super.rl, {
    RaylibTempBaseOptions? options
  }) : options = options ?? .new();

  /// Whether sync-back is currently enabled.
  bool _enableSyncing = true;

  /// Enables or disables struct sync-back after C calls. See [RaylibModule.disableSync].
  void enableSyncing(bool sync) => _enableSyncing = sync;

  /// Whether sync-back is currently enabled.
  bool get doSync => _enableSyncing;

  /// Monotonically increasing ID.
  int _currentId = 0;

  /// Returns a monotonically increasing ID, used to generate unique slot keys.
  int nextId() => _currentId++;

  /// If logging of slot deallocation events is enabled.
  bool _debugFreeEnabled = false;

  /// Enables or disables logging of slot deallocation events.
  void debugFree(bool v) => _debugFreeEnabled = v;

  /// Logs [message] if free debugging is enabled.
  void debugFreeInfo(String message) { if (_debugFreeEnabled) logInfo(message); }

  /// If logging of struct sync-back events is enabled.
  bool _debugSyncEnabled = false;

  /// Enables or disables logging of struct sync-back events.
  void debugSync(bool v) => _debugSyncEnabled = v;

  /// Logs [message] if sync debugging is enabled.
  void debugSyncInfo(String message) { if (_debugSyncEnabled) logInfo(message); }

  @override
  @mustCallSuper
  void load() {
    if (options.stringCount > 0) {
      logInfo('[TEMP] Allocating ${options.stringCount} String slots');
    }
  }

  RaylibTempTypedDataListAllocator get TypedDataList$;

  RaylibTempStringAllocatorBase get String$;

  RaylibTempLiteralAllocatorBase get Bool$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Bool$;
  
  RaylibTempLiteralIntAllocatorBase get Int$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Int$;
  RaylibTempLiteralIntAllocatorBase get UnsignedInt$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$UnsignedInt$;
  RaylibTempLiteralIntAllocatorBase get Int8$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Int8$;
  RaylibTempLiteralIntAllocatorBase get Uint8$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Uint8$;
  RaylibTempLiteralIntAllocatorBase get Int16$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Int16$;
  RaylibTempLiteralIntAllocatorBase get Uint16$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Uint16$;
  RaylibTempLiteralIntAllocatorBase get Int32$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Int32$;
  RaylibTempLiteralIntAllocatorBase get Uint32$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Uint32$;
  RaylibTempLiteralIntAllocatorBase get Int64$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Int64$;
  RaylibTempLiteralIntAllocatorBase get Uint64$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Uint64$;
  RaylibTempLiteralFloatAllocatorBase get Float32$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Float32$;
  RaylibTempLiteralFloatAllocatorBase get Float64$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Float64$;
  RaylibTempLiteralIntAllocatorBase get Char$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Char$;
  RaylibTempLiteralIntAllocatorBase get UnsignedChar$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$UnsignedChar$;
  RaylibTempLiteralIntAllocatorBase get UnsignedShort$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$UnsignedShort$;
  RaylibTempLiteralIntAllocatorBase get Short$;
  RaylibTempLiteralPointerAllocatorBase get Ptr$Short$;
  
  RaylibTempStructAllocatorBase get AutomationEventList$;
  RaylibTempStructPointerAllocatorBase get Ptr$AutomationEventList$;
  RaylibTempStructAllocatorBase get AutomationEvent$;
  RaylibTempStructPointerAllocatorBase get Ptr$AutomationEvent$;
  RaylibTempStructAllocatorBase get AudioStream$;
  RaylibTempStructPointerAllocatorBase get Ptr$AudioStream$;
  RaylibTempStructAllocatorBase get BoneInfo$;
  RaylibTempStructPointerAllocatorBase get Ptr$BoneInfo$;
  RaylibTempStructAllocatorBase get BoundingBox$;
  RaylibTempStructPointerAllocatorBase get Ptr$BoundingBox$;
  RaylibTempStructAllocatorBase get Camera2D$;
  RaylibTempStructPointerAllocatorBase get Ptr$Camera2D$;
  RaylibTempStructAllocatorBase get Camera3D$;
  RaylibTempStructPointerAllocatorBase get Ptr$Camera3D$;
  RaylibTempStructAllocatorBase get Color$;
  RaylibTempStructPointerAllocatorBase get Ptr$Color$;
  RaylibTempStructAllocatorBase get FilePathList$;
  RaylibTempStructPointerAllocatorBase get Ptr$FilePathList$;
  RaylibTempStructAllocatorBase get Font$;
  RaylibTempStructPointerAllocatorBase get Ptr$Font$;
  RaylibTempStructAllocatorBase get GlyphInfo$;
  RaylibTempStructPointerAllocatorBase get Ptr$GlyphInfo$;
  RaylibTempStructAllocatorBase get Image$;
  RaylibTempStructPointerAllocatorBase get Ptr$Image$;
  RaylibTempStructAllocatorBase get Light$;
  RaylibTempStructPointerAllocatorBase get Ptr$Light$;
  RaylibTempStructAllocatorBase get Material$;
  RaylibTempStructPointerAllocatorBase get Ptr$Material$;
  RaylibTempStructAllocatorBase get MaterialMap$;
  RaylibTempStructPointerAllocatorBase get Ptr$MaterialMap$;
  RaylibTempStructAllocatorBase get Matrix$;
  RaylibTempStructPointerAllocatorBase get Ptr$Matrix$;
  RaylibTempStructAllocatorBase get Mesh$;
  RaylibTempStructPointerAllocatorBase get Ptr$Mesh$;
  RaylibTempStructAllocatorBase get Model$;
  RaylibTempStructPointerAllocatorBase get Ptr$Model$;
  RaylibTempStructAllocatorBase get ModelAnimation$;
  RaylibTempStructPointerAllocatorBase get Ptr$ModelAnimation$;
  RaylibTempStructAllocatorBase get Music$;
  RaylibTempStructPointerAllocatorBase get Ptr$Music$;
  RaylibTempStructAllocatorBase get NPatchInfo$;
  RaylibTempStructPointerAllocatorBase get Ptr$NPatchInfo$;
  RaylibTempStructAllocatorBase get Quaternion$;
  RaylibTempStructPointerAllocatorBase get Ptr$Quaternion$;
  RaylibTempStructAllocatorBase get Rectangle$;
  RaylibTempStructPointerAllocatorBase get Ptr$Rectangle$;
  RaylibTempStructAllocatorBase get RlDrawCall$;
  RaylibTempStructPointerAllocatorBase get Ptr$RlDrawCall$;
  RaylibTempStructAllocatorBase get RlRenderBatch$;
  RaylibTempStructPointerAllocatorBase get Ptr$RlRenderBatch$;
  RaylibTempStructAllocatorBase get RlVertexBuffer$;
  RaylibTempStructPointerAllocatorBase get Ptr$RlVertexBuffer$;
  RaylibTempStructAllocatorBase get Ray$;
  RaylibTempStructPointerAllocatorBase get Ptr$Ray$;
  RaylibTempStructAllocatorBase get RayCollision$;
  RaylibTempStructPointerAllocatorBase get Ptr$RayCollision$;
  RaylibTempStructAllocatorBase get RenderTexture$;
  RaylibTempStructPointerAllocatorBase get Ptr$RenderTexture$;
  RaylibTempStructAllocatorBase get Shader$;
  RaylibTempStructPointerAllocatorBase get Ptr$Shader$;
  RaylibTempStructAllocatorBase get Sound$;
  RaylibTempStructPointerAllocatorBase get Ptr$Sound$;
  RaylibTempStructAllocatorBase get Texture$;
  RaylibTempStructPointerAllocatorBase get Ptr$Texture$;
  RaylibTempStructAllocatorBase get Transform$;
  RaylibTempStructPointerAllocatorBase get Ptr$Transform$;
  RaylibTempStructAllocatorBase get Vector2$;
  RaylibTempStructPointerAllocatorBase get Ptr$Vector2$;
  RaylibTempStructAllocatorBase get Vector3$;
  RaylibTempStructPointerAllocatorBase get Ptr$Vector3$;
  RaylibTempStructAllocatorBase get Vector4$;
  RaylibTempStructPointerAllocatorBase get Ptr$Vector4$;
  RaylibTempStructAllocatorBase get VrDeviceInfo$;
  RaylibTempStructPointerAllocatorBase get Ptr$VrDeviceInfo$;
  RaylibTempStructAllocatorBase get VrStereoConfig$;
  RaylibTempStructPointerAllocatorBase get Ptr$VrStereoConfig$;
  RaylibTempStructAllocatorBase get Wave$;
  RaylibTempStructPointerAllocatorBase get Ptr$Wave$;

  /// All built-in allocators keyed by name, iterated during [dispose].
  Map<String, RaylibTempAllocatorBase> get allocators => {
    String$.name: String$,

    Bool$.name: Bool$,
    Ptr$Bool$.name: Ptr$Bool$,
    
    Int$.name: Int$,
    Ptr$Int$.name: Ptr$Int$,
    UnsignedInt$.name: UnsignedInt$,
    Ptr$UnsignedInt$.name: Ptr$UnsignedInt$,
    Int8$.name: Int8$,
    Ptr$Int8$.name: Ptr$Int8$,
    Uint8$.name: Uint8$,
    Ptr$Uint8$.name: Ptr$Uint8$,
    Int16$.name: Int16$,
    Ptr$Int16$.name: Ptr$Int16$,
    Uint16$.name: Uint16$,
    Ptr$Uint16$.name: Ptr$Uint16$,
    Int32$.name: Int32$,
    Ptr$Int32$.name: Ptr$Int32$,
    Uint32$.name: Uint32$,
    Ptr$Uint32$.name: Ptr$Uint32$,
    Int64$.name: Int64$,
    Ptr$Int64$.name: Ptr$Int64$,
    Uint64$.name: Uint64$,
    Ptr$Uint64$.name: Ptr$Uint64$,
    Float32$.name: Float32$,
    Ptr$Float32$.name: Ptr$Float32$,
    Float64$.name: Float64$,
    Ptr$Float64$.name: Ptr$Float64$,
    Char$.name: Char$,
    Ptr$Char$.name: Ptr$Char$,
    UnsignedChar$.name: UnsignedChar$,
    Ptr$UnsignedChar$.name: Ptr$UnsignedChar$,
    UnsignedShort$.name: UnsignedShort$,
    Ptr$UnsignedShort$.name: Ptr$UnsignedShort$,
    Short$.name: Short$,
    Ptr$Short$.name: Ptr$Short$,
    
    AutomationEventList$.name: AutomationEventList$,
    Ptr$AutomationEventList$.name: Ptr$AutomationEventList$,
    AutomationEvent$.name: AutomationEvent$,
    Ptr$AutomationEvent$.name: Ptr$AutomationEvent$,
    AudioStream$.name: AudioStream$,
    Ptr$AudioStream$.name: Ptr$AudioStream$,
    BoneInfo$.name: BoneInfo$,
    Ptr$BoneInfo$.name: Ptr$BoneInfo$,
    BoundingBox$.name: BoundingBox$,
    Ptr$BoundingBox$.name: Ptr$BoundingBox$,
    Camera2D$.name: Camera2D$,
    Ptr$Camera2D$.name: Ptr$Camera2D$,
    Camera3D$.name: Camera3D$,
    Ptr$Camera3D$.name: Ptr$Camera3D$,
    Color$.name: Color$,
    Ptr$Color$.name: Ptr$Color$,
    FilePathList$.name: FilePathList$,
    Ptr$FilePathList$.name: Ptr$FilePathList$,
    Font$.name: Font$,
    Ptr$Font$.name: Ptr$Font$,
    GlyphInfo$.name: GlyphInfo$,
    Ptr$GlyphInfo$.name: Ptr$GlyphInfo$,
    Image$.name: Image$,
    Ptr$Image$.name: Ptr$Image$,
    Light$.name: Light$,
    Ptr$Light$.name: Ptr$Light$,
    Material$.name: Material$,
    Ptr$Material$.name: Ptr$Material$,
    MaterialMap$.name: MaterialMap$,
    Ptr$MaterialMap$.name: Ptr$MaterialMap$,
    Matrix$.name: Matrix$,
    Ptr$Matrix$.name: Ptr$Matrix$,
    Mesh$.name: Mesh$,
    Ptr$Mesh$.name: Ptr$Mesh$,
    Model$.name: Model$,
    Ptr$Model$.name: Ptr$Model$,
    ModelAnimation$.name: ModelAnimation$,
    Ptr$ModelAnimation$.name: Ptr$ModelAnimation$,
    Music$.name: Music$,
    Ptr$Music$.name: Ptr$Music$,
    NPatchInfo$.name: NPatchInfo$,
    Ptr$NPatchInfo$.name: Ptr$NPatchInfo$,
    Quaternion$.name: Quaternion$,
    Ptr$Quaternion$.name: Ptr$Quaternion$,
    Rectangle$.name: Rectangle$,
    Ptr$Rectangle$.name: Ptr$Rectangle$,
    RlDrawCall$.name: RlDrawCall$,
    Ptr$RlDrawCall$.name: Ptr$RlDrawCall$,
    RlRenderBatch$.name: RlRenderBatch$,
    Ptr$RlRenderBatch$.name: Ptr$RlRenderBatch$,
    RlVertexBuffer$.name: RlVertexBuffer$,
    Ptr$RlVertexBuffer$.name: Ptr$RlVertexBuffer$,
    Ray$.name: Ray$,
    Ptr$Ray$.name: Ptr$Ray$,
    RayCollision$.name: RayCollision$,
    Ptr$RayCollision$.name: Ptr$RayCollision$,
    RenderTexture$.name: RenderTexture$,
    Ptr$RenderTexture$.name: Ptr$RenderTexture$,
    Shader$.name: Shader$,
    Ptr$Shader$.name: Ptr$Shader$,
    Sound$.name: Sound$,
    Ptr$Sound$.name: Ptr$Sound$,
    Texture$.name: Texture$,
    Ptr$Texture$.name: Ptr$Texture$,
    Transform$.name: Transform$,
    Ptr$Transform$.name: Ptr$Transform$,
    Vector2$.name: Vector2$,
    Ptr$Vector2$.name: Ptr$Vector2$,
    Vector3$.name: Vector3$,
    Ptr$Vector3$.name: Ptr$Vector3$,
    Vector4$.name: Vector4$,
    Ptr$Vector4$.name: Ptr$Vector4$,
    VrDeviceInfo$.name: VrDeviceInfo$,
    Ptr$VrDeviceInfo$.name: Ptr$VrDeviceInfo$,
    VrStereoConfig$.name: VrStereoConfig$,
    Ptr$VrStereoConfig$.name: Ptr$VrStereoConfig$,
    Wave$.name: Wave$,
    Ptr$Wave$.name: Ptr$Wave$,
  };

  /// User-registered allocators, keyed by name, freed alongside built-ins on [dispose].
  final Map<String, RaylibTempAllocatorBase> customAllocators = {};
  
  /// Registers a custom allocator under [key]. Throws [StateError] if [key] is already taken.
  void registerAllocator(String key, RaylibTempAllocatorBase alloc) {
    if (customAllocators.containsKey(key)) {
      final sig = customAllocators[key]!.signature();
      throw StateError("Allocator '$key' ('$sig') already exists!");
    }

    customAllocators[key] = alloc;
  }

  /// Returns the custom allocator registered under [key], or throws [StateError] if absent.
  RaylibTempAllocatorBase getCustomAllocatorOrThrow(String key) {
    final alloc = customAllocators[key];
    if (alloc == null) throw StateError("No custom allocator registered for '$key'!");
    return alloc;
  }

  /// Returns the custom allocator registered under [key], cast to [T].
  T alloc<T extends RaylibTempAllocatorBase>(String key) => customAllocators[key] as T;

  /// Frees all built-in and custom allocators, then delegates to [RaylibModule.dispose].
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();

    debugFreeInfo('Freeing ${allocators.length} built-in allocators');
    allocators.values.forEach((a) => a.dispose());

    if (customAllocators.isNotEmpty) {
      debugFreeInfo('Freeing ${customAllocators.length} custom allocators');
      customAllocators.values.forEach((a) => a.dispose());
    }
  }
}