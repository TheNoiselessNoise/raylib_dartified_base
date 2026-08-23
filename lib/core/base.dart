part of 'raylib_dartified_base.dart';

// TODO: find all raylib functions using `va_list` and implement our own `rl.Utils.Format` thingy

class RaylibConfig {
  /// MUST match `MAX_MESH_VERTEX_BUFFERS` in the compiled raylib.
  /// 
  /// Defaults to `7` meaning no support for GPU skinning.
  static int vboIdCount = 7;
}

enum RaylibPlatform { native, web }

const RaylibPlatform currentRaylibPlatform = bool.fromEnvironment('dart.library.io')
  ? .native
  : .web;

/// Base for module debug label generators, providing shared formatting utilities.
abstract class RaylibDebugLabelsBase {
  /// Formats [flags] as a `|`-separated string of enum names, mirroring C bitflag notation.
  String EnumsAsFlagsOr(Iterable<RaylibEnum> flags) => flags.map((e) => e.name).join(' | ');
}

mixin RaylibDisposable {
  /// Registry of callbacks to be executed on [dispose].
  final List<void Function()> _onDisposeFns = [];

  /// Registers [fn] to be called when this module is disposed.
  void onDispose(void Function() fn) => _onDisposeFns.add(fn);

  /// Calls all registered [onDispose] callbacks and clears them.
  @mustCallSuper
  void dispose() {
    _onDisposeFns.forEach((f) => f());
    _onDisposeFns.clear();
  }
}

/// Base class for all Raylib module wrappers, providing debug logging, lifecycle
/// management, and sync control tied to a [RaylibBase] context [rl].
abstract class RaylibModule<R extends RaylibBase> with RaylibDisposable {
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

  /// Executes [f] with [RaylibTemp] syncing temporarily disabled,
  /// restoring the previous sync state afterward.
  T disableSync<T>(T Function() f) {
    final oldSyncing = rl.Temp.doSync;
    rl.Temp.enableSyncing(false);
    final result = f();
    rl.Temp.enableSyncing(oldSyncing);
    return result;
  }
}

/// Configuration options for [RaylibTemp].
///
/// Controls the pre-allocated capacities of the various typed slot pools
/// within the temporary allocator.
class RaylibTempOptions {
  /// The number of string slots to pre-allocate.
  ///
  /// Defaults to `4`. Increase this if your frame logic needs to pass
  /// more than 4 temporary strings to Raylib in a single tick.
  final int stringCount;

  const RaylibTempOptions({
    this.stringCount = 4,
  });
}

/// Root class for a fully initialized Raylib context, exposing all modules,
/// extensions, lifecycle management, and forwarded constants and functions.
abstract class RaylibBase with RaylibDisposable {
  static RaylibBase? _instance;
  static R getInstance<R extends RaylibBase>() {
    if (_instance == null) throw StateError('Raylib not initialized.');
    return _instance! as R;
  }

  final RaylibTempOptions tempOptions;

  /// See [RaylibTemp].
  late final RaylibTemp Temp;

  /// See [RaylibEaseExtension].
  late final RaylibEaseExtension Ease;

  /// See [RaylibQuaternionExtension].
  late final RaylibQuaternionExtension Quat;

  /// See [RaylibMatrixExtension].
  late final RaylibMatrixExtension Matrix;
  
  /// See [RaylibVectorExtension].
  late final RaylibVectorExtension Vector;

  // TODO: can we rather `registerModule()` and `module()` instead of specifying it like this??

  /// See [RaylibAudioFlatModule].
  RaylibAudioFlatModule get AudioFlat;

  /// See [RaylibAudioModule].
  RaylibAudioModule get AudioD;

  /// See [RaylibCameraFlatModule].
  RaylibCameraFlatModule get CameraFlat;

  /// See [RaylibCameraModule].
  RaylibCameraModule get CameraD;

  /// See [RaylibCoreFlatModule].
  RaylibCoreFlatModule get CoreFlat;

  /// See [RaylibCoreModule].
  RaylibCoreModule get CoreD;

  /// See [RaylibGuiFlatModule].
  RaylibGuiFlatModule get GuiFlat;

  /// See [RaylibGuiModule].
  RaylibGuiModule get GuiD;

  /// See [RaylibLightFlatModule].
  RaylibLightFlatModule get LightFlat;

  /// See [RaylibLightModule].
  RaylibLightModule get LightD;

  /// See [RaylibMsfGifFlatModule].
  RaylibMsfGifFlatModule get MsfGifFlat;

  /// See [RaylibMsfGifModule].
  RaylibMsfGifModule get MsfGifD;

  /// See [RaylibRlglFlatModule].
  RaylibRlglFlatModule get RlglFlat;

  /// See [RaylibRlglModule].
  RaylibRlglModule get RlglD;

  /// See [RaylibUtilsModule].
  late final RaylibUtilsModule Utils;

  /// Random number generator used by [rand] and [randC].
  math.Random random;

  RaylibBase({
    RaylibTempOptions? tempOptions,
    math.Random? random,
    void Function()? initializer,
  }) :
    tempOptions = tempOptions ?? .new(),
    random = random ?? .new()
  {
    initializer?.call();
    
    if (_instance != null) throw StateError("There can only be one instance of a $runtimeType!");
    _instance = this;

    if (this.tempOptions.stringCount < 4) {
      throw StateError(
        "Raylib expects at least 4 preallocated String slots, got ${this.tempOptions.stringCount}",
      );
    }

    _registerBuiltins();
  }

  void _registerBuiltins() {
    registerModule(Temp = .new(this));

    registerModule(Ease = .new(this));
    registerModule(Quat = .new(this));
    registerModule(Matrix = .new(this));
    registerModule(Vector = .new(this));
    registerModule(Utils = .new(this));
  }

  /// Calls [RaylibCoreModule.CloseWindow] and [dispose].
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
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    registeredModules.forEach(_disposeModule);
  }

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
/// 1. [init] = set up your game state and call [RaylibCoreModule.InitWindow]
/// 2. [loop] = called every frame
/// 3. [close] = called when [shouldClose] returns `true`; call [RaylibCoreModule.CloseWindow] here
/// 4. [dispose] = release Dart-side resources
abstract class RaylibGameBase<R extends RaylibBase> {

  /// Called once before the game loop starts.
  ///
  /// Use this to initialize game state and open the window via
  /// [RaylibCoreModule.InitWindow].
  void init(R rl);

  /// Returns `true` when the game loop should stop.
  ///
  /// Defaults to [RaylibCoreModule.WindowShouldClose]; override to
  /// implement custom exit conditions.
  bool shouldClose(R rl) => rl.CoreD.WindowShouldClose();

  /// Called once per frame while [shouldClose] returns `false`.
  Future<void> loop(R rl);

  /// Called once after [shouldClose] returns `true`.
  ///
  /// Defaults to [RaylibCoreModule.CloseWindow]; override to perform
  /// additional cleanup before the window closes.
  void close(R rl) => rl.CoreD.CloseWindow();

  /// Called after [close] to release any remaining Dart-side resources.
  ///
  /// Defaults to [RaylibBase.dispose].
  void dispose(R rl) => rl.dispose();
}

// NOTE: each backend implements it's own function
// void runRaylib(RaylibGameBase game, {String? nativeLibPath});