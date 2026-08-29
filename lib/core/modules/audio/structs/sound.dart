part of '../../../raylib_dartified_base.dart';

enum SoundField with StructFields {
  stream,
  frameCount,
}

/// Sound
class SoundD extends RaylibStruct<SoundD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<SoundField> structLayout = .aligned({
    .stream:     RStruct(AudioStreamD.structLayout),
    .frameCount: RUint32(),
  });

  static StructPointer<SoundD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, SoundD.new, SoundD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Audio stream
  AudioStreamD stream;
  
  /// Total number of frames (considering channels)
  int frameCount;

  SoundD({
    super.op,
    AudioStreamD? stream,
    this.frameCount = 0,
  }) :
    stream = stream ?? .zero();

  factory SoundD.zero() => .new();

  @override
  SoundD setD(SoundD o) {
    stream.setD(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    stream.structWriteInto(p.offsetBy(structLayout.offset(.stream)));
    p.writeUint32(frameCount, structLayout.offset(.frameCount));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    stream.structReadFrom(p.offsetBy(structLayout.offset(.stream)));
    frameCount = p.readUint32(structLayout.offset(.frameCount));
  }

  @override
  SoundD clone() => .new(
    op: op,
    stream: stream.clone(),
    frameCount: frameCount,
  );

  @override
  String signature() => '$structName(stream: $stream, frameCount: $frameCount)';
}