part of '../../raylib_dartified_base.dart';

/// Extends [RaylibTempAllocator] with struct allocation, providing
/// [PointerTo], [_Ref], [_RefOrNull], [_RefUpdate], and [_Extract] helpers for
/// Dart mirror objects ([X]).
final class RaylibTempStructAllocator<
  X extends RaylibStruct<X>, // Dart mirror object
  F extends StructFields     // Fields
> extends RaylibTempAllocator<RStruct> {

  final StructLayout<F> layout;

  final StructFactory<X> factory;

  final StructPointerFactory<X> pointerFactory;

  RaylibTempStructAllocator(super.temp, {
    required this.layout,
    required this.factory,
    required this.pointerFactory,
  }) : super(
    byteSize: layout.byteSize,
  );

  @override
  String get name => '$X';

  StructPointer<X> RawStruct([int count = 1])
    => pointerFactory(Raw(count));

  StructPointer<X> AtStruct(String key, [int count = 1])
    => pointerFactory(At(key, count));

  StructPointer<X> AtUniqueStruct({String key = '_unique_', int count = 1})
    => pointerFactory(AtUnique(key: key, count: count));

  /// Pointer allocator for this struct [X].
  late final RaylibTempStructPointerAllocator<X> $ = .new(temp,
    byteSize: byteSize,
    valueFunc: Value,
    rawArrayFunc: RawArray,
    indexSetterFunc: (ptr, i, value) => ptr.writePtr(value, i),
  );

  /// Builds a [RaylibTemp] slot key from [value]'s `structName`, `tag`, and an optional [inner] suffix.
  @nonVirtual
  String getBaseKey(X value, [String? inner]) => '${value.structName}_${value.$state.tag}_$inner';

  /// Like [getBaseKey] but prefixed with [value]'s `internalId`, used for
  /// pointer-owning structs to prevent cross-instance key collisions.
  @nonVirtual
  String getBaseKeyUnique(X value, [String? inner]) => '${value.$state.nextId}_${getBaseKey(value, inner)}';

  /// Allocates or syncs [value] to a tracked slot at [key].
  StructPointer<X> PointerTo(X value, [String? key]) {
    final requiresOp = value.structRequiresOp;
    final op = value.op;

    if (op != null && requiresOp) {
      String allocKey = value.$state.allocKey ??= '<CHILD-POINTER>';

      if (value.$state.isFirstSync) {
        if (value.$state.isDisposed) return op;
        if (!temp.doSync) return op;

        // full sync once to push pre-promotion Dart state to memory
        temp.debugSyncInfo('[SYNC] ${value.structName} first sync into $allocKey');
        value.structWriteInto(op.ptr);
        value.$state.isFirstSync = false;
      } else {
        // already live, setters handle write-through, skip full sync
        temp.debugSyncInfo('[SYNC] ${value.structName} skipping sync (live) $allocKey');
      }
      
      return op;
    }

    if (value.$state.isDisposed) {
      throw StateError('You are trying to allocate disposed $value object!');
    }

    String baseKey = requiresOp
      ? getBaseKeyUnique(value, slotKey(key))
      : getBaseKey(value, slotKey(key));

    if (requiresOp) temp.debugSyncInfo('[SYNC] ${value.structName} allocate into $baseKey');
    
    value.$state.allocKey = baseKey;
    final p = pointerFactory(At(baseKey));
    value.structAllocateInto(temp, p.ptr, baseKey);
    value.structWriteInto(p.ptr);
    if (requiresOp) value.op = p;
    return p;
  }

  /// Allocates an unslotted array and populates it from [array].
  ///
  /// The caller is responsible for freeing the returned pointer.
  StructPointer<X> RawArray(List<X> array) {
    final p = Raw(array.length);
    for (int i = 0; i < array.length; i++) array[i].structWriteInto(p.readPtr(i));
    return pointerFactory(p);
  }

  /// Copies [length] structs from [src] into a tracked slot.
  StructPointer<X> Copy(MemoryPointer<RStruct> src, int length, {String? key}) {
    final p = At(slotKey(key), length);
    p.copyBytesFrom(src, length * byteSize);
    return pointerFactory(p);
  }

  /// Returns the pointer for slot [key], optionally writing [value] into it.
  ///
  /// Allocates the slot on first use.
  StructPointer<X> Value([X? value, String? key]) {
    final p = At(slotKey(key));
    if (value != null) value.structWriteInto(p);
    return pointerFactory(p);
  }

  /// Allocates an unslotted pointer, optionally writing [value] into it.
  ///
  /// The caller is responsible for freeing the returned pointer.
  StructPointer<X> RawValue([X? value]) {
    final p = Raw();
    if (value != null) value.structWriteInto(p);
    return pointerFactory(p);
  }

  /// Returns the pointer for the slot identified by a unique [key] suffix
  /// optionally writing [value] into it.
  ///
  /// Behaves like [Value], but prepends a monotonic ID from [RaylibTemp.nextId] to
  /// [key], ensuring the slot is never accidentally shared with an unrelated
  /// call that happens to use the same base key.
  StructPointer<X> ValueUnique(X? value, {String key = '__value_unique__'}) {
    final p = At(uniqueSlotKey(key));
    if (value != null) value.structWriteInto(p);
    return pointerFactory(p);
  }

  /// Writes [array] into a tracked slot of sufficient capacity.
  StructPointer<X> Array(List<X> array, {String? key}) {
    final p = At(slotKey(key), array.length);
    for (int i = 0; i < array.length; i++) array[i].structWriteInto(p.readPtr(i));
    return pointerFactory(p);
  }

  /// Returns a [StructPointer] for the given [X] value, using the existing allocation at [key]
  /// when [x] is `null`, or allocating [x] into [key] via [PointerTo].
  ///
  /// Unlike [_RefOrNull], a `null` [x] does not produce a nullptr, it reuses
  /// the slot's current allocation via [At]. Use [_RefOrNull] when a `null` input
  /// should produce a `nullptr` instead.
  StructPointer<X> _Ref(X? x, String key) => x == null
    ? pointerFactory(At(key))
    : PointerTo(x, key);

  /// Allocates [o] into slot `'1'`, or reuses the existing slot `'1'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate1] if the callee may write back into the pointer.
  StructPointer<X> Ref1([X? o]) => _Ref(o, '1');

  /// Allocates [o] into slot `'2'`, or reuses the existing slot `'2'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate2] if the callee may write back into the pointer.
  StructPointer<X> Ref2([X? o]) => _Ref(o, '2');

  /// Allocates [o] into slot `'3'`, or reuses the existing slot `'3'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate3] if the callee may write back into the pointer.
  StructPointer<X> Ref3([X? o]) => _Ref(o, '3');

  /// Allocates [o] into slot `'4'`, or reuses the existing slot `'4'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate4] if the callee may write back into the pointer.
  StructPointer<X> Ref4([X? o]) => _Ref(o, '4');

  /// Allocates [o] into slot `'5'`, or reuses the existing slot `'5'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate5] if the callee may write back into the pointer.
  StructPointer<X> Ref5([X? o]) => _Ref(o, '5');

  /// Allocates [o] into slot `'6'`, or reuses the existing slot `'6'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate6] if the callee may write back into the pointer.
  StructPointer<X> Ref6([X? o]) => _Ref(o, '6');

  /// Allocates [o] into slot `'7'`, or reuses the existing slot `'7'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate7] if the callee may write back into the pointer.
  StructPointer<X> Ref7([X? o]) => _Ref(o, '7');

  /// Allocates [o] into slot `'8'`, or reuses the existing slot `'8'` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate8] if the callee may write back into the pointer.
  StructPointer<X> Ref8([X? o]) => _Ref(o, '8');

  /// Returns a [StructPointer] for the given [X] value, using `nullptr` when [x] is `null`.
  ///
  /// This is the foundation for the [RefOrNull1]–[RefOrNull8] helpers.
  StructPointer<X> _RefOrNull(X? x, String key) => x == null
    ? pointerFactory(MemoryPointer.nullptr)
    : PointerTo(x, key);

  /// Allocates [o] into slot `'1'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate1] if the callee may write back into the pointer.
  StructPointer<X> RefOrNull1([X? o]) => _RefOrNull(o, '1');

  /// Allocates [o] into slot `'2'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate2] if the callee may write back into the pointer.
  StructPointer<X> RefOrNull2([X? o]) => _RefOrNull(o, '2');

  /// Allocates [o] into slot `'3'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate3] if the callee may write back into the pointer.
  StructPointer<X> RefOrNull3([X? o]) => _RefOrNull(o, '3');

  /// Allocates [o] into slot `'4'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate4] if the callee may write back into the pointer.
  StructPointer<X> RefOrNull4([X? o]) => _RefOrNull(o, '4');

  /// Allocates [o] into slot `'5'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate5] if the callee may write back into the pointer.
  StructPointer<X> RefOrNull5([X? o]) => _RefOrNull(o, '5');

  /// Allocates [o] into slot `'6'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate6] if the callee may write back into the pointer.
  StructPointer<X> RefOrNull6([X? o]) => _RefOrNull(o, '6');

  /// Allocates [o] into slot `'7'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate7] if the callee may write back into the pointer.
  StructPointer<X> RefOrNull7([X? o]) => _RefOrNull(o, '7');

  /// Allocates [o] into slot `'8'`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  /// Use [RefUpdate8] if the callee may write back into the pointer.
  StructPointer<X> RefOrNull8([X? o]) => _RefOrNull(o, '8');

  /// Allocates [o] into a numbered slot, invokes [fn] with the resulting
  /// pointer, then syncs any mutations back from native memory into [o].
  ///
  /// If [o] is `null`, passes `nullptr` to [fn] and skips the sync step.
  /// This is the foundation for the [RefUpdate1]–[RefUpdate8] helpers, covering
  /// the common pattern of passing a mutable struct pointer to a C function that
  /// may write into it.
  R _RefUpdate<R>(
    X? o,
    R Function(StructPointer<X> p) fn,
    StructPointer<X> Function(X) alloc,
  ) {
    final StructPointer<X> p = o != null
      ? alloc(o)
      : pointerFactory(MemoryPointer.nullptr);
    final result = fn(p);
    if (o != null) o.structReadFrom(p.ptr);
    return result;
  }

  /// Allocates [o] into slot `'1'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o].
  ///
  /// Use this instead of [Ref1] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate1<R>(X? o, R Function(StructPointer<X> p) fn) => _RefUpdate(o, fn, Ref1);

  /// Allocates [o] into slot `'2'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o].
  ///
  /// Use this instead of [Ref2] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate2<R>(X? o, R Function(StructPointer<X> p) fn) => _RefUpdate(o, fn, Ref2);

  /// Allocates [o] into slot `'3'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o].
  ///
  /// Use this instead of [Ref3] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate3<R>(X? o, R Function(StructPointer<X> p) fn) => _RefUpdate(o, fn, Ref3);

  /// Allocates [o] into slot `'4'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o].
  ///
  /// Use this instead of [Ref4] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate4<R>(X? o, R Function(StructPointer<X> p) fn) => _RefUpdate(o, fn, Ref4);

  /// Allocates [o] into slot `'5'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o].
  ///
  /// Use this instead of [Ref5] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate5<R>(X? o, R Function(StructPointer<X> p) fn) => _RefUpdate(o, fn, Ref5);

  /// Allocates [o] into slot `'6'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o].
  ///
  /// Use this instead of [Ref6] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate6<R>(X? o, R Function(StructPointer<X> p) fn) => _RefUpdate(o, fn, Ref6);

  /// Allocates [o] into slot `'7'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o].
  ///
  /// Use this instead of [Ref7] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate7<R>(X? o, R Function(StructPointer<X> p) fn) => _RefUpdate(o, fn, Ref7);

  /// Allocates [o] into slot `'8'`, calls [fn] with the pointer, then
  /// syncs native memory back into [o].
  ///
  /// Use this instead of [Ref8] when the C function writes into the struct and
  /// you want the mutations reflected in [o] after the call.
  R RefUpdate8<R>(X? o, R Function(StructPointer<X> p) fn) => _RefUpdate(o, fn, Ref8);

  /// Allocates a uniquely-keyed temporary slot and passes it to [fn].
  ///
  /// The slot is tracked by a unique key of the form `'<id>_<key>'` and remains
  /// managed by the owning temporary allocator.
  ///
  /// [fn] may either:
  /// - return an [X] containing the result produced by the backend, or
  /// - return `null`/`void` after populating [ptr] with the result.
  ///
  /// The returned [X] is normalized by [_getValue], which associates it with
  /// the temporary slot, synchronizes its value from memory, and releases the
  /// temporary backing pointer when the value does not require it.
  ///
  /// This allows the same extraction mechanism to support different backend
  /// representations of struct-returning functions.
  X RefCapture(String key, dynamic Function(StructPointer<X> ptr) fn) {
    final ptr = pointerFactory(AtUnique(key: key));
    return _getValue(ptr, fn(ptr));
  }

  X _getValue(StructPointer<X> ptr, dynamic result) {
    final value = result is X ? result : ptr.ref;
    value.$state.allocKey = _lastKey;
    value.op ??= ptr;
    value.structSyncFromMemory();
    if (!value.structRequiresOp) value.op = null;
    return value;
  }

  /// Allocates a temporary slot using [alloc], passes it to [fn], and converts
  /// the result into a backend-agnostic [X].
  ///
  /// [fn] may produce the result in either of two ways, depending on the
  /// backend:
  /// - return an [X] directly, or
  /// - populate [ptr] and return `null`/`void`.
  ///
  /// The resulting [X] is normalized by [_getValue], which associates it with
  /// the temporary allocation, synchronizes its value from memory, and removes
  /// the temporary backing operation when it is no longer required.
  ///
  /// This provides a common extraction path for backends whose native APIs
  /// represent returned structs differently.
  X _Extract(
    StructPointer<X> Function([X]) alloc,
    dynamic Function(StructPointer<X> ptr) fn,
  ) {
    final ptr = alloc();
    return _getValue(ptr, fn(ptr));
  }

  /// Extracts a struct result using temporary slot `'1'`.
  ///
  /// [fn] receives a pointer to the temporary slot and may either return the
  /// backend-agnostic [X] directly or populate the slot and return `null`/`void`.
  ///
  /// The resulting value is normalized through [_Extract] and follows the
  /// lifetime and ownership rules of the owning temporary allocator.
  ///
  /// This is the standard single-result extraction operation used by backend
  /// implementations for functions that return structs.
  X Extract1(dynamic Function(StructPointer<X> ptr) fn) => _Extract(Ref1, fn);

  /// Extracts a struct result using temporary slot `'2'`.
  ///
  /// [fn] receives a pointer to the temporary slot and may either return the
  /// backend-agnostic [X] directly or populate the slot and return `null`/`void`.
  ///
  /// The resulting value is normalized through [_Extract] and follows the
  /// lifetime and ownership rules of the owning temporary allocator.
  ///
  /// This is the standard single-result extraction operation used by backend
  /// implementations for functions that return structs.
  X Extract2(dynamic Function(StructPointer<X> ptr) fn) => _Extract(Ref2, fn);

  /// Extracts a struct result using temporary slot `'3'`.
  ///
  /// [fn] receives a pointer to the temporary slot and may either return the
  /// backend-agnostic [X] directly or populate the slot and return `null`/`void`.
  ///
  /// The resulting value is normalized through [_Extract] and follows the
  /// lifetime and ownership rules of the owning temporary allocator.
  ///
  /// This is the standard single-result extraction operation used by backend
  /// implementations for functions that return structs.
  X Extract3(dynamic Function(StructPointer<X> ptr) fn) => _Extract(Ref3, fn);

  /// Extracts a struct result using temporary slot `'4'`.
  ///
  /// [fn] receives a pointer to the temporary slot and may either return the
  /// backend-agnostic [X] directly or populate the slot and return `null`/`void`.
  ///
  /// The resulting value is normalized through [_Extract] and follows the
  /// lifetime and ownership rules of the owning temporary allocator.
  ///
  /// This is the standard single-result extraction operation used by backend
  /// implementations for functions that return structs.
  X Extract4(dynamic Function(StructPointer<X> ptr) fn) => _Extract(Ref4, fn);

  /// Extracts a struct result using temporary slot `'5'`.
  ///
  /// [fn] receives a pointer to the temporary slot and may either return the
  /// backend-agnostic [X] directly or populate the slot and return `null`/`void`.
  ///
  /// The resulting value is normalized through [_Extract] and follows the
  /// lifetime and ownership rules of the owning temporary allocator.
  ///
  /// This is the standard single-result extraction operation used by backend
  /// implementations for functions that return structs.
  X Extract5(dynamic Function(StructPointer<X> ptr) fn) => _Extract(Ref5, fn);

  /// Extracts a struct result using temporary slot `'6'`.
  ///
  /// [fn] receives a pointer to the temporary slot and may either return the
  /// backend-agnostic [X] directly or populate the slot and return `null`/`void`.
  ///
  /// The resulting value is normalized through [_Extract] and follows the
  /// lifetime and ownership rules of the owning temporary allocator.
  ///
  /// This is the standard single-result extraction operation used by backend
  /// implementations for functions that return structs.
  X Extract6(dynamic Function(StructPointer<X> ptr) fn) => _Extract(Ref6, fn);

  /// Extracts a struct result using temporary slot `'7'`.
  ///
  /// [fn] receives a pointer to the temporary slot and may either return the
  /// backend-agnostic [X] directly or populate the slot and return `null`/`void`.
  ///
  /// The resulting value is normalized through [_Extract] and follows the
  /// lifetime and ownership rules of the owning temporary allocator.
  ///
  /// This is the standard single-result extraction operation used by backend
  /// implementations for functions that return structs.
  X Extract7(dynamic Function(StructPointer<X> ptr) fn) => _Extract(Ref7, fn);

  /// Extracts a struct result using temporary slot `'8'`.
  ///
  /// [fn] receives a pointer to the temporary slot and may either return the
  /// backend-agnostic [X] directly or populate the slot and return `null`/`void`.
  ///
  /// The resulting value is normalized through [_Extract] and follows the
  /// lifetime and ownership rules of the owning temporary allocator.
  ///
  /// This is the standard single-result extraction operation used by backend
  /// implementations for functions that return structs.
  X Extract8(dynamic Function(StructPointer<X> ptr) fn) => _Extract(Ref8, fn);

  /// Fixed scratch slot holding a zero-initialized [X] struct, by pointer.
  ///
  /// The native-memory equivalent of a Dart-layer `.zero()` constructor,
  /// a cheap, shared buffer for call sites that just need to pass a zero
  /// value without allocating. **Read-only by convention**: this slot is
  /// shared (via [At]) across every call site that touches it, so writing
  /// through it permanently corrupts the "zero" invariant for everyone else,
  /// there is no reset. Use [$1Ptr]..[$4Ptr] or [$newPtr] for a mutable slot.
  StructPointer<X> get $zeroPtr => pointerFactory(At('__reusable__zero'));

  /// [X] view of [$zeroPtr]. Same read-only convention applies: do not
  /// mutate fields on this reference.
  X get $zero => $zeroPtr.ref;

  /// Reusable single-element scratch slot, by pointer. Unlike [$zeroPtr],
  /// this is expected to be written through, it's a fixed shared buffer,
  /// not a zero-invariant one, so callers may freely overwrite its contents
  /// between uses.
  StructPointer<X> get $1Ptr => pointerFactory(At('__reusable__1'));

  /// [X] view of [$1Ptr].
  X get $1 => $1Ptr.ref;

  /// Reusable single-element scratch slot, parallel to [$1Ptr] under a
  /// distinct key. Use when a call needs a second independent scratch
  /// struct alongside [$1]/[$1Ptr] (e.g. two out-parameters in one call).
  StructPointer<X> get $2Ptr => pointerFactory(At('__reusable__2'));

  /// [X] view of [$2Ptr].
  X get $2 => $2Ptr.ref;

  /// Reusable single-element scratch slot, parallel to [$1Ptr]/[$2Ptr].
  StructPointer<X> get $3Ptr => pointerFactory(At('__reusable__3'));

  /// [X] view of [$3Ptr].
  X get $3 => $3Ptr.ref;

  /// Reusable single-element scratch slot, parallel to [$1Ptr]..[$3Ptr].
  ///
  /// With [$1Ptr] through [$4Ptr] this gives up to four fixed scratch slots
  /// (plus the read-only [$zeroPtr]) for call sites that need several
  /// simultaneous native struct out-parameters without allocating a fresh
  /// buffer each time.
  StructPointer<X> get $4Ptr => pointerFactory(At('__reusable__4'));

  /// [X] view of [$4Ptr].
  X get $4 => $4Ptr.ref;

  /// Fresh, independently-owned scratch pointer, unlike [$zeroPtr]/[$1Ptr]..[$4Ptr].
  ///
  /// Each access gets its own slot via [AtUnique], keyed with a monotonic id,
  /// so it is safe even when the same call site may be active multiple times
  /// at once (recursion, re-entrant calls).
  StructPointer<X> get $newPtr => pointerFactory(AtUnique(key: '__reusable__newptr'));

  /// [X] view of [$newPtr].
  X get $new => $newPtr.ref;
}

/// Extends [RaylibTempAllocator] with pointer-to-struct allocation,
final class RaylibTempStructPointerAllocator<
  X extends RaylibStruct<X> // Dart mirror object
> extends RaylibTempAllocator<RPointer<RStruct>> {

  /// Converts a [X] of Dart struct wrapper into an allocated [P] pointer.
  final StructPointer<X> Function([X?, String?]) valueFunc;

  /// Converts a [List] of Dart struct wrappers [X] into an allocated [P] array.
  final StructPointer<X> Function(List<X> array) rawArrayFunc;

  /// Overwrites the [i]-th element of the array at [ptr] with [value].
  final void Function(MemoryPointer<RPointer<RStruct>> ptr, int i, MemoryPointer<RVoid> value) indexSetterFunc;

  RaylibTempStructPointerAllocator(super.temp, {
    required super.byteSize,
    required this.valueFunc,
    required this.rawArrayFunc,
    required this.indexSetterFunc,
  });

  /// Allocates an unslotted pointer-of-pointers from a list of struct [arrays].
  ///
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<RPointer<RStruct>> RawArray(List<List<X>> arrays) {
    final p = Raw(arrays.length);
    for (int i = 0; i < arrays.length; i++) indexSetterFunc(p, i, rawArrayFunc(arrays[i]).ptr.cast());
    return p;
  }

  /// Writes [array] into a tracked slot of sufficient capacity.
  MemoryPointer<RPointer<RStruct>> Array(List<X> array, {String? key}) {
    key ??= slotKey(key);
    final p = At(key, array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(p, i, valueFunc(array[i], '${key}_$i').ptr.cast());
    return p;
  }
}