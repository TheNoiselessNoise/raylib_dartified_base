part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Audio module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full Core API surface across different backends.
abstract class RaylibAudioModuleBase<
  R extends RaylibBase,

  // types
  AudioStreamStructType extends AudioStreamBase<AudioStreamStructType>,
  MusicStructType extends MusicBase<
    MusicStructType,
    AudioStreamStructType
  >,
  SoundStructType extends SoundBase<
    SoundStructType,
    AudioStreamStructType
  >,
  WaveStructType extends WaveBase<WaveStructType>,

  // callbacks
  AudioCallbackType extends AudioCallbackBase
  
> extends RaylibModule<R> {

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibAudioModuleDebugLabels();

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = RaylibAudioModuleCaptureIds();

  RaylibAudioModuleBase(super.rl);

  /// Initialize audio device and context
  void InitAudioDevice();

  /// Close the audio device and context
  void CloseAudioDevice();
  
  /// Check if audio device has been initialized successfully
  bool IsAudioDeviceReady();

  /// Set master volume (listener)
  void SetMasterVolume(
    num volume,
  );

  /// Get master volume (listener)
  double GetMasterVolume();

  /// Load wave data from file
  WaveStructType LoadWave(
    String fileName,
  );

  /// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  WaveStructType LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  );

  /// Checks if wave data is valid (data loaded and parameters)
  bool IsWaveValid(
    WaveStructType wave,
  );

  /// Load sound from file
  SoundStructType LoadSound(
    String fileName,
  );

  /// Load sound from wave data
  SoundStructType LoadSoundFromWave(
    WaveStructType wave,
  );

  /// Create a new sound that shares the same sample data as the source sound, does not own the sound data
  SoundStructType LoadSoundAlias(
    SoundStructType source,
  );

  /// Checks if a sound is valid (data loaded and buffers initialized)
  bool IsSoundValid(
    SoundStructType sound,
  );

  /// Update sound buffer with new data
  void UpdateSound(
    SoundStructType sound,
    TypedDataList data,
    num sampleCount,
  );

  /// Unload wave data
  void UnloadWave(
    WaveStructType wave,
  );

  /// Unload sound
  void UnloadSound(
    SoundStructType sound,
  );

  /// Unload a sound alias (does not deallocate sample data)
  void UnloadSoundAlias(
    SoundStructType alias,
  );

  /// Export wave data to file, returns true on success
  bool ExportWave(
    WaveStructType wave,
    String fileName,
  );

  /// Export wave sample data to code (.h), returns true on success
  bool ExportWaveAsCode(
    WaveStructType wave,
    String fileName,
  );

  /// Play a sound
  void PlaySound(
    SoundStructType sound,
  );

  /// Stop playing a sound
  void StopSound(
    SoundStructType sound,
  );

  /// Pause a sound
  void PauseSound(
    SoundStructType sound,
  );

  /// Resume a paused sound
  void ResumeSound(
    SoundStructType sound,
  );

  /// Check if a sound is currently playing
  bool IsSoundPlaying(
    SoundStructType sound,
  );

  /// Set volume for a sound (1.0 is max level)
  void SetSoundVolume(
    SoundStructType sound,
    num volume,
  );

  /// Set pitch for a sound (1.0 is base level)
  void SetSoundPitch(
    SoundStructType sound,
    num pitch,
  );

  /// Set pan for a sound (0.5 is center)
  void SetSoundPan(
    SoundStructType sound,
    num pan,
  );

  /// Copy a wave to a new wave
  WaveStructType WaveCopy(
    WaveStructType wave,
  );

  /// Crop a wave to defined frames range
  void WaveCrop(
    WaveStructType wave,
    num initFrame,
    num finalFrame,
  );

  /// Convert wave data to desired format
  void WaveFormat(
    WaveStructType wave,
    num sampleRate,
    num sampleSize,
    num channels,
  );

  /// Load samples data from wave as a 32bit float data array
  List<double> LoadWaveSamples(
    WaveStructType wave
  );

  /// Load music stream from file
  MusicStructType LoadMusicStream(
    String fileName,
  );

  /// Load music stream from data
  MusicStructType LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  );

  /// Checks if a music stream is valid (context and buffers initialized)
  bool IsMusicValid(
    MusicStructType music,
  );

  /// Unload music stream
  void UnloadMusicStream(
    MusicStructType music,
  );

  /// Start music playing
  void PlayMusicStream(
    MusicStructType music,
  );

  /// Check if music is playing
  bool IsMusicStreamPlaying(
    MusicStructType music,
  );

  /// Updates buffers for music streaming
  void UpdateMusicStream(
    MusicStructType music,
  );

  /// Stop music playing
  void StopMusicStream(
    MusicStructType music,
  );

  /// Pause music playing
  void PauseMusicStream(
    MusicStructType music,
  );

  /// Resume playing paused music
  void ResumeMusicStream(
    MusicStructType music,
  );

  /// Seek music to a position (in seconds)
  void SeekMusicStream(
    MusicStructType music,
    num position,
  );

  /// Set volume for music (1.0 is max level)
  void SetMusicVolume(
    MusicStructType music,
    num volume,
  );

  /// Set pitch for a music (1.0 is base level)
  void SetMusicPitch(
    MusicStructType music,
    num pitch,
  );

  /// Set pan for a music (0.5 is center)
  void SetMusicPan(
    MusicStructType music,
    num pan,
  );

  /// Get music time length (in seconds)
  double GetMusicTimeLength(
    MusicStructType music,
  );

  /// Get current music time played (in seconds)
  double GetMusicTimePlayed(
    MusicStructType music,
  );

  /// Load audio stream (to stream raw audio pcm data)
  AudioStreamStructType LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  );

  /// Checks if an audio stream is valid (buffers initialized)
  bool IsAudioStreamValid(
    AudioStreamStructType stream,
  );

  /// Unload audio stream and free memory
  void UnloadAudioStream(
    AudioStreamStructType stream,
  );

  /// Update audio stream buffers with data
  void UpdateAudioStream(
    AudioStreamStructType stream,
    TypedDataList data,
  );

  /// Check if any audio stream buffers requires refill
  bool IsAudioStreamProcessed(
    AudioStreamStructType stream,
  );

  /// Play audio stream
  void PlayAudioStream(
    AudioStreamStructType stream,
  );

  /// Pause audio stream
  void PauseAudioStream(
    AudioStreamStructType stream,
  );

  /// Resume audio stream
  void ResumeAudioStream(
    AudioStreamStructType stream,
  );

  /// Check if audio stream is playing
  bool IsAudioStreamPlaying(
    AudioStreamStructType stream,
  );

  /// Stop audio stream
  void StopAudioStream(
    AudioStreamStructType stream,
  );

  /// Set volume for audio stream (1.0 is max level)
  void SetAudioStreamVolume(
    AudioStreamStructType stream,
    num volume,
  );

  /// Set pitch for audio stream (1.0 is base level)
  void SetAudioStreamPitch(
    AudioStreamStructType stream,
    num pitch,
  );

  /// Set pan for audio stream (0.5 is centered)
  void SetAudioStreamPan(
    AudioStreamStructType stream,
    num pan,
  );

  /// Default size for new audio streams
  void SetAudioStreamBufferSizeDefault(
    num size,
  );

  /// Audio thread callback to request new data
  void SetAudioStreamCallback(
    AudioStreamStructType stream,
    AudioCallbackType callback,
  );

  /// Attach audio stream processor to stream, receives the samples as 'float'
  void AttachAudioStreamProcessor(
    AudioStreamStructType stream,
    AudioCallbackType callback,
  );

  /// Detach audio stream processor from stream
  void DetachAudioStreamProcessor(
    AudioStreamStructType stream,
    AudioCallbackType callback,
    {bool keepAlive = false}
  );

  /// Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
  void AttachAudioMixedProcessor(
    AudioCallbackType callback,
  );

  /// Detach audio stream processor from the entire audio pipeline
  void DetachAudioMixedProcessor(
    AudioCallbackType callback,
    {bool keepAlive = false}
  );
}