part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib MsfGif module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibMsfGifModule<R extends RaylibBase> extends RaylibModule<R> {

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibMsfGifModuleDebugLabels();
  
  RaylibMsfGifModule(super.rl);

  abstract int msf_gif_alpha_threshold;

  abstract int msf_gif_bgra_flag;

  int msf_gif_begin(
    MsfGifStateD handle,
    num width,
    num height,
  );

  int msf_gif_frame(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  );

  MsfGifResultD msf_gif_end(
    MsfGifStateD handle,
  );

  void msf_gif_free(
    MsfGifResultD result,
  );

  // TODO: this
  // int msf_gif_begin_to_file(
  //   MsfGifStateD handle,
  //   int width,
  //   int height,
  //   MsfGifFileWriteFuncC func,
  //   Pointer<Void> filePointer,
  // )
  //   => _msf_gif_begin_to_file(handle, width, height, func, filePointer);

  int msf_gif_frame_to_file(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  );

  int msf_gif_end_to_file(
    MsfGifStateD handle,
  );
}
