part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [AutomationEventListBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin AutomationEventListBase<
  X extends AutomationEventListBase<X, A>,
  A extends AutomationEventBase<A>
> on RaylibStructObjectBase<X> {
  
  // NOTE: it's a view into a raylib-managed dynamic array
  //       that's why only getters and not `abstract` properties
  
  /// Events max entries
  /// 
  /// Reflects the C-side capacity of the raylib-managed array; has no
  /// practical use on the Dart side.
  int get capacity;

  /// Events entries count
  /// 
  /// Number of recorded events currently stored in [events].
  int get count;

  /// Events entries
  List<A> get events;

  @override
  String signature() => '$structName(capacity: $capacity, count: $count)';
}

/// Backend-agnostic contract for [AutomationEventBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin AutomationEventBase<X extends AutomationEventBase<X>> on RaylibStructObjectBase<X> {
  
  /// Event frame
  abstract int frame;
  
  /// Event type
  abstract AutomationEventType type;
  
  /// Event parameters (if required)
  abstract RaylibLiveList<int> params;

  /// Number of components in the `params` array.
  static int get BASE_paramsCount => 4;

  /// Expected length of [params].
  int get paramsCount => BASE_paramsCount;

  @override
  String signature() => '$structName(frame: $frame, type: $type, params: $params)';
}

/// Backend-agnostic contract for [BoneInfoBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Bone, skeletal animation bone.
mixin BoneInfoBase<X extends BoneInfoBase<X>> on RaylibStructObjectBase<X> {
  
  /// Bone name
  abstract String name;
  
  /// Bone parent
  abstract int parent;

  /// Size of the native `name` buffer in bytes (C ABI layout constant).
  static int get BASE_nameLength => 32;

  /// Compile-time ABI constant describing the capacity of the native `name` buffer.
  ///
  /// This is not related to the Dart [String] length of [name].
  ///
  /// Exists only for memory layout / FFI compatibility.
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

  /// Minimum vertex box-corner
  abstract V3 min;

  /// Maximum vertex box-corner
  abstract V3 max;

  @override
  String signature() => '$structName(min: $min, max: $max)';
}

/// Backend-agnostic contract for [Camera2DBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Defines position/orientation in 2D space.
mixin Camera2DBase<
  X extends Camera2DBase<X, V2, M, V3, Q, V4>,
  V2 extends Vector2Base<V2, M, V3, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  /// Camera offset (displacement from target)
  abstract V2 offset;

  /// Camera target (rotation and zoom origin)
  abstract V2 target;

  /// Camera rotation in degrees
  abstract double rotation;

  /// Camera zoom (scaling), should be 1.0f by default
  abstract double zoom;

  @override
  String signature() => '$structName(offset: $offset, target: $target, rotation: $rotation, zoom: $zoom)';
}

/// Backend-agnostic contract for [Camera3DBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Defines position/orientation in 3D space.
mixin Camera3DBase<
  X extends Camera3DBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  /// Camera position
  abstract V3 position;
  
  /// Camera target it looks-at
  abstract V3 target;
  
  /// Camera up vector (rotation over its axis)
  abstract V3 up;
  
  /// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
  abstract double fovy;
  
  /// Camera projection: [CameraProjection.CAMERA_PERSPECTIVE] or [CameraProjection.CAMERA_ORTHOGRAPHIC]
  abstract CameraProjection projection;

  @override
  String signature() => '$structName(position: $position, target: $target, up: $up, fovy: $fovy, projection: ${projection.name})';
}

/// Backend-agnostic contract for [ColorBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
///
/// ---
/// 
/// 4 components, R8G8B8A8 (32bit)
mixin ColorBase<X extends ColorBase<X>> on RaylibStructObjectBase<X> {

  /// Color red value
  ///
  /// Expected range: 0-255
  abstract int r;
  
  /// Color green value
  ///
  /// Expected range: 0-255
  abstract int g;

  /// Color blue value
  ///
  /// Expected range: 0-255
  abstract int b;

  /// Color alpha value
  ///
  /// Expected range: 0-255
  abstract int a;

  /// Sets all components at once.
  ///
  /// Values are converted using [num.toInt], truncating any fractional part.
  ///
  /// Returns this instance for fluent chaining.
  X set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this as X;
  }

  /// Returns this color encoded as an uppercase hexadecimal RGBA string.
  ///
  /// Format: `RRGGBBAA`
  ///
  /// Example:
  /// ```dart
  /// color.toHex(); // "FF0000FF"
  /// ```
  String toHex() =>
    '${r.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${g.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${b.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${a.toRadixString(16).padLeft(2, '0').toUpperCase()}';

  /// Returns the components as a new int list.
  ///
  /// Order: `[r, g, b, a]`
  List<int> toArray() => [r, g, b, a];

  @override
  String signature() => '$structName(r: $r, g: $g, b: $b, a: $a)';
}

/// Backend-agnostic contract for [FilePathListBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin FilePathListBase<X extends FilePathListBase<X>> on RaylibStructObjectBase<X> {
  // NOTE: it's a view into a raylib-managed dynamic array
  //       that's why only getters and not `abstract` properties

  /// Filepaths max entries
  int get capacity;

  /// Filepaths entries count
  int get count;
  
  /// Filepaths entries
  List<String> get paths;

  @override
  String signature() => '$structName(capacity: $capacity, count: $count)';
}

/// Backend-agnostic contract for [FontBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Font texture and GlyphInfo array data.
mixin FontBase<
  X extends FontBase<X, T, R, G, I>,
  T extends TextureBase<T>,
  R extends RectangleBase<R>,
  G extends GlyphInfoBase<G, I>,
  I extends ImageBase<I>

> on RaylibStructObjectBase<X> {

  /// Base size (default chars height)
  abstract int baseSize;
  
  /// Number of glyph characters
  abstract int glyphCount;
  
  /// Padding around the glyph characters
  abstract int glyphPadding;
  
  /// Texture atlas containing the glyphs
  abstract T texture;
  
  /// Rectangles in texture for the glyphs
  abstract RaylibLiveList<R> recs;
  
  /// Glyphs info data
  abstract RaylibLiveList<G> glyphs;

  @override
  String signature() => '$structName(baseSize: $baseSize, glyphCount: $glyphCount, glyphPadding: $glyphPadding, texture: $texture, recs: ${recs.length}, glyphs: ${glyphs.length})';
}

/// Backend-agnostic contract for [GlyphInfoBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Font characters glyphs info.
mixin GlyphInfoBase<
  X extends GlyphInfoBase<X, I>,
  I extends ImageBase<I>

> on RaylibStructObjectBase<X> {

  /// Character value (Unicode)
  abstract int value;

  /// Character offset X when drawing
  abstract int offsetX;

  /// Character offset Y when drawing
  abstract int offsetY;

  /// Character advance position X
  abstract int advanceX;

  /// Character image data
  abstract I image;

  @override
  String signature() => '$structName(value: $value, offsetX: $offsetX, offsetY: $offsetY, advanceX: $advanceX, image: $image)';
}

/// Backend-agnostic contract for [ImageBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Pixel data stored in CPU memory (RAM).
mixin ImageBase<X extends ImageBase<X>> on RaylibStructObjectBase<X> {
  /// Raw pixel data for the image.
  ///
  /// For single-frame images this is exactly [frameSize] bytes.
  /// 
  /// For multi-frame images (e.g. animated GIFs) this is [frameSize] * [frameCount] bytes.
  abstract Uint8List data;
  
  /// Width of the image in pixels.
  abstract int width;

  /// Height of the image in pixels.
  abstract int height;

  /// Number of mipmap levels. 1 means no mipmaps (base image only).
  abstract int mipmaps;

  /// Pixel format of the image data.
  ///
  /// Must be set to a value other than [PixelFormat.PIXELFORMAT_NONE] before
  /// accessing any data layout properties such as [bytesPerPixel],
  /// [frameSize], or [dataLength].
  abstract PixelFormat format;
  
  /// Number of frames in the image.
  ///
  /// Always 1 for static images. Greater than 1 for animated formats such as GIF.
  ///
  /// Do not modify directly after native loading. Use [structUpdateFrameCount]
  /// so backend implementations can resynchronize memory-dependent state such as
  /// [data].
  abstract int frameCount;

  /// Updates [frameCount] and resynchronizes frame-dependent memory state.
  ///
  /// This must be used when native decoders determine the frame count after
  /// allocation/loading (for example animated GIF decoding), because changing
  /// [frameCount] affects derived memory layout such as [dataLength].
  ///
  /// This is separate from directly assigning [frameCount] because platform
  /// implementations may need to refresh internal views or buffers after the
  /// frame count changes.
  void structUpdateFrameCount(int frameCount);

  /// Returns the number of bytes per pixel for the given [format].
  ///
  /// Throws a [StateError] if [format] is [PixelFormat.PIXELFORMAT_NONE],
  /// and an [UnsupportedError] for compressed formats which have no fixed
  /// bytes-per-pixel value.
  static int BASE_bytesPerPixel(PixelFormat format) => switch (format) {
    .PIXELFORMAT_NONE => throw StateError('Cannot compute bytes per pixel for PIXELFORMAT_NONE'),
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

  /// Returns the total byte length of all image data across all frames.
  ///
  /// Returns 0 if [frameSize] is 0 (i.e. width or height is 0).
  static int BASE_dataLength(int frameSize, int frameCount) {
    if (frameSize == 0) return 0;
    return frameSize * frameCount;
  }

  /// Returns the byte size of a single frame.
  ///
  /// Returns 0 if either [width] or [height] is 0.
  ///
  /// Throws a [StateError] if [format] is [PixelFormat.PIXELFORMAT_NONE].
  static int BASE_frameSize(int width, int height, PixelFormat format) {
    if (width == 0 || height == 0) return 0;
    if (format == .PIXELFORMAT_NONE) throw StateError('Image format must be set before accessing data layout');
    return width * height * BASE_bytesPerPixel(format);
  }

  /// Number of bytes per pixel, derived from [format].
  ///
  /// See [BASE_bytesPerPixel] for supported formats and error conditions.
  int get bytesPerPixel => BASE_bytesPerPixel(format);

  /// Total byte length of [data], equal to [frameSize] * [frameCount].
  ///
  /// Returns 0 if [width] or [height] is 0.
  int get dataLength => BASE_dataLength(frameSize, frameCount);

  /// Byte size of a single frame, equal to [width] * [height] * [bytesPerPixel].
  ///
  /// Returns 0 if [width] or [height] is 0.
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

  /// Material map texture
  abstract T texture;

  /// Material map color
  abstract C color;

  /// Material map value
  abstract double value;

  @override
  String signature() => '$structName(texture: $texture, color: $color, value: $value)';
}

/// Backend-agnostic contract for [MaterialBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Includes shader and maps.
mixin MaterialBase<
  X extends MaterialBase<X, S, M, T, C>,
  S extends ShaderBase<S>,
  M extends MaterialMapBase<M, T, C>,
  T extends TextureBase<T>,
  C extends ColorBase<C>

> on RaylibStructObjectBase<X> {
  
  /// Material shader
  abstract S shader;
  
  /// Material maps array of length [RaylibConstants.MAX_MATERIAL_MAPS]
  abstract RaylibLiveList<M> maps;
  
  /// Material generic parameters (if required) of length [paramsCount]
  abstract RaylibLiveList<double> params;

  /// Number of components in the `maps` buffer.
  static int get BASE_mapsCount => RaylibConstants.MAX_MATERIAL_MAPS;

  /// Number of components in the `params` array.
  static int get BASE_paramsCount => 4;

  /// Expected length of [maps].
  int get mapsCount => BASE_mapsCount;

  /// Expected length of [params].
  int get paramsCount => BASE_paramsCount;

  @override
  String signature() => '$structName(shader: $shader, maps: ${maps.length}, params: ${params.join(', ')})';
}

/// Backend-agnostic contract for [MeshBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Vertex data and vao/vbo.
mixin MeshBase<
  X extends MeshBase<X, M, V3, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {
  
  /// Number of vertices stored in arrays
  abstract int vertexCount;

  /// Number of triangles stored (indexed or not)
  abstract int triangleCount;

  // Vertex attributes data

  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  abstract RaylibLiveList<double> vertices;

  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  abstract RaylibLiveList<double> texcoords;

  /// Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
  abstract RaylibLiveList<double> texcoords2;

  /// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
  abstract RaylibLiveList<double> normals;

  /// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
  abstract RaylibLiveList<double> tangents;

  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  abstract RaylibLiveList<int> colors;

  /// Vertex indices (in case vertex data comes indexed)
  abstract RaylibLiveList<int> indices;

  // Animation vertex data

  /// Animated vertex positions (after bones transformations)
  abstract RaylibLiveList<double> animVertices;

  /// Animated normals (after bones transformations)
  abstract RaylibLiveList<double> animNormals;

  /// Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning) (shader-location = 6)
  abstract RaylibLiveList<int> boneIds;

  /// Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)
  abstract RaylibLiveList<double> boneWeights;

  /// Bones animated transformation matrices
  abstract RaylibLiveList<M> boneMatrices;

  /// Number of bones
  abstract int boneCount;

  /// OpenGL Vertex Array Object id
  abstract int vaoId;

  /// OpenGL Vertex Buffer Objects id (default vertex data)
  abstract RaylibLiveList<int> vboId;

  /// Number of components in the `vertices` buffer.
  static int BASE_verticesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the `texcoords` buffer.
  static int BASE_texcoordsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 2 : 0;

  /// Number of components in the `texcoords2` buffer.
  static int BASE_texcoords2Count(int vertexCount) => vertexCount > 0 ? vertexCount * 2 : 0;

  /// Number of components in the `normals` buffer.
  static int BASE_normalsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the `tangents` buffer.
  static int BASE_tangentsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the `colors` buffer.
  static int BASE_colorsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the `indices` buffer.
  static int BASE_indicesCount(int triangleCount) => triangleCount > 0 ? triangleCount * 3 : 0;

  /// Number of components in the `animVertices` buffer.
  static int BASE_animVerticesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the `animNormals` buffer.
  static int BASE_animNormalsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the `boneIds` buffer.
  static int BASE_boneIdsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the `boneWeights` buffer.
  static int BASE_boneWeightsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the `boneMatrices` buffer.
  static int BASE_boneMatricesCount(int boneCount) => boneCount;

  /// Number of components in the `vboId` buffer.
  static int get BASE_vboIdCount => 9;

  /// Expected length of [vertices].
  int get verticesCount => BASE_verticesCount(vertexCount);

  /// Expected length of [texcoords].
  int get texcoordsCount => BASE_texcoordsCount(vertexCount);

  /// Expected length of [texcoords2].
  int get texcoords2Count => BASE_texcoords2Count(vertexCount);

  /// Expected length of [normals].
  int get normalsCount => BASE_normalsCount(vertexCount);

  /// Expected length of [tangents].
  int get tangentsCount => BASE_tangentsCount(vertexCount);

  /// Expected length of [colors].
  int get colorsCount => BASE_colorsCount(vertexCount);

  /// Expected length of [indices].
  int get indicesCount => BASE_indicesCount(triangleCount);

  /// Expected length of [animVertices].
  int get animVerticesCount => BASE_animVerticesCount(vertexCount);

  /// Expected length of [animNormals].
  int get animNormalsCount => BASE_animNormalsCount(vertexCount);

  /// Expected length of [boneIds].
  int get boneIdsCount => BASE_boneIdsCount(vertexCount);

  /// Expected length of [boneWeights].
  int get boneWeightsCount => BASE_boneWeightsCount(vertexCount);

  /// Expected length of [boneMatrices].
  int get boneMatricesCount => BASE_boneMatricesCount(boneCount);

  /// Expected length of [vboId].
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
  
  /// Bones information (skeleton)
  abstract RaylibLiveList<B> bones;

  /// Poses array by frame
  abstract RaylibLiveList<RaylibLiveList<T>> framePoses;

  /// Animation name
  abstract String name;

  /// Number of animation frames, derived from [framePoses].
  int get frameCount => framePoses.length;
  
  /// Size of the native `name` buffer in bytes (C ABI layout constant).
  static int get BASE_nameLength => 32;

  /// Compile-time ABI constant describing the capacity of the native `name` buffer.
  ///
  /// This is not related to the Dart [String] length of [name].
  ///
  /// Exists only for memory layout / FFI compatibility.
  int get nameLength => BASE_nameLength;

  @override
  String signature() => '$structName(bones: ${bones.length}, framePoses: ${framePoses.length}, name: $name)';
}

/// Backend-agnostic contract for [ModelBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Meshes, materials and animation data.
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
 
  /// Local transform matrix
  abstract MatrixType transform;

  /// Meshes array
  abstract RaylibLiveList<MeshType> meshes;

  /// Materials array
  abstract RaylibLiveList<MaterialType> materials;

  /// Mesh-to-material index mapping
  abstract RaylibLiveList<int> meshMaterial;

  /// Bones information (skeleton)
  abstract RaylibLiveList<BoneInfoType> bones;

  /// Bind pose (base pose) for the skeleton
  abstract RaylibLiveList<TransformType> bindPose;

  /// Number of meshes, derived from [meshes].
  int get meshCount => meshes.length;

  /// Number of bones, derived from [bones].
  int get boneCount => bones.length;

  /// Number of materials, derived from [materials].
  int get materialCount => materials.length;

  @override
  String signature() => '$structName(transform: $transform, meshes: $meshCount, materials: $materialCount, bones: $boneCount)';
}

/// Backend-agnostic contract for [NPatchInfoBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// N-patch layout info.
mixin NPatchInfoBase<
  X extends NPatchInfoBase<X, R>,
  R extends RectangleBase<R>

> on RaylibStructObjectBase<X> {

  /// Texture source rectangle
  abstract R source;

  /// Left border offset
  abstract int left;

  /// Top border offset
  abstract int top;

  /// Right border offset
  abstract int right;

  /// Bottom border offset
  abstract int bottom;

  /// Layout of the n-patch
  abstract NPatchLayout layout;

  @override
  String signature() => '$structName(source: $source, left: $left, top: $top, right: $right, bottom: $bottom, layout: $layout)';
}

/// Backend-agnostic contract for [RayCollisionBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Ray hit information.
mixin RayCollisionBase<
  X extends RayCollisionBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  /// Did the ray hit something?
  abstract bool hit;

  /// Distance to the nearest hit
  abstract double distance;

  /// Point of the nearest hit
  abstract V3 point;

  /// Surface normal of hit
  abstract V3 normal;

  @override
  String signature() => '$structName(hit: $hit, distance: $distance, point: $point, normal: $normal)';
}

/// Backend-agnostic contract for [RayBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Ray for raycasting.
mixin RayBase<
  X extends RayBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  /// Ray position (origin)
  abstract V3 position;

  /// Ray direction (normalized)
  abstract V3 direction;

  @override
  String signature() => '$structName(position: $position, direction: $direction)';
}

/// Backend-agnostic contract for [RectangleBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// 4 components.
mixin RectangleBase<X extends RectangleBase<X>> on RaylibStructObjectBase<X> {

  /// Rectangle top-left corner position x
  abstract double x;

  /// Rectangle top-left corner position y
  abstract double y;

  /// Rectangle width
  abstract double width;

  /// Rectangle height
  abstract double height;

  /// Sets all components at once.
  ///
  /// Values are converted using [num.toDouble].
  ///
  /// Returns this instance for fluent chaining.
  X set(num x, num y, num width, num height) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.width = width.toDouble();
    this.height = height.toDouble();
    return this as X;
  }

  /// Returns the Rectangle components as a new double list.
  ///
  /// Order: `[x, y, width, height]`
  List<double> toArray() => [x, y, width, height];

  /// Returns a formatted string representation of this rectangle.
  ///
  /// Each component is formatted to a fixed number of decimal places.
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0], [w0], and [h0].
  ///
  /// Example: `[ X:<x>, Y:<y>, W:<width>, H:<height> ]`
  String format([int x0 = 0, int? y0, int? w0, int? h0]) =>
    '[ '
      'X:${x.toStringAsFixed(x0)}, '
      'Y:${y.toStringAsFixed(y0 ?? x0)}, '
      'W:${width.toStringAsFixed(w0 ?? x0)}, '
      'H:${height.toStringAsFixed(h0 ?? x0)} '
    ']';

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, w: ${width.f1}, h: ${height.f1})';
}

/// Backend-agnostic contract for [RenderTextureBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// FBO for texture rendering.
mixin RenderTextureBase<
  X extends RenderTextureBase<X, T>,
  T extends TextureBase<T>

> on RaylibStructObjectBase<X> {

  /// OpenGL framebuffer object id
  abstract int id;

  /// Color buffer attachment texture
  abstract T texture;

  /// Depth buffer attachment texture
  abstract T depth;

  @override
  String signature() => '$structName(id: $id, texture: $texture, depth: $depth)';
}

/// Backend-agnostic contract for [ShaderBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin ShaderBase<X extends ShaderBase<X>> on RaylibStructObjectBase<X> {

  /// Shader program id
  abstract int id;

  /// Shader locations array of length [RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS]
  abstract RaylibLiveList<int> locs;

  /// Number of components in the `locs` buffer.
  static int get BASE_shaderLocsCount => RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS;

  /// Expected length of [locs].
  int get shaderLocsCount => BASE_shaderLocsCount;

  @override
  String signature() => '$structName(id: $id, locs: ${locs.join(', ')})';
}

/// Backend-agnostic contract for [TextureBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Tex data stored in GPU memory (VRAM).
mixin TextureBase<X extends TextureBase<X>> on RaylibStructObjectBase<X> {
  
  /// OpenGL texture id
  abstract int id;
  
  /// Texture base width
  abstract int width;
  
  /// Texture base height
  abstract int height;
  
  /// Mipmap levels, 1 by default
  abstract int mipmaps;
  
  /// Data format
  abstract PixelFormat format;

  @override
  String signature() => '$structName(id: $id, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';
}

/// Backend-agnostic contract for [TransformBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Vertex transformation data.
mixin TransformBase<
  X extends TransformBase<X, V3, M, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {

  /// Translation
  abstract V3 translation;

  /// Rotation
  abstract Q rotation;

  /// Scale
  abstract V3 scale;

  @override
  String signature() => '$structName(translation: $translation, rotation: $rotation, scale: $scale)';
}

/// Backend-agnostic contract for [VrDeviceInfoBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// Head-Mounted-Display device parameters.
mixin VrDeviceInfoBase<X extends VrDeviceInfoBase<X>> on RaylibStructObjectBase<X> {
  
  /// Horizontal resolution in pixels
  abstract int hResolution;
  
  /// Vertical resolution in pixels
  abstract int vResolution;
  
  /// Horizontal size in meters
  abstract double hScreenSize;
  
  /// Vertical size in meters
  abstract double vScreenSize;
  
  /// Distance between eye and display in meters
  abstract double eyeToScreenDistance;
  
  /// Lens separation distance in meters
  abstract double lensSeparationDistance;
  
  /// IPD (distance between pupils) in meters
  abstract double interpupillaryDistance;
  
  /// Lens distortion constant parameters
  abstract RaylibLiveList<double> lensDistortionValues;
  
  /// Chromatic aberration correction parameters
  abstract RaylibLiveList<double> chromaAbCorrection;

  /// Number of components in the `lensDistortionValues` and `chromaAbCorrection` arrays.
  static int get BASE_paramsCount => 4;

  /// Expected length of [lensDistortionValues] and [chromaAbCorrection].
  int get paramsCount => BASE_paramsCount;

  @override
  String signature() => '$structName()';
}

/// Backend-agnostic contract for [VrStereoConfigBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// VR stereo rendering configuration for simulator.
mixin VrStereoConfigBase<
  X extends VrStereoConfigBase<X, M, V3, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<X> {
  
  /// VR projection matrices (per eye)
  abstract RaylibLiveList<M> projection;
  
  /// VR view offset matrices (per eye)
  abstract RaylibLiveList<M> viewOffset;
  
  /// VR left lens center
  abstract RaylibLiveList<double> leftLensCenter;
  
  /// VR right lens center
  abstract RaylibLiveList<double> rightLensCenter;
  
  /// VR left screen center
  abstract RaylibLiveList<double> leftScreenCenter;
  
  /// VR right screen center
  abstract RaylibLiveList<double> rightScreenCenter;
  
  /// VR distortion scale
  abstract RaylibLiveList<double> scale;
  
  /// VR distortion scale in
  abstract RaylibLiveList<double> scaleIn;

  /// Number of components in the `projection`, `viewOffset`, `leftLensCenter`, `rightLensCenter`, `leftScreenCenter`, `rightScreenCenter`, `scale` and `scaleIn` arrays.
  static int get BASE_paramsCount => 2;

  /// Expected length of [projection], [viewOffset], [leftLensCenter], [rightLensCenter], [leftScreenCenter], [rightScreenCenter], [scale] and [scaleIn].
  int get paramsCount => BASE_paramsCount;

  @override
  String signature() => '$structName()';
}