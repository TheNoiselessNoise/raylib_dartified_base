part of '../../../raylib_dartified_base.dart';

enum MusicField with StructFields {
  stream,
  frameCount,
  looping,
  ctxType,
  ctxData,
}

// TODO: translate

/// Music, audio stream, anything longer than ~10 seconds should be streamed
class MusicD extends RaylibStruct<MusicD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<MusicField> struct = .aligned({
    .stream:     RStruct(AudioStreamD.struct), // Audio stream
    .frameCount: RUnsignedInt(), // Total number of frames (considering channels)
    .looping:    RBool(), // Music looping enable
    .ctxType:    RInt32(), // Type of music context (audio filetype)
    .ctxData:    RPointer(RVoid()), // Audio context data, depends on type
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MusicD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MusicD.new, MusicD.pointer);

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

  bool _looping;
  /// Music looping enable
  bool get looping {
    structOnOp((p) => _looping = p.readBool(struct.offset(.looping)));
    return _looping;
  }
  set looping(bool value) {
    _looping = value;
    structOnOp((p) => p.writeBool(value, struct.offset(.looping)));
  }

  MusicContextType _ctxType;
  /// Type of music context (audio filetype)
  MusicContextType get ctxType {
    structOnOp((p) => _ctxType = .fromValue(p.readInt32(struct.offset(.ctxType))));
    return _ctxType;
  }
  set ctxType(MusicContextType value) {
    _ctxType = value;
    structOnOp((p) => p.writeInt32(value.value, struct.offset(.ctxType)));
  }
  
  /// Audio context data, depends on type
  /// 
  /// `void *ctxData;`
  MemoryPointer<RVoid> ctxData = MemoryPointer.nullptr;

  MusicD({
    super.op,
    AudioStreamD? stream,
    int frameCount = 0,
    bool looping = false,
    MusicContextType ctxType = .MUSIC_AUDIO_NONE,
  }) :
    _stream = stream ?? .zero(),
    _frameCount = frameCount,
    _looping = looping,
    _ctxType = ctxType;

  factory MusicD.zero() => .new();

  @override
  MusicD setDart(MusicD o) {
    stream.setDart(o.stream);
    frameCount = o.frameCount;
    looping = o.looping;
    ctxType = o.ctxType;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _stream.structWriteInto(p.offsetBy(struct.offset(.stream)));
    p.writeUnsignedInt(_frameCount, struct.offset(.frameCount));
    p.writeBool(_looping, struct.offset(.looping));
    p.writeInt32(_ctxType.value, struct.offset(.ctxType));
    p.writePtr(ctxData, struct.offset(.ctxData));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _stream.structReadFrom(p.offsetBy(struct.offset(.stream)));
    _frameCount = p.readUnsignedInt(struct.offset(.frameCount));
    _looping = p.readBool(struct.offset(.looping));
    _ctxType = .fromValue(p.readInt32(struct.offset(.ctxType)));
    ctxData = p.readPtr(struct.offset(.ctxData));
  }

  @override
  MusicD clone() => .new(
    op: op,
    stream: stream.clone(),
    frameCount: frameCount,
    looping: looping,
    ctxType: ctxType,
  );

  @override
  String signature() => '$structName(stream: $stream, frameCount: $frameCount, looping: $looping, ctxType: $ctxType)';  
}