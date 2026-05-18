part of 'raylib_dartified_base.dart';

/// Adds ordered comparison operators to Raylib enums that expose a raw [value],
/// mirroring C enum integer semantics.
mixin RaylibEnum on Enum {
  int get value;

  bool operator <(RaylibEnum other) => value < other.value;
  bool operator >(RaylibEnum other) => value > other.value;
  bool operator <=(RaylibEnum other) => value <= other.value;
  bool operator >=(RaylibEnum other) => value >= other.value;
}

/// Convenience getters for formatting a [double] to a fixed number of decimal places.
extension DoubleFormatting on double {
  String get f0 => toStringAsFixed(0);
  String get f1 => toStringAsFixed(1);
  String get f2 => toStringAsFixed(2);
  String get f3 => toStringAsFixed(3);
  String get f4 => toStringAsFixed(4);
  String get f5 => toStringAsFixed(5);
  String get f6 => toStringAsFixed(6);
}

/// Base for module debug label generators, providing shared formatting utilities.
abstract class RaylibDebugLabelsBase {
  /// Formats [flags] as a `|`-separated string of enum names, mirroring C bitflag notation.
  String EnumsAsFlagsOr(Iterable<RaylibEnum> flags) => flags.map((e) => e.name).join(' | ');
}

/// Base for all Raylib callback wrappers, identified by [name].
mixin RaylibCallbackBase {
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

  /// Returns a human-readable representation of this struct's current field values.
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
  /// sync back into raylib-owned memory.
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

  RaylibTempBase get Temp;
  RaylibColorExtensionBase get Color;
  RaylibEaseExtensionBase get Ease;
  RaylibQuaternionExtensionBase get Quat;
  RaylibMatrixExtensionBase get Matrix;
  RaylibVectorExtensionBase get Vector;

  RaylibAudioModuleBase get AudioD;
  RaylibCameraModuleBase get CameraD;
  RaylibCoreModuleBase get CoreD;
  RaylibGuiModuleBase get GuiD;
  RaylibLightModuleBase get LightD;
  RaylibRlglModuleBase get RlglD;
  RaylibUtilsModuleBase get Utils;

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

  double Clamp(num value, num min, num max) => RaylibFunctions.Clamp(value, min, max);
  double Lerp(num start, num end, num amount) => RaylibFunctions.Lerp(start, end, amount);
  double Normalize(num value, num start, num end) => RaylibFunctions.Normalize(value, start, end);
  double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd) => RaylibFunctions.Remap(value, inputStart, inputEnd, outputStart, outputEnd);
  double Wrap(num value, num min, num max) => RaylibFunctions.Wrap(value, min, max);
  bool FloatEquals(double x, double y) => RaylibFunctions.FloatEquals(x, y);

  // Constants

  final int RAYLIB_VERSION_MAJOR = RaylibConstants.RAYLIB_VERSION_MAJOR;
  final int RAYLIB_VERSION_MINOR = RaylibConstants.RAYLIB_VERSION_MINOR;
  final int RAYLIB_VERSION_PATCH = RaylibConstants.RAYLIB_VERSION_PATCH;
  final String RAYLIB_VERSION = RaylibConstants.RAYLIB_VERSION;
  final double PI = RaylibConstants.PI;
  final double DEG2RAD = RaylibConstants.DEG2RAD;
  final double RAD2DEG = RaylibConstants.RAD2DEG;
  final MaterialMapIndex MATERIAL_MAP_DIFFUSE = RaylibConstants.MATERIAL_MAP_DIFFUSE;
  final MaterialMapIndex MATERIAL_MAP_SPECULAR = RaylibConstants.MATERIAL_MAP_SPECULAR;
  final int MAX_MATERIAL_MAPS = RaylibConstants.MAX_MATERIAL_MAPS;
  final int SHADER_LOC_MAP_DIFFUSE = RaylibConstants.SHADER_LOC_MAP_DIFFUSE;
  final int SHADER_LOC_MAP_SPECULAR = RaylibConstants.SHADER_LOC_MAP_SPECULAR;
  final double EPSILON = RaylibConstants.EPSILON;
  final double M_E = RaylibConstants.M_E;
  final double M_LOG2E = RaylibConstants.M_LOG2E;
  final double M_LOG10E = RaylibConstants.M_LOG10E;
  final double M_LN2 = RaylibConstants.M_LN2;
  final double M_LN10 = RaylibConstants.M_LN10;
  final double M_PI = RaylibConstants.M_PI;
  final double M_PI_2 = RaylibConstants.M_PI_2;
  final double M_PI_4 = RaylibConstants.M_PI_4;
  final double M_1_PI = RaylibConstants.M_1_PI;
  final double M_2_PI = RaylibConstants.M_2_PI;
  final double M_2_SQRTPI = RaylibConstants.M_2_SQRTPI;
  final double M_SQRT2 = RaylibConstants.M_SQRT2;
  final double M_SQRT1_2 = RaylibConstants.M_SQRT1_2;
  final int RAND_MAX = RaylibConstants.RAND_MAX;

  /// Returns a random `double` in `[0.0, 1.0)`.
  double rand() => random.nextDouble();

  /// Returns a random `double` in `[0.0, RAND_MAX)`, mirroring C's `rand()` range.
  double randC() => rand() * RAND_MAX;
}