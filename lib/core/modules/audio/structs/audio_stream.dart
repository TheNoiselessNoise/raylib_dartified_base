part of '../../../raylib_dartified_base.dart';

enum AudioStreamField with StructFields {
  buffer,
  processor,
  sampleRate,
  sampleSize,
  channels,
}

// TODO: translate

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
  static final StructLayout<AudioStreamField> struct = .aligned({
    .buffer:     RPointer(ROpaque()), // Pointer to internal data used by the audio system
    .processor:  RPointer(ROpaque()), // Pointer to internal data processor, useful for audio effects
    .sampleRate: RUnsignedInt(), // Frequency (samples per second)
    .sampleSize: RUnsignedInt(), // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    .channels:   RUnsignedInt(), // Number of channels (1-mono, 2-stereo, ...)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<AudioStreamD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, AudioStreamD.new, AudioStreamD.pointer);

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
    structOnOp((p) => _sampleRate = p.readUnsignedInt(struct.offset(.sampleRate)));
    return _sampleRate;
  }
  set sampleRate(int value) {
    _sampleRate = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.sampleRate)));
  }
  
  int _sampleSize;
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  int get sampleSize {
    structOnOp((p) => _sampleSize = p.readUnsignedInt(struct.offset(.sampleSize)));
    return _sampleSize;
  }
  set sampleSize(int value) {
    _sampleSize = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.sampleSize)));
  }
  
  int _channels;
  /// Number of channels (1-mono, 2-stereo, ...)
  int get channels {
    structOnOp((p) => _channels = p.readUnsignedInt(struct.offset(.channels)));
    return _channels;
  }
  set channels(int value) {
    _channels = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.channels)));
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
  AudioStreamD setDart(AudioStreamD o) {
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writePtr(buffer, struct.offset(.buffer));
    p.writePtr(processor, struct.offset(.processor));
    p.writeUnsignedInt(_sampleRate, struct.offset(.sampleRate));
    p.writeUnsignedInt(_sampleSize, struct.offset(.sampleSize));
    p.writeUnsignedInt(_channels, struct.offset(.channels));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    buffer = p.readPtr(struct.offset(.buffer));
    processor = p.readPtr(struct.offset(.processor));
    _sampleRate = p.readUnsignedInt(struct.offset(.sampleRate));
    _sampleSize = p.readUnsignedInt(struct.offset(.sampleSize));
    _channels = p.readUnsignedInt(struct.offset(.channels));
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