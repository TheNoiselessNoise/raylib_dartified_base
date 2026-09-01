part of 'raylib_dartified_base.dart';

abstract class ElementCodec<E, R extends RType> {
  const ElementCodec();

  void _check(MemoryPointer<R> p, String action) {
    if (p.isNull) throw StateError('You are trying to $action on a nullptr.');
  }

  E read(MemoryPointer<R> p);

  void write(MemoryPointer<R> p, E value);

  List<E> readArray(MemoryPointer<R> p, int count);

  void writeArray(MemoryPointer<R> p, List<E> values);

  RaylibTempAllocator? allocator(RaylibTemp temp);
}

class StringCodec<R extends RType> extends ElementCodec<String, R> {
  @override
  String read(MemoryPointer<R> p) => switch (R) {
    const (RInt8) => p.cast<RInt8>().toDartString(),
    const (RInt16) => p.cast<RInt16>().toDartString(),
    const (RInt32) => p.cast<RInt32>().toDartString(),
    _ => throw UnsupportedError("Invalid type $R for reading a string value."),
  };

  String readString(MemoryPointer<R> p, int maxLength) => switch (R) {
    const (RInt8) => p.cast<RInt8>().toDartStringBounded(maxLength),
    const (RInt16) => p.cast<RInt16>().toDartStringBounded(maxLength),
    const (RInt32) => p.cast<RInt32>().toDartStringBounded(maxLength),
    _ => throw UnsupportedError("Invalid type $R for reading a string value."),
  };

  @override
  List<String> readArray(MemoryPointer<R> p, int count)
    => throw UnsupportedError("Invalid operation.");

  @override
  void write(MemoryPointer<R> p, String value) => switch (R) {
    const (RInt8) => p.cast<RInt8>().writeString(value),
    const (RInt16) => p.cast<RInt16>().writeString(value),
    const (RInt32) => p.cast<RInt32>().writeString(value),
    _ => throw UnsupportedError("Invalid type $R for reading a string value."),
  };

  void writeString(MemoryPointer<R> p, String value, int maxLength) => switch (R) {
    const (RInt8) => p.cast<RInt8>().writeString(value, maxLength),
    const (RInt16) => p.cast<RInt16>().writeString(value, maxLength),
    const (RInt32) => p.cast<RInt32>().writeString(value, maxLength),
    _ => throw UnsupportedError("Invalid type $R for reading a string value."),
  };

  @override
  void writeArray(MemoryPointer<R> p, List<String> values)
    => throw UnsupportedError("Invalid operation.");

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp)
    => temp.String$;
}

class ScalarCodec<E, R extends RType> extends ElementCodec<E, R> {
  final R type;

  const ScalarCodec(this.type);

  @override
  E read(MemoryPointer<R> p) {
    _check(p, 'read scalar');
    return type.read(p, 0);
  }

  @override
  void write(MemoryPointer<R> p, E value) {
    _check(p, 'write scalar');
    type.write(p, 0, value);
  }

  @override
  List<E> readArray(MemoryPointer<R> p, int count) {
    _check(p, 'read scalar array');
    final stride = type.byteSize;
    return .generate(count, (i) => type.read(p, i * stride));
  }

  @override
  void writeArray(MemoryPointer<R> p, List<E> values) {
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
  final R type;
  final E Function(int) enumFactory;

  const EnumCodec(this.type, this.enumFactory);

  @override
  E read(MemoryPointer<R> p) {
    _check(p, 'read enum');
    return enumFactory(type.read(p, 0));
  }

  @override
  void write(MemoryPointer<R> p, E value) {
    _check(p, 'write enum');
    type.write(p, 0, value.value);
  }

  @override
  List<E> readArray(MemoryPointer<R> p, int count) {
    _check(p, 'read enum array');
    final stride = type.byteSize;
    return .generate(count, (i) => enumFactory(type.read(p, i * stride)));
  }

  @override
  void writeArray(MemoryPointer<R> p, List<E> values) {
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

class StructCodec<E extends RaylibStruct<E>> extends ElementCodec<E, RStruct> {
  final StructPointerFactory<E> pointer;

  const StructCodec(this.pointer);

  @override
  E read(MemoryPointer<RStruct> p) {
    _check(p, 'read struct');
    return pointer(p).owned(0);
  }

  @override
  void write(MemoryPointer<RStruct> p, E value) {
    _check(p, 'write struct');
    pointer(p)[0] = value;
  }

  @override
  List<E> readArray(MemoryPointer<RStruct> p, int count) {
    _check(p, 'read struct array');
    return pointer(p).readArray(count);
  }

  @override
  void writeArray(MemoryPointer<RStruct> p, List<E> values) {
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

class StructEnumValueField<E extends RaylibEnum, R extends RType> extends StructFieldBase<E> {
  final int offset;
  final EnumCodec<E, R> codec;

  const StructEnumValueField(this.offset, this.codec);

  @override
  E read(MemoryPointer p)
    => codec.read(p.offsetBy(offset));

  @override
  E write(MemoryPointer p, E value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }
}

class StructArrayField<E, R extends RType> extends StructFieldBase<List<E>> {
  final int offset;
  final int count;
  final ElementCodec<E, R> codec;

  const StructArrayField(this.offset, this.count, this.codec);

  @override
  List<E> read(MemoryPointer p)
    => codec.readArray(p.offsetBy(offset), count);

  @override
  List<E> write(MemoryPointer p, List<E> values) {
    codec.writeArray(p.offsetBy(offset), values);
    return values;
  }
}

class StructStringCharArrayField<R extends RType> extends StructFieldBase<String> {
  final int offset;
  final int maxLength;
  final StringCodec<R> codec = .new();

  StructStringCharArrayField(this.offset, this.maxLength);

  @override
  String read(MemoryPointer p)
    => codec.readString(p.offsetBy(offset), maxLength);

  @override
  String write(MemoryPointer p, String value) {
    codec.writeString(p.offsetBy(offset), value, maxLength);
    return value;
  }
}

class StructStringPointerCharField<R extends RType> extends StructFieldBase<String> {
  final int offset;
  final StringCodec<R> codec = .new();

  StructStringPointerCharField(this.offset);

  MemoryPointer<R> basePointer(MemoryPointer p)
    => p.readPtr(offset).cast<R>();

  @override
  String read(MemoryPointer p)
    => codec.read(basePointer(p));

  String readSafeOr(MemoryPointer? p, String fallback) {
    if (p == null) return fallback;
    return readSafe(p, fallback);
  }

  String readSafe(MemoryPointer p, String fallback) {
    final inner = basePointer(p);
    if (inner.isNull) return fallback;
    return codec.read(inner);
  }

  @override
  String write(MemoryPointer p, String value) {
    final inner = basePointer(p);
    if (inner.isNull) return value;
    codec.write(inner, value);
    return value;
  }

  String writeSafeIf(MemoryPointer? p, String value) {
    if (p == null) return value;
    return write(p, value);
  }

  void allocate(RaylibTemp temp, MemoryPointer at, String key, int count) {
    if (!basePointer(at).isNull) return;

    final allocator = codec.allocator(temp);

    if (allocator == null) {
      throw StateError(
        'No allocator registered for ${codec.runtimeType}',
      );
    }

    final inner = allocator.At('${key}_${offset}_string', count);
    at.offsetBy(offset).writePtr(inner.cast());
  }
}

class StructPointerField<E, R extends RType> extends StructFieldBase<E> {
  final int offset;
  final ElementCodec<E, R> codec;

  const StructPointerField(this.offset, this.codec);

  MemoryPointer<R> basePointer(MemoryPointer p)
    => p.readPtr(offset).cast<R>();

  @override
  E read(MemoryPointer p)
    => codec.read(basePointer(p));

  E readSafe(MemoryPointer p, E fallback) {
    final inner = basePointer(p);
    if (inner.isNull) return fallback;
    return codec.read(inner);
  }

  @override
  E write(MemoryPointer p, E value) {
    codec.write(basePointer(p), value);
    return value;
  }

  void allocate(RaylibTemp temp, MemoryPointer at, String key) {
    if (!basePointer(at).isNull) return;

    final allocator = codec.allocator(temp);

    if (allocator == null) {
      throw StateError(
        'No allocator registered for ${codec.runtimeType}',
      );
    }

    final inner = allocator.At('${key}_${offset}_value', 1);
    at.offsetBy(offset).writePtr(inner.cast());
  }
}

class StructPointerArrayField<E, R extends RType> extends StructFieldBase<List<E>> {
  final int offset;
  final ElementCodec<E, R> codec;

  /// If non-null, this is a fixed-size pointer array.
  final int? count;

  const StructPointerArrayField(
    this.offset,
    this.codec, {
    this.count,
  });

  MemoryPointer<R> basePointer(MemoryPointer p)
    => p.readPtr(offset).cast<R>();

  int _resolveCount(int? count) {
    final fixed = this.count;

    if (fixed != null) {
      if (count != null && count != fixed) {
        throw ArgumentError('Expected exactly $fixed elements, got $count.');
      }

      return fixed;
    }

    if (count == null) {
      throw ArgumentError('A count is required for a variable-size pointer array.');
    }

    return count;
  }

  @override
  List<E> read(MemoryPointer p) {
    final resolvedCount = _resolveCount(null);
    return codec.readArray(basePointer(p), resolvedCount);
  }

  List<E> readCountOr(MemoryPointer? p, int count, List<E> fallback) {
    if (p == null) return fallback;
    final inner = basePointer(p);
    if (inner.isNull) return fallback;
    final resolvedCount = _resolveCount(count);
    return codec.readArray(inner, resolvedCount);
  }

  List<E> readCount(MemoryPointer p, int count, List<E> fallback) {
    final resolvedCount = _resolveCount(count);
    final inner = basePointer(p);
    if (inner.isNull) return fallback;
    return codec.readArray(inner, resolvedCount);
  }

  @override
  List<E> write(MemoryPointer p, List<E> values) {
    final resolvedCount = _resolveCount(values.length);

    if (values.length != resolvedCount) {
      throw ArgumentError(
        'Expected exactly $resolvedCount elements, '
        'got ${values.length}.',
      );
    }

    codec.writeArray(basePointer(p), values);
    return values;
  }

  void allocate(RaylibTemp temp, MemoryPointer at, String key, int count) {
    final resolvedCount = _resolveCount(count);

    if (!basePointer(at).isNull) return;

    final allocator = codec.allocator(temp);

    if (allocator == null) {
      throw StateError(
        'No allocator registered for ${codec.runtimeType}',
      );
    }

    final inner = allocator.At('${key}_${offset}_array', resolvedCount);
    at.offsetBy(offset).writePtr(inner.cast());
  }
}