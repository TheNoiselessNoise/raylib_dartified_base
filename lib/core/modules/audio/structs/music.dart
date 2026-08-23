part of '../../../raylib_dartified_base.dart';

enum MusicField {
  stream,
  frameCount,
  looping,
  ctxType,
  ctxData,
}

/// Audio stream, anything longer than ~10 seconds should be streamed.
class MusicD extends RaylibStruct<MusicD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<MusicField> structLayout = .aligned(structFields);
  static final Map<MusicField, RType> structFields = {
    .stream:     RStruct(AudioStreamD.structLayout),
    .frameCount: RUint32(),
    .looping:    RBool(),
    .ctxType:    RInt32(),
    .ctxData:    RPointer<RVoid>(),
  };

  static StructPointer<MusicD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, MusicD.new);

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
  
  /// Music looping enable
  bool looping;
  
  /// Type of music context (audio filetype)
  MusicContextType ctxType;

  // void *ctxData;
  // Audio context data, depends on type
  MemoryPointer<RVoid> _ctxDataPtr = MemoryPointer.nullptr;

  MusicD({
    super.op,
    AudioStreamD? stream,
    this.frameCount = 0,
    this.looping = false,
    this.ctxType = .MUSIC_AUDIO_NONE,
  }) :
    stream = stream ?? .zero();

  factory MusicD.zero() => .new();

  @override
  MusicD setD(MusicD o) {
    stream.setD(o.stream);
    frameCount = o.frameCount;
    looping = o.looping;
    ctxType = o.ctxType;
    return this;
  }

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    stream.writeInto(p.offsetBy(structLayout.offset(.stream)));
    p.writeUint32(frameCount, structLayout.offset(.frameCount));
    p.writeBool(looping, structLayout.offset(.looping));
    p.writeInt32(ctxType.value, structLayout.offset(.ctxType));
    p.writePtr(_ctxDataPtr, structLayout.offset(.ctxData));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    stream.readFrom(p.offsetBy(structLayout.offset(.stream)));
    frameCount = p.readUint32(structLayout.offset(.frameCount));
    looping = p.readBool(structLayout.offset(.looping));
    ctxType = .fromValue(p.readInt32(structLayout.offset(.ctxType)));
    _ctxDataPtr = p.readPtr(structLayout.offset(.ctxData));
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