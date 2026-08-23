part of 'raylib_dartified_base.dart';

abstract class RaylibCallback<D extends Function> {

  bool _isDisposed = false;
  bool _initialized = false;
  late final MemoryPointer<RFunction> _funcPtr;

  /// The Dart function exposed to the native side.
  ///
  /// Subclasses return their concrete callback implementation here.
  D get function;

  /// A human-readable name for this callback, used in [toString] and logging.
  ///
  /// Defaults to `runtimeType.toString()` if not provided.
  late String name;

  RaylibCallback([String? name]) {
    this.name = name ?? runtimeType.toString();
  }

  /// Backend-specific: produces the callable native pointer for [function].
  /// Native: wraps a `NativeCallable<C>`, returns its nativeFunction cast to RVoid.
  /// Wasm: registers via addFunction(jsFunction, signature), wraps the int as a pointer.
  MemoryPointer<RFunction> initializer();

  MemoryPointer<RFunction> get nativeFunction {
    assert(!_isDisposed, '$runtimeType: has been disposed');
    if (!_initialized) {
      _initialized = true;
      _funcPtr = initializer();
    }
    return _funcPtr;
  }

  /// The registry of live callbacks for this callback type.
  ///
  /// Each concrete subclass owns a static `List<RaylibCallback>` and returns it
  /// here. The registry is used to track active callbacks and support bulk
  /// disposal via [disposeRegistry].
  List<RaylibCallback> get registry;

  /// Registers this callback and returns its function pointer.
  ///
  /// Adds `this` to [registry] if not already present, then returns
  /// [nativeFunction].
  MemoryPointer<RFunction> attach() {
    if (!registry.contains(this)) registry.add(this);
    return nativeFunction;
  }

  /// Removes this callback from [registry], optionally disposes it, and
  /// returns its function pointer.
  ///
  /// If [keepAlive] is `true`, the callback is neither removed from [registry]
  /// nor disposed, only the pointer is returned. Useful when temporarily
  /// detaching without releasing resources.
  MemoryPointer<RFunction> detach([bool keepAlive = false]) {
    if (keepAlive) return nativeFunction;
    registry.remove(this);
    dispose();
    return nativeFunction;
  }

  /// Marks this instance as disposed.
  ///
  /// Safe to call multiple times, subsequent calls are no-ops. After disposal,
  /// accessing [nativeFunction] will trigger an assertion failure.
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
  }

  /// Disposes all callbacks in [registry] and clears it.
  ///
  /// Intended to be called at shutdown by each concrete callback type via a
  /// typed static wrapper:
  ///
  /// ```dart
  /// static void disposeRegistry() => RaylibCallback.disposeRegistry(_registry);
  /// ```
  static void disposeRegistry(List<RaylibCallback> registry) {
    registry.forEach((f) => f.dispose());
    registry.clear();
  }

  /// Returns [name].
  @override
  String toString() => name;
}