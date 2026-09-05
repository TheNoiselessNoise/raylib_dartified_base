part of '../raylib_dartified_base.dart';

/// A codec for a single value of type [E], stored at an [R]-typed region of
/// memory (the field's own on-struct type, for a pointer field this is
/// `RPointer<Pointee>`, not `Pointee`).
abstract class ElementCodec<E, R extends RType> {
  final R type;

  const ElementCodec(this.type);

  void _check(MemoryPointerHandle p, String action) {
    if (p.isNull) throw StateError('You are trying to $action on a nullptr.');
  }

  E read(MemoryPointerHandle p);

  void write(MemoryPointerHandle p, E value);

  RaylibTempAllocator? allocator(RaylibTemp temp);

  void allocate(RaylibTemp temp, MemoryPointerHandle p, String key, {int count = 1, bool raw = false}) {
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
  List<E> readArray(MemoryPointerHandle p, int count);

  void writeArray(MemoryPointerHandle p, List<E> values);
}

class StringCodec<R extends RTypeIntLike> extends ElementCodec<String, R> {
  const StringCodec(super.type);

  @override
  String read(MemoryPointerHandle p) {
    _check(p, 'read string');
    return switch (type) {
      RInt8() => p.cast<RInt8>().toDartString(),
      RInt16() => p.cast<RInt16>().toDartString(),
      RInt32() => p.cast<RInt32>().toDartString(),
      _ => throw UnsupportedError("Invalid type $R for reading a string value."),
    };
  }

  String readString(MemoryPointerHandle p, int maxLength) {
    _check(p, 'readString');
    return switch (type) {
      RInt8() => p.cast<RInt8>().toDartString(maxLength),
      RInt16() => p.cast<RInt16>().toDartString(maxLength),
      RInt32() => p.cast<RInt32>().toDartString(maxLength),
      _ => throw UnsupportedError("Invalid type $R for reading a string value."),
    };
  }

  @override
  void write(MemoryPointerHandle p, String value) {
    _check(p, 'write string');
    return switch (type) {
      RInt8() => p.cast<RInt8>().writeString(value),
      RInt16() => p.cast<RInt16>().writeString(value),
      RInt32() => p.cast<RInt32>().writeString(value),
      _ => throw UnsupportedError("Invalid type $R for writing a string value."),
    };
  }

  void writeString(MemoryPointerHandle p, String value, int maxLength) {
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
  E read(MemoryPointerHandle p) {
    _check(p, 'read scalar');
    return type.read(p, 0);
  }

  @override
  void write(MemoryPointerHandle p, E value) {
    _check(p, 'write scalar');
    type.write(p, 0, value);
  }

  @override
  List<E> readArray(MemoryPointerHandle p, int count) {
    _check(p, 'read scalar array');
    final stride = type.byteSize;
    return .generate(count, (i) => type.read(p, i * stride));
  }

  @override
  void writeArray(MemoryPointerHandle p, List<E> values) {
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
  E read(MemoryPointerHandle p) {
    _check(p, 'read enum');
    return enumFactory(type.read(p, 0));
  }

  @override
  void write(MemoryPointerHandle p, E value) {
    _check(p, 'write enum');
    type.write(p, 0, value.value);
  }

  @override
  List<E> readArray(MemoryPointerHandle p, int count) {
    _check(p, 'read enum array');
    final stride = type.byteSize;
    return .generate(count, (i) => enumFactory(type.read(p, i * stride)));
  }

  @override
  void writeArray(MemoryPointerHandle p, List<E> values) {
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
  E read(MemoryPointerHandle p)
    => throw UnsupportedError('Cannot read unknown value.');

  @override
  void write(MemoryPointerHandle p, E value)
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

  MemoryPointer<Y> deref<Y extends RType>(MemoryPointerHandle p) => p.readPtr();

  bool isValid(MemoryPointerHandle p) => !deref(p).isNull;

  @override
  E read(MemoryPointerHandle p) {
    _check(p, 'read pointer');
    return inner.read(deref(p));
  }

  E readSafe(MemoryPointerHandle p, E fallback) {
    final ref = deref(p);
    if (ref.isNull) return fallback;
    return inner.read(ref);
  }

  @override
  void write(MemoryPointerHandle p, E value) => inner.write(deref(p), value);

  void writeSafe(MemoryPointerHandle p, E value) {
    final ref = deref(p);
    if (ref.isNull) return;
    inner.write(ref, value);
  }

  @override
  List<E> readArray(MemoryPointerHandle p, int count) {
    _check(p, 'read pointer array');
    return .generate(count,
      (i) => inner.read(deref(p.offsetBy(i * RType.nativeWordSize))),
    );
  }

  @override
  void writeArray(MemoryPointerHandle p, List<E> values) {
    _check(p, 'write pointer array');
    for (var i = 0; i < values.length; i++) {
      inner.write(deref(p.offsetBy(i * RType.nativeWordSize)), values[i]);
    }
  }

  /// Address of element [index] in the array pointed to by this pointer,
  /// given the address of the pointer *slot* (`fieldPtr`). Dereferences
  /// [fieldPtr] for you, then delegates to [elementPtrFrom].
  ///
  /// For `T* p`, this is `p[index]`, i.e. `*fieldPtr + index * sizeof(T)`.
  MemoryPointer<R> elementPtr(MemoryPointerHandle fieldPtr, int index)
    => elementPtrFrom(deref(fieldPtr), index);

  /// Address of element [index], given a pointer value you've *already*
  /// dereferenced or otherwise resolved (e.g. via [pointerElementPtr]).
  ///
  /// Use this instead of [elementPtr] whenever you're holding the actual
  /// `T*` value rather than the address of a pointer slot, the two are
  /// easy to conflate, and conflating them was the exact bug that motivated
  /// pulling this method out on its own.
  MemoryPointer<R> elementPtrFrom(MemoryPointerHandle derefedBase, int index)
    => derefedBase.offsetBy(index * type.target.byteSize);

  /// Address stored in pointer slot [index]. For `T** p`, this is `p[index]`,
  /// itself a `T*`. Intentionally different from [elementPtr]/[elementPtrFrom].
  MemoryPointer<R> pointerElementPtr(MemoryPointerHandle fieldPtr, int index)
    => fieldPtr.offsetBy(index * RType.nativeWordSize).readPtr();

  E readAt(MemoryPointerHandle fieldPtr, int index)
    => inner.read(elementPtr(fieldPtr, index));

  E writeAt(MemoryPointerHandle fieldPtr, int index, E value) {
    inner.write(elementPtr(fieldPtr, index), value);
    return value;
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => temp._pointerAllocator;

  @override
  void allocate(RaylibTemp temp, MemoryPointerHandle p, String key, {int count = 1, bool raw = false}) {
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
  List<E> read(MemoryPointerHandle p) => inner.readArray(p, count);

  @override
  void write(MemoryPointerHandle p, List<E> values) {
    if (values.length != count) throw ArgumentError('Expected $count, got ${values.length}');
    inner.writeArray(p, values);
  }

  @override
  List<List<E>> readArray(MemoryPointerHandle p, int count) {
    // count groups of `this.count` contiguous elements, read them all in one
    // flat pass (so stride/byteSize logic stays entirely in `inner`) and chunk.
    final flat = inner.readArray(p, count * this.count);
    return .generate(
      count,
      (i) => flat.sublist(i * this.count, (i + 1) * this.count),
    );
  }

  @override
  void writeArray(MemoryPointerHandle p, List<List<E>> values) {
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
  void allocate(RaylibTemp temp, MemoryPointerHandle p, String key, {int count = 1, bool raw = false}) {
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

  MemoryPointer<R> elementPtr(MemoryPointerHandle fieldPtr, int index)
    => fieldPtr.offsetBy(index * type.element.byteSize);

  E readAt(MemoryPointerHandle fieldPtr, int index) => inner.read(elementPtr(fieldPtr, index));

  E writeAt(MemoryPointerHandle fieldPtr, int index, E value) {
    inner.write(elementPtr(fieldPtr, index), value);
    return value;
  }
}

class StructCodec<E extends RaylibStruct<E>>
  extends ElementCodec<E, RStruct>
  with ContiguousCodec<E, RStruct>
{
  final StructPointerFactory<E> pointer;

  const StructCodec(super.type, this.pointer);

  @override
  E read(MemoryPointerHandle p) {
    _check(p, 'read struct');
    return _x(pointer(p).owned(0));
  }

  @override
  void write(MemoryPointerHandle p, E value) {
    _check(p, 'write struct');
    pointer(p).ref = value;
  }

  @override
  List<E> readArray(MemoryPointerHandle p, int count) {
    _check(p, 'read struct array');
    return pointer(p).readArray(count, owned: true).map(_x).toList();
  }

  @override
  void writeArray(MemoryPointerHandle p, List<E> values) {
    _check(p, 'write struct array');
    pointer(p).writeArray(values);
  }

  E _x(E a) {
    if (!a.structRequiresOp) a.op = null;
    return a;
  }

  @override
  RaylibTempAllocator? allocator(RaylibTemp temp) => temp.structAlloc<E>();
}