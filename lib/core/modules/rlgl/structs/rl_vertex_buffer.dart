part of '../../../raylib_dartified_base.dart';

enum RlVertexBufferField with StructFields {
  elementCount,
  vertices,
  texcoords,
  normals,
  colors,
  indices,
  vaoId,
  vboId,
}

/// RLGL Vertex buffer
class RlVertexBufferD extends RaylibStruct<RlVertexBufferD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<RlVertexBufferField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RlVertexBufferField> struct = .aligned({
    .elementCount: RInt(), // Number of elements in the buffer (QUADS)
    .vertices:     RPointer(RFloat()), // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    .texcoords:    RPointer(RFloat()), // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    .normals:      RPointer(RFloat()), // Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
    .colors:       RPointer(RUnsignedChar()), // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    .indices: switch (currentRaylibPlatform) {
      .native   => RPointer(RUnsignedInt()), // Vertex indices (in case vertex data comes indexed) (6 indices per quad)
      .web      => RPointer(RUnsignedShort()), // Vertex indices (in case vertex data comes indexed) (6 indices per quad)
    },
    .vaoId:        RUnsignedInt(), // OpenGL Vertex Array Object id
    .vboId:        RArray(RUnsignedInt(), BASE_vboIdCount), // OpenGL Vertex Buffer Objects id (5 types of vertex data)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RlVertexBufferD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, RlVertexBufferD.new, RlVertexBufferD.pointer);

  static final _elementCountF = struct.scalar<int, RInt>(.elementCount);
  static final _verticesF = struct.pointerScalarArray<double, RFloat>(.vertices);
  static final _texcoordsF = struct.pointerScalarArray<double, RFloat>(.texcoords);
  static final _normalsF = struct.pointerScalarArray<double, RFloat>(.normals);
  static final _colorsF = struct.pointerScalarArray<int, RUnsignedChar>(.colors);
  static final _indicesF = switch (currentRaylibPlatform) {
    .native => struct.pointerScalarArray<int, RUnsignedInt>(.indices),
    .web    => struct.pointerScalarArray<int, RUnsignedShort>(.indices),
  };
  static final _vaoIdF = struct.scalar<int, RUnsignedInt>(.vaoId);
  static final _vboIdF = struct.scalarArray<int, RUnsignedInt>(.vboId);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [vertices] buffer.
  static int BASE_verticesCount(int elementCount) => elementCount > 0 ? elementCount * 3 : 0;
  
  /// Number of components in the [vertices] buffer.
  int get verticesCount => BASE_verticesCount(elementCount);

  /// Number of components in the [texcoords] buffer.
  static int BASE_texcoordsCount(int elementCount) => elementCount > 0 ? elementCount * 2 : 0;
  
  /// Number of components in the [texcoords] buffer.
  int get texcoordsCount => BASE_texcoordsCount(elementCount);

  /// Number of components in the [normals] buffer.
  static int BASE_normalsCount(int elementCount) => elementCount > 0 ? elementCount * 3 : 0;
  
  /// Number of components in the [normals] buffer.
  int get normalsCount => BASE_normalsCount(elementCount);

  /// Number of components in the [colors] buffer.
  static int BASE_colorsCount(int elementCount) => elementCount > 0 ? elementCount * 4 : 0;
  
  /// Number of components in the [colors] buffer.
  int get colorsCount => BASE_colorsCount(elementCount);

  /// Number of components in the [indices] buffer.
  static int BASE_indicesCount(int elementCount) => elementCount > 0 ? elementCount * 6 : 0;

  /// Number of components in the [indices] buffer.
  int get indicesCount => BASE_indicesCount(elementCount);
  
  /// Number of components in the [vboId] array.
  static int get BASE_vboIdCount => 5;

  /// Number of components in the [vboId] array.
  int get vboIdCount => BASE_vboIdCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _elementCount;
  /// Number of elements in the buffer (QUADS)
  int get elementCount => _elementCount = _elementCountF.readOr(op, _elementCount);
  set elementCount(int value) => _elementCount = _elementCountF.writeIf(op, value);

  late final StructLiveList<double, RFloat> _vertices;
  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  StructLiveList<double, RFloat> get vertices => _vertices;
  set vertices(List<double> value) => _vertices.inner = value;

  late final StructLiveList<double, RFloat> _texcoords;
  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  StructLiveList<double, RFloat> get texcoords => _texcoords;
  set texcoords(List<double> value) => _texcoords.inner = value;

  late final StructLiveList<double, RFloat> _normals;
  /// Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
  StructLiveList<double, RFloat> get normals => _normals;
  set normals(List<double> value) => _normals.inner = value;

  late final StructLiveList<int, RUnsignedChar> _colors;
  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  StructLiveList<int, RUnsignedChar> get colors => _colors;
  set colors(List<int> value) => _colors.inner = value;
  
  late final StructLiveList<int, RTypeIntLike> _indices;
  /// Vertex indices (in case vertex data comes indexed) (6 indices per quad)
  StructLiveList<int, RTypeIntLike> get indices => _indices;
  set indices(List<int> value) => _indices.inner = value;

  int _vaoId;
  /// OpenGL Vertex Array Object id
  int get vaoId => _vaoId = _vaoIdF.readOr(op, _vaoId);
  set vaoId(int value) => _vaoId = _vaoIdF.writeIf(op, value);
  
  late final StructLiveList<int, RUnsignedInt> _vboId;
  /// OpenGL Vertex Buffer Objects id (5 types of vertex data)
  StructLiveList<int, RUnsignedInt> get vboId => _vboId;
  set vboId(List<int> value) => _vboId.inner = value;

  RlVertexBufferD({
    super.op,
    int elementCount = 0,
    List<double>? vertices,
    List<double>? texcoords,
    List<double>? normals,
    List<int>? colors,
    List<int>? indices,
    int vaoId = 0,
    List<int>? vboId,
  }) :
    _elementCount = elementCount,
    _vaoId = vaoId
  {
    _vertices = _verticesF.live(() => op, vertices ?? .filled(verticesCount, 0));
    _texcoords = _texcoordsF.live(() => op, texcoords ?? .filled(texcoordsCount, 0));
    _normals = _normalsF.live(() => op, normals ?? .filled(normalsCount, 0));
    _colors = _colorsF.live(() => op, colors ?? .filled(colorsCount, 0));
    _indices = _indicesF.live(() => op, indices ?? .filled(indicesCount, 0));
    _vboId = _vboIdF.live(() => op, vboId ?? .filled(vboIdCount, 0));
  }

  factory RlVertexBufferD.zero() => .new();

  @override
  RlVertexBufferD setDart(RlVertexBufferD o) {
    elementCount = o.elementCount;
    vertices = .from(o.vertices);
    texcoords = .from(o.texcoords);
    normals = .from(o.normals);
    colors = .from(o.colors);
    indices = .from(o.indices);
    vaoId = o.vaoId;
    vboId = .from(o.vboId);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointerHandle p, String key) {
    if (_vertices.inner.isNotEmpty) {
      _verticesF.allocate(temp, p, '${key}_vertices', count: _vertices.inner.length);
    }
    if (_texcoords.inner.isNotEmpty) {
      _texcoordsF.allocate(temp, p, '${key}_texcoords', count: _texcoords.inner.length);
    }
    if (_normals.inner.isNotEmpty) {
      _normalsF.allocate(temp, p, '${key}_normals', count: _normals.inner.length);
    }
    if (_colors.inner.isNotEmpty) {
      _colorsF.allocate(temp, p, '${key}_colors', count: _colors.inner.length);
    }
    if (_indices.inner.isNotEmpty) {
      _indicesF.allocate(temp, p, '${key}_indices', count: _indices.inner.length);
    }
  }

  @override
  void structWriteInto(MemoryPointerHandle p) {
    _elementCountF.write(p, _elementCount);
    _vertices.writeInto(p);
    _texcoords.writeInto(p);
    _normals.writeInto(p);
    _colors.writeInto(p);
    _indices.writeInto(p);
    _vaoIdF.write(p, _vaoId);
    _vboId.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointerHandle p) {
    _elementCount = _elementCountF.read(p);
    _vertices.readFrom(p, count: verticesCount);
    _texcoords.readFrom(p, count: texcoordsCount);
    _normals.readFrom(p, count: normalsCount);
    _colors.readFrom(p, count: colorsCount);
    _indices.readFrom(p, count: indicesCount);
    _vaoId = _vaoIdF.read(p);
    _vboId.readFrom(p, count: vboIdCount);
  }

  @override
  RlVertexBufferD clone() => .new(
    op: op,
    elementCount: elementCount,
    vertices: .from(vertices),
    texcoords: .from(texcoords),
    normals: .from(normals),
    colors: .from(colors),
    indices: .from(indices),
    vaoId: vaoId,
    vboId: .from(vboId),
  );

  @override
  String signature() => '$structName(elementCount: $elementCount, vaoId: $vaoId, vboId: $vboId)';
}