part of 'raylib_dartified_base.dart';

abstract class ElementCodec<E, R extends RType> {
  List<E> readArray(MemoryPointer<R> p, int count);
  
  void writeArray(MemoryPointer<R> p, List<E> values);
}

class ScalarCodec<E, R extends RType> implements ElementCodec<E, R> {
  final R type;
  const ScalarCodec(this.type);

  @override
  List<E> readArray(MemoryPointer<R> p, int count) {
    final stride = type.byteSize;
    return .generate(count, (i) => type.read(p, i * stride));
  }

  @override
  void writeArray(MemoryPointer<R> p, List<E> values) {
    final stride = type.byteSize;
    for (var i = 0; i < values.length; i++) {
      type.write(p, i * stride, values[i]);
    }
  }
}

class StructCodec<D extends RaylibStruct<D>> implements ElementCodec<D, RStruct> {
  final StructPointerFactory<D> pointer;

  StructCodec(this.pointer);

  @override
  List<D> readArray(MemoryPointer<RStruct> p, int count)
    => pointer(p).readArray(count);
  
  @override
  void writeArray(MemoryPointer<RStruct> p, List<D> values)
    => pointer(p).writeArray(values);
}

class StructField<T> {
  final int offset;
  final RType type;

  const StructField(this.offset, this.type);

  T read(MemoryPointer p)
    => type.read(p, offset) as T;
  
  T write(MemoryPointer p, T value) {
    type.write(p, offset, value);
    return value;
  }

  T readOr(MemoryPointer? p, T fallback)
    => p == null ? fallback : read(p);
  
  T writeIf(MemoryPointer? p, T value) {
    if (p != null) write(p, value);
    return value;
  }
}

class StructTypeField<D extends RaylibStruct<D>> {
  final int offset;
  final StructPointer<D> Function(MemoryPointer?) pointer;

  const StructTypeField(this.offset, this.pointer);

  D read(MemoryPointer p)
    => pointer(p.offsetBy(offset)).ref;
  
  D readOr(MemoryPointer? p, D fallback)
    => p == null ? fallback : read(p);
  
  D write(MemoryPointer p, D value)
    => pointer(p.offsetBy(offset))[0] = value;

  D writeIf(MemoryPointer? p, D value) {
    if (p != null) write(p, value);
    return value;
  }
}

class StructInlineArrayField<E, R extends RType> {
  final int offset;
  final int count;
  final ElementCodec<E, R> codec;

  const StructInlineArrayField(this.offset, this.count, this.codec);

  List<E> read(MemoryPointer p)
    => codec.readArray(p.offsetBy(offset), count);

  List<E> readOr(MemoryPointer? p, List<E> fallback)
     => p == null ? fallback : read(p);

  List<E> write(MemoryPointer p, List<E> values) {
    codec.writeArray(p.offsetBy(offset), values);
    return values;
  }

  List<E> writeIf(MemoryPointer? p, List<E> values) {
    if (p != null) write(p, values);
    return values;
  }
}

class StructPointerArrayField<E, R extends RType> {
  final int offset;
  final ElementCodec<E, R> codec;
  const StructPointerArrayField(this.offset, this.codec);

  MemoryPointer<R> basePointer(MemoryPointer p) => p.readPtr(offset).cast();

  RaylibTempArrayAllocator? _allocator(RaylibTemp temp)
    => temp.scalarAlloc<R>();

  void allocate(RaylibTemp temp, MemoryPointer at, String key, List<E> values) {
    if (basePointer(at).isNull) {
      final allocator = _allocator(temp);

      if (allocator == null) {
        throw StateError(
          'No allocator registered for $R',
        );
      }

      final inner = allocator.At('${key}_${offset}_array', values.length);
      at.offsetBy(offset).writePtr(inner.cast());
    }
  }

  List<E> read(MemoryPointer p, int count)
    => codec.readArray(p.cast(), count);

  List<E> readOr(MemoryPointer? p, int count, List<E> fallback)
    => p == null ? fallback : read(basePointer(p), count);

  List<E> write(MemoryPointer p, List<E> values) {
    codec.writeArray(p.cast(), values);
    return values;
  }

  List<E> writeIf(MemoryPointer? p, List<E> values) {
    if (p != null) codec.writeArray(basePointer(p), values);
    return values;
  }
}

class StructPointerArrayStructField<E extends RaylibStruct<E>> extends StructPointerArrayField<E, RStruct> {
  const StructPointerArrayStructField(super.offset, super.codec);

  @override
  RaylibTempArrayAllocator<E, RStruct>? _allocator(RaylibTemp temp)
    => temp.structAlloc<E>();
}