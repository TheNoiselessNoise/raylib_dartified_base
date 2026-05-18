part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [RlDrawCallBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RlDrawCallBase<X extends RlDrawCallBase<X>> on RaylibStructObjectBase<X> {
  abstract int mode;
  abstract int vertexCount;
  abstract int vertexAlignment;
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
  
  abstract int bufferCount;
  abstract int currentBuffer;
  abstract RaylibLiveList<V> vertexBuffer;
  abstract RaylibLiveList<D> draws;
  abstract int drawCounter;
  abstract double currentDepth;

  @override
  String signature() => '$structName(bufferCount: $bufferCount, currentBuffer: $currentBuffer, drawCounter: $drawCounter, currentDepth: $currentDepth)';
}

/// Backend-agnostic contract for [RlVertexBufferBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RlVertexBufferBase<X extends RlVertexBufferBase<X>> on RaylibStructObjectBase<X> {
  abstract int elementCount;
  abstract RaylibLiveList<double> vertices;
  abstract RaylibLiveList<double> texcoords;
  abstract RaylibLiveList<double> normals;
  abstract RaylibLiveList<int> colors;
  abstract RaylibLiveList<int> indices;
  abstract int vaoId;
  abstract RaylibLiveList<int> vboId;

  static int BASE_verticesCount(int elementCount) => elementCount > 0 ? elementCount * 3 : 0;
  static int BASE_texcoordsCount(int elementCount) => elementCount > 0 ? elementCount * 2 : 0;
  static int BASE_normalsCount(int elementCount) => elementCount > 0 ? elementCount * 3 : 0;
  static int BASE_colorsCount(int elementCount) => elementCount > 0 ? elementCount * 4 : 0;
  static int BASE_indicesCount(int elementCount) => elementCount;
  static int get BASE_vboIdCount => 5;

  int get verticesCount => BASE_verticesCount(elementCount);
  int get texcoordsCount => BASE_texcoordsCount(elementCount);
  int get normalsCount => BASE_normalsCount(elementCount);
  int get colorsCount => BASE_colorsCount(elementCount);
  int get indicesCount => BASE_indicesCount(elementCount);
  int get vboIdCount => BASE_vboIdCount;

  @override
  String signature() => '$structName(elementCount: $elementCount, vaoId: $vaoId, vboId: $vboId)';
}