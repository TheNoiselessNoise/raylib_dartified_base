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

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<SoundField> struct = .aligned({
    .stream:     RStruct(AudioStreamD.struct), // Audio stream
    .frameCount: RUnsignedInt(), // Total number of frames (considering channels)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<SoundD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, SoundD.new, SoundD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  AudioStreamD _stream;
  /// Audio stream
  AudioStreamD get stream {
    structOnOp((p) => _stream.structReadFrom(p.offsetBy(struct.offset(.stream))));
    return _stream;
  }
  set stream(AudioStreamD value) {
    _stream = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(struct.offset(.stream))));
  }
  
  int _frameCount;
  /// Total number of frames (considering channels)
  int get frameCount {
    structOnOp((p) => _frameCount = p.readUnsignedInt(struct.offset(.frameCount)));
    return _frameCount;
  }
  set frameCount(int value) {
    _frameCount = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.frameCount)));
  }

  SoundD({
    super.op,
    AudioStreamD? stream,
    int frameCount = 0,
  }) :
    _stream = stream ?? .zero(),
    _frameCount = frameCount;

  factory SoundD.zero() => .new();

  @override
  SoundD setD(SoundD o) {
    stream.setD(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _stream.structWriteInto(p.offsetBy(struct.offset(.stream)));
    p.writeUnsignedInt(_frameCount, struct.offset(.frameCount));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _stream.structReadFrom(p.offsetBy(struct.offset(.stream)));
    _frameCount = p.readUnsignedInt(struct.offset(.frameCount));
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