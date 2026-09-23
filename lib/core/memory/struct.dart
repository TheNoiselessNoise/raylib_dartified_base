part of '../raylib_dartified_base.dart';

typedef StructFactory<D extends RaylibStruct<D>> = D Function({ StructPointer<D>? op });
typedef StructPointerFactory<D extends RaylibStruct<D>> = StructPointer<D> Function(MemoryPointer?);

/// Per-instance allocation state for a [RaylibStruct] mirror object,
/// tracking its current slot key, tag, disposal status, and stable identity
/// across repeated [RaylibTempStructAllocator.Allocate] calls.
final class RaylibTempStructState with RaylibDisposable {
  /// The slot tag used to disambiguate [RaylibTemp] keys for this instance.
  ///
  /// Defaults to `default`. Change via [RaylibStruct.structSetTag].
  String tag = 'default';
  
  /// Whether [RaylibStruct.structMarkDisposed] has been called on this instance.
  bool isDisposed = false;
  
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

mixin StructFields on Enum {}

class StructLayoutFloatSlot {
  final int offset;
  final int size; // 4 or 8, from RFloat/RDouble
  const StructLayoutFloatSlot(this.offset, this.size);
}

/// Describes the memory layout of a backend-agnostic struct.
///
/// Stores each field's [RType], byte offset, floating-point slots, total
/// [byteSize], and required [alignment].
///
/// Computes C-style natural alignment: each field is aligned according to
/// its own alignment requirement, and the total struct size is rounded up
/// to the largest field alignment.
final class StructLayout<F extends StructFields> {
  /// Maps each field to the [RType] describing its memory representation.
  final Map<F, RType> fields;

  /// Maps each field to its byte offset from the beginning of the struct.
  final Map<F, int> offsets;

  /// Float fields whose values require IEEE-754 canonicalization.
  ///
  /// Used to normalize negative zero (`-0.0`) to positive zero (`0.0`) after
  /// writing or modifying struct memory.
  final List<StructLayoutFloatSlot> floatFields;

  /// The total size of the struct in bytes, including trailing alignment.
  final int byteSize;

  /// The alignment requirement of the struct in bytes.
  final int alignment;

  const StructLayout._(
    this.fields,
    this.offsets,
    this.floatFields,
    this.byteSize,
    this.alignment,
  );

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
      for (final e in type.struct.layout.fields.entries) {
        _walkFloatSlots(e.value, baseOffset + type.struct.layout.offset(e.key), slots);
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

  /// Creates a naturally aligned struct layout from [fields].
  ///
  /// Each field is placed at the next offset satisfying its alignment
  /// requirement. The final struct size is rounded up to the largest
  /// alignment used by any field.
  ///
  /// This matches the layout rules used by C for flat structs containing
  /// primitives and pointers.
  static StructLayout<F> aligned<F extends StructFields>(Map<F, RType> fields) {
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
    assert(
      total <= RaylibConfig.maxStructByteSize,
      '$F StructLayout byteSize ($total) exceeds MAX_STRUCT_BYTE_SIZE',
    );
    return StructLayout._(fields, offsets, floatFields, total, maxAlign);
  }

  /// Returns the byte offset of [field] within the struct.
  int offset(F field) {
    _checkField(field);
    return offsets[field]!;
  }

  /// Creates a scalar value field for [f].
  ///
  /// [f] must describe a scalar-compatible [RType].
  StructValueField<E, R> scalar<E, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<R>(f);
    return .new(offset(f), ScalarCodec(type));
  }

  /// Creates a nested struct value field for [f].
  StructValueField<T, RStruct> struct<T extends RaylibStruct<T>>(F f) {
    _checkField(f);
    final type = _getFieldAs<RStruct>(f);
    return .new(offset(f), StructCodec<T>(type));
  }

  /// Creates an enum value field for [f].
  ///
  /// [enumFactory] converts the integer representation stored in memory
  /// into the corresponding [RaylibEnum] value.
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

  /// Creates a fixed-size character array field for [f].
  ///
  /// The array is interpreted as a null-terminated string using the
  /// character type represented by the field's element type.
  StructStringValueField<R> stringAsCharArray<R extends RTypeIntLike>(F f) {
    _checkField(f);
    final type = _getFieldAs<RArray<R>>(f);
    final element = type.element;
    _checkStringType(f, element, 'char array field');
    return .new(offset(f), StringCodec(element));
  }

  /// Creates a pointer-to-character string field for [f].
  ///
  /// The field represents a C-style `T*` string pointer, where `T` is an
  /// integer-like character type.
  StructPointerValueField<String, R> stringAsPointerChar<R extends RTypeIntLike>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final element = type.target;
    _checkStringType(f, element, 'pointer char field');
    final stringCodec = StringCodec(element);
    final pointerCodec = PointerCodec(type, stringCodec);
    return .new(offset(f), pointerCodec);
  }

  /// Creates a fixed-size scalar array field for [f].
  StructValueField<List<T>, RArray<R>> scalarArray<T, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RArray<R>>(f);
    final scalarCodec = ScalarCodec<T, R>(type.element);
    final arrayCodec = ArrayCodec(type, scalarCodec, type.count);
    return .new(offset(f), arrayCodec);
  }

  /// Creates a fixed-size nested struct array field for [f].
  StructValueField<List<T>, RArray<RStruct>> structArray<T extends RaylibStruct<T>>(F f) {
    _checkField(f);
    final type = _getFieldAs<RArray<RStruct>>(f);
    final structCodec = StructCodec<T>(type.element);
    final arrayCodec = ArrayCodec(type, structCodec, type.count);
    return .new(offset(f), arrayCodec);
  }

  /// Creates a pointer-to-scalar field for [f].
  ///
  /// The field represents a C-style `T*` pointer to a scalar value.
  StructPointerValueField<T, R> pointerScalar<T, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final scalarCodec = ScalarCodec<T, R>(type.target);
    final pointerCodec = PointerCodec(type, scalarCodec);
    return .new(offset(f), pointerCodec);
  }

  /// Creates a pointer-to-struct field for [f].
  ///
  /// The field represents a C-style `T*` pointer to a nested struct.
  StructPointerValueField<T, RStruct> pointerStruct<T extends RaylibStruct<T>>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RStruct>>(f);
    final structCodec = StructCodec<T>(type.target);
    final pointerCodec = PointerCodec(type, structCodec);
    return .new(offset(f), pointerCodec);
  }

  /// Creates a pointer-to-enum field for [f].
  ///
  /// The field represents a C-style `T*` pointer whose target value is
  /// interpreted as a [RaylibEnum].
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

  /// Creates a pointer-to-unknown-value field for [f].
  ///
  /// The pointed-to value is exposed without applying a specialized
  /// scalar, struct, or enum conversion.
  StructPointerValueField<dynamic, R> pointerUnknown<R extends RTypeUnknownLike>(F f)
    => pointerSync<dynamic, R>(f);

  /// Create a pointer-to-any-value field for [f].
  ///
  /// The pointed-to value is exposed without applying a specialized
  /// scalar, struct, or enum conversion.
  StructPointerValueField<dynamic, R> pointerAny<R extends RType>(F f)
    => pointerSync<dynamic, R>(f);

  /// Creates a synchronized pointer field for [f].
  ///
  /// Uses [UnknownCodec] to keep the pointed-to value synchronized without
  /// imposing a specialized value representation.
  StructPointerValueField<X, R> pointerSync<X, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final unknownCodec = UnknownCodec<X, R>(type.target);
    final pointerCodec = PointerCodec(type, unknownCodec);
    return .new(offset(f), pointerCodec);
  }

  /// Creates a pointer to a fixed-size scalar array field for [f].
  ///
  /// The field represents a C-style `T*` pointing to exactly [RArray.count]
  /// scalar elements.
  StructPointerValueField<List<T>, RArray<R>> pointerScalarFixedArray<T, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RArray<R>>>(f);
    final array = type.target;
    final scalarCodec = ScalarCodec<T, R>(array.element);
    final arrayCodec = ArrayCodec(type.target, scalarCodec, array.count);
    final pointerCodec = PointerCodec(type, arrayCodec);
    return .new(offset(f), pointerCodec);
  }

  /// Creates a pointer to a fixed-size struct array field for [f].
  ///
  /// The field represents a C-style `T*` pointing to exactly
  /// [RArray.count] nested structs.
  StructPointerValueField<List<T>, RArray<RStruct>> pointerStructFixedArray<T extends RaylibStruct<T>>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RArray<RStruct>>>(f);
    final array = type.target;
    final structCodec = StructCodec<T>(array.element);
    final arrayCodec = ArrayCodec(type.target, structCodec, array.count);
    final pointerCodec = PointerCodec(type, arrayCodec);
    return .new(offset(f), pointerCodec);
  }

  /// Creates a variable-length scalar pointer array field for [f].
  ///
  /// The field represents a C-style `T*` where the number of elements is
  /// determined externally rather than encoded in the struct type.
  StructPointerArrayField<T, R> pointerScalarArray<T, R extends RType>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<R>>(f);
    final scalarCodec = ScalarCodec<T, R>(type.target);
    final pointerCodec = PointerCodec(type, scalarCodec);
    return .new(offset(f), pointerCodec);
  }

  /// Creates a variable-length struct pointer array field for [f].
  ///
  /// The field represents a C-style `T*` pointing to a sequence of nested
  /// structs whose element count is determined externally.
  StructPointerArrayField<T, RStruct> pointerStructArray<T extends RaylibStruct<T>>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RStruct>>(f);
    final structCodec = StructCodec<T>(type.target);
    final pointerCodec = PointerCodec(type, structCodec);
    return .new(offset(f), pointerCodec);
  }

  /// Creates a pointer-to-pointer scalar array field for [f].
  ///
  /// The field represents a C-style `T**`: an outer pointer points to
  /// pointers, and each inner pointer points to a scalar value.
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

  /// Creates a pointer-to-pointer struct array field for [f].
  ///
  /// The field represents a C-style `T**`: an outer pointer points to
  /// pointers, and each inner pointer points to a nested struct.
  StructPointerArrayField<T, RPointer<RStruct>> pointerPointerStructArray<T extends RaylibStruct<T>>(F f) {
    _checkField(f);
    final type = _getFieldAs<RPointer<RPointer<RStruct>>>(f);
    final structCodec = StructCodec<T>(type.target.target);
    final innerPointerCodec = PointerCodec(type.target, structCodec);
    final pointerCodec = PointerCodec(type, innerPointerCodec);
    return .new(offset(f), pointerCodec);
  }
}

/// Base type for objects backed by native (C-side) struct memory.
///
/// Every [RaylibStruct] is defined by two independent, orthogonal axes:
///
/// ### 1. Slot allocation
/// Does [RaylibTempStructAllocator.Allocate] give a fresh slot, or reuse the one already at `key`?
///
///   * **Unique** => each call to `Allocate` for this key claims a new,
///     independent slot. Used for structs with real identity: two
///     `RaylibStruct` instances allocated at the same key are still
///     backed by distinct memory.
///   * **Reused** => calls to `Allocate` for this key reuse the same
///     underlying slot every time. Used for value types that are
///     constructed, written, and consumed within a single call, there's
///     nothing to preserve between calls, so there's no reason to burn a
///     fresh slot each time.
///
/// ### 2. [op] preservation
/// After [RaylibTempStructAllocator.Allocate] returns, does the struct keep its pointer, or does it forget it?
///
///   * **Preserved** => [op] remains set after allocation. The struct is
///     assumed "live": its pointer is meaningful beyond the current call,
///     and future code may read or reuse it directly.
///   * **Not preserved** => [op] is cleared back to `null` once the value
///     has been written into its slot. The pointer was scratch: valid
///     only for the duration of the call that allocated it, and must not
///     be treated as identity afterward.
///
/// | | unique slot | reused slot |
/// |:---:|:---:|:---:|
/// | **[op] preserved**     | [RaylibStruct] (default) / [RaylibStructView] | *(invalid, see below)* |
/// | **[op] not preserved** | *(no reason to, see below)*                  | [RaylibStructLiteral]   |
///
/// Preserving [op] on a *reused* slot is a bug, not just an unused
/// combination: it means the struct believes it owns a pointer that
/// another `Allocate` call for the same key may silently overwrite out
/// from under it. The inverse, burning a *unique* slot but immediately
/// discarding [op], is simply wasteful: there is no benefit to unique
/// backing memory the struct doesn't remember how to find again.
///
/// [RaylibStruct] itself is the "owned" default: unique slot, [op]
/// preserved. [RaylibStructView] refines it with a stricter invariant,
/// [op] isn't just preserved, it's *mandatory*: constructing a view
/// without one, or clearing it, throws [StateError]. [RaylibStructLiteral]
/// is the other extreme: a plain value type (`Vector2`, `Color`) whose
/// real data lives entirely in Dart-side fields, where [op] is at most
/// transient interop scaffolding for a single native call.
abstract class RaylibStruct<D extends RaylibStruct<D>> {
  D get _self => this as D;
  bool get _requiresOp => this is! RaylibStructLiteral;

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

  /// Copies the fields of [o] into this instance.
  D setDart(D o) => _self;

  /// Allocates nested pointers into [temp] under [key] as needed.
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {}

  void structWriteInto(MemoryPointer p);
  
  void structReadFrom(MemoryPointer p);

  /// Returns a deep copy of this instance, preserving [op] if present.
  D clone();

  // === ====================== ===

  /// The Dart-side type name of this struct
  String get structName => runtimeType.toString();

  /// Sets [RaylibTempStructState.tag] to [newTag].
  @nonVirtual
  D structSetTag(String newTag) {
    $state.tag = newTag;
    return _self;
  }

  /// Whether [structMarkDisposed] has been called on this instance.
  bool get structIsDisposed => $state.isDisposed;

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
      if (!_requiresOp) {
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

  /// Returns [op] and immediately disposes this struct.
  ///
  /// This is the canonical way to hand a resource-backed struct over to a C API
  /// that takes ownership of the underlying memory.
  @nonVirtual
  StructPointer<D> getOpAndDispose() {
    final ptr = getOp();
    structMarkDisposed();
    $state.dispose();
    return ptr;
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

  void _canonicalizeFloats(MemoryPointer p) {
    final type = StructTypes.of<D>();
    for (final f in type.layout.floatFields) {
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

    final type = StructTypes.of<D>();

    ScratchHandle? srcBuffer;
    ScratchHandle? dstBuffer;
    try {
      MemoryPointer? srcPtr = op;
      if (srcPtr == null) {
        srcBuffer = MemoryScratch.acquire();
        srcPtr = srcBuffer.pointer;
        structWriteInto(srcPtr);
        _canonicalizeFloats(srcPtr);
      }

      MemoryPointer? dstPtr = other.op;
      if (dstPtr == null) {
        dstBuffer = MemoryScratch.acquire();
        dstPtr = dstBuffer.pointer;
        other.structWriteInto(dstPtr);
        _canonicalizeFloats(dstPtr);
      }

      if (srcPtr.address == dstPtr.address) return true;

      return srcPtr.compareBytes(dstPtr, type.layout.byteSize) == 0;
    } finally {
      dstBuffer?.release();
      srcBuffer?.release();
    }
  }

  @override
  int get hashCode {
    final op = this.op;
    final type = StructTypes.of<D>();

    // If memory-backed, hash native memory directly
    if (op != null) {
      _canonicalizeFloats(op);
      return op.computeByteHash(type.layout.byteSize);
    }

    // If unbacked, serialize and hash the bytes
    final scratch = MemoryScratch.acquire();
    try {
      final ptr = scratch.pointer;
      structWriteInto(ptr);
      _canonicalizeFloats(ptr);
      return ptr.computeByteHash(type.layout.byteSize);
    } finally {
      scratch.release();
    }
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
/// Dart-side storage and never writes through:
/// [structAllocateInto], [structWriteInto] and [structReadFrom]
/// are no-ops, and [setDart] throws, since there is no independent Dart-side
/// state to sync, every field read reflects [op] at the moment of access.
///
/// [clone] returns the same view instance because a view has no independent
/// state to clone. [copy] delegates to [clone] and therefore also preserves
/// the backing pointer.
///
/// A [RaylibStructView] represents data that is only observed through a
/// pointer it does not own; use [RaylibStructView] when the struct should
/// remain tied to that external memory.
abstract class RaylibStructView<D extends RaylibStruct<D>> extends RaylibStruct<D> {
  // NOTE: we can't make `op` as `required` unfortunately
  RaylibStructView({super.op}) {
    if (op == null) {
      throw StateError(
        '$runtimeType requires a backing memory pointer.',
      );
    }
  }

  @override
  set op(StructPointer<D>? value) {
    if (value == null) {
      throw StateError(
        '$runtimeType requires a backing memory pointer.',
      );
    }
    super.op = value;
  }

  @override
  @nonVirtual
  D setDart(D o) => throw UnsupportedError('$runtimeType: is just a view; cannot write to it.');

  @override
  @nonVirtual
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {} // NOTE: do nothing

  @override
  @nonVirtual
  void structWriteInto(MemoryPointer p) {} // NOTE: do nothing

  @override
  @nonVirtual
  void structReadFrom(MemoryPointer p) {} // NOTE: do nothing

  @override
  @nonVirtual
  D clone() => _self;

  @override
  @nonVirtual
  D copy() => clone();

  @override
  String signature() => '$structName()';
}

/// A [RaylibStruct] that is a plain value type: field data lives entirely
/// in Dart-side storage and [op] is optional rather than required.
///
/// Unlike a regular [RaylibStruct], a literal can exist with `op == null`,
/// so [getOp] is never called to make the struct usable, only to interop
/// with an API that wants a pointer. Reads and writes go through Dart
/// fields as normal; there is no backing memory this instance must stay in
/// sync with. Use [RaylibStructLiteral] for structs you construct and pass
/// by value (e.g. `Vector2`, `Color`) rather than ones C hands you ownership of.
abstract class RaylibStructLiteral<D extends RaylibStruct<D>> extends RaylibStruct<D> {
  RaylibStructLiteral({ super.op });
}