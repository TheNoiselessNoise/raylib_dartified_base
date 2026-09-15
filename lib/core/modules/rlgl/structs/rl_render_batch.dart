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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<RlRenderBatchD> struct = .new(
    factory: RlRenderBatchD.new,
    layout: .aligned<RlRenderBatchField>({
      .bufferCount:   RInt(), // Number of vertex buffers (multi-buffering support)
      .currentBuffer: RInt(), // Current buffer tracking in case of multi-buffering
      .vertexBuffer:  RPointer(RStruct(RlVertexBufferD.struct)), // Dynamic buffer(s) for vertex data
      .draws:         RPointer(RStruct(RlDrawCallD.struct)), // Draw calls array, depends on textureId
      .drawCounter:   RInt(), // Draw calls counter
      .currentDepth:  RFloat(), // Current depth value for next draw
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<RlRenderBatchField> structLayout = struct.layoutOf();
  
  /// Field descriptor for [bufferCount].
  static final field_bufferCount = structLayout.scalar<int, RInt>(.bufferCount);
  /// Field descriptor for [currentBuffer].
  static final field_currentBuffer = structLayout.scalar<int, RInt>(.currentBuffer);
  /// Field descriptor for [vertexBuffer].
  static final field_vertexBuffer = structLayout.pointerStructArray<RlVertexBufferD>(.vertexBuffer);
  /// Field descriptor for [draws].
  static final field_draws = structLayout.pointerStructArray<RlDrawCallD>(.draws);
  /// Field descriptor for [drawCounter].
  static final field_drawCounter = structLayout.scalar<int, RInt>(.drawCounter);
  /// Field descriptor for [currentDepth].
  static final field_currentDepth = structLayout.scalar<double, RFloat>(.currentDepth);

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
  set bufferCount(int value) => _bufferCount = field_bufferCount.writeOr(op, value);

  int _currentBuffer;
  /// Current buffer tracking in case of multi-buffering
  int get currentBuffer => _currentBuffer = field_currentBuffer.readOr(op, _currentBuffer);
  set currentBuffer(int value) => _currentBuffer = field_currentBuffer.writeOr(op, value);

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
  set drawCounter(int value) => _drawCounter = field_drawCounter.writeOr(op, value);
  
  double _currentDepth;
  /// Current depth value for next draw
  double get currentDepth => _currentDepth = field_currentDepth.readOr(op, _currentDepth);
  set currentDepth(double value) => _currentDepth = field_currentDepth.writeOr(op, value);
  
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