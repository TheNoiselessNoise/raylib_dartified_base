part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Audio module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
final class RaylibAudioModule<R extends RaylibBase<R>> extends RaylibModule<R> {

  final _debugLabels = _RaylibAudioModuleDebugLabels();

  RaylibAudioModule(super.rl);

  /// Initialize audio device and context
  void InitAudioDevice() => run(
    () => _debugLabels.InitAudioDevice(),
    () => rl.AudioFlat.InitAudioDevice(),
  );

  /// Close the audio device and context
  void CloseAudioDevice() => run(
    () => _debugLabels.CloseAudioDevice(),
    () => rl.AudioFlat.CloseAudioDevice(),
  );
  
  /// Check if audio device has been initialized successfully
  bool IsAudioDeviceReady() => run(
    () => _debugLabels.IsAudioDeviceReady(),
    () => rl.AudioFlat.IsAudioDeviceReady(),
  );

  /// Set master volume (listener)
  void SetMasterVolume(
    double volume,
  ) => run(
    () => _debugLabels.SetMasterVolume(volume),
    () => rl.AudioFlat.SetMasterVolume(
      volume,
    ),
  );

  /// Get master volume (listener)
  double GetMasterVolume() => run(
    () => _debugLabels.GetMasterVolume(),
    () => rl.AudioFlat.GetMasterVolume(),
  );

  /// Load wave data from file
  WaveD LoadWave(
    String fileName,
  ) => run(
    () => _debugLabels.LoadWave(fileName),
    () => rl.AudioFlat.LoadWave(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  WaveD LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => _debugLabels.LoadWaveFromMemory(fileType, fileData),
    () => rl.AudioFlat.LoadWaveFromMemory(
      rl.Temp.String$.ValueOrNull(fileType),
      rl.Temp.UnsignedChar$.Array(fileData),
      fileData.length,
    ),
  );

  /// Checks if wave data is valid (data loaded and parameters)
  bool IsWaveValid(
    WaveD wave,
  ) => run(
    () => _debugLabels.IsWaveValid(wave),
    () => rl.AudioFlat.IsWaveValid(
      wave,
    ),
  );

  /// Load sound from file
  SoundD LoadSound(
    String fileName,
  ) => run(
    () => _debugLabels.LoadSound(fileName),
    () => rl.AudioFlat.LoadSound(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load sound from wave data
  SoundD LoadSoundFromWave(
    WaveD wave,
  ) => run(
    () => _debugLabels.LoadSoundFromWave(wave),
    () => rl.AudioFlat.LoadSoundFromWave(
      wave,
    ),
  );

  /// Create a new sound that shares the same sample data as the source sound, does not own the sound data
  SoundD LoadSoundAlias(
    SoundD source,
  ) => run(
    () => _debugLabels.LoadSoundAlias(source),
    () => rl.AudioFlat.LoadSoundAlias(
      source,
    ),
  );

  /// Checks if a sound is valid (data loaded and buffers initialized)
  bool IsSoundValid(
    SoundD sound,
  ) => run(
    () => _debugLabels.IsSoundValid(sound),
    () => rl.AudioFlat.IsSoundValid(
      sound,
    ),
  );

  /// Update sound buffer with new data
  void UpdateSound(
    SoundD sound,
    TypedDataList data,
    int sampleCount,
  ) => run(
    () => _debugLabels.UpdateSound(sound, data, sampleCount),
    () => rl.AudioFlat.UpdateSound(
      sound,
      rl.Temp.TypedDataList$.Array(data),
      sampleCount,
    ),
  );

  /// Unload wave data
  void UnloadWave(
    WaveD wave,
  ) => run(
    () => _debugLabels.UnloadWave(wave),
    () => rl.AudioFlat.UnloadWave(
      wave,
    ),
  );

  /// Unload sound
  void UnloadSound(
    SoundD sound,
  ) => run(
    () => _debugLabels.UnloadSound(sound),
    () => rl.AudioFlat.UnloadSound(
      sound,
    ),
  );

  /// Unload a sound alias (does not deallocate sample data)
  void UnloadSoundAlias(
    SoundD alias,
  ) => run(
    () => _debugLabels.UnloadSoundAlias(alias),
    () => rl.AudioFlat.UnloadSoundAlias(
      alias,
    ),
  );

  /// Export wave data to file, returns true on success
  bool ExportWave(
    WaveD wave,
    String fileName,
  ) => run(
    () => _debugLabels.ExportWave(wave, fileName),
    () => rl.AudioFlat.ExportWave(
      wave,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Export wave sample data to code (.h), returns true on success
  bool ExportWaveAsCode(
    WaveD wave,
    String fileName,
  ) => run(
    () => _debugLabels.ExportWaveAsCode(wave, fileName),
    () => rl.AudioFlat.ExportWaveAsCode(
      wave,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Play a sound
  void PlaySound(
    SoundD sound,
  ) => run(
    () => _debugLabels.PlaySound(sound),
    () => rl.AudioFlat.PlaySound(
      sound,
    ),
  );

  /// Stop playing a sound
  void StopSound(
    SoundD sound,
  ) => run(
    () => _debugLabels.StopSound(sound),
    () => rl.AudioFlat.StopSound(
      sound,
    ),
  );

  /// Pause a sound
  void PauseSound(
    SoundD sound,
  ) => run(
    () => _debugLabels.PauseSound(sound),
    () => rl.AudioFlat.PauseSound(
      sound,
    ),
  );

  /// Resume a paused sound
  void ResumeSound(
    SoundD sound,
  ) => run(
    () => _debugLabels.ResumeSound(sound),
    () => rl.AudioFlat.ResumeSound(
      sound,
    ),
  );

  /// Check if a sound is currently playing
  bool IsSoundPlaying(
    SoundD sound,
  ) => run(
    () => _debugLabels.IsSoundPlaying(sound),
    () => rl.AudioFlat.IsSoundPlaying(
      sound,
    ),
  );

  /// Set volume for a sound (1.0 is max level)
  void SetSoundVolume(
    SoundD sound,
    double volume,
  ) => run(
    () => _debugLabels.SetSoundVolume(sound, volume),
    () => rl.AudioFlat.SetSoundVolume(
      sound,
      volume,
    ),
  );

  /// Set pitch for a sound (1.0 is base level)
  void SetSoundPitch(
    SoundD sound,
    double pitch,
  ) => run(
    () => _debugLabels.SetSoundPitch(sound, pitch),
    () => rl.AudioFlat.SetSoundPitch(
      sound,
      pitch,
    ),
  );

  /// Set pan for a sound (0.5 is center)
  void SetSoundPan(
    SoundD sound,
    double pan,
  ) => run(
    () => _debugLabels.SetSoundPan(sound, pan),
    () => rl.AudioFlat.SetSoundPan(
      sound,
      pan,
    ),
  );

  /// Copy a wave to a new wave
  WaveD WaveCopy(
    WaveD wave,
  ) => run(
    () => _debugLabels.WaveCopy(wave),
    () => rl.AudioFlat.WaveCopy(
      wave,
    ),
  );

  /// Crop a wave to defined frames range
  void WaveCrop(
    WaveD wave,
    int initFrame,
    int finalFrame,
  ) => run(
    () => _debugLabels.WaveCrop(wave, initFrame, finalFrame),
    () => rl.Temp.Wave$.RefUpdate1(wave,
      (p) => rl.AudioFlat.WaveCrop(
        p,
        initFrame,
        finalFrame,
      ),
    ),
  );

  /// Convert wave data to desired format
  void WaveFormat(
    WaveD wave,
    int sampleRate,
    int sampleSize,
    int channels,
  ) => run(
    () => _debugLabels.WaveFormat(wave, sampleRate, sampleSize, channels),
    () => rl.Temp.Wave$.RefUpdate1(wave,
      (p) => rl.AudioFlat.WaveFormat(
        p,
        sampleRate,
        sampleSize,
        channels,
      ),
    ),
  );

  /// Load samples data from wave as a 32bit float data array
  List<double> LoadWaveSamples(
    WaveD wave,
  ) => run(
    () => _debugLabels.LoadWaveSamples(wave),
    () {
      final samples = rl.AudioFlat.LoadWaveSamples(
        wave,
      );
      try {
        return .generate(wave.waveLength, (i) => samples[i]);
      } finally {
        rl.AudioFlat.UnloadWaveSamples(samples);
      }
    },
  );

  /// Load music stream from file
  MusicD LoadMusicStream(
    String fileName,
  ) => run(
    () => _debugLabels.LoadMusicStream(fileName),
    () => rl.AudioFlat.LoadMusicStream(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load music stream from data
  MusicD LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => run(
    () => _debugLabels.LoadMusicStreamFromMemory(fileType, data),
    () => rl.AudioFlat.LoadMusicStreamFromMemory(
      rl.Temp.String$.ValueOrNull(fileType),
      rl.Temp.UnsignedChar$.Array(data),
      data.length,
    ),
  );

  /// Checks if a music stream is valid (context and buffers initialized)
  bool IsMusicValid(
    MusicD music,
  ) => run(
    () => _debugLabels.IsMusicValid(music),
    () => rl.AudioFlat.IsMusicValid(
      music,
    ),
  );

  /// Unload music stream
  void UnloadMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.UnloadMusicStream(music),
    () => rl.AudioFlat.UnloadMusicStream(
      music,
    ),
  );

  /// Start music playing
  void PlayMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.PlayMusicStream(music),
    () => rl.AudioFlat.PlayMusicStream(
      music,
    ),
  );

  /// Check if music is playing
  bool IsMusicStreamPlaying(
    MusicD music,
  ) => run(
    () => _debugLabels.IsMusicStreamPlaying(music),
    () => rl.AudioFlat.IsMusicStreamPlaying(
      music,
    ),
  );

  /// Updates buffers for music streaming
  void UpdateMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.UpdateMusicStream(music),
    () => rl.AudioFlat.UpdateMusicStream(
      music,
    ),
  );

  /// Stop music playing
  void StopMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.StopMusicStream(music),
    () => rl.AudioFlat.StopMusicStream(
      music,
    ),
  );

  /// Pause music playing
  void PauseMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.PauseMusicStream(music),
    () => rl.AudioFlat.PauseMusicStream(
      music,
    ),
  );

  /// Resume playing paused music
  void ResumeMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.ResumeMusicStream(music),
    () => rl.AudioFlat.ResumeMusicStream(
      music,
    ),
  );

  /// Seek music to a position (in seconds)
  void SeekMusicStream(
    MusicD music,
    double position,
  ) => run(
    () => _debugLabels.SeekMusicStream(music, position),
    () => rl.AudioFlat.SeekMusicStream(
      music,
      position,
    ),
  );

  /// Set volume for music (1.0 is max level)
  void SetMusicVolume(
    MusicD music,
    double volume,
  ) => run(
    () => _debugLabels.SetMusicVolume(music, volume),
    () => rl.AudioFlat.SetMusicVolume(
      music,
      volume,
    ),
  );

  /// Set pitch for a music (1.0 is base level)
  void SetMusicPitch(
    MusicD music,
    double pitch,
  ) => run(
    () => _debugLabels.SetMusicPitch(music, pitch),
    () => rl.AudioFlat.SetMusicPitch(
      music,
      pitch,
    ),
  );

  /// Set pan for a music (0.5 is center)
  void SetMusicPan(
    MusicD music,
    double pan,
  ) => run(
    () => _debugLabels.SetMusicPan(music, pan),
    () => rl.AudioFlat.SetMusicPan(
      music,
      pan,
    ),
  );

  /// Get music time length (in seconds)
  double GetMusicTimeLength(
    MusicD music,
  ) => run(
    () => _debugLabels.GetMusicTimeLength(music),
    () => rl.AudioFlat.GetMusicTimeLength(
      music,
    ),
  );

  /// Get current music time played (in seconds)
  double GetMusicTimePlayed(
    MusicD music,
  ) => run(
    () => _debugLabels.GetMusicTimePlayed(music),
    () => rl.AudioFlat.GetMusicTimePlayed(
      music,
    ),
  );

  /// Load audio stream (to stream raw audio pcm data)
  AudioStreamD LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels,
  ) => run(
    () => _debugLabels.LoadAudioStream(sampleRate, sampleSize, channels),
    () => rl.AudioFlat.LoadAudioStream(
      sampleRate,
      sampleSize,
      channels,
    ),
  );

  /// Checks if an audio stream is valid (buffers initialized)
  bool IsAudioStreamValid(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.IsAudioStreamValid(stream),
    () => rl.AudioFlat.IsAudioStreamValid(
      stream,
    ),
  );

  /// Unload audio stream and free memory
  void UnloadAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.UnloadAudioStream(stream),
    () => rl.AudioFlat.UnloadAudioStream(
      stream,
    ),
  );

  /// Update audio stream buffers with data
  void UpdateAudioStream(
    AudioStreamD stream,
    TypedDataList data,
  ) => run(
    () => _debugLabels.UpdateAudioStream(stream, data),
    () => rl.AudioFlat.UpdateAudioStream(
      stream,
      rl.Temp.TypedDataList$.Array(data),
      data.length,
    ),
  );

  /// Check if any audio stream buffers requires refill
  bool IsAudioStreamProcessed(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.IsAudioStreamProcessed(stream),
    () => rl.AudioFlat.IsAudioStreamProcessed(
      stream,
    ),
  );

  /// Play audio stream
  void PlayAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.PlayAudioStream(stream),
    () => rl.AudioFlat.PlayAudioStream(
      stream,
    ),
  );

  /// Pause audio stream
  void PauseAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.PauseAudioStream(stream),
    () => rl.AudioFlat.PauseAudioStream(
      stream,
    ),
  );

  /// Resume audio stream
  void ResumeAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.ResumeAudioStream(stream),
    () => rl.AudioFlat.ResumeAudioStream(
      stream,
    ),
  );

  /// Check if audio stream is playing
  bool IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.IsAudioStreamPlaying(stream),
    () => rl.AudioFlat.IsAudioStreamPlaying(
      stream,
    ),
  );

  /// Stop audio stream
  void StopAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.StopAudioStream(stream),
    () => rl.AudioFlat.StopAudioStream(
      stream,
    ),
  );

  /// Set volume for audio stream (1.0 is max level)
  void SetAudioStreamVolume(
    AudioStreamD stream,
    double volume,
  ) => run(
    () => _debugLabels.SetAudioStreamVolume(stream, volume),
    () => rl.AudioFlat.SetAudioStreamVolume(
      stream,
      volume,
    ),
  );

  /// Set pitch for audio stream (1.0 is base level)
  void SetAudioStreamPitch(
    AudioStreamD stream,
    double pitch,
  ) => run(
    () => _debugLabels.SetAudioStreamPitch(stream, pitch),
    () => rl.AudioFlat.SetAudioStreamPitch(
      stream,
      pitch,
    ),
  );

  /// Set pan for audio stream (0.5 is centered)
  void SetAudioStreamPan(
    AudioStreamD stream,
    double pan,
  ) => run(
    () => _debugLabels.SetAudioStreamPan(stream, pan),
    () => rl.AudioFlat.SetAudioStreamPan(
      stream,
      pan,
    ),
  );

  /// Default size for new audio streams
  void SetAudioStreamBufferSizeDefault(
    int size,
  ) => run(
    () => _debugLabels.SetAudioStreamBufferSizeDefault(size),
    () => rl.AudioFlat.SetAudioStreamBufferSizeDefault(
      size,
    ),
  );

  /// Audio thread callback to request new data
  void SetAudioStreamCallback(
    AudioStreamD stream,
    covariant AudioCallbackBase callback,
  ) => run(
    () => _debugLabels.SetAudioStreamCallback(stream, callback),
    () => rl.AudioFlat.SetAudioStreamCallback(
      stream,
      callback.attach(),
    ),
  );

  /// Attach audio stream processor to stream, receives the samples as 'float'
  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    covariant AudioCallbackBase processor,
  ) => run(
    () => _debugLabels.AttachAudioStreamProcessor(stream, processor),
    () => rl.AudioFlat.AttachAudioStreamProcessor(
      stream,
      processor.attach(),
    ),
  );

  /// Detach audio stream processor from stream
  void DetachAudioStreamProcessor(
    AudioStreamD stream,
    covariant AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => run(
    () => _debugLabels.DetachAudioStreamProcessor(stream, processor, keepAlive: keepAlive),
    () => rl.AudioFlat.DetachAudioStreamProcessor(
      stream,
      processor.detach(keepAlive),
    ),
  );

  /// Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
  void AttachAudioMixedProcessor(
    covariant AudioCallbackBase processor,
  ) => run(
    () => _debugLabels.AttachAudioMixedProcessor(processor),
    () => rl.AudioFlat.AttachAudioMixedProcessor(
      processor.attach(),
    ),
  );

  /// Detach audio stream processor from the entire audio pipeline
  void DetachAudioMixedProcessor(
    covariant AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => run(
    () => _debugLabels.DetachAudioMixedProcessor(processor, keepAlive: keepAlive),
    () => rl.AudioFlat.DetachAudioMixedProcessor(
      processor.detach(keepAlive),
    ),
  );
}