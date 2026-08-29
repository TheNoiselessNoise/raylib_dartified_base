part of '../../../raylib_dartified_base.dart';

enum RlRenderBatchField with StructFields {
  bufferCount,
  currentBuffer,
  vertexBuffer,
  draws,
  drawCounter,
  currentDepth,
}

/// rlRenderBatch type
class RlRenderBatchD extends RaylibStruct<RlRenderBatchD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RlRenderBatchField> structLayout = .aligned({
    .bufferCount:   RInt(), // Number of vertex buffers (multi-buffering support)
    .currentBuffer: RInt(), // Current buffer tracking in case of multi-buffering
    .vertexBuffer:  RPointer<RStruct>(), // Dynamic buffer(s) for vertex data
    .draws:         RPointer<RStruct>(), // Draw calls array, depends on textureId
    .drawCounter:   RInt(), // Draw calls counter
    .currentDepth:  RFloat(), // Current depth value for next draw
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RlRenderBatchD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RlRenderBatchD.new, RlRenderBatchD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int _bufferCount;
  /// Number of vertex buffers (multi-buffering support)
  int get bufferCount {
    structOnOp((p) => _bufferCount = p.readInt(structLayout.offset(.bufferCount)));
    return _bufferCount;
  }
  set bufferCount(int value) {
    _bufferCount = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.bufferCount)));
  }
  
  int _currentBuffer;
  /// Current buffer tracking in case of multi-buffering
  int get currentBuffer {
    structOnOp((p) => _currentBuffer = p.readInt(structLayout.offset(.currentBuffer)));
    return _currentBuffer;
  }
  set currentBuffer(int value) {
    _currentBuffer = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.currentBuffer)));
  }
  
  late LiveListPointerStruct<RlVertexBufferD> _vertexBuffer;
  /// Dynamic buffer(s) for vertex data
  LiveListPointerStruct<RlVertexBufferD> get vertexBuffer {
    structOnOp((p) => _vertexBuffer.ptr = p.readPtr(structLayout.offset(.vertexBuffer)));
    return _vertexBuffer;
  }
  set vertexBuffer(List<RlVertexBufferD> value) {
    structOnOp((p) => _vertexBuffer.ptr = p.readPtr(structLayout.offset(.vertexBuffer)));
    _vertexBuffer.inner = value;
  }

  late LiveListPointerStruct<RlDrawCallD> _draws;
  /// Draw calls array, depends on textureId
  LiveListPointerStruct<RlDrawCallD> get draws {
    structOnOp((p) => _draws.ptr = p.readPtr(structLayout.offset(.draws)));
    return _draws;
  }
  set draws(List<RlDrawCallD> value) {
    structOnOp((p) => _draws.ptr = p.readPtr(structLayout.offset(.draws)));
    _draws.inner = value;
  }
  
  int _drawCounter;
  /// Draw calls counter
  int get drawCounter {
    structOnOp((p) => _drawCounter = p.readInt(structLayout.offset(.drawCounter)));
    return _drawCounter;
  }
  set drawCounter(int value) {
    _drawCounter = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.drawCounter)));
  }
  
  double _currentDepth;
  /// Current depth value for next draw
  double get currentDepth {
    structOnOp((p) => _currentDepth = p.readFloat(structLayout.offset(.currentDepth)));
    return _currentDepth;
  }
  set currentDepth(double value) {
    _currentDepth = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.currentDepth)));
  }

  RlRenderBatchD({
    super.op,
    int bufferCount = 0,
    int currentBuffer = 0,
    List<RlVertexBufferD>? vertexBuffer,
    List<RlDrawCallD>? draws,
    int drawCounter = 0,
    double currentDepth = 0,
  }) :
    _bufferCount = bufferCount,
    _currentBuffer = currentBuffer,
    _drawCounter = drawCounter,
    _currentDepth = currentDepth
  {
    _vertexBuffer = .new(vertexBuffer, RlVertexBufferD.pointer(op?.readPtr(structLayout.offset(.vertexBuffer))));
    _draws = .new(draws, RlDrawCallD.pointer(op?.readPtr(structLayout.offset(.draws))));
  }

  factory RlRenderBatchD.zero() => .new();

  @override
  RlRenderBatchD setD(RlRenderBatchD o) {
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    vertexBuffer = o.vertexBuffer.map((e) => e.clone()).toList();
    draws = o.draws.map((e) => e.clone()).toList();
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeInt(_bufferCount, structLayout.offset(.bufferCount));
    p.writeInt(_currentBuffer, structLayout.offset(.currentBuffer));
    p.writePtr(_vertexBuffer.ptr, structLayout.offset(.vertexBuffer));
    p.writePtr(_draws.ptr, structLayout.offset(.draws));
    p.writeInt(_drawCounter, structLayout.offset(.drawCounter));
    p.writeFloat(_currentDepth, structLayout.offset(.currentDepth));

    _vertexBuffer.onStructPointer((p) => p.writeArray(_vertexBuffer.inner));
    _draws.onStructPointer((p) => p.writeArray(_draws.inner));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _bufferCount = p.readInt(structLayout.offset(.bufferCount));
    _currentBuffer = p.readInt(structLayout.offset(.currentBuffer));
    _vertexBuffer.ptr = p.readPtr(structLayout.offset(.vertexBuffer));
    _draws.ptr = p.readPtr(structLayout.offset(.draws));
    _drawCounter = p.readInt(structLayout.offset(.drawCounter));
    _currentDepth = p.readFloat(structLayout.offset(.currentDepth));

    _vertexBuffer.onStructPointer((p) => _vertexBuffer.raw = p.readArray(bufferCount));
    _draws.onStructPointer((p) => _draws.raw = p.readArray(drawCounter));
  }

  @override
  RlRenderBatchD clone() => .new(
    op: op,
    bufferCount: bufferCount,
    currentBuffer: currentBuffer,
    vertexBuffer: vertexBuffer.map((e) => e.clone()).toList(),
    draws: draws.map((e) => e.clone()).toList(),
    drawCounter: drawCounter,
    currentDepth: currentDepth,
  );

  @override
  String signature() => '$structName(bufferCount: $bufferCount, currentBuffer: $currentBuffer, drawCounter: $drawCounter, currentDepth: $currentDepth)';
}