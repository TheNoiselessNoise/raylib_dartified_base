part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Audio module function call,
/// logged to the console when debug output is enabled.
class RaylibAudioModuleDebugLabels extends RaylibDebugLabelsBase {
  
  String InitAudioDevice() => 'InitAudioDevice()';

  String CloseAudioDevice() => 'CloseAudioDevice()';

  String IsAudioDeviceReady() => 'IsAudioDeviceReady()';

  String SetMasterVolume(
    num volume,
  ) => 'SetMasterVolume($volume)';

  String GetMasterVolume() => 'GetMasterVolume()';

  String LoadWave(
    String fileName,
  ) => 'LoadWave($fileName)';

  String LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadWaveFromMemory($fileType, fileData: ${fileData.length})';

  String IsWaveValid(
    WaveBase wave,
  ) => 'IsWaveValid($wave)';

  String LoadSound(
    String fileName,
  ) => 'LoadSound($fileName)';

  String LoadSoundFromWave(
    WaveBase wave,
  ) => 'LoadSoundFromWave($wave)';

  String LoadSoundAlias(
    SoundBase source,
  ) => 'LoadSoundAlias($source)';

  String IsSoundValid(
    SoundBase sound,
  ) => 'IsSoundValid($sound)';

  String UpdateSound(
    SoundBase sound,
    TypedDataList data,
    num sampleCount,
  ) => 'UpdateSound($sound, data: ${data.length}, sampleCount: $sampleCount)';

  String UnloadWave(
    WaveBase wave,
  ) => 'UnloadWave($wave)';

  String UnloadSound(
    SoundBase sound,
  ) => 'UnloadSound($sound)';

  String UnloadSoundAlias(
    SoundBase alias,
  ) => 'UnloadSoundAlias($alias)';

  String ExportWave(
    WaveBase wave,
    String fileName,
  ) => 'ExportWave($wave, $fileName)';

  String ExportWaveAsCode(
    WaveBase wave,
    String fileName,
  ) => 'ExportWaveAsCode($wave, $fileName)';

  String PlaySound(
    SoundBase sound,
  ) => 'PlaySound($sound)';

  String StopSound(
    SoundBase sound,
  ) => 'StopSound($sound)';

  String PauseSound(
    SoundBase sound,
  ) => 'PauseSound($sound)';

  String ResumeSound(
    SoundBase sound,
  ) => 'ResumeSound($sound)';

  String IsSoundPlaying(
    SoundBase sound,
  ) => 'IsSoundPlaying($sound)';

  String SetSoundVolume(
    SoundBase sound,
    num volume,
  ) => 'SetSoundVolume($sound, $volume)';

  String SetSoundPitch(
    SoundBase sound,
    num pitch,
  ) => 'SetSoundPitch($sound, $pitch)';

  String SetSoundPan(
    SoundBase sound,
    num pan,
  ) => 'SetSoundPan($sound, $pan)';

  String WaveCopy(
    WaveBase wave,
  ) => 'WaveCopy($wave)';

  String WaveCrop(
    WaveBase wave,
    num initFrame,
    num finalFrame,
  ) => 'WaveCrop($wave, $initFrame, $finalFrame)';

  String WaveFormat(
    WaveBase wave,
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'WaveFormat($wave, $sampleRate, $sampleSize, $channels)';

  String LoadWaveSamples(
    WaveBase wave
  ) => 'LoadWaveSamples($wave)';

  String LoadMusicStream(
    String fileName,
  ) => 'LoadMusicStream($fileName)';

  String LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => 'LoadMusicStreamFromMemory($fileType, data: ${data.length})';

  String IsMusicValid(
    MusicBase music,
  ) => 'IsMusicValid($music)';

  String UnloadMusicStream(
    MusicBase music,
  ) => 'UnloadMusicStream($music)';

  String PlayMusicStream(
    MusicBase music,
  ) => 'PlayMusicStream($music)';

  String IsMusicStreamPlaying(
    MusicBase music,
  ) => 'IsMusicStreamPlaying($music)';

  String UpdateMusicStream(
    MusicBase music,
  ) => 'UpdateMusicStream($music)';

  String StopMusicStream(
    MusicBase music,
  ) => 'StopMusicStream($music)';

  String PauseMusicStream(
    MusicBase music,
  ) => 'PauseMusicStream($music)';

  String ResumeMusicStream(
    MusicBase music,
  ) => 'ResumeMusicStream($music)';

  String SeekMusicStream(
    MusicBase music,
    num position,
  ) => 'SeekMusicStream($music, $position)';

  String SetMusicVolume(
    MusicBase music,
    num volume,
  ) => 'SetMusicVolume($music, $volume)';

  String SetMusicPitch(
    MusicBase music,
    num pitch,
  ) => 'SetMusicPitch($music, $pitch)';

  String SetMusicPan(
    MusicBase music,
    num pan,
  ) => 'SetMusicPan($music, $pan)';

  String GetMusicTimeLength(
    MusicBase music,
  ) => 'GetMusicTimeLength($music)';

  String GetMusicTimePlayed(
    MusicBase music,
  ) => 'GetMusicTimePlayed($music)';

  String LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'LoadAudioStream($sampleRate, $sampleSize, $channels)';

  String IsAudioStreamValid(
    AudioStreamBase stream,
  ) => 'IsAudioStreamValid($stream)';

  String UnloadAudioStream(
    AudioStreamBase stream,
  ) => 'UnloadAudioStream($stream)';

  String UpdateAudioStream(
    AudioStreamBase stream,
    TypedDataList data,
  ) => 'UpdateAudioStream($stream, data: ${data.length})';

  String IsAudioStreamProcessed(
    AudioStreamBase stream,
  ) => 'IsAudioStreamProcessed($stream)';

  String PlayAudioStream(
    AudioStreamBase stream,
  ) => 'PlayAudioStream($stream)';

  String PauseAudioStream(
    AudioStreamBase stream,
  ) => 'PauseAudioStream($stream)';

  String ResumeAudioStream(
    AudioStreamBase stream,
  ) => 'ResumeAudioStream($stream)';

  String IsAudioStreamPlaying(
    AudioStreamBase stream,
  ) => 'IsAudioStreamPlaying($stream)';

  String StopAudioStream(
    AudioStreamBase stream,
  ) => 'StopAudioStream($stream)';

  String SetAudioStreamVolume(
    AudioStreamBase stream,
    num volume,
  ) => 'SetAudioStreamVolume($stream, $volume)';

  String SetAudioStreamPitch(
    AudioStreamBase stream,
    num pitch,
  ) => 'SetAudioStreamPitch($stream, $pitch)';

  String SetAudioStreamPan(
    AudioStreamBase stream,
    num pan,
  ) => 'SetAudioStreamPan($stream, $pan)';

  String SetAudioStreamBufferSizeDefault(
    num size,
  ) => 'SetAudioStreamBufferSizeDefault($size)';

  String SetAudioStreamCallback(
    AudioStreamBase stream,
    AudioCallbackBase callback,
  ) => 'SetAudioStreamCallback($stream, callback: $callback)';

  String AttachAudioStreamProcessor(
    AudioStreamBase stream,
    AudioCallbackBase callback,
  ) => 'AttachAudioStreamProcessor($stream, callback: $callback)';

  String DetachAudioStreamProcessor(
    AudioStreamBase stream,
    AudioCallbackBase callback,
    {bool keepAlive = false}
  ) => 'DetachAudioStreamProcessor($stream, callback: $callback, keepAlive: $keepAlive)';

  String AttachAudioMixedProcessor(
    AudioCallbackBase callback,
  ) => 'AttachAudioMixedProcessor(callback: $callback)';

  String DetachAudioMixedProcessor(
    AudioCallbackBase callback,
    {bool keepAlive = false}
  ) => 'DetachAudioMixedProcessor(callback: $callback, keepAlive: $keepAlive)';
  
}
