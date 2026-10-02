part of '../raylib_dartified_base.dart';

/// Base for a typed field within a native struct, located at [offset] bytes
/// from the struct's base pointer.
///
/// Subclasses define how a value of type [E] is read from and written to
/// memory, and whether the field needs backing storage allocated.
abstract class StructFieldBase<E> {
  /// Byte offset of this field from the start of the struct.
  final int offset;

  const StructFieldBase(this.offset);

  /// Reads this field's value from the struct at [p].
  E read(MemoryPointer p);

  /// Like [read], but returns [fallback] if [p] is `null`.
  E readOr(MemoryPointer? p, E fallback) => p == null ? fallback : read(p);

  /// Writes [value] into this field of the struct at [p].
  ///
  /// Returns the value written.
  E write(MemoryPointer p, E value);

  /// Like [write], but does nothing if [p] is `null`.
  ///
  /// Always returns [value], whether or not the write happened.
  E writeOr(MemoryPointer? p, E value) {
    if (p != null) write(p, value);
    return value;
  }

  /// Allocates any backing storage this field needs (e.g. string or array
  /// data that the field points to), using [temp] and identified by [key].
  ///
  /// [p] is the struct base pointer.
  /// 
  /// [count] is the number of elements to allocate for array-like fields.
  /// 
  /// [raw] is used for tracking the allocation (automatic deallocation, no manual free).
  ///
  /// Fields stored inline in the struct have nothing to allocate and no-op.
  void allocate(RaylibTemp temp, MemoryPointer p, String key, {int count = 1, bool raw = false});
}

/// A field whose value is stored inline in the struct, read and written via
/// an [ElementCodec].
class StructValueField<E, R extends RType> extends StructFieldBase<E> {
  /// Codec used to convert between [E] and its native representation [R].
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
  /// Codec used to convert between [String] and its native representation.
  final StringCodec<R> codec;

  const StructStringValueField(super.offset, this.codec);

  @override
  String read(MemoryPointer p)
    => codec.read(p.offsetBy(offset));

  String readBounded(MemoryPointer p, int maxLength)
    => codec.readString(p, maxLength);

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
  /// Codec used to convert between [E] and the pointed-to native value [R].
  final PointerCodec<E, R> codec;

  const StructPointerValueField(super.offset, this.codec);

  @override
  E read(MemoryPointer p) => codec.read(p.offsetBy(offset));

  @override
  E write(MemoryPointer p, E value) {
    codec.write(p.offsetBy(offset), value);
    return value;
  }

  /// Reads the pointed-to value of this field within the struct at [p].
  ///
  /// Returns [fallback] if the field's pointer is null.
  E readSafe(MemoryPointer p, E fallback)
    => codec.readSafe(p.offsetBy(offset), fallback);

  /// Writes [value] through this field's pointer within the struct at [p].
  ///
  /// Does nothing if the field's pointer is null.
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
  /// Codec used to dereference the field's pointer and convert elements
  /// between [E] and their native representation [R].
  final PointerCodec<E, R> codec;

  const StructPointerArrayField(super.offset, this.codec);

  @override
  List<E> read(MemoryPointer p)
    => throw UnsupportedError('Length is runtime-determined, use `readCount`.');

  @override
  List<E> write(MemoryPointer p, List<E> value)
    => throw UnsupportedError('Length is runtime-determined, use `writeCount`.');

  /// Like [readCount], but returns [fallback] (or an empty list if it is
  /// `null`) when the struct pointer [p] is `null`.
  List<E> readCountOr(MemoryPointer? p, int count, [List<E>? fallback]) {
    if (p == null) return fallback ?? [];
    return readCount(p, count, fallback);
  }

  /// Reads [count] elements from the array this field points to, within the
  /// struct at [p].
  ///
  /// If the field's pointer is null, returns [fallback] (or an empty list if
  /// it is `null`).
  ///
  /// Throws [StateError] if the codec doesn't support contiguous arrays.
  List<E> readCount(MemoryPointer p, int count, [List<E>? fallback]) {
    final ref = codec.deref(p.offsetBy(offset));
    if (ref.isNull) return fallback ?? [];
    return _innerArray().readArray(ref, count);
  }

  /// Writes [values] into the array this field points to, within the struct
  /// at [p]. The pointed-to memory must already be allocated with room for
  /// at least `values.length` elements (see [allocate]).
  ///
  /// Returns [values].
  ///
  /// Throws [StateError] if the codec doesn't support contiguous arrays.
  List<E> writeCount(MemoryPointer p, List<E> values) {
    final ref = codec.deref(p.offsetBy(offset));
    if (ref.isNull) return values;
    _innerArray().writeArray(ref, values);
    return values;
  }

  /// Like [writeCount], but does nothing if the struct pointer [p] is `null`.
  ///
  /// Always returns the given list, whether or not the write happened.
  List<E> writeCountIf(MemoryPointer? p, List<E> values) {
    if (p == null) return values;
    final ref = codec.deref(p.offsetBy(offset));
    _innerArray().writeArray(ref, values);
    return values;
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
    => _ptrOf()?.offsetBy(_offset) ?? MemoryPointer.nullptr();

  MemoryPointer<Y> derefPtr<Y extends RType>()
    => _ptrOf()?.readPtr(_offset) ?? MemoryPointer.nullptr();

  factory LivePointerSync.pointerSync(
    MemoryPointer? Function() ptrOf,
    StructPointerValueField<dynamic, R> field,
  ) => ._(ptrOf, field.offset);

  // we don't care about nullptr
  void syncFrom(MemoryPointer p, {bool borrow = true}) {
    if (!borrow) return;
    fieldPtr().writePtr(p.readPtr(_offset));
  }

  // we don't care about nullptr
  void syncInto(MemoryPointer p)
    => p.writePtr(derefPtr(), _offset);
}

extension LivePointerSyncFieldX<E, R extends RType> on StructPointerValueField<E, R> {
  LivePointerSync<R> live(MemoryPointer? Function() ptrOf)
    => .pointerSync(ptrOf, this);
}