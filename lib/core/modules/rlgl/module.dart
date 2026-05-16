part of '../../raylib_dartified_base.dart';

mixin RaylibRlglModuleExtras on RaylibModuleBase {
  String get RLGL_VERSION => '5.0';
  int get RL_DEFAULT_BATCH_BUFFER_ELEMENTS => 8192;
  int get RL_DEFAULT_BATCH_BUFFERS => 1;
  int get RL_DEFAULT_BATCH_DRAWCALLS => 256;
  int get RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS => 4;
  int get RL_MAX_MATRIX_STACK_SIZE => 32;
  int get RL_MAX_SHADER_LOCATIONS => 32;
  double get RL_CULL_DISTANCE_NEAR => 0.01;
  double get RL_CULL_DISTANCE_FAR => 1000.0;
  int get RL_TEXTURE_WRAP_S => 10242;
  int get RL_TEXTURE_WRAP_T => 10243;
  int get RL_TEXTURE_MAG_FILTER => 10240;
  int get RL_TEXTURE_MIN_FILTER => 10241;
  int get RL_TEXTURE_FILTER_NEAREST => 9728;
  int get RL_TEXTURE_FILTER_LINEAR => 9729;
  int get RL_TEXTURE_FILTER_MIP_NEAREST => 9984;
  int get RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR => 9986;
  int get RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST => 9985;
  int get RL_TEXTURE_FILTER_MIP_LINEAR => 9987;
  int get RL_TEXTURE_FILTER_ANISOTROPIC => 12288;
  int get RL_TEXTURE_MIPMAP_BIAS_RATIO => 16384;
  int get RL_TEXTURE_WRAP_REPEAT => 10497;
  int get RL_TEXTURE_WRAP_CLAMP => 33071;
  int get RL_TEXTURE_WRAP_MIRROR_REPEAT => 33648;
  int get RL_TEXTURE_WRAP_MIRROR_CLAMP => 34626;
  int get RL_MODELVIEW => 5888;
  int get RL_PROJECTION => 5889;
  int get RL_TEXTURE => 5890;
  int get RL_LINES => 1;
  int get RL_TRIANGLES => 4;
  int get RL_QUADS => 7;
  int get RL_UNSIGNED_BYTE => 5121;
  int get RL_FLOAT => 5126;
  int get RL_STREAM_DRAW => 35040;
  int get RL_STREAM_READ => 35041;
  int get RL_STREAM_COPY => 35042;
  int get RL_STATIC_DRAW => 35044;
  int get RL_STATIC_READ => 35045;
  int get RL_STATIC_COPY => 35046;
  int get RL_DYNAMIC_DRAW => 35048;
  int get RL_DYNAMIC_READ => 35049;
  int get RL_DYNAMIC_COPY => 35050;
  int get RL_FRAGMENT_SHADER => 35632;
  int get RL_VERTEX_SHADER => 35633;
  int get RL_COMPUTE_SHADER => 37305;
  int get RL_ZERO => 0;
  int get RL_ONE => 1;
  int get RL_SRC_COLOR => 768;
  int get RL_ONE_MINUS_SRC_COLOR => 769;
  int get RL_SRC_ALPHA => 770;
  int get RL_ONE_MINUS_SRC_ALPHA => 771;
  int get RL_DST_ALPHA => 772;
  int get RL_ONE_MINUS_DST_ALPHA => 773;
  int get RL_DST_COLOR => 774;
  int get RL_ONE_MINUS_DST_COLOR => 775;
  int get RL_SRC_ALPHA_SATURATE => 776;
  int get RL_CONSTANT_COLOR => 32769;
  int get RL_ONE_MINUS_CONSTANT_COLOR => 32770;
  int get RL_CONSTANT_ALPHA => 32771;
  int get RL_ONE_MINUS_CONSTANT_ALPHA => 32772;
  int get RL_FUNC_ADD => 32774;
  int get RL_MIN => 32775;
  int get RL_MAX => 32776;
  int get RL_FUNC_SUBTRACT => 32778;
  int get RL_FUNC_REVERSE_SUBTRACT => 32779;
  int get RL_BLEND_EQUATION => 32777;
  int get RL_BLEND_EQUATION_RGB => 32777;
  int get RL_BLEND_EQUATION_ALPHA => 34877;
  int get RL_BLEND_DST_RGB => 32968;
  int get RL_BLEND_SRC_RGB => 32969;
  int get RL_BLEND_DST_ALPHA => 32970;
  int get RL_BLEND_SRC_ALPHA => 32971;
  int get RL_BLEND_COLOR => 32773;
  int get RL_READ_FRAMEBUFFER => 36008;
  int get RL_DRAW_FRAMEBUFFER => 36009;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION => 0;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD => 1;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL => 2;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR => 3;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT => 4;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 => 5;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES => 6;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS => 7;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS => 8;
  int get RL_SHADER_LOC_MAP_DIFFUSE => 15;
  int get RL_SHADER_LOC_MAP_SPECULAR => 16;
}

abstract interface class RaylibRlglModuleBase<
  // types
  MatrixStructType extends MatrixBase,
  RlRenderBatchStructType extends RlRenderBatchBase
  
> with RaylibModuleBase {

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
    TypedData buffer,
    bool dynamic,
  );

  int rlLoadVertexBufferElement(
    TypedData buffer,
    bool dynamic,
  );

  void rlUpdateVertexBuffer(
    num bufferId,
    TypedData data,
    num offset,
  );

  void rlUpdateVertexBufferElements(
    num id,
    TypedData data,
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

  List<int> rlReadScreenPixels(
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
    TypedData value,
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
    TypedData? data,
    RlUsageHint? usageHint,
  );

  void rlUnloadShaderBuffer(
    num ssboId,
  );

  void rlUpdateShaderBuffer(
    num id,
    TypedData data,
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
