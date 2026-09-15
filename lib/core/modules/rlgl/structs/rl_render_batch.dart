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
  
  static final field_bufferCount = struct.scalar<int, RInt>(.bufferCount);
  static final field_currentBuffer = struct.scalar<int, RInt>(.currentBuffer);
  static final field_vertexBuffer = struct.pointerStructArray(.vertexBuffer, RlVertexBufferD.pointer);
  static final field_draws = struct.pointerStructArray(.draws, RlDrawCallD.pointer);
  static final field_drawCounter = struct.scalar<int, RInt>(.drawCounter);
  static final field_currentDepth = struct.scalar<double, RFloat>(.currentDepth);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _bufferCount;
  /// Number of vertex buffers (multi-buffering support)
  int get bufferCount => _bufferCount = field_bufferCount.readOr(op, _bufferCount);
  set bufferCount(int value) => _bufferCount = field_bufferCount.writeIf(op, value);

  int _currentBuffer;
  /// Current buffer tracking in case of multi-buffering
  int get currentBuffer => _currentBuffer = field_currentBuffer.readOr(op, _currentBuffer);
  set currentBuffer(int value) => _currentBuffer = field_currentBuffer.writeIf(op, value);

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
  int get drawCounter => _drawCounter = field_drawCounter.readOr(op, _drawCounter);
  set drawCounter(int value) => _drawCounter = field_drawCounter.writeIf(op, value);
  
  double _currentDepth;
  /// Current depth value for next draw
  double get currentDepth => _currentDepth = field_currentDepth.readOr(op, _currentDepth);
  set currentDepth(double value) => _currentDepth = field_currentDepth.writeIf(op, value);
  
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
    _vertexBuffer = field_vertexBuffer.live(() => op, vertexBuffer ?? []);
    _draws = field_draws.live(() => op, draws ?? []);
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
    field_vertexBuffer.allocate(temp, p, '${key}_vertexBuffer', count: bufferCount);
    field_draws.allocate(temp, p, '${key}_draws', count: bufferCount);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_bufferCount.write(p, _bufferCount);
    field_currentBuffer.write(p, _currentBuffer);
    _vertexBuffer.writeInto(p);
    _draws.writeInto(p);
    field_drawCounter.write(p, _drawCounter);
    field_currentDepth.write(p, _currentDepth);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _bufferCount = field_bufferCount.read(p);
    _currentBuffer = field_currentBuffer.read(p);
    _vertexBuffer.readFrom(p, count: bufferCount);
    _draws.readFrom(p, count: bufferCount);
    _drawCounter = field_drawCounter.read(p);
    _currentDepth = field_currentDepth.read(p);
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