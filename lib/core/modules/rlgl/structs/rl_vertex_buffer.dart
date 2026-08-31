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

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RlVertexBufferField> struct = .aligned({
    .elementCount: RInt32(), // Number of elements in the buffer (QUADS)
    .vertices:     RPointer(RFloat()), // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    .texcoords:    RPointer(RFloat()), // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    .normals:      RPointer(RFloat()), // Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
    .colors:       RPointer(RUint8()), // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    .indices: switch (currentRaylibPlatform) {
      .native   => RPointer(RUnsignedInt()), // Vertex indices (in case vertex data comes indexed) (6 indices per quad)
      .web      => RPointer(RUnsignedShort()), // Vertex indices (in case vertex data comes indexed) (6 indices per quad)
    },
    .vaoId:        RUnsignedInt(), // OpenGL Vertex Array Object id
    .vboId:        RArray(RUnsignedInt(), BASE_vboIdCount), // OpenGL Vertex Buffer Objects id (5 types of vertex data)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RlVertexBufferD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, RlVertexBufferD.new, RlVertexBufferD.pointer);

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
  int get elementCount {
    structOnOp((p) => _elementCount = p.readInt32(struct.offset(.elementCount)));
    return _elementCount;
  }
  set elementCount(int value) {
    _elementCount = value;
    structOnOp((p) => p.writeInt32(value, struct.offset(.elementCount)));
  }
  
  late LiveListPointerScalar<double, RFloat> _vertices;
  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  LiveListPointerScalar<double, RFloat> get vertices {
    structOnOp((p) => _vertices.ptr = p.readPtr(struct.offset(.vertices)));
    return _vertices;
  }
  set vertices(List<double> value) {
    assert(value.length <= verticesCount);
    structOnOp((p) => _vertices.ptr = p.readPtr(struct.offset(.vertices)));
    _vertices.inner = value;
  }

  late LiveListPointerScalar<double, RFloat> _texcoords;
  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  LiveListPointerScalar<double, RFloat> get texcoords {
    structOnOp((p) => _texcoords.ptr = p.readPtr(struct.offset(.texcoords)));
    return _texcoords;
  }
  set texcoords(List<double> value) {
    assert(value.length <= texcoordsCount);
    structOnOp((p) => _texcoords.ptr = p.readPtr(struct.offset(.texcoords)));
    _texcoords.inner = value;
  }

  late LiveListPointerScalar<double, RFloat> _normals;
  /// Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
  LiveListPointerScalar<double, RFloat> get normals {
    structOnOp((p) => _normals.ptr = p.readPtr(struct.offset(.normals)));
    return _normals;
  }
  set normals(List<double> value) {
    assert(value.length <= normalsCount);
    structOnOp((p) => _normals.ptr = p.readPtr(struct.offset(.normals)));
    _normals.inner = value;
  }

  late LiveListPointerScalar<int, RUint8> _colors;
  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  LiveListPointerScalar<int, RUint8> get colors {
    structOnOp((p) => _colors.ptr = p.readPtr(struct.offset(.colors)));
    return _colors;
  }
  set colors(List<int> value) {
    assert(value.length <= colorsCount);
    structOnOp((p) => _colors.ptr = p.readPtr(struct.offset(.colors)));
    _colors.inner = value;
  }
  
  late LiveListPointerScalar<int, RVoid> _indices;
  /// Vertex indices (in case vertex data comes indexed) (6 indices per quad)
  LiveListPointerScalar<int, RVoid> get indices {
    structOnOp((p) => _indices.ptr = p.readPtr(struct.offset(.indices)));
    return _indices;
  }
  set indices(List<int> value) {
    assert(value.length <= indicesCount);
    structOnOp((p) => _indices.ptr = p.readPtr(struct.offset(.indices)));
    _indices.inner = value;
  }

  int _vaoId;
  /// OpenGL Vertex Array Object id
  int get vaoId {
    structOnOp((p) => _vaoId = p.readUnsignedInt(struct.offset(.vaoId)));
    return _vaoId;
  }
  set vaoId(int value) {
    _vaoId = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.vaoId)));
  }
  
  late LiveListInlineScalar<int, RUnsignedInt> _vboId;
  /// OpenGL Vertex Buffer Objects id (5 types of vertex data)
  LiveListInlineScalar<int, RUnsignedInt> get vboId => _vboId;
  set vboId(List<int> value) {
    assert(value.length <= vboIdCount);
    _vboId.inner = value;
  }

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
    _vertices = .new(
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      vertices ?? .filled(verticesCount, 0),
      op?.offsetBy(struct.offset(.vertices)),
    );

    _texcoords = .new(
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      texcoords ?? .filled(texcoordsCount, 0),
      op?.offsetBy(struct.offset(.texcoords)),
    );

    _normals = .new(
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      normals ?? .filled(normalsCount, 0),
      op?.offsetBy(struct.offset(.normals)),
    );

    _colors = .new(
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      colors ?? .filled(colorsCount, 0),
      op?.offsetBy(struct.offset(.colors)),
    );

    _indices = .new(
      (p, i) => switch (currentRaylibPlatform) {
        .native => p.cast<RUnsignedInt>()[i],
        .web => p.cast<RUnsignedShort>()[i],
      },
      (p, i, v) => switch (currentRaylibPlatform) {
        .native => p.cast<RUnsignedInt>()[i] = v,
        .web => p.cast<RUnsignedShort>()[i] = v,
      }, 
      indices ?? .filled(indicesCount, 0),
      op?.offsetBy(struct.offset(.indices)),
    );

    _vboId = .new(
      () => op?.cast(),
      struct.offset(.vboId),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      vboId ?? .filled(vboIdCount, 0),
    );
  }

  factory RlVertexBufferD.zero() => .new();

  @override
  RlVertexBufferD setD(RlVertexBufferD o) {
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
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeInt32(_elementCount, struct.offset(.elementCount));
    p.writePtr(_vertices.ptr, struct.offset(.vertices));
    p.writePtr(_texcoords.ptr, struct.offset(.texcoords));
    p.writePtr(_normals.ptr, struct.offset(.normals));
    p.writePtr(_colors.ptr, struct.offset(.colors));
    p.writePtr(_indices.ptr, struct.offset(.indices));
    p.writeUnsignedInt(_vaoId, struct.offset(.vaoId));
    p.offsetBy(struct.offset(.vboId)).cast<RUnsignedInt>().writeArray(_vboId);

    _vertices.onPointer((p) => p.writeArray(_vertices.inner));
    _texcoords.onPointer((p) => p.writeArray(_texcoords.inner));
    _normals.onPointer((p) => p.writeArray(_normals.inner));
    _colors.onPointer((p) => p.writeArray(_colors.inner));
    _indices.onPointer((p) => switch (currentRaylibPlatform) {
      .native => p.cast<RUnsignedInt>().writeArray(_indices.inner),
      .web => p.cast<RUnsignedShort>().writeArray(_indices.inner),
    });
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _elementCount = p.readInt32(struct.offset(.elementCount));
    _vertices.ptr = p.readPtr(struct.offset(.vertices));
    _texcoords.ptr = p.readPtr(struct.offset(.texcoords));
    _normals.ptr = p.readPtr(struct.offset(.normals));
    _colors.ptr = p.readPtr(struct.offset(.colors));
    _indices.ptr = p.readPtr(struct.offset(.indices));
    _vaoId = p.readUnsignedInt(struct.offset(.vaoId));
    _vboId.raw = p.offsetBy(struct.offset(.vboId)).cast<RUnsignedInt>().readArray(vboIdCount);

    _vertices.onPointer((p) => _vertices.raw = p.readArray(verticesCount));
    _texcoords.onPointer((p) => _texcoords.raw = p.readArray(texcoordsCount));
    _normals.onPointer((p) => _normals.raw = p.readArray(normalsCount));
    _colors.onPointer((p) => _colors.raw = p.readArray(colorsCount));
    _indices.onPointer((p) => _indices.raw = switch (currentRaylibPlatform) {
      .native => p.cast<RUnsignedInt>().readArray(indicesCount),
      .web => p.cast<RUnsignedShort>().readArray(indicesCount),
    });
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