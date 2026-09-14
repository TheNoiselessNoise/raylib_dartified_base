part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib MsfGif module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
final class RaylibMsfGifDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibMsfGifDartDebugLabels();
  
  RaylibMsfGifDart(super.rl);

  RaylibMsfGifFlatModule get _flat => rl.module();

  /// `msf_gif_alpha_threshold`
  int get msf_gif_alpha_threshold => _flat.msf_gif_alpha_threshold;
  set msf_gif_alpha_threshold(int v) => _flat.msf_gif_alpha_threshold = v;

  /// `msf_gif_bgra_flag`
  int get msf_gif_bgra_flag => _flat.msf_gif_bgra_flag;
  set msf_gif_bgra_flag(int v) => _flat.msf_gif_bgra_flag = v;

  /// `msf_gif_begin`
  int msf_gif_begin(
    MsfGifStateD handle,
    num width,
    num height,
  ) => run(
    () => _debugLabels.msf_gif_begin(handle, width, height),
    () => _flat.msf_gif_begin(
      rl.Temp.MsfGifState$.Ref1(handle),
      width.toInt(),
      height.toInt(),
    ),
  );

  /// `msf_gif_frame`
  int msf_gif_frame(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  ) => run(
    () => _debugLabels.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes),
    () => _flat.msf_gif_frame(
      rl.Temp.MsfGifState$.Ref1(handle),
      rl.Temp.TypedDataList$.Array(pixelData).cast(),
      centiSecondsPerFame.toInt(),
      maxBitDepth.toInt(),
      pitchInBytes.toInt(),
    ),
  );

  /// `msf_gif_end`
  MsfGifResultD msf_gif_end(
    MsfGifStateD handle,
  ) => run(
    () => _debugLabels.msf_gif_end(handle),
    () => _flat.msf_gif_end(
      rl.Temp.MsfGifState$.Ref1(handle),
    ),
  );

  /// `msf_gif_free`
  void msf_gif_free(
    MsfGifResultD result,
  ) => run(
    () => _debugLabels.msf_gif_free(result),
    () => _flat.msf_gif_free(
      result,
    ),
  );

  // NOTE: msf_gif_begin_to_file makes sense only in Flat API

  // NOTE: msf_gif_frame_to_file makes sense only in Flat API

  // NOTE: msf_gif_end_to_file makes sense only in Flat API
}
