part of 'raylib_dartified_base.dart';

/// Supported Raylib runtime platforms.
enum RaylibPlatform {
  linux(.native),
  windows(.native),
  macOS(.native),
  web(.web),
  android(.native),
  iOS(.native),
  fuchsia(.native);

  const RaylibPlatform(this.type);
  final RaylibPlatformType type;
}

enum RaylibPlatformType {
  /// Native Dart VM / FFI backend.
  native,

  /// Web / WASM backend.
  web,
}

/// Global configuration for `raylib_dartified` package family.
///
/// Provides configurable limits and defaults used by the library's temporary
/// memory allocators, struct handling, and Raylib integration.
///
/// Unless otherwise documented, values should be configured before initializing
/// `Raylib`.
class RaylibConfig {
  /// The number of string slots to pre-allocate.
  ///
  /// Defaults to `4`. Increase this if your frame logic needs to pass
  /// more than 4 temporary strings to Raylib in a single tick.
  static int tempStringSlots = 4;

  /// Maximum vertex buffers (VBO) per mesh.
  ///
  /// **MUST MATCH** `MAX_MESH_VERTEX_BUFFERS` in the compiled raylib.
  ///
  /// Defaults to `7`, which means GPU skinning is not supported.
  static int maxMeshVertexBuffers = 7;

  /// Whether GPU skinning is supported by the configured mesh vertex buffer
  /// limit.
  static bool get isGPUSkinningSupported => maxMeshVertexBuffers > 7;

  /// Maximum size, in bytes, of a struct supported by internal scratch buffers.
  ///
  /// These buffers are used for fast byte-level equality checks of structs.
  /// Increase this if a struct larger than the default limit needs to be
  /// compared using `==`.
  static int maxStructByteSize = 1024;

  /// Maximum number of simultaneously tracked temporary allocations per
  /// temporary allocator.
  ///
  /// Defaults to `1024`. This acts as a safety limit against accidentally
  /// creating an unbounded number of temporary allocation slots.
  ///
  /// Increase this before initializing `Raylib` if a legitimate use case
  /// requires more tracked allocations.
  static int maxTrackedAllocations = 1024;
}

enum RaylibSupportedLibs {
  raylib('raylib'), // core (raylib repo)
  raygui('raygui'), // external (different repo)
  msf_gif('msf_gif'); // external (file within raylib repo)

  const RaylibSupportedLibs(this.id);
  final String id;

  static RaylibSupportedLibs? byId(String id)
    => values.where((e) => e.id == id).firstOrNull;
}

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

  /// See [RaylibTemp].
  RaylibTemp get $ => rl.module();

  /// If this module was loaded.
  bool _isLoaded = false;

  void _doLoad() {
    if (_isLoaded) return;
    _isLoaded = true;
    load();
  }

  /// Override to perform one-time module initialization.
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
      final label = name();
      if (_matchesFilters(label)) {
        if (_debugTime) return rl.timeIt(label, f);
        logInfo(label);
      }
    }
    return f();
  }

  /// Disposes [struct], invokes [fn] with its underlying pointer, and then frees
  /// the temporary allocation backing the pointer, if any.
  ///
  /// The allocation is freed after [fn] completes, including when [fn] throws.
  /// This is intended for APIs where the external call does not take ownership
  /// of the underlying memory.
  void disposeStructWithOpFreed<D extends RaylibStruct<D>>(
    D struct,
    void Function(StructPointer<D> ptr) fn,
  ) {
    final ptr = struct.getOpAndDispose();

    try {
      fn(ptr);
    } finally {
      if (ptr.allocationKey case final key?) {
        $.structAlloc<D>()!.Free(key);
      }
    }
  }

  /// Disposes [struct], invokes [fn] with its underlying pointer, and then
  /// unslots the temporary allocation backing the pointer, if any.
  ///
  /// The allocation is removed from the temporary allocator without freeing its
  /// underlying memory. This is intended for APIs where the external call takes
  /// responsibility for freeing the memory.
  ///
  /// The allocation is unslotted after [fn] completes, including when [fn]
  /// throws.
  void disposeStructWithOpUnslotted<D extends RaylibStruct<D>>(
    D struct,
    void Function(StructPointer<D> ptr) fn,
  ) {
    final ptr = struct.getOpAndDispose();

    try {
      fn(ptr);
    } finally {
      if (ptr.allocationKey case final key?) {
        $.structAlloc<D>()!.Unslot(key);
      }
    }
  }

  /// Executes [f] with [RaylibTemp] syncing temporarily disabled,
  /// restoring the previous sync state afterward.
  T disableSync<T>(T Function() f) {
    final oldSyncing = $.doSync;
    $.enableSyncing(false);
    final result = f();
    $.enableSyncing(oldSyncing);
    return result;
  }
}

/// Root class for a fully initialized Raylib context, exposing all modules,
/// extensions, lifecycle management, and forwarded constants and functions.
abstract class RaylibBase with RaylibDisposable {
  static RaylibBase? _instance;

  static RaylibBase get instance
    => _instance ?? (throw StateError('Raylib not initialized.'));

  static R getInstance<R extends RaylibBase>()
    => instance as R;

  /// See [RaylibTemp].
  RaylibTemp get $ => module();  

  /// See [RaylibUtilsModule].
  late final RaylibUtilsModule Utils;

  /// Random number generator used by [rand] and [randC].
  math.Random random;

  final bool _silent;

  RaylibBase({
    math.Random? random,
    bool silent = false,
  }) :
    random = random ?? .new(),
    _silent = silent
  {
    if (_instance != null) throw StateError("There can only be one instance of $runtimeType!");
    _instance = this;

    if (RaylibConfig.tempStringSlots < 4) {
      throw StateError(
        "Raylib expects at least 4 preallocated String slots, got ${RaylibConfig.tempStringSlots}",
      );
    }
  }

  bool _booted = false;

  @mustCallSuper
  void boot() {
    if (_booted) return;
    _booted = true;
    MemoryScratch._initialize();
    _registerBuiltins();
  }

  void _registerBuiltins() {
    registerModule(RaylibTemp(this));

    registerModule(RaylibEaseExtDart(this));
    registerModule(RaylibQuaternionExtDart(this));
    registerModule(RaylibMatrixExtDart(this));
    registerModule(RaylibVector2ExtDart(this));
    registerModule(RaylibVector3ExtDart(this));
    registerModule(RaylibVector4ExtDart(this));
    registerModule(Utils = .new(this));

    // core modules
    registerModule(RaylibAudioDart(this));
    registerModule(RaylibCameraDart(this));
    registerModule(RaylibCoreDart(this));
    registerModule(RaylibLightDart(this));
    registerModule(RaylibRlglDart(this));

    // external modules
    registerModule(RaylibGuiDart(this));
    registerModule(RaylibMsfGifDart(this));
  }

  /// Calls [RaylibCoreDart.CloseWindow] and [dispose].
  void CloseWindowAndDispose() {
    module<RaylibCoreDart>().CloseWindow();
    dispose();
  }

  /// All currently registered modules.
  List<RaylibModule> get registeredModules => _registeredModules.values.toList();

  /// Enables or disables debug logging across all modules and the temp allocator.
  void debugEverything(bool debug) {
    registeredModules.forEach((d) => d.debug(debug));
    $.debugFree(debug);
    $.debugSync(debug);
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

  /// Registers [module], calls [RaylibModule.load] on it, and returns it.
  /// Throws [StateError] if a module of the same type is already registered.
  T registerModule<T extends RaylibModule>(T module) {
    if (!_silent) logInfo('Registering $T');

    if (_registeredModules.containsKey(T)) {
      throw StateError("Module '$T' is already registered!");
    }

    _registeredModules[T] = module;
    module._doLoad();
    return module;
  }

  /// Prints the current stack trace for debugging.
  Null stackTrace({String? title, bool exit = false}) {
    if (title != null) logInfo(title);
    logInfo(StackTrace.current);
    if (exit) throw '';
  }

  /// Returns the registered module of type [T]. Throws if not registered.
  T module<T extends RaylibModule>() {
    final module = _registeredModules[T];

    if (module == null) {
      throw StateError("Module '$T' is not registered!");
    }

    return module as T;
  }

  /// Disposes a provided module. Does **not** remove it from the registry.
  void _disposeModule(RaylibModule module) {
    if (!_silent) logInfo('Disposing ${module.runtimeType}');
    module.dispose();
  }

  /// Disposes all registered modules.
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    registeredModules.forEach(_disposeModule);
    MemoryScratch.dispose();
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

/// Platform-agnostic app lifecycle interface for Raylib applications.
///
/// Implement this to define your app logic independently of the backend.
/// Each backend provides its own [RaylibAppBase] subclass
/// and [runRaylib] function that drives the lifecycle in a platform-appropriate way.
///
/// The expected call order is:
/// 1. [init] = set up your app state and call [RaylibCoreDart.InitWindow]
/// 2. [loop] = called every frame
/// 3. [close] = called when [shouldClose] returns `true`; call [RaylibCoreDart.CloseWindow] here
/// 4. [dispose] = release Dart-side resources
abstract class RaylibAppBase<R extends RaylibBase> {

  /// Called once before the app loop starts.
  ///
  /// Use this to initialize app state and open the window via
  /// [RaylibCoreDart.InitWindow].
  void init(R rl);

  /// Returns `true` when the app loop should stop.
  /// 
  /// Branches on `currentRaylibPlatform`.
  /// WASM has no exit condition of its own (the browser owns the loop) and `WindowShouldClose`
  /// should not be called in WASM backend, so this one check is the honest boundary
  /// of "agnostic" rather than a leak in the abstraction.
  ///
  /// Defaults to
  ///   - [RaylibCoreDart.WindowShouldClose] (on native)
  ///   - `false` (on web)
  /// 
  /// Override to implement custom exit conditions.
  bool shouldClose(R rl) => switch (currentRaylibPlatform.type) {
    .native => rl.module<RaylibCoreDart>().WindowShouldClose(),
    .web => false,
  };

  /// Called once per frame while [shouldClose] returns `false`.
  Future<void> loop(R rl);

  /// Called once after [shouldClose] returns `true`.
  ///
  /// Defaults to [RaylibCoreDart.CloseWindow]; override to perform
  /// additional cleanup before the window closes.
  void close(R rl) => rl.module<RaylibCoreDart>().CloseWindow();

  /// Called after [close] to release any remaining Dart-side resources.
  ///
  /// Defaults to [RaylibBase.dispose].
  @mustCallSuper
  void dispose(R rl) => rl.dispose();
}

// NOTE: each backend implements it's own function
// `nativeLibPath` leaking into WASM version... we can't do anything
// void runRaylib(RaylibAppBase app, {String? nativeLibPath, bool silent = false});