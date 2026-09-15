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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<RlVertexBufferD> struct = .new(
    factory: RlVertexBufferD.new,
    layout: .aligned<RlVertexBufferField>({
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
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<RlVertexBufferField> structLayout = struct.layoutOf();

  /// Field descriptor for [elementCount].
  static final field_elementCount = structLayout.scalar<int, RInt>(.elementCount);
  /// Field descriptor for [vertices].
  static final field_vertices = structLayout.pointerScalarArray<double, RFloat>(.vertices);
  /// Field descriptor for [texcoords].
  static final field_texcoords = structLayout.pointerScalarArray<double, RFloat>(.texcoords);
  /// Field descriptor for [normals].
  static final field_normals = structLayout.pointerScalarArray<double, RFloat>(.normals);
  /// Field descriptor for [colors].
  static final field_colors = structLayout.pointerScalarArray<int, RUnsignedChar>(.colors);
  /// Field descriptor for [indices].
  static final field_indices = switch (currentRaylibPlatform) {
    .native => structLayout.pointerScalarArray<int, RUnsignedInt>(.indices),
    .web    => structLayout.pointerScalarArray<int, RUnsignedShort>(.indices),
  };
  /// Field descriptor for [vaoId].
  static final field_vaoId = structLayout.scalar<int, RUnsignedInt>(.vaoId);
  /// Field descriptor for [vboId].
  static final field_vboId = structLayout.scalarArray<int, RUnsignedInt>(.vboId);

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
  int get elementCount => _elementCount = field_elementCount.readOr(op, _elementCount);
  set elementCount(int value) => _elementCount = field_elementCount.writeOr(op, value);

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
  int get vaoId => _vaoId = field_vaoId.readOr(op, _vaoId);
  set vaoId(int value) => _vaoId = field_vaoId.writeOr(op, value);
  
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
    _vertices = field_vertices.live(() => op, vertices ?? .filled(verticesCount, 0));
    _texcoords = field_texcoords.live(() => op, texcoords ?? .filled(texcoordsCount, 0));
    _normals = field_normals.live(() => op, normals ?? .filled(normalsCount, 0));
    _colors = field_colors.live(() => op, colors ?? .filled(colorsCount, 0));
    _indices = field_indices.live(() => op, indices ?? .filled(indicesCount, 0));
    _vboId = field_vboId.live(() => op, vboId ?? .filled(vboIdCount, 0));
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
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_vertices.allocate(temp, p, '${key}_vertices', count: verticesCount, raw: true);
    field_texcoords.allocate(temp, p, '${key}_texcoords', count: texcoordsCount, raw: true);
    field_normals.allocate(temp, p, '${key}_normals', count: normalsCount, raw: true);
    field_colors.allocate(temp, p, '${key}_colors', count: colorsCount, raw: true);
    field_indices.allocate(temp, p, '${key}_indices', count: indicesCount, raw: true);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_elementCount.write(p, _elementCount);
    _vertices.writeInto(p);
    _texcoords.writeInto(p);
    _normals.writeInto(p);
    _colors.writeInto(p);
    _indices.writeInto(p);
    field_vaoId.write(p, _vaoId);
    _vboId.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _elementCount = field_elementCount.read(p);
    _vertices.readFrom(p, count: verticesCount);
    _texcoords.readFrom(p, count: texcoordsCount);
    _normals.readFrom(p, count: normalsCount);
    _colors.readFrom(p, count: colorsCount);
    _indices.readFrom(p, count: indicesCount);
    _vaoId = field_vaoId.read(p);
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