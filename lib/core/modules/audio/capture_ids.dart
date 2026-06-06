part of '../../raylib_dartified_base.dart';

/// Produces stable slot key strings identifying the allocation origin of each
/// Audio module function's captured Struct.
class RaylibAudioModuleCaptureIds {

  /// Capture ID for [RaylibAudioModuleBase.LoadWave].
  String LoadWave(
    String fileName,
  ) => 'LoadWave_$fileName';

  /// Capture ID for [RaylibAudioModuleBase.LoadWaveFromMemory].
  String LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadWaveFromMemory_$fileType';

  /// Capture ID for [RaylibAudioModuleBase.LoadSound].
  String LoadSound(
    String fileName,
  ) => 'LoadSound_$fileName';

  /// Capture ID for [RaylibAudioModuleBase.LoadSoundFromWave].
  String LoadSoundFromWave(
    WaveBase wave,
  ) => 'LoadSoundFromWave_${wave.$state.internalId}';

  /// Capture ID for [RaylibAudioModuleBase.LoadSoundAlias].
  String LoadSoundAlias(
    SoundBase source,
  ) => 'LoadSoundAlias_${source.$state.internalId}';

  /// Capture ID for [RaylibAudioModuleBase.WaveCopy].
  String WaveCopy(
    WaveBase wave,
  ) => 'WaveCopy_${wave.$state.internalId}';

  /// Capture ID for [RaylibAudioModuleBase.LoadMusicStream].
  String LoadMusicStream(
    String fileName,
  ) => 'LoadMusicStream_$fileName';

  /// Capture ID for [RaylibAudioModuleBase.LoadMusicStreamFromMemory].
  String LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => 'LoadMusicStreamFromMemory_$fileType';

  /// Capture ID for [RaylibAudioModuleBase.LoadAudioStream].
  String LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'LoadAudioStream';

}