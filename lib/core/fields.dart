part of 'raylib_dartified_base.dart';

// NOTE: this REALLY needs to be cleaned up somehow, too much shit in here

/// A codec for a single value of type [E], stored at an [R]-typed region of
/// memory (the field's own on-struct type, for a pointer field this is
/// `RPointer<Pointee>`, not `Pointee`).
abstract class ElementCodec<E, R extends RType> {
  final R type;

  const ElementCodec(this.type);

  void _check(MemoryPointer p, String action) {
    if (p.isNull) throw StateError('You are trying to $action on a nullptr.');
  }

  E read(MemoryPointer p);

  void write(MemoryPointer p, E value);

  RaylibTempAllocator? allocator(RaylibTemp temp);

  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false}) {
    // no-op by default, most codecs (Scalar, Enum, Struct) don't own
    // pointers, so there's nothing to allocate.
  }
}

/// Opt-in capability for codecs whose values sit at a fixed byte stride, so
/// a contiguous run of them can be read/written in one call. Not every
/// [ElementCodec] can do this (e.g. [StringCodec] has no fixed stride),
/// this is deliberately separate from the base contract rather than forced
/// on every codec.
mixin ContiguousCodec<E, R extends RType> on ElementCodec<E, R> {
  List<E> readArray(MemoryPointer p, int count);

  void writeArray(MemoryPointer p, List<E> values);
}

class StringCodec<R extends RTypeIntLike> extends ElementCodec<String, R> {
  const StringCodec(super.type);

  @override
  String read(MemoryPointer p) {
    _check(p, 'read string');
    return switch (type) {
      RInt8() => p.cast<RInt8>().toDartString(),
      RInt16() => p.cast<RInt16>().toDartString(),
      RInt32() => p.cast<RInt32>().toDartString(),
      _ => throw UnsupportedError("Invalid type $R for reading a string value."),
    };
  }

  String readString(MemoryPointer<R> p, int maxLength) {
    _check(p, 'readString');
    return switch (type) {
      RInt8() => p.cast<RInt8>().toDartString(maxLength),
      RInt16() => p.cast<RInt16>().toDartString(maxLength),
      RInt32() => p.cast<RInt32>().toDartString(maxLength),
      _ => throw UnsupportedError("Invalid type $R for reading a string value."),
    };
  }

  @override
  void write(MemoryPointer p, String value) {
    _check(p, 'write string');
    return switch (type) {
      RInt8() => p.cast<RInt8>().writeString(value),
      RInt16() => p.cast<RInt16>().writeString(value),
      RInt32() => p.cast<RInt32>().writeString(value),
      _ => throw UnsupportedError("Invalid type $R for writing a string value."),
    };
  }

  void writeString(MemoryPointer<R> p, String value, int maxLength) {
    _check(p, 'writeString');
    return switch (type) {
      RInt8() => p.cast<RInt8>().writeString(value, maxLength),
      RInt16() => p.cast<RInt16>().writeString(value, maxLength),
      RInt32() => p.cast<RInt32>().writeString(value, maxLength),
      _ => throw UnsupportedError("Invalid type $R for writing a string value."),
    };
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => temp.String$;
}

class ScalarCodec<E, R extends RType>
  extends ElementCodec<E, R>
  with ContiguousCodec<E, R>
{
  const ScalarCodec(super.type);

  @override
  E read(MemoryPointer p) {
    _check(p, 'read scalar');
    return type.read(p, 0);
  }

  @override
  void write(MemoryPointer p, E value) {
    _check(p, 'write scalar');
    type.write(p, 0, value);
  }

  @override
  List<E> readArray(MemoryPointer p, int count) {
    _check(p, 'read scalar array');
    final stride = type.byteSize;
    return .generate(count, (i) => type.read(p, i * stride));
  }

  @override
  void writeArray(MemoryPointer p, List<E> values) {
    _check(p, 'write scalar array');
    final stride = type.byteSize;
    for (var i = 0; i < values.length; i++) {
      type.write(p, i * stride, values[i]);
    }
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => temp.scalarAlloc<R>();
}

class EnumCodec<E extends RaylibEnum, R extends RType>
  extends ElementCodec<E, R>
  with ContiguousCodec<E, R>
{
  final E Function(int) enumFactory;

  const EnumCodec(super.type, this.enumFactory);

  @override
  E read(MemoryPointer p) {
    _check(p, 'read enum');
    return enumFactory(type.read(p, 0));
  }

  @override
  void write(MemoryPointer p, E value) {
    _check(p, 'write enum');
    type.write(p, 0, value.value);
  }

  @override
  List<E> readArray(MemoryPointer p, int count) {
    _check(p, 'read enum array');
    final stride = type.byteSize;
    return .generate(count, (i) => enumFactory(type.read(p, i * stride)));
  }

  @override
  void writeArray(MemoryPointer p, List<E> values) {
    _check(p, 'write enum array');
    final stride = type.byteSize;
    for (var i = 0; i < values.length; i++) {
      type.write(p, i * stride, values[i].value);
    }
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => temp.scalarAlloc<R>();
}

/// A single pointer to unknown value. Typically for [RType]s like [RVoid] or [ROpaque].
class UnknownCodec<E, R extends RType> extends ElementCodec<E, R> {
  UnknownCodec(super.type);

  @override
  RaylibTempAllocator allocator(RaylibTemp temp) => temp._pointerAllocator;

  @override
  E read(MemoryPointer p)
    => throw UnsupportedError('Cannot read unknown value.');

  @override
  void write(MemoryPointer p, E value)
    => throw UnsupportedError('Cannot write unknown value.');
}

/// A single pointer to one [E] value.
///
/// [type] is the [RPointer<R>] describing the pointer field itself;
/// [inner] decodes whatever the pointer points to.
///
/// Two unrelated "array-ish" abilities live here:
///
///  - [readArray]/[writeArray] operate on a contiguous array of pointer
///    slots, e.g. `void* xs[8]`.
///
///  - [readAt]/[writeAt] index into the array pointed to by a single
///    pointer, e.g. `T* xs`.
class PointerCodec<E, R extends RType>
  extends ElementCodec<E, RPointer<R>>
  with ContiguousCodec<E, RPointer<R>>
{
  final ElementCodec<E, R> inner;

  const PointerCodec(super.type, this.inner);

  /// Dereference a pointer field.
  MemoryPointer<Y> deref<Y extends RType>(MemoryPointer p) => p.readPtr();

  bool isValid(MemoryPointer p) => !deref(p).isNull;

  @override
  E read(MemoryPointer p) {
    _check(p, 'read pointer');

    return inner.read(deref(p));
  }

  E readSafe(MemoryPointer p, E fallback) {
    final ref = deref(p);
    if (ref.isNull) return fallback;
    return inner.read(ref);
  }

  @override
  void write(MemoryPointer p, E value)
    => inner.write(deref(p), value);

  void writeSafe(MemoryPointer p, E value) {
    final ref = deref(p);
    if (ref.isNull) return;
    inner.write(ref, value);
  }

  @override
  List<E> readArray(MemoryPointer p, int count) {
    _check(p, 'read pointer array');
    return .generate(count,
      (i) => inner.read(deref(p.offsetBy(i * RType.nativeWordSize))),
    );
  }

  @override
  void writeArray(MemoryPointer p, List<E> values) {
    _check(p, 'write pointer array');
    for (var i = 0; i < values.length; i++) {
      inner.write(deref(p.offsetBy(i * RType.nativeWordSize)), values[i]);
    }
  }

  /// Address of element [index] in the array pointed to by this pointer.
  ///
  /// For:
  ///
  ///     T* p
  ///
  /// this means:
  ///
  ///     p[index]
  ///
  /// and therefore:
  ///
  ///     *p + index * sizeof(T)
  MemoryPointer<R> elementPtr(MemoryPointer fieldPtr, int index)
    => deref(fieldPtr).offsetBy(index * type.target.byteSize);

  /// Address stored in pointer slot [index].
  ///
  /// For:
  ///
  ///     T** p
  ///
  /// this means:
  ///
  ///     p[index]
  ///
  /// where every [p[index]] is itself a `T*`.
  ///
  /// This is intentionally different from [elementPtr].
  MemoryPointer<R> pointerElementPtr(MemoryPointer fieldPtr, int index)
    => fieldPtr.offsetBy(index * RType.nativeWordSize).readPtr();

  E readAt(MemoryPointer fieldPtr, int index)
    => inner.read(elementPtr(fieldPtr, index));

  E writeAt(MemoryPointer fieldPtr, int index, E value) {
    inner.write(elementPtr(fieldPtr, index), value);
    return value;
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => temp._pointerAllocator;

  @override
  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false}) {
    if (!deref(p).isNull) return;
    final alloc = inner.allocator(temp);
    if (alloc == null) throw StateError('No allocator for ${inner.runtimeType}');
    final block = raw ? alloc.Raw(count) : alloc.At(key, count);
    p.writePtr(block);
    inner.allocate(temp, block, '${key}_inner', count: count, raw: raw);
  }
}

class ArrayCodec<E, R extends RType>
  extends ElementCodec<List<E>, RArray<R>>
  with ContiguousCodec<List<E>, RArray<R>>
{
  final ContiguousCodec<E, R> inner;
  final int count;

  const ArrayCodec(super.type, this.inner, this.count);

  @override
  List<E> read(MemoryPointer p) => inner.readArray(p, count);

  @override
  void write(MemoryPointer p, List<E> values) {
    if (values.length != count) throw ArgumentError('Expected $count, got ${values.length}');
    inner.writeArray(p, values);
  }

  @override
  List<List<E>> readArray(MemoryPointer p, int count) {
    // count groups of `this.count` contiguous elements, read them all in one
    // flat pass (so stride/byteSize logic stays entirely in `inner`) and chunk.
    final flat = inner.readArray(p, count * this.count);
    return .generate(
      count,
      (i) => flat.sublist(i * this.count, (i + 1) * this.count),
    );
  }

  @override
  void writeArray(MemoryPointer p, List<List<E>> values) {
    final flat = <E>[];
    for (final group in values) {
      if (group.length != count) {
        throw ArgumentError('Expected $count elements per group, got ${group.length}.');
      }
      flat.addAll(group);
    }
    inner.writeArray(p, flat);
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => inner.allocator(temp);

  @override
  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false}) {
    for (var i = 0; i < count; i++) {
      for (var j = 0; j < this.count; j++) {
        inner.allocate(temp,
          p.offsetBy((i * this.count + j) * inner.type.byteSize),
          '${key}_${i}_$j',
          count: 1,
          raw: raw,
        );
      }
    }
  }

  MemoryPointer<R> elementPtr(MemoryPointer fieldPtr, int index)
    => fieldPtr.offsetBy(index * type.element.byteSize);

  E readAt(MemoryPointer fieldPtr, int index) => inner.read(elementPtr(fieldPtr, index));

  E writeAt(MemoryPointer fieldPtr, int index, E value) {
    inner.write(elementPtr(fieldPtr, index), value);
    return value;
  }
}

class StructCodec<E extends RaylibStruct<E>> extends ElementCodec<E, RStruct>
    with ContiguousCodec<E, RStruct> {
  final StructPointerFactory<E> pointer;

  const StructCodec(super.type, this.pointer);

  @override
  E read(MemoryPointer p) {
    _check(p, 'read struct');
    return pointer(p).owned(0);
  }

  @override
  void write(MemoryPointer p, E value) {
    _check(p, 'write struct');
    pointer(p)[0] = value;
  }

  @override
  List<E> readArray(MemoryPointer p, int count) {
    _check(p, 'read struct array');
    return pointer(p).readArray(count, owned: true);
  }

  @override
  void writeArray(MemoryPointer p, List<E> values) {
    _check(p, 'write struct array');
    pointer(p).writeArray(values);
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => temp.structAlloc<E>();
}

abstract class StructFieldBase<E> {
  final int offset;

  const StructFieldBase(this.offset);

  E read(MemoryPointer p);

  E readOr(MemoryPointer? p, E fallback) => p == null ? fallback : read(p);

  E write(MemoryPointer p, E value);

  E writeIf(MemoryPointer? p, E value) {
    if (p != null) write(p, value);
    return value;
  }

  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false});
}

class StructValueField<E, R extends RType> extends StructFieldBase<E> {
  final ElementCodec<E, R> codec;

  const StructValueField(super.offset, this.codec);

  @override
  E read(MemoryPointer p) => codec.read(p.offsetBy(offset));

  @override
  E write(MemoryPointer p, E value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }

  @override
  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false}) {
    // no-op
  }
}

/// A pointer-or-array-to-string-value field. Holds a [StringCodec] concretely.
class StructStringValueField<R extends RTypeIntLike> extends StructFieldBase<String> {
  final StringCodec<R> codec;

  const StructStringValueField(super.offset, this.codec);

  @override
  String read(MemoryPointer p)
    => codec.read(p.offsetBy(offset));

  String readBounded(MemoryPointer p, int maxLength)
    => codec.readString(p.cast(), maxLength);

  @override
  String write(MemoryPointer p, String value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }

  @override
  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false}) {
    codec.allocate(temp, p.offsetBy(offset), key, count: count, raw: raw);
  }
}

/// A pointer-to-single-value field. Holds a [PointerCodec] concretely, no
/// casting, since a pointer field's on-struct type genuinely differs from
/// [StructValueField]'s `R` slot (it's `RPointer<R>`, not `R`).
class StructPointerValueField<E, R extends RType> extends StructFieldBase<E> {
  final PointerCodec<E, R> codec;

  const StructPointerValueField(super.offset, this.codec);

  @override
  E read(MemoryPointer p) => codec.read(p.offsetBy(offset));

  @override
  E write(MemoryPointer p, E value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }

  E readSafe(MemoryPointer p, E fallback)
    => codec.readSafe(p.offsetBy(offset), fallback);

  void writeSafe(MemoryPointer p, E value)
    => codec.writeSafe(p.offsetBy(offset), value);

  @override
  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false}) {
    codec.allocate(temp, p.offsetBy(offset), key, count: count, raw: raw);
  }
}

/// A pointer to a variable-length run of [E], length is runtime-only, so
/// there's no plain `read`/`write`; callers must supply the count they know
/// about externally via [readCount]/[writeCount].
class StructPointerArrayField<E, R extends RType> extends StructFieldBase<List<E>> {
  final PointerCodec<E, R> codec;

  const StructPointerArrayField(super.offset, this.codec);

  @override
  List<E> read(MemoryPointer p)
    => throw UnsupportedError('Length is runtime-determined, use `readCount`.');

  @override
  List<E> write(MemoryPointer p, List<E> value)
    => throw UnsupportedError('Length is runtime-determined, use `writeCount`.');

  List<E> readCountOr(MemoryPointer? p, int count, [List<E>? fallback]) {
    if (p == null) return fallback ?? [];
    return readCount(p, count, fallback);
  }

  List<E> readCount(MemoryPointer p, int count, [List<E>? fallback]) {
    final ref = codec.deref(p.offsetBy(offset));
    if (ref.isNull) return fallback ?? [];
    return _innerArray().readArray(ref, count);
  }

  List<E> writeCount(MemoryPointer p, List<E> values) {
    final ref = codec.deref(p.offsetBy(offset));
    _innerArray().writeArray(ref, values);
    return values;
  }

  List<E> writeCountIf(MemoryPointer? p, List<E> fallback) {
    if (p == null) return fallback;
    final ref = codec.deref(p.offsetBy(offset));
    _innerArray().writeArray(ref, fallback);
    return fallback;
  }

  ContiguousCodec<E, R> _innerArray() {
    final inner = codec.inner;
    if (inner is ContiguousCodec<E, R>) return inner;
    throw StateError(
      '${inner.runtimeType} has no contiguous array support; '
      'index element-by-element via codec.readAt/writeAt instead.',
    );
  }

  @override
  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false}) {
    codec.allocate(temp, p.offsetBy(offset), key, count: count, raw: raw);
  }
}

class LivePointerSync<R extends RType> {
  final MemoryPointer? Function() _ptrOf;
  final int _offset;

  LivePointerSync._(
    this._ptrOf,
    this._offset
  );

  MemoryPointer<R> fieldPtr()
    => _ptrOf()?.offsetBy(_offset) ?? MemoryPointer.nullptr.cast();

  MemoryPointer<Y> derefPtr<Y extends RType>()
    => _ptrOf()?.offsetBy(_offset).readPtr() ?? MemoryPointer.nullptr.cast();

  factory LivePointerSync.pointerSync(
    MemoryPointer? Function() ptrOf,
    StructPointerValueField<dynamic, R> field,
  ) => ._(ptrOf, field.offset);

  // we don't care about nullptr
  void readFrom(MemoryPointer p, {bool borrow = true}) {
    if (!borrow) return;
    fieldPtr().writePtr(p.offsetBy(_offset).readPtr());
  }

  // we don't care about nullptr
  void writeInto(MemoryPointer p)
    => p.offsetBy(_offset).writePtr(derefPtr());
}

class LiveStructList<E, R extends RType> extends ListMixin<E> {
  /// Returns the memory pointer representing the object containing this list.
  ///
  /// For a normal struct field this is the struct pointer.
  /// For a nested live list this may instead return the actual array pointer.
  final MemoryPointer? Function() ptrOf;

  final int _offset;
  final int? _fixedCount;

  final E? Function(MemoryPointer fieldPtr, int index) _readAt;
  final void Function(MemoryPointer fieldPtr, int index, E value) _writeAt;

  List<E> _cache;

  LiveStructList._(
    this.ptrOf,
    this._offset,
    this._fixedCount,
    this._readAt,
    this._writeAt,
    List<E> initial,
  ) : _cache = .of(initial);

  /// Creates a live list directly from an already-resolved pointer.
  ///
  /// Unlike the other factories, [ptrOf] here points directly at the
  /// beginning of the array represented by this list. Therefore [offset]
  /// is always zero.
  factory LiveStructList.live(
    MemoryPointer? Function() ptrOf, {
    int? fixedCount,
    required E? Function(MemoryPointer fieldPtr, int index) readAt,
    required void Function(MemoryPointer fieldPtr, int index, E value) writeAt,
    List<E> initial = const [],
  }) => ._(ptrOf, 0, fixedCount, readAt, writeAt, initial);

  /// Fixed-size inline array field.
  factory LiveStructList.array(
    MemoryPointer? Function() ptrOf,
    StructValueField<List<E>, RArray<R>> field,
    List<E> initial,
  ) {
    final codec = field.codec as ArrayCodec<E, R>;

    assert(initial.length <= codec.count);

    return ._(ptrOf, field.offset, codec.count,
      (fp, i) {
        final sub = codec.elementPtr(fp, i);
        if (sub.isNull) return null;
        return codec.readAt(fp, i);
      },
      (fp, i, v) => codec.writeAt(fp, i, v),
      initial,
    );
  }

  /// Pointer to a variable-size array.
  factory LiveStructList.pointerArray(
    MemoryPointer? Function() ptrOf,
    StructPointerArrayField<E, R> field,
    List<E> initial,
  ) {
    final codec = field.codec;

    return ._(ptrOf, field.offset, null,
      (fp, i) {
        final sub = codec.elementPtr(fp, i);
        if (sub.isNull) return null;
        return codec.readAt(fp, i);
      },
      (fp, i, v) => codec.writeAt(fp, i, v),
      initial,
    );
  }

  /// Pointer to a fixed-size array.
  factory LiveStructList.pointerFixedArray(
    MemoryPointer? Function() ptrOf,
    StructPointerValueField<List<E>, RArray<R>> field,
    List<E> initial,
  ) {
    final pointerCodec = field.codec;
    final arrayCodec = pointerCodec.inner as ArrayCodec<E, R>;

    assert(initial.length <= arrayCodec.count);

    return ._(ptrOf, field.offset, arrayCodec.count,
      (fp, i) {
        final sub = pointerCodec.elementPtr(fp, i);
        if (sub.isNull) return null;
        return arrayCodec.readAt(pointerCodec.deref(fp), i);
      },
      (fp, i, v) => arrayCodec.writeAt(pointerCodec.deref(fp), i, v),
      initial,
    );
  }

  /// Pointer to an array of pointers.
  ///
  /// Conceptually:
  ///
  ///     T** -> T* -> T[]
  ///
  /// The outer list represents the array of T* pointers.
  /// Every element of that outer list is itself a live list representing
  /// the T[] pointed to by that particular T*.
  static LiveStructList<LiveStructList<T, RInner>, RPointer<RInner>> pointerPointerArray<
    T,
    RInner extends RType
  >(
    MemoryPointer? Function() ptrOf,
    StructPointerArrayField<T, RPointer<RInner>> field,
    List<List<T>> initial,
  ) {
    final outerCodec = field.codec;
    final innerCodec = outerCodec.inner as PointerCodec<T, RInner>;
    final nestedCache = <LiveStructList<T, RInner>>[];

    late final LiveStructList<LiveStructList<T, RInner>, RPointer<RInner>> result;

    result = .live(ptrOf,
      readAt: (_, index) {
        while (nestedCache.length <= index) {
          final innerIndex = nestedCache.length;
          final initialInner = innerIndex < initial.length ? initial[innerIndex] : [];

          final LiveStructList<T, RInner> innerList = .live(
            () {
              final base = ptrOf()?.offsetBy(field.offset).readPtr();
              return base == null ? null : innerCodec.pointerElementPtr(base, innerIndex);
            },

            readAt: (fp, eIndex) {
              final ePtr = fp.offsetBy(eIndex * innerCodec.type.target.byteSize);
              return innerCodec.inner.read(ePtr);
            },
            writeAt: (fp, eIndex, value) {
              final ePtr = fp.offsetBy(eIndex * innerCodec.type.target.byteSize);
              innerCodec.inner.write(ePtr, value);
            },

            initial: .from(initialInner),
          );

          nestedCache.add(innerList);
        }

        return nestedCache[index];
      },
      writeAt: (_, i, value) {
        nestedCache[i].inner = value.inner;
        // throw UnsupportedError(
        //   'Cannot assign a nested LiveStructList as a value. '
        //   'Modify the inner list returned by operator [].',
        // );
      },
      initial: nestedCache,
    );

    return result;
  }

  // we don't care about nullptr
  void syncFrom(MemoryPointer p, {bool borrow = true}) {
    if (!borrow) return;
    _fieldPtr()?.writePtr(p.offsetBy(_offset).readPtr());
  }

  // we don't care about nullptr
  void syncInto(MemoryPointer p)
    => p.offsetBy(_offset).writePtr(_derefPtr());

  MemoryPointer? _fieldPtr([MemoryPointer? src]) {
    return (src ?? ptrOf())?.offsetBy(_offset);
  }

  MemoryPointer? _derefPtr([MemoryPointer? src]) {
    return (src ?? ptrOf())?.offsetBy(_offset).readPtr();
  }

  @override
  int get length => _fixedCount ?? _cache.length;

  @override
  set length(int newLength) {
    if (_fixedCount != null) {
      throw UnsupportedError('fixed-size, length is $_fixedCount');
    }
    _cache.length = newLength;
  }

  @override
  E operator [](int index) {
    final fp = _fieldPtr();
    if (fp != null) return _readAt(fp, index)!;
    return _cache[index];
  }

  @override
  void operator []=(int index, E value) {
    if (index >= _cache.length) _cache.length = index + 1;
    _cache[index] = value;
    final fp = _fieldPtr();
    if (fp != null) _writeAt(fp, index, value);
  }

  /// The current non-live cached representation.
  ///
  /// This does not force a read from native memory.
  List<E> get inner => _cache;

  /// Replaces the cached representation and writes it into native memory.
  set inner(List<E> value) {
    if (_fixedCount != null) assert(value.length <= _fixedCount);
    _cache = .of(value);
    final fp = _fieldPtr();
    if (fp == null) return;
    for (var i = 0; i < value.length; i++) _writeAt(fp, i, value[i]);
  }

  /// Replaces only the local cache.
  ///
  /// Unlike [inner], this does not write anything to native memory.
  set raw(List<E> value) => _cache = .of(value);

  /// Force a live re-read of [count] elements, refreshing the cache.
  List<E> materialize({int? count, bool safe = true}) {
    final int? resolvedCount = count ?? _fixedCount;
    if (resolvedCount == null) throw StateError('Expected `count` for `materialize`.');
    final fp = _fieldPtr();
    if (fp == null) return _cache;
    final resolved = <E>[];
    for (int i = 0; i < resolvedCount; i++) {
      final value = _readAt(fp, i);
      if (value == null) {
        if (!safe) throw StateError('Cannot materialize. Invalid memory at index $i.');
        break;
      } else {
        resolved.add(value);
      }
    }
    _cache = resolved;
    return _cache;
  }

  /// Writes cached data into another struct/object pointer.
  void writeInto(MemoryPointer p, [ List<E>? values ]) {
    values ??= inner;
    final fp = _fieldPtr(p);
    if (fp == null) return;
    if (fp.isNull) throw StateError('You are trying to write livelist cached data into nullptr.');
    for (final (i, v) in values.indexed) _writeAt(fp, i, v);
  }

  /// Reads data from another struct/object pointer.
  List<E> readFrom(MemoryPointer p, {int? count, bool safe = true}) {
    final int? resolvedCount = count ?? _fixedCount;
    if (resolvedCount == null) throw StateError('Expected `count` for `readFrom`.');
    final fp = _fieldPtr(p);
    if (fp == null) return _cache;
    if (fp.isNull) throw StateError('You are trying to read into livelist from a nullptr.');
    final resolved = <E>[];
    for (int i = 0; i < resolvedCount; i++) {
      final value = _readAt(fp, i);
      if (value == null) {
        if (!safe) throw StateError('Cannot readFrom. Invalid memory at index $i.');
        break;
      } else {
        resolved.add(value);
      }
    }
    _cache = resolved;
    return _cache;
  }
}

extension ListStructListNested<E, R extends RType> on LiveStructList<List<E>, RPointer<R>> {
  List<List<E>> get innerNested => _cache;

  set innerNested(List<List<E>> value) {
    if (_fixedCount != null) assert(value.length <= _fixedCount);
    for (var i = 0; i < value.length; i++) {
      if (i >= _cache.length) this[i]; // lazily create the inner live list
      final inner = _cache[i];
      if (inner case LiveStructList inner) inner.inner = value[i];
    }
    if (_cache.length > value.length) _cache.length = value.length;
  }
}

extension LiveArrayFieldX<E, R extends RType> on StructValueField<List<E>, RArray<R>> {
  LiveStructList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .array(ptrOf, this, initial);
}

extension LivePointerArrayFieldX<E, R extends RType> on StructPointerArrayField<E, R> {
  LiveStructList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .pointerArray(ptrOf, this, initial);
}

extension LivePointerFixedArrayFieldX<E, R extends RType> on StructPointerValueField<List<E>, RArray<R>> {
  LiveStructList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .pointerFixedArray(ptrOf, this, initial);
}

extension LivePointerPointerArrayFieldX<E, R extends RType> on StructPointerArrayField<E, RPointer<R>> {
  LiveStructList<LiveStructList<E, R>, RPointer<R>> liveNested(MemoryPointer? Function() ptrOf, List<List<E>> initial)
    => .pointerPointerArray(ptrOf, this, initial);
}

extension LivePointerUnknownSyncFieldX<R extends RTypeUnknownLike> on StructPointerValueField<dynamic, R> {
  LivePointerSync<R> live(MemoryPointer? Function() ptrOf)
    => .pointerSync(ptrOf, this);
}

extension LivePointerSyncFieldX<E, R extends RType> on StructPointerValueField<E, R> {
  LivePointerSync<R> live(MemoryPointer? Function() ptrOf)
    => .pointerSync(ptrOf, this);
}