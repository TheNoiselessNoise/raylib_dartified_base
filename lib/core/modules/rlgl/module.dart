part of '../../raylib_dartified_base.dart';

/// Re-exports [RaylibRlglConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibRlglModuleExtras<R extends RaylibBase> on RaylibModule<R> {

  /// See [RaylibRlglConstants.RLGL_VERSION].
  String get RLGL_VERSION => RaylibRlglConstants.RLGL_VERSION;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFER_ELEMENTS].
  int get RL_DEFAULT_BATCH_BUFFER_ELEMENTS => RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFER_ELEMENTS;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFERS].
  int get RL_DEFAULT_BATCH_BUFFERS => RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFERS;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_BATCH_DRAWCALLS].
  int get RL_DEFAULT_BATCH_DRAWCALLS => RaylibRlglConstants.RL_DEFAULT_BATCH_DRAWCALLS;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS].
  int get RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS => RaylibRlglConstants.RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS;
  
  /// See [RaylibRlglConstants.RL_MAX_MATRIX_STACK_SIZE].
  int get RL_MAX_MATRIX_STACK_SIZE => RaylibRlglConstants.RL_MAX_MATRIX_STACK_SIZE;
  
  /// See [RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS].
  int get RL_MAX_SHADER_LOCATIONS => RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS;
  
  /// See [RaylibRlglConstants.RL_CULL_DISTANCE_NEAR].
  double get RL_CULL_DISTANCE_NEAR => RaylibRlglConstants.RL_CULL_DISTANCE_NEAR;
  
  /// See [RaylibRlglConstants.RL_CULL_DISTANCE_FAR].
  double get RL_CULL_DISTANCE_FAR => RaylibRlglConstants.RL_CULL_DISTANCE_FAR;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_S].
  int get RL_TEXTURE_WRAP_S => RaylibRlglConstants.RL_TEXTURE_WRAP_S;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_T].
  int get RL_TEXTURE_WRAP_T => RaylibRlglConstants.RL_TEXTURE_WRAP_T;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_MAG_FILTER].
  int get RL_TEXTURE_MAG_FILTER => RaylibRlglConstants.RL_TEXTURE_MAG_FILTER;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_MIN_FILTER].
  int get RL_TEXTURE_MIN_FILTER => RaylibRlglConstants.RL_TEXTURE_MIN_FILTER;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST].
  int get RL_TEXTURE_FILTER_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR].
  int get RL_TEXTURE_FILTER_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_NEAREST].
  int get RL_TEXTURE_FILTER_MIP_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_NEAREST;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR].
  int get RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST].
  int get RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_LINEAR].
  int get RL_TEXTURE_FILTER_MIP_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_LINEAR;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_ANISOTROPIC].
  int get RL_TEXTURE_FILTER_ANISOTROPIC => RaylibRlglConstants.RL_TEXTURE_FILTER_ANISOTROPIC;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_MIPMAP_BIAS_RATIO].
  int get RL_TEXTURE_MIPMAP_BIAS_RATIO => RaylibRlglConstants.RL_TEXTURE_MIPMAP_BIAS_RATIO;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_REPEAT].
  int get RL_TEXTURE_WRAP_REPEAT => RaylibRlglConstants.RL_TEXTURE_WRAP_REPEAT;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_CLAMP].
  int get RL_TEXTURE_WRAP_CLAMP => RaylibRlglConstants.RL_TEXTURE_WRAP_CLAMP;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_REPEAT].
  int get RL_TEXTURE_WRAP_MIRROR_REPEAT => RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_REPEAT;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_CLAMP].
  int get RL_TEXTURE_WRAP_MIRROR_CLAMP => RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_CLAMP;
  
  /// See [RaylibRlglConstants.RL_MODELVIEW].
  int get RL_MODELVIEW => RaylibRlglConstants.RL_MODELVIEW;
  
  /// See [RaylibRlglConstants.RL_PROJECTION].
  int get RL_PROJECTION => RaylibRlglConstants.RL_PROJECTION;
  
  /// See [RaylibRlglConstants.RL_TEXTURE].
  int get RL_TEXTURE => RaylibRlglConstants.RL_TEXTURE;
  
  /// See [RaylibRlglConstants.RL_LINES].
  int get RL_LINES => RaylibRlglConstants.RL_LINES;
  
  /// See [RaylibRlglConstants.RL_TRIANGLES].
  int get RL_TRIANGLES => RaylibRlglConstants.RL_TRIANGLES;
  
  /// See [RaylibRlglConstants.RL_QUADS].
  int get RL_QUADS => RaylibRlglConstants.RL_QUADS;
  
  /// See [RaylibRlglConstants.RL_UNSIGNED_BYTE].
  int get RL_UNSIGNED_BYTE => RaylibRlglConstants.RL_UNSIGNED_BYTE;
  
  /// See [RaylibRlglConstants.RL_FLOAT].
  int get RL_FLOAT => RaylibRlglConstants.RL_FLOAT;
  
  /// See [RaylibRlglConstants.RL_STREAM_DRAW].
  int get RL_STREAM_DRAW => RaylibRlglConstants.RL_STREAM_DRAW;
  
  /// See [RaylibRlglConstants.RL_STREAM_READ].
  int get RL_STREAM_READ => RaylibRlglConstants.RL_STREAM_READ;
  
  /// See [RaylibRlglConstants.RL_STREAM_COPY].
  int get RL_STREAM_COPY => RaylibRlglConstants.RL_STREAM_COPY;
  
  /// See [RaylibRlglConstants.RL_STATIC_DRAW].
  int get RL_STATIC_DRAW => RaylibRlglConstants.RL_STATIC_DRAW;
  
  /// See [RaylibRlglConstants.RL_STATIC_READ].
  int get RL_STATIC_READ => RaylibRlglConstants.RL_STATIC_READ;
  
  /// See [RaylibRlglConstants.RL_STATIC_COPY].
  int get RL_STATIC_COPY => RaylibRlglConstants.RL_STATIC_COPY;
  
  /// See [RaylibRlglConstants.RL_DYNAMIC_DRAW].
  int get RL_DYNAMIC_DRAW => RaylibRlglConstants.RL_DYNAMIC_DRAW;
  
  /// See [RaylibRlglConstants.RL_DYNAMIC_READ].
  int get RL_DYNAMIC_READ => RaylibRlglConstants.RL_DYNAMIC_READ;
  
  /// See [RaylibRlglConstants.RL_DYNAMIC_COPY].
  int get RL_DYNAMIC_COPY => RaylibRlglConstants.RL_DYNAMIC_COPY;
  
  /// See [RaylibRlglConstants.RL_FRAGMENT_SHADER].
  int get RL_FRAGMENT_SHADER => RaylibRlglConstants.RL_FRAGMENT_SHADER;
  
  /// See [RaylibRlglConstants.RL_VERTEX_SHADER].
  int get RL_VERTEX_SHADER => RaylibRlglConstants.RL_VERTEX_SHADER;
  
  /// See [RaylibRlglConstants.RL_COMPUTE_SHADER].
  int get RL_COMPUTE_SHADER => RaylibRlglConstants.RL_COMPUTE_SHADER;
  
  /// See [RaylibRlglConstants.RL_ZERO].
  int get RL_ZERO => RaylibRlglConstants.RL_ZERO;
  
  /// See [RaylibRlglConstants.RL_ONE].
  int get RL_ONE => RaylibRlglConstants.RL_ONE;
  
  /// See [RaylibRlglConstants.RL_SRC_COLOR].
  int get RL_SRC_COLOR => RaylibRlglConstants.RL_SRC_COLOR;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_SRC_COLOR].
  int get RL_ONE_MINUS_SRC_COLOR => RaylibRlglConstants.RL_ONE_MINUS_SRC_COLOR;
  
  /// See [RaylibRlglConstants.RL_SRC_ALPHA].
  int get RL_SRC_ALPHA => RaylibRlglConstants.RL_SRC_ALPHA;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_SRC_ALPHA].
  int get RL_ONE_MINUS_SRC_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_SRC_ALPHA;
  
  /// See [RaylibRlglConstants.RL_DST_ALPHA].
  int get RL_DST_ALPHA => RaylibRlglConstants.RL_DST_ALPHA;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_DST_ALPHA].
  int get RL_ONE_MINUS_DST_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_DST_ALPHA;
  
  /// See [RaylibRlglConstants.RL_DST_COLOR].
  int get RL_DST_COLOR => RaylibRlglConstants.RL_DST_COLOR;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_DST_COLOR].
  int get RL_ONE_MINUS_DST_COLOR => RaylibRlglConstants.RL_ONE_MINUS_DST_COLOR;
  
  /// See [RaylibRlglConstants.RL_SRC_ALPHA_SATURATE].
  int get RL_SRC_ALPHA_SATURATE => RaylibRlglConstants.RL_SRC_ALPHA_SATURATE;
  
  /// See [RaylibRlglConstants.RL_CONSTANT_COLOR].
  int get RL_CONSTANT_COLOR => RaylibRlglConstants.RL_CONSTANT_COLOR;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_COLOR].
  int get RL_ONE_MINUS_CONSTANT_COLOR => RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_COLOR;
  
  /// See [RaylibRlglConstants.RL_CONSTANT_ALPHA].
  int get RL_CONSTANT_ALPHA => RaylibRlglConstants.RL_CONSTANT_ALPHA;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_ALPHA].
  int get RL_ONE_MINUS_CONSTANT_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_ALPHA;
  
  /// See [RaylibRlglConstants.RL_FUNC_ADD].
  int get RL_FUNC_ADD => RaylibRlglConstants.RL_FUNC_ADD;
  
  /// See [RaylibRlglConstants.RL_MIN].
  int get RL_MIN => RaylibRlglConstants.RL_MIN;
  
  /// See [RaylibRlglConstants.RL_MAX].
  int get RL_MAX => RaylibRlglConstants.RL_MAX;
  
  /// See [RaylibRlglConstants.RL_FUNC_SUBTRACT].
  int get RL_FUNC_SUBTRACT => RaylibRlglConstants.RL_FUNC_SUBTRACT;
  
  /// See [RaylibRlglConstants.RL_FUNC_REVERSE_SUBTRACT].
  int get RL_FUNC_REVERSE_SUBTRACT => RaylibRlglConstants.RL_FUNC_REVERSE_SUBTRACT;
  
  /// See [RaylibRlglConstants.RL_BLEND_EQUATION].
  int get RL_BLEND_EQUATION => RaylibRlglConstants.RL_BLEND_EQUATION;
  
  /// See [RaylibRlglConstants.RL_BLEND_EQUATION_RGB].
  int get RL_BLEND_EQUATION_RGB => RaylibRlglConstants.RL_BLEND_EQUATION_RGB;
  
  /// See [RaylibRlglConstants.RL_BLEND_EQUATION_ALPHA].
  int get RL_BLEND_EQUATION_ALPHA => RaylibRlglConstants.RL_BLEND_EQUATION_ALPHA;
  
  /// See [RaylibRlglConstants.RL_BLEND_DST_RGB].
  int get RL_BLEND_DST_RGB => RaylibRlglConstants.RL_BLEND_DST_RGB;
  
  /// See [RaylibRlglConstants.RL_BLEND_SRC_RGB].
  int get RL_BLEND_SRC_RGB => RaylibRlglConstants.RL_BLEND_SRC_RGB;
  
  /// See [RaylibRlglConstants.RL_BLEND_DST_ALPHA].
  int get RL_BLEND_DST_ALPHA => RaylibRlglConstants.RL_BLEND_DST_ALPHA;
  
  /// See [RaylibRlglConstants.RL_BLEND_SRC_ALPHA].
  int get RL_BLEND_SRC_ALPHA => RaylibRlglConstants.RL_BLEND_SRC_ALPHA;
  
  /// See [RaylibRlglConstants.RL_BLEND_COLOR].
  int get RL_BLEND_COLOR => RaylibRlglConstants.RL_BLEND_COLOR;
  
  /// See [RaylibRlglConstants.RL_READ_FRAMEBUFFER].
  int get RL_READ_FRAMEBUFFER => RaylibRlglConstants.RL_READ_FRAMEBUFFER;
  
  /// See [RaylibRlglConstants.RL_DRAW_FRAMEBUFFER].
  int get RL_DRAW_FRAMEBUFFER => RaylibRlglConstants.RL_DRAW_FRAMEBUFFER;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS].
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS => RaylibRlglConstants.RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS;
  
  /// See [RaylibRlglConstants.RL_SHADER_LOC_MAP_DIFFUSE].
  int get RL_SHADER_LOC_MAP_DIFFUSE => RaylibRlglConstants.RL_SHADER_LOC_MAP_DIFFUSE;
  
  /// See [RaylibRlglConstants.RL_SHADER_LOC_MAP_SPECULAR].
  int get RL_SHADER_LOC_MAP_SPECULAR => RaylibRlglConstants.RL_SHADER_LOC_MAP_SPECULAR;
  
}

/// Backend-agnostic contract for the Raylib Rlgl module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full Core API surface across different backends.
abstract class RaylibRlglModuleBase<
  R extends RaylibBase,
  
  // types
  MatrixStructType extends MatrixBase<
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,
  QuaternionStructType extends QuaternionBase<
    QuaternionStructType,
    MatrixStructType,
    Vector3StructType,
    Vector4StructType
  >,
  RlDrawCallStructType extends RlDrawCallBase<RlDrawCallStructType>,
  RlRenderBatchStructType extends RlRenderBatchBase<
    RlRenderBatchStructType,
    RlVertexBufferStructType,
    RlDrawCallStructType
  >,
  RlVertexBufferStructType extends RlVertexBufferBase<RlVertexBufferStructType>,
  Vector3StructType extends Vector3Base<
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  Vector4StructType extends Vector4Base<
    Vector4StructType,
    QuaternionStructType,
    MatrixStructType,
    Vector3StructType
  >
  
> extends RaylibModule<R> with RaylibRlglModuleExtras<R> {

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibRlglModuleDebugLabels();
  
  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = RaylibRlglModuleCaptureIds();

  RaylibRlglModuleBase(super.rl);

  void rlMatrixMode(
    RlMatrixMode mode,
  );

  void rlPushMatrix();

  void rlPopMatrix();

  void rlLoadIdentity();

  void rlTranslatef(
    num x,
    num y,
    num z,
  );

  void rlRotatef(
    num angle,
    num x,
    num y,
    num z,
  );

  void rlScalef(
    num x,
    num y,
    num z,
  );

  void rlMultMatrixf(
    List<double> matf,
  );

  void rlFrustum(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  );

  void rlOrtho(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  );

  void rlViewport(
    num x,
    num y,
    num width,
    num height,
  );

  void rlSetClipPlanes(
    num nearPlane,
    num farPlane,
  );

  double rlGetCullDistanceNear();

  double rlGetCullDistanceFar();

  void rlBegin(
    RlDrawMode mode,
  );

  void rlEnd();

  void rlVertex2i(
    num x,
    num y,
  );

  void rlVertex2f(
    num x,
    num y,
  );

  void rlVertex3f(
    num x,
    num y,
    num z,
  );

  void rlTexCoord2f(
    num x,
    num y,
  );

  void rlNormal3f(
    num x,
    num y,
    num z,
  );

  void rlColor4ub(
    num r,
    num g,
    num b,
    num a,
  );

  void rlColor3f(
    num x,
    num y,
    num z,
  );

  void rlColor4f(
    num x,
    num y,
    num z,
    num w,
  );

  bool rlEnableVertexArray(
    num vaoId,
  );

  void rlDisableVertexArray();

  void rlEnableVertexBuffer(
    num id,
  );

  void rlDisableVertexBuffer();

  void rlEnableVertexBufferElement(
    num id,
  );

  void rlDisableVertexBufferElement();

  void rlEnableVertexAttribute(
    num index,
  );

  void rlDisableVertexAttribute(
    num index,
  );

  void rlActiveTextureSlot(
    num slot,
  );

  void rlEnableTexture(
    num id,
  );

  void rlDisableTexture();

  void rlEnableTextureCubemap(
    num id,
  );

  void rlDisableTextureCubemap();

  void rlTextureParameters(
    num id,
    num param,
    num value,
  );

  void rlCubemapParameters(
    num id,
    num param,
    num value,
  );

  void rlEnableShader(
    num id,
  );

  void rlDisableShader();

  void rlEnableFramebuffer(
    num id,
  );

  void rlDisableFramebuffer();

  int rlGetActiveFramebuffer();

  void rlActiveDrawBuffers(
    num count,
  );

  void rlBlitFramebuffer(
    num srcX,
    num srcY,
    num srcWidth,
    num srcHeight,
    num dstX,
    num dstY,
    num dstWidth,
    num dstHeight,
    num bufferMask,
  );

  void rlBindFramebuffer(
    num target,
    num framebuffer,
  );

  void rlEnableColorBlend();

  void rlDisableColorBlend();

  void rlEnableDepthTest();

  void rlDisableDepthTest();

  void rlEnableDepthMask();

  void rlDisableDepthMask();

  void rlEnableBackfaceCulling();

  void rlDisableBackfaceCulling();

  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  );

  void rlSetCullFace(
    RlCullMode mode,
  );

  void rlEnableScissorTest();

  void rlDisableScissorTest();

  void rlScissor(
    num x,
    num y,
    num width,
    num height,
  );

  void rlEnableWireMode();

  void rlEnablePointMode();

  void rlDisableWireMode();

  void rlSetLineWidth(
    num width,
  );

  double rlGetLineWidth();

  void rlEnableSmoothLines();

  void rlDisableSmoothLines();

  void rlEnableStereoRender();

  void rlDisableStereoRender();

  bool rlIsStereoRenderEnabled();

  void rlClearColor(
    num r,
    num g,
    num b,
    num a,
  );

  void rlClearScreenBuffers();

  void rlCheckErrors();

  void rlSetBlendMode(
    BlendMode mode,
  );

  void rlSetBlendFactors(
    num glSrcFactor,
    num glDstFactor,
    num glEquation,
  );

  void rlSetBlendFactorsSeparate(
    num glSrcRGB,
    num glDstRGB,
    num glSrcAlpha,
    num glDstAlpha,
    num glEqRGB,
    num glEqAlpha,
  );

  void rlglInit(
    num width,
    num height,
  );

  void rlglClose();

  int rlGetVersion();

  void rlSetFramebufferWidth(
    num width,
  );

  int rlGetFramebufferWidth();

  void rlSetFramebufferHeight(
    num height,
  );

  int rlGetFramebufferHeight();

  int rlGetTextureIdDefault();

  int rlGetShaderIdDefault();

  List<int> rlGetShaderLocsDefault();

  RlRenderBatchStructType rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  );

  void rlUnloadRenderBatch(
    RlRenderBatchStructType batch,
  );

  void rlDrawRenderBatch(
    RlRenderBatchStructType batch,
  );

  void rlSetRenderBatchActive(
    RlRenderBatchStructType batch,
  );

  void rlDrawRenderBatchActive();

  bool rlCheckRenderBatchLimit(
    num vCount,
  );

  void rlSetTexture(
    num id,
  );

  int rlLoadVertexArray();

  int rlLoadVertexBuffer(
    TypedDataList buffer,
    bool dynamic,
  );

  int rlLoadVertexBufferElement(
    TypedDataList buffer,
    bool dynamic,
  );

  void rlUpdateVertexBuffer(
    num bufferId,
    TypedDataList data,
    num offset,
  );

  void rlUpdateVertexBufferElements(
    num id,
    TypedDataList data,
    num offset,
  );

  void rlUnloadVertexArray(
    num vaoId,
  );

  void rlUnloadVertexBuffer(
    num vboId,
  );

  void rlSetVertexAttribute(
    num index,
    num compSize,
    num type,
    bool normalized,
    num stride,
    num offset,
  );

  void rlSetVertexAttributeDivisor(
    num index,
    num divisor,
  );

  void rlSetVertexAttributeDefault(
    num locIndex,
    Float32List value,
    RlShaderAttributeDataType attribType,
  );

  void rlDrawVertexArray(
    num offset,
    num count,
  );

  void rlDrawVertexArrayElements(
    num offset,
    num count,
    Uint16List buffer,
  );

  void rlDrawVertexArrayInstanced(
    num offset,
    num count,
    num instances,
  );

  void rlDrawVertexArrayElementsInstanced(
    num offset,
    num count,
    Uint16List buffer,
    num instances,
  );

  int rlLoadTexture(
    Uint8List? data,
    num width,
    num height,
    PixelFormat format,
    num mipmapCount,
  );

  int rlLoadTextureDepth(
    num width,
    num height,
    bool useRenderBuffer,
  );

  int rlLoadTextureCubemap(
    Uint8List? data,
    num size,
    PixelFormat format,
    num mipmapCount,
  );

  void rlUpdateTexture(
    num id,
    num offsetX,
    num offsetY,
    num width,
    num height,
    PixelFormat format,
    Uint8List data,
  );

  (int glInternalFormat, int glFormat, int glType) rlGetGlTextureFormats(
    PixelFormat format,
  );

  String rlGetPixelFormatName(
    PixelFormat format,
  );

  void rlUnloadTexture(
    num id,
  );

  int rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    PixelFormat format,
  );

  Uint8List rlReadTexturePixels(
    num id,
    num width,
    num height,
    PixelFormat format,
  );

  Uint8List rlReadScreenPixels(
    num width,
    num height,
  );

  int rlLoadFramebuffer();

  void rlFramebufferAttach(
    num fboId,
    num texId,
    RlFramebufferAttachType attachType,
    RlFramebufferAttachTextureType texType,
    num mipLevel,
  );

  bool rlFramebufferComplete(
    num id,
  );

  void rlUnloadFramebuffer(
    num id,
  );

  int rlLoadShaderCode(
    String? vsCode,
    String? fsCode,
  );

  int rlCompileShader(
    String shaderCode,
    RlShaderType type,
  );

  int rlLoadShaderProgram(
    num vShaderId,
    num fShaderId,
  );

  void rlUnloadShaderProgram(
    num id,
  );

  int rlGetLocationUniform(
    num shaderId,
    String uniformName,
  );

  int rlGetLocationAttrib(
    num shaderId,
    String attribName,
  );

  void rlSetUniform(
    num locIndex,
    TypedDataList value,
    RlShaderUniformDataType uniformType,
    num count,
  );

  void rlSetUniformMatrix(
    num locIndex,
    MatrixStructType mat,
  );

  void rlSetUniformMatrices(
    num locIndex,
    List<MatrixStructType> mat,
  );

  void rlSetUniformSampler(
    num locIndex,
    num textureId,
  );

  void rlSetShader(
    num id,
    List<int> locs,
  );

  int rlLoadComputeShaderProgram(
    num shaderId,
  );

  void rlComputeShaderDispatch(
    num groupX,
    num groupY,
    num groupZ,
  );

  int rlLoadShaderBuffer(
    num size,
    TypedDataList? data,
    RlUsageHint? usageHint,
  );

  void rlUnloadShaderBuffer(
    num ssboId,
  );

  void rlUpdateShaderBuffer(
    num id,
    TypedDataList data,
    num offset,
  );

  void rlBindShaderBuffer(
    num id,
    num index,
  );

  Uint8List rlReadShaderBuffer(
    num id,
    num count,
    num offset,
  );

  void rlCopyShaderBuffer(
    num destId,
    num srcId,
    num destOffset,
    num srcOffset,
    num count,
  );

  int rlGetShaderBufferSize(
    num id,
  );

  void rlBindImageTexture(
    num id,
    num index,
    PixelFormat format,
    bool readonly,
  );

  MatrixStructType rlGetMatrixModelview();

  MatrixStructType rlGetMatrixProjection();

  MatrixStructType rlGetMatrixTransform();

  MatrixStructType rlGetMatrixProjectionStereo(
    num eye,
  );

  MatrixStructType rlGetMatrixViewOffsetStereo(
    num eye,
  );

  void rlSetMatrixProjection(
    MatrixStructType proj,
  );

  void rlSetMatrixModelview(
    MatrixStructType view,
  );

  void rlSetMatrixProjectionStereo(
    MatrixStructType right,
    MatrixStructType left,
  );

  void rlSetMatrixViewOffsetStereo(
    MatrixStructType right,
    MatrixStructType left,
  );

  void rlLoadDrawCube();

  void rlLoadDrawQuad();
}
