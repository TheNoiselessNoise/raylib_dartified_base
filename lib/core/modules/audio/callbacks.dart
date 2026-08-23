part of '../../raylib_dartified_base.dart';

// void (MemoryPointer<Void>, UnsignedInt)
/// User-facing `AudioCallback` signature.
typedef AudioCallbackFunction = void Function(
  MemoryPointer<RVoid> bufferData,
  int frames,
);

/// Raylib's `AudioCallback` callback.
abstract class AudioCallbackBase extends RaylibCallback<AudioCallbackFunction> {
  AudioCallbackBase([super.name]);
  static final List<AudioCallbackBase> _registry = [];
  @override @nonVirtual get registry => _registry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(_registry);
}