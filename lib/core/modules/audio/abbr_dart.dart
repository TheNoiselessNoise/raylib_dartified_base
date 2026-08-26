import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibAudioModule get _module => RaylibBase.instance.AudioDart;

/// See [RaylibAudioModule.InitAudioDevice].
void InitAudioDevice() => _module.InitAudioDevice();

/// See [RaylibAudioModule.CloseAudioDevice].
void CloseAudioDevice() => _module.CloseAudioDevice();

/// See [RaylibAudioModule.IsAudioDeviceReady].
bool IsAudioDeviceReady() => _module.IsAudioDeviceReady();

/// See [RaylibAudioModule.SetMasterVolume].
void SetMasterVolume(
  double volume,
) => _module.SetMasterVolume(volume);

/// See [RaylibAudioModule.GetMasterVolume].
double GetMasterVolume() => _module.GetMasterVolume();

/// See [RaylibAudioModule.LoadWave].
WaveD LoadWave(
  String fileName,
) => _module.LoadWave(fileName);

/// See [RaylibAudioModule.LoadWaveFromMemory].
WaveD LoadWaveFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadWaveFromMemory(fileType, fileData);

/// See [RaylibAudioModule.IsWaveValid].
bool IsWaveValid(
  WaveD wave,
) => _module.IsWaveValid(wave);

/// See [RaylibAudioModule.LoadSound].
SoundD LoadSound(
  String fileName,
) => _module.LoadSound(fileName);

/// See [RaylibAudioModule.LoadSoundFromWave].
SoundD LoadSoundFromWave(
  WaveD wave,
) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudioModule.LoadSoundAlias].
SoundD LoadSoundAlias(
  SoundD source,
) => _module.LoadSoundAlias(source);

/// See [RaylibAudioModule.IsSoundValid].
bool IsSoundValid(
  SoundD sound,
) => _module.IsSoundValid(sound);

/// See [RaylibAudioModule.UpdateSound].
void UpdateSound(
  SoundD sound,
  TypedDataList data,
  int sampleCount,
) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudioModule.UnloadWave].
void UnloadWave(
  WaveD wave,
) => _module.UnloadWave(wave);

/// See [RaylibAudioModule.UnloadSound].
void UnloadSound(
  SoundD sound,
) => _module.UnloadSound(sound);

/// See [RaylibAudioModule.UnloadSoundAlias].
void UnloadSoundAlias(
  SoundD alias,
) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudioModule.ExportWave].
bool ExportWave(
  WaveD wave,
  String fileName,
) => _module.ExportWave(wave, fileName);

/// See [RaylibAudioModule.ExportWaveAsCode].
bool ExportWaveAsCode(
  WaveD wave,
  String fileName,
) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudioModule.PlaySound].
void PlaySound(
  SoundD sound,
) => _module.PlaySound(sound);

/// See [RaylibAudioModule.StopSound].
void StopSound(
  SoundD sound,
) => _module.StopSound(sound);

/// See [RaylibAudioModule.PauseSound].
void PauseSound(
  SoundD sound,
) => _module.PauseSound(sound);

/// See [RaylibAudioModule.ResumeSound].
void ResumeSound(
  SoundD sound,
) => _module.ResumeSound(sound);

/// See [RaylibAudioModule.IsSoundPlaying].
bool IsSoundPlaying(
  SoundD sound,
) => _module.IsSoundPlaying(sound);

/// See [RaylibAudioModule.SetSoundVolume].
void SetSoundVolume(
  SoundD sound,
  double volume,
) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudioModule.SetSoundPitch].
void SetSoundPitch(
  SoundD sound,
  double pitch,
) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudioModule.SetSoundPan].
void SetSoundPan(
  SoundD sound,
  double pan,
) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudioModule.WaveCopy].
WaveD WaveCopy(
  WaveD wave,
) => _module.WaveCopy(wave);

/// See [RaylibAudioModule.WaveCrop].
void WaveCrop(
  WaveD wave,
  int initFrame,
  int finalFrame,
) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudioModule.WaveFormat].
void WaveFormat(
  WaveD wave,
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudioModule.LoadWaveSamples].
List<double> LoadWaveSamples(
  WaveD wave,
) => _module.LoadWaveSamples(wave);

/// See [RaylibAudioModule.LoadMusicStream].
MusicD LoadMusicStream(
  String fileName,
) => _module.LoadMusicStream(fileName);

/// See [RaylibAudioModule.LoadMusicStreamFromMemory].
MusicD LoadMusicStreamFromMemory(
  String fileType,
  Uint8List data,
) => _module.LoadMusicStreamFromMemory(fileType, data);

/// See [RaylibAudioModule.IsMusicValid].
bool IsMusicValid(
  MusicD music,
) => _module.IsMusicValid(music);

/// See [RaylibAudioModule.UnloadMusicStream].
void UnloadMusicStream(
  MusicD music,
) => _module.UnloadMusicStream(music);

/// See [RaylibAudioModule.PlayMusicStream].
void PlayMusicStream(
  MusicD music,
) => _module.PlayMusicStream(music);

/// See [RaylibAudioModule.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(
  MusicD music,
) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudioModule.UpdateMusicStream].
void UpdateMusicStream(
  MusicD music,
) => _module.UpdateMusicStream(music);

/// See [RaylibAudioModule.StopMusicStream].
void StopMusicStream(
  MusicD music,
) => _module.StopMusicStream(music);

/// See [RaylibAudioModule.PauseMusicStream].
void PauseMusicStream(
  MusicD music,
) => _module.PauseMusicStream(music);

/// See [RaylibAudioModule.ResumeMusicStream].
void ResumeMusicStream(
  MusicD music,
) => _module.ResumeMusicStream(music);

/// See [RaylibAudioModule.SeekMusicStream].
void SeekMusicStream(
  MusicD music,
  double position,
) => _module.SeekMusicStream(music, position);

/// See [RaylibAudioModule.SetMusicVolume].
void SetMusicVolume(
  MusicD music,
  double volume,
) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudioModule.SetMusicPitch].
void SetMusicPitch(
  MusicD music,
  double pitch,
) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudioModule.SetMusicPan].
void SetMusicPan(
  MusicD music,
  double pan,
) => _module.SetMusicPan(music, pan);

/// See [RaylibAudioModule.GetMusicTimeLength].
double GetMusicTimeLength(
  MusicD music,
) => _module.GetMusicTimeLength(music);

/// See [RaylibAudioModule.GetMusicTimePlayed].
double GetMusicTimePlayed(
  MusicD music,
) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudioModule.LoadAudioStream].
AudioStreamD LoadAudioStream(
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudioModule.IsAudioStreamValid].
bool IsAudioStreamValid(
  AudioStreamD stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioModule.UnloadAudioStream].
void UnloadAudioStream(
  AudioStreamD stream,
) => _module.UnloadAudioStream(stream);

/// See [RaylibAudioModule.UpdateAudioStream].
void UpdateAudioStream(
  AudioStreamD stream,
  TypedDataList data,
) => _module.UpdateAudioStream(stream, data);

/// See [RaylibAudioModule.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(
  AudioStreamD stream,
) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudioModule.PlayAudioStream].
void PlayAudioStream(
  AudioStreamD stream,
) => _module.PlayAudioStream(stream);

/// See [RaylibAudioModule.PauseAudioStream].
void PauseAudioStream(
  AudioStreamD stream,
) => _module.PauseAudioStream(stream);

/// See [RaylibAudioModule.ResumeAudioStream].
void ResumeAudioStream(
  AudioStreamD stream,
) => _module.ResumeAudioStream(stream);

/// See [RaylibAudioModule.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(
  AudioStreamD stream,
) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudioModule.StopAudioStream].
void StopAudioStream(
  AudioStreamD stream,
) => _module.StopAudioStream(stream);

/// See [RaylibAudioModule.SetAudioStreamVolume].
void SetAudioStreamVolume(
  AudioStreamD stream,
  double volume,
) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudioModule.SetAudioStreamPitch].
void SetAudioStreamPitch(
  AudioStreamD stream,
  double pitch,
) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudioModule.SetAudioStreamPan].
void SetAudioStreamPan(
  AudioStreamD stream,
  double pan,
) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudioModule.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(
  int size,
) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudioModule.SetAudioStreamCallback].
void SetAudioStreamCallback(
  AudioStreamD stream,
  AudioCallbackBase callback,
) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudioModule.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(
  AudioStreamD stream,
  AudioCallbackBase callback,
) => _module.AttachAudioStreamProcessor(stream, callback);

/// See [RaylibAudioModule.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(
  AudioStreamD stream,
  AudioCallbackBase callback,
  {bool keepAlive = false}
) => _module.DetachAudioStreamProcessor(stream, callback, keepAlive: keepAlive);

/// See [RaylibAudioModule.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(
  AudioCallbackBase callback,
) => _module.AttachAudioMixedProcessor(callback);

/// See [RaylibAudioModule.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(
  AudioCallbackBase callback,
  {bool keepAlive = false}
) => _module.DetachAudioMixedProcessor(callback, keepAlive: keepAlive);
