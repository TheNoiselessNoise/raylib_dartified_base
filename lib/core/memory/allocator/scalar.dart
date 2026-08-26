part of '../../raylib_dartified_base.dart';

/// Extends [RaylibTempAllocator] with the ability to write individual
/// Dart values directly into allocated memory.
final class RaylibTempScalarAllocator<X, R extends RType> extends RaylibTempAllocator<R> {
  /// Writes [value] into the [i]-th element of the array at [ptr].
  final void Function(MemoryPointer<R> ptr, int i, X value) indexSetterFunc;
  
  /// Writes a single Dart value [value] into the memory pointed to by [ptr].
  final void Function(MemoryPointer<R> ptr, X value) scalarSetterFunc;

  RaylibTempScalarAllocator(super.temp, {
    required super.byteSize,
    required this.indexSetterFunc,
    required this.scalarSetterFunc,
  });

  /// Allocates an unslotted array and populates it from [array].
  ///
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<R> RawArray(List<X> array) {
    final p = Raw(array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(p, i, array[i]);
    return p;
  }

  /// Returns the pointer for the slot identified by [key] (default: `'default'`),
  /// writing [value] into it when provided.
  ///
  /// Allocates the slot on first use.
  MemoryPointer<R> Value([X? value, String? key]) {
    final p = At(slotKey(key));
    if (value != null) scalarSetterFunc(p, value);
    return p;
  }

  /// Returns the pointer for the slot identified by a unique [key] suffix
  /// writing [value] into it when provided.
  ///
  /// Behaves like [Value], but prepends a monotonic ID from [RaylibTemp.nextId] to
  /// [key], ensuring the slot is never accidentally shared with an unrelated
  /// call that happens to use the same base key.
  MemoryPointer<R> ValueUnique(X? value, {String key = '__value_unique__'}) {
    final p = At(uniqueSlotKey(key));
    if (value != null) scalarSetterFunc(p, value);
    return p;
  }

  /// Writes [array] into a slot of sufficient capacity and returns the pointer.
  ///
  /// [key] defaults to `'default'`. The slot is grown automatically if the
  /// current capacity is smaller than `array.length`.
  MemoryPointer<R> Array(List<X> array, {String? key}) {
    final p = At(slotKey(key), array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(p, i, array[i]);
    return p;
  }

  /// Allocates (or reuses) a slot of [count] elements, populating each index
  /// [i] with the value returned by `init(i)`.
  MemoryPointer<R> Fill(int count, X Function(int) init, {String? key}) {
    final p = At(slotKey(key), count);
    for (int i = 0; i < count; i++) indexSetterFunc(p, i, init(i));
    return p;
  }

  /// Writes [o] into slot `'1'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '1')`. Use [RefOrNull1] if [o] may be `null`
  /// and the callee expects `nullptr` in that case.
  MemoryPointer<R> Ref1([X? o]) => Value(o, '1');

  /// Writes [o] into slot `'2'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '2')`. Use [RefOrNull2] if [o] may be `null`
  /// and the callee expects `nullptr` in that case.
  MemoryPointer<R> Ref2([X? o]) => Value(o, '2');

  /// Writes [o] into slot `'3'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '3')`. Use [RefOrNull3] if [o] may be `null`
  /// and the callee expects `nullptr` in that case.
  MemoryPointer<R> Ref3([X? o]) => Value(o, '3');

  /// Writes [o] into slot `'4'` and returns its pointer.
  ///
  /// Shorthand for `Value(o, '4')`. Use [RefOrNull4] if [o] may be `null`
  /// and the callee expects `nullptr` in that case.
  MemoryPointer<R> Ref4([X? o]) => Value(o, '4');

  /// Writes [o] into slot `'1'` and returns its pointer, or returns `nullptr`
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref1] when the C API uses a null pointer to signal "no value".
  MemoryPointer<R> RefOrNull1(X? o) => o == null ? MemoryPointer.nullptr.cast<R>() : Ref1(o);

  /// Writes [o] into slot `'2'` and returns its pointer, or returns `nullptr`
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref2] when the C API uses a null pointer to signal "no value".
  MemoryPointer<R> RefOrNull2(X? o) => o == null ? MemoryPointer.nullptr.cast<R>() : Ref2(o);

  /// Writes [o] into slot `'3'` and returns its pointer, or returns `nullptr`
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref3] when the C API uses a null pointer to signal "no value".
  MemoryPointer<R> RefOrNull3(X? o) => o == null ? MemoryPointer.nullptr.cast<R>() : Ref3(o);

  /// Writes [o] into slot `'4'` and returns its pointer, or returns `nullptr`
  /// if [o] is `null`.
  ///
  /// Use this instead of [Ref4] when the C API uses a null pointer to signal "no value".
  MemoryPointer<R> RefOrNull4(X? o) => o == null ? MemoryPointer.nullptr.cast<R>() : Ref4(o);

  // -----

  /// Fixed scratch slot holding a zero-initialized value.
  ///
  /// This is effectively the native-memory equivalent of a Dart-layer
  /// `.zero()` constructor (e.g. `Vector2D.zero()`), a cheap, shared,
  /// always-zero buffer for call sites that just need to pass a zero value
  /// without allocating.
  ///
  /// **Read-only by convention.** Because this slot is shared (via [At])
  /// across every call site that touches [$zeroPtr], writing through it
  /// permanently corrupts the "zero" invariant for everyone else using it,
  /// there is no reset. Never write through this pointer; only read from it
  /// or pass it where the callee treats it as `const`. If you need a
  /// mutable zero-initialized buffer, use [$newPtr] (or write zero into
  /// [$1Ptr]..[$4Ptr] yourself) instead.
  MemoryPointer<R> get $zeroPtr => At('__reusable__zero');

  /// Reusable single-element scratch slot, mutable (unlike [$zeroPtr]).
  MemoryPointer<R> get $1Ptr => At('__reusable__1');
  
  /// Reusable single-element scratch slot, mutable (unlike [$zeroPtr]).
  ///
  /// Use when a call needs a second independent scratch pointer alongside
  /// [$1Ptr] (e.g. writing two out-parameters in the same FFI call).
  MemoryPointer<R> get $2Ptr => At('__reusable__2');
  
  /// Reusable single-element scratch slot, mutable (unlike [$zeroPtr]).
  ///
  /// Use when a call needs a third independent scratch pointer alongside
  /// [$2Ptr] (e.g. writing two out-parameters in the same FFI call).
  MemoryPointer<R> get $3Ptr => At('__reusable__3');
  
  /// Reusable single-element scratch slot, mutable (unlike [$zeroPtr]).
  ///
  /// Use when a call needs a fourth independent scratch pointer alongside
  /// [$3Ptr] (e.g. writing two out-parameters in the same FFI call).
  MemoryPointer<R> get $4Ptr => At('__reusable__4');
  
  /// Fresh, independently-owned scratch pointer, unlike [$zeroPtr]..[$4Ptr].
  ///
  /// Each access gets its own slot via [RaylibTempAllocator.AtUnique], keyed with a monotonic id,
  /// so it is safe even when the same call site may be active multiple times
  /// at once (recursion, re-entrant calls).
  MemoryPointer<R> get $newPtr => AtUnique(key: '__reusable__newptr');
}

/// Extends [RaylibTempScalarAllocator] with typed list interop,
/// the ability to view allocated memory as a Dart `List<X>` and construct
/// a typed list from an iterable.
final class RaylibTempScalarTypedListAllocator<X, L extends TypedDataList, R extends RType> extends RaylibTempScalarAllocator<X, R> {
  /// Constructs a typed list [L] from an iterable of [X] values.
  final L Function(Iterable<X> list) fromList;

  /// Wraps [ptr] as a Dart [TypedDataList] of [length] elements.
  ///
  /// The list is a **view** into native memory, so mutations are reflected
  /// immediately in the native buffer.
  final L Function(MemoryPointer ptr, int length) asView;

  /// Wraps a region of [buffer] as a Dart [L] list without copying.
  ///
  /// Acts as the inverse of [asView]: where [asView] views native
  /// memory as a Dart typed list, [fromBuffer] views an existing Dart
  /// [ByteBuffer] as an [L], allowing [FromTypedData] to bulk-copy foreign
  /// typed data into a slot without going through raw bytes.
  ///
  /// [offsetInBytes] and [length] are forwarded directly to the underlying
  /// `buffer.asXxxList()` call, so the usual alignment and bounds rules apply.
  final L Function(ByteBuffer buffer, int offsetInBytes, int length) fromBuffer;

  RaylibTempScalarTypedListAllocator(super.temp, {
    required super.byteSize,
    required super.indexSetterFunc,
    required super.scalarSetterFunc,
    required this.fromList,
    required this.asView,
    required this.fromBuffer,
  });

  late final RaylibTempScalarPointerAllocator<X, R> $ = .new(temp,
    byteSize: byteSize,
    rawArrayFunc: RawArray,
    indexSetterFunc: (ptrptr, i, ptr) => ptrptr.writePtr(ptr, i),
  );

  /// Returns a Dart `List<X>` with [length] elements copied from [ptr].
  List<X> asDartList(MemoryPointer ptr, int length)
    => asView(ptr, length).toList().cast();

  /// Returns a [L] with [length] elements copied from [ptr].
  L asTypedList(MemoryPointer ptr, int length)
    => fromList(asDartList(ptr, length));

  /// Allocates (or reuses) a slot of [length] elements and returns its pointer,
  /// without writing any data into it.
  ///
  /// Unlike [Array] or [Fill], the contents are left uninitialized, useful when
  /// the buffer will be populated by a C call rather than from Dart.
  /// [key] defaults to `'Sized<C>'`.
  MemoryPointer<R> Sized(int length, {String? key}) => At(key ?? 'Sized$X', length);

  /// Copies [length] elements from [src] into a slot and returns the pointer.
  ///
  /// Uses [asView] for the bulk copy, which avoids an element-by-element
  /// loop. [key] defaults to `'default'`.
  MemoryPointer<R> Copy(MemoryPointer<RVoid> src, int length, {String? key}) {
    final p = At(slotKey(key), length);
    asView(p, length).setAll(0, asView(src, length));
    return p;
  }

  /// Copies [length] elements from a typed list [list] into a slot.
  MemoryPointer<R> FromTypedList(L list, {String? key}) {
    final p = Sized(list.length, key: key);
    asView(p, list.length).setAll(0, list);
    return p;
  }

  /// Copies [data] into a slot by reinterpreting its bytes as elements of type [X].
  ///
  /// Unlike [FromTypedList], accepts any [TypedData] regardless of its element
  /// type, converting via the underlying byte buffer. [data] must be a whole
  /// number of [byteSize]-sized elements.
  MemoryPointer<R> FromTypedData(TypedData data, {String? key}) {
    final byteCount = data.lengthInBytes;
    assert(byteCount % byteSize == 0);
    final length = byteCount ~/ byteSize;
    final p = Sized(length, key: key);
    final src = fromBuffer(data.buffer, data.offsetInBytes, length);
    asView(p, length).setAll(0, src);
    return p;
  }
}

/// Specializes [RaylibTempScalarTypedListAllocator] for integer element types,
/// adding integer-specific allocation helpers on top of the typed list interop.
final class RaylibTempScalarIntAllocator<L extends TypedDataList, R extends RType> extends RaylibTempScalarTypedListAllocator<num, L, R> {
  RaylibTempScalarIntAllocator(super.temp, {
    required super.byteSize,
    required super.indexSetterFunc,
    required super.scalarSetterFunc,
    required super.fromList,
    required super.asView,
    required super.fromBuffer,
  });

  /// Serialises [length] words starting at [ptr] to a flat big-endian byte list.
  ///
  /// Each word is split into `byteSize` bytes, most-significant byte first.
  L ToBEBytes(MemoryPointer ptr, int length) =>
    fromList(asDartList(ptr, length).expand((word) =>
      .generate(byteSize, (i) => (word.toInt() >> ((byteSize - 1 - i) * 8)) & 0xFF)
    ));

  /// Serialises [length] words starting at [ptr] to a flat little-endian byte list.
  ///
  /// Each word is split into `byteSize` bytes, least-significant byte first.
  L ToLEBytes(MemoryPointer ptr, int length) =>
    fromList(asDartList(ptr, length).expand((word) =>
      .generate(byteSize, (i) => (word.toInt() >> (i * 8)) & 0xFF)
    ));
}

/// Specializes [RaylibTempScalarTypedListAllocator] for floating-point element types.
final class RaylibTempScalarFloatAllocator<L extends TypedDataList, R extends RType> extends RaylibTempScalarTypedListAllocator<num, L, R> {
  RaylibTempScalarFloatAllocator(super.temp, {
    required super.byteSize,
    required super.indexSetterFunc,
    required super.scalarSetterFunc,
    required super.fromList,
    required super.asView,
    required super.fromBuffer,
  });
}

/// Extends [RaylibTempAllocator] with the ability to allocate pointer-to-pointer
/// slots, where [X] is the pointee's Dart-side value.
final class RaylibTempScalarPointerAllocator<X, R extends RType> extends RaylibTempAllocator<R> {
  /// Converts a flat `List<X>` into an allocated `P` array.
  ///
  /// The caller is responsible for the lifetime of the inner pointers.
  final MemoryPointer<R> Function(List<X> array) rawArrayFunc;

  /// Overwrites the [i]-th element of the array at [ptr] with [value].
  final void Function(MemoryPointer<RPointer> ptrptr, int i, MemoryPointer<R> ptr) indexSetterFunc;

  RaylibTempScalarPointerAllocator(super.temp, {
    required super.byteSize,
    required this.rawArrayFunc,
    required this.indexSetterFunc,
  });

  /// Allocates an unslotted pointer-of-pointers from a list of value arrays.
  ///
  /// Each `arrays[i]` is converted via [rawArrayFunc].
  ///
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<RPointer> RawArray(List<List<X>> arrays) {
    final pp = Raw(arrays.length).cast<RPointer>();
    for (int i = 0; i < arrays.length; i++) indexSetterFunc(pp, i, rawArrayFunc(arrays[i]));
    return pp;
  }

  /// Writes each sub-array in [arrays] into a tracked slot via [rawArrayFunc]
  /// and returns the outer `PP`
  MemoryPointer<RPointer> Fill(List<List<X>> arrays, {String? key}) {
    final pp = At(slotKey(key), arrays.length).cast<RPointer>();
    for (int i = 0; i < arrays.length; i++) indexSetterFunc(pp, i, rawArrayFunc(arrays[i]));
    return pp;
  }

  /// Fills an unslotted pointer of [count] pointers by calling `init(i)` for each
  /// index and storing the result.
  /// 
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<RPointer> FillRaw(int count, MemoryPointer<R> Function(int) init) {
    final pp = Raw(count).cast<RPointer>();
    for (int i = 0; i < count; i++) indexSetterFunc(pp, i, init(i));
    return pp;
  }
}