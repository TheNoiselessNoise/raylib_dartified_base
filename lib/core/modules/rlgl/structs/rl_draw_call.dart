part of '../../../raylib_dartified_base.dart';

enum RlDrawCallField with StructFields {
  mode,
  vertexCount,
  vertexAlignment,
  textureId,
}

/// RLGL Draw call
class RlDrawCallD extends RaylibStruct<RlDrawCallD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<RlDrawCallField> structLayout = .aligned({
    .mode:            RInt32(),
    .vertexCount:     RInt32(),
    .vertexAlignment: RInt32(),
    .textureId:       RUint32(),
  });

  static StructPointer<RlDrawCallD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RlDrawCallD.new, RlDrawCallD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  RlDrawMode _mode;
  /// Drawing mode
  RlDrawMode get mode {
    structOnOp((p) => _mode = .fromValue(p.readInt32(structLayout.offset(.mode))));
    return _mode;
  }
  set mode(RlDrawMode value) {
    _mode = value;
    structOnOp((p) => p.writeInt32(value.value, structLayout.offset(.mode)));
  }
  
  int _vertexCount;
  /// Number of vertex of the draw
  int get vertexCount {
    structOnOp((p) => _vertexCount = p.readInt32(structLayout.offset(.vertexCount)));
    return _vertexCount;
  }
  set vertexCount(int value) {
    _vertexCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.vertexCount)));
  }
  
  int _vertexAlignment;
  /// Number of vertex required for index alignment (LINES, TRIANGLES)
  int get vertexAlignment {
    structOnOp((p) => _vertexAlignment = p.readInt32(structLayout.offset(.vertexAlignment)));
    return _vertexAlignment;
  }
  set vertexAlignment(int value) {
    _vertexAlignment = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.vertexAlignment)));
  }
  
  int _textureId;
  /// Texture id to be used on the draw. Use to create new draw call if changes.
  int get textureId {
    structOnOp((p) => _textureId = p.readUint32(structLayout.offset(.textureId)));
    return _textureId;
  }
  set textureId(int value) {
    _textureId = value;
    structOnOp((p) => p.writeUint32(value, structLayout.offset(.textureId)));
  }

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
  RlDrawCallD setD(RlDrawCallD o) {
    mode = o.mode;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeInt32(_mode.value, structLayout.offset(.mode));
    p.writeInt32(_vertexCount, structLayout.offset(.vertexCount));
    p.writeInt32(_vertexAlignment, structLayout.offset(.vertexAlignment));
    p.writeUint32(_textureId, structLayout.offset(.textureId));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _mode = .fromValue(p.readInt32(structLayout.offset(.mode)));
    _vertexCount = p.readInt32(structLayout.offset(.vertexCount));
    _vertexAlignment = p.readInt32(structLayout.offset(.vertexAlignment));
    _textureId = p.readUint32(structLayout.offset(.textureId));
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