part of '../../../raylib_dartified_base.dart';

enum AudioStreamField {
  buffer,
  processor,
  sampleRate,
  sampleSize,
  channels,
}

/// Custom audio stream.
class AudioStreamD extends RaylibStruct<AudioStreamD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<AudioStreamField> structLayout = .aligned(structFields);
  static final Map<AudioStreamField, RType> structFields = {
    .buffer:     RPointer<ROpaque>(),
    .processor:  RPointer<ROpaque>(),
    .sampleRate: RUint32(),
    .sampleSize: RUint32(),
    .channels:   RUint32(),
  };

  static StructPointer<AudioStreamD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, AudioStreamD.new, AudioStreamD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  // rAudioBuffer *buffer;
  // Pointer to internal data used by the audio system
  MemoryPointer<ROpaque> _bufferPtr = MemoryPointer.nullptr.cast();

  // rAudioProcessor *processor;
  // Pointer to internal data processor, useful for audio effects
  MemoryPointer<ROpaque> _processorPtr = MemoryPointer.nullptr.cast();

  /// Frequency (samples per second)
  int sampleRate;
  
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  int sampleSize;
  
  /// Number of channels (1-mono, 2-stereo, ...)
  int channels;

  AudioStreamD({
    super.op,
    this.sampleRate = 0,
    this.sampleSize = 0,
    this.channels = 0,
  });

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
    p.writePtr(_bufferPtr, structLayout.offset(.buffer));
    p.writePtr(_processorPtr, structLayout.offset(.processor));
    p.writeUint32(sampleRate, structLayout.offset(.sampleRate));
    p.writeUint32(sampleSize, structLayout.offset(.sampleSize));
    p.writeUint32(channels, structLayout.offset(.channels));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _bufferPtr = p.readPtr(structLayout.offset(.buffer));
    _processorPtr = p.readPtr(structLayout.offset(.processor));
    sampleRate = p.readUint32(structLayout.offset(.sampleRate));
    sampleSize = p.readUint32(structLayout.offset(.sampleSize));
    channels = p.readUint32(structLayout.offset(.channels));
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