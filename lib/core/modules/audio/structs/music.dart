part of '../../../raylib_dartified_base.dart';

enum MusicField with StructFields {
  stream,
  frameCount,
  looping,
  ctxType,
  ctxData,
}

/// Music, audio stream, anything longer than ~10 seconds should be streamed
class MusicD extends RaylibStruct<MusicD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<MusicField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<MusicField> struct = .aligned({
    .stream:     RStruct(AudioStreamD.struct), // Audio stream
    .frameCount: RUnsignedInt(), // Total number of frames (considering channels)
    .looping:    RBool(), // Music looping enable
    .ctxType:    RInt(), // Type of music context (audio filetype)
    .ctxData:    RPointer(RVoid()), // Audio context data, depends on type
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MusicD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MusicD.new, MusicD.pointer);

  static final field_stream = struct.struct(.stream, AudioStreamD.pointer);
  static final field_frameCount = struct.scalar<int, RUnsignedInt>(.frameCount);
  static final field_looping = struct.scalar<bool, RBool>(.looping);
  static final field_ctxType = struct.enumValue(.ctxType, MusicContextType.fromValue);
  static final field_ctxData = struct.pointerUnknown<RVoid>(.ctxData);

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
  set stream(AudioStreamD value) => _stream = field_stream.writeIf(op, value);
  
  int _frameCount;
  /// Total number of frames (considering channels)
  int get frameCount => _frameCount = field_frameCount.readOr(op, _frameCount);
  set frameCount(int value) => _frameCount = field_frameCount.writeIf(op, value);

  bool _looping;
  /// Music looping enable
  bool get looping => _looping = field_looping.readOr(op, _looping);
  set looping(bool value) => _looping = field_looping.writeIf(op, value);

  MusicContextType _ctxType;
  /// Type of music context (audio filetype)
  MusicContextType get ctxType => _ctxType = field_ctxType.readOr(op, _ctxType);
  set ctxType(MusicContextType value) => _ctxType = field_ctxType.writeIf(op, value);

  /// Audio context data, depends on type
  /// 
  /// `void *ctxData;`
  late final LivePointerSync<RVoid> _ctxData = field_ctxData.live(() => op);
  MemoryPointer<RVoid> get ctxData => _ctxData.derefPtr();

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
  MusicD setDart(MusicD o)
    => throw UnsupportedError('$runtimeType cannot support `setDart` method.');

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_ctxData.allocate(temp, p, '${key}_ctxData');
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_stream.write(p, _stream);
    field_frameCount.write(p, _frameCount);
    field_looping.write(p, _looping);
    field_ctxType.write(p, _ctxType);
    _ctxData.syncInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _stream = field_stream.read(p);
    _frameCount = field_frameCount.read(p);
    _looping = field_looping.read(p);
    _ctxType = field_ctxType.read(p);
    _ctxData.syncFrom(p);
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