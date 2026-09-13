part of '../../raylib_dartified_base.dart';

/// Extends [RaylibTempAllocator] with struct allocation, providing
/// [Allocate], [_Ref], [_RefOrNull], and [_Extract] helpers for
/// Dart mirror objects ([X]).
final class RaylibTempStructAllocator<
  X extends RaylibStruct<X> // Dart mirror object
> extends RaylibTempArrayAllocator<X, RStruct> {

  final StructFactory<X> factory;

  final StructPointerFactory<X> pointerFactory;

  RaylibTempStructAllocator(super.temp, {
    required super.byteSize,
    required this.factory,
    required this.pointerFactory,
  }) : super(
    indexSetterFunc: (ptr, i, value) => value.structWriteInto(ptr.offsetBy(i * byteSize)),
  );

  @override
  String get name => '$X';

  StructPointer<X> RawStruct([int count = 1])
    => pointerFactory(Raw(count));

  StructPointer<X> RawArrayStruct(List<X> array)
    => pointerFactory(RawArray(array));

  StructPointer<X> ArrayStruct(List<X> array, {String? key})
    => pointerFactory(Array(array, key: key));

  StructPointer<X> AtStruct(String key, [int count = 1])
    => pointerFactory(At(key, count));

  StructPointer<X> AtUniqueStruct({String key = '_unique_', int count = 1})
    => pointerFactory(AtUnique(key: key, count: count));

  /// Pointer allocator for this struct [X].
  late final RaylibTempStructPointerAllocator<X> $ = .new(temp,
    byteSize: RType.nativeWordSize,
    arrayFunc: ArrayStruct,
    rawArrayFunc: RawArrayStruct,
  );

  /// Builds a [RaylibTemp] slot key from [value]'s `tag` and an optional [inner] suffix.
  @nonVirtual
  String getBaseKey(X value, [String? inner]) => '${value.$state.tag}_$inner';

  /// Allocates or syncs [value] to a tracked slot at [key].
  StructPointer<X> Allocate(X value, [String? key]) {
    final op = value.op;
    if (op != null) return op;

    value.$state.isAllocated = true;

    if (op != null) {
      if (value.$state.isFirstSync) {
        if (value.$state.isDisposed) return op;
        if (!temp.doSync) return op;

        // full sync once to push pre-promotion Dart state to memory
        temp.debugSyncInfo('[SYNC] ${value.structName} first sync');
        value.structWriteInto(op);
        value.$state.isFirstSync = false;
      } else {
        // already live, setters handle write-through, skip full sync
        temp.debugSyncInfo('[SYNC] ${value.structName} skipping sync (live)');
      }
      
      return op;
    }

    if (value.$state.isDisposed) {
      throw StateError('You are trying to allocate disposed $value object!');
    }

    final requiresOp = value._requiresOp;
    String baseKey = getBaseKey(value, _slotKey(key));    
    final p = pointerFactory(requiresOp ? AtUnique(key: baseKey) : At(baseKey));
    if (requiresOp) {
      temp.debugSyncInfo('[SYNC] ${value.structName} allocate into');
      value.op = p;
    }
    value.structAllocateInto(temp, p, baseKey);
    value.structWriteInto(p);
    return p;
  }

  /// Copies [length] structs from [src] into a tracked slot.
  StructPointer<X> Copy(MemoryPointer src, int length, {String? key}) {
    final p = At(_slotKey(key), length);
    p.copyBytesFrom(src, length * byteSize);
    return pointerFactory(p);
  }

  /// Returns the pointer for slot [key], optionally writing [value] into it.
  ///
  /// Allocates the slot on first use.
  StructPointer<X> Value([X? value, String? key]) {
    final p = At(_slotKey(key));
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
    final p = At(_uniqueSlotKey(key));
    if (value != null) value.structWriteInto(p);
    return pointerFactory(p);
  }

  /// Returns a [StructPointer] for the given [X] value, using the existing allocation at [key]
  /// when [x] is `null`, or allocating [x] into [key] via [Allocate].
  ///
  /// Unlike [_RefOrNull], a `null` [x] does not produce a `nullptr`, it reuses
  /// the slot's current allocation via [At]. Use [_RefOrNull] when a `null` input
  /// should produce a `nullptr` instead.
  StructPointer<X> _Ref(X? x, String key) => x == null
    ? pointerFactory(At(key))
    : Allocate(x, key);

  StructPointer<X> RefUnique(X? x) {
    if (x == null) {
      return pointerFactory(MemoryPointer.nullptr());
    }
    if (x.op == null) {
      x.op = AtUniqueStruct();
      x.structSyncToMemory();
    }
    return x.getOp();
  }

  /// Allocates [o] into slot `@slot:1`, or reuses the existing slot `@slot:1` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> Ref1([X? o]) => _Ref(o, '@slot:1');

  /// Allocates [o] into slot `@slot:2`, or reuses the existing slot `@slot:2` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> Ref2([X? o]) => _Ref(o, '@slot:2');

  /// Allocates [o] into slot `@slot:3`, or reuses the existing slot `@slot:3` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> Ref3([X? o]) => _Ref(o, '@slot:3');

  /// Allocates [o] into slot `@slot:4`, or reuses the existing slot `@slot:4` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> Ref4([X? o]) => _Ref(o, '@slot:4');

  /// Allocates [o] into slot `@slot:5`, or reuses the existing slot `@slot:5` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> Ref5([X? o]) => _Ref(o, '@slot:5');

  /// Allocates [o] into slot `@slot:6`, or reuses the existing slot `@slot:6` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> Ref6([X? o]) => _Ref(o, '@slot:6');

  /// Allocates [o] into slot `@slot:7`, or reuses the existing slot `@slot:7` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> Ref7([X? o]) => _Ref(o, '@slot:7');

  /// Allocates [o] into slot `@slot:8`, or reuses the existing slot `@slot:8` allocation
  /// if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> Ref8([X? o]) => _Ref(o, '@slot:8');

  /// Allocates [o] into slot `@slot:1`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> RefOrNull1([X? o]) => o == null ? pointerFactory(MemoryPointer.nullptr()) : Ref1(o);

  /// Allocates [o] into slot `@slot:2`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> RefOrNull2([X? o]) => o == null ? pointerFactory(MemoryPointer.nullptr()) : Ref2(o);

  /// Allocates [o] into slot `@slot:3`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> RefOrNull3([X? o]) => o == null ? pointerFactory(MemoryPointer.nullptr()) : Ref3(o);

  /// Allocates [o] into slot `@slot:4`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> RefOrNull4([X? o]) => o == null ? pointerFactory(MemoryPointer.nullptr()) : Ref4(o);

  /// Allocates [o] into slot `@slot:5`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> RefOrNull5([X? o]) => o == null ? pointerFactory(MemoryPointer.nullptr()) : Ref5(o);

  /// Allocates [o] into slot `@slot:6`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> RefOrNull6([X? o]) => o == null ? pointerFactory(MemoryPointer.nullptr()) : Ref6(o);

  /// Allocates [o] into slot `@slot:7`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> RefOrNull7([X? o]) => o == null ? pointerFactory(MemoryPointer.nullptr()) : Ref7(o);

  /// Allocates [o] into slot `@slot:8`, or returns `nullptr` if [o] is `null`.
  ///
  /// Intended as a short-lived scratch reference within a single C call.
  StructPointer<X> RefOrNull8([X? o]) => o == null ? pointerFactory(MemoryPointer.nullptr()) : Ref8(o);

  /// Allocates a uniquely-keyed temporary slot and passes it to [fn].
  ///
  /// The slot is tracked by a unique key of the form `<id>_<key>` and remains
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
    final ptr = pointerFactory(AtUnique(key: '@capture:$key'));
    return _getValue(ptr, fn(ptr));
  }

  /// Uses a stable temporary slot identified by [key] and passes it to [fn].
  ///
  /// Unlike [RefCapture], repeated calls with the same [key] reuse the same
  /// temporary backing slot instead of allocating a new uniquely-keyed slot.
  ///
  /// The slot remains managed by the owning temporary allocator and is reused
  /// until the allocator is cleared or disposed.
  ///
  /// [fn] may either:
  /// - return an [X] containing the result produced by the backend, or
  /// - return `null`/`void` after populating [ptr] with the result.
  ///
  /// The returned [X] is normalized by [_getValue], which associates it with
  /// the temporary slot, synchronizes its value from memory, and releases the
  /// temporary backing pointer when the value does not require it.
  ///
  /// Use this for APIs whose result can safely share one temporary backing slot
  /// across repeated calls, such as getters returning a current global/default
  /// value. Do not use it when each call must preserve an independent captured
  /// value; use [RefCapture] in that case.
  X RefCaptureCached(String key, dynamic Function(StructPointer<X> ptr) fn) {
    final ptr = pointerFactory(At('@cached:$key'));
    return _getValue(ptr, fn(ptr));
  }

  X _getValue(StructPointer<X> ptr, dynamic result) {
    final value = result is X ? result : ptr.ref;
    value.op ??= ptr;
    if (ptr.allocationKey case final key?) {
      value.structAllocateInto(temp, ptr, key);
    }
    if (!value._requiresOp) {
      value.structSyncFromMemory();
      value.op = null;
    }
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

  /// Extracts a struct result using temporary slot `@slot:1`.
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

  /// Extracts a struct result using temporary slot `@slot:2`.
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

  /// Extracts a struct result using temporary slot `@slot:3`.
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

  /// Extracts a struct result using temporary slot `@slot:4`.
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

  /// Extracts a struct result using temporary slot `@slot:5`.
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

  /// Extracts a struct result using temporary slot `@slot:6`.
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

  /// Extracts a struct result using temporary slot `@slot:7`.
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

  /// Extracts a struct result using temporary slot `@slot:8`.
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
  StructPointer<X> get $zeroPtr => pointerFactory(At('@reusableZero'));

  /// [X] view of [$zeroPtr]. Same read-only convention applies: do not
  /// mutate fields on this reference.
  X get $zero => $zeroPtr.ref;

  /// Reusable single-element scratch slot, by pointer. Unlike [$zeroPtr],
  /// this is expected to be written through, it's a fixed shared buffer,
  /// not a zero-invariant one, so callers may freely overwrite its contents
  /// between uses.
  StructPointer<X> get $1Ptr => pointerFactory(At('@reusable1'));

  /// [X] view of [$1Ptr].
  X get $1 => $1Ptr.ref;

  /// Reusable single-element scratch slot, parallel to [$1Ptr] under a
  /// distinct key. Use when a call needs a second independent scratch
  /// struct alongside [$1]/[$1Ptr] (e.g. two out-parameters in one call).
  StructPointer<X> get $2Ptr => pointerFactory(At('@reusable2'));

  /// [X] view of [$2Ptr].
  X get $2 => $2Ptr.ref;

  /// Reusable single-element scratch slot, parallel to [$1Ptr]/[$2Ptr].
  StructPointer<X> get $3Ptr => pointerFactory(At('@reusable3'));

  /// [X] view of [$3Ptr].
  X get $3 => $3Ptr.ref;

  /// Reusable single-element scratch slot, parallel to [$1Ptr]..[$3Ptr].
  ///
  /// With [$1Ptr] through [$4Ptr] this gives up to four fixed scratch slots
  /// (plus the read-only [$zeroPtr]) for call sites that need several
  /// simultaneous native struct out-parameters without allocating a fresh
  /// buffer each time.
  StructPointer<X> get $4Ptr => pointerFactory(At('@reusable4'));

  /// [X] view of [$4Ptr].
  X get $4 => $4Ptr.ref;

  /// Fresh, independently-owned scratch pointer, unlike [$zeroPtr]/[$1Ptr]..[$4Ptr].
  ///
  /// Each access gets its own slot via [AtUnique], keyed with a monotonic id,
  /// so it is safe even when the same call site may be active multiple times
  /// at once (recursion, re-entrant calls).
  StructPointer<X> get $newPtr => pointerFactory(AtUnique(key: '@newPtr:'));

  /// [X] view of [$newPtr].
  X get $new => $newPtr.ref;

  @override
  void dispose() {
    super.dispose();
    $.dispose();
  }
}

/// Extends [RaylibTempAllocator] with pointer-to-struct allocation,
final class RaylibTempStructPointerAllocator<
  X extends RaylibStruct<X> // Dart mirror object
> extends RaylibTempAllocator<RPointer<RStruct>> {

  /// Converts a [X] of Dart struct wrapper into an allocated [P] pointer.
  final StructPointer<X> Function(List<X> array, {String? key}) arrayFunc;

  /// Converts a [List] of Dart struct wrappers [X] into an allocated [P] array.
  final StructPointer<X> Function(List<X> array) rawArrayFunc;

  RaylibTempStructPointerAllocator(super.temp, {
    required super.byteSize,
    required this.arrayFunc,
    required this.rawArrayFunc,
  });

  @override
  String get name => 'RPointer<$X>';

  /// Writes [array] into a tracked slot of sufficient capacity.
  MemoryPointer<RPointer<RStruct>> Array(List<List<X>> array, {String? key}) {
    key ??= _slotKey(key);
    final pp = At(key, array.length);
    for (int i = 0; i < array.length; i++) {
      final innerPtr = arrayFunc(array[i], key: '${key}_$i');
      pp.writePtr(innerPtr, i * RType.nativeWordSize);
    }
    return pp;
  }

  /// Allocates an unslotted pointer-of-pointers from a list of struct [arrays].
  ///
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<RPointer<RStruct>> RawArray(List<List<X>> arrays) {
    final pp = Raw(arrays.length);
    for (int i = 0; i < arrays.length; i++) {
      final innerPtr = rawArrayFunc(arrays[i]);
      pp.writePtr(innerPtr, i * RType.nativeWordSize);
    }
    return pp;
  }
}