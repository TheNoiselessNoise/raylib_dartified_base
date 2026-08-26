import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibAudioFlatModule get _module => RaylibBase.instance.AudioFlat;

/// See [RaylibAudioFlatModule.InitAudioDevice].
void InitAudioDevice() => _module.InitAudioDevice();

/// See [RaylibAudioFlatModule.CloseAudioDevice].
void CloseAudioDevice() => _module.CloseAudioDevice();

/// See [RaylibAudioFlatModule.IsAudioDeviceReady].
bool IsAudioDeviceReady() => _module.IsAudioDeviceReady();

/// See [RaylibAudioFlatModule.SetMasterVolume].
void SetMasterVolume(
  double volume,
) => _module.SetMasterVolume(volume);

/// See [RaylibAudioFlatModule.GetMasterVolume].
double GetMasterVolume() => _module.GetMasterVolume();

/// See [RaylibAudioFlatModule.LoadWave].
WaveD LoadWave(
  MemoryPointer<RChar> fileName,
) => _module.LoadWave(fileName);

/// See [RaylibAudioFlatModule.LoadWaveFromMemory].
WaveD LoadWaveFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
) => _module.LoadWaveFromMemory(fileType, fileData, dataSize);

/// See [RaylibAudioFlatModule.IsWaveValid].
bool IsWaveValid(
  WaveD wave,
) => _module.IsWaveValid(wave);

/// See [RaylibAudioFlatModule.LoadSound].
SoundD LoadSound(
  MemoryPointer<RChar> fileName,
) => _module.LoadSound(fileName);

/// See [RaylibAudioFlatModule.LoadSoundFromWave].
SoundD LoadSoundFromWave(
  WaveD wave,
) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudioFlatModule.LoadSoundAlias].
SoundD LoadSoundAlias(
  SoundD source,
) => _module.LoadSoundAlias(source);

/// See [RaylibAudioFlatModule.IsSoundValid].
bool IsSoundValid(
  SoundD sound,
) => _module.IsSoundValid(sound);

/// See [RaylibAudioFlatModule.UpdateSound].
void UpdateSound(
  SoundD sound,
  MemoryPointer<RVoid> data,
  int sampleCount,
) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudioFlatModule.UnloadWave].
void UnloadWave(
  WaveD wave,
) => _module.UnloadWave(wave);

/// See [RaylibAudioFlatModule.UnloadSound].
void UnloadSound(
  SoundD sound,
) => _module.UnloadSound(sound);

/// See [RaylibAudioFlatModule.UnloadSoundAlias].
void UnloadSoundAlias(
  SoundD alias,
) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudioFlatModule.ExportWave].
bool ExportWave(
  WaveD wave,
  MemoryPointer<RChar> fileName,
) => _module.ExportWave(wave, fileName);

/// See [RaylibAudioFlatModule.ExportWaveAsCode].
bool ExportWaveAsCode(
  WaveD wave,
  MemoryPointer<RChar> fileName,
) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudioFlatModule.PlaySound].
void PlaySound(
  SoundD sound,
) => _module.PlaySound(sound);

/// See [RaylibAudioFlatModule.StopSound].
void StopSound(
  SoundD sound,
) => _module.StopSound(sound);

/// See [RaylibAudioFlatModule.PauseSound].
void PauseSound(
  SoundD sound,
) => _module.PauseSound(sound);

/// See [RaylibAudioFlatModule.ResumeSound].
void ResumeSound(
  SoundD sound,
) => _module.ResumeSound(sound);

/// See [RaylibAudioFlatModule.IsSoundPlaying].
bool IsSoundPlaying(
  SoundD sound,
) => _module.IsSoundPlaying(sound);

/// See [RaylibAudioFlatModule.SetSoundVolume].
void SetSoundVolume(
  SoundD sound,
  double volume,
) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudioFlatModule.SetSoundPitch].
void SetSoundPitch(
  SoundD sound,
  double pitch,
) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudioFlatModule.SetSoundPan].
void SetSoundPan(
  SoundD sound,
  double pan,
) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudioFlatModule.WaveCopy].
WaveD WaveCopy(
  WaveD wave,
) => _module.WaveCopy(wave);

/// See [RaylibAudioFlatModule.WaveCrop].
void WaveCrop(
  StructPointer<WaveD> wave,
  int initFrame,
  int finalFrame,
) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudioFlatModule.WaveFormat].
void WaveFormat(
  StructPointer<WaveD> wave,
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudioFlatModule.LoadWaveSamples].
MemoryPointer<RFloat32> LoadWaveSamples(
  WaveD wave,
) => _module.LoadWaveSamples(wave);

/// See [RaylibAudioFlatModule.UnloadWaveSamples].
void UnloadWaveSamples(
  MemoryPointer<RFloat32> samples,
) => _module.UnloadWaveSamples(samples);

/// See [RaylibAudioFlatModule.LoadMusicStream].
MusicD LoadMusicStream(
  MemoryPointer<RChar> fileName,
) => _module.LoadMusicStream(fileName);

/// See [RaylibAudioFlatModule.LoadMusicStreamFromMemory].
MusicD LoadMusicStreamFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.LoadMusicStreamFromMemory(fileType, data, dataSize);

/// See [RaylibAudioFlatModule.IsMusicValid].
bool IsMusicValid(
  MusicD music,
) => _module.IsMusicValid(music);

/// See [RaylibAudioFlatModule.UnloadMusicStream].
void UnloadMusicStream(
  MusicD music,
) => _module.UnloadMusicStream(music);

/// See [RaylibAudioFlatModule.PlayMusicStream].
void PlayMusicStream(
  MusicD music,
) => _module.PlayMusicStream(music);

/// See [RaylibAudioFlatModule.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(
  MusicD music,
) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudioFlatModule.UpdateMusicStream].
void UpdateMusicStream(
  MusicD music,
) => _module.UpdateMusicStream(music);

/// See [RaylibAudioFlatModule.StopMusicStream].
void StopMusicStream(
  MusicD music,
) => _module.StopMusicStream(music);

/// See [RaylibAudioFlatModule.PauseMusicStream].
void PauseMusicStream(
  MusicD music,
) => _module.PauseMusicStream(music);

/// See [RaylibAudioFlatModule.ResumeMusicStream].
void ResumeMusicStream(
  MusicD music,
) => _module.ResumeMusicStream(music);

/// See [RaylibAudioFlatModule.SeekMusicStream].
void SeekMusicStream(
  MusicD music,
  double position,
) => _module.SeekMusicStream(music, position);

/// See [RaylibAudioFlatModule.SetMusicVolume].
void SetMusicVolume(
  MusicD music,
  double volume,
) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudioFlatModule.SetMusicPitch].
void SetMusicPitch(
  MusicD music,
  double pitch,
) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudioFlatModule.SetMusicPan].
void SetMusicPan(
  MusicD music,
  double pan,
) => _module.SetMusicPan(music, pan);

/// See [RaylibAudioFlatModule.GetMusicTimeLength].
double GetMusicTimeLength(
  MusicD music,
) => _module.GetMusicTimeLength(music);

/// See [RaylibAudioFlatModule.GetMusicTimePlayed].
double GetMusicTimePlayed(
  MusicD music,
) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudioFlatModule.LoadAudioStream].
AudioStreamD LoadAudioStream(
  int sampleRate,
  int sampleSize,
  int channels
) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudioFlatModule.IsAudioStreamValid].
bool IsAudioStreamValid(
  AudioStreamD stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioFlatModule.UnloadAudioStream].
void UnloadAudioStream(
  AudioStreamD stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioFlatModule.UpdateAudioStream].
void UpdateAudioStream(
  AudioStreamD stream,
  MemoryPointer<RVoid> data,
  int frameCount,
) => _module.UpdateAudioStream(stream, data, frameCount);

/// See [RaylibAudioFlatModule.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(
  AudioStreamD stream,
) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudioFlatModule.PlayAudioStream].
void PlayAudioStream(
  AudioStreamD stream,
) => _module.PlayAudioStream(stream);

/// See [RaylibAudioFlatModule.PauseAudioStream].
void PauseAudioStream(
  AudioStreamD stream,
) => _module.PauseAudioStream(stream);

/// See [RaylibAudioFlatModule.ResumeAudioStream].
void ResumeAudioStream(
  AudioStreamD stream,
) => _module.ResumeAudioStream(stream);

/// See [RaylibAudioFlatModule.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(
  AudioStreamD stream,
) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudioFlatModule.StopAudioStream].
void StopAudioStream(
  AudioStreamD stream,
) => _module.StopAudioStream(stream);

/// See [RaylibAudioFlatModule.SetAudioStreamVolume].
void SetAudioStreamVolume(
  AudioStreamD stream,
  double volume,
) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudioFlatModule.SetAudioStreamPitch].
void SetAudioStreamPitch(
  AudioStreamD stream,
  double pitch,
) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudioFlatModule.SetAudioStreamPan].
void SetAudioStreamPan(
  AudioStreamD stream,
  double pan,
) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudioFlatModule.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(
  int size,
) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudioFlatModule.SetAudioStreamCallback].
void SetAudioStreamCallback(
  AudioStreamD stream,
  MemoryPointer<RFunction<AudioCallbackBase>> callback,
) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudioFlatModule.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(
  AudioStreamD stream,
  MemoryPointer<RFunction<AudioCallbackBase>> processor,
) => _module.AttachAudioStreamProcessor(stream, processor);

/// See [RaylibAudioFlatModule.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(
  AudioStreamD stream,
  MemoryPointer<RFunction<AudioCallbackBase>> processor,
) => _module.DetachAudioStreamProcessor(stream, processor);

/// See [RaylibAudioFlatModule.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(
  MemoryPointer<RFunction<AudioCallbackBase>> processor,
) => _module.AttachAudioMixedProcessor(processor);

/// See [RaylibAudioFlatModule.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(
  MemoryPointer<RFunction<AudioCallbackBase>> processor,
) => _module.DetachAudioMixedProcessor(processor);