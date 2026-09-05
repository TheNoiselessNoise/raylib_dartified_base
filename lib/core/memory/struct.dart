part of '../raylib_dartified_base.dart';

typedef StructFactory<D extends RaylibStruct<D>> = D Function({
  StructPointer<D>? op,
});

typedef StructPointerFactory<D extends RaylibStruct<D>> = StructPointer<D> Function(MemoryPointerHandle?);

/// Per-instance allocation state for a [RaylibStruct] mirror object,
/// tracking its current slot key, tag, disposal status, and stable identity
/// across repeated [RaylibTempStructAllocator.Allocate] calls.
final class RaylibTempStructState with RaylibDisposable {
  /// The slot tag used to disambiguate [RaylibTemp] keys for this instance.
  ///
  /// Defaults to `'default'`. Change via [RaylibStruct.structSetTag].
  String tag = 'default';
  
  /// The [RaylibTemp] slot key used during the most recent [RaylibTempStructAllocator.Allocate] allocation.
  String? allocKey;
  
  /// Whether [RaylibStruct.structMarkDisposed] has been called on this instance.
  bool isDisposed = false;
  
  /// Whether [RaylibTempStructAllocator.Allocate] has never been called for this instance.
  ///
  /// Used to full sync once to push pre-promotion Dart state to memory on the first
  /// [RaylibTempStructAllocator.Allocate] allocation.
  bool isFirstSync = true;

  /// Whether [RaylibTempStructAllocator.Allocate] has ever been called for this instance.
  bool isAllocated = false;

  /// A stable numeric ID assigned on first [RaylibTempStructAllocator.Allocate] call for pointer-owning structs.
  ///
  /// Incorporated into slot keys to prevent collisions between distinct instances
  /// of the same struct type sharing the same [tag].
  int? internalId;
  
  static int _internalIdCounter = 0;
  int get nextId => internalId ??= ++_internalIdCounter;
}

// NTOE: customizable alignment?
// -----------------------------
// class FieldSpec {
//   final RType type;
//   final int? alignOverride; // null = natural alignment
//   const FieldSpec(this.type, {this.alignOverride});
// }

// factory StructLayout.aligned(Map<E, FieldSpec> fields) {
//   final offsets = <E, int>{};
//   var offset = 0;
//   var maxAlign = 1;
//   for (final entry in fields.entries) {
//     final spec = entry.value;
//     final type = spec.type;
//     var align = type is RStruct ? type.layout.alignment : type.byteSize;
//     if (spec.alignOverride != null) align = spec.alignOverride!;
//     offset = (offset + align - 1) ~/ align * align;
//     offsets[entry.key] = offset;
//     offset += type.byteSize;
//     if (align > maxAlign) maxAlign = align;
//   }
//   final total = (offset + maxAlign - 1) ~/ maxAlign * maxAlign;
//   return StructLayout._(offsets, total, maxAlign);
// }

// StructLayout.aligned({
//   .a: FieldSpec(RInt32()),                   // natural: align 4
//   .b: FieldSpec(RInt64(), alignOverride: 1), // packed: align 1
//   .c: FieldSpec(RInt32()),                   // back to natural
// });
// -----------------------------

mixin StructFields on Enum {}

class StructLayoutFloatSlot {
  final int offset;
  final int size; // 4 or 8, from RFloat/RDouble
  const StructLayoutFloatSlot(this.offset, this.size);
}

/// Backend-agnostic struct layout: field -> byte offset, plus total size.
/// Computes C-style natural-alignment offsets: each field's alignment
/// equals its own size, offset is rounded up to that alignment, and the
/// total struct size is rounded up to the largest field alignment.
/// This reproduces real C struct layout for flat structs of primitives
/// and pointers.
final class StructLayout<F extends StructFields> {
  /// Maps each field to the [RType] describing it.
  final Map<F, RType> fields;
  final Map<F, int> offsets;
  final List<StructLayoutFloatSlot> floatFields;
  final int byteSize;
  final int alignment;

  const StructLayout._(this.fields, this.offsets, this.floatFields, this.byteSize, this.alignment);

  factory StructLayout.aligned(Map<F, RType> fields) {
    final offsets = <F, int>{};
    var offset = 0;
    var maxAlign = 1;
    for (final entry in fields.entries) {
      final type = entry.value;
      final align = type.alignment;
      offset = (offset + align - 1) ~/ align * align;
      offsets[entry.key] = offset;
      offset += type.byteSize;
      if (align > maxAlign) maxAlign = align;
    }
    final total = (offset + maxAlign - 1) ~/ maxAlign * maxAlign;
    final floatFields = _collectFloatSlots(fields, offsets);
    assert(total <= RaylibConfig.MAX_STRUCT_BYTE_SIZE, '$F StructLayout byteSize ($total) exceeds MAX_STRUCT_BYTE_SIZE');
    return StructLayout._(fields, offsets, floatFields, total, maxAlign);
  }

  int offset(F field) => offsets[field]!;
  
  static List<StructLayoutFloatSlot> _collectFloatSlots<F extends StructFields>(
    Map<F, RType> fields, Map<F, int> offsets
  ) {
    final slots = <StructLayoutFloatSlot>[];
    for (final entry in fields.entries) {
      final type = entry.value;
      final offset = offsets[entry.key]!;
      _walkFloatSlots(type, offset, slots);
    }
    return slots;
  }

  static void _walkFloatSlots(RType type, int baseOffset, List<StructLayoutFloatSlot> slots) {
    if (type is RFloat) {
      slots.add(.new(baseOffset, type.byteSize));
    } else if (type is RDouble) {
      slots.add(.new(baseOffset, type.byteSize));
    } else if (type is RArray) {
      final elemSize = type.element.byteSize;
      for (var i = 0; i < type.count; i++) {
        _walkFloatSlots(type.element, baseOffset + i * elemSize, slots);
      }
    } else if (type is RStruct) {
      for (final e in type.layout.fields.entries) {
        _walkFloatSlots(e.value, baseOffset + type.layout.offset(e.key), slots);
      }
    }
  }

  void _checkField(F f) {
    if (!offsets.containsKey(f)) {
      throw StateError("You have defined a field `${f.name}`, but you didn't provide it in a struct layout.");
    }
  }

  void _checkEnumType(F f, RType type) {
    if (type is! RTypeIntLike) {
      throw ArgumentError(
        "Layout field `${f.name}` has element type `${type.runtimeType}`, which is not int-like. "
        "Enum values require an RTypeIntLike (e.g. RInt8, RUint32)."
      );
    }
  }

  void _checkStringType(F f, RType type, String forWhat) {
    if (type is! RInt8 && type is! RInt16 && type is! RInt32) {
      throw UnsupportedError(
        "Invalid element type ${type.runtimeType} for $forWhat. Use either RInt8, RInt16 or RInt32."
      );
    }
  }

  R _getFieldAs<R extends RType>(F f) {
    final type = fields[f]!;
    if (type is! R) {
      throw ArgumentError(
        "Layout field `${f.name}` is `${type.runtimeType}`, but was requested as `$R`."
      );
    }
    return type;
  }

  StructValueField<E, R> scalar<E, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<R>(f);
    return .new(offset(f), ScalarCodec(type));
  }

  StructValueField<T, RStruct> struct<T extends RaylibStruct<T>>(
    F f,
    StructPointerFactory<T> pointerFactory,
  ) {
    _checkField(f);
    final type = _getFieldAs<RStruct>(f);
    return .new(offset(f), StructCodec<T>(type, pointerFactory));
  }

  StructValueField<X, R> enumValue<
    X extends RaylibEnum,
    R extends RType
  >(F f, X Function(int) enumFactory) {
    _checkField(f);
    final type = _getFieldAs<R>(f);
    _checkEnumType(f, type);
    final enumCodec = EnumCodec(type, enumFactory);
    return .new(offset(f), enumCodec);
  }

  StructStringValueField<R> stringAsCharArray<R extends RTypeIntLike>(F f) {
    _checkField(f);
    final type = _getFieldAs<RArray<R>>(f);
    final element = type.element;
    _checkStringType(f, element, 'char array field');
    return .new(offset(f), StringCodec(element));
  }

  StructPointerValueField<String, R> stringAsPointerChar<R extends RTypeIntLike>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final element = type.target;
    _checkStringType(f, element, 'pointer char field');
    final stringCodec = StringCodec(element);
    final pointerCodec = PointerCodec(type, stringCodec);
    return .new(offset(f), pointerCodec);
  }

  StructValueField<List<T>, RArray<R>> scalarArray<T, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RArray<R>>(f);
    final scalarCodec = ScalarCodec<T, R>(type.element);
    final arrayCodec = ArrayCodec(type, scalarCodec, type.count);
    return .new(offset(f), arrayCodec);
  }

  StructValueField<List<T>, RArray<RStruct>> structArray<T extends RaylibStruct<T>>(
    F f,
    StructPointerFactory<T> pointerFactory,
  ) {
    _checkField(f);
    final type = _getFieldAs<RArray<RStruct>>(f);
    final structCodec = StructCodec(type.element, pointerFactory);
    final arrayCodec = ArrayCodec(type, structCodec, type.count);
    return .new(offset(f), arrayCodec);
  }

  StructPointerValueField<T, R> pointerScalar<T, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final scalarCodec = ScalarCodec<T, R>(type.target);
    final pointerCodec = PointerCodec(type, scalarCodec);
    return .new(offset(f), pointerCodec);
  }

  StructPointerValueField<T, RStruct> pointerStruct<
    T extends RaylibStruct<T>
  >(F f, StructPointerFactory<T> pointer) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RStruct>>(f);
    final structCodec = StructCodec(type.target, pointer);
    final pointerCodec = PointerCodec(type, structCodec);
    return .new(offset(f), pointerCodec);
  }

  StructPointerValueField<X, R> pointerEnumValue<
    X extends RaylibEnum,
    R extends RType
  >(F f, X Function(int) enumFactory) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    _checkEnumType(f, type.target);
    final enumCodec = EnumCodec(type.target, enumFactory);
    final pointerCodec = PointerCodec(type, enumCodec);
    return .new(offset(f), pointerCodec);
  }

  StructPointerValueField<dynamic, R> pointerUnknown<R extends RTypeUnknownLike>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final unknownCodec = UnknownCodec(type.target);
    final pointerCodec = PointerCodec(type, unknownCodec);
    return .new(offset(f), pointerCodec);
  }

  StructPointerValueField<X, R> pointerSync<X, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final unknownCodec = UnknownCodec<X, R>(type.target);
    final pointerCodec = PointerCodec(type, unknownCodec);
    return .new(offset(f), pointerCodec);
  }

  StructPointerValueField<List<T>, RArray<R>> pointerScalarFixedArray<T, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RArray<R>>>(f);
    final array = type.target;
    final scalarCodec = ScalarCodec<T, R>(array.element);
    final arrayCodec = ArrayCodec(type.target, scalarCodec, array.count);
    final pointerCodec = PointerCodec(type, arrayCodec);
    return .new(offset(f), pointerCodec);
  }

  StructPointerValueField<List<T>, RArray<RStruct>> pointerStructFixedArray<
    T extends RaylibStruct<T>
  >(F f, StructPointerFactory<T> pointer) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RArray<RStruct>>>(f);
    final array = type.target;
    final structCodec = StructCodec(array.element, pointer);
    final arrayCodec = ArrayCodec(type.target, structCodec, array.count);
    final pointerCodec = PointerCodec(type, arrayCodec);
    return .new(offset(f), pointerCodec);
  }

  // T*
  StructPointerArrayField<T, R> pointerScalarArray<T, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final scalarCodec = ScalarCodec<T, R>(type.target);
    final pointerCodec = PointerCodec(type, scalarCodec);
    return .new(offset(f), pointerCodec);
  }

  // T* where T is a struct
  StructPointerArrayField<T, RStruct> pointerStructArray<
    T extends RaylibStruct<T>
  >(
    F f,
    StructPointerFactory<T> pointerFactory,
  ) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RStruct>>(f);
    final structCodec = StructCodec(type.target, pointerFactory);
    final pointerCodec = PointerCodec(type, structCodec);
    return .new(offset(f), pointerCodec);
  }

  // T**
  StructPointerArrayField<T, RPointer<R>> pointerPointerScalarArray<
    T,
    R extends RType
  >(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RPointer<R>>>(f);
    final scalarCodec = ScalarCodec<T, R>(type.target.target);
    final innerPointerCodec = PointerCodec(type.target, scalarCodec);
    final pointerCodec = PointerCodec(type, innerPointerCodec);
    return .new(offset(f), pointerCodec);
  }

  // T** where T is a struct
  StructPointerArrayField<T, RPointer<RStruct>> pointerPointerStructArray<
    T extends RaylibStruct<T>
  >(
    F f,
    StructPointerFactory<T> pointerFactory,
  ) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RPointer<RStruct>>>(f);
    final structCodec = StructCodec(type.target.target, pointerFactory);
    final innerPointerCodec = PointerCodec(type.target, structCodec);
    final pointerCodec = PointerCodec(type, innerPointerCodec);
    return .new(offset(f), pointerCodec);
  }
}

/// Backend-agnostic base for Raylib struct mirror objects that are backed by
/// native memory, adding [op] ownership tracking on top.
abstract class RaylibStruct<D extends RaylibStruct<D>> {
  D get _self => this as D;

  /// The C-owned or RaylibTemp-owned typed pointer for this struct, if any.
  StructPointer<D>? op;

  RaylibStruct({
    this.op,
  }) {
    $state.isFirstSync = op == null;
  }

  /// Per-instance allocation state tracking slot keys, disposal, and identity.
  final RaylibTempStructState $state = RaylibTempStructState();

  // === MUST IMPLEMENT PER-TYPE ===

  /// Copies the fields of [o] into this instance and returns `this`.
  D setDart(D o) => _self;

  /// Allocates nested pointers into [temp] under [key] as needed.
  void structAllocateInto(RaylibTemp temp, MemoryPointerHandle p, String key) {}

  void structWriteInto(MemoryPointerHandle p);
  
  void structReadFrom(MemoryPointerHandle p);

  /// Returns a deep copy of this instance, preserving [op] if present.
  D clone();

  // === ====================== ===

  /// The Dart-side type name of this struct
  String get structName => runtimeType.toString();

  /// Sets [RaylibTempStructState.tag] to [newTag] and returns `this` for chaining.
  @nonVirtual
  D structSetTag(String newTag) {
    $state.tag = newTag;
    return _self;
  }

  /// Whether [structMarkDisposed] has been called on this instance.
  bool get structIsDisposed => $state.isDisposed;

  /// Whether this struct requires an [op] to function correctly.
  ///
  /// `true` for resource structs; `false` for value-type structs (literals).
  bool get structRequiresOp => true;

  /// Marks this instance as disposed and clears [op].
  ///
  /// Called internally after the native resource is unloaded. Accessing
  /// [getOp] after disposal will throw.
  @nonVirtual
  void structMarkDisposed() {
    $state.isDisposed = true;
    op = null;
  }

  /// Calls [callback] with [op] if it is set, otherwise no-ops.
  @nonVirtual
  void structOnOp(void Function(StructPointer<D> p) callback) {
    if (op case StructPointer<D> op) callback(op);
  }

  /// Returns [op], throwing a descriptive [StateError] if unavailable or this instance [RaylibTempStructState.isDisposed].
  @nonVirtual
  StructPointer<D> getOp() {
    if ($state.isDisposed) {
      throw StateError(
        '$structName.getOp() was called on a disposed struct. '
        'The pointer is no longer valid and cannot be accessed.'
      );
    }

    if (op == null) {
      if (!structRequiresOp) {
        throw StateError('$structName.getOp() was called on a value-type struct that never owns a pointer.');
      } else {
        throw StateError(
          '$structName.getOp() was called but op is null. '
          'This struct requires a raylib-owned pointer but none has been assigned yet.'
        );
      }
    }
    return op!;
  }

  /// Returns [op] and immediately calls [structMarkDisposed].
  ///
  /// The canonical way to hand the pointer back to C and `unload`.
  /// Gets the pointer, then ensures this instance can no longer be used.
  @nonVirtual
  StructPointer<D> getOpAndDispose() {
    final pointer = getOp();
    structMarkDisposed();
    $state.dispose();
    return pointer;
  }

  /// Returns a deep copy of this instance without [op].
  ///
  /// Useful when you need an independent value that should not accidentally
  /// sync back into owned memory.
  D copy() {
    final clone = this.clone();
    clone.op = null;
    return clone;
  }

  /// Syncs all fields from the memory. Requires [op].
  void structSyncFromMemory() => structReadFrom(getOp());
  
  /// Syncs all fields to the memory. Requires [op].
  void structSyncToMemory() => structWriteInto(getOp());

  /// [StructLayout] of this object.
  StructLayout get structLayout;

  void _canonicalizeFloats(MemoryPointerHandle p) {
    for (final f in structLayout.floatFields) {
      switch (f.size) {
        case 4:
          final bits = p.readUint32(f.offset);
          if (bits == 0x80000000) p.writeUint32(f.offset, 0);
        case 8:
          final bits = p.readUint64(f.offset);
          if (bits == 0x8000000000000000) p.writeUint64(f.offset, 0);
        default:
          throw StateError('Invalid float size: ${f.size}.');
      }
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! D) return false;

    MemoryPointerHandle? srcPtr = op;
    if (srcPtr == null) {
      srcPtr = MemoryPointer.scratch(0);
      structWriteInto(srcPtr);
      _canonicalizeFloats(srcPtr);
    }

    MemoryPointerHandle? dstPtr = other.op;
    if (dstPtr == null) {
      dstPtr = MemoryPointer.scratch(1);
      other.structWriteInto(dstPtr);
      _canonicalizeFloats(dstPtr);
    }

    if (srcPtr.address == dstPtr.address) return true;

    return srcPtr.compareBytes(dstPtr, structLayout.byteSize) == 0;
  }

  @override
  int get hashCode {
    final op = this.op;

    // If memory-backed, hash native memory directly
    if (op != null) {
      _canonicalizeFloats(op);
      return op.computeByteHash(structLayout.byteSize);
    }

    // If unbacked, serialize and hash the bytes
    final scratch = MemoryPointer.scratch(0);
    structWriteInto(scratch);
    _canonicalizeFloats(scratch);
    return scratch.computeByteHash(structLayout.byteSize);
  }

  /// Returns a human-readable representation of this struct.
  String signature() => structName;

  @override
  String toString() => signature();
}

/// A [RaylibStruct] that is a live, read-only window over someone else's
/// native memory rather than an owner of its own data.
///
/// Unlike a regular [RaylibStruct], a view never copies field values into
/// Dart-side storage and never writes through: [structWriteInto] and [structReadFrom]
/// are no-ops, and [setDart] throws, since there is no independent Dart-side
/// state to sync, every field read reflects [op] at the moment of access.
///
/// [copy] is overridden to behave like [clone] (it keeps [op] instead
/// of detaching from it), because a view has no independent state to copy
/// *into* and detaching would just produce a struct with no backing memory
/// and stale/zeroed fields. Use [RaylibStructView] for structs you only
/// ever observe through a pointer you don't own.
abstract class RaylibStructView<D extends RaylibStruct<D>> extends RaylibStruct<D> {
  RaylibStructView({ super.op });

  @override
  @nonVirtual
  D setDart(D o) => throw UnsupportedError('$runtimeType: is just a view; cannot write to it.');

  @override
  void structWriteInto(MemoryPointerHandle p) {} // NOTE: do nothing

  @override
  void structReadFrom(MemoryPointerHandle p) {} // NOTE: do nothing

  @override
  D copy() => clone();

  @override
  String signature() => '$structName()';
}

/// A [RaylibStruct] that is a plain value type: field data lives entirely
/// in Dart-side storage and [op] is optional rather than required.
///
/// Unlike a regular [RaylibStruct], a literal can exist with `op == null` =>
/// [structRequiresOp] is `false`, so [getOp] is never called to make the
/// struct usable, only to interop with an API that wants a pointer. Reads
/// and writes go through Dart fields as normal; there is no backing memory
/// this instance must stay in sync with. Use [RaylibStructLiteral] for
/// structs you construct and pass by value (e.g. `Vector2`, `Color`)
/// rather than ones raylib hands you ownership of.
abstract class RaylibStructLiteral<D extends RaylibStruct<D>> extends RaylibStruct<D> {
  RaylibStructLiteral({
    super.op,
  });

  @override
  bool get structRequiresOp => false;
}