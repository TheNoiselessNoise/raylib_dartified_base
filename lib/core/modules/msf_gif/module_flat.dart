part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib MsfGif module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibMsfGifFlat<R extends RaylibBase> extends RaylibModule<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibMsfGifDartCaptureIds();

  RaylibMsfGifFlat(super.rl);

  @override
  @nonVirtual
  @DoNotAbbreviate()
  void dispose() {
    super.dispose();
    MsfGifFileWriteCallbackBase.disposeRegistry();
  }

  /// `msf_gif_alpha_threshold`
  abstract int msf_gif_alpha_threshold;

  /// `msf_gif_bgra_flag`
  abstract int msf_gif_bgra_flag;

  /// `msf_gif_begin`
  int msf_gif_begin(
    StructPointer<MsfGifState> handle,
    int width,
    int height,
  );

  /// `msf_gif_frame`
  int msf_gif_frame(
    StructPointer<MsfGifState> handle,
    MemoryPointer<RUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  );

  /// `msf_gif_end`
  MsfGifResult msf_gif_end(
    StructPointer<MsfGifState> handle,
  );

  /// `msf_gif_free`
  void msf_gif_free(
    MsfGifResult result,
  );

  /// `msf_gif_begin_to_file`
  int msf_gif_begin_to_file(
    StructPointer<MsfGifState> handle,
    int width,
    int height,
    MemoryPointer<RFunction> func,
    MemoryPointer<RVoid> filePointer,
  );

  /// `msf_gif_frame_to_file`
  int msf_gif_frame_to_file(
    StructPointer<MsfGifState> handle,
    MemoryPointer<RUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  );

  /// `msf_gif_end_to_file`
  int msf_gif_end_to_file(
    StructPointer<MsfGifState> handle,
  );
}
