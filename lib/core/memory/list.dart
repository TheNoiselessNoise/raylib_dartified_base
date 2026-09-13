part of '../raylib_dartified_base.dart';

/// How a [StructLiveList] locates and (de)serializes one element in native
/// memory, given the base pointer [StructLiveList] resolves for it.
///
/// Every factory has a different notion of what "base" means (raw field
/// address, address of a pointer slot, an already-dereferenced pointer),
/// each implementation below documents its own, so that meaning is fixed
/// once per case instead of being re-decided (and occasionally gotten
/// wrong) at every call site.
abstract class _Access<E> {
  /// Reads element [index]. Returns null if unreadable (e.g. a null
  /// pointer along the way for a variable-size collection).
  E? readAt(MemoryPointer base, int index);

  /// Writes element [index]. No-ops if unwritable.
  void writeAt(MemoryPointer base, int index, E value);
}

/// General-purpose escape hatch.
class _ClosureAccess<E> implements _Access<E> {
  final E? Function(MemoryPointer fieldPtr, int index) _read;
  final void Function(MemoryPointer fieldPtr, int index, E value) _write;
  const _ClosureAccess(this._read, this._write);

  @override
  E? readAt(MemoryPointer base, int index) => _read(base, index);

  @override
  void writeAt(MemoryPointer base, int index, E value) => _write(base, index, value);
}

/// Fixed-size inline array field: `R xs[N];`.
/// `base` handed to [readAt]/[writeAt] is the field's own address.
class _InlineArrayAccess<E, R extends RType> implements _Access<E> {
  final ArrayCodec<E, R> codec;
  const _InlineArrayAccess(this.codec);

  @override
  E? readAt(MemoryPointer base, int index) {
    if (codec.elementPtr(base, index).isNull) return null;
    return codec.readAt(base, index);
  }

  @override
  void writeAt(MemoryPointer base, int index, E value) => codec.writeAt(base, index, value);
}

/// Pointer to a variable-length array: `R* xs;`.
/// `base` handed to [readAt]/[writeAt] is the address of the pointer *slot*
/// (not yet dereferenced), [PointerCodec.elementPtr] derefs it for you.
class _PointerArrayAccess<E, R extends RType> implements _Access<E> {
  final PointerCodec<E, R> codec;
  const _PointerArrayAccess(this.codec);

  @override
  E? readAt(MemoryPointer base, int index) {
    if (codec.elementPtr(base, index).isNull) return null;
    return codec.readAt(base, index);
  }

  @override
  void writeAt(MemoryPointer base, int index, E value) => codec.writeAt(base, index, value);
}

/// Pointer to one fixed-size array: `R (*xs)[N];`. One level of indirection
/// to a single inline array, the pointer doesn't move per element, only
/// the offset within what it points to does.
/// `base` handed to [readAt]/[writeAt] is the address of the pointer slot.
class _PointerToFixedArrayAccess<E, R extends RType> implements _Access<E> {
  final PointerCodec<List<E>, RArray<R>> pointerCodec;
  late final ArrayCodec<E, R> arrayCodec = pointerCodec.inner as ArrayCodec<E, R>;

  _PointerToFixedArrayAccess(this.pointerCodec);

  @override
  E? readAt(MemoryPointer base, int index) {
    final derefed = pointerCodec.deref(base);
    if (derefed.isNull) return null;
    return arrayCodec.readAt(derefed, index);
  }

  @override
  void writeAt(MemoryPointer base, int index, E value) {
    final derefed = pointerCodec.deref(base);
    if (derefed.isNull) return;
    arrayCodec.writeAt(derefed, index, value);
  }
}

/// Innermost level of a `T** -> T* -> T[]` chain, once the specific `T*`
/// for one outer index has already been resolved (via
/// [PointerCodec.pointerElementPtr]).
/// `base` handed to [readAt]/[writeAt] is that already-resolved `T*` value
/// itself, no further dereferencing, just a fixed stride per index.
class _ResolvedPointerAccess<E, R extends RType> implements _Access<E> {
  final PointerCodec<E, R> codec;
  const _ResolvedPointerAccess(this.codec);

  @override
  E? readAt(MemoryPointer base, int index) {
    if (base.isNull) return null;
    return codec.inner.read(codec.elementPtrFrom(base, index));
  }

  @override
  void writeAt(MemoryPointer base, int index, E value) {
    if (base.isNull) return;
    codec.inner.write(codec.elementPtrFrom(base, index), value);
  }
}

/// Lazily builds and caches elements that are themselves live lists.
/// Assignment is unsupported: replacing the cached object wouldn't write
/// anything to native memory, and would look like it worked, see
/// [StructLiveList.pointerPointerArray].
class _LazyBuiltAccess<E> implements _Access<E> {
  final E Function(int index) build;
  const _LazyBuiltAccess(this.build);

  @override
  E? readAt(MemoryPointer base, int index) => build(index);

  @override
  void writeAt(MemoryPointer base, int index, E value) {
    throw UnsupportedError(
      'Cannot assign a nested StructLiveList as a value. '
      'Modify the inner list returned by operator [] instead.',
    );
  }
}

class StructLiveList<E, R extends RType> extends ListMixin<E> {
  /// Returns the memory pointer this list resolves elements from.
  ///
  /// Always means "base to hand to [_access]".
  final MemoryPointer? Function() ptrOf;

  final int _offset;
  final int? _fixedCount;
  final _Access<E> _access;

  List<E?> _cache;

  StructLiveList._(
    this.ptrOf,
    this._offset,
    this._fixedCount,
    this._access,
    List<E> initial,
  ) : _cache = .of(initial);

  /// General-purpose escape hatch: builds a live list from manual
  /// read/write closures over an already-resolved base pointer ([offset]
  /// is always 0 here, bake any offset into [ptrOf] itself).
  factory StructLiveList.live(
    MemoryPointer? Function() ptrOf, {
    int? fixedCount,
    required E? Function(MemoryPointer fieldPtr, int index) readAt,
    required void Function(MemoryPointer fieldPtr, int index, E value) writeAt,
    List<E> initial = const [],
  }) => ._(ptrOf, 0, fixedCount, _ClosureAccess(readAt, writeAt), initial);

  /// Fixed-size inline array field.
  factory StructLiveList.array(
    MemoryPointer? Function() ptrOf,
    StructValueField<List<E>, RArray<R>> field,
    List<E> initial,
  ) {
    final codec = field.codec as ArrayCodec<E, R>;
    assert(initial.length <= codec.count);
    return ._(ptrOf, field.offset, codec.count, _InlineArrayAccess<E, R>(codec), initial);
  }

  /// Pointer to a variable-size array.
  factory StructLiveList.pointerArray(
    MemoryPointer? Function() ptrOf,
    StructPointerArrayField<E, R> field,
    List<E> initial,
  ) {
    final codec = field.codec;
    return ._(ptrOf, field.offset, null, _PointerArrayAccess<E, R>(codec), initial);
  }

  /// Pointer to a fixed-size array.
  factory StructLiveList.pointerFixedArray(
    MemoryPointer? Function() ptrOf,
    StructPointerValueField<List<E>, RArray<R>> field,
    List<E> initial,
  ) {
    final pointerCodec = field.codec;
    final arrayCodec = pointerCodec.inner as ArrayCodec<E, R>;
    assert(initial.length <= arrayCodec.count);
    return ._(ptrOf, field.offset, arrayCodec.count, _PointerToFixedArrayAccess<E, R>(pointerCodec), initial);
  }

  /// Pointer to an array of pointers: `T** -> T* -> T[]`.
  ///
  /// The outer list represents the array of `T*` pointers; every element
  /// is itself a live list over the `T[]` that particular `T*` points to,
  /// built lazily and cached in [nestedCache] as indices are accessed.
  static StructLiveList<StructLiveList<T, RInner>, RPointer<RInner>> pointerPointerArray<
    T,
    RInner extends RType
  >(
    MemoryPointer? Function() ptrOf,
    StructPointerArrayField<T, RPointer<RInner>> field,
    List<List<T>> initial,
  ) {
    final outerCodec = field.codec;
    final innerCodec = outerCodec.inner as PointerCodec<T, RInner>;
    final innerAccess = _ResolvedPointerAccess<T, RInner>(innerCodec);
    final nestedCache = <StructLiveList<T, RInner>>[];

    StructLiveList<T, RInner> build(int index) {
      while (nestedCache.length <= index) {
        final i = nestedCache.length;
        final initialInner = i < initial.length ? initial[i] : const <Never>[];

        nestedCache.add(._(
          () {
            final outerFieldPtr = ptrOf()?.offsetBy(field.offset);
            if (outerFieldPtr == null) return null;
            final arrayBase = outerCodec.deref(outerFieldPtr);
            if (arrayBase.isNull) return null;
            final resolved = outerCodec.pointerElementPtr(arrayBase, i);
            return resolved.isNull ? null : resolved;
          },
          0,
          null,
          innerAccess,
          initialInner,
        ));
      }
      return nestedCache[index];
    }

    return ._(ptrOf, field.offset, null, _LazyBuiltAccess<StructLiveList<T, RInner>>(build), nestedCache);
  }

  // we don't care about nullptr
  void syncFrom(MemoryPointer p, {bool borrow = true}) {
    if (!borrow) return;
    _fieldPtr()?.writePtr(p.readPtr(_offset));
  }

  // we don't care about nullptr
  void syncInto(MemoryPointer p) => p.writePtr(_derefPtr(), _offset);

  MemoryPointer? _fieldPtr([MemoryPointer? src]) => (src ?? ptrOf())?.offsetBy(_offset);

  MemoryPointer? _derefPtr([MemoryPointer? src]) => (src ?? ptrOf())?.readPtr(_offset);

  @override
  int get length => _fixedCount ?? _cache.length;

  @override
  set length(int newLength) {
    if (_fixedCount != null) throw UnsupportedError('fixed-size, length is $_fixedCount');
    _cache.length = newLength;
  }

  @override
  E operator [](int index) {
    final fp = _fieldPtr();
    if (fp != null) return _access.readAt(fp, index)!;
    return _cache[index]!;
  }

  @override
  void operator []=(int index, E value) {
    if (index >= _cache.length) _cache.length = index + 1;
    _cache[index] = value;
    final fp = _fieldPtr();
    if (fp != null) _access.writeAt(fp, index, value);
  }

  /// The current non-live cached representation. Does not force a read.
  List<E> get inner => _cache.cast();

  /// Replaces the cached representation and writes it into native memory.
  set inner(List<E> value) {
    if (_fixedCount != null) assert(value.length <= _fixedCount);
    _cache = .of(value);
    final fp = _fieldPtr();
    if (fp == null) return;
    for (var i = 0; i < value.length; i++) _access.writeAt(fp, i, value[i]);
  }

  /// Replaces only the local cache; does not touch native memory.
  set raw(List<E> value) => _cache = .of(value);

  List<E> _readLive(MemoryPointer? source, {required int? count, required bool safe}) {
    final resolvedCount = count ?? _fixedCount;
    if (resolvedCount == null) throw StateError('Expected `count`.');
    final fp = _fieldPtr(source);
    if (fp == null) return _cache.cast();
    if (fp.isNull) throw StateError('You are trying to read livelist data from a nullptr.');
    final resolved = <E>[];
    for (var i = 0; i < resolvedCount; i++) {
      final value = _access.readAt(fp, i);
      if (value == null) {
        if (!safe) throw StateError('Cannot read. Invalid memory at index $i.');
        break;
      }
      resolved.add(value);
    }
    _cache = resolved;
    return _cache.cast();
  }

  /// Force a live re-read of [count] elements, refreshing the cache.
  List<E> materialize({int? count, bool safe = false})
    => _readLive(null, count: count, safe: safe);

  /// Reads data from another struct/object pointer.
  List<E> readFrom(MemoryPointer p, {int? count, bool safe = true})
    => _readLive(p, count: count, safe: safe);

  /// Writes cached data into another struct/object pointer.
  void writeInto(MemoryPointer p, [List<E>? values]) {
    values ??= inner;
    final fp = _fieldPtr(p);
    if (fp == null) return;
    if (fp.isNull) throw StateError('You are trying to write livelist cached data into nullptr.');
    for (final (i, v) in values.indexed) _access.writeAt(fp, i, v);
  }
}

typedef StructLiveListStruct<E extends RaylibStruct<E>> = StructLiveList<E, RStruct>;

typedef StructLiveListStructNested<E extends RaylibStruct<E>> = StructLiveList<StructLiveList<E, RStruct>, RPointer<RStruct>>;

// NOTE: need to test this, feels wrong
extension StructLiveListNested<E, R extends RType> on StructLiveList<List<E>, RPointer<R>> {
  List<List<E>> get innerNested => _cache.cast();

  set innerNested(List<List<E>> value) {
    if (_fixedCount != null) assert(value.length <= _fixedCount);
    for (var i = 0; i < value.length; i++) {
      if (i >= _cache.length) this[i]; // lazily create the inner live list
      final inner = _cache[i];
      if (inner case StructLiveList inner) inner.inner = value[i];
    }
    if (_cache.length > value.length) _cache.length = value.length;
  }
}

extension LiveArrayFieldX<E, R extends RType> on StructValueField<List<E>, RArray<R>> {
  StructLiveList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .array(ptrOf, this, initial);
}

extension LivePointerArrayFieldX<E, R extends RType> on StructPointerArrayField<E, R> {
  StructLiveList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .pointerArray(ptrOf, this, initial);
}

extension LivePointerFixedArrayFieldX<E, R extends RType> on StructPointerValueField<List<E>, RArray<R>> {
  StructLiveList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .pointerFixedArray(ptrOf, this, initial);
}

extension LivePointerPointerArrayFieldX<E, R extends RType> on StructPointerArrayField<E, RPointer<R>> {
  StructLiveList<StructLiveList<E, R>, RPointer<R>> liveNested(MemoryPointer? Function() ptrOf, List<List<E>> initial)
    => .pointerPointerArray(ptrOf, this, initial);
}

extension LivePointerUnknownSyncFieldX<R extends RTypeUnknownLike> on StructPointerValueField<dynamic, R> {
  LivePointerSync<R> live(MemoryPointer? Function() ptrOf)
    => .pointerSync(ptrOf, this);
}