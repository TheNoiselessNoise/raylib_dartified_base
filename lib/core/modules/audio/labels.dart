part of '../../raylib_dartified_base.dart';

class _RaylibAudioDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibAudioDart.InitAudioDevice].
  String InitAudioDevice() => 'InitAudioDevice()';

  /// Label for [RaylibAudioDart.CloseAudioDevice].
  String CloseAudioDevice() => 'CloseAudioDevice()';

  /// Label for [RaylibAudioDart.IsAudioDeviceReady].
  String IsAudioDeviceReady() => 'IsAudioDeviceReady()';

  /// Label for [RaylibAudioDart.SetMasterVolume].
  String SetMasterVolume(
    num volume,
  ) => 'SetMasterVolume($volume)';

  /// Label for [RaylibAudioDart.GetMasterVolume].
  String GetMasterVolume() => 'GetMasterVolume()';

  /// Label for [RaylibAudioDart.LoadWave].
  String LoadWave(
    String fileName,
  ) => 'LoadWave($fileName)';

  /// Label for [RaylibAudioDart.LoadWaveFromMemory].
  String LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadWaveFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibAudioDart.IsWaveValid].
  String IsWaveValid(
    WaveD wave,
  ) => 'IsWaveValid($wave)';

  /// Label for [RaylibAudioDart.LoadSound].
  String LoadSound(
    String fileName,
  ) => 'LoadSound($fileName)';

  /// Label for [RaylibAudioDart.LoadSoundFromWave].
  String LoadSoundFromWave(
    WaveD wave,
  ) => 'LoadSoundFromWave($wave)';

  /// Label for [RaylibAudioDart.LoadSoundAlias].
  String LoadSoundAlias(
    SoundD source,
  ) => 'LoadSoundAlias($source)';

  /// Label for [RaylibAudioDart.IsSoundValid].
  String IsSoundValid(
    SoundD sound,
  ) => 'IsSoundValid($sound)';

  /// Label for [RaylibAudioDart.UpdateSound].
  String UpdateSound(
    SoundD sound,
    TypedDataList data,
    num sampleCount,
  ) => 'UpdateSound($sound, data: ${data.length}, sampleCount: $sampleCount)';

  /// Label for [RaylibAudioDart.UnloadWave].
  String UnloadWave(
    WaveD wave,
  ) => 'UnloadWave($wave)';

  /// Label for [RaylibAudioDart.UnloadSound].
  String UnloadSound(
    SoundD sound,
  ) => 'UnloadSound($sound)';

  /// Label for [RaylibAudioDart.UnloadSoundAlias].
  String UnloadSoundAlias(
    SoundD alias,
  ) => 'UnloadSoundAlias($alias)';

  /// Label for [RaylibAudioDart.ExportWave].
  String ExportWave(
    WaveD wave,
    String fileName,
  ) => 'ExportWave($wave, $fileName)';

  /// Label for [RaylibAudioDart.ExportWaveAsCode].
  String ExportWaveAsCode(
    WaveD wave,
    String fileName,
  ) => 'ExportWaveAsCode($wave, $fileName)';

  /// Label for [RaylibAudioDart.PlaySound].
  String PlaySound(
    SoundD sound,
  ) => 'PlaySound($sound)';

  /// Label for [RaylibAudioDart.StopSound].
  String StopSound(
    SoundD sound,
  ) => 'StopSound($sound)';

  /// Label for [RaylibAudioDart.PauseSound].
  String PauseSound(
    SoundD sound,
  ) => 'PauseSound($sound)';

  /// Label for [RaylibAudioDart.ResumeSound].
  String ResumeSound(
    SoundD sound,
  ) => 'ResumeSound($sound)';

  /// Label for [RaylibAudioDart.IsSoundPlaying].
  String IsSoundPlaying(
    SoundD sound,
  ) => 'IsSoundPlaying($sound)';

  /// Label for [RaylibAudioDart.SetSoundVolume].
  String SetSoundVolume(
    SoundD sound,
    num volume,
  ) => 'SetSoundVolume($sound, $volume)';

  /// Label for [RaylibAudioDart.SetSoundPitch].
  String SetSoundPitch(
    SoundD sound,
    num pitch,
  ) => 'SetSoundPitch($sound, $pitch)';

  /// Label for [RaylibAudioDart.SetSoundPan].
  String SetSoundPan(
    SoundD sound,
    num pan,
  ) => 'SetSoundPan($sound, $pan)';

  /// Label for [RaylibAudioDart.WaveCopy].
  String WaveCopy(
    WaveD wave,
  ) => 'WaveCopy($wave)';

  /// Label for [RaylibAudioDart.WaveCrop].
  String WaveCrop(
    WaveD wave,
    num initFrame,
    num finalFrame,
  ) => 'WaveCrop($wave, $initFrame, $finalFrame)';

  /// Label for [RaylibAudioDart.WaveFormat].
  String WaveFormat(
    WaveD wave,
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'WaveFormat($wave, $sampleRate, $sampleSize, $channels)';

  /// Label for [RaylibAudioDart.LoadWaveSamples].
  String LoadWaveSamples(
    WaveD wave
  ) => 'LoadWaveSamples($wave)';

  /// Label for [RaylibAudioDart.LoadMusicStream].
  String LoadMusicStream(
    String fileName,
  ) => 'LoadMusicStream($fileName)';

  /// Label for [RaylibAudioDart.LoadMusicStreamFromMemory].
  String LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => 'LoadMusicStreamFromMemory($fileType, data: ${data.length})';

  /// Label for [RaylibAudioDart.IsMusicValid].
  String IsMusicValid(
    MusicD music,
  ) => 'IsMusicValid($music)';

  /// Label for [RaylibAudioDart.UnloadMusicStream].
  String UnloadMusicStream(
    MusicD music,
  ) => 'UnloadMusicStream($music)';

  /// Label for [RaylibAudioDart.PlayMusicStream].
  String PlayMusicStream(
    MusicD music,
  ) => 'PlayMusicStream($music)';

  /// Label for [RaylibAudioDart.IsMusicStreamPlaying].
  String IsMusicStreamPlaying(
    MusicD music,
  ) => 'IsMusicStreamPlaying($music)';

  /// Label for [RaylibAudioDart.UpdateMusicStream].
  String UpdateMusicStream(
    MusicD music,
  ) => 'UpdateMusicStream($music)';

  /// Label for [RaylibAudioDart.StopMusicStream].
  String StopMusicStream(
    MusicD music,
  ) => 'StopMusicStream($music)';

  /// Label for [RaylibAudioDart.PauseMusicStream].
  String PauseMusicStream(
    MusicD music,
  ) => 'PauseMusicStream($music)';

  /// Label for [RaylibAudioDart.ResumeMusicStream].
  String ResumeMusicStream(
    MusicD music,
  ) => 'ResumeMusicStream($music)';

  /// Label for [RaylibAudioDart.SeekMusicStream].
  String SeekMusicStream(
    MusicD music,
    num position,
  ) => 'SeekMusicStream($music, $position)';

  /// Label for [RaylibAudioDart.SetMusicVolume].
  String SetMusicVolume(
    MusicD music,
    num volume,
  ) => 'SetMusicVolume($music, $volume)';

  /// Label for [RaylibAudioDart.SetMusicPitch].
  String SetMusicPitch(
    MusicD music,
    num pitch,
  ) => 'SetMusicPitch($music, $pitch)';

  /// Label for [RaylibAudioDart.SetMusicPan].
  String SetMusicPan(
    MusicD music,
    num pan,
  ) => 'SetMusicPan($music, $pan)';

  /// Label for [RaylibAudioDart.GetMusicTimeLength].
  String GetMusicTimeLength(
    MusicD music,
  ) => 'GetMusicTimeLength($music)';

  /// Label for [RaylibAudioDart.GetMusicTimePlayed].
  String GetMusicTimePlayed(
    MusicD music,
  ) => 'GetMusicTimePlayed($music)';

  /// Label for [RaylibAudioDart.LoadAudioStream].
  String LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'LoadAudioStream($sampleRate, $sampleSize, $channels)';

  /// Label for [RaylibAudioDart.IsAudioStreamValid].
  String IsAudioStreamValid(
    AudioStreamD stream,
  ) => 'IsAudioStreamValid($stream)';

  /// Label for [RaylibAudioDart.UnloadAudioStream].
  String UnloadAudioStream(
    AudioStreamD stream,
  ) => 'UnloadAudioStream($stream)';

  /// Label for [RaylibAudioDart.UpdateAudioStream].
  String UpdateAudioStream(
    AudioStreamD stream,
    TypedDataList data,
  ) => 'UpdateAudioStream($stream, data: ${data.length})';

  /// Label for [RaylibAudioDart.IsAudioStreamProcessed].
  String IsAudioStreamProcessed(
    AudioStreamD stream,
  ) => 'IsAudioStreamProcessed($stream)';

  /// Label for [RaylibAudioDart.PlayAudioStream].
  String PlayAudioStream(
    AudioStreamD stream,
  ) => 'PlayAudioStream($stream)';

  /// Label for [RaylibAudioDart.PauseAudioStream].
  String PauseAudioStream(
    AudioStreamD stream,
  ) => 'PauseAudioStream($stream)';

  /// Label for [RaylibAudioDart.ResumeAudioStream].
  String ResumeAudioStream(
    AudioStreamD stream,
  ) => 'ResumeAudioStream($stream)';

  /// Label for [RaylibAudioDart.IsAudioStreamPlaying].
  String IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => 'IsAudioStreamPlaying($stream)';

  /// Label for [RaylibAudioDart.StopAudioStream].
  String StopAudioStream(
    AudioStreamD stream,
  ) => 'StopAudioStream($stream)';

  /// Label for [RaylibAudioDart.SetAudioStreamVolume].
  String SetAudioStreamVolume(
    AudioStreamD stream,
    num volume,
  ) => 'SetAudioStreamVolume($stream, $volume)';

  /// Label for [RaylibAudioDart.SetAudioStreamPitch].
  String SetAudioStreamPitch(
    AudioStreamD stream,
    num pitch,
  ) => 'SetAudioStreamPitch($stream, $pitch)';

  /// Label for [RaylibAudioDart.SetAudioStreamPan].
  String SetAudioStreamPan(
    AudioStreamD stream,
    num pan,
  ) => 'SetAudioStreamPan($stream, $pan)';

  /// Label for [RaylibAudioDart.SetAudioStreamBufferSizeDefault].
  String SetAudioStreamBufferSizeDefault(
    num size,
  ) => 'SetAudioStreamBufferSizeDefault($size)';

  /// Label for [RaylibAudioDart.SetAudioStreamCallback].
  String SetAudioStreamCallback(
    AudioStreamD stream,
    AudioCallbackBase? callback,
  ) => 'SetAudioStreamCallback($stream, callback: $callback)';

  /// Label for [RaylibAudioDart.AttachAudioStreamProcessor].
  String AttachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackBase processor,
  ) => 'AttachAudioStreamProcessor($stream, processor: $processor)';

  /// Label for [RaylibAudioDart.DetachAudioStreamProcessor].
  String DetachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => 'DetachAudioStreamProcessor($stream, processor: $processor, keepAlive: $keepAlive)';

  /// Label for [RaylibAudioDart.AttachAudioMixedProcessor].
  String AttachAudioMixedProcessor(
    AudioCallbackBase processor,
  ) => 'AttachAudioMixedProcessor(processor: $processor)';

  /// Label for [RaylibAudioDart.DetachAudioMixedProcessor].
  String DetachAudioMixedProcessor(
    AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => 'DetachAudioMixedProcessor(processor: $processor, keepAlive: $keepAlive)';
  
}
