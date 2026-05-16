part of '../../raylib_dartified_base.dart';

mixin RlDrawCallBase {
  int get mode;
  int get vertexCount;
  int get vertexAlignment;
  int get textureId;
}

mixin RlRenderBatchBase {
  int get bufferCount;
  int get currentBuffer;
  List<RlVertexBufferBase> get vertexBuffers;
  List<RlDrawCallBase> get draws;
  int get drawCounter;
  double get currentDepth;
}

mixin RlVertexBufferBase {
  int get elementCount;
  List<double> get vertices;
  List<double> get texcoords;
  List<double> get normals;
  List<int> get colors;
  List<int> get indices;
  int get vaoId;
  List<int> get vboId;

  int get vboIdCount => 5;
  int get verticesCount => elementCount > 0 ? elementCount * 3 : 0;
  int get texcoordsCount => elementCount > 0 ? elementCount * 2 : 0;
  int get normalsCount => elementCount > 0 ? elementCount * 3 : 0;
  int get colorsCount => elementCount > 0 ? elementCount * 4 : 0;
  int get indicesCount => elementCount;
}