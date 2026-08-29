part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib MsfGif module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
final class RaylibMsfGifModule<R extends RaylibBase<R>> extends RaylibModule<R> {

  final _debugLabels = _RaylibMsfGifModuleDebugLabels();
  
  RaylibMsfGifModule(super.rl);

  int get msf_gif_alpha_threshold => rl.MsfGifFlat.msf_gif_alpha_threshold;
  set msf_gif_alpha_threshold(int v) => rl.MsfGifFlat.msf_gif_alpha_threshold = v;

  int get msf_gif_bgra_flag => rl.MsfGifFlat.msf_gif_bgra_flag;
  set msf_gif_bgra_flag(int v) => rl.MsfGifFlat.msf_gif_bgra_flag = v;

  int msf_gif_begin(
    MsfGifStateD handle,
    num width,
    num height,
  ) => run(
    () => _debugLabels.msf_gif_begin(handle, width, height),
    () => rl.MsfGifFlat.msf_gif_begin(
      rl.Temp.MsfGifState$.Ref1(handle),
      width.toInt(),
      height.toInt(),
    ),
  );

  int msf_gif_frame(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  ) => run(
    () => _debugLabels.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes),
    () => rl.MsfGifFlat.msf_gif_frame(
      rl.Temp.MsfGifState$.Ref1(handle),
      rl.Temp.TypedDataList$.Array(pixelData).cast(),
      centiSecondsPerFame.toInt(),
      maxBitDepth.toInt(),
      pitchInBytes.toInt(),
    ),
  );

  MsfGifResultD msf_gif_end(
    MsfGifStateD handle,
  ) => run(
    () => _debugLabels.msf_gif_end(handle),
    () => rl.MsfGifFlat.msf_gif_end(
      rl.Temp.MsfGifState$.Ref1(handle),
    ),
  );

  void msf_gif_free(
    MsfGifResultD result,
  ) => run(
    () => _debugLabels.msf_gif_free(result),
    () => rl.MsfGifFlat.msf_gif_free(
      result,
    ),
  );

  // TODO: msf_gif_begin_to_file
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
  ) => run(
    () => _debugLabels.msf_gif_frame_to_file(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes),
    () => rl.MsfGifFlat.msf_gif_frame_to_file(
      rl.Temp.MsfGifState$.Ref1(handle),
      rl.Temp.TypedDataList$.Array(pixelData).cast(),
      centiSecondsPerFame.toInt(),
      maxBitDepth.toInt(),
      pitchInBytes.toInt(),
    ),
  );

  int msf_gif_end_to_file(
    MsfGifStateD handle,
  ) => run(
    () => _debugLabels.msf_gif_end_to_file(handle),
    () => rl.MsfGifFlat.msf_gif_end_to_file(
      rl.Temp.MsfGifState$.Ref1(handle),
    ),
  );
}
