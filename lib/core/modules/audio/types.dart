part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [AudioStreamBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Custom audio stream.
mixin AudioStreamBase<X extends AudioStreamBase<X>> on RaylibStructObjectBase<X> {
  // rAudioBuffer *buffer;       // Pointer to internal data used by the audio system
  // rAudioProcessor *processor; // Pointer to internal data processor, useful for audio effects
  
  /// Frequency (samples per second)
  abstract int sampleRate;
  
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  abstract int sampleSize;
  
  /// Number of channels (1-mono, 2-stereo, ...)
  abstract int channels;

  @override
  String signature() => '$structName(sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels)';
}

/// Backend-agnostic contract for [MusicBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Audio stream, anything longer than ~10 seconds should be streamed.
mixin MusicBase<
  X extends MusicBase<X, A>,
  A extends AudioStreamBase<A>
> on RaylibStructObjectBase<X> {

  /// Audio stream
  abstract A stream;

  /// Total number of frames (considering channels)
  abstract int frameCount;
  
  /// Music looping enable
  abstract bool looping;
  
  /// Type of music context (audio filetype)
  abstract MusicContextType ctxType;

  // void *ctxData; // Audio context data, depends on type

  @override
  String signature() => '$structName(stream: $stream, frameCount: $frameCount, looping: $looping, ctxType: $ctxType)';  
}

/// Backend-agnostic contract for [SoundBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin SoundBase<
  X extends SoundBase<X, A>,
  A extends AudioStreamBase<A>
> on RaylibStructObjectBase<X> {

  /// Audio stream
  abstract A stream;

  /// Total number of frames (considering channels)
  abstract int frameCount;

  @override
  String signature() => '$structName(stream: $stream, frameCount: $frameCount)';
}

/// Backend-agnostic contract for [WaveBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Audio wave data.
mixin WaveBase<X extends WaveBase<X>> on RaylibStructObjectBase<X> {
  
  /// Total number of frames (considering channels)
  abstract int frameCount;
  
  /// Frequency (samples per second)
  abstract int sampleRate;
  
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  abstract int sampleSize;
  
  /// Number of channels (1-mono, 2-stereo, ...)
  abstract int channels;
  
  /// Raw audio buffer data
  abstract ByteBuffer data;

  /// Computes the total number of samples for a wave with the given
  /// [frameCount] and [channels], i.e. `frameCount * channels`.
  ///
  /// Returns 0 if either argument is 0.
  static int BASE_waveLength(int frameCount, int channels) {
    if (frameCount == 0 || channels == 0) return 0;
    return frameCount * channels;
  }

  /// Total number of samples across all channels, derived from
  /// [frameCount] and [channels].
  int get waveLength => BASE_waveLength(frameCount, channels);

  /// Returns [data] as a typed list matching the current [sampleSize].
  ///
  /// - 8-bit  [Uint8List]
  /// - 16-bit [Int16List]
  /// - 32-bit [Float32List]
  ///
  /// Throws [UnsupportedError] if [sampleSize] is not one of the above.
  TypedDataList dataAsList() => switch (sampleSize) {
    8  => data.asUint8List(waveLength),
    16 => data.asInt16List(waveLength),
    32 => data.asFloat32List(waveLength),
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

  /// Total number of samples the [data] buffer can hold, derived from
  /// its byte length and [sampleSize].
  int get bufferLength => data.lengthInBytes ~/ (sampleSize ~/ 8);

  @override
  String signature() => '$structName(frameCount: $frameCount, sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels, waveLength: $waveLength)';
}