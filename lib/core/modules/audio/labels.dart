part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Audio module function call,
/// logged to the console when debug output is enabled.
class RaylibAudioModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibAudioModuleBase.InitAudioDevice].
  String InitAudioDevice() => 'InitAudioDevice()';

  /// Label for [RaylibAudioModuleBase.CloseAudioDevice].
  String CloseAudioDevice() => 'CloseAudioDevice()';

  /// Label for [RaylibAudioModuleBase.IsAudioDeviceReady].
  String IsAudioDeviceReady() => 'IsAudioDeviceReady()';

  /// Label for [RaylibAudioModuleBase.SetMasterVolume].
  String SetMasterVolume(
    num volume,
  ) => 'SetMasterVolume($volume)';

  /// Label for [RaylibAudioModuleBase.GetMasterVolume].
  String GetMasterVolume() => 'GetMasterVolume()';

  /// Label for [RaylibAudioModuleBase.LoadWave].
  String LoadWave(
    String fileName,
  ) => 'LoadWave($fileName)';

  /// Label for [RaylibAudioModuleBase.LoadWaveFromMemory].
  String LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadWaveFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibAudioModuleBase.IsWaveValid].
  String IsWaveValid(
    WaveBase wave,
  ) => 'IsWaveValid($wave)';

  /// Label for [RaylibAudioModuleBase.LoadSound].
  String LoadSound(
    String fileName,
  ) => 'LoadSound($fileName)';

  /// Label for [RaylibAudioModuleBase.LoadSoundFromWave].
  String LoadSoundFromWave(
    WaveBase wave,
  ) => 'LoadSoundFromWave($wave)';

  /// Label for [RaylibAudioModuleBase.LoadSoundAlias].
  String LoadSoundAlias(
    SoundBase source,
  ) => 'LoadSoundAlias($source)';

  /// Label for [RaylibAudioModuleBase.IsSoundValid].
  String IsSoundValid(
    SoundBase sound,
  ) => 'IsSoundValid($sound)';

  /// Label for [RaylibAudioModuleBase.UpdateSound].
  String UpdateSound(
    SoundBase sound,
    TypedDataList data,
    num sampleCount,
  ) => 'UpdateSound($sound, data: ${data.length}, sampleCount: $sampleCount)';

  /// Label for [RaylibAudioModuleBase.UnloadWave].
  String UnloadWave(
    WaveBase wave,
  ) => 'UnloadWave($wave)';

  /// Label for [RaylibAudioModuleBase.UnloadSound].
  String UnloadSound(
    SoundBase sound,
  ) => 'UnloadSound($sound)';

  /// Label for [RaylibAudioModuleBase.UnloadSoundAlias].
  String UnloadSoundAlias(
    SoundBase alias,
  ) => 'UnloadSoundAlias($alias)';

  /// Label for [RaylibAudioModuleBase.ExportWave].
  String ExportWave(
    WaveBase wave,
    String fileName,
  ) => 'ExportWave($wave, $fileName)';

  /// Label for [RaylibAudioModuleBase.ExportWaveAsCode].
  String ExportWaveAsCode(
    WaveBase wave,
    String fileName,
  ) => 'ExportWaveAsCode($wave, $fileName)';

  /// Label for [RaylibAudioModuleBase.PlaySound].
  String PlaySound(
    SoundBase sound,
  ) => 'PlaySound($sound)';

  /// Label for [RaylibAudioModuleBase.StopSound].
  String StopSound(
    SoundBase sound,
  ) => 'StopSound($sound)';

  /// Label for [RaylibAudioModuleBase.PauseSound].
  String PauseSound(
    SoundBase sound,
  ) => 'PauseSound($sound)';

  /// Label for [RaylibAudioModuleBase.ResumeSound].
  String ResumeSound(
    SoundBase sound,
  ) => 'ResumeSound($sound)';

  /// Label for [RaylibAudioModuleBase.IsSoundPlaying].
  String IsSoundPlaying(
    SoundBase sound,
  ) => 'IsSoundPlaying($sound)';

  /// Label for [RaylibAudioModuleBase.SetSoundVolume].
  String SetSoundVolume(
    SoundBase sound,
    num volume,
  ) => 'SetSoundVolume($sound, $volume)';

  /// Label for [RaylibAudioModuleBase.SetSoundPitch].
  String SetSoundPitch(
    SoundBase sound,
    num pitch,
  ) => 'SetSoundPitch($sound, $pitch)';

  /// Label for [RaylibAudioModuleBase.SetSoundPan].
  String SetSoundPan(
    SoundBase sound,
    num pan,
  ) => 'SetSoundPan($sound, $pan)';

  /// Label for [RaylibAudioModuleBase.WaveCopy].
  String WaveCopy(
    WaveBase wave,
  ) => 'WaveCopy($wave)';

  /// Label for [RaylibAudioModuleBase.WaveCrop].
  String WaveCrop(
    WaveBase wave,
    num initFrame,
    num finalFrame,
  ) => 'WaveCrop($wave, $initFrame, $finalFrame)';

  /// Label for [RaylibAudioModuleBase.WaveFormat].
  String WaveFormat(
    WaveBase wave,
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'WaveFormat($wave, $sampleRate, $sampleSize, $channels)';

  /// Label for [RaylibAudioModuleBase.LoadWaveSamples].
  String LoadWaveSamples(
    WaveBase wave
  ) => 'LoadWaveSamples($wave)';

  /// Label for [RaylibAudioModuleBase.LoadMusicStream].
  String LoadMusicStream(
    String fileName,
  ) => 'LoadMusicStream($fileName)';

  /// Label for [RaylibAudioModuleBase.LoadMusicStreamFromMemory].
  String LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => 'LoadMusicStreamFromMemory($fileType, data: ${data.length})';

  /// Label for [RaylibAudioModuleBase.IsMusicValid].
  String IsMusicValid(
    MusicBase music,
  ) => 'IsMusicValid($music)';

  /// Label for [RaylibAudioModuleBase.UnloadMusicStream].
  String UnloadMusicStream(
    MusicBase music,
  ) => 'UnloadMusicStream($music)';

  /// Label for [RaylibAudioModuleBase.PlayMusicStream].
  String PlayMusicStream(
    MusicBase music,
  ) => 'PlayMusicStream($music)';

  /// Label for [RaylibAudioModuleBase.IsMusicStreamPlaying].
  String IsMusicStreamPlaying(
    MusicBase music,
  ) => 'IsMusicStreamPlaying($music)';

  /// Label for [RaylibAudioModuleBase.UpdateMusicStream].
  String UpdateMusicStream(
    MusicBase music,
  ) => 'UpdateMusicStream($music)';

  /// Label for [RaylibAudioModuleBase.StopMusicStream].
  String StopMusicStream(
    MusicBase music,
  ) => 'StopMusicStream($music)';

  /// Label for [RaylibAudioModuleBase.PauseMusicStream].
  String PauseMusicStream(
    MusicBase music,
  ) => 'PauseMusicStream($music)';

  /// Label for [RaylibAudioModuleBase.ResumeMusicStream].
  String ResumeMusicStream(
    MusicBase music,
  ) => 'ResumeMusicStream($music)';

  /// Label for [RaylibAudioModuleBase.SeekMusicStream].
  String SeekMusicStream(
    MusicBase music,
    num position,
  ) => 'SeekMusicStream($music, $position)';

  /// Label for [RaylibAudioModuleBase.SetMusicVolume].
  String SetMusicVolume(
    MusicBase music,
    num volume,
  ) => 'SetMusicVolume($music, $volume)';

  /// Label for [RaylibAudioModuleBase.SetMusicPitch].
  String SetMusicPitch(
    MusicBase music,
    num pitch,
  ) => 'SetMusicPitch($music, $pitch)';

  /// Label for [RaylibAudioModuleBase.SetMusicPan].
  String SetMusicPan(
    MusicBase music,
    num pan,
  ) => 'SetMusicPan($music, $pan)';

  /// Label for [RaylibAudioModuleBase.GetMusicTimeLength].
  String GetMusicTimeLength(
    MusicBase music,
  ) => 'GetMusicTimeLength($music)';

  /// Label for [RaylibAudioModuleBase.GetMusicTimePlayed].
  String GetMusicTimePlayed(
    MusicBase music,
  ) => 'GetMusicTimePlayed($music)';

  /// Label for [RaylibAudioModuleBase.LoadAudioStream].
  String LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'LoadAudioStream($sampleRate, $sampleSize, $channels)';

  /// Label for [RaylibAudioModuleBase.IsAudioStreamValid].
  String IsAudioStreamValid(
    AudioStreamBase stream,
  ) => 'IsAudioStreamValid($stream)';

  /// Label for [RaylibAudioModuleBase.UnloadAudioStream].
  String UnloadAudioStream(
    AudioStreamBase stream,
  ) => 'UnloadAudioStream($stream)';

  /// Label for [RaylibAudioModuleBase.UpdateAudioStream].
  String UpdateAudioStream(
    AudioStreamBase stream,
    TypedDataList data,
  ) => 'UpdateAudioStream($stream, data: ${data.length})';

  /// Label for [RaylibAudioModuleBase.IsAudioStreamProcessed].
  String IsAudioStreamProcessed(
    AudioStreamBase stream,
  ) => 'IsAudioStreamProcessed($stream)';

  /// Label for [RaylibAudioModuleBase.PlayAudioStream].
  String PlayAudioStream(
    AudioStreamBase stream,
  ) => 'PlayAudioStream($stream)';

  /// Label for [RaylibAudioModuleBase.PauseAudioStream].
  String PauseAudioStream(
    AudioStreamBase stream,
  ) => 'PauseAudioStream($stream)';

  /// Label for [RaylibAudioModuleBase.ResumeAudioStream].
  String ResumeAudioStream(
    AudioStreamBase stream,
  ) => 'ResumeAudioStream($stream)';

  /// Label for [RaylibAudioModuleBase.IsAudioStreamPlaying].
  String IsAudioStreamPlaying(
    AudioStreamBase stream,
  ) => 'IsAudioStreamPlaying($stream)';

  /// Label for [RaylibAudioModuleBase.StopAudioStream].
  String StopAudioStream(
    AudioStreamBase stream,
  ) => 'StopAudioStream($stream)';

  /// Label for [RaylibAudioModuleBase.SetAudioStreamVolume].
  String SetAudioStreamVolume(
    AudioStreamBase stream,
    num volume,
  ) => 'SetAudioStreamVolume($stream, $volume)';

  /// Label for [RaylibAudioModuleBase.SetAudioStreamPitch].
  String SetAudioStreamPitch(
    AudioStreamBase stream,
    num pitch,
  ) => 'SetAudioStreamPitch($stream, $pitch)';

  /// Label for [RaylibAudioModuleBase.SetAudioStreamPan].
  String SetAudioStreamPan(
    AudioStreamBase stream,
    num pan,
  ) => 'SetAudioStreamPan($stream, $pan)';

  /// Label for [RaylibAudioModuleBase.SetAudioStreamBufferSizeDefault].
  String SetAudioStreamBufferSizeDefault(
    num size,
  ) => 'SetAudioStreamBufferSizeDefault($size)';

  /// Label for [RaylibAudioModuleBase.SetAudioStreamCallback].
  String SetAudioStreamCallback(
    AudioStreamBase stream,
    AudioCallbackBase callback,
  ) => 'SetAudioStreamCallback($stream, callback: $callback)';

  /// Label for [RaylibAudioModuleBase.AttachAudioStreamProcessor].
  String AttachAudioStreamProcessor(
    AudioStreamBase stream,
    AudioCallbackBase callback,
  ) => 'AttachAudioStreamProcessor($stream, callback: $callback)';

  /// Label for [RaylibAudioModuleBase.DetachAudioStreamProcessor].
  String DetachAudioStreamProcessor(
    AudioStreamBase stream,
    AudioCallbackBase callback,
    {bool keepAlive = false}
  ) => 'DetachAudioStreamProcessor($stream, callback: $callback, keepAlive: $keepAlive)';

  /// Label for [RaylibAudioModuleBase.AttachAudioMixedProcessor].
  String AttachAudioMixedProcessor(
    AudioCallbackBase callback,
  ) => 'AttachAudioMixedProcessor(callback: $callback)';

  /// Label for [RaylibAudioModuleBase.DetachAudioMixedProcessor].
  String DetachAudioMixedProcessor(
    AudioCallbackBase callback,
    {bool keepAlive = false}
  ) => 'DetachAudioMixedProcessor(callback: $callback, keepAlive: $keepAlive)';
  
}
