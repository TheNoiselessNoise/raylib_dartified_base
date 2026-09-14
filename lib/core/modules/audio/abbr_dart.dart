import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibAudioDart get _module => RaylibBase.instance.module();

/// See [RaylibAudioDart.InitAudioDevice].
void InitAudioDevice() => _module.InitAudioDevice();

/// See [RaylibAudioDart.CloseAudioDevice].
void CloseAudioDevice() => _module.CloseAudioDevice();

/// See [RaylibAudioDart.IsAudioDeviceReady].
bool IsAudioDeviceReady() => _module.IsAudioDeviceReady();

/// See [RaylibAudioDart.SetMasterVolume].
void SetMasterVolume(
  double volume,
) => _module.SetMasterVolume(volume);

/// See [RaylibAudioDart.GetMasterVolume].
double GetMasterVolume() => _module.GetMasterVolume();

/// See [RaylibAudioDart.LoadWave].
WaveD LoadWave(
  String fileName,
) => _module.LoadWave(fileName);

/// See [RaylibAudioDart.LoadWaveFromMemory].
WaveD LoadWaveFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadWaveFromMemory(fileType, fileData);

/// See [RaylibAudioDart.IsWaveValid].
bool IsWaveValid(
  WaveD wave,
) => _module.IsWaveValid(wave);

/// See [RaylibAudioDart.LoadSound].
SoundD LoadSound(
  String fileName,
) => _module.LoadSound(fileName);

/// See [RaylibAudioDart.LoadSoundFromWave].
SoundD LoadSoundFromWave(
  WaveD wave,
) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudioDart.LoadSoundAlias].
SoundD LoadSoundAlias(
  SoundD source,
) => _module.LoadSoundAlias(source);

/// See [RaylibAudioDart.IsSoundValid].
bool IsSoundValid(
  SoundD sound,
) => _module.IsSoundValid(sound);

/// See [RaylibAudioDart.UpdateSound].
void UpdateSound(
  SoundD sound,
  TypedDataList data,
  int sampleCount,
) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudioDart.UnloadWave].
void UnloadWave(
  WaveD wave,
) => _module.UnloadWave(wave);

/// See [RaylibAudioDart.UnloadSound].
void UnloadSound(
  SoundD sound,
) => _module.UnloadSound(sound);

/// See [RaylibAudioDart.UnloadSoundAlias].
void UnloadSoundAlias(
  SoundD alias,
) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudioDart.ExportWave].
bool ExportWave(
  WaveD wave,
  String fileName,
) => _module.ExportWave(wave, fileName);

/// See [RaylibAudioDart.ExportWaveAsCode].
bool ExportWaveAsCode(
  WaveD wave,
  String fileName,
) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudioDart.PlaySound].
void PlaySound(
  SoundD sound,
) => _module.PlaySound(sound);

/// See [RaylibAudioDart.StopSound].
void StopSound(
  SoundD sound,
) => _module.StopSound(sound);

/// See [RaylibAudioDart.PauseSound].
void PauseSound(
  SoundD sound,
) => _module.PauseSound(sound);

/// See [RaylibAudioDart.ResumeSound].
void ResumeSound(
  SoundD sound,
) => _module.ResumeSound(sound);

/// See [RaylibAudioDart.IsSoundPlaying].
bool IsSoundPlaying(
  SoundD sound,
) => _module.IsSoundPlaying(sound);

/// See [RaylibAudioDart.SetSoundVolume].
void SetSoundVolume(
  SoundD sound,
  double volume,
) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudioDart.SetSoundPitch].
void SetSoundPitch(
  SoundD sound,
  double pitch,
) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudioDart.SetSoundPan].
void SetSoundPan(
  SoundD sound,
  double pan,
) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudioDart.WaveCopy].
WaveD WaveCopy(
  WaveD wave,
) => _module.WaveCopy(wave);

/// See [RaylibAudioDart.WaveCrop].
void WaveCrop(
  WaveD wave,
  int initFrame,
  int finalFrame,
) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudioDart.WaveFormat].
void WaveFormat(
  WaveD wave,
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudioDart.LoadWaveSamples].
List<double> LoadWaveSamples(
  WaveD wave,
) => _module.LoadWaveSamples(wave);

/// See [RaylibAudioDart.LoadMusicStream].
MusicD LoadMusicStream(
  String fileName,
) => _module.LoadMusicStream(fileName);

/// See [RaylibAudioDart.LoadMusicStreamFromMemory].
MusicD LoadMusicStreamFromMemory(
  String fileType,
  Uint8List data,
) => _module.LoadMusicStreamFromMemory(fileType, data);

/// See [RaylibAudioDart.IsMusicValid].
bool IsMusicValid(
  MusicD music,
) => _module.IsMusicValid(music);

/// See [RaylibAudioDart.UnloadMusicStream].
void UnloadMusicStream(
  MusicD music,
) => _module.UnloadMusicStream(music);

/// See [RaylibAudioDart.PlayMusicStream].
void PlayMusicStream(
  MusicD music,
) => _module.PlayMusicStream(music);

/// See [RaylibAudioDart.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(
  MusicD music,
) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudioDart.UpdateMusicStream].
void UpdateMusicStream(
  MusicD music,
) => _module.UpdateMusicStream(music);

/// See [RaylibAudioDart.StopMusicStream].
void StopMusicStream(
  MusicD music,
) => _module.StopMusicStream(music);

/// See [RaylibAudioDart.PauseMusicStream].
void PauseMusicStream(
  MusicD music,
) => _module.PauseMusicStream(music);

/// See [RaylibAudioDart.ResumeMusicStream].
void ResumeMusicStream(
  MusicD music,
) => _module.ResumeMusicStream(music);

/// See [RaylibAudioDart.SeekMusicStream].
void SeekMusicStream(
  MusicD music,
  double position,
) => _module.SeekMusicStream(music, position);

/// See [RaylibAudioDart.SetMusicVolume].
void SetMusicVolume(
  MusicD music,
  double volume,
) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudioDart.SetMusicPitch].
void SetMusicPitch(
  MusicD music,
  double pitch,
) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudioDart.SetMusicPan].
void SetMusicPan(
  MusicD music,
  double pan,
) => _module.SetMusicPan(music, pan);

/// See [RaylibAudioDart.GetMusicTimeLength].
double GetMusicTimeLength(
  MusicD music,
) => _module.GetMusicTimeLength(music);

/// See [RaylibAudioDart.GetMusicTimePlayed].
double GetMusicTimePlayed(
  MusicD music,
) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudioDart.LoadAudioStream].
AudioStreamD LoadAudioStream(
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudioDart.IsAudioStreamValid].
bool IsAudioStreamValid(
  AudioStreamD stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioDart.UnloadAudioStream].
void UnloadAudioStream(
  AudioStreamD stream,
) => _module.UnloadAudioStream(stream);

/// See [RaylibAudioDart.UpdateAudioStream].
void UpdateAudioStream(
  AudioStreamD stream,
  TypedDataList data,
) => _module.UpdateAudioStream(stream, data);

/// See [RaylibAudioDart.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(
  AudioStreamD stream,
) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudioDart.PlayAudioStream].
void PlayAudioStream(
  AudioStreamD stream,
) => _module.PlayAudioStream(stream);

/// See [RaylibAudioDart.PauseAudioStream].
void PauseAudioStream(
  AudioStreamD stream,
) => _module.PauseAudioStream(stream);

/// See [RaylibAudioDart.ResumeAudioStream].
void ResumeAudioStream(
  AudioStreamD stream,
) => _module.ResumeAudioStream(stream);

/// See [RaylibAudioDart.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(
  AudioStreamD stream,
) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudioDart.StopAudioStream].
void StopAudioStream(
  AudioStreamD stream,
) => _module.StopAudioStream(stream);

/// See [RaylibAudioDart.SetAudioStreamVolume].
void SetAudioStreamVolume(
  AudioStreamD stream,
  double volume,
) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudioDart.SetAudioStreamPitch].
void SetAudioStreamPitch(
  AudioStreamD stream,
  double pitch,
) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudioDart.SetAudioStreamPan].
void SetAudioStreamPan(
  AudioStreamD stream,
  double pan,
) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudioDart.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(
  int size,
) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudioDart.SetAudioStreamCallback].
void SetAudioStreamCallback(
  AudioStreamD stream,
  AudioCallbackBase callback,
) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudioDart.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(
  AudioStreamD stream,
  AudioCallbackBase callback,
) => _module.AttachAudioStreamProcessor(stream, callback);

/// See [RaylibAudioDart.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(
  AudioStreamD stream,
  AudioCallbackBase callback,
  {bool keepAlive = false}
) => _module.DetachAudioStreamProcessor(stream, callback, keepAlive: keepAlive);

/// See [RaylibAudioDart.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(
  AudioCallbackBase callback,
) => _module.AttachAudioMixedProcessor(callback);

/// See [RaylibAudioDart.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(
  AudioCallbackBase callback,
  {bool keepAlive = false}
) => _module.DetachAudioMixedProcessor(callback, keepAlive: keepAlive);
