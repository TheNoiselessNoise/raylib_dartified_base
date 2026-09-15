part of '../../raylib_dartified_base.dart';

/// Backend-agnostic Raylib Audio module.
final class RaylibAudioDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibAudioDartDebugLabels();

  RaylibAudioDart(super.rl);

  RaylibAudioFlatModule get _flat => rl.module();

  /// Initialize audio device and context
  void InitAudioDevice() => run(
    () => _debugLabels.InitAudioDevice(),
    () => _flat.InitAudioDevice(),
  );

  /// Close the audio device and context
  void CloseAudioDevice() => run(
    () => _debugLabels.CloseAudioDevice(),
    () => _flat.CloseAudioDevice(),
  );
  
  /// Check if audio device has been initialized successfully
  bool IsAudioDeviceReady() => run(
    () => _debugLabels.IsAudioDeviceReady(),
    () => _flat.IsAudioDeviceReady(),
  );

  /// Set master volume (listener)
  void SetMasterVolume(
    double volume,
  ) => run(
    () => _debugLabels.SetMasterVolume(volume),
    () => _flat.SetMasterVolume(
      volume,
    ),
  );

  /// Get master volume (listener)
  double GetMasterVolume() => run(
    () => _debugLabels.GetMasterVolume(),
    () => _flat.GetMasterVolume(),
  );

  /// Load wave data from file
  WaveD LoadWave(
    String fileName,
  ) => run(
    () => _debugLabels.LoadWave(fileName),
    () => _flat.LoadWave(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  WaveD LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => _debugLabels.LoadWaveFromMemory(fileType, fileData),
    () => _flat.LoadWaveFromMemory(
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
    () => _flat.IsWaveValid(
      wave,
    ),
  );

  /// Load sound from file
  SoundD LoadSound(
    String fileName,
  ) => run(
    () => _debugLabels.LoadSound(fileName),
    () => _flat.LoadSound(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load sound from wave data
  SoundD LoadSoundFromWave(
    WaveD wave,
  ) => run(
    () => _debugLabels.LoadSoundFromWave(wave),
    () => _flat.LoadSoundFromWave(
      wave,
    ),
  );

  /// Create a new sound that shares the same sample data as the source sound, does not own the sound data
  SoundD LoadSoundAlias(
    SoundD source,
  ) => run(
    () => _debugLabels.LoadSoundAlias(source),
    () => _flat.LoadSoundAlias(
      source,
    ),
  );

  /// Checks if a sound is valid (data loaded and buffers initialized)
  bool IsSoundValid(
    SoundD sound,
  ) => run(
    () => _debugLabels.IsSoundValid(sound),
    () => _flat.IsSoundValid(
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
    () => _flat.UpdateSound(
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
    () => _flat.UnloadWave(
      wave,
    ),
  );

  /// Unload sound
  void UnloadSound(
    SoundD sound,
  ) => run(
    () => _debugLabels.UnloadSound(sound),
    () => _flat.UnloadSound(
      sound,
    ),
  );

  /// Unload a sound alias (does not deallocate sample data)
  void UnloadSoundAlias(
    SoundD alias,
  ) => run(
    () => _debugLabels.UnloadSoundAlias(alias),
    () => _flat.UnloadSoundAlias(
      alias,
    ),
  );

  /// Export wave data to file, returns true on success
  bool ExportWave(
    WaveD wave,
    String fileName,
  ) => run(
    () => _debugLabels.ExportWave(wave, fileName),
    () => _flat.ExportWave(
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
    () => _flat.ExportWaveAsCode(
      wave,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Play a sound
  void PlaySound(
    SoundD sound,
  ) => run(
    () => _debugLabels.PlaySound(sound),
    () => _flat.PlaySound(
      sound,
    ),
  );

  /// Stop playing a sound
  void StopSound(
    SoundD sound,
  ) => run(
    () => _debugLabels.StopSound(sound),
    () => _flat.StopSound(
      sound,
    ),
  );

  /// Pause a sound
  void PauseSound(
    SoundD sound,
  ) => run(
    () => _debugLabels.PauseSound(sound),
    () => _flat.PauseSound(
      sound,
    ),
  );

  /// Resume a paused sound
  void ResumeSound(
    SoundD sound,
  ) => run(
    () => _debugLabels.ResumeSound(sound),
    () => _flat.ResumeSound(
      sound,
    ),
  );

  /// Check if a sound is currently playing
  bool IsSoundPlaying(
    SoundD sound,
  ) => run(
    () => _debugLabels.IsSoundPlaying(sound),
    () => _flat.IsSoundPlaying(
      sound,
    ),
  );

  /// Set volume for a sound (1.0 is max level)
  void SetSoundVolume(
    SoundD sound,
    double volume,
  ) => run(
    () => _debugLabels.SetSoundVolume(sound, volume),
    () => _flat.SetSoundVolume(
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
    () => _flat.SetSoundPitch(
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
    () => _flat.SetSoundPan(
      sound,
      pan,
    ),
  );

  /// Copy a wave to a new wave
  WaveD WaveCopy(
    WaveD wave,
  ) => run(
    () => _debugLabels.WaveCopy(wave),
    () => _flat.WaveCopy(
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
    () => _flat.WaveCrop(
      rl.Temp.Wave$.Ref1(wave),
      initFrame,
      finalFrame,
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
    () => _flat.WaveFormat(
      rl.Temp.Wave$.Ref1(wave),
      sampleRate,
      sampleSize,
      channels,
    ),
  );

  /// Load samples data from wave as a 32bit float data array
  List<double> LoadWaveSamples(
    WaveD wave,
  ) => run(
    () => _debugLabels.LoadWaveSamples(wave),
    () {
      final samples = _flat.LoadWaveSamples(
        wave,
      );
      try {
        return .generate(wave.waveLength, (i) => samples[i]);
      } finally {
        _flat.UnloadWaveSamples(samples);
      }
    },
  );

  /// Load music stream from file
  MusicD LoadMusicStream(
    String fileName,
  ) => run(
    () => _debugLabels.LoadMusicStream(fileName),
    () => _flat.LoadMusicStream(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load music stream from data
  MusicD LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => run(
    () => _debugLabels.LoadMusicStreamFromMemory(fileType, data),
    () => _flat.LoadMusicStreamFromMemory(
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
    () => _flat.IsMusicValid(
      music,
    ),
  );

  /// Unload music stream
  void UnloadMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.UnloadMusicStream(music),
    () => _flat.UnloadMusicStream(
      music,
    ),
  );

  /// Start music playing
  void PlayMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.PlayMusicStream(music),
    () => _flat.PlayMusicStream(
      music,
    ),
  );

  /// Check if music is playing
  bool IsMusicStreamPlaying(
    MusicD music,
  ) => run(
    () => _debugLabels.IsMusicStreamPlaying(music),
    () => _flat.IsMusicStreamPlaying(
      music,
    ),
  );

  /// Updates buffers for music streaming
  void UpdateMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.UpdateMusicStream(music),
    () => _flat.UpdateMusicStream(
      music,
    ),
  );

  /// Stop music playing
  void StopMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.StopMusicStream(music),
    () => _flat.StopMusicStream(
      music,
    ),
  );

  /// Pause music playing
  void PauseMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.PauseMusicStream(music),
    () => _flat.PauseMusicStream(
      music,
    ),
  );

  /// Resume playing paused music
  void ResumeMusicStream(
    MusicD music,
  ) => run(
    () => _debugLabels.ResumeMusicStream(music),
    () => _flat.ResumeMusicStream(
      music,
    ),
  );

  /// Seek music to a position (in seconds)
  void SeekMusicStream(
    MusicD music,
    double position,
  ) => run(
    () => _debugLabels.SeekMusicStream(music, position),
    () => _flat.SeekMusicStream(
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
    () => _flat.SetMusicVolume(
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
    () => _flat.SetMusicPitch(
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
    () => _flat.SetMusicPan(
      music,
      pan,
    ),
  );

  /// Get music time length (in seconds)
  double GetMusicTimeLength(
    MusicD music,
  ) => run(
    () => _debugLabels.GetMusicTimeLength(music),
    () => _flat.GetMusicTimeLength(
      music,
    ),
  );

  /// Get current music time played (in seconds)
  double GetMusicTimePlayed(
    MusicD music,
  ) => run(
    () => _debugLabels.GetMusicTimePlayed(music),
    () => _flat.GetMusicTimePlayed(
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
    () => _flat.LoadAudioStream(
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
    () => _flat.IsAudioStreamValid(
      stream,
    ),
  );

  /// Unload audio stream and free memory
  void UnloadAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.UnloadAudioStream(stream),
    () => _flat.UnloadAudioStream(
      stream,
    ),
  );

  /// Update audio stream buffers with data
  void UpdateAudioStream(
    AudioStreamD stream,
    TypedDataList data,
  ) => run(
    () => _debugLabels.UpdateAudioStream(stream, data),
    () => _flat.UpdateAudioStream(
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
    () => _flat.IsAudioStreamProcessed(
      stream,
    ),
  );

  /// Play audio stream
  void PlayAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.PlayAudioStream(stream),
    () => _flat.PlayAudioStream(
      stream,
    ),
  );

  /// Pause audio stream
  void PauseAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.PauseAudioStream(stream),
    () => _flat.PauseAudioStream(
      stream,
    ),
  );

  /// Resume audio stream
  void ResumeAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.ResumeAudioStream(stream),
    () => _flat.ResumeAudioStream(
      stream,
    ),
  );

  /// Check if audio stream is playing
  bool IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.IsAudioStreamPlaying(stream),
    () => _flat.IsAudioStreamPlaying(
      stream,
    ),
  );

  /// Stop audio stream
  void StopAudioStream(
    AudioStreamD stream,
  ) => run(
    () => _debugLabels.StopAudioStream(stream),
    () => _flat.StopAudioStream(
      stream,
    ),
  );

  /// Set volume for audio stream (1.0 is max level)
  void SetAudioStreamVolume(
    AudioStreamD stream,
    double volume,
  ) => run(
    () => _debugLabels.SetAudioStreamVolume(stream, volume),
    () => _flat.SetAudioStreamVolume(
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
    () => _flat.SetAudioStreamPitch(
      stream,
      pitch,
    ),
  );

  /// Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)
  void SetAudioStreamPan(
    AudioStreamD stream,
    double pan,
  ) => run(
    () => _debugLabels.SetAudioStreamPan(stream, pan),
    () => _flat.SetAudioStreamPan(
      stream,
      pan,
    ),
  );

  /// Default size for new audio streams
  void SetAudioStreamBufferSizeDefault(
    int size,
  ) => run(
    () => _debugLabels.SetAudioStreamBufferSizeDefault(size),
    () => _flat.SetAudioStreamBufferSizeDefault(
      size,
    ),
  );

  /// Audio thread callback to request new data
  void SetAudioStreamCallback(
    AudioStreamD stream,
    covariant AudioCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetAudioStreamCallback(stream, callback),
    () => _flat.SetAudioStreamCallback(
      stream,
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );

  /// Attach audio stream processor to stream, receives the samples as 'float'
  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    covariant AudioCallbackBase processor,
  ) => run(
    () => _debugLabels.AttachAudioStreamProcessor(stream, processor),
    () => _flat.AttachAudioStreamProcessor(
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
    () => _flat.DetachAudioStreamProcessor(
      stream,
      processor.detach(keepAlive),
    ),
  );

  /// Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
  void AttachAudioMixedProcessor(
    covariant AudioCallbackBase processor,
  ) => run(
    () => _debugLabels.AttachAudioMixedProcessor(processor),
    () => _flat.AttachAudioMixedProcessor(
      processor.attach(),
    ),
  );

  /// Detach audio stream processor from the entire audio pipeline
  void DetachAudioMixedProcessor(
    covariant AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => run(
    () => _debugLabels.DetachAudioMixedProcessor(processor, keepAlive: keepAlive),
    () => _flat.DetachAudioMixedProcessor(
      processor.detach(keepAlive),
    ),
  );
}