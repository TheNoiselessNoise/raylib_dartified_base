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

  @override
  StructLayout<SoundField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<SoundField> struct = .aligned({
    .stream:     RStruct(AudioStreamD.struct), // Audio stream
    .frameCount: RUnsignedInt(), // Total number of frames (considering channels)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<SoundD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, SoundD.new, SoundD.pointer);

  static final _streamF = struct.struct(.stream, AudioStreamD.pointer);
  static final _frameCountF = struct.scalar<int, RUnsignedInt>(.frameCount);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  AudioStreamD _stream;
  /// Audio stream
  AudioStreamD get stream => _stream = _streamF.readOr(op, _stream);
  set stream(AudioStreamD value) => _stream = _streamF.writeIf(op, value);
  
  int _frameCount;
  /// Total number of frames (considering channels)
  int get frameCount => _frameCount = _frameCountF.readOr(op, _frameCount);
  set frameCount(int value) => _frameCount = _frameCountF.writeIf(op, value);

  SoundD({
    super.op,
    AudioStreamD? stream,
    int frameCount = 0,
  }) :
    _stream = stream ?? .zero(),
    _frameCount = frameCount;

  factory SoundD.zero() => .new();

  @override
  SoundD setDart(SoundD o) {
    stream.setDart(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _streamF.write(p, _stream);
    _frameCountF.write(p, _frameCount);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _stream = _streamF.read(p);
    _frameCount = _frameCountF.read(p);
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