part of '../../raylib_dartified_base.dart';

// size_t (MemoryPointer<Void>, size_t, size_t, MemoryPointer<Void>)
/// User-facing `MsfGifFileWriteFunc` signature.
typedef MsfGifFileWriteFunction = int Function(
  MemoryPointer<RVoid> buffer,
  int size,
  int count,
  MemoryPointer<RVoid> stream,
);

/// MsfGif's `MsfGifFileWriteFunc` callback.
abstract class MsfGifFileWriteCallbackBase extends RaylibCallback<MsfGifFileWriteCallbackBase, MsfGifFileWriteFunction> {
  MsfGifFileWriteCallbackBase([super.name]);
  static final Map<int, MsfGifFileWriteCallbackBase> callbackRegistry = {};
  @override @nonVirtual get registry => callbackRegistry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(callbackRegistry);
}