part of '../raylib_dartified_base.dart';

typedef StructFactory<D extends RaylibStruct<D>> = D Function({
  StructPointer<D>? op,
});

typedef StructPointerFactory<D extends RaylibStruct<D>> = StructPointer<D> Function(MemoryPointer?);

/// Per-instance allocation state for a [RaylibStruct] mirror object,
/// tracking its current slot key, tag, disposal status, and stable identity
/// across repeated [RaylibTempStructAllocator.Allocate] calls.
final class RaylibTempStructState with RaylibDisposable {
  /// The slot tag used to disambiguate [RaylibTemp] keys for this instance.
  ///
  /// Defaults to `'default'`. Change via [RaylibStruct.structSetTag].
  String tag = 'struct';
  
  /// The [RaylibTemp] slot key used during the most recent [RaylibTempStructAllocator.Allocate] allocation.
  String? allocKey;
  
  /// Whether [RaylibStruct.structMarkDisposed] has been called on this instance.
  bool isDisposed = false;
  
  /// Whether [RaylibTempStructAllocator.Allocate] has never been called for this instance.
  ///
  /// Used to full sync once to push pre-promotion Dart state to memory on the first
  /// [RaylibTempStructAllocator.Allocate] allocation.
  bool isFirstSync = true;

  /// A stable numeric ID assigned on first [RaylibTempStructAllocator.Allocate] call for pointer-owning structs.
  ///
  /// Incorporated into slot keys to prevent collisions between distinct instances
  /// of the same struct type sharing the same [tag].
  int? internalId;
  
  static int _internalIdCounter = 0;
  int get nextId => internalId ??= ++_internalIdCounter;
}

// NOTE: customizable alignment?
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
//     var align = type is RStruct ? type.alignment : type.elementByteSize;
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

/// Backend-agnostic struct layout: field -> byte offset, plus total size.
/// Computes C-style natural-alignment offsets: each field's alignment
/// equals its own size, offset is rounded up to that alignment, and the
/// total struct size is rounded up to the largest field alignment.
/// This reproduces real C struct layout for flat structs of primitives
/// and pointers.
final class StructLayout<E extends StructFields> {
  /// Maps each field to the [RType] describing it.
  final Map<E, RType> fields;
  final Map<E, int> offsets;
  final int byteSize;
  final int alignment;

  const StructLayout._(this.fields, this.offsets, this.byteSize, this.alignment);

  factory StructLayout.aligned(Map<E, RType> fields) {
    final offsets = <E, int>{};
    var offset = 0;
    var maxAlign = 1;
    for (final entry in fields.entries) {
      final type = entry.value;
      final align = type is RStruct ? type.layout.alignment : type.byteSize;
      offset = (offset + align - 1) ~/ align * align;
      offsets[entry.key] = offset;
      offset += type.byteSize;
      if (align > maxAlign) maxAlign = align;
    }
    final total = (offset + maxAlign - 1) ~/ maxAlign * maxAlign;
    return StructLayout._(fields, offsets, total, maxAlign);
  }

  int offset(E field) => offsets[field]!;

  void _checkField(E f) {
    if (!offsets.containsKey(f)) {
      throw StateError("You have defined a field `${f.name}`, but you didn't provide it in a struct layout!");
    }
  }
  
  // String values

  StructStringCharArrayField<R> stringCharArray<R extends RType>(E f) {
    _checkField(f);
    
    final type = fields[f]! as RArray<R>;
    final element = type.element;

    if (element is! RInt8 && element is! RInt16 && element is! RInt32) {
      throw UnsupportedError(
        "Invalid element type $R for char array field. Use either RInt8, RInt16 or RInt32."
      );
    }

    return .new(offset(f), type.count);
  }

  StructStringPointerCharField<R> stringPointerChar<R extends RType>(E f) {
    _checkField(f);

    final type = fields[f]! as RPointer<R>;
    final element = type.target;

    if (element is! RInt8 && element is! RInt16 && element is! RInt32) {
      throw UnsupportedError(
        "Invalid element type $R for pointer char field. Use either RInt8, RInt16 or RInt32."
      );
    }

    return .new(offset(f));
  }

  // Inline values

  StructValueField<T, R> scalar<T, R extends RType>(E f) {
    _checkField(f);
    final type = fields[f]! as R;
    return .new(offset(f), ScalarCodec<T, R>(type));
  }

  StructValueField<T, RStruct> struct<T extends RaylibStruct<T>>(
    E f,
    StructPointerFactory<T> pointer,
  ) {
    _checkField(f);
    return .new(offset(f), StructCodec<T>(pointer));
  }

  R _getFieldAs<R extends RType>(E f) {
    final type = fields[f]!;
    try {
      return type as R;
    } catch (_) {
      throw ArgumentError(
        "Layout field `${f.name}` is `${type.runtimeType}`, but was requested as `$R`."
      );
    }
  }

  StructEnumValueField<X, R> enumValue<
    X extends RaylibEnum,
    R extends RType
  >(E f, X Function(int) enumFactory) {
    _checkField(f);
    final type = _getFieldAs<R>(f);
    if (type is! RTypeIntLike) {
      throw ArgumentError(
        "Layout field `${f.name}` has element type `$R`, which is not int-like. "
        "Enum values require an RTypeIntLike (e.g. RInt8, RUint32)."
      );
    }
    return .new(offset(f), .new(type, enumFactory));
  }

  // Inline arrays

  StructArrayField<T, R> scalarArray<T, R extends RType>(E f) {
    _checkField(f);
    final type = fields[f]! as RArray<R>;
    return .new(offset(f), type.count, ScalarCodec<T, R>(type.element));
  }

  StructArrayField<T, RStruct> structArray<T extends RaylibStruct<T>>(
    E f,
    StructPointerFactory<T> pointer,
  ) {
    _checkField(f);
    final type = fields[f]! as RArray<RStruct>;
    return .new(offset(f), type.count, StructCodec<T>(pointer));
  }

  // Pointer to one value

  StructPointerField<T, R> pointerScalar<T, R extends RType>(E f) {
    _checkField(f);
    final type = fields[f]! as RPointer<R>;
    return .new(offset(f), ScalarCodec<T, R>(type.target));
  }

  StructPointerField<T, RStruct> pointerStruct<T extends RaylibStruct<T>>(
    E f,
    StructPointerFactory<T> pointer,
  ) {
    _checkField(f);
    final _ = fields[f]! as RPointer<RStruct>; // exists to check the type
    return .new(offset(f), StructCodec<T>(pointer));
  }

  // Pointer to variable-size array

  StructPointerArrayField<T, R> pointerScalarArray<T, R extends RType>(E f) {
    _checkField(f);
    final type = fields[f]! as RPointer<R>;
    return .new(offset(f), ScalarCodec<T, R>(type.target));
  }

  StructPointerArrayField<T, RStruct> pointerStructArray<T extends RaylibStruct<T>>(
    E f,
    StructPointerFactory<T> pointer,
  ) {
    _checkField(f);
    return .new(offset(f), StructCodec<T>(pointer));
  }

  // Pointer to fixed-size array

  StructPointerArrayField<T, R> pointerScalarFixedArray<T, R extends RType>(E f) {
    _checkField(f);
    final type = fields[f]! as RPointer<RArray<R>>;
    final array = type.target;
    return .new(offset(f), ScalarCodec<T, R>(array.element), count: array.count);
  }

  StructPointerArrayField<T, RStruct> pointerStructFixedArray<T extends RaylibStruct<T>>(
    E f,
    StructPointerFactory<T> pointer,
  ) {
    _checkField(f);
    final type = fields[f]! as RPointer<RArray<RStruct>>;
    final array = type.target;
    return .new(offset(f), StructCodec<T>(pointer), count: array.count);
  }
}

/// Backend-agnostic base for Raylib struct mirror objects that are backed by
/// native memory, adding [op] ownership tracking on top.
abstract class RaylibStruct<D extends RaylibStruct<D>> {
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
  D setDart(D o) => this as D;

  void structWriteInto(MemoryPointer<RStruct> p);
  
  void structReadFrom(MemoryPointer<RStruct> p);

  /// Returns a deep copy of this instance, preserving [op] if present.
  D clone();

  // === ====================== ===

  /// The Dart-side type name of this struct
  String get structName => runtimeType.toString();

  /// Sets [RaylibTempStructState.tag] to [newTag] and returns `this` for chaining.
  @nonVirtual
  D structSetTag(String newTag) {
    $state.tag = newTag;
    return this as D;
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
    // ignore: null_check_on_nullable_type_parameter
    if (op != null) callback(op!);
  }

  /// Returns [op], throwing a descriptive [StateError] if unavailable or this instance [RaylibTempStructState.isDisposed].
  @nonVirtual
  StructPointer<D> getOp() {
    if ($state.isDisposed) {
      throw StateError(
        '$structName.getop() was called on a disposed struct. '
        'The pointer is no longer valid and cannot be accessed.'
      );
    }

    if (op == null) {
      if (!structRequiresOp) {
        throw StateError('$structName.getop() was called on a value-type struct that never owns a pointer.');
      } else {
        throw StateError(
          '$structName.getop() was called but op is null. '
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

  /// Allocates nested pointers into [temp] under [key] as needed.
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {}

  /// Syncs all fields from the memory. Requires [op].
  void structSyncFromMemory() => structReadFrom(getOp().ptr);
  
  /// Syncs all fields to the memory. Requires [op].
  void structSyncToMemory() => structWriteInto(getOp().ptr);

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
  void structWriteInto(MemoryPointer<RStruct> p) {} // NOTE: do nothing

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {} // NOTE: do nothing

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