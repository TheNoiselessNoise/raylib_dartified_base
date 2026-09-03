part of 'raylib_dartified_base.dart';

abstract class ElementCodec<E, R extends RType> {
  final R type;

  const ElementCodec(this.type);

  void _check(MemoryPointer p, String action) {
    if (p.isNull) throw StateError('You are trying to $action on a nullptr.');
  }

  E read(MemoryPointer p);

  void write(MemoryPointer p, E value);

  List<E> readArray(MemoryPointer p, int count);

  void writeArray(MemoryPointer p, List<E> values);

  RaylibTempAllocator? allocator(RaylibTemp temp);

  void allocate(RaylibTemp temp, MemoryPointer p, String key, [int count = 1]) {
    // no-op by default, most codecs (Scalar, Enum, Struct) don't own
    // pointers, so there's nothing to allocate.
  }
}

abstract mixin class IndexedCodec<E, R extends RType> {
  /// Address of element [index], given the codec's own field pointer
  /// (i.e. the struct-relative pointer, pre-dereference).
  MemoryPointer<R> elementPtr(MemoryPointer fieldPtr, int index);

  E readAt(MemoryPointer fieldPtr, int index)
    => elementRead(elementPtr(fieldPtr, index));
  
  E writeAt(MemoryPointer fieldPtr, int index, E value) {
    elementWrite(elementPtr(fieldPtr, index), value);
    return value;
  }

  E elementRead(MemoryPointer<R> p);
 
  void elementWrite(MemoryPointer<R> p, E value);
}

class StringCodec<R extends RType> extends ElementCodec<String, R> {
  const StringCodec(super.type);

  @override
  String read(MemoryPointer p) {
    _check(p, 'read string');
    return switch (R) {
      const (RInt8) => p.cast<RInt8>().toDartString(),
      const (RInt16) => p.cast<RInt16>().toDartString(),
      const (RInt32) => p.cast<RInt32>().toDartString(),
      _ => throw UnsupportedError("Invalid type $R for reading a string value."),
    };
  }

  String readString(MemoryPointer<R> p, int maxLength) {
    _check(p, 'readString');
    return switch (R) {
      const (RInt8) => p.cast<RInt8>().toDartStringBounded(maxLength),
      const (RInt16) => p.cast<RInt16>().toDartStringBounded(maxLength),
      const (RInt32) => p.cast<RInt32>().toDartStringBounded(maxLength),
      _ => throw UnsupportedError("Invalid type $R for reading a string value."),
    };
  }

  @override
  List<String> readArray(MemoryPointer p, int count)
    => throw UnsupportedError("Invalid operation `readArray` for a $runtimeType.");

  @override
  void write(MemoryPointer p, String value) {
    _check(p, 'write string');
    return switch (R) {
      const (RInt8) => p.cast<RInt8>().writeString(value),
      const (RInt16) => p.cast<RInt16>().writeString(value),
      const (RInt32) => p.cast<RInt32>().writeString(value),
      _ => throw UnsupportedError("Invalid type $R for reading a string value."),
    };
  }

  void writeString(MemoryPointer<R> p, String value, int maxLength) {
    _check(p, 'writeString');
    return switch (R) {
      const (RInt8) => p.cast<RInt8>().writeString(value, maxLength),
      const (RInt16) => p.cast<RInt16>().writeString(value, maxLength),
      const (RInt32) => p.cast<RInt32>().writeString(value, maxLength),
      _ => throw UnsupportedError("Invalid type $R for reading a string value."),
    };
  }

  @override
  void writeArray(MemoryPointer p, List<String> values)
    => throw UnsupportedError("Invalid operation `writeArray` for a $runtimeType.");

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp)
    => temp.String$;
}

class ScalarCodec<E, R extends RType> extends ElementCodec<E, R> {
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
  RaylibTempAllocator? allocator(RaylibTemp temp)
    => temp.scalarAlloc<R>();
}

class EnumCodec<E extends RaylibEnum, R extends RType> extends ElementCodec<E, R> {
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
  RaylibTempAllocator? allocator(RaylibTemp temp)
    => temp.scalarAlloc<R>();
}

class PointerCodec<E, R extends RType>
  extends ElementCodec<E, RPointer<R>>
  with IndexedCodec<E, R>
{
  final ElementCodec<E, R> inner;

  const PointerCodec(super.type, this.inner);

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
  void write(MemoryPointer p, E value) {
    _check(p, 'write pointer');
    inner.write(deref(p), value);
  }

  void writeSafe(MemoryPointer p, E value) {
    final ref = deref(p);
    if (ref.isNull) return;
    return inner.write(ref, value);
  }

  @override
  List<E> readArray(MemoryPointer p, int count) => List.generate(
    count,
    (i) => inner.read(deref(p.offsetBy(i * RType.nativeWordSize))),
  );

  @override
  void writeArray(MemoryPointer p, List<E> values) {
    for (var i = 0; i < values.length; i++) {
      inner.write(
        deref(p.offsetBy(i * RType.nativeWordSize)),
        values[i],
      );
    }
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => temp._pointerAllocator;

  @override
  void allocate(RaylibTemp temp, MemoryPointer p, String key, [int count = 1]) {
    if (!deref(p).isNull) return;
    final alloc = inner.allocator(temp);
    if (alloc == null) throw StateError('No allocator for ${inner.runtimeType}');
    final block = alloc.At(key, count);
    p.writePtr(block);
    inner.allocate(temp, block, '${key}_inner', count);
  }

  // indexed codec

  @override
  MemoryPointer<R> elementPtr(MemoryPointer fieldPtr, int index)
    => deref(fieldPtr).offsetBy(index * type.target.byteSize);

  @override
  E elementRead(MemoryPointer<R> p)
    => inner.read(p);

  @override
  void elementWrite(MemoryPointer<R> p, E value)
    => inner.write(p, value);
}

class ArrayCodec<E, R extends RType>
  extends ElementCodec<List<E>, RArray<R>>
  with IndexedCodec<E, R>
{
  final ElementCodec<E, R> inner;
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
    return List.generate(
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
  RaylibTempAllocator? allocator(RaylibTemp temp)
    => inner.allocator(temp);

  @override
  void allocate(RaylibTemp temp, MemoryPointer p, String key, [int count = 1]) {
    for (var i = 0; i < count; i++) {
      for (var j = 0; j < this.count; j++) {
        inner.allocate(temp, p.offsetBy((i * this.count + j) * inner.type.byteSize), '${key}_${i}_$j', 1);
      }
    }
  }

  // indexed codec

  @override
  MemoryPointer<R> elementPtr(MemoryPointer fieldPtr, int index)
    => fieldPtr.offsetBy(index * type.element.byteSize);

  @override
  E elementRead(MemoryPointer<R> p)
    => inner.read(p);

  @override
  void elementWrite(MemoryPointer<R> p, E value)
    => inner.write(p, value);
}

class StructCodec<E extends RaylibStruct<E>> extends ElementCodec<E, RStruct> {
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
    return pointer(p).readArray(count);
  }

  @override
  void writeArray(MemoryPointer p, List<E> values) {
    _check(p, 'write struct array');
    pointer(p).writeArray(values);
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp)
    => temp.structAlloc<E>();
}

abstract class StructFieldBase<E> {
  const StructFieldBase();

  E read(MemoryPointer p);

  E readOr(MemoryPointer? p, E fallback)
    => p == null ? fallback : read(p);

  E write(MemoryPointer p, E value);

  E writeIf(MemoryPointer? p, E value) {
    if (p != null) write(p, value);
    return value;
  }
}

class StructValueField<E, R extends RType> extends StructFieldBase<E> {
  final int offset;
  final ElementCodec<E, R> codec;

  const StructValueField(this.offset, this.codec);

  @override
  E read(MemoryPointer p)
    => codec.read(p.offsetBy(offset));

  @override
  E write(MemoryPointer p, E value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }
}

class StructPointerValueField<E, R extends RType> extends StructValueField<E, R> {
  const StructPointerValueField(super.offset, super.codec);

  E readSafe(MemoryPointer p, E fallback) {
    if (codec case PointerCodec<E, R> pcodec) {
      return pcodec.readSafe(p, fallback);
    }
    return super.read(p);
  }

  void writeSafe(MemoryPointer p, E value) {
    if (codec case PointerCodec<E, R> pcodec) {
      pcodec.writeSafe(p, value);
      return;
    }
    super.write(p, value);
  }
}

class StructPointerArrayField<E, R extends RType> extends StructFieldBase<List<E>> {
  final int offset;
  final PointerCodec<E, R> codec;

  const StructPointerArrayField(this.offset, this.codec);

  @override
  List<E> read(MemoryPointer p)
    => throw UnsupportedError('Length is runtime-determined, use `readCount`.');

  @override
  List<E> write(MemoryPointer p, List<E> values)
    => throw UnsupportedError('Length is runtime-determined, use `writeCount`.');

  List<E> readCountOr(MemoryPointer? p, int count, List<E> fallback) {
    if (p == null) return fallback;
    return readCount(p, count, fallback);
  }

  List<E> readCount(MemoryPointer p, int count, List<E> fallback) {
    final ref = codec.deref(p.offsetBy(offset));
    if (ref.isNull) return fallback;
    return codec.inner.readArray(ref, count);
  }

  List<E> writeCount(MemoryPointer p, List<E> values) {
    final ref = codec.deref(p.offsetBy(offset));
    codec.inner.writeArray(ref, values);
    return values;
  }

  List<E> writeCountIf(MemoryPointer? p, List<E> fallback) {
    if (p == null) return fallback;
    final ref = codec.deref(p.offsetBy(offset));
    codec.inner.writeArray(ref, fallback);
    return fallback;
  }
}

class LiveStructList<E, R extends RType> extends ListMixin<E> {
  final MemoryPointer? Function() _ptrOf;
  final int _offset;
  final int? _fixedCount;
  final E Function(MemoryPointer fieldPtr, int index) _readAt;
  final void Function(MemoryPointer fieldPtr, int index, E value) _writeAt;
  List<E> _cache;

  LiveStructList._(
    this._ptrOf,
    this._offset,
    this._fixedCount,
    this._readAt,
    this._writeAt,
    List<E> initial,
  ) : _cache = .of(initial);

  /// Fixed-size inline array field.
  factory LiveStructList.array(
    MemoryPointer? Function() ptrOf,
    StructValueField<List<E>, RArray<R>> field,
    List<E> initial,
  ) {
    final codec = field.codec as ArrayCodec<E, R>;
    assert(initial.length <= codec.count);
    return ._(
      ptrOf, field.offset, codec.count,
      (fp, i) => codec.readAt(fp, i),
      (fp, i, v) => codec.writeAt(fp, i, v),
      initial,
    );
  }

  /// Pointer to an open-ended run of elements; no known count, caller owns length.
  factory LiveStructList.pointer(
    MemoryPointer? Function() ptrOf,
    StructValueField<E, RPointer<R>> field,
    List<E> initial,
  ) {
    final codec = field.codec as PointerCodec<E, R>;
    return ._(
      ptrOf, field.offset, null,
      (fp, i) => codec.readAt(fp, i),
      (fp, i, v) => codec.writeAt(fp, i, v),
      initial,
    );
  }

  /// Pointer to a variable-size array.
  factory LiveStructList.pointerArray(
    MemoryPointer? Function() ptrOf,
    StructValueField<List<E>, RPointer<R>> field,
    List<E> initial,
  ) {
    final pointerCodec = field.codec as PointerCodec<E, R>;
    return ._(
      ptrOf, field.offset, null,
      (fp, i) => pointerCodec.readAt(fp, i),
      (fp, i, v) => pointerCodec.writeAt(fp, i, v),
      initial,
    );
  }

  /// Pointer to a fixed-size array.
  factory LiveStructList.pointerFixedArray(
    MemoryPointer? Function() ptrOf,
    StructValueField<List<E>, RPointer<RArray<R>>> field,
    List<E> initial,
  ) {
    final pointerCodec = field.codec as PointerCodec<List<E>, RArray<R>>;
    final arrayCodec = pointerCodec.inner as ArrayCodec<E, R>;
    assert(initial.length <= arrayCodec.count);
    return ._(
      ptrOf, field.offset, arrayCodec.count,
      (fp, i) => arrayCodec.readAt(pointerCodec.deref(fp), i),
      (fp, i, v) => arrayCodec.writeAt(pointerCodec.deref(fp), i, v),
      initial,
    );
  }

  MemoryPointer? _fieldPtr([MemoryPointer? src])
    => (src ?? _ptrOf())?.offsetBy(_offset);

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
    return fp != null ? _readAt(fp, index) : _cache[index];
  }

  @override
  void operator []=(int index, E value) {
    if (index >= _cache.length) _cache.length = index + 1;
    _cache[index] = value;
    final fp = _fieldPtr();
    if (fp != null) _writeAt(fp, index, value);
  }

  List<E> get inner => _cache;
  set inner(List<E> value) {
    if (_fixedCount != null) assert(value.length <= _fixedCount);
    _cache = .of(value);
    final fp = _fieldPtr();
    if (fp == null) return;
    for (var i = 0; i < value.length; i++) {
      _writeAt(fp, i, value[i]);
    }
  }

  set raw(List<E> value) => _cache = .of(value);

  /// Force a live re-read of [count] elements, refreshing the cache.
  List<E> materialize([int? count]) {
    final int? resolvedCount = count ?? _fixedCount;
    if (resolvedCount == null) throw StateError("Expected `count` for `materialize`.");
    final fp = _fieldPtr();
    if (fp == null) return _cache;
    _cache = .generate(resolvedCount, (i) => _readAt(fp, i));
    return _cache;
  }

  void writeInto(MemoryPointer p, [List<E>? values]) {
    values ??= inner;
    final fp = _fieldPtr(p);
    if (fp == null) return;
    if (fp.isNull) throw StateError("You are trying to write livelist cached data into nullptr.");
    for (final (i, v) in values.indexed) _writeAt(fp, i, v);
  }

  List<E> readFrom(MemoryPointer p, [int? count]) {
    final int? resolvedCount = count ?? _fixedCount;
    if (resolvedCount == null) throw StateError("Expected `count` for `readFrom`.");
    final fp = _fieldPtr(p);
    if (fp == null) return _cache;
    if (fp.isNull) throw StateError("You are trying to read into livelist from a nullptr.");
    _cache = .generate(resolvedCount, (i) => _readAt(fp, i));
    return _cache;
  }
}

extension LiveArrayFieldX<E, R extends RType> on StructValueField<List<E>, RArray<R>> {
  LiveStructList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .array(ptrOf, this, initial);
}

extension LivePointerFieldX<E, R extends RType> on StructValueField<E, RPointer<R>> {
  LiveStructList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .pointer(ptrOf, this, initial);
}

extension LivePointerArrayFieldX<E, R extends RType> on StructValueField<List<E>, RPointer<R>> {
  LiveStructList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .pointerArray(ptrOf, this, initial);
}

extension LivePointerFixedArrayFieldX<E, R extends RType> on StructValueField<List<E>, RPointer<RArray<R>>> {
  LiveStructList<E, R> live(MemoryPointer? Function() ptrOf, List<E> initial)
    => .pointerFixedArray(ptrOf, this, initial);
}