part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib MsfGif module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibMsfGifFlatModule<R extends RaylibBase<R>> extends RaylibModule<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibMsfGifModuleCaptureIds();

  RaylibMsfGifFlatModule(super.rl);

  abstract int msf_gif_alpha_threshold;

  abstract int msf_gif_bgra_flag;

  int msf_gif_begin(
    StructPointer<MsfGifStateD> handle,
    int width,
    int height,
  );

  int msf_gif_frame(
    StructPointer<MsfGifStateD> handle,
    MemoryPointer<RUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  );

  MsfGifResultD msf_gif_end(
    StructPointer<MsfGifStateD> handle,
  );

  void msf_gif_free(
    MsfGifResultD result,
  );

  int msf_gif_begin_to_file(
    StructPointer<MsfGifStateD> handle,
    int width,
    int height,
    MemoryPointer<RFunction> func,
    MemoryPointer<RVoid> filePointer,
  );

  int msf_gif_frame_to_file(
    StructPointer<MsfGifStateD> handle,
    MemoryPointer<RUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  );

  int msf_gif_end_to_file(
    StructPointer<MsfGifStateD> handle,
  );
}
