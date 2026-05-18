part of '../../raylib_dartified_base.dart';

/// Produces stable slot key strings identifying the allocation origin of each
/// Audio module function's captured Struct.
class RaylibAudioModuleCaptureIds {

  String LoadWave(
    String fileName,
  ) => 'LoadWave_$fileName';

  String LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadWaveFromMemory_$fileType';

  String LoadSound(
    String fileName,
  ) => 'LoadSound_$fileName';

  String LoadSoundFromWave(
    WaveBase wave,
  ) => 'LoadSoundFromWave_${wave.$state.internalId}';

  String LoadSoundAlias(
    SoundBase source,
  ) => 'LoadSoundAlias_${source.$state.internalId}';

  String WaveCopy(
    WaveBase wave,
  ) => 'WaveCopy_${wave.$state.internalId}';

  String LoadMusicStream(
    String fileName,
  ) => 'LoadMusicStream_$fileName';

  String LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => 'LoadMusicStreamFromMemory_$fileType';

  String LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'LoadAudioStream';

}