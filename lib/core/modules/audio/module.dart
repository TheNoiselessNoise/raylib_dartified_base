part of '../../raylib_dartified_base.dart';

abstract interface class RaylibAudioModuleBase<
  // types
  AudioStreamStructType extends AudioStreamBase,
  MusicStructType extends MusicBase,
  SoundStructType extends SoundBase,
  WaveStructType extends WaveBase,

  // callbacks
  AudioCallbackType extends AudioCallbackBase
  
> with RaylibModuleBase {

  void InitAudioDevice();

  void CloseAudioDevice();
  
  bool IsAudioDeviceReady();

  void SetMasterVolume(
    num volume,
  );

  double GetMasterVolume();

  WaveStructType LoadWave(
    String fileName,
  );

  WaveStructType LoadWaveFromMemory(
    String fileType,
    List<int> fileData,
  );

  bool IsWaveValid(
    WaveStructType wave,
  );

  SoundStructType LoadSound(
    String fileName,
  );

  SoundStructType LoadSoundFromWave(
    WaveStructType wave,
  );

  SoundStructType LoadSoundAlias(
    SoundStructType source,
  );

  bool IsSoundValid(
    SoundStructType sound,
  );

  void UpdateSound(
    SoundStructType sound,
    List<int> data,
    num sampleCount,
  );

  void UnloadWave(
    WaveStructType wave,
  );

  void UnloadSound(
    SoundStructType sound,
  );

  void UnloadSoundAlias(
    SoundStructType alias,
  );

  bool ExportWave(
    WaveStructType wave,
    String fileName,
  );

  bool ExportWaveAsCode(
    WaveStructType wave,
    String fileName,
  );

  void PlaySound(
    SoundStructType sound,
  );

  void StopSound(
    SoundStructType sound,
  );

  void PauseSound(
    SoundStructType sound,
  );

  void ResumeSound(
    SoundStructType sound,
  );

  bool IsSoundPlaying(
    SoundStructType sound,
  );

  void SetSoundVolume(
    SoundStructType sound,
    num volume,
  );

  void SetSoundPitch(
    SoundStructType sound,
    num pitch,
  );

  void SetSoundPan(
    SoundStructType sound,
    num pan,
  );

  WaveStructType WaveCopy(
    WaveStructType wave,
  );

  void WaveCrop(
    WaveStructType wave,
    num initFrame,
    num finalFrame,
  );

  void WaveFormat(
    WaveStructType wave,
    num sampleRate,
    num sampleSize,
    num channels,
  );

  List<double> LoadWaveSamples(
    WaveStructType wave
  );

  MusicStructType LoadMusicStream(
    String fileName,
  );

  MusicStructType LoadMusicStreamFromMemory(
    String fileType,
    List<int> data,
  );

  bool IsMusicValid(
    MusicStructType music,
  );

  void UnloadMusicStream(
    MusicStructType music,
  );

  void PlayMusicStream(
    MusicStructType music,
  );

  bool IsMusicStreamPlaying(
    MusicStructType music,
  );

  void UpdateMusicStream(
    MusicStructType music,
  );

  void StopMusicStream(
    MusicStructType music,
  );

  void PauseMusicStream(
    MusicStructType music,
  );

  void ResumeMusicStream(
    MusicStructType music,
  );

  void SeekMusicStream(
    MusicStructType music,
    num position,
  );

  void SetMusicVolume(
    MusicStructType music,
    num volume,
  );

  void SetMusicPitch(
    MusicStructType music,
    num pitch,
  );

  void SetMusicPan(
    MusicStructType music,
    num pan,
  );

  double GetMusicTimeLength(
    MusicStructType music,
  );

  double GetMusicTimePlayed(
    MusicStructType music,
  );

  AudioStreamStructType LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  );

  bool IsAudioStreamValid(
    AudioStreamStructType stream,
  );

  void UnloadAudioStream(
    AudioStreamStructType stream,
  );

  void UpdateAudioStream(
    AudioStreamStructType stream,
    List<int> data,
  );

  bool IsAudioStreamProcessed(
    AudioStreamStructType stream,
  );

  void PlayAudioStream(
    AudioStreamStructType stream,
  );

  void PauseAudioStream(
    AudioStreamStructType stream,
  );

  void ResumeAudioStream(
    AudioStreamStructType stream,
  );

  bool IsAudioStreamPlaying(
    AudioStreamStructType stream,
  );

  void StopAudioStream(
    AudioStreamStructType stream,
  );

  void SetAudioStreamVolume(
    AudioStreamStructType stream,
    num volume,
  );

  void SetAudioStreamPitch(
    AudioStreamStructType stream,
    num pitch,
  );

  void SetAudioStreamPan(
    AudioStreamStructType stream,
    num pan,
  );

  void SetAudioStreamBufferSizeDefault(
    num size,
  );

  void SetAudioStreamCallback(
    AudioStreamStructType stream,
    AudioCallbackType callback,
  );

  void AttachAudioStreamProcessor(
    AudioStreamStructType stream,
    AudioCallbackType callback,
  );

  void DetachAudioStreamProcessor(
    AudioStreamStructType stream,
    AudioCallbackType callback,
    {bool keepAlive = false}
  );

  void AttachAudioMixedProcessor(
    AudioCallbackType callback,
  );

  void DetachAudioMixedProcessor(
    AudioCallbackType callback,
    {bool keepAlive = false}
  );
}