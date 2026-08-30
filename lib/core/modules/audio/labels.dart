part of '../../raylib_dartified_base.dart';

class _RaylibAudioModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibAudioModule.InitAudioDevice].
  String InitAudioDevice() => 'InitAudioDevice()';

  /// Label for [RaylibAudioModule.CloseAudioDevice].
  String CloseAudioDevice() => 'CloseAudioDevice()';

  /// Label for [RaylibAudioModule.IsAudioDeviceReady].
  String IsAudioDeviceReady() => 'IsAudioDeviceReady()';

  /// Label for [RaylibAudioModule.SetMasterVolume].
  String SetMasterVolume(
    num volume,
  ) => 'SetMasterVolume($volume)';

  /// Label for [RaylibAudioModule.GetMasterVolume].
  String GetMasterVolume() => 'GetMasterVolume()';

  /// Label for [RaylibAudioModule.LoadWave].
  String LoadWave(
    String fileName,
  ) => 'LoadWave($fileName)';

  /// Label for [RaylibAudioModule.LoadWaveFromMemory].
  String LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadWaveFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibAudioModule.IsWaveValid].
  String IsWaveValid(
    WaveD wave,
  ) => 'IsWaveValid($wave)';

  /// Label for [RaylibAudioModule.LoadSound].
  String LoadSound(
    String fileName,
  ) => 'LoadSound($fileName)';

  /// Label for [RaylibAudioModule.LoadSoundFromWave].
  String LoadSoundFromWave(
    WaveD wave,
  ) => 'LoadSoundFromWave($wave)';

  /// Label for [RaylibAudioModule.LoadSoundAlias].
  String LoadSoundAlias(
    SoundD source,
  ) => 'LoadSoundAlias($source)';

  /// Label for [RaylibAudioModule.IsSoundValid].
  String IsSoundValid(
    SoundD sound,
  ) => 'IsSoundValid($sound)';

  /// Label for [RaylibAudioModule.UpdateSound].
  String UpdateSound(
    SoundD sound,
    TypedDataList data,
    num sampleCount,
  ) => 'UpdateSound($sound, data: ${data.length}, sampleCount: $sampleCount)';

  /// Label for [RaylibAudioModule.UnloadWave].
  String UnloadWave(
    WaveD wave,
  ) => 'UnloadWave($wave)';

  /// Label for [RaylibAudioModule.UnloadSound].
  String UnloadSound(
    SoundD sound,
  ) => 'UnloadSound($sound)';

  /// Label for [RaylibAudioModule.UnloadSoundAlias].
  String UnloadSoundAlias(
    SoundD alias,
  ) => 'UnloadSoundAlias($alias)';

  /// Label for [RaylibAudioModule.ExportWave].
  String ExportWave(
    WaveD wave,
    String fileName,
  ) => 'ExportWave($wave, $fileName)';

  /// Label for [RaylibAudioModule.ExportWaveAsCode].
  String ExportWaveAsCode(
    WaveD wave,
    String fileName,
  ) => 'ExportWaveAsCode($wave, $fileName)';

  /// Label for [RaylibAudioModule.PlaySound].
  String PlaySound(
    SoundD sound,
  ) => 'PlaySound($sound)';

  /// Label for [RaylibAudioModule.StopSound].
  String StopSound(
    SoundD sound,
  ) => 'StopSound($sound)';

  /// Label for [RaylibAudioModule.PauseSound].
  String PauseSound(
    SoundD sound,
  ) => 'PauseSound($sound)';

  /// Label for [RaylibAudioModule.ResumeSound].
  String ResumeSound(
    SoundD sound,
  ) => 'ResumeSound($sound)';

  /// Label for [RaylibAudioModule.IsSoundPlaying].
  String IsSoundPlaying(
    SoundD sound,
  ) => 'IsSoundPlaying($sound)';

  /// Label for [RaylibAudioModule.SetSoundVolume].
  String SetSoundVolume(
    SoundD sound,
    num volume,
  ) => 'SetSoundVolume($sound, $volume)';

  /// Label for [RaylibAudioModule.SetSoundPitch].
  String SetSoundPitch(
    SoundD sound,
    num pitch,
  ) => 'SetSoundPitch($sound, $pitch)';

  /// Label for [RaylibAudioModule.SetSoundPan].
  String SetSoundPan(
    SoundD sound,
    num pan,
  ) => 'SetSoundPan($sound, $pan)';

  /// Label for [RaylibAudioModule.WaveCopy].
  String WaveCopy(
    WaveD wave,
  ) => 'WaveCopy($wave)';

  /// Label for [RaylibAudioModule.WaveCrop].
  String WaveCrop(
    WaveD wave,
    num initFrame,
    num finalFrame,
  ) => 'WaveCrop($wave, $initFrame, $finalFrame)';

  /// Label for [RaylibAudioModule.WaveFormat].
  String WaveFormat(
    WaveD wave,
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'WaveFormat($wave, $sampleRate, $sampleSize, $channels)';

  /// Label for [RaylibAudioModule.LoadWaveSamples].
  String LoadWaveSamples(
    WaveD wave
  ) => 'LoadWaveSamples($wave)';

  /// Label for [RaylibAudioModule.LoadMusicStream].
  String LoadMusicStream(
    String fileName,
  ) => 'LoadMusicStream($fileName)';

  /// Label for [RaylibAudioModule.LoadMusicStreamFromMemory].
  String LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => 'LoadMusicStreamFromMemory($fileType, data: ${data.length})';

  /// Label for [RaylibAudioModule.IsMusicValid].
  String IsMusicValid(
    MusicD music,
  ) => 'IsMusicValid($music)';

  /// Label for [RaylibAudioModule.UnloadMusicStream].
  String UnloadMusicStream(
    MusicD music,
  ) => 'UnloadMusicStream($music)';

  /// Label for [RaylibAudioModule.PlayMusicStream].
  String PlayMusicStream(
    MusicD music,
  ) => 'PlayMusicStream($music)';

  /// Label for [RaylibAudioModule.IsMusicStreamPlaying].
  String IsMusicStreamPlaying(
    MusicD music,
  ) => 'IsMusicStreamPlaying($music)';

  /// Label for [RaylibAudioModule.UpdateMusicStream].
  String UpdateMusicStream(
    MusicD music,
  ) => 'UpdateMusicStream($music)';

  /// Label for [RaylibAudioModule.StopMusicStream].
  String StopMusicStream(
    MusicD music,
  ) => 'StopMusicStream($music)';

  /// Label for [RaylibAudioModule.PauseMusicStream].
  String PauseMusicStream(
    MusicD music,
  ) => 'PauseMusicStream($music)';

  /// Label for [RaylibAudioModule.ResumeMusicStream].
  String ResumeMusicStream(
    MusicD music,
  ) => 'ResumeMusicStream($music)';

  /// Label for [RaylibAudioModule.SeekMusicStream].
  String SeekMusicStream(
    MusicD music,
    num position,
  ) => 'SeekMusicStream($music, $position)';

  /// Label for [RaylibAudioModule.SetMusicVolume].
  String SetMusicVolume(
    MusicD music,
    num volume,
  ) => 'SetMusicVolume($music, $volume)';

  /// Label for [RaylibAudioModule.SetMusicPitch].
  String SetMusicPitch(
    MusicD music,
    num pitch,
  ) => 'SetMusicPitch($music, $pitch)';

  /// Label for [RaylibAudioModule.SetMusicPan].
  String SetMusicPan(
    MusicD music,
    num pan,
  ) => 'SetMusicPan($music, $pan)';

  /// Label for [RaylibAudioModule.GetMusicTimeLength].
  String GetMusicTimeLength(
    MusicD music,
  ) => 'GetMusicTimeLength($music)';

  /// Label for [RaylibAudioModule.GetMusicTimePlayed].
  String GetMusicTimePlayed(
    MusicD music,
  ) => 'GetMusicTimePlayed($music)';

  /// Label for [RaylibAudioModule.LoadAudioStream].
  String LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'LoadAudioStream($sampleRate, $sampleSize, $channels)';

  /// Label for [RaylibAudioModule.IsAudioStreamValid].
  String IsAudioStreamValid(
    AudioStreamD stream,
  ) => 'IsAudioStreamValid($stream)';

  /// Label for [RaylibAudioModule.UnloadAudioStream].
  String UnloadAudioStream(
    AudioStreamD stream,
  ) => 'UnloadAudioStream($stream)';

  /// Label for [RaylibAudioModule.UpdateAudioStream].
  String UpdateAudioStream(
    AudioStreamD stream,
    TypedDataList data,
  ) => 'UpdateAudioStream($stream, data: ${data.length})';

  /// Label for [RaylibAudioModule.IsAudioStreamProcessed].
  String IsAudioStreamProcessed(
    AudioStreamD stream,
  ) => 'IsAudioStreamProcessed($stream)';

  /// Label for [RaylibAudioModule.PlayAudioStream].
  String PlayAudioStream(
    AudioStreamD stream,
  ) => 'PlayAudioStream($stream)';

  /// Label for [RaylibAudioModule.PauseAudioStream].
  String PauseAudioStream(
    AudioStreamD stream,
  ) => 'PauseAudioStream($stream)';

  /// Label for [RaylibAudioModule.ResumeAudioStream].
  String ResumeAudioStream(
    AudioStreamD stream,
  ) => 'ResumeAudioStream($stream)';

  /// Label for [RaylibAudioModule.IsAudioStreamPlaying].
  String IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => 'IsAudioStreamPlaying($stream)';

  /// Label for [RaylibAudioModule.StopAudioStream].
  String StopAudioStream(
    AudioStreamD stream,
  ) => 'StopAudioStream($stream)';

  /// Label for [RaylibAudioModule.SetAudioStreamVolume].
  String SetAudioStreamVolume(
    AudioStreamD stream,
    num volume,
  ) => 'SetAudioStreamVolume($stream, $volume)';

  /// Label for [RaylibAudioModule.SetAudioStreamPitch].
  String SetAudioStreamPitch(
    AudioStreamD stream,
    num pitch,
  ) => 'SetAudioStreamPitch($stream, $pitch)';

  /// Label for [RaylibAudioModule.SetAudioStreamPan].
  String SetAudioStreamPan(
    AudioStreamD stream,
    num pan,
  ) => 'SetAudioStreamPan($stream, $pan)';

  /// Label for [RaylibAudioModule.SetAudioStreamBufferSizeDefault].
  String SetAudioStreamBufferSizeDefault(
    num size,
  ) => 'SetAudioStreamBufferSizeDefault($size)';

  /// Label for [RaylibAudioModule.SetAudioStreamCallback].
  String SetAudioStreamCallback(
    AudioStreamD stream,
    AudioCallbackBase? callback,
  ) => 'SetAudioStreamCallback($stream, callback: $callback)';

  /// Label for [RaylibAudioModule.AttachAudioStreamProcessor].
  String AttachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackBase processor,
  ) => 'AttachAudioStreamProcessor($stream, processor: $processor)';

  /// Label for [RaylibAudioModule.DetachAudioStreamProcessor].
  String DetachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => 'DetachAudioStreamProcessor($stream, processor: $processor, keepAlive: $keepAlive)';

  /// Label for [RaylibAudioModule.AttachAudioMixedProcessor].
  String AttachAudioMixedProcessor(
    AudioCallbackBase processor,
  ) => 'AttachAudioMixedProcessor(processor: $processor)';

  /// Label for [RaylibAudioModule.DetachAudioMixedProcessor].
  String DetachAudioMixedProcessor(
    AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => 'DetachAudioMixedProcessor(processor: $processor, keepAlive: $keepAlive)';
  
}
