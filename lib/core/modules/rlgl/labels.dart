part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Rlgl module function call,
/// logged to the console when debug output is enabled.
class RaylibRlglModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibRlglModuleBase.rlMatrixMode].
  String rlMatrixMode(
    RlMatrixMode mode,
  ) => 'rlMatrixMode(${mode.name})';

  /// Label for [RaylibRlglModuleBase.rlPushMatrix].
  String rlPushMatrix() => 'rlPushMatrix()';

  /// Label for [RaylibRlglModuleBase.rlPopMatrix].
  String rlPopMatrix() => 'rlPopMatrix()';

  /// Label for [RaylibRlglModuleBase.rlLoadIdentity].
  String rlLoadIdentity() => 'rlLoadIdentity()';

  /// Label for [RaylibRlglModuleBase.rlTranslatef].
  String rlTranslatef(
    num x,
    num y,
    num z,
  ) => 'rlTranslatef($x, $y, $z)';

  /// Label for [RaylibRlglModuleBase.rlRotatef].
  String rlRotatef(
    num angle,
    num x,
    num y,
    num z,
  ) => 'rlRotatef($angle, $x, $y, $z)';

  /// Label for [RaylibRlglModuleBase.rlScalef].
  String rlScalef(
    num x,
    num y,
    num z,
  ) => 'rlScalef($x, $y, $z)';

  /// Label for [RaylibRlglModuleBase.rlMultMatrixf].
  String rlMultMatrixf(
    List<double> matf,
  ) => 'rlMultMatrixf($matf)';

  /// Label for [RaylibRlglModuleBase.rlFrustum].
  String rlFrustum(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => 'rlFrustum($left, $right, $bottom, $top, $znear, $zfar)';

  /// Label for [RaylibRlglModuleBase.rlOrtho].
  String rlOrtho(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => 'rlOrtho($left, $right, $bottom, $top, $znear, $zfar)';

  /// Label for [RaylibRlglModuleBase.rlViewport].
  String rlViewport(
    num x,
    num y,
    num width,
    num height,
  ) => 'rlViewport($x, $y, $width, $height)';

  /// Label for [RaylibRlglModuleBase.rlSetClipPlanes].
  String rlSetClipPlanes(
    num nearPlane,
    num farPlane,
  ) => 'rlSetClipPlanes($nearPlane, $farPlane)';

  /// Label for [RaylibRlglModuleBase.rlGetCullDistanceNear].
  String rlGetCullDistanceNear() => 'rlGetCullDistanceNear()';

  /// Label for [RaylibRlglModuleBase.rlGetCullDistanceFar].
  String rlGetCullDistanceFar() => 'rlGetCullDistanceFar()';

  /// Label for [RaylibRlglModuleBase.rlBegin].
  String rlBegin(
    RlDrawMode mode,
  ) => 'rlBegin(${mode.name})';

  /// Label for [RaylibRlglModuleBase.rlEnd].
  String rlEnd() => 'rlEnd()';

  /// Label for [RaylibRlglModuleBase.rlVertex2i].
  String rlVertex2i(
    num x,
    num y,
  ) => 'rlVertex2i($x, $y)';

  /// Label for [RaylibRlglModuleBase.rlVertex2f].
  String rlVertex2f(
    num x,
    num y,
  ) => 'rlVertex2f($x, $y)';

  /// Label for [RaylibRlglModuleBase.rlVertex3f].
  String rlVertex3f(
    num x,
    num y,
    num z,
  ) => 'rlVertex3f($x, $y, $z)';

  /// Label for [RaylibRlglModuleBase.rlTexCoord2f].
  String rlTexCoord2f(
    num x,
    num y,
  ) => 'rlTexCoord2f($x, $y)';

  /// Label for [RaylibRlglModuleBase.rlNormal3f].
  String rlNormal3f(
    num x,
    num y,
    num z,
  ) => 'rlNormal3f($x, $y, $z)';

  /// Label for [RaylibRlglModuleBase.rlColor4ub].
  String rlColor4ub(
    num r,
    num g,
    num b,
    num a,
  ) => 'rlColor4ub($r, $g, $b, $a)';

  /// Label for [RaylibRlglModuleBase.rlColor3f].
  String rlColor3f(
    num x,
    num y,
    num z,
  ) => 'rlColor3f($x, $y, $z)';

  /// Label for [RaylibRlglModuleBase.rlColor4f].
  String rlColor4f(
    num x,
    num y,
    num z,
    num w,
  ) => 'rlColor4f($x, $y, $z, $w)';

  /// Label for [RaylibRlglModuleBase.rlEnableVertexArray].
  String rlEnableVertexArray(
    num vaoId,
  ) => 'rlEnableVertexArray($vaoId)';

  /// Label for [RaylibRlglModuleBase.rlDisableVertexArray].
  String rlDisableVertexArray() => 'rlDisableVertexArray()';

  /// Label for [RaylibRlglModuleBase.rlEnableVertexBuffer].
  String rlEnableVertexBuffer(
    num id,
  ) => 'rlEnableVertexBuffer($id)';

  /// Label for [RaylibRlglModuleBase.rlDisableVertexBuffer].
  String rlDisableVertexBuffer() => 'rlDisableVertexBuffer()';

  /// Label for [RaylibRlglModuleBase.rlEnableVertexBufferElement].
  String rlEnableVertexBufferElement(
    num id,
  ) => 'rlEnableVertexBufferElement($id)';

  /// Label for [RaylibRlglModuleBase.rlDisableVertexBufferElement].
  String rlDisableVertexBufferElement() => 'rlDisableVertexBufferElement()';

  /// Label for [RaylibRlglModuleBase.rlEnableVertexAttribute].
  String rlEnableVertexAttribute(
    num index,
  ) => 'rlEnableVertexAttribute($index)';

  /// Label for [RaylibRlglModuleBase.rlDisableVertexAttribute].
  String rlDisableVertexAttribute(
    num index,
  ) => 'rlDisableVertexAttribute($index)';

  /// Label for [RaylibRlglModuleBase.rlActiveTextureSlot].
  String rlActiveTextureSlot(
    num slot,
  ) => 'rlActiveTextureSlot($slot)';

  /// Label for [RaylibRlglModuleBase.rlEnableTexture].
  String rlEnableTexture(
    num id,
  ) => 'rlEnableTexture($id)';

  /// Label for [RaylibRlglModuleBase.rlDisableTexture].
  String rlDisableTexture() => 'rlDisableTexture()';

  /// Label for [RaylibRlglModuleBase.rlEnableTextureCubemap].
  String rlEnableTextureCubemap(
    num id,
  ) => 'rlEnableTextureCubemap($id)';

  /// Label for [RaylibRlglModuleBase.rlDisableTextureCubemap].
  String rlDisableTextureCubemap() => 'rlDisableTextureCubemap()';

  /// Label for [RaylibRlglModuleBase.rlTextureParameters].
  String rlTextureParameters(
    num id,
    num param,
    num value,
  ) => 'rlTextureParameters($id, $param, $value)';

  /// Label for [RaylibRlglModuleBase.rlCubemapParameters].
  String rlCubemapParameters(
    num id,
    num param,
    num value,
  ) => 'rlCubemapParameters($id, $param, $value)';

  /// Label for [RaylibRlglModuleBase.rlEnableShader].
  String rlEnableShader(
    num id,
  ) => 'rlEnableShader($id)';

  /// Label for [RaylibRlglModuleBase.rlDisableShader].
  String rlDisableShader() => 'rlDisableShader()';

  /// Label for [RaylibRlglModuleBase.rlEnableFramebuffer].
  String rlEnableFramebuffer(
    num id,
  ) => 'rlEnableFramebuffer($id)';

  /// Label for [RaylibRlglModuleBase.rlDisableFramebuffer].
  String rlDisableFramebuffer() => 'rlDisableFramebuffer()';

  /// Label for [RaylibRlglModuleBase.rlGetActiveFramebuffer].
  String rlGetActiveFramebuffer() => 'rlGetActiveFramebuffer()';

  /// Label for [RaylibRlglModuleBase.rlActiveDrawBuffers].
  String rlActiveDrawBuffers(
    num count,
  ) => 'rlActiveDrawBuffers($count)';

  /// Label for [RaylibRlglModuleBase.rlBlitFramebuffer].
  String rlBlitFramebuffer(
    num srcX,
    num srcY,
    num srcWidth,
    num srcHeight,
    num dstX,
    num dstY,
    num dstWidth,
    num dstHeight,
    num bufferMask,
  ) => 'rlBlitFramebuffer($srcX, $srcY, $srcWidth, $srcHeight, $dstX, $dstY, $dstWidth, $dstHeight, $bufferMask)';

  /// Label for [RaylibRlglModuleBase.rlBindFramebuffer].
  String rlBindFramebuffer(
    num target,
    num framebuffer,
  ) => 'rlBindFramebuffer($target, $framebuffer)';

  /// Label for [RaylibRlglModuleBase.rlEnableColorBlend].
  String rlEnableColorBlend() => 'rlEnableColorBlend()';

  /// Label for [RaylibRlglModuleBase.rlDisableColorBlend].
  String rlDisableColorBlend() => 'rlDisableColorBlend()';

  /// Label for [RaylibRlglModuleBase.rlEnableDepthTest].
  String rlEnableDepthTest() => 'rlEnableDepthTest()';

  /// Label for [RaylibRlglModuleBase.rlDisableDepthTest].
  String rlDisableDepthTest() => 'rlDisableDepthTest()';

  /// Label for [RaylibRlglModuleBase.rlEnableDepthMask].
  String rlEnableDepthMask() => 'rlEnableDepthMask()';

  /// Label for [RaylibRlglModuleBase.rlDisableDepthMask].
  String rlDisableDepthMask() => 'rlDisableDepthMask()';

  /// Label for [RaylibRlglModuleBase.rlEnableBackfaceCulling].
  String rlEnableBackfaceCulling() => 'rlEnableBackfaceCulling()';

  /// Label for [RaylibRlglModuleBase.rlDisableBackfaceCulling].
  String rlDisableBackfaceCulling() => 'rlDisableBackfaceCulling()';

  /// Label for [RaylibRlglModuleBase.rlColorMask].
  String rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => 'rlColorMask($r, $g, $b, $a)';

  /// Label for [RaylibRlglModuleBase.rlSetCullFace].
  String rlSetCullFace(
    RlCullMode mode,
  ) => 'rlSetCullFace(${mode.name})';

  /// Label for [RaylibRlglModuleBase.rlEnableScissorTest].
  String rlEnableScissorTest() => 'rlEnableScissorTest()';

  /// Label for [RaylibRlglModuleBase.rlDisableScissorTest].
  String rlDisableScissorTest() => 'rlDisableScissorTest()';

  /// Label for [RaylibRlglModuleBase.rlScissor].
  String rlScissor(
    num x,
    num y,
    num width,
    num height,
  ) => 'rlScissor($x, $y, $width, $height)';

  /// Label for [RaylibRlglModuleBase.rlEnableWireMode].
  String rlEnableWireMode() => 'rlEnableWireMode()';

  /// Label for [RaylibRlglModuleBase.rlEnablePointMode].
  String rlEnablePointMode() => 'rlEnablePointMode()';

  /// Label for [RaylibRlglModuleBase.rlDisableWireMode].
  String rlDisableWireMode() => 'rlDisableWireMode()';

  /// Label for [RaylibRlglModuleBase.rlSetLineWidth].
  String rlSetLineWidth(
    num width,
  ) => 'rlSetLineWidth($width)';

  /// Label for [RaylibRlglModuleBase.rlGetLineWidth].
  String rlGetLineWidth() => 'rlGetLineWidth()';

  /// Label for [RaylibRlglModuleBase.rlEnableSmoothLines].
  String rlEnableSmoothLines() => 'rlEnableSmoothLines()';

  /// Label for [RaylibRlglModuleBase.rlDisableSmoothLines].
  String rlDisableSmoothLines() => 'rlDisableSmoothLines()';

  /// Label for [RaylibRlglModuleBase.rlEnableStereoRender].
  String rlEnableStereoRender() => 'rlEnableStereoRender()';

  /// Label for [RaylibRlglModuleBase.rlDisableStereoRender].
  String rlDisableStereoRender() => 'rlDisableStereoRender()';

  /// Label for [RaylibRlglModuleBase.rlIsStereoRenderEnabled].
  String rlIsStereoRenderEnabled() => 'rlIsStereoRenderEnabled()';

  /// Label for [RaylibRlglModuleBase.rlClearColor].
  String rlClearColor(
    num r,
    num g,
    num b,
    num a,
  ) => 'rlClearColor($r, $g, $b, $a)';

  /// Label for [RaylibRlglModuleBase.rlClearScreenBuffers].
  String rlClearScreenBuffers() => 'rlClearScreenBuffers()';

  /// Label for [RaylibRlglModuleBase.rlCheckErrors].
  String rlCheckErrors() => 'rlCheckErrors()';

  /// Label for [RaylibRlglModuleBase.rlSetBlendMode].
  String rlSetBlendMode(
    BlendMode mode,
  ) => 'rlSetBlendMode(${mode.name})';

  /// Label for [RaylibRlglModuleBase.rlSetBlendFactors].
  String rlSetBlendFactors(
    num glSrcFactor,
    num glDstFactor,
    num glEquation,
  ) => 'rlSetBlendFactors($glSrcFactor, $glDstFactor, $glEquation)';

  /// Label for [RaylibRlglModuleBase.rlSetBlendFactorsSeparate].
  String rlSetBlendFactorsSeparate(
    num glSrcRGB,
    num glDstRGB,
    num glSrcAlpha,
    num glDstAlpha,
    num glEqRGB,
    num glEqAlpha,
  ) => 'rlSetBlendFactorsSeparate($glSrcRGB, $glDstRGB, $glSrcAlpha, $glDstAlpha, $glEqRGB, $glEqAlpha)';

  /// Label for [RaylibRlglModuleBase.rlglInit].
  String rlglInit(
    num width,
    num height,
  ) => 'rlglInit($width, $height)';

  /// Label for [RaylibRlglModuleBase.rlglClose].
  String rlglClose() => 'rlglClose()';

  /// Label for [RaylibRlglModuleBase.rlGetVersion].
  String rlGetVersion() => 'rlGetVersion()';

  /// Label for [RaylibRlglModuleBase.rlSetFramebufferWidth].
  String rlSetFramebufferWidth(
    num width,
  ) => 'rlSetFramebufferWidth($width)';

  /// Label for [RaylibRlglModuleBase.rlGetFramebufferWidth].
  String rlGetFramebufferWidth() => 'rlGetFramebufferWidth()';

  /// Label for [RaylibRlglModuleBase.rlSetFramebufferHeight].
  String rlSetFramebufferHeight(
    num height,
  ) => 'rlSetFramebufferHeight($height)';

  /// Label for [RaylibRlglModuleBase.rlGetFramebufferHeight].
  String rlGetFramebufferHeight() => 'rlGetFramebufferHeight()';

  /// Label for [RaylibRlglModuleBase.rlGetTextureIdDefault].
  String rlGetTextureIdDefault() => 'rlGetTextureIdDefault()';

  /// Label for [RaylibRlglModuleBase.rlGetShaderIdDefault].
  String rlGetShaderIdDefault() => 'rlGetShaderIdDefault()';

  /// Label for [RaylibRlglModuleBase.rlGetShaderLocsDefault].
  String rlGetShaderLocsDefault() => 'rlGetShaderLocsDefault()';

  /// Label for [RaylibRlglModuleBase.rlLoadRenderBatch].
  String rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  ) => 'rlLoadRenderBatch($numBuffers, $bufferElements)';

  /// Label for [RaylibRlglModuleBase.rlUnloadRenderBatch].
  String rlUnloadRenderBatch(
    RlRenderBatchBase batch,
  ) => 'rlUnloadRenderBatch($batch)';

  /// Label for [RaylibRlglModuleBase.rlDrawRenderBatch].
  String rlDrawRenderBatch(
    RlRenderBatchBase batch,
  ) => 'rlDrawRenderBatch($batch)';

  /// Label for [RaylibRlglModuleBase.rlSetRenderBatchActive].
  String rlSetRenderBatchActive(
    RlRenderBatchBase batch,
  ) => 'rlSetRenderBatchActive($batch)';

  /// Label for [RaylibRlglModuleBase.rlDrawRenderBatchActive].
  String rlDrawRenderBatchActive() => 'rlDrawRenderBatchActive()';

  /// Label for [RaylibRlglModuleBase.rlCheckRenderBatchLimit].
  String rlCheckRenderBatchLimit(
    num vCount,
  ) => 'rlCheckRenderBatchLimit($vCount)';

  /// Label for [RaylibRlglModuleBase.rlSetTexture].
  String rlSetTexture(
    num id,
  ) => 'rlSetTexture($id)';

  /// Label for [RaylibRlglModuleBase.rlLoadVertexArray].
  String rlLoadVertexArray() => 'rlLoadVertexArray()';

  /// Label for [RaylibRlglModuleBase.rlLoadVertexBuffer].
  String rlLoadVertexBuffer(
    TypedDataList buffer,
    bool dynamic,
  ) => 'rlLoadVertexBuffer(${buffer.lengthInBytes}, $dynamic)';

  /// Label for [RaylibRlglModuleBase.rlLoadVertexBufferElement].
  String rlLoadVertexBufferElement(
    TypedDataList buffer,
    bool dynamic,
  ) => 'rlLoadVertexBufferElement(${buffer.lengthInBytes}, $dynamic)';

  /// Label for [RaylibRlglModuleBase.rlUpdateVertexBuffer].
  String rlUpdateVertexBuffer(
    num bufferId,
    TypedDataList data,
    num offset,
  ) => 'rlUpdateVertexBuffer($bufferId, ${data.lengthInBytes}, $offset)';

  /// Label for [RaylibRlglModuleBase.rlUpdateVertexBufferElements].
  String rlUpdateVertexBufferElements(
    num id,
    TypedDataList data,
    num offset,
  ) => 'rlLoadVertexBufferElement($id, ${data.lengthInBytes}, $offset)';

  /// Label for [RaylibRlglModuleBase.rlUnloadVertexArray].
  String rlUnloadVertexArray(
    num vaoId,
  ) => 'rlUnloadVertexArray($vaoId)';

  /// Label for [RaylibRlglModuleBase.rlUnloadVertexBuffer].
  String rlUnloadVertexBuffer(
    num vboId,
  ) => 'rlUnloadVertexBuffer($vboId)';

  /// Label for [RaylibRlglModuleBase.rlSetVertexAttribute].
  String rlSetVertexAttribute(
    num index,
    num compSize,
    num type,
    bool normalized,
    num stride,
    num offset,
  ) => 'rlSetVertexAttribute($index, $compSize, $type, $normalized, $stride, $offset)';

  /// Label for [RaylibRlglModuleBase.rlSetVertexAttributeDivisor].
  String rlSetVertexAttributeDivisor(
    num index,
    num divisor,
  ) => 'rlSetVertexAttributeDivisor($index, $divisor)';

  /// Label for [RaylibRlglModuleBase.rlSetVertexAttributeDefault].
  String rlSetVertexAttributeDefault(
    num locIndex,
    Float32List value,
    RlShaderAttributeDataType attribType,
  ) => 'rlSetVertexAttributeDefault($locIndex, ${value.length}, ${attribType.name})';

  /// Label for [RaylibRlglModuleBase.rlDrawVertexArray].
  String rlDrawVertexArray(
    num offset,
    num count,
  ) => 'rlDrawVertexArray($offset, $count)';

  /// Label for [RaylibRlglModuleBase.rlDrawVertexArrayElements].
  String rlDrawVertexArrayElements(
    num offset,
    num count,
    Uint16List buffer,
  ) => 'rlDrawVertexArrayElements($offset, ${buffer.length})';

  /// Label for [RaylibRlglModuleBase.rlDrawVertexArrayInstanced].
  String rlDrawVertexArrayInstanced(
    num offset,
    num count,
    num instances,
  ) => 'rlDrawVertexArrayInstanced($offset, $count, $instances)';

  /// Label for [RaylibRlglModuleBase.rlDrawVertexArrayElementsInstanced].
  String rlDrawVertexArrayElementsInstanced(
    num offset,
    num count,
    Uint16List buffer,
    num instances,
  ) => 'rlDrawVertexArrayElementsInstanced($offset, $count, ${buffer.length}, $instances)';

  /// Label for [RaylibRlglModuleBase.rlLoadTexture].
  String rlLoadTexture(
    Uint8List? data,
    num width,
    num height,
    PixelFormat format,
    num mipmapCount,
  ) => 'rlLoadTexture(${data?.length}, $width, $height, $format, $mipmapCount)';

  /// Label for [RaylibRlglModuleBase.rlLoadTextureDepth].
  String rlLoadTextureDepth(
    num width,
    num height,
    bool useRenderBuffer,
  ) => 'rlLoadTextureDepth($width, $height, $useRenderBuffer)';

  /// Label for [RaylibRlglModuleBase.rlLoadTextureCubemap].
  String rlLoadTextureCubemap(
    Uint8List? data,
    num size,
    PixelFormat format,
    num mipmapCount,
  ) => 'rlLoadTextureCubemap(${data?.length}, $size, ${format.name}, $mipmapCount)';

  /// Label for [RaylibRlglModuleBase.rlUpdateTexture].
  String rlUpdateTexture(
    num id,
    num offsetX,
    num offsetY,
    num width,
    num height,
    PixelFormat format,
    Uint8List data,
  ) => 'rlUpdateTexture($id, $offsetX, $offsetY, $width, $height, ${format.name}, ${data.length})';

  /// Label for [RaylibRlglModuleBase.rlGetGlTextureFormats].
  String rlGetGlTextureFormats(
    PixelFormat format,
  ) => 'rlGetGlTextureFormats(${format.name})';

  /// Label for [RaylibRlglModuleBase.rlGetPixelFormatName].
  String rlGetPixelFormatName(
    PixelFormat format,
  ) => 'rlGetPixelFormatName(${format.name})';

  /// Label for [RaylibRlglModuleBase.rlUnloadTexture].
  String rlUnloadTexture(
    num id,
  ) => 'rlUnloadTexture($id)';

  /// Label for [RaylibRlglModuleBase.rlGenTextureMipmaps].
  String rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlGenTextureMipmaps($id, $width, $height, ${format.name})';

  /// Label for [RaylibRlglModuleBase.rlReadTexturePixels].
  String rlReadTexturePixels(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlReadTexturePixels($id, $width, $height, ${format.name})';

  /// Label for [RaylibRlglModuleBase.rlReadScreenPixels].
  String rlReadScreenPixels(
    num width,
    num height,
  ) => 'rlReadScreenPixels($width, $height)';

  /// Label for [RaylibRlglModuleBase.rlLoadFramebuffer].
  String rlLoadFramebuffer() => 'rlLoadFramebuffer()';

  /// Label for [RaylibRlglModuleBase.rlFramebufferAttach].
  String rlFramebufferAttach(
    num fboId,
    num texId,
    RlFramebufferAttachType attachType,
    RlFramebufferAttachTextureType texType,
    num mipLevel,
  ) => 'rlFramebufferAttach($fboId, $texId, ${attachType.name}, ${texType.name}, $mipLevel)';

  /// Label for [RaylibRlglModuleBase.rlFramebufferComplete].
  String rlFramebufferComplete(
    num id,
  ) => 'rlFramebufferComplete($id)';

  /// Label for [RaylibRlglModuleBase.rlUnloadFramebuffer].
  String rlUnloadFramebuffer(
    num id,
  ) => 'rlUnloadFramebuffer($id)';

  /// Label for [RaylibRlglModuleBase.rlLoadShaderCode].
  String rlLoadShaderCode(
    String? vsCode,
    String? fsCode,
  ) => 'rlLoadShaderCode(vsCode: ${vsCode?.length}, fsCode: ${fsCode?.length})';

  /// Label for [RaylibRlglModuleBase.rlCompileShader].
  String rlCompileShader(
    String shaderCode,
    RlShaderType type,
  ) => 'rlCompileShader(shaderCode: ${shaderCode.length}, ${type.name})';

  /// Label for [RaylibRlglModuleBase.rlLoadShaderProgram].
  String rlLoadShaderProgram(
    num vShaderId,
    num fShaderId,
  ) => 'rlLoadShaderProgram($vShaderId, $fShaderId)';

  /// Label for [RaylibRlglModuleBase.rlUnloadShaderProgram].
  String rlUnloadShaderProgram(
    num id,
  ) => 'rlUnloadShaderProgram($id)';

  /// Label for [RaylibRlglModuleBase.rlGetLocationUniform].
  String rlGetLocationUniform(
    num shaderId,
    String uniformName,
  ) => 'rlGetLocationUniform($shaderId, $uniformName)';

  /// Label for [RaylibRlglModuleBase.rlGetLocationAttrib].
  String rlGetLocationAttrib(
    num shaderId,
    String attribName,
  ) => 'rlGetLocationAttrib($shaderId, $attribName)';

  /// Label for [RaylibRlglModuleBase.rlSetUniform].
  String rlSetUniform(
    num locIndex,
    TypedDataList value,
    RlShaderUniformDataType uniformType,
    num count,
  ) => 'rlSetUniform($locIndex, ${value.lengthInBytes}, ${uniformType.name})';

  /// Label for [RaylibRlglModuleBase.rlSetUniformMatrix].
  String rlSetUniformMatrix(
    num locIndex,
    MatrixBase mat,
  ) => 'rlSetUniformMatrix($locIndex, $mat)';

  /// Label for [RaylibRlglModuleBase.rlSetUniformMatrices].
  String rlSetUniformMatrices(
    num locIndex,
    List<MatrixBase> mat,
  ) => 'rlSetUniformMatrices($locIndex, mat: ${mat.length})';

  /// Label for [RaylibRlglModuleBase.rlSetUniformSampler].
  String rlSetUniformSampler(
    num locIndex,
    num textureId,
  ) => 'rlSetUniformSampler($locIndex, $textureId)';

  /// Label for [RaylibRlglModuleBase.rlSetShader].
  String rlSetShader(
    num id,
    List<int> locs,
  ) => 'rlSetShader($id, $locs)';

  /// Label for [RaylibRlglModuleBase.rlLoadComputeShaderProgram].
  String rlLoadComputeShaderProgram(
    num shaderId,
  ) => 'rlLoadComputeShaderProgram($shaderId)';

  /// Label for [RaylibRlglModuleBase.rlComputeShaderDispatch].
  String rlComputeShaderDispatch(
    num groupX,
    num groupY,
    num groupZ,
  ) => 'rlComputeShaderDispatch($groupX, $groupY, $groupZ)';

  /// Label for [RaylibRlglModuleBase.rlLoadShaderBuffer].
  String rlLoadShaderBuffer(
    num size,
    TypedDataList? data,
    RlUsageHint? usageHint,
  ) => 'rlLoadShaderBuffer($size, data: ${data?.lengthInBytes}, $usageHint)';

  /// Label for [RaylibRlglModuleBase.rlUnloadShaderBuffer].
  String rlUnloadShaderBuffer(
    num ssboId,
  ) => 'rlUnloadShaderBuffer($ssboId)';

  /// Label for [RaylibRlglModuleBase.rlUpdateShaderBuffer].
  String rlUpdateShaderBuffer(
    num id,
    TypedDataList data,
    num offset,
  ) => 'rlUpdateShaderBuffer($id, data: ${data.lengthInBytes}, $offset)';

  /// Label for [RaylibRlglModuleBase.rlBindShaderBuffer].
  String rlBindShaderBuffer(
    num id,
    num index,
  ) => 'rlBindShaderBuffer($id, $index)';

  /// Label for [RaylibRlglModuleBase.rlReadShaderBuffer].
  String rlReadShaderBuffer(
    num id,
    num count,
    num offset,
  ) => 'rlReadShaderBuffer($id, $count, $offset)';

  /// Label for [RaylibRlglModuleBase.rlCopyShaderBuffer].
  String rlCopyShaderBuffer(
    num destId,
    num srcId,
    num destOffset,
    num srcOffset,
    num count,
  ) => 'rlCopyShaderBuffer($destId, $srcId, $destOffset, $srcOffset, $count)';

  /// Label for [RaylibRlglModuleBase.rlGetShaderBufferSize].
  String rlGetShaderBufferSize(
    num id,
  ) => 'rlGetShaderBufferSize($id)';

  /// Label for [RaylibRlglModuleBase.rlBindImageTexture].
  String rlBindImageTexture(
    num id,
    num index,
    PixelFormat format,
    bool readonly,
  ) => 'rlBindImageTexture($id, $index, ${format.name}, $readonly)';

  /// Label for [RaylibRlglModuleBase.rlGetMatrixModelview].
  String rlGetMatrixModelview() => 'rlGetMatrixModelview()';

  /// Label for [RaylibRlglModuleBase.rlGetMatrixProjection].
  String rlGetMatrixProjection() => 'rlGetMatrixProjection()';

  /// Label for [RaylibRlglModuleBase.rlGetMatrixTransform].
  String rlGetMatrixTransform() => 'rlGetMatrixTransform()';

  /// Label for [RaylibRlglModuleBase.rlGetMatrixProjectionStereo].
  String rlGetMatrixProjectionStereo(
    num eye,
  ) => 'rlGetMatrixProjectionStereo($eye)';

  /// Label for [RaylibRlglModuleBase.rlGetMatrixViewOffsetStereo].
  String rlGetMatrixViewOffsetStereo(
    num eye,
  ) => 'rlGetMatrixViewOffsetStereo($eye)';

  /// Label for [RaylibRlglModuleBase.rlSetMatrixProjection].
  String rlSetMatrixProjection(
    MatrixBase proj,
  ) => 'rlSetMatrixProjection($proj)';

  /// Label for [RaylibRlglModuleBase.rlSetMatrixModelview].
  String rlSetMatrixModelview(
    MatrixBase view,
  ) => 'rlSetMatrixModelview($view)';

  /// Label for [RaylibRlglModuleBase.rlSetMatrixProjectionStereo].
  String rlSetMatrixProjectionStereo(
    MatrixBase right,
    MatrixBase left,
  ) => 'rlSetMatrixProjectionStereo($right, $left)';

  /// Label for [RaylibRlglModuleBase.rlSetMatrixViewOffsetStereo].
  String rlSetMatrixViewOffsetStereo(
    MatrixBase right,
    MatrixBase left,
  ) => 'rlSetMatrixViewOffsetStereo($right, $left)';

  /// Label for [RaylibRlglModuleBase.rlLoadDrawCube].
  String rlLoadDrawCube() => 'rlLoadDrawCube()';

  /// Label for [RaylibRlglModuleBase.rlLoadDrawQuad].
  String rlLoadDrawQuad() => 'rlLoadDrawQuad()';
  
}
