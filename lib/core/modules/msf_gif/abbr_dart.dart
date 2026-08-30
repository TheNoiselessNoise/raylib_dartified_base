import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibMsfGifModule get _module => RaylibBase.instance.MsfGifDart;

/// See [RaylibMsfGifModule.msf_gif_alpha_threshold].
int get msf_gif_alpha_threshold => _module.msf_gif_alpha_threshold;
set msf_gif_alpha_threshold(int v) => _module.msf_gif_alpha_threshold = v;

/// See [RaylibMsfGifModule.msf_gif_bgra_flag].
int get msf_gif_bgra_flag => _module.msf_gif_bgra_flag;
set msf_gif_bgra_flag(int v) => _module.msf_gif_bgra_flag = v;

/// See [RaylibMsfGifModule.msf_gif_begin].
int msf_gif_begin(
  MsfGifStateD handle,
  num width,
  num height,
) => _module.msf_gif_begin(handle, width, height);

/// See [RaylibMsfGifModule.msf_gif_frame].
int msf_gif_frame(
  MsfGifStateD handle,
  Uint8List pixelData,
  num centiSecondsPerFame,
  num maxBitDepth,
  num pitchInBytes,
) => _module.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGifModule.msf_gif_end].
MsfGifResultD msf_gif_end(
  MsfGifStateD handle,
) => _module.msf_gif_end(handle);

/// See [RaylibMsfGifModule.msf_gif_free].
void msf_gif_free(
  MsfGifResultD result,
) => _module.msf_gif_free(result);
