import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibRlglModule get _module => RaylibBase.instance.RlglDart;

/// See [RaylibRlglModule.rlMatrixMode].
void rlMatrixMode(
  RlMatrixMode mode,
) => _module.rlMatrixMode(mode);

/// See [RaylibRlglModule.rlPushMatrix].
void rlPushMatrix() => _module.rlPushMatrix();

/// See [RaylibRlglModule.rlPopMatrix].
void rlPopMatrix() => _module.rlPopMatrix();

/// See [RaylibRlglModule.rlLoadIdentity].
void rlLoadIdentity() => _module.rlLoadIdentity();

/// See [RaylibRlglModule.rlTranslatef].
void rlTranslatef(
  num x,
  num y,
  num z,
) => _module.rlTranslatef(x, y, z);

/// See [RaylibRlglModule.rlRotatef].
void rlRotatef(
  num angle,
  num x,
  num y,
  num z,
) => _module.rlRotatef(angle, x, y, z);

/// See [RaylibRlglModule.rlScalef].
void rlScalef(
  num x,
  num y,
  num z,
) => _module.rlScalef(x, y, z);

/// See [RaylibRlglModule.rlMultMatrixf].
void rlMultMatrixf(
  List<double> matf,
) => _module.rlMultMatrixf(matf);

/// See [RaylibRlglModule.rlFrustum].
void rlFrustum(
  num left,
  num right,
  num bottom,
  num top,
  num znear,
  num zfar,
) => _module.rlFrustum(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglModule.rlOrtho].
void rlOrtho(
  num left,
  num right,
  num bottom,
  num top,
  num znear,
  num zfar,
) => _module.rlOrtho(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglModule.rlViewport].
void rlViewport(
  num x,
  num y,
  num width,
  num height,
) => _module.rlViewport(x, y, width, height);

/// See [RaylibRlglModule.rlSetClipPlanes].
void rlSetClipPlanes(
  num nearPlane,
  num farPlane,
) => _module.rlSetClipPlanes(nearPlane, farPlane);

/// See [RaylibRlglModule.rlGetCullDistanceNear].
double rlGetCullDistanceNear() => _module.rlGetCullDistanceNear();

/// See [RaylibRlglModule.rlGetCullDistanceFar].
double rlGetCullDistanceFar() => _module.rlGetCullDistanceFar();

/// See [RaylibRlglModule.rlBegin].
void rlBegin(
  RlDrawMode mode,
) => _module.rlBegin(mode);

/// See [RaylibRlglModule.rlEnd].
void rlEnd() => _module.rlEnd();

/// See [RaylibRlglModule.rlVertex2i].
void rlVertex2i(
  num x,
  num y,
) => _module.rlVertex2i(x, y);

/// See [RaylibRlglModule.rlVertex2f].
void rlVertex2f(
  num x,
  num y,
) => _module.rlVertex2f(x, y);

/// See [RaylibRlglModule.rlVertex3f].
void rlVertex3f(
  num x,
  num y,
  num z,
) => _module.rlVertex3f(x, y, z);

/// See [RaylibRlglModule.rlTexCoord2f].
void rlTexCoord2f(
  num x,
  num y,
) => _module.rlTexCoord2f(x, y);

/// See [RaylibRlglModule.rlNormal3f].
void rlNormal3f(
  num x,
  num y,
  num z,
) => _module.rlNormal3f(x, y, z);

/// See [RaylibRlglModule.rlColor4ub].
void rlColor4ub(
  num r,
  num g,
  num b,
  num a,
) => _module.rlColor4ub(r, g, b, a);

/// See [RaylibRlglModule.rlColor3f].
void rlColor3f(
  num x,
  num y,
  num z,
) => _module.rlColor3f(x, y, z);

/// See [RaylibRlglModule.rlColor4f].
void rlColor4f(
  num x,
  num y,
  num z,
  num w,
) => _module.rlColor4f(x, y, z, w);

/// See [RaylibRlglModule.rlEnableVertexArray].
bool rlEnableVertexArray(
  num vaoId,
) => _module.rlEnableVertexArray(vaoId);

/// See [RaylibRlglModule.rlDisableVertexArray].
void rlDisableVertexArray() => _module.rlDisableVertexArray();

/// See [RaylibRlglModule.rlEnableVertexBuffer].
void rlEnableVertexBuffer(
  num id,
) => _module.rlEnableVertexBuffer(id);

/// See [RaylibRlglModule.rlDisableVertexBuffer].
void rlDisableVertexBuffer() => _module.rlDisableVertexBuffer();

/// See [RaylibRlglModule.rlEnableVertexBufferElement].
void rlEnableVertexBufferElement(
  num id,
) => _module.rlEnableVertexBufferElement(id);

/// See [RaylibRlglModule.rlDisableVertexBufferElement].
void rlDisableVertexBufferElement() => _module.rlDisableVertexBufferElement();

/// See [RaylibRlglModule.rlEnableVertexAttribute].
void rlEnableVertexAttribute(
  num index,
) => _module.rlEnableVertexAttribute(index);

/// See [RaylibRlglModule.rlDisableVertexAttribute].
void rlDisableVertexAttribute(
  num index,
) => _module.rlDisableVertexAttribute(index);

/// See [RaylibRlglModule.rlEnableStatePointer].
void rlEnableStatePointer(
  int vertexAttribType,
  TypedDataList data,
) => _module.rlEnableStatePointer(vertexAttribType, data);

/// See [RaylibRlglModule.rlDisableStatePointer].
void rlDisableStatePointer(
  int vertexAttribType,
) => _module.rlDisableStatePointer(vertexAttribType);

/// See [RaylibRlglModule.rlActiveTextureSlot].
void rlActiveTextureSlot(
  num slot,
) => _module.rlActiveTextureSlot(slot);

/// See [RaylibRlglModule.rlEnableTexture].
void rlEnableTexture(
  num id,
) => _module.rlEnableTexture(id);

/// See [RaylibRlglModule.rlDisableTexture].
void rlDisableTexture() => _module.rlDisableTexture();

/// See [RaylibRlglModule.rlEnableTextureCubemap].
void rlEnableTextureCubemap(
  num id,
) => _module.rlEnableTextureCubemap(id);

/// See [RaylibRlglModule.rlDisableTextureCubemap].
void rlDisableTextureCubemap() => _module.rlDisableTextureCubemap();

/// See [RaylibRlglModule.rlTextureParameters].
void rlTextureParameters(
  num id,
  num param,
  num value,
) => _module.rlTextureParameters(id, param, value);

/// See [RaylibRlglModule.rlCubemapParameters].
void rlCubemapParameters(
  num id,
  num param,
  num value,
) => _module.rlCubemapParameters(id, param, value);

/// See [RaylibRlglModule.rlEnableShader].
void rlEnableShader(
  num id,
) => _module.rlEnableShader(id);

/// See [RaylibRlglModule.rlDisableShader].
void rlDisableShader() => _module.rlDisableShader();

/// See [RaylibRlglModule.rlEnableFramebuffer].
void rlEnableFramebuffer(
  num id,
) => _module.rlEnableFramebuffer(id);

/// See [RaylibRlglModule.rlDisableFramebuffer].
void rlDisableFramebuffer() => _module.rlDisableFramebuffer();

/// See [RaylibRlglModule.rlGetActiveFramebuffer].
int rlGetActiveFramebuffer() => _module.rlGetActiveFramebuffer();

/// See [RaylibRlglModule.rlActiveDrawBuffers].
void rlActiveDrawBuffers(
  num count,
) => _module.rlActiveDrawBuffers(count);

/// See [RaylibRlglModule.rlBlitFramebuffer].
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
) => _module.rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask);

/// See [RaylibRlglModule.rlBindFramebuffer].
void rlBindFramebuffer(
  num target,
  num framebuffer,
) => _module.rlBindFramebuffer(target, framebuffer);

/// See [RaylibRlglModule.rlEnableColorBlend].
void rlEnableColorBlend() => _module.rlEnableColorBlend();

/// See [RaylibRlglModule.rlDisableColorBlend].
void rlDisableColorBlend() => _module.rlDisableColorBlend();

/// See [RaylibRlglModule.rlEnableDepthTest].
void rlEnableDepthTest() => _module.rlEnableDepthTest();

/// See [RaylibRlglModule.rlDisableDepthTest].
void rlDisableDepthTest() => _module.rlDisableDepthTest();

/// See [RaylibRlglModule.rlEnableDepthMask].
void rlEnableDepthMask() => _module.rlEnableDepthMask();

/// See [RaylibRlglModule.rlDisableDepthMask].
void rlDisableDepthMask() => _module.rlDisableDepthMask();

/// See [RaylibRlglModule.rlEnableBackfaceCulling].
void rlEnableBackfaceCulling() => _module.rlEnableBackfaceCulling();

/// See [RaylibRlglModule.rlDisableBackfaceCulling].
void rlDisableBackfaceCulling() => _module.rlDisableBackfaceCulling();

/// See [RaylibRlglModule.rlColorMask].
void rlColorMask(
  bool r,
  bool g,
  bool b,
  bool a,
) => _module.rlColorMask(r, g, b, a);

/// See [RaylibRlglModule.rlSetCullFace].
void rlSetCullFace(
  RlCullMode mode,
) => _module.rlSetCullFace(mode);

/// See [RaylibRlglModule.rlEnableScissorTest].
void rlEnableScissorTest() => _module.rlEnableScissorTest();

/// See [RaylibRlglModule.rlDisableScissorTest].
void rlDisableScissorTest() => _module.rlDisableScissorTest();

/// See [RaylibRlglModule.rlScissor].
void rlScissor(
  num x,
  num y,
  num width,
  num height,
) => _module.rlScissor(x, y, width, height);

/// See [RaylibRlglModule.rlEnablePointMode].
void rlEnablePointMode() => _module.rlEnablePointMode();

/// See [RaylibRlglModule.rlDisablePointMode].
void rlDisablePointMode() => _module.rlDisablePointMode();

/// See [RaylibRlglModule.rlSetPointSize].
void rlSetPointSize(
  num size,
) => _module.rlSetPointSize(size);

/// See [RaylibRlglModule.rlGetPointSize].
double rlGetPointSize() => _module.rlGetPointSize();

/// See [RaylibRlglModule.rlEnableWireMode].
void rlEnableWireMode() => _module.rlEnableWireMode();

/// See [RaylibRlglModule.rlDisableWireMode].
void rlDisableWireMode() => _module.rlDisableWireMode();

/// See [RaylibRlglModule.rlSetLineWidth].
void rlSetLineWidth(
  num width,
) => _module.rlSetLineWidth(width);

/// See [RaylibRlglModule.rlGetLineWidth].
double rlGetLineWidth() => _module.rlGetLineWidth();

/// See [RaylibRlglModule.rlEnableSmoothLines].
void rlEnableSmoothLines() => _module.rlEnableSmoothLines();

/// See [RaylibRlglModule.rlDisableSmoothLines].
void rlDisableSmoothLines() => _module.rlDisableSmoothLines();

/// See [RaylibRlglModule.rlEnableStereoRender].
void rlEnableStereoRender() => _module.rlEnableStereoRender();

/// See [RaylibRlglModule.rlDisableStereoRender].
void rlDisableStereoRender() => _module.rlDisableStereoRender();

/// See [RaylibRlglModule.rlIsStereoRenderEnabled].
bool rlIsStereoRenderEnabled() => _module.rlIsStereoRenderEnabled();

/// See [RaylibRlglModule.rlClearColor].
void rlClearColor(
  num r,
  num g,
  num b,
  num a,
) => _module.rlClearColor(r, g, b, a);

/// See [RaylibRlglModule.rlClearScreenBuffers].
void rlClearScreenBuffers() => _module.rlClearScreenBuffers();

/// See [RaylibRlglModule.rlCheckErrors].
void rlCheckErrors() => _module.rlCheckErrors();

/// See [RaylibRlglModule.rlSetBlendMode].
void rlSetBlendMode(
  BlendMode mode,
) => _module.rlSetBlendMode(mode);

/// See [RaylibRlglModule.rlSetBlendFactors].
void rlSetBlendFactors(
  num glSrcFactor,
  num glDstFactor,
  num glEquation,
) => _module.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation);

/// See [RaylibRlglModule.rlSetBlendFactorsSeparate].
void rlSetBlendFactorsSeparate(
  num glSrcRGB,
  num glDstRGB,
  num glSrcAlpha,
  num glDstAlpha,
  num glEqRGB,
  num glEqAlpha,
) => _module.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha);

/// See [RaylibRlglModule.rlglInit].
void rlglInit(
  num width,
  num height,
) => _module.rlglInit(width, height);

/// See [RaylibRlglModule.rlglClose].
void rlglClose() => _module.rlglClose();

/// See [RaylibRlglModule.rlGetVersion].
int rlGetVersion() => _module.rlGetVersion();

/// See [RaylibRlglModule.rlSetFramebufferWidth].
void rlSetFramebufferWidth(
  num width,
) => _module.rlSetFramebufferWidth(width);

/// See [RaylibRlglModule.rlGetFramebufferWidth].
int rlGetFramebufferWidth() => _module.rlGetFramebufferWidth();

/// See [RaylibRlglModule.rlSetFramebufferHeight].
void rlSetFramebufferHeight(
  num height,
) => _module.rlSetFramebufferHeight(height);

/// See [RaylibRlglModule.rlGetFramebufferHeight].
int rlGetFramebufferHeight() => _module.rlGetFramebufferHeight();

/// See [RaylibRlglModule.rlGetTextureIdDefault].
int rlGetTextureIdDefault() => _module.rlGetTextureIdDefault();

/// See [RaylibRlglModule.rlGetShaderIdDefault].
int rlGetShaderIdDefault() => _module.rlGetShaderIdDefault();

/// See [RaylibRlglModule.rlGetShaderLocsDefault].
List<int> rlGetShaderLocsDefault() => _module.rlGetShaderLocsDefault();

/// See [RaylibRlglModule.rlLoadRenderBatch].
RlRenderBatchD rlLoadRenderBatch(
  num numBuffers,
  num bufferElements,
) => _module.rlLoadRenderBatch(numBuffers, bufferElements);

/// See [RaylibRlglModule.rlUnloadRenderBatch].
void rlUnloadRenderBatch(
  RlRenderBatchD batch,
) => _module.rlUnloadRenderBatch(batch);

/// See [RaylibRlglModule.rlDrawRenderBatch].
void rlDrawRenderBatch(
  RlRenderBatchD batch,
) => _module.rlDrawRenderBatch(batch);

/// See [RaylibRlglModule.rlSetRenderBatchActive].
void rlSetRenderBatchActive(
  RlRenderBatchD batch,
) => _module.rlSetRenderBatchActive(batch);

/// See [RaylibRlglModule.rlDrawRenderBatchActive].
void rlDrawRenderBatchActive() => _module.rlDrawRenderBatchActive();

/// See [RaylibRlglModule.rlCheckRenderBatchLimit].
bool rlCheckRenderBatchLimit(
  num vCount,
) => _module.rlCheckRenderBatchLimit(vCount);

/// See [RaylibRlglModule.rlSetTexture].
void rlSetTexture(
  num id,
) => _module.rlSetTexture(id);

/// See [RaylibRlglModule.rlLoadVertexArray].
int rlLoadVertexArray() => _module.rlLoadVertexArray();

/// See [RaylibRlglModule.rlLoadVertexBuffer].
int rlLoadVertexBuffer(
  TypedDataList buffer,
  bool dynamic,
) => _module.rlLoadVertexBuffer(buffer, dynamic);

/// See [RaylibRlglModule.rlLoadVertexBufferElement].
int rlLoadVertexBufferElement(
  TypedDataList buffer,
  bool dynamic,
) => _module.rlLoadVertexBufferElement(buffer, dynamic);

/// See [RaylibRlglModule.rlUpdateVertexBuffer].
void rlUpdateVertexBuffer(
  num bufferId,
  TypedDataList data,
  int dataSize,
  num offset,
) => _module.rlUpdateVertexBuffer(bufferId, data, dataSize, offset);

/// See [RaylibRlglModule.rlUpdateVertexBufferElements].
void rlUpdateVertexBufferElements(
  num id,
  TypedDataList data,
  int dataSize,
  num offset,
) => _module.rlUpdateVertexBufferElements(id, data, dataSize, offset);

/// See [RaylibRlglModule.rlUnloadVertexArray].
void rlUnloadVertexArray(
  num vaoId,
) => _module.rlUnloadVertexArray(vaoId);

/// See [RaylibRlglModule.rlUnloadVertexBuffer].
void rlUnloadVertexBuffer(
  num vboId,
) => _module.rlUnloadVertexBuffer(vboId);

/// See [RaylibRlglModule.rlSetVertexAttribute].
void rlSetVertexAttribute(
  num index,
  num compSize,
  num type,
  bool normalized,
  num stride,
  num offset,
) => _module.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset);

/// See [RaylibRlglModule.rlSetVertexAttributeDivisor].
void rlSetVertexAttributeDivisor(
  num index,
  num divisor,
) => _module.rlSetVertexAttributeDivisor(index, divisor);

/// See [RaylibRlglModule.rlSetVertexAttributeDefault].
void rlSetVertexAttributeDefault(
  num locIndex,
  Float32List value,
  RlShaderAttributeDataType attribType,
) => _module.rlSetVertexAttributeDefault(locIndex, value, attribType);

/// See [RaylibRlglModule.rlDrawVertexArray].
void rlDrawVertexArray(
  num offset,
  num count,
) => _module.rlDrawVertexArray(offset, count);

/// See [RaylibRlglModule.rlDrawVertexArrayElements].
void rlDrawVertexArrayElements(
  num offset,
  num count,
  Uint16List buffer,
) => _module.rlDrawVertexArrayElements(offset, count, buffer);

/// See [RaylibRlglModule.rlDrawVertexArrayInstanced].
void rlDrawVertexArrayInstanced(
  num offset,
  num count,
  num instances,
) => _module.rlDrawVertexArrayInstanced(offset, count, instances);

/// See [RaylibRlglModule.rlDrawVertexArrayElementsInstanced].
void rlDrawVertexArrayElementsInstanced(
  num offset,
  num count,
  Uint16List buffer,
  num instances,
) => _module.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances);

/// See [RaylibRlglModule.rlLoadTexture].
int rlLoadTexture(
  Uint8List? data,
  num width,
  num height,
  PixelFormat format,
  num mipmapCount,
) => _module.rlLoadTexture(data, width, height, format, mipmapCount);

/// See [RaylibRlglModule.rlLoadTextureDepth].
int rlLoadTextureDepth(
  num width,
  num height,
  bool useRenderBuffer,
) => _module.rlLoadTextureDepth(width, height, useRenderBuffer);

/// See [RaylibRlglModule.rlLoadTextureCubemap].
int rlLoadTextureCubemap(
  Uint8List? data,
  num size,
  PixelFormat format,
  num mipmapCount,
) => _module.rlLoadTextureCubemap(data, size, format, mipmapCount);

/// See [RaylibRlglModule.rlUpdateTexture].
void rlUpdateTexture(
  num id,
  num offsetX,
  num offsetY,
  num width,
  num height,
  PixelFormat format,
  Uint8List data,
) => _module.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data);

/// See [RaylibRlglModule.rlGetGlTextureFormats].
(int glInternalFormat, int glFormat, int glType) rlGetGlTextureFormats(
  PixelFormat format,
) => _module.rlGetGlTextureFormats(format);

/// See [RaylibRlglModule.rlGetPixelFormatName].
String rlGetPixelFormatName(
  PixelFormat format,
) => _module.rlGetPixelFormatName(format);

/// See [RaylibRlglModule.rlUnloadTexture].
void rlUnloadTexture(
  num id,
) => _module.rlUnloadTexture(id);

/// See [RaylibRlglModule.rlGenTextureMipmaps].
int rlGenTextureMipmaps(
  num id,
  num width,
  num height,
  PixelFormat format,
) => _module.rlGenTextureMipmaps(id, width, height, format);

/// See [RaylibRlglModule.rlReadTexturePixels].
Uint8List rlReadTexturePixels(
  num id,
  num width,
  num height,
  PixelFormat format,
) => _module.rlReadTexturePixels(id, width, height, format);

/// See [RaylibRlglModule.rlReadScreenPixels].
Uint8List rlReadScreenPixels(
  num width,
  num height,
) => _module.rlReadScreenPixels(width, height);

/// See [RaylibRlglModule.rlLoadFramebuffer].
int rlLoadFramebuffer() => _module.rlLoadFramebuffer();

/// See [RaylibRlglModule.rlFramebufferAttach].
void rlFramebufferAttach(
  num fboId,
  num texId,
  RlFramebufferAttachType attachType,
  RlFramebufferAttachTextureType texType,
  num mipLevel,
) => _module.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel);

/// See [RaylibRlglModule.rlFramebufferComplete].
bool rlFramebufferComplete(
  num id,
) => _module.rlFramebufferComplete(id);

/// See [RaylibRlglModule.rlUnloadFramebuffer].
void rlUnloadFramebuffer(
  num id,
) => _module.rlUnloadFramebuffer(id);

/// See [RaylibRlglModule.rlCopyFramebuffer].
Uint8List rlCopyFramebuffer(
  num x,
  num y,
  num width,
  num height,
  PixelFormat format,
) => _module.rlCopyFramebuffer(x, y, width, height, format);

/// See [RaylibRlglModule.rlResizeFramebuffer].
void rlResizeFramebuffer(
  num width,
  num height,
) => _module.rlResizeFramebuffer(width, height);

/// See [RaylibRlglModule.rlLoadShader].
int rlLoadShader(
  String code,
  RlShaderType type,
) => _module.rlLoadShader(code, type);

/// See [RaylibRlglModule.rlLoadShaderProgram].
int rlLoadShaderProgram(
  String vsCode,
  String fsCode,
) => _module.rlLoadShaderProgram(vsCode, fsCode);

/// See [RaylibRlglModule.rlLoadShaderProgramEx].
int rlLoadShaderProgramEx(
  num vsId,
  num fsId,
) => _module.rlLoadShaderProgramEx(vsId, fsId);

/// See [RaylibRlglModule.rlLoadShaderProgramCompute].
int rlLoadShaderProgramCompute(
  num csId,
) => _module.rlLoadShaderProgramCompute(csId);

/// See [RaylibRlglModule.rlUnloadShader].
void rlUnloadShader(
  num id,
) => _module.rlUnloadShader(id);

/// See [RaylibRlglModule.rlUnloadShaderProgram].
void rlUnloadShaderProgram(
  num id,
) => _module.rlUnloadShaderProgram(id);

/// See [RaylibRlglModule.rlGetLocationUniform].
int rlGetLocationUniform(
  num shaderId,
  String uniformName,
) => _module.rlGetLocationUniform(shaderId, uniformName);

/// See [RaylibRlglModule.rlGetLocationAttrib].
int rlGetLocationAttrib(
  num shaderId,
  String attribName,
) => _module.rlGetLocationAttrib(shaderId, attribName);

/// See [RaylibRlglModule.rlSetUniform].
void rlSetUniform(
  num locIndex,
  TypedDataList value,
  RlShaderUniformDataType uniformType,
  num count,
) => _module.rlSetUniform(locIndex, value, uniformType, count);

/// See [RaylibRlglModule.rlSetUniformMatrix].
void rlSetUniformMatrix(
  num locIndex,
  MatrixD mat,
) => _module.rlSetUniformMatrix(locIndex, mat);

/// See [RaylibRlglModule.rlSetUniformMatrices].
void rlSetUniformMatrices(
  num locIndex,
  List<MatrixD> mat,
) => _module.rlSetUniformMatrices(locIndex, mat);

/// See [RaylibRlglModule.rlSetUniformSampler].
void rlSetUniformSampler(
  num locIndex,
  num textureId,
) => _module.rlSetUniformSampler(locIndex, textureId);

/// See [RaylibRlglModule.rlSetShader].
void rlSetShader(
  num id,
  List<int> locs,
) => _module.rlSetShader(id, locs);

/// See [RaylibRlglModule.rlComputeShaderDispatch].
void rlComputeShaderDispatch(
  num groupX,
  num groupY,
  num groupZ,
) => _module.rlComputeShaderDispatch(groupX, groupY, groupZ);

/// See [RaylibRlglModule.rlLoadShaderBuffer].
int rlLoadShaderBuffer(
  num size,
  TypedDataList? data,
  RlUsageHint? usageHint,
) => _module.rlLoadShaderBuffer(size, data, usageHint);

/// See [RaylibRlglModule.rlUnloadShaderBuffer].
void rlUnloadShaderBuffer(
  num ssboId,
) => _module.rlUnloadShaderBuffer(ssboId);

/// See [RaylibRlglModule.rlUpdateShaderBuffer].
void rlUpdateShaderBuffer(
  num id,
  TypedDataList data,
  num offset,
) => _module.rlUpdateShaderBuffer(id, data, offset);

/// See [RaylibRlglModule.rlBindShaderBuffer].
void rlBindShaderBuffer(
  num id,
  num index,
) => _module.rlBindShaderBuffer(id, index);

/// See [RaylibRlglModule.rlReadShaderBuffer].
Uint8List rlReadShaderBuffer(
  num id,
  num count,
  num offset,
) => _module.rlReadShaderBuffer(id, count, offset);

/// See [RaylibRlglModule.rlCopyShaderBuffer].
void rlCopyShaderBuffer(
  num destId,
  num srcId,
  num destOffset,
  num srcOffset,
  num count,
) => _module.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count);

/// See [RaylibRlglModule.rlGetShaderBufferSize].
int rlGetShaderBufferSize(
  num id,
) => _module.rlGetShaderBufferSize(id);

/// See [RaylibRlglModule.rlBindImageTexture].
void rlBindImageTexture(
  num id,
  num index,
  PixelFormat format,
  bool readonly,
) => _module.rlBindImageTexture(id, index, format, readonly);

/// See [RaylibRlglModule.rlGetMatrixModelview].
MatrixD rlGetMatrixModelview() => _module.rlGetMatrixModelview();

/// See [RaylibRlglModule.rlGetMatrixProjection].
MatrixD rlGetMatrixProjection() => _module.rlGetMatrixProjection();

/// See [RaylibRlglModule.rlGetMatrixTransform].
MatrixD rlGetMatrixTransform() => _module.rlGetMatrixTransform();

/// See [RaylibRlglModule.rlGetMatrixProjectionStereo].
MatrixD rlGetMatrixProjectionStereo(
  num eye,
) => _module.rlGetMatrixProjectionStereo(eye);

/// See [RaylibRlglModule.rlGetMatrixViewOffsetStereo].
MatrixD rlGetMatrixViewOffsetStereo(
  num eye,
) => _module.rlGetMatrixViewOffsetStereo(eye);

/// See [RaylibRlglModule.rlSetMatrixProjection].
void rlSetMatrixProjection(
  MatrixD proj,
) => _module.rlSetMatrixProjection(proj);

/// See [RaylibRlglModule.rlSetMatrixModelview].
void rlSetMatrixModelview(
  MatrixD view,
) => _module.rlSetMatrixModelview(view);

/// See [RaylibRlglModule.rlSetMatrixProjectionStereo].
void rlSetMatrixProjectionStereo(
  MatrixD right,
  MatrixD left,
) => _module.rlSetMatrixProjectionStereo(right, left);

/// See [RaylibRlglModule.rlSetMatrixViewOffsetStereo].
void rlSetMatrixViewOffsetStereo(
  MatrixD right,
  MatrixD left,
) => _module.rlSetMatrixViewOffsetStereo(right, left);

/// See [RaylibRlglModule.rlLoadDrawCube].
void rlLoadDrawCube() => _module.rlLoadDrawCube();

/// See [RaylibRlglModule.rlLoadDrawQuad].
void rlLoadDrawQuad() => _module.rlLoadDrawQuad();
