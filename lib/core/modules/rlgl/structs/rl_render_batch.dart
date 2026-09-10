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

  @override
  StructLayout<RlRenderBatchField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RlRenderBatchField> struct = .aligned({
    .bufferCount:   RInt(), // Number of vertex buffers (multi-buffering support)
    .currentBuffer: RInt(), // Current buffer tracking in case of multi-buffering
    .vertexBuffer:  RPointer(RStruct(RlVertexBufferD.struct)), // Dynamic buffer(s) for vertex data
    .draws:         RPointer(RStruct(RlDrawCallD.struct)), // Draw calls array, depends on textureId
    .drawCounter:   RInt(), // Draw calls counter
    .currentDepth:  RFloat(), // Current depth value for next draw
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RlRenderBatchD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, RlRenderBatchD.new, RlRenderBatchD.pointer);
  
  static final _bufferCountF = struct.scalar<int, RInt>(.bufferCount);
  static final _currentBufferF = struct.scalar<int, RInt>(.currentBuffer);
  static final _vertexBufferF = struct.pointerStructArray(.vertexBuffer, RlVertexBufferD.pointer);
  static final _drawsF = struct.pointerStructArray(.draws, RlDrawCallD.pointer);
  static final _drawCounterF = struct.scalar<int, RInt>(.drawCounter);
  static final _currentDepthF = struct.scalar<double, RFloat>(.currentDepth);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _bufferCount;
  /// Number of vertex buffers (multi-buffering support)
  int get bufferCount => _bufferCount = _bufferCountF.readOr(op, _bufferCount);
  set bufferCount(int value) => _bufferCount = _bufferCountF.writeIf(op, value);

  int _currentBuffer;
  /// Current buffer tracking in case of multi-buffering
  int get currentBuffer => _currentBuffer = _currentBufferF.readOr(op, _currentBuffer);
  set currentBuffer(int value) => _currentBuffer = _currentBufferF.writeIf(op, value);

  late final StructLiveListStruct<RlVertexBufferD> _vertexBuffer;
  /// Dynamic buffer(s) for vertex data
  StructLiveListStruct<RlVertexBufferD> get vertexBuffer => _vertexBuffer;
  set vertexBuffer(List<RlVertexBufferD> value) => _vertexBuffer.inner = value;

  late final StructLiveListStruct<RlDrawCallD> _draws;
  /// Draw calls array, depends on textureId
  StructLiveListStruct<RlDrawCallD> get draws => _draws;
  set draws(List<RlDrawCallD> value) => _draws.inner = value;

  int _drawCounter;
  /// Draw calls counter
  int get drawCounter => _drawCounter = _drawCounterF.readOr(op, _drawCounter);
  set drawCounter(int value) => _drawCounter = _drawCounterF.writeIf(op, value);
  
  double _currentDepth;
  /// Current depth value for next draw
  double get currentDepth => _currentDepth = _currentDepthF.readOr(op, _currentDepth);
  set currentDepth(double value) => _currentDepth = _currentDepthF.writeIf(op, value);
  
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
    _vertexBuffer = _vertexBufferF.live(() => op, vertexBuffer ?? []);
    _draws = _drawsF.live(() => op, draws ?? []);
  }

  factory RlRenderBatchD.zero() => .new();

  @override
  RlRenderBatchD setDart(RlRenderBatchD o) {
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    vertexBuffer = o.vertexBuffer.map((e) => e.clone()).toList();
    draws = o.draws.map((e) => e.clone()).toList();
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    if (_vertexBuffer.inner.isNotEmpty) {
      _vertexBufferF.allocate(temp, p, '${key}_vertexBuffer', count: _vertexBuffer.inner.length);
    }
    if (_draws.inner.isNotEmpty) {
      _drawsF.allocate(temp, p, '${key}_draws', count: _draws.inner.length);
    }
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _bufferCountF.write(p, _bufferCount);
    _currentBufferF.write(p, _currentBuffer);
    _vertexBuffer.writeInto(p);
    _draws.writeInto(p);
    _drawCounterF.write(p, _drawCounter);
    _currentDepthF.write(p, _currentDepth);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _bufferCount = _bufferCountF.read(p);
    _currentBuffer = _currentBufferF.read(p);
    _vertexBuffer.readFrom(p, count: bufferCount);
    _draws.readFrom(p, count: bufferCount);
    _drawCounter = _drawCounterF.read(p);
    _currentDepth = _currentDepthF.read(p);
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