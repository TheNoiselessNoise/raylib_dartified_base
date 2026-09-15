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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<SoundD> struct = .new(
    factory: SoundD.new,
    layout: .aligned<SoundField>({
      .stream:     RStruct(AudioStreamD.struct), // Audio stream
      .frameCount: RUnsignedInt(), // Total number of frames (considering channels)
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<SoundField> structLayout = struct.layoutOf();

  /// Field descriptor for [stream].
  static final field_stream = structLayout.struct<AudioStreamD>(.stream);
  /// Field descriptor for [frameCount].
  static final field_frameCount = structLayout.scalar<int, RUnsignedInt>(.frameCount);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  AudioStreamD _stream;
  /// Audio stream
  AudioStreamD get stream => _stream = field_stream.readOr(op, _stream);
  set stream(AudioStreamD value) => _stream = field_stream.writeOr(op, value);
  
  int _frameCount;
  /// Total number of frames (considering channels)
  int get frameCount => _frameCount = field_frameCount.readOr(op, _frameCount);
  set frameCount(int value) => _frameCount = field_frameCount.writeOr(op, value);

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
    field_stream.write(p, _stream);
    field_frameCount.write(p, _frameCount);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _stream = field_stream.read(p);
    _frameCount = field_frameCount.read(p);
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