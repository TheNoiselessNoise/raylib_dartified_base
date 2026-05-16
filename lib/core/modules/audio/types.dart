part of '../../raylib_dartified_base.dart';

mixin AudioStreamBase {
  int get sampleRate;
  int get sampleSize;
  int get channels;
}

mixin MusicBase {
  AudioStreamBase get stream;
  int get frameCount;
  bool get looping;
  MusicContextType get ctxType;
}

mixin SoundBase {
  AudioStreamBase get stream;
  int get frameCount;
}

mixin WaveBase {
  int get frameCount;
  int get sampleRate;
  int get sampleSize;
  int get channels;
  List<int> get data;

  int get dataLength {
    if (frameCount == 0 || channels == 0) return 0;
    return frameCount * channels;
  }
}