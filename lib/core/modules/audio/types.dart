part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [AudioStreamBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin AudioStreamBase<X extends AudioStreamBase<X>> on RaylibStructObjectBase<X> {
  abstract int sampleRate;
  abstract int sampleSize;
  abstract int channels;

  @override
  String signature() => '$structName(sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels)';
}

/// Backend-agnostic contract for [MusicBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin MusicBase<
  X extends MusicBase<X, A>,
  A extends AudioStreamBase<A>
> on RaylibStructObjectBase<X> {

  abstract A stream;
  abstract int frameCount;
  abstract bool looping;
  abstract MusicContextType ctxType;

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

  abstract A stream;
  abstract int frameCount;

  @override
  String signature() => '$structName(stream: $stream, frameCount: $frameCount)';
}

/// Backend-agnostic contract for [WaveBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin WaveBase<X extends WaveBase<X>> on RaylibStructObjectBase<X> {
  abstract int frameCount;
  abstract int sampleRate;
  abstract int sampleSize;
  abstract int channels;
  abstract ByteBuffer data;

  static int BASE_waveLength(int frameCount, int channels) {
    if (frameCount == 0 || channels == 0) return 0;
    return frameCount * channels;
  }

  int get waveLength => BASE_waveLength(frameCount, channels);

  TypedDataList dataAsList() => switch (sampleSize) {
    8  => data.asUint8List(waveLength),
    16 => data.asInt16List(waveLength),
    32 => data.asFloat32List(waveLength),
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

  int get bufferLength => data.lengthInBytes ~/ (sampleSize ~/ 8);

  @override
  String signature() => '$structName(frameCount: $frameCount, sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels, waveLength: $waveLength)';
}