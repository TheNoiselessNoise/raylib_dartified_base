part of '../../raylib_dartified_base.dart';

class _RaylibMsfGifDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibGuiDart.GuiEnable].
  String GuiEnable() => 'GuiEnable()';
  
  /// Label for [RaylibMsfGifDart.msf_gif_begin].
  String msf_gif_begin(
    MsfGifStateD handle,
    num width,
    num height,
  ) => 'msf_gif_begin($handle, $width, $height)';

  /// Label for [RaylibMsfGifDart.msf_gif_frame].
  String msf_gif_frame(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  ) => 'msf_gif_frame($handle, pixelData: ${pixelData.length})';

  /// Label for [RaylibMsfGifDart.msf_gif_end].
  String msf_gif_end(
    MsfGifStateD handle,
  ) => 'msf_gif_end($handle)';

  /// Label for [RaylibMsfGifDart.msf_gif_free].
  String msf_gif_free(
    MsfGifResultD result,
  ) => 'msf_gif_free($result)';
}
