part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [AutomationEventListBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin AutomationEventListBase<
  X extends AutomationEventListBase<X, A>,
  A extends AutomationEventBase<A>
> on RaylibStructObjectBase<X> {
  
  // NOTE: it's a view, that's why only getters
  
  int get capacity;
  int get count;
  List<A> get events;

  @override
  String signature() => '$structName(capacity: $capacity, count: $count)';
}

/// Backend-agnostic contract for [AutomationEventBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin AutomationEventBase<X extends AutomationEventBase<X>> on RaylibStructObjectBase<X> {
  abstract int frame;
  abstract int type;
  abstract RaylibLiveList<int> params;

  static int get BASE_paramsCount => 4;

  int get paramsCount => BASE_paramsCount;

  @override
  String signature() => '$structName(frame: $frame, type: $type, params: $params)';
}

/// Backend-agnostic contract for [BoneInfoBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin BoneInfoBase<X extends BoneInfoBase<X>> on RaylibStructObjectBase<X> {
  abstract String name;
  abstract int parent;

  static int get BASE_nameLength => 32;

  int get nameLength => BASE_nameLength;

  @override
  String signature() => '$structName(name: $name, parent: $parent)';
}

/// Backend-agnostic contract for [BoundingBoxBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin BoundingBoxBase<
  X extends BoundingBoxBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  abstract V3 min;
  abstract V3 max;

  @override
  String signature() => '$structName(min: $min, max: $max)';
}

/// Backend-agnostic contract for [Camera2DBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin Camera2DBase<
  X extends Camera2DBase<X, V2, M, V3, Q, V4>,
  V2 extends Vector2Base<V2, M, V3, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  abstract V2 offset;
  abstract V2 target;
  abstract double rotation;
  abstract double zoom;

  @override
  String signature() => '$structName(offset: $offset, target: $target, rotation: $rotation, zoom: $zoom)';
}

/// Backend-agnostic contract for [Camera3DBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin Camera3DBase<
  X extends Camera3DBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  abstract V3 position;
  abstract V3 target;
  abstract V3 up;
  abstract double fovy;
  abstract CameraProjection projection;

  @override
  String signature() => '$structName(position: $position, target: $target, up: $up, fovy: $fovy, projection: ${projection.name})';
}

/// Backend-agnostic contract for [ColorBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin ColorBase<X extends ColorBase<X>> on RaylibStructObjectBase<X> {
  abstract int r;
  abstract int g;
  abstract int b;
  abstract int a;

  X set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this as X;
  }

  String toHex() =>
    '${r.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${g.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${b.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${a.toRadixString(16).padLeft(2, '0').toUpperCase()}';

  List<int> toArray() => [r, g, b, a];

  @override
  String signature() => '$structName(r: $r, g: $g, b: $b, a: $a)';
}

// NOTE: it's a view, that's why only getters
/// Backend-agnostic contract for [FilePathListBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin FilePathListBase<X extends FilePathListBase<X>> on RaylibStructObjectBase<X> {
  int get capacity;
  int get count;
  List<String> get paths;

  @override
  String signature() => '$structName(capacity: $capacity, count: $count)';
}

/// Backend-agnostic contract for [FontBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin FontBase<
  X extends FontBase<X, T, R, G, I>,
  T extends TextureBase<T>,
  R extends RectangleBase<R>,
  G extends GlyphInfoBase<G, I>,
  I extends ImageBase<I>

> on RaylibStructObjectBase<X> {

  abstract int baseSize;
  abstract int glyphCount;
  abstract int glyphPadding;
  abstract T texture;
  abstract RaylibLiveList<R> recs;
  abstract RaylibLiveList<G> glyphs;

  @override
  String signature() => '$structName(baseSize: $baseSize, glyphCount: $glyphCount, glyphPadding: $glyphPadding, texture: $texture, recs: ${recs.length}, glyphs: ${glyphs.length})';
}

/// Backend-agnostic contract for [GlyphInfoBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin GlyphInfoBase<
  X extends GlyphInfoBase<X, I>,
  I extends ImageBase<I>

> on RaylibStructObjectBase<X> {

  abstract int value;
  abstract int offsetX;
  abstract int offsetY;
  abstract int advanceX;
  abstract I image;

  @override
  String signature() => '$structName(value: $value, offsetX: $offsetX, offsetY: $offsetY, advanceX: $advanceX, image: $image)';
}

/// Backend-agnostic contract for [ImageBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin ImageBase<X extends ImageBase<X>> on RaylibStructObjectBase<X> {
  abstract Uint8List data;
  abstract int width;
  abstract int height;
  abstract int mipmaps;
  abstract PixelFormat format;
  
  abstract int frameCount;

  // NOTE: for GIFs (or generally for multi-frame formats)
  void structUpdateFrameCount(int frameCount);

  static int BASE_bytesPerPixel(PixelFormat format) => switch (format) {
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

  static int BASE_dataLength(int frameSize, int frameCount) {
    if (frameSize == 0) return 0;
    return frameSize * frameCount;
  }

  static int BASE_frameSize(int width, int height, PixelFormat format) {
    if (width == 0 || height == 0) return 0;
    return width * height * BASE_bytesPerPixel(format);
  }

  int get bytesPerPixel => BASE_bytesPerPixel(format);
  int get dataLength => BASE_dataLength(frameSize, frameCount);
  int get frameSize => BASE_frameSize(width, height, format);

  @override
  String signature() => '$structName(data: ${data.length}, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';
}

/// Backend-agnostic contract for [MaterialMapBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin MaterialMapBase<
  X extends MaterialMapBase<X, T, C>,
  T extends TextureBase<T>,
  C extends ColorBase<C>

> on RaylibStructObjectBase<X> {

  abstract T texture;
  abstract C color;
  abstract double value;

  @override
  String signature() => '$structName(texture: $texture, color: $color, value: $value)';
}

/// Backend-agnostic contract for [MaterialBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin MaterialBase<
  X extends MaterialBase<X, S, M, T, C>,
  S extends ShaderBase<S>,
  M extends MaterialMapBase<M, T, C>,
  T extends TextureBase<T>,
  C extends ColorBase<C>

> on RaylibStructObjectBase<X> {
  
  abstract S shader;
  abstract RaylibLiveList<M> maps;
  abstract RaylibLiveList<double> params;

  static int get BASE_paramsCount => 4;
  static int get BASE_mapsCount => RaylibConstants.MAX_MATERIAL_MAPS;

  int get paramsCount => BASE_paramsCount;
  int get mapsCount => BASE_mapsCount;

  @override
  String signature() => '$structName(shader: $shader, maps: ${maps.length}, params: ${params.join(', ')})';
}

/// Backend-agnostic contract for [MeshBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin MeshBase<
  X extends MeshBase<X, M, V3, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {
  
  abstract int vertexCount;
  abstract int triangleCount;
  abstract int boneCount;
  abstract RaylibLiveList<double> vertices;
  abstract RaylibLiveList<double> texcoords;
  abstract RaylibLiveList<double> texcoords2;
  abstract RaylibLiveList<double> normals;
  abstract RaylibLiveList<double> tangents;
  abstract RaylibLiveList<int> colors;
  abstract RaylibLiveList<int> indices;
  abstract RaylibLiveList<double> animVertices;
  abstract RaylibLiveList<double> animNormals;
  abstract RaylibLiveList<int> boneIds;
  abstract RaylibLiveList<double> boneWeights;
  abstract RaylibLiveList<M> boneMatrices;
  abstract int vaoId;
  abstract RaylibLiveList<int> vboId;

  static int BASE_verticesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;
  static int BASE_texcoordsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 2 : 0;
  static int BASE_texcoords2Count(int vertexCount) => vertexCount > 0 ? vertexCount * 2 : 0;
  static int BASE_normalsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;
  static int BASE_tangentsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;
  static int BASE_colorsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;
  static int BASE_indicesCount(int triangleCount) => triangleCount > 0 ? triangleCount * 3 : 0;
  static int BASE_animVerticesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;
  static int BASE_animNormalsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;
  static int BASE_boneIdsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;
  static int BASE_boneWeightsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;
  static int BASE_boneMatricesCount(int boneCount) => boneCount;
  static int get BASE_vboIdCount => 9;

  int get verticesCount => BASE_verticesCount(vertexCount);
  int get texcoordsCount => BASE_texcoordsCount(vertexCount);
  int get texcoords2Count => BASE_texcoords2Count(vertexCount);
  int get normalsCount => BASE_normalsCount(vertexCount);
  int get tangentsCount => BASE_tangentsCount(vertexCount);
  int get colorsCount => BASE_colorsCount(vertexCount);
  int get indicesCount => BASE_indicesCount(triangleCount);
  int get animVerticesCount => BASE_animVerticesCount(vertexCount);
  int get animNormalsCount => BASE_animNormalsCount(vertexCount);
  int get boneIdsCount => BASE_boneIdsCount(vertexCount);
  int get boneWeightsCount => BASE_boneWeightsCount(vertexCount);
  int get boneMatricesCount => BASE_boneMatricesCount(boneCount);
  int get vboIdCount => BASE_vboIdCount;

  @override
  String signature() => '$structName(vertexCount: $vertexCount, triangleCount: $triangleCount, boneCount: $boneCount, vaoId: $vaoId)';
}

/// Backend-agnostic contract for [ModelAnimationBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin ModelAnimationBase<
  X extends ModelAnimationBase<X, B, T, V3, M, Q, V4>,
  B extends BoneInfoBase<B>,
  T extends TransformBase<T, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {
  
  abstract RaylibLiveList<B> bones;
  abstract RaylibLiveList<RaylibLiveList<T>> framePoses;
  abstract String name;

  int get frameCount => framePoses.length;
  
  static int get BASE_nameLength => 32;

  int get nameLength => BASE_nameLength;

  @override
  String signature() => '$structName(bones: ${bones.length}, framePoses: ${framePoses.length}, name: $name)';
}

/// Backend-agnostic contract for [ModelBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin ModelBase<
  X extends ModelBase<X, MeshType, MatrixType, V3, Q, V4, MaterialType, ShaderType, MaterialMapType, TextureType, ColorType, TransformType, BoneInfoType>,
  // geometry
  MeshType extends MeshBase<MeshType, MatrixType, V3, Q, V4>,
  MatrixType extends MatrixBase<MatrixType, V3, Q, V4>,
  V3 extends Vector3Base<V3, MatrixType, Q, V4>,
  Q extends QuaternionBase<Q, MatrixType, V3, V4>,
  V4 extends Vector4Base<V4, Q, MatrixType, V3>,
  // material
  MaterialType extends MaterialBase<MaterialType, ShaderType, MaterialMapType, TextureType, ColorType>,
  ShaderType extends ShaderBase<ShaderType>,
  MaterialMapType extends MaterialMapBase<MaterialMapType, TextureType, ColorType>,
  TextureType extends TextureBase<TextureType>,
  ColorType extends ColorBase<ColorType>,
  // skeleton
  TransformType extends TransformBase<TransformType, V3, MatrixType, Q, V4>,
  BoneInfoType extends BoneInfoBase<BoneInfoType>

> on RaylibStructObjectBase<X> {
 
  abstract MatrixType transform;
  abstract RaylibLiveList<MeshType> meshes;
  abstract RaylibLiveList<MaterialType> materials;
  abstract RaylibLiveList<int> meshMaterial;
  abstract RaylibLiveList<BoneInfoType> bones;
  abstract RaylibLiveList<TransformType> bindPose;

  int get meshCount => meshes.length;
  int get boneCount => bones.length;
  int get materialCount => materials.length;

  @override
  String signature() => '$structName(transform: $transform, meshes: $meshCount, materials: $materialCount, bones: $boneCount)';
}

/// Backend-agnostic contract for [NPatchInfoBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin NPatchInfoBase<
  X extends NPatchInfoBase<X, R>,
  R extends RectangleBase<R>

> on RaylibStructObjectBase<X> {

  abstract R source;
  abstract int left;
  abstract int top;
  abstract int right;
  abstract int bottom;
  abstract NPatchLayout layout;

  @override
  String signature() => '$structName(source: $source, left: $left, top: $top, right: $right, bottom: $bottom, layout: $layout)';
}

/// Backend-agnostic contract for [RayCollisionBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RayCollisionBase<
  X extends RayCollisionBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  abstract bool hit;
  abstract double distance;
  abstract V3 point;
  abstract V3 normal;

  @override
  String signature() => '$structName(hit: $hit, distance: $distance, point: $point, normal: $normal)';
}

/// Backend-agnostic contract for [RayBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RayBase<
  X extends RayBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  abstract V3 position;
  abstract V3 direction;

  @override
  String signature() => '$structName(position: $position, direction: $direction)';
}

/// Backend-agnostic contract for [RectangleBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RectangleBase<X extends RectangleBase<X>> on RaylibStructObjectBase<X> {
  abstract double x;
  abstract double y;
  abstract double width;
  abstract double height;

  X set(num x, num y, num width, num height) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.width = width.toDouble();
    this.height = height.toDouble();
    return this as X;
  }

  List<double> toArray() => [x, y, width, height];

  String format([int x0 = 0, int? y0, int? w0, int? h0]) => '[ X:${x.toStringAsFixed(x0)}, Y:${y.toStringAsFixed(y0 ?? x0)}, W:${width.toStringAsFixed(w0 ?? x0)}, H:${height.toStringAsFixed(h0 ?? x0)} ]';

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, w: ${width.f1}, h: ${height.f1})';
}

/// Backend-agnostic contract for [RenderTextureBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin RenderTextureBase<
  X extends RenderTextureBase<X, T>,
  T extends TextureBase<T>

> on RaylibStructObjectBase<X> {

  abstract int id;
  abstract T texture;
  abstract T depth;

  @override
  String signature() => '$structName(id: $id, texture: $texture, depth: $depth)';
}

/// Backend-agnostic contract for [ShaderBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin ShaderBase<X extends ShaderBase<X>> on RaylibStructObjectBase<X> {
  abstract int id;
  abstract RaylibLiveList<int> locs;

  static int get BASE_shaderLocsCount => RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS;

  int get shaderLocsCount => BASE_shaderLocsCount;

  @override
  String signature() => '$structName(id: $id, locs: ${locs.join(', ')})';
}

/// Backend-agnostic contract for [TextureBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin TextureBase<X extends TextureBase<X>> on RaylibStructObjectBase<X> {
  abstract int id;
  abstract int width;
  abstract int height;
  abstract int mipmaps;
  abstract PixelFormat format;

  @override
  String signature() => '$structName(id: $id, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';
}

/// Backend-agnostic contract for [TransformBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin TransformBase<
  X extends TransformBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  abstract V3 translation;
  abstract Q rotation;
  abstract V3 scale;

  @override
  String signature() => '$structName(translation: $translation, rotation: $rotation, scale: $scale)';
}

/// Backend-agnostic contract for [VrDeviceInfoBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin VrDeviceInfoBase<X extends VrDeviceInfoBase<X>> on RaylibStructObjectBase<X> {
  abstract int hResolution;
  abstract int vResolution;
  abstract double hScreenSize;
  abstract double vScreenSize;
  abstract double eyeToScreenDistance;
  abstract double lensSeparationDistance;
  abstract double interpupillaryDistance;
  abstract RaylibLiveList<double> lensDistortionValues;
  abstract RaylibLiveList<double> chromaAbCorrection;

  static int get BASE_paramsCount => 4;

  int get paramsCount => BASE_paramsCount;

  @override
  String signature() => '$structName()';
}

/// Backend-agnostic contract for [VrStereoConfigBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin VrStereoConfigBase<
  X extends VrStereoConfigBase<X, M, V3, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {
  
  abstract RaylibLiveList<M> projection;
  abstract RaylibLiveList<M> viewOffset;
  abstract RaylibLiveList<double> leftLensCenter;
  abstract RaylibLiveList<double> rightLensCenter;
  abstract RaylibLiveList<double> leftScreenCenter;
  abstract RaylibLiveList<double> rightScreenCenter;
  abstract RaylibLiveList<double> scale;
  abstract RaylibLiveList<double> scaleIn;

  static int get BASE_paramsCount => 2;

  int get paramsCount => BASE_paramsCount;

  @override
  String signature() => '$structName()';
}