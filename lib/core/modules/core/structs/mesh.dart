part of '../../../raylib_dartified_base.dart';

enum MeshField with StructFields {
  vertexCount,
  triangleCount,
  vertices,
  texcoords,
  texcoords2,
  normals,
  tangents,
  colors,
  indices,
  boneCount,
  boneIndices,
  boneWeights,
  animVertices,
  animNormals,
  vaoId,
  vboId,
}

/// Mesh, vertex data and vao/vbo
class MeshD extends RaylibStruct<MeshD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<MeshField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<MeshField> struct = .aligned({
    .vertexCount:   RInt(), // Number of vertices stored in arrays
    .triangleCount: RInt(), // Number of triangles stored (indexed or not)

    // Vertex attributes data
    .vertices:      RPointer(RFloat()), // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    .texcoords:     RPointer(RFloat()), // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    .texcoords2:    RPointer(RFloat()), // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    .normals:       RPointer(RFloat()), // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    .tangents:      RPointer(RFloat()), // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    .colors:        RPointer(RUnsignedChar()), // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    .indices:       RPointer(RUnsignedShort()), // Vertex indices (in case vertex data comes indexed)

    // Skin data for animation
    .boneCount:     RInt(), // Number of bones (MAX: 256 bones)
    .boneIndices:   RPointer(RUnsignedChar()), // Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6)
    .boneWeights:   RPointer(RFloat()), // Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)

    // Runtime animation vertex data (CPU skinning)
    // NOTE: In case of GPU skinning, not used, pointers are NULL
    .animVertices:  RPointer(RFloat()), // Animated vertex positions (after bones transformations)
    .animNormals:   RPointer(RFloat()), // Animated normals (after bones transformations)

    // OpenGL identifiers
    .vaoId:         RUnsignedInt(), // OpenGL Vertex Array Object id
    .vboId:         RPointer(RUnsignedInt()), // OpenGL Vertex Buffer Objects id (default vertex data)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MeshD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, MeshD.new, MeshD.pointer);

  static final _vertexCountF = struct.scalar<int, RInt>(.vertexCount);
  static final _triangleCountF = struct.scalar<int, RInt>(.triangleCount);
  static final _verticesF = struct.pointerScalarArray<double, RFloat>(.vertices);
  static final _texcoordsF = struct.pointerScalarArray<double, RFloat>(.texcoords);
  static final _texcoords2F = struct.pointerScalarArray<double, RFloat>(.texcoords2);
  static final _normalsF = struct.pointerScalarArray<double, RFloat>(.normals);
  static final _tangentsF = struct.pointerScalarArray<double, RFloat>(.tangents);
  static final _colorsF = struct.pointerScalarArray<int, RUnsignedChar>(.colors);
  static final _indicesF = struct.pointerScalarArray<int, RUnsignedShort>(.indices);
  static final _boneCountF = struct.scalar<int, RInt>(.boneCount);
  static final _boneIndicesF = struct.pointerScalarArray<int, RUnsignedChar>(.boneIndices);
  static final _boneWeightsF = struct.pointerScalarArray<double, RFloat>(.boneWeights);
  static final _animVerticesF = struct.pointerScalarArray<double, RFloat>(.animVertices);
  static final _animNormalsF = struct.pointerScalarArray<double, RFloat>(.animNormals);
  static final _vaoIdF = struct.scalar<int, RUnsignedInt>(.vaoId);
  static final _vboIdF = struct.pointerScalarArray<int, RUnsignedInt>(.vboId);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [vertices] buffer.
  static int BASE_verticesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the [vertices] buffer.
  int get verticesCount => BASE_verticesCount(vertexCount);

  /// Number of components in the [texcoords] buffer.
  static int BASE_texcoordsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 2 : 0;

  /// Number of components in the [texcoords] buffer.
  int get texcoordsCount => BASE_texcoordsCount(vertexCount);

  /// Number of components in the [texcoords2] buffer.
  static int BASE_texcoords2Count(int vertexCount) => vertexCount > 0 ? vertexCount * 2 : 0;

  /// Number of components in the [texcoords2] buffer.
  int get texcoords2Count => BASE_texcoords2Count(vertexCount);

  /// Number of components in the [normals] buffer.
  static int BASE_normalsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the [normals] buffer.
  int get normalsCount => BASE_normalsCount(vertexCount);

  /// Number of components in the [tangents] buffer.
  static int BASE_tangentsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the [tangents] buffer.
  int get tangentsCount => BASE_tangentsCount(vertexCount);

  /// Number of components in the [colors] buffer.
  static int BASE_colorsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the [colors] buffer.
  int get colorsCount => BASE_colorsCount(vertexCount);

  /// Number of components in the [indices] buffer.
  static int BASE_indicesCount(int triangleCount) => triangleCount > 0 ? triangleCount * 3 : 0;

  /// Number of components in the [indices] buffer.
  int get indicesCount => BASE_indicesCount(triangleCount);

  /// Number of components in the [boneIndices] buffer.
  static int BASE_boneIndicesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the [boneIndices] buffer.
  int get boneIndicesCount => BASE_boneIndicesCount(vertexCount);

  /// Number of components in the [boneWeights] buffer.
  static int BASE_boneWeightsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the [boneWeights] buffer.
  int get boneWeightsCount => BASE_boneWeightsCount(vertexCount);

  /// Number of components in the [animVertices] buffer.
  static int BASE_animVerticesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the [animVertices] buffer.
  int get animVerticesCount => BASE_animVerticesCount(vertexCount);

  /// Number of components in the [animNormals] buffer.
  static int BASE_animNormalsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the [animNormals] buffer.
  int get animNormalsCount => BASE_animNormalsCount(vertexCount);

  /// Number of components in the [vboId] buffer.
  static int get BASE_vboIdCount => RaylibConfig.MAX_MESH_VERTEX_BUFFERS;

  /// Number of components in the [vboId] buffer.
  int get vboIdCount => BASE_vboIdCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _vertexCount;
  /// Number of vertices stored in arrays
  int get vertexCount => _vertexCount = _vertexCountF.readOr(op, _vertexCount);
  set vertexCount(int value) => _vertexCount = _vertexCountF.writeIf(op, value);

  int _triangleCount;
  /// Number of triangles stored (indexed or not)
  int get triangleCount => _triangleCount = _triangleCountF.readOr(op, _triangleCount);
  set triangleCount(int value) => _triangleCount = _triangleCountF.writeIf(op, value);
  
  // Vertex attributes data
  
  late final StructLiveList<double, RFloat> _vertices;
  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  StructLiveList<double, RFloat> get vertices => _vertices;
  set vertices(List<double> value) => _vertices.inner = value;
  
  late final StructLiveList<double, RFloat> _texcoords;
  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  StructLiveList<double, RFloat> get texcoords => _texcoords;
  set texcoords(List<double> value) => _texcoords.inner = value;

  late final StructLiveList<double, RFloat> _texcoords2;
  /// Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
  StructLiveList<double, RFloat> get texcoords2 => _texcoords2;
  set texcoords2(List<double> value) => _texcoords2.inner = value;

  late final StructLiveList<double, RFloat> _normals;
  /// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
  StructLiveList<double, RFloat> get normals => _normals;
  set normals(List<double> value) => _normals.inner = value;

  late final StructLiveList<double, RFloat> _tangents;
  /// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
  StructLiveList<double, RFloat> get tangents => _tangents;
  set tangents(List<double> value) => _tangents.inner = value;

  late final StructLiveList<int, RUnsignedChar> _colors;
  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  StructLiveList<int, RUnsignedChar> get colors => _colors;
  set colors(List<int> value) => _colors.inner = value;

  late final StructLiveList<int, RUnsignedShort> _indices;
  /// Vertex indices (in case vertex data comes indexed)
  StructLiveList<int, RUnsignedShort> get indices => _indices;
  set indices(List<int> value) => _indices.inner = value;

  // Skin data for animation

  int _boneCount;
  // Number of bones (MAX: 256 bones)
  int get boneCount => _boneCount = _boneCountF.readOr(op, _boneCount);
  set boneCount(int value) => _boneCount = _boneCountF.writeIf(op, value);

  late final StructLiveList<int, RUnsignedChar> _boneIndices;
  /// Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6)
  StructLiveList<int, RUnsignedChar> get boneIndices => _boneIndices;
  set boneIndices(List<int> value) => _boneIndices.inner = value;
  
  late final StructLiveList<double, RFloat> _boneWeights;
  /// Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)
  StructLiveList<double, RFloat> get boneWeights => _boneWeights;
  set boneWeights(List<double> value) => _boneWeights.inner = value;

  // Animation vertex data

  late final StructLiveList<double, RFloat> _animVertices;
  /// Animated vertex positions (after bones transformations)
  StructLiveList<double, RFloat> get animVertices => _animVertices;
  set animVertices(List<double> value) => _animVertices.inner = value;

  late final StructLiveList<double, RFloat> _animNormals;
  /// Animated normals (after bones transformations)
  StructLiveList<double, RFloat> get animNormals => _animNormals;
  set animNormals(List<double> value) => _animNormals.inner = value;

  int _vaoId;
  /// OpenGL Vertex Array Object id
  int get vaoId => _vaoId = _vaoIdF.readOr(op, _vaoId);
  set vaoId(int value) => _vaoId = _vaoIdF.writeIf(op, value);

  late final StructLiveList<int, RUnsignedInt> _vboId;
  /// OpenGL Vertex Buffer Objects id (default vertex data)
  StructLiveList<int, RUnsignedInt> get vboId => _vboId;
  set vboId(List<int> value) => _vboId.inner = value;

  MeshD({
    super.op,
    int vertexCount = 0,
    int triangleCount = 0,
    int boneCount = 0,
    List<double>? vertices,
    List<double>? texcoords,
    List<double>? texcoords2,
    List<double>? normals,
    List<double>? tangents,
    List<int>? colors,
    List<int>? indices,
    List<int>? boneIndices,
    List<double>? boneWeights,
    List<double>? animVertices,
    List<double>? animNormals,
    int vaoId = 0,
    List<int>? vboId,
  }) :
    _vertexCount = vertexCount,
    _triangleCount = triangleCount,
    _boneCount = boneCount,
    _vaoId = vaoId
  {
    _vertices = _verticesF.live(() => op, vertices ?? []);
    _texcoords = _texcoordsF.live(() => op, texcoords ?? []);
    _texcoords2 = _texcoords2F.live(() => op, texcoords2 ?? []);
    _normals = _normalsF.live(() => op, normals ?? []);
    _tangents = _tangentsF.live(() => op, tangents ?? []);
    _colors = _colorsF.live(() => op, colors ?? []);
    _indices = _indicesF.live(() => op, indices ?? []);
    _boneIndices = _boneIndicesF.live(() => op, boneIndices ?? []);
    _boneWeights = _boneWeightsF.live(() => op, boneWeights ?? []);
    _animVertices = _animVerticesF.live(() => op, animVertices ?? []);
    _animNormals = _animNormalsF.live(() => op, animNormals ?? []);
    _vboId = _vboIdF.live(() => op, vboId ?? []);
  }

  factory MeshD.zero() => .new();

  @override
  MeshD setDart(MeshD o) {
    vertexCount = o.vertexCount;
    triangleCount = o.triangleCount;
    boneCount = o.boneCount;
    vertices = .from(o.vertices);
    texcoords = .from(o.texcoords);
    texcoords2 = .from(o.texcoords2);
    normals = .from(o.normals);
    tangents = .from(o.tangents);
    colors = .from(o.colors);
    indices = .from(o.indices);
    boneCount = o.boneCount;
    boneIndices = .from(o.boneIndices);
    boneWeights = .from(o.boneWeights);
    animVertices = .from(o.animVertices);
    animNormals = .from(o.animNormals);
    vaoId = o.vaoId;
    vboId = .from(o.vboId);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointerHandle p, String key) {
    if (_vertices.inner.isNotEmpty) _verticesF.allocate(temp, p, '${key}_vertices', count: _vertices.inner.length, raw: true);
    if (_texcoords.inner.isNotEmpty) _texcoordsF.allocate(temp, p, '${key}_texcoords', count: _texcoords.inner.length, raw: true);
    if (_texcoords2.inner.isNotEmpty) _texcoords2F.allocate(temp, p, '${key}_texcoords2', count: _texcoords2.inner.length, raw: true);
    if (_normals.inner.isNotEmpty) _normalsF.allocate(temp, p, '${key}_normals', count: _normals.inner.length, raw: true);
    if (_tangents.inner.isNotEmpty) _tangentsF.allocate(temp, p, '${key}_tangents', count: _tangents.inner.length, raw: true);
    if (_colors.inner.isNotEmpty) _colorsF.allocate(temp, p, '${key}_colors', count: _colors.inner.length, raw: true);
    if (_indices.inner.isNotEmpty) _indicesF.allocate(temp, p, '${key}_indices', count: _indices.inner.length, raw: true);
    if (_boneIndices.inner.isNotEmpty) _boneIndicesF.allocate(temp, p, '${key}_boneIndices', count: _boneIndices.inner.length, raw: true);
    if (_boneWeights.inner.isNotEmpty) _boneWeightsF.allocate(temp, p, '${key}_boneWeights', count: _boneWeights.inner.length, raw: true);
    if (RaylibConfig.IS_GPU_SKINNING_SUPPORTED) {
      if (_animVertices.inner.isNotEmpty) _animVerticesF.allocate(temp, p, '${key}_animVertices', count: _animVertices.inner.length, raw: true);
      if (_animNormals.inner.isNotEmpty) _animNormalsF.allocate(temp, p, '${key}_animNormals', count: _animNormals.inner.length, raw: true);
    }
  }

  @override
  void structWriteInto(MemoryPointerHandle p) {
    _vertexCountF.write(p, _vertexCount);
    _triangleCountF.write(p, _triangleCount);
    _vertices.writeInto(p, _vertices.inner);
    _texcoords.writeInto(p, _texcoords.inner);
    _texcoords2.writeInto(p, _texcoords2.inner);
    _normals.writeInto(p, _normals.inner);
    _tangents.writeInto(p, _tangents.inner);
    _colors.writeInto(p, _colors.inner);
    _indices.writeInto(p, _indices.inner);
    _boneCountF.write(p, _boneCount);
    _boneIndices.writeInto(p, _boneIndices.inner);
    _boneWeights.writeInto(p, _boneWeights.inner);
    _animVertices.writeInto(p, _animVertices.inner);
    _animNormals.writeInto(p, _animNormals.inner);
    _vaoIdF.write(p, _vaoId);
    _vboId.writeInto(p, _vboId.inner);
  }

  @override
  void structReadFrom(MemoryPointerHandle p) {
    _vertexCount = _vertexCountF.read(p);
    _triangleCount = _triangleCountF.read(p);
    _vertices.readFrom(p, count: verticesCount);
    _texcoords.readFrom(p, count: texcoordsCount);
    _texcoords2.readFrom(p, count: texcoords2Count);
    _normals.readFrom(p, count: normalsCount);
    _tangents.readFrom(p, count: tangentsCount);
    _colors.readFrom(p, count: colorsCount);
    _indices.readFrom(p, count: indicesCount);
    _boneCount = _boneCountF.read(p);
    _boneIndices.readFrom(p, count: boneIndicesCount);
    _boneWeights.readFrom(p, count: boneWeightsCount);
    _animVertices.readFrom(p, count: animVerticesCount);
    _animNormals.readFrom(p, count: animNormalsCount);
    _vaoId = _vaoIdF.read(p);
    _vboId.readFrom(p, count: vboIdCount);
  }

  @override
  MeshD clone() => .new(
    op: op,
    vertexCount: vertexCount,
    triangleCount: triangleCount,
    boneCount: boneCount,
    vertices: .from(vertices),
    texcoords: .from(texcoords),
    texcoords2: .from(texcoords2),
    normals: .from(normals),
    tangents: .from(tangents),
    colors: .from(colors),
    indices: .from(indices),
    boneIndices: .from(boneIndices),
    boneWeights: .from(boneWeights),
    animVertices: .from(animVertices),
    animNormals: .from(animNormals),
    vaoId: vaoId,
    vboId: .from(vboId),
  );

  @override
  String signature() => '$structName(vertexCount: $vertexCount, triangleCount: $triangleCount, boneCount: $boneCount, vaoId: $vaoId)';
}