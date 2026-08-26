import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibMsfGifFlatModule get _module => RaylibBase.instance.MsfGifFlat;

/// See [RaylibMsfGifFlatModule.msf_gif_alpha_threshold].
int get msf_gif_alpha_threshold => _module.msf_gif_alpha_threshold;
/// See [RaylibMsfGifFlatModule.msf_gif_alpha_threshold].
set msf_gif_alpha_threshold(int v) => _module.msf_gif_alpha_threshold = v;

/// See [RaylibMsfGifFlatModule.msf_gif_bgra_flag].
int get msf_gif_bgra_flag => _module.msf_gif_bgra_flag;
/// See [RaylibMsfGifFlatModule.msf_gif_bgra_flag].
set msf_gif_bgra_flag(int v) => _module.msf_gif_bgra_flag = v;

/// See [RaylibMsfGifFlatModule.msf_gif_begin].
int msf_gif_begin(
  StructPointer<MsfGifStateD> handle,
  int width,
  int height,
) => _module.msf_gif_begin(handle, width, height);

/// See [RaylibMsfGifFlatModule.msf_gif_frame].
int msf_gif_frame(
  StructPointer<MsfGifStateD> handle,
  MemoryPointer<RUint8> pixelData,
  int centiSecondsPerFame,
  int maxBitDepth,
  int pitchInBytes,
) => _module.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGifFlatModule.msf_gif_end].
MsfGifResultD msf_gif_end(
  StructPointer<MsfGifStateD> handle,
) => _module.msf_gif_end(handle);

/// See [RaylibMsfGifFlatModule.msf_gif_free].
void msf_gif_free(
  MsfGifResultD result,
) => _module.msf_gif_free(result);

/// See [RaylibMsfGifFlatModule.msf_gif_begin_to_file].
int msf_gif_begin_to_file(
  StructPointer<MsfGifStateD> handle,
  int width,
  int height,
  MemoryPointer<RFunction> func,
  MemoryPointer<RVoid> filePointer,
) => _module.msf_gif_begin_to_file(handle, width, height, func, filePointer);

/// See [RaylibMsfGifFlatModule.msf_gif_frame_to_file].
int msf_gif_frame_to_file(
  StructPointer<MsfGifStateD> handle,
  MemoryPointer<RUint8> pixelData,
  int centiSecondsPerFame,
  int maxBitDepth,
  int pitchInBytes,
) => _module.msf_gif_frame_to_file(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGifFlatModule.msf_gif_end_to_file].
int msf_gif_end_to_file(
  StructPointer<MsfGifStateD> handle,
) => _module.msf_gif_end_to_file(handle);
