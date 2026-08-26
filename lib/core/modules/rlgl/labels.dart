part of '../../raylib_dartified_base.dart';

class _RaylibRlglModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibRlglModule.rlMatrixMode].
  String rlMatrixMode(
    RlMatrixMode mode,
  ) => 'rlMatrixMode(${mode.name})';

  /// Label for [RaylibRlglModule.rlPushMatrix].
  String rlPushMatrix() => 'rlPushMatrix()';

  /// Label for [RaylibRlglModule.rlPopMatrix].
  String rlPopMatrix() => 'rlPopMatrix()';

  /// Label for [RaylibRlglModule.rlLoadIdentity].
  String rlLoadIdentity() => 'rlLoadIdentity()';

  /// Label for [RaylibRlglModule.rlTranslatef].
  String rlTranslatef(
    num x,
    num y,
    num z,
  ) => 'rlTranslatef($x, $y, $z)';

  /// Label for [RaylibRlglModule.rlRotatef].
  String rlRotatef(
    num angle,
    num x,
    num y,
    num z,
  ) => 'rlRotatef($angle, $x, $y, $z)';

  /// Label for [RaylibRlglModule.rlScalef].
  String rlScalef(
    num x,
    num y,
    num z,
  ) => 'rlScalef($x, $y, $z)';

  /// Label for [RaylibRlglModule.rlMultMatrixf].
  String rlMultMatrixf(
    List<num> matf,
  ) => 'rlMultMatrixf($matf)';

  /// Label for [RaylibRlglModule.rlFrustum].
  String rlFrustum(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => 'rlFrustum($left, $right, $bottom, $top, $znear, $zfar)';

  /// Label for [RaylibRlglModule.rlOrtho].
  String rlOrtho(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => 'rlOrtho($left, $right, $bottom, $top, $znear, $zfar)';

  /// Label for [RaylibRlglModule.rlViewport].
  String rlViewport(
    num x,
    num y,
    num width,
    num height,
  ) => 'rlViewport($x, $y, $width, $height)';

  /// Label for [RaylibRlglModule.rlSetClipPlanes].
  String rlSetClipPlanes(
    num nearPlane,
    num farPlane,
  ) => 'rlSetClipPlanes($nearPlane, $farPlane)';

  /// Label for [RaylibRlglModule.rlGetCullDistanceNear].
  String rlGetCullDistanceNear() => 'rlGetCullDistanceNear()';

  /// Label for [RaylibRlglModule.rlGetCullDistanceFar].
  String rlGetCullDistanceFar() => 'rlGetCullDistanceFar()';

  /// Label for [RaylibRlglModule.rlBegin].
  String rlBegin(
    RlDrawMode mode,
  ) => 'rlBegin(${mode.name})';

  /// Label for [RaylibRlglModule.rlEnd].
  String rlEnd() => 'rlEnd()';

  /// Label for [RaylibRlglModule.rlVertex2i].
  String rlVertex2i(
    num x,
    num y,
  ) => 'rlVertex2i($x, $y)';

  /// Label for [RaylibRlglModule.rlVertex2f].
  String rlVertex2f(
    num x,
    num y,
  ) => 'rlVertex2f($x, $y)';

  /// Label for [RaylibRlglModule.rlVertex3f].
  String rlVertex3f(
    num x,
    num y,
    num z,
  ) => 'rlVertex3f($x, $y, $z)';

  /// Label for [RaylibRlglModule.rlTexCoord2f].
  String rlTexCoord2f(
    num x,
    num y,
  ) => 'rlTexCoord2f($x, $y)';

  /// Label for [RaylibRlglModule.rlNormal3f].
  String rlNormal3f(
    num x,
    num y,
    num z,
  ) => 'rlNormal3f($x, $y, $z)';

  /// Label for [RaylibRlglModule.rlColor4ub].
  String rlColor4ub(
    num r,
    num g,
    num b,
    num a,
  ) => 'rlColor4ub($r, $g, $b, $a)';

  /// Label for [RaylibRlglModule.rlColor3f].
  String rlColor3f(
    num x,
    num y,
    num z,
  ) => 'rlColor3f($x, $y, $z)';

  /// Label for [RaylibRlglModule.rlColor4f].
  String rlColor4f(
    num x,
    num y,
    num z,
    num w,
  ) => 'rlColor4f($x, $y, $z, $w)';

  /// Label for [RaylibRlglModule.rlEnableVertexArray].
  String rlEnableVertexArray(
    num vaoId,
  ) => 'rlEnableVertexArray($vaoId)';

  /// Label for [RaylibRlglModule.rlDisableVertexArray].
  String rlDisableVertexArray() => 'rlDisableVertexArray()';

  /// Label for [RaylibRlglModule.rlEnableVertexBuffer].
  String rlEnableVertexBuffer(
    num id,
  ) => 'rlEnableVertexBuffer($id)';

  /// Label for [RaylibRlglModule.rlDisableVertexBuffer].
  String rlDisableVertexBuffer() => 'rlDisableVertexBuffer()';

  /// Label for [RaylibRlglModule.rlEnableVertexBufferElement].
  String rlEnableVertexBufferElement(
    num id,
  ) => 'rlEnableVertexBufferElement($id)';

  /// Label for [RaylibRlglModule.rlDisableVertexBufferElement].
  String rlDisableVertexBufferElement() => 'rlDisableVertexBufferElement()';

  /// Label for [RaylibRlglModule.rlEnableVertexAttribute].
  String rlEnableVertexAttribute(
    num index,
  ) => 'rlEnableVertexAttribute($index)';

  /// Label for [RaylibRlglModule.rlDisableVertexAttribute].
  String rlDisableVertexAttribute(
    num index,
  ) => 'rlDisableVertexAttribute($index)';

  /// Label for [RaylibRlglModule.rlEnableStatePointer].
  String rlEnableStatePointer(
    int vertexAttribType,
    TypedDataList data,
  ) => 'rlEnableStatePointer($vertexAttribType, data: ${data.length})';
  
  /// Label for [RaylibRlglModule.rlDisableStatePointer].
  String rlDisableStatePointer(
    int vertexAttribType,
  ) => 'rlDisableStatePointer($vertexAttribType)';

  /// Label for [RaylibRlglModule.rlActiveTextureSlot].
  String rlActiveTextureSlot(
    num slot,
  ) => 'rlActiveTextureSlot($slot)';

  /// Label for [RaylibRlglModule.rlEnableTexture].
  String rlEnableTexture(
    num id,
  ) => 'rlEnableTexture($id)';

  /// Label for [RaylibRlglModule.rlDisableTexture].
  String rlDisableTexture() => 'rlDisableTexture()';

  /// Label for [RaylibRlglModule.rlEnableTextureCubemap].
  String rlEnableTextureCubemap(
    num id,
  ) => 'rlEnableTextureCubemap($id)';

  /// Label for [RaylibRlglModule.rlDisableTextureCubemap].
  String rlDisableTextureCubemap() => 'rlDisableTextureCubemap()';

  /// Label for [RaylibRlglModule.rlTextureParameters].
  String rlTextureParameters(
    num id,
    num param,
    num value,
  ) => 'rlTextureParameters($id, $param, $value)';

  /// Label for [RaylibRlglModule.rlCubemapParameters].
  String rlCubemapParameters(
    num id,
    num param,
    num value,
  ) => 'rlCubemapParameters($id, $param, $value)';

  /// Label for [RaylibRlglModule.rlEnableShader].
  String rlEnableShader(
    num id,
  ) => 'rlEnableShader($id)';

  /// Label for [RaylibRlglModule.rlDisableShader].
  String rlDisableShader() => 'rlDisableShader()';

  /// Label for [RaylibRlglModule.rlEnableFramebuffer].
  String rlEnableFramebuffer(
    num id,
  ) => 'rlEnableFramebuffer($id)';

  /// Label for [RaylibRlglModule.rlDisableFramebuffer].
  String rlDisableFramebuffer() => 'rlDisableFramebuffer()';

  /// Label for [RaylibRlglModule.rlGetActiveFramebuffer].
  String rlGetActiveFramebuffer() => 'rlGetActiveFramebuffer()';

  /// Label for [RaylibRlglModule.rlActiveDrawBuffers].
  String rlActiveDrawBuffers(
    num count,
  ) => 'rlActiveDrawBuffers($count)';

  /// Label for [RaylibRlglModule.rlBlitFramebuffer].
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

  /// Label for [RaylibRlglModule.rlBindFramebuffer].
  String rlBindFramebuffer(
    num target,
    num framebuffer,
  ) => 'rlBindFramebuffer($target, $framebuffer)';

  /// Label for [RaylibRlglModule.rlEnableColorBlend].
  String rlEnableColorBlend() => 'rlEnableColorBlend()';

  /// Label for [RaylibRlglModule.rlDisableColorBlend].
  String rlDisableColorBlend() => 'rlDisableColorBlend()';

  /// Label for [RaylibRlglModule.rlEnableDepthTest].
  String rlEnableDepthTest() => 'rlEnableDepthTest()';

  /// Label for [RaylibRlglModule.rlDisableDepthTest].
  String rlDisableDepthTest() => 'rlDisableDepthTest()';

  /// Label for [RaylibRlglModule.rlEnableDepthMask].
  String rlEnableDepthMask() => 'rlEnableDepthMask()';

  /// Label for [RaylibRlglModule.rlDisableDepthMask].
  String rlDisableDepthMask() => 'rlDisableDepthMask()';

  /// Label for [RaylibRlglModule.rlEnableBackfaceCulling].
  String rlEnableBackfaceCulling() => 'rlEnableBackfaceCulling()';

  /// Label for [RaylibRlglModule.rlDisableBackfaceCulling].
  String rlDisableBackfaceCulling() => 'rlDisableBackfaceCulling()';

  /// Label for [RaylibRlglModule.rlColorMask].
  String rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => 'rlColorMask($r, $g, $b, $a)';

  /// Label for [RaylibRlglModule.rlSetCullFace].
  String rlSetCullFace(
    RlCullMode mode,
  ) => 'rlSetCullFace(${mode.name})';

  /// Label for [RaylibRlglModule.rlEnableScissorTest].
  String rlEnableScissorTest() => 'rlEnableScissorTest()';

  /// Label for [RaylibRlglModule.rlDisableScissorTest].
  String rlDisableScissorTest() => 'rlDisableScissorTest()';

  /// Label for [RaylibRlglModule.rlScissor].
  String rlScissor(
    num x,
    num y,
    num width,
    num height,
  ) => 'rlScissor($x, $y, $width, $height)';

  /// Label for [RaylibRlglModule.rlEnablePointMode].
  String rlEnablePointMode() => 'rlEnablePointMode()';

  /// Label for [RaylibRlglModule.rlDisablePointMode].
  String rlDisablePointMode() => 'rlDisablePointMode()';

  /// Label for [RaylibRlglModule.rlSetPointSize].
  String rlSetPointSize(
    num size,
  ) => 'rlSetPointSize($size)';

  /// Label for [RaylibRlglModule.rlGetPointSize].
  String rlGetPointSize() => 'rlGetPointSize()';

  /// Label for [RaylibRlglModule.rlEnableWireMode].
  String rlEnableWireMode() => 'rlEnableWireMode()';

  /// Label for [RaylibRlglModule.rlDisableWireMode].
  String rlDisableWireMode() => 'rlDisableWireMode()';

  /// Label for [RaylibRlglModule.rlSetLineWidth].
  String rlSetLineWidth(
    num width,
  ) => 'rlSetLineWidth($width)';

  /// Label for [RaylibRlglModule.rlGetLineWidth].
  String rlGetLineWidth() => 'rlGetLineWidth()';

  /// Label for [RaylibRlglModule.rlEnableSmoothLines].
  String rlEnableSmoothLines() => 'rlEnableSmoothLines()';

  /// Label for [RaylibRlglModule.rlDisableSmoothLines].
  String rlDisableSmoothLines() => 'rlDisableSmoothLines()';

  /// Label for [RaylibRlglModule.rlEnableStereoRender].
  String rlEnableStereoRender() => 'rlEnableStereoRender()';

  /// Label for [RaylibRlglModule.rlDisableStereoRender].
  String rlDisableStereoRender() => 'rlDisableStereoRender()';

  /// Label for [RaylibRlglModule.rlIsStereoRenderEnabled].
  String rlIsStereoRenderEnabled() => 'rlIsStereoRenderEnabled()';

  /// Label for [RaylibRlglModule.rlClearColor].
  String rlClearColor(
    num r,
    num g,
    num b,
    num a,
  ) => 'rlClearColor($r, $g, $b, $a)';

  /// Label for [RaylibRlglModule.rlClearScreenBuffers].
  String rlClearScreenBuffers() => 'rlClearScreenBuffers()';

  /// Label for [RaylibRlglModule.rlCheckErrors].
  String rlCheckErrors() => 'rlCheckErrors()';

  /// Label for [RaylibRlglModule.rlSetBlendMode].
  String rlSetBlendMode(
    BlendMode mode,
  ) => 'rlSetBlendMode(${mode.name})';

  /// Label for [RaylibRlglModule.rlSetBlendFactors].
  String rlSetBlendFactors(
    num glSrcFactor,
    num glDstFactor,
    num glEquation,
  ) => 'rlSetBlendFactors($glSrcFactor, $glDstFactor, $glEquation)';

  /// Label for [RaylibRlglModule.rlSetBlendFactorsSeparate].
  String rlSetBlendFactorsSeparate(
    num glSrcRGB,
    num glDstRGB,
    num glSrcAlpha,
    num glDstAlpha,
    num glEqRGB,
    num glEqAlpha,
  ) => 'rlSetBlendFactorsSeparate($glSrcRGB, $glDstRGB, $glSrcAlpha, $glDstAlpha, $glEqRGB, $glEqAlpha)';

  /// Label for [RaylibRlglModule.rlglInit].
  String rlglInit(
    num width,
    num height,
  ) => 'rlglInit($width, $height)';

  /// Label for [RaylibRlglModule.rlglClose].
  String rlglClose() => 'rlglClose()';

  /// Label for [RaylibRlglModule.rlGetVersion].
  String rlGetVersion() => 'rlGetVersion()';

  /// Label for [RaylibRlglModule.rlSetFramebufferWidth].
  String rlSetFramebufferWidth(
    num width,
  ) => 'rlSetFramebufferWidth($width)';

  /// Label for [RaylibRlglModule.rlGetFramebufferWidth].
  String rlGetFramebufferWidth() => 'rlGetFramebufferWidth()';

  /// Label for [RaylibRlglModule.rlSetFramebufferHeight].
  String rlSetFramebufferHeight(
    num height,
  ) => 'rlSetFramebufferHeight($height)';

  /// Label for [RaylibRlglModule.rlGetFramebufferHeight].
  String rlGetFramebufferHeight() => 'rlGetFramebufferHeight()';

  /// Label for [RaylibRlglModule.rlGetTextureIdDefault].
  String rlGetTextureIdDefault() => 'rlGetTextureIdDefault()';

  /// Label for [RaylibRlglModule.rlGetShaderIdDefault].
  String rlGetShaderIdDefault() => 'rlGetShaderIdDefault()';

  /// Label for [RaylibRlglModule.rlGetShaderLocsDefault].
  String rlGetShaderLocsDefault() => 'rlGetShaderLocsDefault()';

  /// Label for [RaylibRlglModule.rlLoadRenderBatch].
  String rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  ) => 'rlLoadRenderBatch($numBuffers, $bufferElements)';

  /// Label for [RaylibRlglModule.rlUnloadRenderBatch].
  String rlUnloadRenderBatch(
    RlRenderBatchD batch,
  ) => 'rlUnloadRenderBatch($batch)';

  /// Label for [RaylibRlglModule.rlDrawRenderBatch].
  String rlDrawRenderBatch(
    RlRenderBatchD batch,
  ) => 'rlDrawRenderBatch($batch)';

  /// Label for [RaylibRlglModule.rlSetRenderBatchActive].
  String rlSetRenderBatchActive([
    RlRenderBatchD? batch,
  ]) => 'rlSetRenderBatchActive($batch)';

  /// Label for [RaylibRlglModule.rlDrawRenderBatchActive].
  String rlDrawRenderBatchActive() => 'rlDrawRenderBatchActive()';

  /// Label for [RaylibRlglModule.rlCheckRenderBatchLimit].
  String rlCheckRenderBatchLimit(
    num vCount,
  ) => 'rlCheckRenderBatchLimit($vCount)';

  /// Label for [RaylibRlglModule.rlSetTexture].
  String rlSetTexture(
    num id,
  ) => 'rlSetTexture($id)';

  /// Label for [RaylibRlglModule.rlLoadVertexArray].
  String rlLoadVertexArray() => 'rlLoadVertexArray()';

  /// Label for [RaylibRlglModule.rlLoadVertexBuffer].
  String rlLoadVertexBuffer(
    TypedDataList buffer,
    bool dynamic,
  ) => 'rlLoadVertexBuffer(${buffer.lengthInBytes}, $dynamic)';

  /// Label for [RaylibRlglModule.rlLoadVertexBufferElement].
  String rlLoadVertexBufferElement(
    TypedDataList buffer,
    bool dynamic,
  ) => 'rlLoadVertexBufferElement(${buffer.lengthInBytes}, $dynamic)';

  /// Label for [RaylibRlglModule.rlUpdateVertexBuffer].
  String rlUpdateVertexBuffer(
    num bufferId,
    TypedDataList data,
    num dataSize,
    num offset,
  ) => 'rlUpdateVertexBuffer($bufferId, ${data.lengthInBytes}, $dataSize, $offset)';

  /// Label for [RaylibRlglModule.rlUpdateVertexBufferElements].
  String rlUpdateVertexBufferElements(
    num id,
    TypedDataList data,
    num dataSize,
    num offset,
  ) => 'rlLoadVertexBufferElement($id, ${data.lengthInBytes}, $dataSize, $offset)';

  /// Label for [RaylibRlglModule.rlUnloadVertexArray].
  String rlUnloadVertexArray(
    num vaoId,
  ) => 'rlUnloadVertexArray($vaoId)';

  /// Label for [RaylibRlglModule.rlUnloadVertexBuffer].
  String rlUnloadVertexBuffer(
    num vboId,
  ) => 'rlUnloadVertexBuffer($vboId)';

  /// Label for [RaylibRlglModule.rlSetVertexAttribute].
  String rlSetVertexAttribute(
    num index,
    num compSize,
    num type,
    bool normalized,
    num stride,
    num offset,
  ) => 'rlSetVertexAttribute($index, $compSize, $type, $normalized, $stride, $offset)';

  /// Label for [RaylibRlglModule.rlSetVertexAttributeDivisor].
  String rlSetVertexAttributeDivisor(
    num index,
    num divisor,
  ) => 'rlSetVertexAttributeDivisor($index, $divisor)';

  /// Label for [RaylibRlglModule.rlSetVertexAttributeDefault].
  String rlSetVertexAttributeDefault(
    num locIndex,
    Float32List value,
    RlShaderAttributeDataType attribType,
  ) => 'rlSetVertexAttributeDefault($locIndex, ${value.length}, ${attribType.name})';

  /// Label for [RaylibRlglModule.rlDrawVertexArray].
  String rlDrawVertexArray(
    num offset,
    num count,
  ) => 'rlDrawVertexArray($offset, $count)';

  /// Label for [RaylibRlglModule.rlDrawVertexArrayElements].
  String rlDrawVertexArrayElements(
    num offset,
    num count,
    Uint16List buffer,
  ) => 'rlDrawVertexArrayElements($offset, ${buffer.length})';

  /// Label for [RaylibRlglModule.rlDrawVertexArrayInstanced].
  String rlDrawVertexArrayInstanced(
    num offset,
    num count,
    num instances,
  ) => 'rlDrawVertexArrayInstanced($offset, $count, $instances)';

  /// Label for [RaylibRlglModule.rlDrawVertexArrayElementsInstanced].
  String rlDrawVertexArrayElementsInstanced(
    num offset,
    num count,
    Uint16List buffer,
    num instances,
  ) => 'rlDrawVertexArrayElementsInstanced($offset, $count, ${buffer.length}, $instances)';

  /// Label for [RaylibRlglModule.rlLoadTexture].
  String rlLoadTexture(
    Uint8List? data,
    num width,
    num height,
    PixelFormat format,
    num mipmapCount,
  ) => 'rlLoadTexture(${data?.length}, $width, $height, $format, $mipmapCount)';

  /// Label for [RaylibRlglModule.rlLoadTextureDepth].
  String rlLoadTextureDepth(
    num width,
    num height,
    bool useRenderBuffer,
  ) => 'rlLoadTextureDepth($width, $height, $useRenderBuffer)';

  /// Label for [RaylibRlglModule.rlLoadTextureCubemap].
  String rlLoadTextureCubemap(
    Uint8List? data,
    num size,
    PixelFormat format,
    num mipmapCount,
  ) => 'rlLoadTextureCubemap(${data?.length}, $size, ${format.name}, $mipmapCount)';

  /// Label for [RaylibRlglModule.rlUpdateTexture].
  String rlUpdateTexture(
    num id,
    num offsetX,
    num offsetY,
    num width,
    num height,
    PixelFormat format,
    Uint8List data,
  ) => 'rlUpdateTexture($id, $offsetX, $offsetY, $width, $height, ${format.name}, ${data.length})';

  /// Label for [RaylibRlglModule.rlGetGlTextureFormats].
  String rlGetGlTextureFormats(
    PixelFormat format,
  ) => 'rlGetGlTextureFormats(${format.name})';

  /// Label for [RaylibRlglModule.rlGetPixelFormatName].
  String rlGetPixelFormatName(
    PixelFormat format,
  ) => 'rlGetPixelFormatName(${format.name})';

  /// Label for [RaylibRlglModule.rlUnloadTexture].
  String rlUnloadTexture(
    num id,
  ) => 'rlUnloadTexture($id)';

  /// Label for [RaylibRlglModule.rlGenTextureMipmaps].
  String rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlGenTextureMipmaps($id, $width, $height, ${format.name})';

  /// Label for [RaylibRlglModule.rlReadTexturePixels].
  String rlReadTexturePixels(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlReadTexturePixels($id, $width, $height, ${format.name})';

  /// Label for [RaylibRlglModule.rlReadScreenPixels].
  String rlReadScreenPixels(
    num width,
    num height,
  ) => 'rlReadScreenPixels($width, $height)';

  /// Label for [RaylibRlglModule.rlLoadFramebuffer].
  String rlLoadFramebuffer() => 'rlLoadFramebuffer()';

  /// Label for [RaylibRlglModule.rlFramebufferAttach].
  String rlFramebufferAttach(
    num fboId,
    num texId,
    RlFramebufferAttachType attachType,
    RlFramebufferAttachTextureType texType,
    num mipLevel,
  ) => 'rlFramebufferAttach($fboId, $texId, ${attachType.name}, ${texType.name}, $mipLevel)';

  /// Label for [RaylibRlglModule.rlFramebufferComplete].
  String rlFramebufferComplete(
    num id,
  ) => 'rlFramebufferComplete($id)';

  /// Label for [RaylibRlglModule.rlUnloadFramebuffer].
  String rlUnloadFramebuffer(
    num id,
  ) => 'rlUnloadFramebuffer($id)';

  /// Label for [RaylibRlglModule.rlCopyFramebuffer].
  String rlCopyFramebuffer(
    num x,
    num y,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlCopyFramebuffer($x, $y, $width, $height, $format)';
  
  /// Label for [RaylibRlglModule.rlResizeFramebuffer].
  String rlResizeFramebuffer(
    num width,
    num height,
  ) => 'rlResizeFramebuffer($width, $height)';

  /// Label for [RaylibRlglModule.rlLoadShader].
  String rlLoadShader(
    String code,
    RlShaderType type,
  ) => 'rlLoadShader(${code.length}, $type)';

  /// Label for [RaylibRlglModule.rlLoadShaderProgram].
  String rlLoadShaderProgram(
    String vsCode,
    String fsCode,
  ) => 'rlLoadShaderProgram($vsCode, $fsCode)';

  /// Label for [RaylibRlglModule.rlLoadShaderProgramEx].
  String rlLoadShaderProgramEx(
    num vsId,
    num fsId,
  ) => 'rlLoadShaderProgramEx($vsId, $fsId)';
  
  /// Label for [RaylibRlglModule.rlLoadShaderProgramCompute].
  String rlLoadShaderProgramCompute(
    num csId,
  ) => 'rlLoadShaderProgramCompute($csId)';
  
  /// Label for [RaylibRlglModule.rlUnloadShader].
  String rlUnloadShader(
    num id,
  ) => 'rlUnloadShader($id)';

  /// Label for [RaylibRlglModule.rlUnloadShaderProgram].
  String rlUnloadShaderProgram(
    num id,
  ) => 'rlUnloadShaderProgram($id)';

  /// Label for [RaylibRlglModule.rlGetLocationUniform].
  String rlGetLocationUniform(
    num shaderId,
    String uniformName,
  ) => 'rlGetLocationUniform($shaderId, $uniformName)';

  /// Label for [RaylibRlglModule.rlGetLocationAttrib].
  String rlGetLocationAttrib(
    num shaderId,
    String attribName,
  ) => 'rlGetLocationAttrib($shaderId, $attribName)';

  /// Label for [RaylibRlglModule.rlSetUniform].
  String rlSetUniform(
    num locIndex,
    TypedDataList value,
    RlShaderUniformDataType uniformType,
    num count,
  ) => 'rlSetUniform($locIndex, ${value.lengthInBytes}, ${uniformType.name})';

  /// Label for [RaylibRlglModule.rlSetUniformMatrix].
  String rlSetUniformMatrix(
    num locIndex,
    MatrixD mat,
  ) => 'rlSetUniformMatrix($locIndex, $mat)';

  /// Label for [RaylibRlglModule.rlSetUniformMatrices].
  String rlSetUniformMatrices(
    num locIndex,
    List<MatrixD> mat,
  ) => 'rlSetUniformMatrices($locIndex, mat: ${mat.length})';

  /// Label for [RaylibRlglModule.rlSetUniformSampler].
  String rlSetUniformSampler(
    num locIndex,
    num textureId,
  ) => 'rlSetUniformSampler($locIndex, $textureId)';

  /// Label for [RaylibRlglModule.rlSetShader].
  String rlSetShader(
    num id,
    List<int> locs,
  ) => 'rlSetShader($id, $locs)';

  /// Label for [RaylibRlglModule.rlComputeShaderDispatch].
  String rlComputeShaderDispatch(
    num groupX,
    num groupY,
    num groupZ,
  ) => 'rlComputeShaderDispatch($groupX, $groupY, $groupZ)';

  /// Label for [RaylibRlglModule.rlLoadShaderBuffer].
  String rlLoadShaderBuffer(
    num size,
    TypedDataList? data,
    RlUsageHint? usageHint,
  ) => 'rlLoadShaderBuffer($size, data: ${data?.lengthInBytes}, $usageHint)';

  /// Label for [RaylibRlglModule.rlUnloadShaderBuffer].
  String rlUnloadShaderBuffer(
    num ssboId,
  ) => 'rlUnloadShaderBuffer($ssboId)';

  /// Label for [RaylibRlglModule.rlUpdateShaderBuffer].
  String rlUpdateShaderBuffer(
    num id,
    TypedDataList data,
    num offset,
  ) => 'rlUpdateShaderBuffer($id, data: ${data.lengthInBytes}, $offset)';

  /// Label for [RaylibRlglModule.rlBindShaderBuffer].
  String rlBindShaderBuffer(
    num id,
    num index,
  ) => 'rlBindShaderBuffer($id, $index)';

  /// Label for [RaylibRlglModule.rlReadShaderBuffer].
  String rlReadShaderBuffer(
    num id,
    num count,
    num offset,
  ) => 'rlReadShaderBuffer($id, $count, $offset)';

  /// Label for [RaylibRlglModule.rlCopyShaderBuffer].
  String rlCopyShaderBuffer(
    num destId,
    num srcId,
    num destOffset,
    num srcOffset,
    num count,
  ) => 'rlCopyShaderBuffer($destId, $srcId, $destOffset, $srcOffset, $count)';

  /// Label for [RaylibRlglModule.rlGetShaderBufferSize].
  String rlGetShaderBufferSize(
    num id,
  ) => 'rlGetShaderBufferSize($id)';

  /// Label for [RaylibRlglModule.rlBindImageTexture].
  String rlBindImageTexture(
    num id,
    num index,
    PixelFormat format,
    bool readonly,
  ) => 'rlBindImageTexture($id, $index, ${format.name}, $readonly)';

  /// Label for [RaylibRlglModule.rlGetMatrixModelview].
  String rlGetMatrixModelview() => 'rlGetMatrixModelview()';

  /// Label for [RaylibRlglModule.rlGetMatrixProjection].
  String rlGetMatrixProjection() => 'rlGetMatrixProjection()';

  /// Label for [RaylibRlglModule.rlGetMatrixTransform].
  String rlGetMatrixTransform() => 'rlGetMatrixTransform()';

  /// Label for [RaylibRlglModule.rlGetMatrixProjectionStereo].
  String rlGetMatrixProjectionStereo(
    num eye,
  ) => 'rlGetMatrixProjectionStereo($eye)';

  /// Label for [RaylibRlglModule.rlGetMatrixViewOffsetStereo].
  String rlGetMatrixViewOffsetStereo(
    num eye,
  ) => 'rlGetMatrixViewOffsetStereo($eye)';

  /// Label for [RaylibRlglModule.rlSetMatrixProjection].
  String rlSetMatrixProjection(
    MatrixD proj,
  ) => 'rlSetMatrixProjection($proj)';

  /// Label for [RaylibRlglModule.rlSetMatrixModelview].
  String rlSetMatrixModelview(
    MatrixD view,
  ) => 'rlSetMatrixModelview($view)';

  /// Label for [RaylibRlglModule.rlSetMatrixProjectionStereo].
  String rlSetMatrixProjectionStereo(
    MatrixD right,
    MatrixD left,
  ) => 'rlSetMatrixProjectionStereo($right, $left)';

  /// Label for [RaylibRlglModule.rlSetMatrixViewOffsetStereo].
  String rlSetMatrixViewOffsetStereo(
    MatrixD right,
    MatrixD left,
  ) => 'rlSetMatrixViewOffsetStereo($right, $left)';

  /// Label for [RaylibRlglModule.rlLoadDrawCube].
  String rlLoadDrawCube() => 'rlLoadDrawCube()';

  /// Label for [RaylibRlglModule.rlLoadDrawQuad].
  String rlLoadDrawQuad() => 'rlLoadDrawQuad()';
  
}
