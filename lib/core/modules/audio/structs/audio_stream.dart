part of '../../../raylib_dartified_base.dart';

enum AudioStreamField with StructFields {
  buffer,
  processor,
  sampleRate,
  sampleSize,
  channels,
}

/// AudioStream, custom audio stream
class AudioStreamD extends RaylibStruct<AudioStreamD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<AudioStreamField> structLayout = .aligned({
    .buffer:     RPointer<ROpaque>(), // Pointer to internal data used by the audio system
    .processor:  RPointer<ROpaque>(), // Pointer to internal data processor, useful for audio effects
    .sampleRate: RUnsignedInt(), // Frequency (samples per second)
    .sampleSize: RUnsignedInt(), // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    .channels:   RUnsignedInt(), // Number of channels (1-mono, 2-stereo, ...)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<AudioStreamD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, AudioStreamD.new, AudioStreamD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Pointer to internal data used by the audio system
  /// 
  /// `rAudioBuffer *buffer;`
  MemoryPointer<ROpaque> buffer = MemoryPointer.nullptr.cast();

  /// Pointer to internal data processor, useful for audio effects
  /// 
  /// `rAudioProcessor *processor;`
  MemoryPointer<ROpaque> processor = MemoryPointer.nullptr.cast();

  int _sampleRate;
  /// Frequency (samples per second)
  int get sampleRate {
    structOnOp((p) => _sampleRate = p.readUnsignedInt(structLayout.offset(.sampleRate)));
    return _sampleRate;
  }
  set sampleRate(int value) {
    _sampleRate = value;
    structOnOp((p) => p.writeUnsignedInt(value, structLayout.offset(.sampleRate)));
  }
  
  int _sampleSize;
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  int get sampleSize {
    structOnOp((p) => _sampleSize = p.readUnsignedInt(structLayout.offset(.sampleSize)));
    return _sampleSize;
  }
  set sampleSize(int value) {
    _sampleSize = value;
    structOnOp((p) => p.writeUnsignedInt(value, structLayout.offset(.sampleSize)));
  }
  
  int _channels;
  /// Number of channels (1-mono, 2-stereo, ...)
  int get channels {
    structOnOp((p) => _channels = p.readUnsignedInt(structLayout.offset(.channels)));
    return _channels;
  }
  set channels(int value) {
    _channels = value;
    structOnOp((p) => p.writeUnsignedInt(value, structLayout.offset(.channels)));
  }

  AudioStreamD({
    super.op,
    int sampleRate = 0,
    int sampleSize = 0,
    int channels = 0,
  }) :
    _sampleRate = sampleRate,
    _sampleSize = sampleSize,
    _channels = channels;

  factory AudioStreamD.zero() => .new();

  @override
  AudioStreamD setD(AudioStreamD o) {
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writePtr(buffer, structLayout.offset(.buffer));
    p.writePtr(processor, structLayout.offset(.processor));
    p.writeUnsignedInt(_sampleRate, structLayout.offset(.sampleRate));
    p.writeUnsignedInt(_sampleSize, structLayout.offset(.sampleSize));
    p.writeUnsignedInt(_channels, structLayout.offset(.channels));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    buffer = p.readPtr(structLayout.offset(.buffer));
    processor = p.readPtr(structLayout.offset(.processor));
    _sampleRate = p.readUnsignedInt(structLayout.offset(.sampleRate));
    _sampleSize = p.readUnsignedInt(structLayout.offset(.sampleSize));
    _channels = p.readUnsignedInt(structLayout.offset(.channels));
  }

  @override
  AudioStreamD clone() => .new(
    op: op,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
  );

  @override
  String signature() => '$structName(sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels)';
}