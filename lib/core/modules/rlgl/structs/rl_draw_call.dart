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

  static final field_mode = struct.enumValue(.mode, RlDrawMode.fromValue);
  static final field_vertexCount = struct.scalar<int, RInt>(.vertexCount);
  static final field_vertexAlignment = struct.scalar<int, RInt>(.vertexAlignment);
  static final field_textureId = struct.scalar<int, RUnsignedInt>(.textureId);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  RlDrawMode _mode;
  /// Drawing mode: LINES, TRIANGLES, QUADS
  RlDrawMode get mode => _mode = field_mode.readOr(op, _mode);
  set mode(RlDrawMode value) => _mode = field_mode.writeIf(op, value);

  int _vertexCount;
  /// Number of vertex of the draw
  int get vertexCount => _vertexCount = field_vertexCount.readOr(op, _vertexCount);
  set vertexCount(int value) => _vertexCount = field_vertexCount.writeIf(op, value);

  int _vertexAlignment;
  /// Number of vertex required for index alignment (LINES, TRIANGLES)
  int get vertexAlignment => _vertexAlignment = field_vertexAlignment.readOr(op, _vertexAlignment);
  set vertexAlignment(int value) => _vertexAlignment = field_vertexAlignment.writeIf(op, value);

  int _textureId;
  /// Texture id to be used on the draw -> Use to create new draw call if changes
  int get textureId => _textureId = field_textureId.readOr(op, _textureId);
  set textureId(int value) => _textureId = field_textureId.writeIf(op, value);
  
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
    field_mode.write(p, _mode);
    field_vertexCount.write(p, _vertexCount);
    field_vertexAlignment.write(p, _vertexAlignment);
    field_textureId.write(p, _textureId);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _mode = field_mode.read(p);
    _vertexCount = field_vertexCount.read(p);
    _vertexAlignment = field_vertexAlignment.read(p);
    _textureId = field_textureId.read(p);
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