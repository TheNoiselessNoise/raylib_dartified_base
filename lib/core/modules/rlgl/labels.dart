part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Rlgl module function call,
/// logged to the console when debug output is enabled.
class RaylibRlglModuleDebugLabels extends RaylibDebugLabelsBase {
  
  String rlMatrixMode(
    RlMatrixMode mode,
  ) => 'rlMatrixMode(${mode.name})';

  String rlPushMatrix() => 'rlPushMatrix()';

  String rlPopMatrix() => 'rlPopMatrix()';

  String rlLoadIdentity() => 'rlLoadIdentity()';

  String rlTranslatef(
    num x,
    num y,
    num z,
  ) => 'rlTranslatef($x, $y, $z)';

  String rlRotatef(
    num angle,
    num x,
    num y,
    num z,
  ) => 'rlRotatef($angle, $x, $y, $z)';

  String rlScalef(
    num x,
    num y,
    num z,
  ) => 'rlScalef($x, $y, $z)';

  String rlMultMatrixf(
    List<double> matf,
  ) => 'rlMultMatrixf($matf)';

  String rlFrustum(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => 'rlFrustum($left, $right, $bottom, $top, $znear, $zfar)';

  String rlOrtho(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => 'rlOrtho($left, $right, $bottom, $top, $znear, $zfar)';

  String rlViewport(
    num x,
    num y,
    num width,
    num height,
  ) => 'rlViewport($x, $y, $width, $height)';

  String rlSetClipPlanes(
    num nearPlane,
    num farPlane,
  ) => 'rlSetClipPlanes($nearPlane, $farPlane)';

  String rlGetCullDistanceNear() => 'rlGetCullDistanceNear()';

  String rlGetCullDistanceFar() => 'rlGetCullDistanceFar()';

  String rlBegin(
    RlDrawMode mode,
  ) => 'rlBegin(${mode.name})';

  String rlEnd() => 'rlEnd()';

  String rlVertex2i(
    num x,
    num y,
  ) => 'rlVertex2i($x, $y)';

  String rlVertex2f(
    num x,
    num y,
  ) => 'rlVertex2f($x, $y)';

  String rlVertex3f(
    num x,
    num y,
    num z,
  ) => 'rlVertex3f($x, $y, $z)';

  String rlTexCoord2f(
    num x,
    num y,
  ) => 'rlTexCoord2f($x, $y)';

  String rlNormal3f(
    num x,
    num y,
    num z,
  ) => 'rlNormal3f($x, $y, $z)';

  String rlColor4ub(
    num r,
    num g,
    num b,
    num a,
  ) => 'rlColor4ub($r, $g, $b, $a)';

  String rlColor3f(
    num x,
    num y,
    num z,
  ) => 'rlColor3f($x, $y, $z)';

  String rlColor4f(
    num x,
    num y,
    num z,
    num w,
  ) => 'rlColor4f($x, $y, $z, $w)';

  String rlEnableVertexArray(
    num vaoId,
  ) => 'rlEnableVertexArray($vaoId)';

  String rlDisableVertexArray() => 'rlDisableVertexArray()';

  String rlEnableVertexBuffer(
    num id,
  ) => 'rlEnableVertexBuffer($id)';

  String rlDisableVertexBuffer() => 'rlDisableVertexBuffer()';

  String rlEnableVertexBufferElement(
    num id,
  ) => 'rlEnableVertexBufferElement($id)';

  String rlDisableVertexBufferElement() => 'rlDisableVertexBufferElement()';

  String rlEnableVertexAttribute(
    num index,
  ) => 'rlEnableVertexAttribute($index)';

  String rlDisableVertexAttribute(
    num index,
  ) => 'rlDisableVertexAttribute($index)';

  String rlActiveTextureSlot(
    num slot,
  ) => 'rlActiveTextureSlot($slot)';

  String rlEnableTexture(
    num id,
  ) => 'rlEnableTexture($id)';

  String rlDisableTexture() => 'rlDisableTexture()';

  String rlEnableTextureCubemap(
    num id,
  ) => 'rlEnableTextureCubemap($id)';

  String rlDisableTextureCubemap() => 'rlDisableTextureCubemap()';

  String rlTextureParameters(
    num id,
    num param,
    num value,
  ) => 'rlTextureParameters($id, $param, $value)';

  String rlCubemapParameters(
    num id,
    num param,
    num value,
  ) => 'rlCubemapParameters($id, $param, $value)';

  String rlEnableShader(
    num id,
  ) => 'rlEnableShader($id)';

  String rlDisableShader() => 'rlDisableShader()';

  String rlEnableFramebuffer(
    num id,
  ) => 'rlEnableFramebuffer($id)';

  String rlDisableFramebuffer() => 'rlDisableFramebuffer()';

  String rlGetActiveFramebuffer() => 'rlGetActiveFramebuffer()';

  String rlActiveDrawBuffers(
    num count,
  ) => 'rlActiveDrawBuffers($count)';

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

  String rlBindFramebuffer(
    num target,
    num framebuffer,
  ) => 'rlBindFramebuffer($target, $framebuffer)';

  String rlEnableColorBlend() => 'rlEnableColorBlend()';

  String rlDisableColorBlend() => 'rlDisableColorBlend()';

  String rlEnableDepthTest() => 'rlEnableDepthTest()';

  String rlDisableDepthTest() => 'rlDisableDepthTest()';

  String rlEnableDepthMask() => 'rlEnableDepthMask()';

  String rlDisableDepthMask() => 'rlDisableDepthMask()';

  String rlEnableBackfaceCulling() => 'rlEnableBackfaceCulling()';

  String rlDisableBackfaceCulling() => 'rlDisableBackfaceCulling()';

  String rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => 'rlColorMask($r, $g, $b, $a)';

  String rlSetCullFace(
    RlCullMode mode,
  ) => 'rlSetCullFace(${mode.name})';

  String rlEnableScissorTest() => 'rlEnableScissorTest()';

  String rlDisableScissorTest() => 'rlDisableScissorTest()';

  String rlScissor(
    num x,
    num y,
    num width,
    num height,
  ) => 'rlScissor($x, $y, $width, $height)';

  String rlEnableWireMode() => 'rlEnableWireMode()';

  String rlEnablePointMode() => 'rlEnablePointMode()';

  String rlDisableWireMode() => 'rlDisableWireMode()';

  String rlSetLineWidth(
    num width,
  ) => 'rlSetLineWidth($width)';

  String rlGetLineWidth() => 'rlGetLineWidth()';

  String rlEnableSmoothLines() => 'rlEnableSmoothLines()';

  String rlDisableSmoothLines() => 'rlDisableSmoothLines()';

  String rlEnableStereoRender() => 'rlEnableStereoRender()';

  String rlDisableStereoRender() => 'rlDisableStereoRender()';

  String rlIsStereoRenderEnabled() => 'rlIsStereoRenderEnabled()';

  String rlClearColor(
    num r,
    num g,
    num b,
    num a,
  ) => 'rlClearColor($r, $g, $b, $a)';

  String rlClearScreenBuffers() => 'rlClearScreenBuffers()';

  String rlCheckErrors() => 'rlCheckErrors()';

  String rlSetBlendMode(
    BlendMode mode,
  ) => 'rlSetBlendMode(${mode.name})';

  String rlSetBlendFactors(
    num glSrcFactor,
    num glDstFactor,
    num glEquation,
  ) => 'rlSetBlendFactors($glSrcFactor, $glDstFactor, $glEquation)';

  String rlSetBlendFactorsSeparate(
    num glSrcRGB,
    num glDstRGB,
    num glSrcAlpha,
    num glDstAlpha,
    num glEqRGB,
    num glEqAlpha,
  ) => 'rlSetBlendFactorsSeparate($glSrcRGB, $glDstRGB, $glSrcAlpha, $glDstAlpha, $glEqRGB, $glEqAlpha)';

  String rlglInit(
    num width,
    num height,
  ) => 'rlglInit($width, $height)';

  String rlglClose() => 'rlglClose()';

  String rlGetVersion() => 'rlGetVersion()';

  String rlSetFramebufferWidth(
    num width,
  ) => 'rlSetFramebufferWidth($width)';

  String rlGetFramebufferWidth() => 'rlGetFramebufferWidth()';

  String rlSetFramebufferHeight(
    num height,
  ) => 'rlSetFramebufferHeight($height)';

  String rlGetFramebufferHeight() => 'rlGetFramebufferHeight()';

  String rlGetTextureIdDefault() => 'rlGetTextureIdDefault()';

  String rlGetShaderIdDefault() => 'rlGetShaderIdDefault()';

  String rlGetShaderLocsDefault() => 'rlGetShaderLocsDefault()';

  String rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  ) => 'rlLoadRenderBatch($numBuffers, $bufferElements)';

  String rlUnloadRenderBatch(
    RlRenderBatchBase batch,
  ) => 'rlUnloadRenderBatch($batch)';

  String rlDrawRenderBatch(
    RlRenderBatchBase batch,
  ) => 'rlDrawRenderBatch($batch)';

  String rlSetRenderBatchActive(
    RlRenderBatchBase batch,
  ) => 'rlSetRenderBatchActive($batch)';

  String rlDrawRenderBatchActive() => 'rlDrawRenderBatchActive()';

  String rlCheckRenderBatchLimit(
    num vCount,
  ) => 'rlCheckRenderBatchLimit($vCount)';

  String rlSetTexture(
    num id,
  ) => 'rlSetTexture($id)';

  String rlLoadVertexArray() => 'rlLoadVertexArray()';

  String rlLoadVertexBuffer(
    TypedDataList buffer,
    bool dynamic,
  ) => 'rlLoadVertexBuffer(${buffer.lengthInBytes}, $dynamic)';

  String rlLoadVertexBufferElement(
    TypedDataList buffer,
    bool dynamic,
  ) => 'rlLoadVertexBufferElement(${buffer.lengthInBytes}, $dynamic)';

  String rlUpdateVertexBuffer(
    num bufferId,
    TypedDataList data,
    num offset,
  ) => 'rlUpdateVertexBuffer($bufferId, ${data.lengthInBytes}, $offset)';

  String rlUpdateVertexBufferElements(
    num id,
    TypedDataList data,
    num offset,
  ) => 'rlLoadVertexBufferElement($id, ${data.lengthInBytes}, $offset)';

  String rlUnloadVertexArray(
    num vaoId,
  ) => 'rlUnloadVertexArray($vaoId)';

  String rlUnloadVertexBuffer(
    num vboId,
  ) => 'rlUnloadVertexBuffer($vboId)';

  String rlSetVertexAttribute(
    num index,
    num compSize,
    num type,
    bool normalized,
    num stride,
    num offset,
  ) => 'rlSetVertexAttribute($index, $compSize, $type, $normalized, $stride, $offset)';

  String rlSetVertexAttributeDivisor(
    num index,
    num divisor,
  ) => 'rlSetVertexAttributeDivisor($index, $divisor)';

  String rlSetVertexAttributeDefault(
    num locIndex,
    Float32List value,
    RlShaderAttributeDataType attribType,
  ) => 'rlSetVertexAttributeDefault($locIndex, ${value.length}, ${attribType.name})';

  String rlDrawVertexArray(
    num offset,
    num count,
  ) => 'rlDrawVertexArray($offset, $count)';

  String rlDrawVertexArrayElements(
    num offset,
    num count,
    Uint16List buffer,
  ) => 'rlDrawVertexArrayElements($offset, ${buffer.length})';

  String rlDrawVertexArrayInstanced(
    num offset,
    num count,
    num instances,
  ) => 'rlDrawVertexArrayInstanced($offset, $count, $instances)';

  String rlDrawVertexArrayElementsInstanced(
    num offset,
    num count,
    Uint16List buffer,
    num instances,
  ) => 'rlDrawVertexArrayElementsInstanced($offset, $count, ${buffer.length}, $instances)';

  String rlLoadTexture(
    Uint8List? data,
    num width,
    num height,
    PixelFormat format,
    num mipmapCount,
  ) => 'rlLoadTexture(${data?.length}, $width, $height, $format, $mipmapCount)';

  String rlLoadTextureDepth(
    num width,
    num height,
    bool useRenderBuffer,
  ) => 'rlLoadTextureDepth($width, $height, $useRenderBuffer)';

  String rlLoadTextureCubemap(
    Uint8List? data,
    num size,
    PixelFormat format,
    num mipmapCount,
  ) => 'rlLoadTextureCubemap(${data?.length}, $size, ${format.name}, $mipmapCount)';

  String rlUpdateTexture(
    num id,
    num offsetX,
    num offsetY,
    num width,
    num height,
    PixelFormat format,
    Uint8List data,
  ) => 'rlUpdateTexture($id, $offsetX, $offsetY, $width, $height, ${format.name}, ${data.length})';

  String rlGetGlTextureFormats(
    PixelFormat format,
  ) => 'rlGetGlTextureFormats(${format.name})';

  String rlGetPixelFormatName(
    PixelFormat format,
  ) => 'rlGetPixelFormatName(${format.name})';

  String rlUnloadTexture(
    num id,
  ) => 'rlUnloadTexture($id)';

  String rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlGenTextureMipmaps($id, $width, $height, ${format.name})';

  String rlReadTexturePixels(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlReadTexturePixels($id, $width, $height, ${format.name})';

  String rlReadScreenPixels(
    num width,
    num height,
  ) => 'rlReadScreenPixels($width, $height)';

  String rlLoadFramebuffer() => 'rlLoadFramebuffer()';

  String rlFramebufferAttach(
    num fboId,
    num texId,
    RlFramebufferAttachType attachType,
    RlFramebufferAttachTextureType texType,
    num mipLevel,
  ) => 'rlFramebufferAttach($fboId, $texId, ${attachType.name}, ${texType.name}, $mipLevel)';

  String rlFramebufferComplete(
    num id,
  ) => 'rlFramebufferComplete($id)';

  String rlUnloadFramebuffer(
    num id,
  ) => 'rlUnloadFramebuffer($id)';

  String rlLoadShaderCode(
    String? vsCode,
    String? fsCode,
  ) => 'rlLoadShaderCode(vsCode: ${vsCode?.length}, fsCode: ${fsCode?.length})';

  String rlCompileShader(
    String shaderCode,
    RlShaderType type,
  ) => 'rlCompileShader(shaderCode: ${shaderCode.length}, ${type.name})';

  String rlLoadShaderProgram(
    num vShaderId,
    num fShaderId,
  ) => 'rlLoadShaderProgram($vShaderId, $fShaderId)';

  String rlUnloadShaderProgram(
    num id,
  ) => 'rlUnloadShaderProgram($id)';

  String rlGetLocationUniform(
    num shaderId,
    String uniformName,
  ) => 'rlGetLocationUniform($shaderId, $uniformName)';

  String rlGetLocationAttrib(
    num shaderId,
    String attribName,
  ) => 'rlGetLocationAttrib($shaderId, $attribName)';

  String rlSetUniform(
    num locIndex,
    TypedDataList value,
    RlShaderUniformDataType uniformType,
    num count,
  ) => 'rlSetUniform($locIndex, ${value.lengthInBytes}, ${uniformType.name})';

  String rlSetUniformMatrix(
    num locIndex,
    MatrixBase mat,
  ) => 'rlSetUniformMatrix($locIndex, $mat)';

  String rlSetUniformMatrices(
    num locIndex,
    List<MatrixBase> mat,
  ) => 'rlSetUniformMatrices($locIndex, mat: ${mat.length})';

  String rlSetUniformSampler(
    num locIndex,
    num textureId,
  ) => 'rlSetUniformSampler($locIndex, $textureId)';

  String rlSetShader(
    num id,
    List<int> locs,
  ) => 'rlSetShader($id, $locs)';

  String rlLoadComputeShaderProgram(
    num shaderId,
  ) => 'rlLoadComputeShaderProgram($shaderId)';

  String rlComputeShaderDispatch(
    num groupX,
    num groupY,
    num groupZ,
  ) => 'rlComputeShaderDispatch($groupX, $groupY, $groupZ)';

  String rlLoadShaderBuffer(
    num size,
    TypedDataList? data,
    RlUsageHint? usageHint,
  ) => 'rlLoadShaderBuffer($size, data: ${data?.lengthInBytes}, $usageHint)';

  String rlUnloadShaderBuffer(
    num ssboId,
  ) => 'rlUnloadShaderBuffer($ssboId)';

  String rlUpdateShaderBuffer(
    num id,
    TypedDataList data,
    num offset,
  ) => 'rlUpdateShaderBuffer($id, data: ${data.lengthInBytes}, $offset)';

  String rlBindShaderBuffer(
    num id,
    num index,
  ) => 'rlBindShaderBuffer($id, $index)';

  String rlReadShaderBuffer(
    num id,
    num count,
    num offset,
  ) => 'rlReadShaderBuffer($id, $count, $offset)';

  String rlCopyShaderBuffer(
    num destId,
    num srcId,
    num destOffset,
    num srcOffset,
    num count,
  ) => 'rlCopyShaderBuffer($destId, $srcId, $destOffset, $srcOffset, $count)';

  String rlGetShaderBufferSize(
    num id,
  ) => 'rlGetShaderBufferSize($id)';

  String rlBindImageTexture(
    num id,
    num index,
    PixelFormat format,
    bool readonly,
  ) => 'rlBindImageTexture($id, $index, ${format.name}, $readonly)';

  String rlGetMatrixModelview() => 'rlGetMatrixModelview()';

  String rlGetMatrixProjection() => 'rlGetMatrixProjection()';

  String rlGetMatrixTransform() => 'rlGetMatrixTransform()';

  String rlGetMatrixProjectionStereo(
    num eye,
  ) => 'rlGetMatrixProjectionStereo($eye)';

  String rlGetMatrixViewOffsetStereo(
    num eye,
  ) => 'rlGetMatrixViewOffsetStereo($eye)';

  String rlSetMatrixProjection(
    MatrixBase proj,
  ) => 'rlSetMatrixProjection($proj)';

  String rlSetMatrixModelview(
    MatrixBase view,
  ) => 'rlSetMatrixModelview($view)';

  String rlSetMatrixProjectionStereo(
    MatrixBase right,
    MatrixBase left,
  ) => 'rlSetMatrixProjectionStereo($right, $left)';

  String rlSetMatrixViewOffsetStereo(
    MatrixBase right,
    MatrixBase left,
  ) => 'rlSetMatrixViewOffsetStereo($right, $left)';

  String rlLoadDrawCube() => 'rlLoadDrawCube()';

  String rlLoadDrawQuad() => 'rlLoadDrawQuad()';
  
}
