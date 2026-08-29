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

/// Vertex data and vao/vbo.
class MeshD extends RaylibStruct<MeshD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<MeshField> structLayout = .aligned({
    .vertexCount:   RInt32(),
    .triangleCount: RInt32(),
    .vertices:      RPointer<RFloat32>(),
    .texcoords:     RPointer<RFloat32>(),
    .texcoords2:    RPointer<RFloat32>(),
    .normals:       RPointer<RFloat32>(),
    .tangents:      RPointer<RFloat32>(),
    .colors:        RPointer<RUnsignedChar>(),
    .indices:       RPointer<RUnsignedShort>(),
    .boneCount:     RInt32(),
    .boneIndices:   RPointer<RUnsignedChar>(),
    .boneWeights:   RPointer<RFloat32>(),
    .animVertices:  RPointer<RFloat32>(),
    .animNormals:   RPointer<RFloat32>(),
    .vaoId:         RUnsignedInt(),
    .vboId:         RPointer<RUnsignedInt>(),
  });

  static StructPointer<MeshD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, MeshD.new, MeshD.pointer);

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
  static int get BASE_vboIdCount => RaylibConfig.vboIdCount;

  /// Expected length of [vboId].
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
  int get vertexCount {
    structOnOp((p) => _vertexCount = p.readInt32(structLayout.offset(.vertexCount)));
    return _vertexCount;
  }
  set vertexCount(int value) {
    _vertexCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.vertexCount)));
  }
  
  int _triangleCount;
  /// Number of triangles stored (indexed or not)
  int get triangleCount {
    structOnOp((p) => _triangleCount = p.readInt32(structLayout.offset(.triangleCount)));
    return _triangleCount;
  }
  set triangleCount(int value) {
    _triangleCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.triangleCount)));
  }

  // Vertex attributes data
  
  late LiveListPointerScalar<double, RFloat32> _vertices;
  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  LiveListPointerScalar<double, RFloat32> get vertices {
    structOnOp((p) => _vertices.ptr = p.readPtr(structLayout.offset(.vertices)));
    return _vertices;
  }
  set vertices(List<double> value) {
    assert(value.length <= verticesCount);
    structOnOp((p) => _vertices.ptr = p.readPtr(structLayout.offset(.vertices)));
    _vertices.inner = value;
  }
  
  late LiveListPointerScalar<double, RFloat32> _texcoords;
  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  LiveListPointerScalar<double, RFloat32> get texcoords {
    structOnOp((p) => _texcoords.ptr = p.readPtr(structLayout.offset(.texcoords)));
    return _texcoords;
  }
  set texcoords(List<double> value) {
    assert(value.length <= texcoordsCount);
    structOnOp((p) => _texcoords.ptr = p.readPtr(structLayout.offset(.texcoords)));
    _texcoords.inner = value;
  }

  late LiveListPointerScalar<double, RFloat32> _texcoords2;
  /// Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
  LiveListPointerScalar<double, RFloat32> get texcoords2 {
    structOnOp((p) => _texcoords2.ptr = p.readPtr(structLayout.offset(.texcoords2)));
    return _texcoords2;
  }
  set texcoords2(List<double> value) {
    assert(value.length <= texcoords2Count);
    structOnOp((p) => _texcoords2.ptr = p.readPtr(structLayout.offset(.texcoords2)));
    _texcoords2.inner = value;
  }

  late LiveListPointerScalar<double, RFloat32> _normals;
  /// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
  LiveListPointerScalar<double, RFloat32> get normals {
    structOnOp((p) => _normals.ptr = p.readPtr(structLayout.offset(.normals)));
    return _normals;
  }
  set normals(List<double> value) {
    assert(value.length <= normalsCount);
    structOnOp((p) => _normals.ptr = p.readPtr(structLayout.offset(.normals)));
    _normals.inner = value;
  }

  late LiveListPointerScalar<double, RFloat32> _tangents;
  /// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
  LiveListPointerScalar<double, RFloat32> get tangents {
    structOnOp((p) => _tangents.ptr = p.readPtr(structLayout.offset(.tangents)));
    return _tangents;
  }
  set tangents(List<double> value) {
    assert(value.length <= tangentsCount);
    structOnOp((p) => _tangents.ptr = p.readPtr(structLayout.offset(.tangents)));
    _tangents.inner = value;
  }

  late LiveListPointerScalar<int, RUnsignedChar> _colors;
  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  LiveListPointerScalar<int, RUnsignedChar> get colors {
    structOnOp((p) => _colors.ptr = p.readPtr(structLayout.offset(.colors)));
    return _colors;
  }
  set colors(List<int> value) {
    assert(value.length <= colorsCount);
    structOnOp((p) => _colors.ptr = p.readPtr(structLayout.offset(.colors)));
    _colors.inner = value;
  }

  late LiveListPointerScalar<int, RUnsignedShort> _indices;
  /// Vertex indices (in case vertex data comes indexed)
  LiveListPointerScalar<int, RUnsignedShort> get indices {
    structOnOp((p) => _indices.ptr = p.readPtr(structLayout.offset(.indices)));
    return _indices;
  }
  set indices(List<int> value) {
    assert(value.length <= indicesCount);
    structOnOp((p) => _indices.ptr = p.readPtr(structLayout.offset(.indices)));
    _indices.inner = value;
  }

  // Skin data for animation

  int _boneCount;
  // Number of bones (MAX: 256 bones)
  int get boneCount {
    structOnOp((p) => _boneCount = p.readInt32(structLayout.offset(.boneCount)));
    return _boneCount;
  }
  set boneCount(int value) {
    _boneCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.boneCount)));
  }

  late LiveListPointerScalar<int, RUnsignedChar> _boneIndices;
  /// Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6)
  LiveListPointerScalar<int, RUnsignedChar> get boneIndices {
    structOnOp((p) => _boneIndices.ptr = p.readPtr(structLayout.offset(.boneIndices)));
    return _boneIndices;
  }
  set boneIndices(List<int> value) {
    assert(value.length <= boneIndicesCount);
    structOnOp((p) => _boneIndices.ptr = p.readPtr(structLayout.offset(.boneIndices)));
    _boneIndices.inner = value;
  }
  
  late LiveListPointerScalar<double, RFloat32> _boneWeights;
  /// Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)
  LiveListPointerScalar<double, RFloat32> get boneWeights {
    structOnOp((p) => _boneWeights.ptr = p.readPtr(structLayout.offset(.boneWeights)));
    return _boneWeights;
  }
  set boneWeights(List<double> value) {
    assert(value.length <= boneWeightsCount);
    structOnOp((p) => _boneWeights.ptr = p.readPtr(structLayout.offset(.boneWeights)));
    _boneWeights.inner = value;
  }

  // Animation vertex data

  late LiveListPointerScalar<double, RFloat32> _animVertices;
  /// Animated vertex positions (after bones transformations)
  LiveListPointerScalar<double, RFloat32> get animVertices {
    structOnOp((p) => _animVertices.ptr = p.readPtr(structLayout.offset(.animVertices)));
    return _animVertices;
  }
  set animVertices(List<double> value) {
    assert(value.length <= animVerticesCount);
    structOnOp((p) => _animVertices.ptr = p.readPtr(structLayout.offset(.animVertices)));
    _animVertices.inner = value;
  }

  late LiveListPointerScalar<double, RFloat32> _animNormals;
  /// Animated normals (after bones transformations)
  LiveListPointerScalar<double, RFloat32> get animNormals {
    structOnOp((p) => _animNormals.ptr = p.readPtr(structLayout.offset(.animNormals)));
    return _animNormals;
  }
  set animNormals(List<double> value) {
    assert(value.length <= animNormalsCount);
    structOnOp((p) => _animNormals.ptr = p.readPtr(structLayout.offset(.animNormals)));
    _animNormals.inner = value;
  }

  int _vaoId;
  /// OpenGL Vertex Array Object id
  int get vaoId {
    structOnOp((p) => _vaoId = p.readUnsignedInt(structLayout.offset(.vaoId)));
    return _vaoId;
  }
  set vaoId(int value) {
    _vaoId = value;
    structOnOp((p) => p.writeUnsignedInt(value, structLayout.offset(.vaoId)));
  }
  
  late LiveListPointerScalar<int, RUnsignedInt> _vboId;
  /// OpenGL Vertex Buffer Objects id (default vertex data)
  LiveListPointerScalar<int, RUnsignedInt> get vboId {
    structOnOp((p) => _vboId.ptr = p.readPtr(structLayout.offset(.vboId)));
    return _vboId;
  }
  set vboId(List<int> value) {
    assert(value.length <= vboIdCount);
    structOnOp((p) => _vboId.ptr = p.readPtr(structLayout.offset(.vboId)));
    _vboId.inner = value;
  }

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
    _vertices = .new(
      vertices ?? .filled(verticesCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.vertices)),
    );

    _texcoords = .new(
      texcoords ?? .filled(texcoordsCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.texcoords)),
    );

    _texcoords2 = .new(
      texcoords2 ?? .filled(texcoords2Count, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.texcoords2)),
    );

    _normals = .new(
      normals ?? .filled(normalsCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.normals)),
    );

    _tangents = .new(
      tangents ?? .filled(tangentsCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.tangents)),
    );

    _colors = .new(
      colors ?? .filled(colorsCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.colors)),
    );

    _indices = .new(
      indices ?? .filled(indicesCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.indices)),
    );

    _boneIndices = .new(
      boneIndices ?? .filled(boneIndicesCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.boneIndices)),
    );

    _boneWeights = .new(
      boneWeights ?? .filled(boneWeightsCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.boneWeights)),
    );

    _animVertices = .new(
      animVertices ?? .filled(animVerticesCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.animVertices)),
    );

    _animNormals = .new(
      animNormals ?? .filled(animNormalsCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.animNormals)),
    );

    _vboId = .new(
      vboId ?? .filled(vboIdCount, 0),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.vboId)),
    );
  }

  factory MeshD.zero() => .new();

  @override
  MeshD setD(MeshD o) {
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
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {
    if (_vertices.inner.isNotEmpty) {
      _vertices.ptr = temp.Float32$.RawArray(_vertices.inner);
    }
    if (_texcoords.inner.isNotEmpty) {
      _texcoords.ptr = temp.Float32$.RawArray(_texcoords.inner);
    }
    if (_texcoords2.inner.isNotEmpty) {
      _texcoords2.ptr = temp.Float32$.RawArray(_texcoords2.inner);
    }
    if (_normals.inner.isNotEmpty) {
      _normals.ptr = temp.Float32$.RawArray(_normals.inner);
    }
    if (_tangents.inner.isNotEmpty) {
      _tangents.ptr = temp.Float32$.RawArray(_tangents.inner);
    }
    if (_colors.inner.isNotEmpty) {
      _colors.ptr = temp.Uint8$.RawArray(_colors.inner);
    }
    if (_indices.inner.isNotEmpty) {
      _indices.ptr = temp.Uint16$.RawArray(_indices.inner);
    }
    if (_boneIndices.inner.isNotEmpty) {
      _boneIndices.ptr = temp.Uint8$.RawArray(_boneIndices.inner);
    }
    if (_boneWeights.inner.isNotEmpty) {
      _boneWeights.ptr = temp.Float32$.RawArray(_boneWeights.inner);
    }
    if (_animVertices.inner.isNotEmpty) {
      _animVertices.ptr = temp.Float32$.RawArray(_animVertices.inner);
    }
    if (_animNormals.inner.isNotEmpty) {
      _animNormals.ptr = temp.Float32$.RawArray(_animNormals.inner);
    }
    _vboId.ptr = MemoryPointer.nullptr.cast();
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeInt32(_vertexCount, structLayout.offset(.vertexCount));
    p.writeInt32(_triangleCount, structLayout.offset(.triangleCount));
    p.writePtr(_vertices.ptr, structLayout.offset(.vertices));
    p.writePtr(_texcoords.ptr, structLayout.offset(.texcoords));
    p.writePtr(_texcoords2.ptr, structLayout.offset(.texcoords2));
    p.writePtr(_normals.ptr, structLayout.offset(.normals));
    p.writePtr(_tangents.ptr, structLayout.offset(.tangents));
    p.writePtr(_colors.ptr, structLayout.offset(.colors));
    p.writePtr(_indices.ptr, structLayout.offset(.indices));
    p.writeInt32(_boneCount, structLayout.offset(.boneCount));
    p.writePtr(_boneIndices.ptr, structLayout.offset(.boneIndices));
    p.writePtr(_boneWeights.ptr, structLayout.offset(.boneWeights));
    p.writePtr(_animVertices.ptr, structLayout.offset(.animVertices));
    p.writePtr(_animNormals.ptr, structLayout.offset(.animNormals));
    p.writeUnsignedInt(_vaoId, structLayout.offset(.vaoId));
    p.writePtr(_vboId.ptr, structLayout.offset(.vboId));

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
  void structReadFrom(MemoryPointer<RStruct> p) {
    _vertexCount = p.readInt32(structLayout.offset(.vertexCount));
    _triangleCount = p.readInt32(structLayout.offset(.triangleCount));
    _vertices.ptr = p.readPtr(structLayout.offset(.vertices));
    _texcoords.ptr = p.readPtr(structLayout.offset(.texcoords));
    _texcoords2.ptr = p.readPtr(structLayout.offset(.texcoords2));
    _normals.ptr = p.readPtr(structLayout.offset(.normals));
    _tangents.ptr = p.readPtr(structLayout.offset(.tangents));
    _colors.ptr = p.readPtr(structLayout.offset(.colors));
    _indices.ptr = p.readPtr(structLayout.offset(.indices));
    _boneCount = p.readInt32(structLayout.offset(.boneCount));
    _boneIndices.ptr = p.readPtr(structLayout.offset(.boneIndices));
    _boneWeights.ptr = p.readPtr(structLayout.offset(.boneWeights));
    _animVertices.ptr = p.readPtr(structLayout.offset(.animVertices));
    _animNormals.ptr = p.readPtr(structLayout.offset(.animNormals));
    _vaoId = p.readUnsignedInt(structLayout.offset(.vaoId));
    _vboId.ptr = p.readPtr(structLayout.offset(.vboId));
    
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