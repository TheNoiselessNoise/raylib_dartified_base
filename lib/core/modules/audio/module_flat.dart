part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Audio flat module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibAudioFlat<R extends RaylibBase> extends RaylibModule<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibAudioDartCaptureIds();

  RaylibAudioFlat(super.rl);

  @override
  @nonVirtual
  @DoNotAbbreviate()
  void dispose() {
    super.dispose();
    AudioCallbackBase.disposeRegistry();
  }

  /// Initialize audio device and context
  void InitAudioDevice();
  
  /// Close the audio device and context
  void CloseAudioDevice();
  
  /// Check if audio device has been initialized successfully
  bool IsAudioDeviceReady();
  
  /// Set master volume (listener)
  void SetMasterVolume(
    double volume,
  );
  
  /// Get master volume (listener)
  double GetMasterVolume();
  
  /// Load wave data from file
  WaveD LoadWave(
    MemoryPointer<RChar> fileName,
  );
  
  /// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  WaveD LoadWaveFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
  );
  
  /// Checks if wave data is valid (data loaded and parameters)
  bool IsWaveValid(
    WaveD wave,
  );
  
  /// Load sound from file
  SoundD LoadSound(
    MemoryPointer<RChar> fileName,
  );
  
  /// Load sound from wave data
  SoundD LoadSoundFromWave(
    WaveD wave,
  );
  
  /// Create a new sound that shares the same sample data as the source sound, does not own the sound data
  SoundD LoadSoundAlias(
    SoundD source,
  );
  
  /// Checks if a sound is valid (data loaded and buffers initialized)
  bool IsSoundValid(
    SoundD sound,
  );
  
  /// Update sound buffer with new data
  void UpdateSound(
    SoundD sound,
    MemoryPointer<RVoid> data,
    int sampleCount,
  );
  
  /// Unload wave data
  void UnloadWave(
    WaveD wave,
  );
  
  /// Unload sound
  void UnloadSound(
    SoundD sound,
  );
  
  /// Unload a sound alias (does not deallocate sample data)
  void UnloadSoundAlias(
    SoundD alias,
  );
  
  /// Export wave data to file, returns true on success
  bool ExportWave(
    WaveD wave,
    MemoryPointer<RChar> fileName,
  );
  
  /// Export wave sample data to code (.h), returns true on success
  bool ExportWaveAsCode(
    WaveD wave,
    MemoryPointer<RChar> fileName,
  );
  
  /// Play a sound
  void PlaySound(
    SoundD sound,
  );
  
  /// Stop playing a sound
  void StopSound(
    SoundD sound,
  );
  
  /// Pause a sound
  void PauseSound(
    SoundD sound,
  );
  
  /// Resume a paused sound
  void ResumeSound(
    SoundD sound,
  );
  
  /// Check if a sound is currently playing
  bool IsSoundPlaying(
    SoundD sound,
  );
  
  /// Set volume for a sound (1.0 is max level)
  void SetSoundVolume(
    SoundD sound,
    double volume,
  );
  
  /// Set pitch for a sound (1.0 is base level)
  void SetSoundPitch(
    SoundD sound,
    double pitch,
  );
  
  /// Set pan for a sound (0.5 is center)
  void SetSoundPan(
    SoundD sound,
    double pan,
  );
  
  /// Copy a wave to a new wave
  WaveD WaveCopy(
    WaveD wave,
  );

  /// Crop a wave to defined frames range
  void WaveCrop(
    StructPointer<WaveD> wave,
    int initFrame,
    int finalFrame,
  );
  
  /// Convert wave data to desired format
  void WaveFormat(
    StructPointer<WaveD> wave,
    int sampleRate,
    int sampleSize,
    int channels,
  );
  
  /// Load samples data from wave as a 32bit float data array
  MemoryPointer<RFloat32> LoadWaveSamples(
    WaveD wave,
  );
  
  /// Unload samples data loaded with LoadWaveSamples()
  void UnloadWaveSamples(
    MemoryPointer<RFloat32> samples,
  );
  
  /// Load music stream from file
  MusicD LoadMusicStream(
    MemoryPointer<RChar> fileName,
  );
  
  /// Load music stream from data
  MusicD LoadMusicStreamFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  );
  
  /// Checks if a music stream is valid (context and buffers initialized)
  bool IsMusicValid(
    MusicD music,
  );
  
  /// Unload music stream
  void UnloadMusicStream(
    MusicD music,
  );
  
  /// Start music playing
  void PlayMusicStream(
    MusicD music,
  );
  
  /// Check if music is playing
  bool IsMusicStreamPlaying(
    MusicD music,
  );
  
  /// Updates buffers for music streaming
  void UpdateMusicStream(
    MusicD music,
  );
  
  /// Stop music playing
  void StopMusicStream(
    MusicD music,
  );
  
  /// Pause music playing
  void PauseMusicStream(
    MusicD music,
  );
  
  /// Resume playing paused music
  void ResumeMusicStream(
    MusicD music,
  );
  
  /// Seek music to a position (in seconds)
  void SeekMusicStream(
    MusicD music,
    double position,
  );
  
  /// Set volume for music (1.0 is max level)
  void SetMusicVolume(
    MusicD music,
    double volume,
  );
  
  /// Set pitch for a music (1.0 is base level)
  void SetMusicPitch(
    MusicD music,
    double pitch,
  );
  
  /// Set pan for a music (0.5 is center)
  void SetMusicPan(
    MusicD music,
    double pan,
  );
  
  /// Get music time length (in seconds)
  double GetMusicTimeLength(
    MusicD music,
  );
  
  /// Get current music time played (in seconds)
  double GetMusicTimePlayed(
    MusicD music,
  );
  
  /// Load audio stream (to stream raw audio pcm data)
  AudioStreamD LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels
  );
  
  /// Checks if an audio stream is valid (buffers initialized)
  bool IsAudioStreamValid(
    AudioStreamD stream,
  );
  
  /// Unload audio stream and free memory
  void UnloadAudioStream(
    AudioStreamD stream,
  );
  
  /// Update audio stream buffers with data
  void UpdateAudioStream(
    AudioStreamD stream,
    MemoryPointer<RVoid> data,
    int frameCount,
  );
  
  /// Check if any audio stream buffers requires refill
  bool IsAudioStreamProcessed(
    AudioStreamD stream,
  );
  
  /// Play audio stream
  void PlayAudioStream(
    AudioStreamD stream,
  );
  
  /// Pause audio stream
  void PauseAudioStream(
    AudioStreamD stream,
  );
  
  /// Resume audio stream
  void ResumeAudioStream(
    AudioStreamD stream,
  );
  
  /// Check if audio stream is playing
  bool IsAudioStreamPlaying(
    AudioStreamD stream,
  );
  
  /// Stop audio stream
  void StopAudioStream(
    AudioStreamD stream,
  );
  
  /// Set volume for audio stream (1.0 is max level)
  void SetAudioStreamVolume(
    AudioStreamD stream,
    double volume,
  );
  
  /// Set pitch for audio stream (1.0 is base level)
  void SetAudioStreamPitch(
    AudioStreamD stream,
    double pitch,
  );
  
  /// Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)
  void SetAudioStreamPan(
    AudioStreamD stream,
    double pan,
  );
  
  /// Default size for new audio streams
  void SetAudioStreamBufferSizeDefault(
    int size,
  );
  
  /// Audio thread callback to request new data
  void SetAudioStreamCallback(
    AudioStreamD stream,
    MemoryPointer<RFunction<AudioCallbackBase>> callback,
  );
  
  /// Attach audio stream processor to stream, receives the samples as 'float'
  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    MemoryPointer<RFunction<AudioCallbackBase>> processor,
  );
  
  /// Detach audio stream processor from stream
  void DetachAudioStreamProcessor(
    AudioStreamD stream,
    MemoryPointer<RFunction<AudioCallbackBase>> processor,
  );
  
  /// Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
  void AttachAudioMixedProcessor(
    MemoryPointer<RFunction<AudioCallbackBase>> processor,
  );
  
  /// Detach audio stream processor from the entire audio pipeline
  void DetachAudioMixedProcessor(
    MemoryPointer<RFunction<AudioCallbackBase>> processor,
  );
}