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

  /// Choose the current matrix to be transformed
  void rlMatrixMode(
    RlMatrixMode mode,
  );

  /// Push the current matrix to stack
  void rlPushMatrix();

  /// Pop latest inserted matrix from stack
  void rlPopMatrix();

  /// Reset current matrix to identity matrix
  void rlLoadIdentity();

  /// Multiply the current matrix by a translation matrix
  void rlTranslatef(
    num x,
    num y,
    num z,
  );

  /// Multiply the current matrix by a rotation matrix
  void rlRotatef(
    num angle,
    num x,
    num y,
    num z,
  );

  /// Multiply the current matrix by a scaling matrix
  void rlScalef(
    num x,
    num y,
    num z,
  );

  /// Multiply the current matrix by another matrix
  void rlMultMatrixf(
    List<num> matf,
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

  /// Set the viewport area
  void rlViewport(
    num x,
    num y,
    num width,
    num height,
  );

  /// Set clip planes distances
  void rlSetClipPlanes(
    num nearPlane,
    num farPlane,
  );

  /// Get cull plane distance near
  double rlGetCullDistanceNear();

  /// Get cull plane distance far
  double rlGetCullDistanceFar();

  /// Initialize drawing mode (how to organize vertex)
  void rlBegin(
    RlDrawMode mode,
  );

  /// Finish vertex providing
  void rlEnd();

  /// Define one vertex (position) - 2 int
  void rlVertex2i(
    num x,
    num y,
  );

  /// Define one vertex (position) - 2 float
  void rlVertex2f(
    num x,
    num y,
  );

  /// Define one vertex (position) - 3 float
  void rlVertex3f(
    num x,
    num y,
    num z,
  );

  /// Define one vertex (texture coordinate) - 2 float
  void rlTexCoord2f(
    num x,
    num y,
  );

  /// Define one vertex (normal) - 3 float
  void rlNormal3f(
    num x,
    num y,
    num z,
  );

  /// Define one vertex (color) - 4 byte
  void rlColor4ub(
    num r,
    num g,
    num b,
    num a,
  );

  /// Define one vertex (color) - 3 float
  void rlColor3f(
    num x,
    num y,
    num z,
  );

  /// Define one vertex (color) - 4 float
  void rlColor4f(
    num x,
    num y,
    num z,
    num w,
  );

  /// Enable vertex array (VAO, if supported)
  bool rlEnableVertexArray(
    num vaoId,
  );

  /// Disable vertex array (VAO, if supported)
  void rlDisableVertexArray();

  /// Enable vertex buffer (VBO)
  void rlEnableVertexBuffer(
    num id,
  );

  /// Disable vertex buffer (VBO)
  void rlDisableVertexBuffer();

  /// Enable vertex buffer element (VBO element)
  void rlEnableVertexBufferElement(
    num id,
  );

  /// Disable vertex buffer element (VBO element)
  void rlDisableVertexBufferElement();

  /// Enable vertex attribute index
  void rlEnableVertexAttribute(
    num index,
  );

  /// Disable vertex attribute index
  void rlDisableVertexAttribute(
    num index,
  );

  /// Enable attribute state pointer
  void rlEnableStatePointer(
    int vertexAttribType,
    TypedDataList data,
  );
  
  /// Disable attribute state pointer
  void rlDisableStatePointer(
    int vertexAttribType,
  );

  /// Select and active a texture slot
  void rlActiveTextureSlot(
    num slot,
  );

  /// Enable texture
  void rlEnableTexture(
    num id,
  );

  /// Disable texture
  void rlDisableTexture();

  /// Enable texture cubemap
  void rlEnableTextureCubemap(
    num id,
  );

  /// Disable texture cubemap
  void rlDisableTextureCubemap();

  /// Set texture parameters (filter, wrap)
  void rlTextureParameters(
    num id,
    num param,
    num value,
  );

  /// Set cubemap parameters (filter, wrap)
  void rlCubemapParameters(
    num id,
    num param,
    num value,
  );

  /// Enable shader program
  void rlEnableShader(
    num id,
  );

  /// Disable shader program
  void rlDisableShader();

  /// Enable render texture (fbo)
  void rlEnableFramebuffer(
    num id,
  );

  /// Disable render texture (fbo), return to default framebuffer
  void rlDisableFramebuffer();

  /// Get the currently active render texture (fbo), 0 for default framebuffer
  int rlGetActiveFramebuffer();

  /// Activate multiple draw color buffers
  void rlActiveDrawBuffers(
    num count,
  );

  /// Blit active framebuffer to main framebuffer
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

  /// Bind framebuffer (FBO)
  void rlBindFramebuffer(
    num target,
    num framebuffer,
  );

  /// Enable color blending
  void rlEnableColorBlend();

  /// Disable color blending
  void rlDisableColorBlend();

  /// Enable depth test
  void rlEnableDepthTest();

  /// Disable depth test
  void rlDisableDepthTest();

  /// Enable depth write
  void rlEnableDepthMask();

  /// Disable depth write
  void rlDisableDepthMask();

  /// Enable backface culling
  void rlEnableBackfaceCulling();

  /// Disable backface culling
  void rlDisableBackfaceCulling();

  /// Color mask control
  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  );

  /// Set face culling mode
  void rlSetCullFace(
    RlCullMode mode,
  );

  /// Enable scissor test
  void rlEnableScissorTest();

  /// Disable scissor test
  void rlDisableScissorTest();

  /// Scissor test
  void rlScissor(
    num x,
    num y,
    num width,
    num height,
  );

  /// Enable point mode
  void rlEnablePointMode();

  /// Disable point mode
  void rlDisablePointMode();

  /// Set the point drawing size
  void rlSetPointSize(num size);
  
  /// Get the point drawing size
  double rlGetPointSize();

  /// Enable wire mode
  void rlEnableWireMode();

  /// Disable wire mode
  void rlDisableWireMode();

  /// Set the line drawing width
  void rlSetLineWidth(
    num width,
  );

  /// Get the line drawing width
  double rlGetLineWidth();

  /// Enable line aliasing
  void rlEnableSmoothLines();

  /// Disable line aliasing
  void rlDisableSmoothLines();

  /// Enable stereo rendering
  void rlEnableStereoRender();

  /// Disable stereo rendering
  void rlDisableStereoRender();

  /// Check if stereo render is enabled
  bool rlIsStereoRenderEnabled();

  /// Clear color buffer with color
  void rlClearColor(
    num r,
    num g,
    num b,
    num a,
  );

  /// Clear used screen buffers (color and depth)
  void rlClearScreenBuffers();

  /// Check and log OpenGL error codes
  void rlCheckErrors();

  /// Set blending mode
  void rlSetBlendMode(
    BlendMode mode,
  );

  /// Set blending mode factor and equation (using OpenGL factors)
  void rlSetBlendFactors(
    num glSrcFactor,
    num glDstFactor,
    num glEquation,
  );

  /// Set blending mode factors and equations separately (using OpenGL factors)
  void rlSetBlendFactorsSeparate(
    num glSrcRGB,
    num glDstRGB,
    num glSrcAlpha,
    num glDstAlpha,
    num glEqRGB,
    num glEqAlpha,
  );

  /// Initialize rlgl (buffers, shaders, textures, states)
  void rlglInit(
    num width,
    num height,
  );

  /// De-initialize rlgl (buffers, shaders, textures)
  void rlglClose();

  /// Get current OpenGL version
  int rlGetVersion();

  /// Set current framebuffer width
  void rlSetFramebufferWidth(
    num width,
  );

  /// Get default framebuffer width
  int rlGetFramebufferWidth();

  /// Set current framebuffer height
  void rlSetFramebufferHeight(
    num height,
  );

  /// Get default framebuffer height
  int rlGetFramebufferHeight();

  /// Get default texture id
  int rlGetTextureIdDefault();

  /// Get default shader id
  int rlGetShaderIdDefault();

  /// Get default shader locations
  List<int> rlGetShaderLocsDefault();

  /// Load a render batch system
  RlRenderBatchStructType rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  );

  /// Unload render batch system
  void rlUnloadRenderBatch(
    RlRenderBatchStructType batch,
  );

  /// Draw render batch data (Update->Draw->Reset)
  void rlDrawRenderBatch(
    RlRenderBatchStructType batch,
  );

  /// Set the active render batch for rlgl (NULL for default internal)
  void rlSetRenderBatchActive([
    RlRenderBatchStructType? batch,
  ]);

  /// Update and draw internal render batch
  void rlDrawRenderBatchActive();

  /// Check internal buffer overflow for a given number of vertex
  bool rlCheckRenderBatchLimit(
    num vCount,
  );

  /// Set current texture for render batch and check buffers limits
  void rlSetTexture(
    num id,
  );

  /// Load vertex array (vao) if supported
  int rlLoadVertexArray();

  /// Load a vertex buffer object
  int rlLoadVertexBuffer(
    TypedDataList buffer,
    bool dynamic,
  );

  /// Load vertex buffer elements object
  int rlLoadVertexBufferElement(
    TypedDataList buffer,
    bool dynamic,
  );

  /// Update vertex buffer object data on GPU buffer
  void rlUpdateVertexBuffer(
    num bufferId,
    TypedDataList data,
    num dataSize,
    num offset,
  );

  /// Update vertex buffer elements data on GPU buffer
  void rlUpdateVertexBufferElements(
    num id,
    TypedDataList data,
    num dataSize,
    num offset,
  );

  /// Unload vertex array (vao)
  void rlUnloadVertexArray(
    num vaoId,
  );

  /// Unload vertex buffer object
  void rlUnloadVertexBuffer(
    num vboId,
  );

  /// Set vertex attribute data configuration
  void rlSetVertexAttribute(
    num index,
    num compSize,
    num type,
    bool normalized,
    num stride,
    num offset,
  );

  /// Set vertex attribute data divisor
  void rlSetVertexAttributeDivisor(
    num index,
    num divisor,
  );

  /// Set vertex attribute default value, when attribute to provided
  void rlSetVertexAttributeDefault(
    num locIndex,
    Float32List value,
    RlShaderAttributeDataType attribType,
  );

  /// Draw vertex array (currently active vao)
  void rlDrawVertexArray(
    num offset,
    num count,
  );

  /// Draw vertex array elements
  void rlDrawVertexArrayElements(
    num offset,
    num count,
    Uint16List buffer,
  );

  /// Draw vertex array (currently active vao) with instancing
  void rlDrawVertexArrayInstanced(
    num offset,
    num count,
    num instances,
  );

  /// Draw vertex array elements with instancing
  void rlDrawVertexArrayElementsInstanced(
    num offset,
    num count,
    Uint16List buffer,
    num instances,
  );

  /// Load texture data
  int rlLoadTexture(
    Uint8List? data,
    num width,
    num height,
    PixelFormat format,
    num mipmapCount,
  );

  /// Load depth texture/renderbuffer (to be attached to fbo)
  int rlLoadTextureDepth(
    num width,
    num height,
    bool useRenderBuffer,
  );

  /// Load texture cubemap data
  int rlLoadTextureCubemap(
    Uint8List? data,
    num size,
    PixelFormat format,
    num mipmapCount,
  );

  /// Update texture with new data on GPU
  void rlUpdateTexture(
    num id,
    num offsetX,
    num offsetY,
    num width,
    num height,
    PixelFormat format,
    Uint8List data,
  );

  /// Get OpenGL internal formats
  (int glInternalFormat, int glFormat, int glType) rlGetGlTextureFormats(
    PixelFormat format,
  );

  /// Get name string for pixel format
  String rlGetPixelFormatName(
    PixelFormat format,
  );

  /// Unload texture from GPU memory
  void rlUnloadTexture(
    num id,
  );

  /// Generate mipmap data for selected texture
  int rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    PixelFormat format,
  );

  /// Read texture pixel data
  Uint8List rlReadTexturePixels(
    num id,
    num width,
    num height,
    PixelFormat format,
  );

  /// Read screen pixel data (color buffer)
  Uint8List rlReadScreenPixels(
    num width,
    num height,
  );

  /// Load an empty framebuffer
  int rlLoadFramebuffer();

  /// Attach texture/renderbuffer to a framebuffer
  void rlFramebufferAttach(
    num fboId,
    num texId,
    RlFramebufferAttachType attachType,
    RlFramebufferAttachTextureType texType,
    num mipLevel,
  );

  /// Verify framebuffer is complete
  bool rlFramebufferComplete(
    num id,
  );

  /// Delete framebuffer from GPU
  void rlUnloadFramebuffer(
    num id,
  );

  /// Copy framebuffer pixel data to internal buffer
  Uint8List rlCopyFramebuffer(
    num x,
    num y,
    num width,
    num height,
    PixelFormat format,
  );
  
  /// Resize internal framebuffer
  void rlResizeFramebuffer(
    num width,
    num height,
  );

  /// Load (compile) shader and return shader id
  int rlLoadShader(
    String code,
    RlShaderType type,
  );

  /// Load shader from code strings
  int rlLoadShaderProgram(
    String vsCode,
    String fsCode,
  );

  /// Load shader program, using already loaded shader ids
  int rlLoadShaderProgramEx(
    num vsId,
    num fsId,
  );
  
  /// Load compute shader program
  int rlLoadShaderProgramCompute(
    num csId,
  );
  
  /// Unload shader, loaded with rlLoadShader()
  void rlUnloadShader(
    num id,
  );

  /// Unload shader program
  void rlUnloadShaderProgram(
    num id,
  );

  /// Get shader location uniform, requires shader program id
  int rlGetLocationUniform(
    num shaderId,
    String uniformName,
  );

  /// Get shader location attribute, requires shader program id
  int rlGetLocationAttrib(
    num shaderId,
    String attribName,
  );

  /// Set shader value uniform
  void rlSetUniform(
    num locIndex,
    TypedDataList value,
    RlShaderUniformDataType uniformType,
    num count,
  );

  /// Set shader value matrix
  void rlSetUniformMatrix(
    num locIndex,
    MatrixStructType mat,
  );

  /// Set shader value matrices
  void rlSetUniformMatrices(
    num locIndex,
    List<MatrixStructType> mat,
  );

  /// Set shader value sampler
  void rlSetUniformSampler(
    num locIndex,
    num textureId,
  );

  /// Set shader currently active (id and locations)
  void rlSetShader(
    num id,
    List<int> locs,
  );

  /// Dispatch compute shader (equivalent to *draw* for graphics pipeline)
  void rlComputeShaderDispatch(
    num groupX,
    num groupY,
    num groupZ,
  );

  /// Load shader storage buffer object (SSBO)
  int rlLoadShaderBuffer(
    num size,
    TypedDataList? data,
    RlUsageHint? usageHint,
  );

  /// Unload shader storage buffer object (SSBO)
  void rlUnloadShaderBuffer(
    num ssboId,
  );

  /// Update SSBO buffer data
  void rlUpdateShaderBuffer(
    num id,
    TypedDataList data,
    num offset,
  );

  /// Bind SSBO buffer
  void rlBindShaderBuffer(
    num id,
    num index,
  );

  /// Read SSBO buffer data (GPU->CPU)
  Uint8List rlReadShaderBuffer(
    num id,
    num count,
    num offset,
  );

  /// Copy SSBO data between buffers
  void rlCopyShaderBuffer(
    num destId,
    num srcId,
    num destOffset,
    num srcOffset,
    num count,
  );

  /// Get SSBO buffer size
  int rlGetShaderBufferSize(
    num id,
  );

  /// Bind image texture
  void rlBindImageTexture(
    num id,
    num index,
    PixelFormat format,
    bool readonly,
  );

  /// Get internal modelview matrix
  MatrixStructType rlGetMatrixModelview();

  /// Get internal projection matrix
  MatrixStructType rlGetMatrixProjection();

  /// Get internal accumulated transform matrix
  MatrixStructType rlGetMatrixTransform();

  /// Get internal projection matrix for stereo render (selected eye)
  MatrixStructType rlGetMatrixProjectionStereo(
    num eye,
  );

  /// Get internal view offset matrix for stereo render (selected eye)
  MatrixStructType rlGetMatrixViewOffsetStereo(
    num eye,
  );

  /// Set a custom projection matrix (replaces internal projection matrix)
  void rlSetMatrixProjection(
    MatrixStructType proj,
  );

  /// Set a custom modelview matrix (replaces internal modelview matrix)
  void rlSetMatrixModelview(
    MatrixStructType view,
  );

  /// Set eyes projection matrices for stereo rendering
  void rlSetMatrixProjectionStereo(
    MatrixStructType right,
    MatrixStructType left,
  );

  /// Set eyes view offsets matrices for stereo rendering
  void rlSetMatrixViewOffsetStereo(
    MatrixStructType right,
    MatrixStructType left,
  );

  /// Load and draw a cube
  void rlLoadDrawCube();

  /// Load and draw a quad
  void rlLoadDrawQuad();
}
