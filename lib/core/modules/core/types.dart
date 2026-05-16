part of '../../raylib_dartified_base.dart';

mixin AutomationEventListBase {
  int get capacity;
  int get count;
  List<AutomationEventBase> get events;
}

mixin AutomationEventBase {
  int get frame;
  int get type;
  List<int> get params;

  int get paramCount => 4;
}

mixin BoneInfoBase {
  String get name;
  int get parent;

  int get nameLength => 32;
}

mixin BoundingBoxBase {
  Vector3Base get min;
  Vector3Base get max;
}

mixin Camera2DBase {
  Vector2Base get offset;
  Vector2Base get target;
  double get rotation;
  double get zoom;
}

mixin Camera3DBase {
  Vector3Base get position;
  Vector3Base get target;
  Vector3Base get up;
  double get fovy;
  CameraProjection get projection;
}

mixin ColorBase {
  int get r;
  int get g;
  int get b;
  int get a;
}

mixin FilePathListBase {
  int get capacity;
  int get count;
  List<String> get paths;
}

mixin FontBase {
  int get baseSize;
  int get glyphCount;
  int get glyphPadding;
  TextureBase get texture;
  List<RectangleBase> get recs;
  List<GlyphInfoBase> get glyphs;
}

mixin GlyphInfoBase {
  int get value;
  int get offsetX;
  int get offsetY;
  int get advanceX;
  ImageBase get image;
}

mixin ImageBase {
  int get width;
  int get height;
  int get mipmaps;
  PixelFormat get format;
  List<int> get data;
  int get frameCount;

  int get bytesPerPixel => switch (format) {
    .PIXELFORMAT_UNCOMPRESSED_GRAYSCALE => 1,
    .PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA => 2,
    .PIXELFORMAT_UNCOMPRESSED_R5G6B5 => 2,
    .PIXELFORMAT_UNCOMPRESSED_R8G8B8 => 3,
    .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 => 4,
    .PIXELFORMAT_UNCOMPRESSED_R32 => 4,
    .PIXELFORMAT_UNCOMPRESSED_R32G32B32 => 12,
    .PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 => 16,
    .PIXELFORMAT_UNCOMPRESSED_R16 => 2,
    .PIXELFORMAT_UNCOMPRESSED_R16G16B16 => 6,
    .PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 => 8,
    _ => throw UnsupportedError('Compressed formats have no simple bpp: $format'),
  };

  int get dataLength {
    final frameSize = this.frameSize;
    if (frameSize == 0) return 0;
    return frameSize * frameCount;
  }

  int get frameSize {
    if (width == 0 || height == 0) return 0;
    return width * height * bytesPerPixel;
  }
}

mixin MaterialMapBase {
  TextureBase get texture;
  ColorBase get color;
  double get value;
}

mixin MaterialBase {
  ShaderBase get shader;
  List<MaterialMapBase> get maps;
  List<double> get params;

  int get paramCount => 4;
  int get mapCount => 12;
}

mixin MatrixBase {
  double get m0;
  double get m1;
  double get m2;
  double get m3;
  double get m4;
  double get m5;
  double get m6;
  double get m7;
  double get m8;
  double get m9;
  double get m10;
  double get m11;
  double get m12;
  double get m13;
  double get m14;
  double get m15;

  String format([int x0 = 0])
    => '[ ${[
      [m0, m1, m2, m3].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m4, m5, m6, m7].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m8, m9, m10, m11].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m12, m13, m14, m15].map((x) => x.toStringAsFixed(x0)).join(', '),
    ].join('\n')} ]';
}

mixin MeshBase {
  int get vertexCount;
  int get triangleCount;
  int get boneCount;
  List<double> get vertices;
  List<double> get texcoords;
  List<double> get texcoords2;
  List<double> get normals;
  List<double> get tangents;
  List<int> get colors;
  List<int> get indices;
  List<double> get animVertices;
  List<double> get animNormals;
  List<int> get boneIds;
  List<double> get boneWeights;
  List<MatrixBase> get boneMatrices;
  int get vaoId;
  List<int> get vboId;

  int get verticesCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get texcoordsCount => vertexCount > 0 ? vertexCount * 2 : 0;
  int get texcoords2Count => vertexCount > 0 ? vertexCount * 2 : 0;
  int get normalsCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get tangentsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get colorsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get indicesCount => triangleCount > 0 ? triangleCount * 3 : 0;
  int get animVerticesCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get animNormalsCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get boneIdsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get boneWeightsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get boneMatricesCount => boneCount;
  int get vboIdCount => 9;
}

mixin ModelAnimationBase {
  List<BoneInfoBase> get bones;
  List<List<TransformBase>> get framePoses;
  String get name;

  int get frameCount => framePoses.length;
  int get nameLength => 32;
}

mixin ModelBase {
  MatrixBase get transform;
  List<MeshBase> get meshes;
  List<MaterialBase> get materials;
  List<int> get meshMaterial;
  List<BoneInfoBase> get bones;
  List<TransformBase> get bindPose;

  int get meshCount => meshes.length;
  int get boneCount => bones.length;
  int get materialCount => materials.length;
}

mixin NPatchInfoBase {
  RectangleBase get source;
  int get left;
  int get top;
  int get right;
  int get bottom;
  NPatchLayout get layout;
}

mixin QuaternionBase {
  double get x;
  double get y;
  double get z;
  double get w;
}

mixin RayCollisionBase {
  bool get hit;
  double get distance;
  Vector3Base get point;
  Vector3Base get normal;
}

mixin RayBase {
  Vector3Base get position;
  Vector3Base get direction;
}

mixin RectangleBase {
  double get x;
  double get y;
  double get width;
  double get height;
}

mixin RenderTextureBase {
  int get id;
  TextureBase get texture;
  TextureBase get depth;
}

mixin ShaderBase {
  int get id;
  List<int> get locs;
}

mixin TextureBase {
  int get id;
  int get width;
  int get height;
  int get mipmaps;
  PixelFormat get format;
}

mixin TransformBase {
  Vector3Base get translation;
  QuaternionBase get rotation;
  Vector3Base get scale;
}

mixin Vector2Base {
  double get x;
  double get y;

  String format([int x0 = 0, int? y0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)} ]';
}

mixin Vector3Base {
  double get x;
  double get y;
  double get z;

  String format([int x0 = 0, int? y0, int? z0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)} ]';
}

mixin Vector4Base {
  double get x;
  double get y;
  double get z;
  double get w;
}

mixin VrDeviceInfoBase {
  int get hResolution;
  int get vResolution;
  double get hScreenSize;
  double get vScreenSize;
  double get eyeToScreenDistance;
  double get lensSeparationDistance;
  double get interpupillaryDistance;
  List<double> get lensDistortionValues;
  List<double> get chromaAbCorrection;

  int get paramCount => 4;
}

mixin VrStereoConfigBase {
  List<MatrixBase> get projection;
  List<MatrixBase> get viewOffset;
  List<double> get leftLensCenter;
  List<double> get rightLensCenter;
  List<double> get leftScreenCenter;
  List<double> get rightScreenCenter;
  List<double> get scale;
  List<double> get scaleIn;

  int get paramCount => 2;
}