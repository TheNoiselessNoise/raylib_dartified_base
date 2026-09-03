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

// TODO: translate

/// Mesh, vertex data and vao/vbo
class MeshD extends RaylibStruct<MeshD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

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
  static StructPointer<MeshD> pointer(MemoryPointer? ptr)
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
  int get vertexCount => _vertexCount = _vertexCountF.readOr(op?.ptr, _vertexCount);
  set vertexCount(int value) => _vertexCount = _vertexCountF.writeIf(op?.ptr, value);

  int _triangleCount;
  /// Number of triangles stored (indexed or not)
  int get triangleCount => _triangleCount = _triangleCountF.readOr(op?.ptr, _triangleCount);
  set triangleCount(int value) => _triangleCount = _triangleCountF.writeIf(op?.ptr, value);
  
  // Vertex attributes data
  
  late LiveStructList<double, RFloat> _vertices;
  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  LiveStructList<double, RFloat> get vertices => _vertices;
  set vertices(List<double> value) => _vertices.inner = value;
  
  late LiveStructList<double, RFloat> _texcoords;
  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  LiveStructList<double, RFloat> get texcoords => _texcoords;
  set texcoords(List<double> value) => _texcoords.inner = value;

  late LiveStructList<double, RFloat> _texcoords2;
  /// Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
  LiveStructList<double, RFloat> get texcoords2 => _texcoords2;
  set texcoords2(List<double> value) => _texcoords2.inner = value;

  late LiveStructList<double, RFloat> _normals;
  /// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
  LiveStructList<double, RFloat> get normals => _normals;
  set normals(List<double> value) => _normals.inner = value;

  late LiveStructList<double, RFloat> _tangents;
  /// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
  LiveStructList<double, RFloat> get tangents => _tangents;
  set tangents(List<double> value) => _tangents.inner = value;

  late LiveStructList<int, RUnsignedChar> _colors;
  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  LiveStructList<int, RUnsignedChar> get colors => _colors;
  set colors(List<int> value) => _colors.inner = value;

  late LiveStructList<int, RUnsignedShort> _indices;
  /// Vertex indices (in case vertex data comes indexed)
  LiveStructList<int, RUnsignedShort> get indices => _indices;
  set indices(List<int> value) => _indices.inner = value;

  // Skin data for animation

  int _boneCount;
  // Number of bones (MAX: 256 bones)
  int get boneCount => _boneCount = _boneCountF.readOr(op?.ptr, _boneCount);
  set boneCount(int value) => _boneCount = _boneCountF.writeIf(op?.ptr, value);

  late LiveStructList<int, RUnsignedChar> _boneIndices;
  /// Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6)
  LiveStructList<int, RUnsignedChar> get boneIndices => _boneIndices;
  set boneIndices(List<int> value) => _boneIndices.inner = value;
  
  late LiveStructList<double, RFloat> _boneWeights;
  /// Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)
  LiveStructList<double, RFloat> get boneWeights => _boneWeights;
  set boneWeights(List<double> value) => _boneWeights.inner = value;

  // Animation vertex data

  late LiveStructList<double, RFloat> _animVertices;
  /// Animated vertex positions (after bones transformations)
  LiveStructList<double, RFloat> get animVertices => _animVertices;
  set animVertices(List<double> value) => _animVertices.inner = value;

  late LiveStructList<double, RFloat> _animNormals;
  /// Animated normals (after bones transformations)
  LiveStructList<double, RFloat> get animNormals => _animNormals;
  set animNormals(List<double> value) => _animNormals.inner = value;

  int _vaoId;
  /// OpenGL Vertex Array Object id
  int get vaoId => _vaoId = _vaoIdF.readOr(op?.ptr, _vaoId);
  set vaoId(int value) => _vaoId = _vaoIdF.writeIf(op?.ptr, value);

  late LiveStructList<int, RUnsignedInt> _vboId;
  /// OpenGL Vertex Buffer Objects id (default vertex data)
  LiveStructList<int, RUnsignedInt> get vboId => _vboId;
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
    _vertices = _verticesF.live(() => op?.ptr, vertices ?? .filled(verticesCount, 0));
    _texcoords = _texcoordsF.live(() => op?.ptr, texcoords ?? .filled(texcoordsCount, 0));
    _texcoords2 = _texcoords2F.live(() => op?.ptr, texcoords2 ?? .filled(texcoords2Count, 0));
    _normals = _normalsF.live(() => op?.ptr, normals ?? .filled(normalsCount, 0));
    _tangents = _tangentsF.live(() => op?.ptr, tangents ?? .filled(tangentsCount, 0));
    _colors = _colorsF.live(() => op?.ptr, colors ?? .filled(colorsCount, 0));
    _indices = _indicesF.live(() => op?.ptr, indices ?? .filled(indicesCount, 0));
    _boneIndices = _boneIndicesF.live(() => op?.ptr, boneIndices ?? .filled(boneIndicesCount, 0));
    _boneWeights = _boneWeightsF.live(() => op?.ptr, boneWeights ?? .filled(boneWeightsCount, 0));
    _animVertices = _animVerticesF.live(() => op?.ptr, animVertices ?? .filled(animVerticesCount, 0));
    _animNormals = _animNormalsF.live(() => op?.ptr, animNormals ?? .filled(animNormalsCount, 0));
    _vboId = _vboIdF.live(() => op?.ptr, vboId ?? .filled(vboIdCount, 0));
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
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    if (_vertices.inner.isNotEmpty) {
      _vertices.ptr = temp.Float$.RawArray(_vertices.inner);
    }
    if (_texcoords.inner.isNotEmpty) {
      _texcoords.ptr = temp.Float$.RawArray(_texcoords.inner);
    }
    if (_texcoords2.inner.isNotEmpty) {
      _texcoords2.ptr = temp.Float$.RawArray(_texcoords2.inner);
    }
    if (_normals.inner.isNotEmpty) {
      _normals.ptr = temp.Float$.RawArray(_normals.inner);
    }
    if (_tangents.inner.isNotEmpty) {
      _tangents.ptr = temp.Float$.RawArray(_tangents.inner);
    }
    if (_colors.inner.isNotEmpty) {
      _colors.ptr = temp.UnsignedChar$.RawArray(_colors.inner);
    }
    if (_indices.inner.isNotEmpty) {
      _indices.ptr = temp.UnsignedShort$.RawArray(_indices.inner);
    }
    if (_boneIndices.inner.isNotEmpty) {
      _boneIndices.ptr = temp.UnsignedChar$.RawArray(_boneIndices.inner);
    }
    if (_boneWeights.inner.isNotEmpty) {
      _boneWeights.ptr = temp.Float$.RawArray(_boneWeights.inner);
    }
    if (RaylibConfig.IS_GPU_SKINNING_SUPPORTED) {
      if (_animVertices.inner.isNotEmpty) {
        _animVertices.ptr = temp.Float$.RawArray(_animVertices.inner);
      }
      if (_animNormals.inner.isNotEmpty) {
        _animNormals.ptr = temp.Float$.RawArray(_animNormals.inner);
      }
    }
    _vboId.ptr = MemoryPointer.nullptr.cast();
  }

  @override
  void structWriteInto(MemoryPointer p) {
    p.writeInt(_vertexCount, struct.offset(.vertexCount));
    p.writeInt(_triangleCount, struct.offset(.triangleCount));
    p.writePtr(_vertices.ptr, struct.offset(.vertices));
    p.writePtr(_texcoords.ptr, struct.offset(.texcoords));
    p.writePtr(_texcoords2.ptr, struct.offset(.texcoords2));
    p.writePtr(_normals.ptr, struct.offset(.normals));
    p.writePtr(_tangents.ptr, struct.offset(.tangents));
    p.writePtr(_colors.ptr, struct.offset(.colors));
    p.writePtr(_indices.ptr, struct.offset(.indices));
    p.writeInt(_boneCount, struct.offset(.boneCount));
    p.writePtr(_boneIndices.ptr, struct.offset(.boneIndices));
    p.writePtr(_boneWeights.ptr, struct.offset(.boneWeights));
    p.writePtr(_animVertices.ptr, struct.offset(.animVertices));
    p.writePtr(_animNormals.ptr, struct.offset(.animNormals));
    p.writeUnsignedInt(_vaoId, struct.offset(.vaoId));
    p.writePtr(_vboId.ptr, struct.offset(.vboId));

    _vertices.onPointer((p) => p.writeArray(_vertices.inner));
    _texcoords.onPointer((p) => p.writeArray(_texcoords.inner));
    _texcoords2.onPointer((p) => p.writeArray(_texcoords2.inner));
    _normals.onPointer((p) => p.writeArray(_normals.inner));
    _tangents.onPointer((p) => p.writeArray(_tangents.inner));
    _colors.onPointer((p) => p.writeArray(_colors.inner));
    _indices.onPointer((p) => p.writeArray(_indices.inner));
    _boneIndices.onPointer((p) => p.writeArray(_boneIndices.inner));
    _boneWeights.onPointer((p) => p.writeArray(_boneWeights.inner));
    _animVertices.onPointer((p) => p.writeArray(_animVertices.inner));
    _animNormals.onPointer((p) => p.writeArray(_animNormals.inner));
    _vboId.onPointer((p) => p.writeArray(_vboId.inner));
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _vertexCount = p.readInt(struct.offset(.vertexCount));
    _triangleCount = p.readInt(struct.offset(.triangleCount));
    _vertices.ptr = p.readPtr(struct.offset(.vertices));
    _texcoords.ptr = p.readPtr(struct.offset(.texcoords));
    _texcoords2.ptr = p.readPtr(struct.offset(.texcoords2));
    _normals.ptr = p.readPtr(struct.offset(.normals));
    _tangents.ptr = p.readPtr(struct.offset(.tangents));
    _colors.ptr = p.readPtr(struct.offset(.colors));
    _indices.ptr = p.readPtr(struct.offset(.indices));
    _boneCount = p.readInt(struct.offset(.boneCount));
    _boneIndices.ptr = p.readPtr(struct.offset(.boneIndices));
    _boneWeights.ptr = p.readPtr(struct.offset(.boneWeights));
    _animVertices.ptr = p.readPtr(struct.offset(.animVertices));
    _animNormals.ptr = p.readPtr(struct.offset(.animNormals));
    _vaoId = p.readUnsignedInt(struct.offset(.vaoId));
    _vboId.ptr = p.readPtr(struct.offset(.vboId));
    
    _vertices.onPointer((p) => _vertices.raw = p.readArray(verticesCount));
    _texcoords.onPointer((p) => _texcoords.raw = p.readArray(texcoordsCount));
    _texcoords2.onPointer((p) => _texcoords2.raw = p.readArray(texcoords2Count));
    _normals.onPointer((p) => _normals.raw = p.readArray(normalsCount));
    _tangents.onPointer((p) => _tangents.raw = p.readArray(tangentsCount));
    _colors.onPointer((p) => _colors.raw = p.readArray(colorsCount));
    _indices.onPointer((p) => _indices.raw = p.readArray(indicesCount));
    _boneIndices.onPointer((p) => _boneIndices.raw = p.readArray(boneIndicesCount));
    _boneWeights.onPointer((p) => _boneWeights.raw = p.readArray(boneWeightsCount));
    _animVertices.onPointer((p) => _animVertices.raw = p.readArray(animVerticesCount));
    _animNormals.onPointer((p) => _animNormals.raw = p.readArray(animNormalsCount));
    _vboId.onPointer((p) => _vboId.raw = p.readArray(vboIdCount));
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