part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [RlDrawCallBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RlDrawCallBase<X extends RlDrawCallBase<X>> on RaylibStructObjectBase<X> {
  
  /// Drawing mode
  abstract RlDrawMode mode;
  
  /// Number of vertex of the draw
  abstract int vertexCount;
  
  /// Number of vertex required for index alignment (LINES, TRIANGLES)
  abstract int vertexAlignment;
  
  /// Texture id to be used on the draw. Use to create new draw call if changes.
  abstract int textureId;

  @override
  String signature() => '$structName(mode: $mode, vertexCount: $vertexCount, textureId: $textureId)';
}

/// Backend-agnostic contract for [RlRenderBatchBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RlRenderBatchBase<
  X extends RlRenderBatchBase<X, V, D>,
  V extends RlVertexBufferBase<V>,
  D extends RlDrawCallBase<D>
> on RaylibStructObjectBase<X> {
  
  /// Number of vertex buffers (multi-buffering support)
  abstract int bufferCount;

  /// Current buffer tracking in case of multi-buffering
  abstract int currentBuffer;

  /// Dynamic buffer(s) for vertex data
  abstract RaylibLiveList<V> vertexBuffer;

  /// Draw calls array, depends on textureId
  abstract RaylibLiveList<D> draws;

  /// Draw calls counter
  abstract int drawCounter;

  /// Current depth value for next draw
  abstract double currentDepth;

  @override
  String signature() => '$structName(bufferCount: $bufferCount, currentBuffer: $currentBuffer, drawCounter: $drawCounter, currentDepth: $currentDepth)';
}

/// Backend-agnostic contract for [RlVertexBufferBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RlVertexBufferBase<X extends RlVertexBufferBase<X>> on RaylibStructObjectBase<X> {
  
  /// Number of elements in the buffer (QUADS)
  abstract int elementCount;

  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  abstract RaylibLiveList<double> vertices;

  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  abstract RaylibLiveList<double> texcoords;

  /// Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
  abstract RaylibLiveList<double> normals;

  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  abstract RaylibLiveList<int> colors;

  /// Vertex indices (in case vertex data comes indexed) (6 indices per quad)
  /// 
  /// Native: `int`, WASM: `short`
  abstract RaylibLiveList<int> indices;

  /// OpenGL Vertex Array Object id
  abstract int vaoId;

  /// OpenGL Vertex Buffer Objects id (5 types of vertex data)
  abstract RaylibLiveList<int> vboId;

  /// Number of components in the `vertices` buffer.
  static int BASE_verticesCount(int elementCount) => elementCount > 0 ? elementCount * 3 : 0;
  
  /// Number of components in the `texcoords` buffer.
  static int BASE_texcoordsCount(int elementCount) => elementCount > 0 ? elementCount * 2 : 0;
  
  /// Number of components in the `normals` buffer.
  static int BASE_normalsCount(int elementCount) => elementCount > 0 ? elementCount * 3 : 0;
  
  /// Number of components in the `colors` buffer.
  static int BASE_colorsCount(int elementCount) => elementCount > 0 ? elementCount * 4 : 0;
  
  /// Number of components in the `indices` buffer.
  static int BASE_indicesCount(int elementCount) => elementCount > 0 ? elementCount * 6 : 0;
  
  /// Number of components in the `vboId` array.
  static int get BASE_vboIdCount => 5;

  /// Expected length of [vertices].
  int get verticesCount => BASE_verticesCount(elementCount);

  /// Expected length of [texcoords].
  int get texcoordsCount => BASE_texcoordsCount(elementCount);

  /// Expected length of [normals].
  int get normalsCount => BASE_normalsCount(elementCount);

  /// Expected length of [colors].
  int get colorsCount => BASE_colorsCount(elementCount);

  /// Expected length of [indices].
  int get indicesCount => BASE_indicesCount(elementCount);

  /// Expected length of [vboId].
  int get vboIdCount => BASE_vboIdCount;

  @override
  String signature() => '$structName(elementCount: $elementCount, vaoId: $vaoId, vboId: $vboId)';
}