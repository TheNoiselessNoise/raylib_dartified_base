part of '../../../raylib_dartified_base.dart';

enum RlVertexBufferField {
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

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<RlVertexBufferField> structLayout = .aligned(structFields);
  static final Map<RlVertexBufferField, RType> structFields = {
    .elementCount: RInt32(),
    .vertices:     RPointer<RFloat32>(),
    .texcoords:    RPointer<RFloat32>(),
    .normals:      RPointer<RFloat32>(),
    .colors:       RPointer<RUint8>(),
    .indices:      RPointer<RUint32>(),
    .vaoId:        RUint32(),
    .vboId:        RUint32(BASE_vboIdCount),
  };

  static StructPointer<RlVertexBufferD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RlVertexBufferD.new);

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
    structOnOp((p) => _elementCount = p.readInt32(structLayout.offset(.elementCount)));
    return _elementCount;
  }
  set elementCount(int value) {
    _elementCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.elementCount)));
  }
  
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

  late LiveListPointerScalar<double, RFloat32> _normals;
  /// Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
  LiveListPointerScalar<double, RFloat32> get normals {
    structOnOp((p) => _normals.ptr = p.readPtr(structLayout.offset(.normals)));
    return _normals;
  }
  set normals(List<double> value) {
    assert(value.length <= normalsCount);
    structOnOp((p) => _normals.ptr = p.readPtr(structLayout.offset(.normals)));
    _normals.inner = value;
  }

  late LiveListPointerScalar<int, RUint8> _colors;
  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  LiveListPointerScalar<int, RUint8> get colors {
    structOnOp((p) => _colors.ptr = p.readPtr(structLayout.offset(.colors)));
    return _colors;
  }
  set colors(List<int> value) {
    assert(value.length <= colorsCount);
    structOnOp((p) => _colors.ptr = p.readPtr(structLayout.offset(.colors)));
    _colors.inner = value;
  }
  
  late LiveListPointerScalar<int, RUint32> _indices;
  /// Vertex indices (in case vertex data comes indexed) (6 indices per quad)
  LiveListPointerScalar<int, RUint32> get indices {
    structOnOp((p) => _indices.ptr = p.readPtr(structLayout.offset(.indices)));
    return _indices;
  }
  set indices(List<int> value) {
    assert(value.length <= indicesCount);
    structOnOp((p) => _indices.ptr = p.readPtr(structLayout.offset(.indices)));
    _indices.inner = value;
  }

  int _vaoId;
  /// OpenGL Vertex Array Object id
  int get vaoId {
    structOnOp((p) => _vaoId = p.readUint32(structLayout.offset(.vaoId)));
    return _vaoId;
  }
  set vaoId(int value) {
    _vaoId = value;
    structOnOp((p) => p.writeUint32(value, structLayout.offset(.vaoId)));
  }
  
  late LiveListInlineScalar<int, RUint32> _vboId;
  /// OpenGL Vertex Buffer Objects id (5 types of vertex data)
  LiveListInlineScalar<int, RUint32> get vboId => _vboId;
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
      vertices ?? .filled(verticesCount, 0), RFloat32.scalarByteSize,
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.vertices)),
    );

    _texcoords = .new(
      texcoords ?? .filled(texcoordsCount, 0), RFloat32.scalarByteSize,
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.texcoords)),
    );

    _normals = .new(
      normals ?? .filled(normalsCount, 0), RFloat32.scalarByteSize,
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.normals)),
    );

    _colors = .new(
      colors ?? .filled(colorsCount, 0), RUint8.scalarByteSize,
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.colors)),
    );

    _indices = .new(
      indices ?? .filled(indicesCount, 0), RUint16.scalarByteSize,
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.indices)),
    );

    _vboId = .new(
      vboId ?? .filled(vboIdCount, 0),
      () => op?.cast(),
      structLayout.offset(.vboId),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
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
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeInt32(_elementCount, structLayout.offset(.elementCount));
    p.writePtr(_vertices.ptr, structLayout.offset(.vertices));
    p.writePtr(_texcoords.ptr, structLayout.offset(.texcoords));
    p.writePtr(_normals.ptr, structLayout.offset(.normals));
    p.writePtr(_colors.ptr, structLayout.offset(.colors));
    p.writePtr(_indices.ptr, structLayout.offset(.indices));
    p.writeUint32(_vaoId, structLayout.offset(.vaoId));
    p.offsetBy(structLayout.offset(.vboId)).cast<RUint32>().writeArray(_vboId);

    _vertices.onPointer((p) => p.writeArray(_vertices.inner));
    _texcoords.onPointer((p) => p.writeArray(_texcoords.inner));
    _normals.onPointer((p) => p.writeArray(_normals.inner));
    _colors.onPointer((p) => p.writeArray(_colors.inner));
    _indices.onPointer((p) => p.writeArray(_indices.inner));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _elementCount = p.readInt32(structLayout.offset(.elementCount));
    _vertices.ptr = p.readPtr(structLayout.offset(.vertices));
    _texcoords.ptr = p.readPtr(structLayout.offset(.texcoords));
    _normals.ptr = p.readPtr(structLayout.offset(.normals));
    _colors.ptr = p.readPtr(structLayout.offset(.colors));
    _indices.ptr = p.readPtr(structLayout.offset(.indices));
    _vaoId = p.readUint32(structLayout.offset(.vaoId));
    _vboId.raw = p.offsetBy(structLayout.offset(.vboId)).cast<RUint32>().readArray(vboIdCount);

    _vertices.onPointer((p) => _vertices.raw = p.readArray(verticesCount));
    _texcoords.onPointer((p) => _texcoords.raw = p.readArray(texcoordsCount));
    _normals.onPointer((p) => _normals.raw = p.readArray(normalsCount));
    _colors.onPointer((p) => _colors.raw = p.readArray(colorsCount));
    _indices.onPointer((p) => _indices.raw = p.readArray(indicesCount));
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