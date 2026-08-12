part of '../../raylib_dartified_base.dart';

// void (MemoryPointer<Void>, UnsignedInt)
/// User-facing `AudioCallback` signature.
typedef AudioCallbackFunctionD = void Function(
  MemoryPointer<RVoid> bufferData,
  int frames,
);

/// Raylib's `AudioCallback` callback.
mixin AudioCallbackBase on RaylibCallbackBase {
  AudioCallbackFunctionD get function;
}