part of 'raylib_dartified_base.dart';

enum RaylibPlatform { native, web }

const RaylibPlatform currentRaylibPlatform = bool.fromEnvironment('dart.library.io')
  ? .native
  : .web;

/// Adds ordered comparison operators to Raylib enums that expose a raw [value],
/// mirroring C enum integer semantics.
mixin RaylibEnum on Enum {
  /// The underlying native integer value.
  int get value;

  bool operator <(RaylibEnum other) => value < other.value;
  bool operator >(RaylibEnum other) => value > other.value;
  bool operator <=(RaylibEnum other) => value <= other.value;
  bool operator >=(RaylibEnum other) => value >= other.value;
}

/// Convenience getters for formatting a [double] to a fixed number of decimal places.
extension DoubleFormatting on double {
  /// Formats this value to 0 decimal places.
  String get f0 => toStringAsFixed(0);
  /// Formats this value to 1 decimal place.
  String get f1 => toStringAsFixed(1);
  /// Formats this value to 2 decimal places.
  String get f2 => toStringAsFixed(2);
  /// Formats this value to 3 decimal places.
  String get f3 => toStringAsFixed(3);
  /// Formats this value to 4 decimal places.
  String get f4 => toStringAsFixed(4);
  /// Formats this value to 5 decimal places.
  String get f5 => toStringAsFixed(5);
  /// Formats this value to 6 decimal places.
  String get f6 => toStringAsFixed(6);
}

/// Base for module debug label generators, providing shared formatting utilities.
abstract class RaylibDebugLabelsBase {
  /// Formats [flags] as a `|`-separated string of enum names, mirroring C bitflag notation.
  String EnumsAsFlagsOr(Iterable<RaylibEnum> flags) => flags.map((e) => e.name).join(' | ');
}

/// Base for all Raylib callback wrappers, identified by [name].
mixin RaylibCallbackBase {
  /// Name to identify this callback with.
  String get name;
}

/// Base class for all Raylib module wrappers, providing debug logging, lifecycle
/// management, and sync control tied to a [RaylibBase] context [rl].
abstract class RaylibModule<R extends RaylibBase> {
  final R rl;

  RaylibModule(this.rl);

  /// If this module was loaded.
  bool _isLoaded = false;

  /// Ensures [load] is called exactly once, regardless of how many times [doLoad] is invoked.
  void doLoad() {
    if (_isLoaded) return;
    _isLoaded = true;
    load();
  }

  /// Override to perform one-time module initialization. Called by [doLoad].
  void load() {}

  /// If this module has debug log enabled.
  bool _debugEnabled = false;

  /// Enables or disables debug logging for this module.
  void debug(bool v) => _debugEnabled = v;

  /// If this module has debug log (with time) enabled.
  bool _debugTime = false;

  /// Enables or disables per-call timing output alongside debug logs.
  void debugTime(bool v) => _debugTime = true;
  
  void logInfo(Object? message) => rl.logInfo(message);
  void logWarn(Object? message) => rl.logWarn(message);
  void logError(Object? message) => rl.logError(message);

  /// Filters for filtering debug messages.
  final List<bool Function(String)> _debugFilters = [];

  /// Adds a predicate that gates debug output. Only messages satisfying at least one filter are logged.
  void debugFilter(bool Function(String) filter) => _debugFilters.add(filter);

  /// Returns `true` if no filters are registered, or if any registered filter matches [message].
  bool _matchesFilters(String message) => _debugFilters.isEmpty || _debugFilters.any((f) => f(message));

  /// Logs [message] at info level if debug is enabled and [message] passes all filters.
  void debugInfo(String message) { if (_debugEnabled && _matchesFilters(message)) logInfo(message); }

  /// Logs [message] at warn level if debug is enabled and [message] passes all filters.
  void debugWarn(String message) { if (_debugEnabled && _matchesFilters(message)) logWarn(message); }

  /// Logs [message] at error level if debug is enabled and [message] passes all filters.
  void debugError(String message) { if (_debugEnabled && _matchesFilters(message)) logError(message); }

  /// Executes [f], logging its label (and optionally timing it) when debug is enabled
  /// and the label passes all filters.
  T run<T>(String Function() name, T Function() f) {
    if (_debugEnabled) {
      final label = '[$runtimeType] ${name()}';
      if (_matchesFilters(label)) {
        if (_debugTime) return rl.timeIt(label, f);
        logInfo(label);
      }
    }
    return f();
  }

  /// Registry of callbacks to be executed on [dispose].
  final List<void Function()> _onDisposeFns = [];

  /// Registers [fn] to be called when this module is disposed.
  void onDispose(void Function() fn) => _onDisposeFns.add(fn);

  /// Executes [f] with [RaylibTempBase] syncing temporarily disabled,
  /// restoring the previous sync state afterward.
  T disableSync<T>(T Function() f) {
    final oldSyncing = rl.Temp.doSync;
    rl.Temp.enableSyncing(false);
    final result = f();
    rl.Temp.enableSyncing(oldSyncing);
    return result;
  }

  /// Calls all registered [onDispose] callbacks and clears them.
  @mustCallSuper
  void dispose() {
    _onDisposeFns.forEach((f) => f());
    _onDisposeFns.clear();
  }
}

sealed class RType {
  const RType();

  int get byteSize => switch (this) {
    RVoid()    => 0,
    RPointer() => switch (currentRaylibPlatform) {
      .native => 8,
      .web => 4,
    },
    RBool()    => 1,
    RInt8()    => 1,
    RUint8()   => 1,
    RInt16()   => 2,
    RUint16()  => 2,
    RInt32()   => 4,
    RUint32()  => 4,
    RInt64()   => 8,
    RUint64()  => 8,
    RFloat32() => 4,
    RFloat64() => 8,
    RStruct(:final _byteSize) => _byteSize,
  };
}

/// Marker type for a `void` type - any type.
final class RVoid extends RType { const RVoid(); }

/// A raw address into backend memory (native pointer or WASM byte offset).
/// Maps to any C pointer type (`void*`, `Image*`, `unsigned char*`, ...).
final class RPointer extends RType { const RPointer(); }

/// Unsigned 8-bit integer. Maps to C `bool`.
final class RBool extends RType { const RBool(); }

/// Signed 8-bit integer. Maps to C `int8_t`.
final class RInt8 extends RType { const RInt8(); }

/// Unsigned 8-bit integer. Maps to C `uint8_t`.
final class RUint8 extends RType { const RUint8(); }

/// Signed 16-bit integer. Maps to C `int16_t`.
final class RInt16 extends RType { const RInt16(); }

/// Unsigned 16-bit integer. Maps to C `uint16_t`.
final class RUint16 extends RType { const RUint16(); }

/// Signed 32-bit integer. Maps to C `int32_t`.
final class RInt32 extends RType { const RInt32(); }

/// Unsigned 32-bit integer. Maps to C `uint32_t`.
final class RUint32 extends RType { const RUint32(); }

/// Signed 64-bit integer. Maps to C `int64_t`.
final class RInt64 extends RType { const RInt64(); }

/// Unsigned 64-bit integer. Maps to C `uint64_t`.
final class RUint64 extends RType { const RUint64(); }

/// IEEE-754 single-precision float. Maps to C `float`.
final class RFloat32 extends RType { const RFloat32(); }

/// IEEE-754 double-precision float. Maps to C `double`.
final class RFloat64 extends RType { const RFloat64(); }

/// C `char`. Alias for [RInt8].
typedef RChar = RInt8;

/// C `unsigned char`. Alias for [RUint8].
typedef RUnsignedChar = RUint8;

/// C `short`. Alias for [RInt16].
typedef RShort = RInt16;

/// C `unsigned short`. Alias for [RUint16].
typedef RUnsignedShort = RUint16;

/// C `int`. Alias for [RInt32].
typedef RInt = RInt32;

/// C `unsigned int`. Alias for [RUint32].
typedef RUnsignedInt = RUint32;

/// C `float`. Alias for [RFloat32].
typedef RFloat = RFloat32;

/// C `double`. Alias for [RFloat64].
typedef RDouble = RFloat64;

final class RStruct<D extends RaylibStructObjectBase> extends RType {
  final int _byteSize;
  const RStruct(this._byteSize);
}

extension Int8Pointer on MemoryPointer<RInt8> {
  int get value => readInt8();
  set value(int v) => writeInt8(v);
}

extension Uint8Pointer on MemoryPointer<RUint8> {
  int get value => readUint8();
  set value(int v) => writeUint8(v);
}

extension Int16Pointer on MemoryPointer<RInt16> {
  int get value => readInt16();
  set value(int v) => writeInt16(v);
}

extension Uint16Pointer on MemoryPointer<RUint16> {
  int get value => readUint16();
  set value(int v) => writeUint16(v);
}

extension Int32Pointer on MemoryPointer<RInt32> {
  int get value => readInt32();
  set value(int v) => writeInt32(v);
}

extension Uint32Pointer on MemoryPointer<RUint32> {
  int get value => readUint32();
  set value(int v) => writeUint32(v);
}

extension Int64Pointer on MemoryPointer<RInt64> {
  int get value => readInt64();
  set value(int v) => writeInt64(v);
}

extension Uint64Pointer on MemoryPointer<RUint64> {
  int get value => readUint64();
  set value(int v) => writeUint64(v);
}

extension Float32Pointer on MemoryPointer<RFloat32> {
  double get value => readFloat32();
  set value(double v) => writeFloat32(v);
}

extension Float64Pointer on MemoryPointer<RFloat64> {
  double get value => readFloat64();
  set value(double v) => writeFloat64(v);
}

/// Backend-agnostic handle to a raw memory buffer returned by a C function.
abstract class MemoryPointer<X extends RType> {
  bool get isNull;

  /// Reinterprets this pointer as pointing to [Y] instead of [X].
  ///
  /// Same address/offset, no copy, no runtime check, purely a
  /// compile-time relabeling of what the memory is assumed to contain.
  /// The caller is responsible for [Y] actually matching the underlying data.
  MemoryPointer<Y> cast<Y extends RType>();

  /// Copies [length] bytes, viewed as [T].
  /// [T] must be a concrete TypedDataList type: Uint8List, Int32List,
  /// Float32List, etc. Throws if [T] isn't one of those.
  T to<T extends TypedDataList>(int length);

  /// Zero-copy view as [T]. Invalid after free()/heap growth.
  T asView<T extends TypedDataList>(int length);

  /// Frees the underlying allocation. Only call this if you
  /// actually own it.
  void free();

  /// Debug/logging only. Do NOT branch logic on this.
  int get address;

  /// Reads a NUL-terminated C string starting at this pointer,
  /// decoded as UTF-8. Scans for the NUL byte itself, no length needed.
  String toDartString();

  /// Reads at most [maxLength] bytes as a UTF-8 string, stopping
  /// early at a NUL byte if found first. Use when you know a bound
  /// (e.g. a fixed-size char buffer) but the string may be shorter.
  String toDartStringBounded(int maxLength);

  static MemoryPointer<RVoid> _defaultFromBytes<T extends TypedDataList>(T data) {
    throw UnsupportedError('MemoryPointer.fromBytes is not implemented');
  }

  /// Allocates a new pointer and writes [data] into it.
  /// 
  /// Caller owns the result and must free() it.
  static MemoryPointer<RVoid> Function<T extends TypedDataList>(T data) fromBytes = _defaultFromBytes;

  /// Allocates a new NUL-terminated UTF-8 C string from [text] and
  /// returns a pointer to it.
  /// 
  /// Caller owns the result and must free() it.
  static MemoryPointer<RUint8> Function(String text) fromString = (text) {
    throw UnsupportedError('MemoryPointer.fromString is not implemented');
  };

  /// Reads a pointer value at `address + byteOffset` and returns it typed as pointing to [Y].
  MemoryPointer<Y> readPointer<Y extends RType>([int byteOffset = 0]);

  /// Writes a pointer at given `address + byteOffset`.
  void writePointer(MemoryPointer<RType> value, [int byteOffset = 0]);

  /// Reads a value of type [RBool] at given `address + byteOffset`.
  bool readBool([int byteOffset = 0]) => readUint8(byteOffset) != 0;

  /// Reads a value of type [RInt8] at given `address + byteOffset`.
  int readInt8([int byteOffset = 0]);

  /// Reads a value of type [RUint8] at given `address + byteOffset`.
  int readUint8([int byteOffset = 0]);
  
  /// Reads a value of type [RInt16] at given `address + byteOffset`.
  int readInt16([int byteOffset = 0]);
  
  /// Reads a value of type [RUint16] at given `address + byteOffset`.
  int readUint16([int byteOffset = 0]);
  
  /// Reads a value of type [RInt32] at given `address + byteOffset`.
  int readInt32([int byteOffset = 0]);
  
  /// Reads a value of type [RUint32] at given `address + byteOffset`.
  int readUint32([int byteOffset = 0]);
  
  /// Reads a value of type [RInt64] at given `address + byteOffset`.
  int readInt64([int byteOffset = 0]);
  
  /// Reads a value of type [RUint64] at given `address + byteOffset`.
  int readUint64([int byteOffset = 0]);
  
  /// Reads a value of type [RFloat32] at given `address + byteOffset`.
  double readFloat32([int byteOffset = 0]);
  
  /// Reads a value of type [RFloat64] at given `address + byteOffset`.
  double readFloat64([int byteOffset = 0]);

  /// Reads a value of type [RChar] at given `address + byteOffset`.
  int readChar([int byteOffset = 0]) => readInt8(byteOffset);

  /// Reads a value of type [RUnsignedChar] at given `address + byteOffset`.
  int readUnsignedChar([int byteOffset = 0]) => readUint8(byteOffset);

  /// Reads a value of type [RShort] at given `address + byteOffset`.
  int readShort([int byteOffset = 0]) => readInt16(byteOffset);

  /// Reads a value of type [RUnsignedShort] at given `address + byteOffset`.
  int readUnsignedShort([int byteOffset = 0]) => readUint16(byteOffset);

  /// Reads a value of type [RInt] at given `address + byteOffset`.
  int readInt([int byteOffset = 0]) => readInt32(byteOffset);

  /// Reads a value of type [RUnsignedInt] at given `address + byteOffset`.
  int readUnsignedInt([int byteOffset = 0]) => readUint32(byteOffset);

  /// Reads a value of type [RFloat] at given `address + byteOffset`.
  double readFloat([int byteOffset = 0]) => readFloat32(byteOffset);

  /// Reads a value of type [RDouble] at given `address + byteOffset`.
  double readDouble([int byteOffset = 0]) => readFloat64(byteOffset);

  /// Writes a [value] of type [RBool] at given `address + byteOffset`.
  void writeBool(bool value, [int byteOffset = 0]);

  /// Writes a [value] of type [RInt8] at given `address + byteOffset`.
  void writeInt8(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RUint8] at given `address + byteOffset`.
  void writeUint8(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RInt16] at given `address + byteOffset`.
  void writeInt16(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RUint16] at given `address + byteOffset`.
  void writeUint16(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RInt32] at given `address + byteOffset`.
  void writeInt32(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RUint32] at given `address + byteOffset`.
  void writeUint32(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RInt64] at given `address + byteOffset`.
  void writeInt64(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RUint64] at given `address + byteOffset`.
  void writeUint64(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RFloat32] at given `address + byteOffset`.
  void writeFloat32(double value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RFloat64] at given `address + byteOffset`.
  void writeFloat64(double value, [int byteOffset = 0]);

  /// Writes a [value] of type [RChar] at given `address + byteOffset`.
  void writeChar(int value, [int byteOffset = 0]) => writeInt8(value, byteOffset);

  /// Writes a [value] of type [RUnsignedChar] at given `address + byteOffset`.
  void writeUnsignedChar(int value, [int byteOffset = 0]) => writeUint8(value, byteOffset);

  /// Writes a [value] of type [RShort] at given `address + byteOffset`.
  void writeShort(int value, [int byteOffset = 0]) => writeInt16(value, byteOffset);

  /// Writes a [value] of type [RUnsignedShort] at given `address + byteOffset`.
  void writeUnsignedShort(int value, [int byteOffset = 0]) => writeUint16(value, byteOffset);

  /// Writes a [value] of type [RInt] at given `address + byteOffset`.
  void writeInt(int value, [int byteOffset = 0]) => writeInt32(value, byteOffset);

  /// Writes a [value] of type [RUnsignedInt] at given `address + byteOffset`.
  void writeUnsignedInt(int value, [int byteOffset = 0]) => writeUint32(value, byteOffset);

  /// Writes a [value] of type [RFloat] at given `address + byteOffset`.
  void writeFloat(double value, [int byteOffset = 0]) => writeFloat32(value, byteOffset);

  /// Writes a [value] of type [RDouble] at given `address + byteOffset`.
  void writeDouble(double value, [int byteOffset = 0]) => writeFloat64(value, byteOffset);
}

/// A [ListMixin]-backed list that intercepts writes and forwards them to native
/// memory via [onElementSet] and [onSet].
abstract class _RaylibLiveListBase<E, L extends List<E>> extends ListMixin<E> {
  L _inner;

  _RaylibLiveListBase(this._inner);

  L get inner => _inner;
  set inner(L value) {
    _inner = value;
    onSet(value);
  }
  /// Called when element at [index] is set.
  /// Implement in platform-specific subclass to write through to memory.
  void onElementSet(int index, E value);

  /// Called when list is overwritten.
  /// Implement in platform-specific subclass to write through to memory.
  void onSet(L value);

  @override
  operator []=(int index, E value) {
    _inner[index] = value;
    onElementSet(index, value);
  }

  @override
  E operator [](int index) => _inner[index];

  @override
  int get length => _inner.length;

  @override
  set length(int newLength) => _inner.length = newLength;
}

/// Concrete [_RaylibLiveListBase] for untyped element lists.
abstract class RaylibLiveList<E> extends _RaylibLiveListBase<E, List<E>> {
  RaylibLiveList(super._inner);
}

/// Core identity and copy contract for Raylib struct mirror objects,
/// shared between pure Dart value types and native-backed [RaylibStructBase] instances.
mixin RaylibStructObjectBase<T> {
  /// Per-instance allocation state tracking slot keys, disposal, and identity.
  final RaylibTempStructState $state = RaylibTempStructState();

  /// The Dart-side type name of this struct
  String get structName => runtimeType.toString();

  /// Returns a human-readable representation of this struct.
  String signature() => structName;

  /// Copies the fields of [o] into this instance and returns `this`.
  T setD(T o);

  /// Returns a deep copy of this instance, preserving [RaylibStructBase.originalPointer] if present.
  T clone();

  /// Returns a deep copy of this instance without [RaylibStructBase.originalPointer].
  T copy();
}

/// Backend-agnostic base for Raylib struct mirror objects that are backed by
/// native memory, adding [originalPointer] ownership tracking on top of [RaylibStructObjectBase].
abstract class RaylibStructBase<T extends RaylibTempBase, P, D extends RaylibStructBase<T, P, D>> with RaylibStructObjectBase<D> {
  /// The C-owned or RaylibTemp-owned native pointer for this struct, if any.
  P? originalPointer;

  RaylibStructBase({
    this.originalPointer,
  });

  /// Sets [RaylibTempStructState.tag] to [newTag] and returns `this` for chaining.
  @nonVirtual
  D structSetTag(String newTag) {
    $state.tag = newTag;
    return this as D;
  }

  /// Whether [structMarkDisposed] has been called on this instance.
  bool get structIsDisposed => $state.isDisposed;

  /// Whether this struct requires an [originalPointer] to function correctly.
  ///
  /// `true` for resource structs; `false` for value-type structs (literals).
  bool get structRequiresOriginalPointer => true;

  /// Marks this instance as disposed and clears [originalPointer].
  ///
  /// Called internally after the native resource is unloaded. Accessing
  /// [getOriginalPointer] after disposal will throw.
  @nonVirtual
  void structMarkDisposed() {
    $state.isDisposed = true;
    originalPointer = null;
  }

  /// Calls [callback] with [originalPointer] if it is set, otherwise no-ops.
  @nonVirtual
  void structOnOp(void Function(P p) callback) {
    // ignore: null_check_on_nullable_type_parameter
    if (originalPointer != null) callback(originalPointer!);
  }

  /// Returns [originalPointer], throwing a descriptive [StateError] if unavailable or this instance [RaylibTempStructState.isDisposed].
  @nonVirtual
  P getOriginalPointer() {
    if ($state.isDisposed) {
      throw StateError(
        '$structName.getOriginalPointer() was called on a disposed struct. '
        'The pointer is no longer valid and cannot be accessed.'
      );
    }

    if (originalPointer == null) {
      if (!structRequiresOriginalPointer) {
        throw StateError('$structName.getOriginalPointer() was called on a value-type struct that never owns a pointer.');
      } else {
        throw StateError(
          '$structName.getOriginalPointer() was called but originalPointer is null. '
          'This struct requires a raylib-owned pointer but none has been assigned yet.'
        );
      }
    }
    return originalPointer!;
  }

  /// Returns [originalPointer] and immediately calls [structMarkDisposed].
  ///
  /// The canonical way to hand the pointer back to C and `unload`.
  /// Gets the pointer, then ensures this instance can no longer be used.
  @nonVirtual
  P getOriginalPointerAndDispose() {
    final pointer = getOriginalPointer();
    structMarkDisposed();
    return pointer;
  }

  /// Returns a deep copy of this instance without [originalPointer].
  ///
  /// Useful when you need an independent value that should not accidentally
  /// sync back into owned memory.
  @override
  D copy() {
    final clone = this.clone();
    clone.originalPointer = null;
    return clone;
  }

  /// Syncs Dart-side fields into the already-allocated native pointer [p]. Defaults to [structWriteInto].
  void structSyncInto(T temp, P p, String key) => structWriteInto(p);

  /// Allocates nested pointers into [temp] under [key] as needed.
  void structAllocateInto(T temp, P p, String key);

  /// Writes all fields into the memory at [p].
  void structWriteInto(P p);

  /// Reads all fields from the memory at [p].
  void structReadFrom(P p);

  /// Syncs all fields from the memory. Requires [originalPointer].
  void structSyncFromMemory();
  
  /// Syncs all fields to the memory. Requires [originalPointer].
  void structSyncToMemory();

  @override
  String toString() => signature();
}


/// Configuration options for [RaylibTempBase].
///
/// Controls the pre-allocated capacities of the various typed slot pools
/// within the temporary allocator.
class RaylibTempBaseOptions {
  /// The number of string slots to pre-allocate.
  ///
  /// Defaults to `4`. Increase this if your frame logic needs to pass
  /// more than 4 temporary strings to Raylib in a single tick.
  final int stringCount;

  const RaylibTempBaseOptions({
    this.stringCount = 4,
  });
}

/// Root class for a fully initialized Raylib context, exposing all modules,
/// extensions, lifecycle management, and forwarded constants and functions.
abstract class RaylibBase {
  final RaylibTempBaseOptions tempOptions;

  /// See [RaylibTempBase].
  RaylibTempBase get Temp;

  /// See [RaylibColorExtensionBase].
  RaylibColorExtensionBase get Color;

  /// See [RaylibEaseExtensionBase].
  RaylibEaseExtensionBase get Ease;

  /// See [RaylibQuaternionExtensionBase].
  RaylibQuaternionExtensionBase get Quat;

  /// See [RaylibMatrixExtensionBase].
  RaylibMatrixExtensionBase get Matrix;
  
  /// See [RaylibVectorExtensionBase].
  RaylibVectorExtensionBase get Vector;

  /// See [RaylibAudioModuleBase].
  RaylibAudioModuleBase get AudioD;

  /// See [RaylibCameraModuleBase].
  RaylibCameraModuleBase get CameraD;

  /// See [RaylibCoreModuleBase].
  RaylibCoreModuleBase get CoreD;

  /// See [RaylibGuiModuleBase].
  RaylibGuiModuleBase get GuiD;

  /// See [RaylibLightModuleBase].
  RaylibLightModuleBase get LightD;

  /// See [RaylibRlglModuleBase].
  RaylibRlglModuleBase get RlglD;

  /// See [RaylibUtilsModuleBase].
  RaylibUtilsModuleBase get Utils;

  /// Random number generator used by [rand] and [randC].
  math.Random random;

  RaylibBase({
    RaylibTempBaseOptions? tempOptions,
    math.Random? random,
  }) :
    tempOptions = tempOptions ?? .new(),
    random = random ?? .new()
  {
    if (this.tempOptions.stringCount < 4) {
      throw StateError(
        "Raylib expects at least 4 preallocated String slots, got ${this.tempOptions.stringCount}",
      );
    }
  }

  /// Calls [RaylibCoreModuleBase.CloseWindow] and [dispose].
  void CloseWindowAndDispose() {
    CoreD.CloseWindow();
    dispose();
  }

  /// All currently registered modules.
  List<RaylibModule> get registeredModules => _registeredModules.values.toList();

  /// Enables or disables debug logging across all modules and the temp allocator.
  void debugEverything(bool debug) {
    registeredModules.forEach((d) => d.debug(debug));
    Temp.debugFree(debug);
    Temp.debugSync(debug);
  }

  /// Logs a message at the info level.
  void logInfo(Object? message);

  /// Logs a message at the warn level.
  void logWarn(Object? message);

  /// Logs a message at the error level.
  void logError(Object? message);

  /// Executes [fn], logs its elapsed time under [label], and rethrows any exception
  /// with timing info attached.
  T timeIt<T>(String label, T Function() fn) {
    final sw = Stopwatch()..start();
    try {
      final result = fn();
      sw.stop();
      logInfo('$label: ${sw.elapsedMilliseconds}ms');
      return result;
    } catch (e) {
      sw.stop();
      logError(label);
      logError('THREW after ${sw.elapsedMilliseconds}ms : $e');
      rethrow;
    }
  }

  /// Registry of registered modules.
  final Map<Type, RaylibModule> _registeredModules = {};

  /// Registers [module], calls [RaylibModule.doLoad] on it, and returns it.
  /// Throws [StateError] if a module of the same type is already registered.
  T registerModule<T extends RaylibModule>(T module) {
    logInfo('Registering $T');
    final key = module.runtimeType;
    if (_registeredModules.containsKey(key)) {
      throw StateError("Module '$key' is already registered!");
    }
    _registeredModules[key] = module;
    module.doLoad();
    return module;
  }

  /// Returns the registered module of type [T]. Throws if not registered.
  T module<T extends RaylibModule>() => _registeredModules[T]! as T;

  /// Disposes a provided module. Does **not** remove it from the registry.
  void _disposeModule(RaylibModule module) {
    logInfo('Disposing ${module.runtimeType}');
    module.dispose();
  }

  /// Disposes all registered modules.
  @mustCallSuper
  void dispose() => registeredModules.forEach(_disposeModule);

  // Functions

  /// See [RaylibFunctions.Clamp].
  double Clamp(num value, num min, num max)
    => RaylibFunctions.Clamp(value, min, max);
  
  /// See [RaylibFunctions.Lerp].
  double Lerp(num start, num end, num amount)
    => RaylibFunctions.Lerp(start, end, amount);
  
  /// See [RaylibFunctions.Normalize].
  double Normalize(num value, num start, num end)
    => RaylibFunctions.Normalize(value, start, end);
  
  /// See [RaylibFunctions.Remap].
  double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd)
    => RaylibFunctions.Remap(value, inputStart, inputEnd, outputStart, outputEnd);
  
  /// See [RaylibFunctions.Wrap].
  double Wrap(num value, num min, num max)
    => RaylibFunctions.Wrap(value, min, max);
  
  /// See [RaylibFunctions.FloatEquals].
  bool FloatEquals(double x, double y)
    => RaylibFunctions.FloatEquals(x, y);

  // Constants

  /// See [RaylibConstants.RAYLIB_VERSION_MAJOR].
  final int RAYLIB_VERSION_MAJOR = RaylibConstants.RAYLIB_VERSION_MAJOR;

  /// See [RaylibConstants.RAYLIB_VERSION_MINOR].
  final int RAYLIB_VERSION_MINOR = RaylibConstants.RAYLIB_VERSION_MINOR;

  /// See [RaylibConstants.RAYLIB_VERSION_PATCH].
  final int RAYLIB_VERSION_PATCH = RaylibConstants.RAYLIB_VERSION_PATCH;

  /// See [RaylibConstants.RAYLIB_VERSION].
  final String RAYLIB_VERSION = RaylibConstants.RAYLIB_VERSION;

  /// See [RaylibConstants.PI].
  final double PI = RaylibConstants.PI;

  /// See [RaylibConstants.DEG2RAD].
  final double DEG2RAD = RaylibConstants.DEG2RAD;

  /// See [RaylibConstants.RAD2DEG].
  final double RAD2DEG = RaylibConstants.RAD2DEG;

  /// See [RaylibConstants.MATERIAL_MAP_DIFFUSE].
  final MaterialMapIndex MATERIAL_MAP_DIFFUSE = RaylibConstants.MATERIAL_MAP_DIFFUSE;

  /// See [RaylibConstants.MATERIAL_MAP_SPECULAR].
  final MaterialMapIndex MATERIAL_MAP_SPECULAR = RaylibConstants.MATERIAL_MAP_SPECULAR;

  /// See [RaylibConstants.MAX_MATERIAL_MAPS].
  final int MAX_MATERIAL_MAPS = RaylibConstants.MAX_MATERIAL_MAPS;

  /// See [RaylibConstants.SHADER_LOC_MAP_DIFFUSE].
  final ShaderLocationIndex SHADER_LOC_MAP_DIFFUSE = RaylibConstants.SHADER_LOC_MAP_DIFFUSE;

  /// See [RaylibConstants.SHADER_LOC_MAP_SPECULAR].
  final ShaderLocationIndex SHADER_LOC_MAP_SPECULAR = RaylibConstants.SHADER_LOC_MAP_SPECULAR;

  /// See [RaylibConstants.EPSILON].
  final double EPSILON = RaylibConstants.EPSILON;

  /// See [RaylibConstants.M_E].
  final double M_E = RaylibConstants.M_E;

  /// See [RaylibConstants.M_LOG2E].
  final double M_LOG2E = RaylibConstants.M_LOG2E;

  /// See [RaylibConstants.M_LOG10E].
  final double M_LOG10E = RaylibConstants.M_LOG10E;

  /// See [RaylibConstants.M_LN2].
  final double M_LN2 = RaylibConstants.M_LN2;

  /// See [RaylibConstants.M_LN10].
  final double M_LN10 = RaylibConstants.M_LN10;

  /// See [RaylibConstants.M_PI].
  final double M_PI = RaylibConstants.M_PI;

  /// See [RaylibConstants.M_PI_2].
  final double M_PI_2 = RaylibConstants.M_PI_2;

  /// See [RaylibConstants.M_PI_4].
  final double M_PI_4 = RaylibConstants.M_PI_4;

  /// See [RaylibConstants.M_1_PI].
  final double M_1_PI = RaylibConstants.M_1_PI;

  /// See [RaylibConstants.M_2_PI].
  final double M_2_PI = RaylibConstants.M_2_PI;

  /// See [RaylibConstants.M_2_SQRTPI].
  final double M_2_SQRTPI = RaylibConstants.M_2_SQRTPI;

  /// See [RaylibConstants.M_SQRT2].
  final double M_SQRT2 = RaylibConstants.M_SQRT2;

  /// See [RaylibConstants.M_SQRT1_2].
  final double M_SQRT1_2 = RaylibConstants.M_SQRT1_2;

  /// See [RaylibConstants.RAND_MAX].
  final int RAND_MAX = RaylibConstants.RAND_MAX;

  /// See [RaylibConstants.MAX_TOUCH_POINTS].
  final int MAX_TOUCH_POINTS = RaylibConstants.MAX_TOUCH_POINTS;

  /// Returns a random `double` in `[0.0, 1.0)`.
  double rand() => random.nextDouble();

  /// Returns a random `double` in `[0.0, RAND_MAX)`, mirroring C's `rand()` range.
  double randC() => rand() * RAND_MAX;
}

/// Platform-agnostic game lifecycle interface for Raylib applications.
///
/// Implement this to define your game logic independently of the backend.
/// Each backend provides its own [RaylibGameBase] subclass
/// and [runRaylib] function that drives the lifecycle in a platform-appropriate way.
///
/// The expected call order is:
/// 1. [init] = set up your game state and call [RaylibCoreModuleBase.InitWindow]
/// 2. [loop] = called every frame
/// 3. [close] = called when [shouldClose] returns `true`; call [RaylibCoreModuleBase.CloseWindow] here
/// 4. [dispose] = release Dart-side resources
abstract class RaylibGameBase<R extends RaylibBase> {

  /// Called once before the game loop starts.
  ///
  /// Use this to initialize game state and open the window via
  /// [RaylibCoreModuleBase.InitWindow].
  void init(R rl);

  /// Returns `true` when the game loop should stop.
  ///
  /// Defaults to [RaylibCoreModuleBase.WindowShouldClose]; override to
  /// implement custom exit conditions.
  bool shouldClose(R rl) => rl.CoreD.WindowShouldClose();

  /// Called once per frame while [shouldClose] returns `false`.
  Future<void> loop(R rl);

  /// Called once after [shouldClose] returns `true`.
  ///
  /// Defaults to [RaylibCoreModuleBase.CloseWindow]; override to perform
  /// additional cleanup before the window closes.
  void close(R rl) => rl.CoreD.CloseWindow();

  /// Called after [close] to release any remaining Dart-side resources.
  ///
  /// Defaults to [RaylibBase.dispose].
  void dispose(R rl) => rl.dispose();
}

// NOTE: each backend implements it's own function
// void runRaylib(RaylibGameBase game, {String? nativeLibPath});