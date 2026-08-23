part of '../../raylib_dartified_base.dart';

// TODO: clean up doc comments

// TODO: think about removing `RefCapture`, if `Ref1` is used and struct has `requiresOp` it will do `PointerTo`

/// Extends [RaylibTempAllocator] with struct allocation, providing
/// [PointerTo], [_Ref], [_RefOrNull], [_RefUpdate], and [_Extract] helpers for
/// Dart mirror objects ([X]).
class RaylibTempStructAllocator<
  X extends RaylibStruct<X> // Dart mirror object
> extends RaylibTempAllocator<RStruct> {

  final StructFactory<X> factory;

  final StructPointerFactory<X> pointerFactory;

  RaylibTempStructAllocator(super.temp, {
    required super.byteSize,
    required this.factory,
    required this.pointerFactory,
  });

  @override
  String get name => '$X';

  StructPointer<X> StructRaw([int count = 1])
    => pointerFactory(Raw(count));

  StructPointer<X> StructAt(String key, [int count = 1])
    => pointerFactory(At(key, count));

  StructPointer<X> StructAtUnique({String key = '_unique_', int count = 1})
    => pointerFactory(AtUnique(key: key, count: count));

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
  String getBaseKeyWithId(X value, [String? inner]) => '${value.$state.nextId}_${getBaseKey(value, inner)}';

  /// Allocates or syncs [value] to a tracked slot at [key].
  StructPointer<X> PointerTo(X value, [String? key]) {
    if (!value.structRequiresOp) {
      String baseKey = getBaseKey(value, slotKey(key));
      value.$state.allocKey = baseKey;
      final p = At(baseKey);
      value.structAllocateInto(temp, p, baseKey);
      value.structSyncInto(temp, p, baseKey);
      return pointerFactory(p);
    }

    final op = value.op;

    if (op != null) {
      String allocKey = value.$state.allocKey ??= '<CHILD-POINTER>';

      if (value.$state.isFirstSync) {
        if (value.$state.isDisposed) return pointerFactory(op);
        if (!temp.doSync) return pointerFactory(op);

        // full sync once to push pre-promotion Dart state to memory
        temp.debugSyncInfo('[SYNC] ${value.structName} first sync into $allocKey');
        value.structSyncInto(temp, op, allocKey);
        value.$state.isFirstSync = false;
      } else {
        // already live, setters handle write-through, skip full sync
        temp.debugSyncInfo('[SYNC] ${value.structName} skipping sync (live) $allocKey');
      }
      
      return pointerFactory(op);
    }

    if (value.$state.isDisposed) {
      throw StateError('You are trying to allocate disposed $value object!');
    }

    String baseKey = getBaseKeyWithId(value, slotKey(key));
    temp.debugSyncInfo('[SYNC] ${value.structName} allocate into $baseKey');
    value.$state.allocKey = baseKey;
    final p = At(baseKey);
    value.structAllocateInto(temp, p, baseKey);
    value.structSyncInto(temp, p, baseKey);
    value.op = p;
    return pointerFactory(p);
  }

  /// Allocates an unslotted array and populates it from [array].
  ///
  /// The caller is responsible for freeing the returned pointer.
  StructPointer<X> RawArray(List<X> array) {
    final p = Raw(array.length);
    for (int i = 0; i < array.length; i++) array[i].writeInto(p.readPtr(i));
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
    if (value != null) value.writeInto(p);
    return pointerFactory(p);
  }

  /// Returns the pointer for slot [key], optionally writing [value] into it.
  ///
  /// The caller is responsible for freeing the returned pointer.
  StructPointer<X> RawValue([X? value, String? key]) {
    final p = Raw();
    if (value != null) value.writeInto(p);
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
    if (value != null) value.writeInto(p);
    return pointerFactory(p);
  }

  /// Returns the pointer for the slot identified by a unique [key] suffix
  /// optionally writing [value] into it.
  ///
  /// The caller is responsible for freeing the returned pointer.
  StructPointer<X> RawValueUnique(X? value) {
    final p = Raw();
    if (value != null) value.writeInto(p);
    return pointerFactory(p);
  }

  /// Writes [array] into a tracked slot of sufficient capacity.
  StructPointer<X> Array(List<X> array, {String? key}) {
    final p = At(slotKey(key), array.length);
    for (int i = 0; i < array.length; i++) array[i].writeInto(p.readPtr(i));
    return pointerFactory(p);
  }

  /// Fills a tracked slot of [count] structs, producing each element via `init(i)` and writing it to memory.
  StructPointer<X> Fill(int count, X Function(int) init, {String? key}) {
    final p = At(slotKey(key), count);
    for (int i = 0; i < count; i++) init(i).writeInto(p.readPtr(i));
    return pointerFactory(p);
  }

  /// Fills a tracked slot of [count] structs by calling `init(i, struct)`
  /// which writes directly into the native struct fields.
  StructPointer<X> FillInto(int count, void Function(int, X) init, {String? key}) {
    final p = At(slotKey(key), count);
    for (int i = 0; i < count; i++) {
      final inner = p.readPtr<RStruct>(i);
      final value = factory(op: inner);
      init(i, value);
      value.writeInto(inner);
    }
    return pointerFactory(p);
  }

  /// Fills a tracked slot of [count] structs by setting each element to the
  /// [C] returned by `init(ptr, i)`.
  StructPointer<X> FillWith(int count, X Function(StructPointer<X>, int) init, {String? key}) {
    final p = At(slotKey(key), count);
    for (int i = 0; i < count; i++) {
      final inner = p.readPtr<RStruct>(i);
      init(pointerFactory(inner), i).writeInto(inner);
    }
    return pointerFactory(p);
  }

  /// Returns a `P` for the given [V] value, using the existing allocation at [key]
  /// when [x] is `null`, or allocating [x] into [key] via [PointerTo].
  ///
  /// Unlike [_RefOrNull], a `null` [x] does not produce a nullptr, it reuses
  /// the slot's current allocation via [At]. Use [_RefOrNull] when a null input
  /// should produce a nullptr instead.
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

  /// Returns a `P` for the given [V] value, using `nullptr` when [x] is `null`.
  ///
  /// Allocates into a numbered slot (1–8) via the corresponding [PointerTo] call,
  /// so the lifetime is tied to the owning [RaylibTemp].
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
  // TODO: think about if this is really necessary now, when the structs are complete mirrors
  R _RefUpdate<R>(
    X? o,
    R Function(StructPointer<X> p) fn,
    StructPointer<X> Function(X) alloc,
  ) {
    final StructPointer<X> p = o != null
      ? alloc(o)
      : pointerFactory(MemoryPointer.nullptr);
    final result = fn(p);
    if (o != null) o.readFrom(p.ptr);
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
  X RefCapture(String key, X Function(StructPointer<X> ptr) fn) {
    final ptr = AtUnique(key: key);
    final result = fn(pointerFactory(ptr));

    result.op = ptr;
    result.structSyncToMemory();

    result.$state.allocKey = key;
    result.$state.nextId; // trigger the ID
    
    return result;
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
    StructPointer<X> Function([X]) alloc,
    void Function(StructPointer<X> ptr) fn,
  ) {
    final ptr = alloc();
    fn(ptr);
    return ptr.ref;
  }

  /// Allocates slot `'1'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTemp].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate1] for the
  /// complementary write-then-read pattern.
  X Extract1(void Function(StructPointer<X> ptr) fn) => _Extract(Ref1, fn);

  /// Allocates slot `'2'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTemp].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate2] for the
  /// complementary write-then-read pattern.
  X Extract2(void Function(StructPointer<X> ptr) fn) => _Extract(Ref2, fn);

  /// Allocates slot `'3'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTemp].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate3] for the
  /// complementary write-then-read pattern.
  X Extract3(void Function(StructPointer<X> ptr) fn) => _Extract(Ref3, fn);

  /// Allocates slot `'4'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTemp].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate4] for the
  /// complementary write-then-read pattern.
  X Extract4(void Function(StructPointer<X> ptr) fn) => _Extract(Ref4, fn);

  /// Allocates slot `'5'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTemp].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate5] for the
  /// complementary write-then-read pattern.
  X Extract5(void Function(StructPointer<X> ptr) fn) => _Extract(Ref5, fn);

  /// Allocates slot `'6'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTemp].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate6] for the
  /// complementary write-then-read pattern.
  X Extract6(void Function(StructPointer<X> ptr) fn) => _Extract(Ref6, fn);

  /// Allocates slot `'7'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTemp].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate7] for the
  /// complementary write-then-read pattern.
  X Extract7(void Function(StructPointer<X> ptr) fn) => _Extract(Ref7, fn);

  /// Allocates slot `'8'` as an uninitialized sret destination, passes its raw
  /// pointer to [fn], then returns the struct [fn] wrote into it.
  ///
  /// Use this when calling a WASM-compiled C function that returns a struct via
  /// an implicit sret pointer rather than a return value. The slot lifetime is
  /// tied to the owning [RaylibTemp].
  ///
  /// See [_Extract] for the underlying mechanism, and [RefUpdate8] for the
  /// complementary write-then-read pattern.
  X Extract8(void Function(StructPointer<X> ptr) fn) => _Extract(Ref8, fn);

  // -----

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
class RaylibTempStructPointerAllocator<
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

  /// Writes each sub-array in [arrays] into a tracked slot and returns the
  /// outer `PP`
  MemoryPointer<RPointer<RStruct>> Fill(List<List<X>> arrays, {String? key}) {
    final p = At(slotKey(key), arrays.length);
    for (int i = 0; i < arrays.length; i++) indexSetterFunc(p, i, rawArrayFunc(arrays[i]).ptr.cast());
    return p;
  }

  /// Fills an unslotted pointer of [count] pointers by calling `init(i)` for each index.
  /// 
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<RPointer<RStruct>> FillRaw(int count, MemoryPointer<RVoid> Function(int) init) {
    final pp = Raw(count);
    for (int i = 0; i < count; i++) indexSetterFunc(pp, i, init(i));
    return pp;
  }
}