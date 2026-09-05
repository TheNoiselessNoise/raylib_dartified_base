part of '../raylib_dartified_base.dart';

abstract class StructFieldBase<E> {
  final int offset;

  const StructFieldBase(this.offset);

  E read(MemoryPointerHandle p);

  E readOr(MemoryPointerHandle? p, E fallback) => p == null ? fallback : read(p);

  E write(MemoryPointerHandle p, E value);

  E writeIf(MemoryPointerHandle? p, E value) {
    if (p != null) write(p, value);
    return value;
  }

  void allocate(RaylibTemp temp, MemoryPointerHandle p, String key, {int count = 1, bool raw = false});
}

class StructValueField<E, R extends RType> extends StructFieldBase<E> {
  final ElementCodec<E, R> codec;

  const StructValueField(super.offset, this.codec);

  @override
  E read(MemoryPointerHandle p) => codec.read(p.offsetBy(offset));

  @override
  E write(MemoryPointerHandle p, E value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }

  @override
  void allocate(RaylibTemp temp, MemoryPointerHandle p, String key, {int count = 1, bool raw = false}) {
    // no-op
  }
}

/// A pointer-or-array-to-string-value field. Holds a [StringCodec] concretely.
class StructStringValueField<R extends RTypeIntLike> extends StructFieldBase<String> {
  final StringCodec<R> codec;

  const StructStringValueField(super.offset, this.codec);

  @override
  String read(MemoryPointerHandle p)
    => codec.read(p.offsetBy(offset));

  String readBounded(MemoryPointerHandle p, int maxLength)
    => codec.readString(p, maxLength);

  @override
  String write(MemoryPointerHandle p, String value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }

  @override
  void allocate(RaylibTemp temp, MemoryPointerHandle p, String key, {int count = 1, bool raw = false}) {
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
  E read(MemoryPointerHandle p) => codec.read(p.offsetBy(offset));

  @override
  E write(MemoryPointerHandle p, E value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }

  E readSafe(MemoryPointerHandle p, E fallback)
    => codec.readSafe(p.offsetBy(offset), fallback);

  void writeSafe(MemoryPointerHandle p, E value)
    => codec.writeSafe(p.offsetBy(offset), value);

  @override
  void allocate(RaylibTemp temp, MemoryPointerHandle p, String key, {int count = 1, bool raw = false}) {
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
  List<E> read(MemoryPointerHandle p)
    => throw UnsupportedError('Length is runtime-determined, use `readCount`.');

  @override
  List<E> write(MemoryPointerHandle p, List<E> value)
    => throw UnsupportedError('Length is runtime-determined, use `writeCount`.');

  List<E> readCountOr(MemoryPointerHandle? p, int count, [List<E>? fallback]) {
    if (p == null) return fallback ?? [];
    return readCount(p, count, fallback);
  }

  List<E> readCount(MemoryPointerHandle p, int count, [List<E>? fallback]) {
    final ref = codec.deref(p.offsetBy(offset));
    if (ref.isNull) return fallback ?? [];
    return _innerArray().readArray(ref, count);
  }

  List<E> writeCount(MemoryPointerHandle p, List<E> values) {
    final ref = codec.deref(p.offsetBy(offset));
    _innerArray().writeArray(ref, values);
    return values;
  }

  List<E> writeCountIf(MemoryPointerHandle? p, List<E> fallback) {
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
  void allocate(RaylibTemp temp, MemoryPointerHandle p, String key, {int count = 1, bool raw = false}) {
    codec.allocate(temp, p.offsetBy(offset), key, count: count, raw: raw);
  }
}