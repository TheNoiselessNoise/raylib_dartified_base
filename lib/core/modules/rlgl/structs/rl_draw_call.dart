part of '../../../raylib_dartified_base.dart';

enum RlDrawCallField with StructFields {
  mode,
  vertexCount,
  vertexAlignment,
  textureId,
}

/// Draw call type
class RlDrawCallD extends RaylibStruct<RlDrawCallD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<RlDrawCallField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RlDrawCallField> struct = .aligned({
    .mode:            RInt(), // Drawing mode: LINES, TRIANGLES, QUADS
    .vertexCount:     RInt(), // Number of vertex of the draw
    .vertexAlignment: RInt(), // Number of vertex required for index alignment (LINES, TRIANGLES)
    .textureId:       RUnsignedInt(), // Texture id to be used on the draw -> Use to create new draw call if changes
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RlDrawCallD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, RlDrawCallD.new, RlDrawCallD.pointer);

  static final _modeF = struct.enumValue(.mode, RlDrawMode.fromValue);
  static final _vertexCountF = struct.scalar<int, RInt>(.vertexCount);
  static final _vertexAlignmentF = struct.scalar<int, RInt>(.vertexAlignment);
  static final _textureIdF = struct.scalar<int, RUnsignedInt>(.textureId);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  RlDrawMode _mode;
  /// Drawing mode: LINES, TRIANGLES, QUADS
  RlDrawMode get mode => _mode = _modeF.readOr(op?.ptr, _mode);
  set mode(RlDrawMode value) => _mode = _modeF.writeIf(op?.ptr, value);

  int _vertexCount;
  /// Number of vertex of the draw
  int get vertexCount => _vertexCount = _vertexCountF.readOr(op?.ptr, _vertexCount);
  set vertexCount(int value) => _vertexCount = _vertexCountF.writeIf(op?.ptr, value);

  int _vertexAlignment;
  /// Number of vertex required for index alignment (LINES, TRIANGLES)
  int get vertexAlignment => _vertexAlignment = _vertexAlignmentF.readOr(op?.ptr, _vertexAlignment);
  set vertexAlignment(int value) => _vertexAlignment = _vertexAlignmentF.writeIf(op?.ptr, value);

  int _textureId;
  /// Texture id to be used on the draw -> Use to create new draw call if changes
  int get textureId => _textureId = _textureIdF.readOr(op?.ptr, _textureId);
  set textureId(int value) => _textureId = _textureIdF.writeIf(op?.ptr, value);
  
  RlDrawCallD({
    super.op,
    RlDrawMode mode = .RL_NONE,
    int vertexCount = 0,
    int vertexAlignment = 0,
    int textureId = 0,
  }) :
    _mode = mode,
    _vertexCount = vertexCount,
    _vertexAlignment = vertexAlignment,
    _textureId = textureId;

  factory RlDrawCallD.zero() => .new();

  @override
  RlDrawCallD setDart(RlDrawCallD o) {
    mode = o.mode;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _modeF.write(p, _mode);
    _vertexCountF.write(p, _vertexCount);
    _vertexAlignmentF.write(p, _vertexAlignment);
    _textureIdF.write(p, _textureId);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _mode = _modeF.read(p);
    _vertexCount = _vertexCountF.read(p);
    _vertexAlignment = _vertexAlignmentF.read(p);
    _textureId = _textureIdF.read(p);
  }

  @override
  RlDrawCallD clone() => .new(
    op: op,
    mode: mode,
    vertexCount: vertexCount,
    vertexAlignment: vertexAlignment,
    textureId: textureId,
  );

  @override
  String signature() => '$structName(mode: $mode, vertexCount: $vertexCount, textureId: $textureId)';
}