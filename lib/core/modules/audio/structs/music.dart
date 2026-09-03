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

  static final _streamF = struct.struct(.stream, AudioStreamD.pointer);
  static final _frameCountF = struct.scalar<int, RUnsignedInt>(.frameCount);
  static final _loopingF = struct.scalar<bool, RBool>(.looping);
  static final _ctxTypeF = struct.enumValue(.ctxType, MusicContextType.fromValue);
  static final _ctxDataF = struct.pointerUnknown<RVoid>(.ctxData);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  AudioStreamD _stream;
  /// Audio stream
  AudioStreamD get stream => _stream = _streamF.readOr(op?.ptr, _stream);
  set stream(AudioStreamD value) => _stream = _streamF.writeIf(op?.ptr, value);
  
  int _frameCount;
  /// Total number of frames (considering channels)
  int get frameCount => _frameCount = _frameCountF.readOr(op?.ptr, _frameCount);
  set frameCount(int value) => _frameCount = _frameCountF.writeIf(op?.ptr, value);

  bool _looping;
  /// Music looping enable
  bool get looping => _looping = _loopingF.readOr(op?.ptr, _looping);
  set looping(bool value) => _looping = _loopingF.writeIf(op?.ptr, value);

  MusicContextType _ctxType;
  /// Type of music context (audio filetype)
  MusicContextType get ctxType => _ctxType = _ctxTypeF.readOr(op?.ptr, _ctxType);
  set ctxType(MusicContextType value) => _ctxType = _ctxTypeF.writeIf(op?.ptr, value);

  /// Audio context data, depends on type
  /// 
  /// `void *ctxData;`
  late final LivePointerSync<RVoid> _ctxData = _ctxDataF.live(() => op?.ptr);
  MemoryPointer<RVoid> get ctxData => _ctxData.fieldPtr();

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
    _ctxDataF.allocate(temp, p, '${key}_ctxData');
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _streamF.write(p, _stream);
    _frameCountF.write(p, _frameCount);
    _loopingF.write(p, _looping);
    _ctxTypeF.write(p, _ctxType);
    _ctxData.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _stream = _streamF.read(p);
    _frameCount = _frameCountF.read(p);
    _looping = _loopingF.read(p);
    _ctxType = _ctxTypeF.read(p);
    _ctxData.readFrom(p, borrow: true);
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