import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibRlglFlatModule get _module => RaylibBase.instance.module();

/// See [RaylibRlglFlatModule.rlMatrixMode].
void rlMatrixMode(
  int mode,
) => _module.rlMatrixMode(mode);

/// See [RaylibRlglFlatModule.rlPushMatrix].
void rlPushMatrix() => _module.rlPushMatrix();

/// See [RaylibRlglFlatModule.rlPopMatrix].
void rlPopMatrix() => _module.rlPopMatrix();

/// See [RaylibRlglFlatModule.rlLoadIdentity].
void rlLoadIdentity() => _module.rlLoadIdentity();

/// See [RaylibRlglFlatModule.rlTranslatef].
void rlTranslatef(
  double x,
  double y,
  double z,
) => _module.rlTranslatef(x, y, z);

/// See [RaylibRlglFlatModule.rlRotatef].
void rlRotatef(
  double angle,
  double x,
  double y,
  double z,
) => _module.rlRotatef(angle, x, y, z);

/// See [RaylibRlglFlatModule.rlScalef].
void rlScalef(
  double x,
  double y,
  double z,
) => _module.rlScalef(x, y, z);

/// See [RaylibRlglFlatModule.rlMultMatrixf].
void rlMultMatrixf(
  MemoryPointer<RFloat32> matf, 
) => _module.rlMultMatrixf(matf);

/// See [RaylibRlglFlatModule.rlFrustum].
void rlFrustum(
  double left,
  double right,
  double bottom,
  double top,
  double znear,
  double zfar,
) => _module.rlFrustum(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglFlatModule.rlOrtho].
void rlOrtho(
  double left,
  double right,
  double bottom,
  double top,
  double znear,
  double zfar,
) => _module.rlOrtho(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglFlatModule.rlViewport].
void rlViewport(
  int x,
  int y,
  int width,
  int height,
) => _module.rlViewport(x, y, width, height);

/// See [RaylibRlglFlatModule.rlSetClipPlanes].
void rlSetClipPlanes(
  double nearPlane,
  double farPlane,
) => _module.rlSetClipPlanes(nearPlane, farPlane);

/// See [RaylibRlglFlatModule.rlGetCullDistanceNear].
double rlGetCullDistanceNear() => _module.rlGetCullDistanceNear();

/// See [RaylibRlglFlatModule.rlGetCullDistanceFar].
double rlGetCullDistanceFar() => _module.rlGetCullDistanceFar();

/// See [RaylibRlglFlatModule.rlBegin].
void rlBegin(
  int mode,
) => _module.rlBegin(mode);

/// See [RaylibRlglFlatModule.rlEnd].
void rlEnd() => _module.rlEnd();

/// See [RaylibRlglFlatModule.rlVertex2i].
void rlVertex2i(
  int x,
  int y,
) => _module.rlVertex2i(x, y);

/// See [RaylibRlglFlatModule.rlVertex2f].
void rlVertex2f(
  double x,
  double y,
) => _module.rlVertex2f(x, y);

/// See [RaylibRlglFlatModule.rlVertex3f].
void rlVertex3f(
  double x,
  double y,
  double z
) => _module.rlVertex3f(x, y, z);

/// See [RaylibRlglFlatModule.rlTexCoord2f].
void rlTexCoord2f(
  double x,
  double y,
) => _module.rlTexCoord2f(x, y);

/// See [RaylibRlglFlatModule.rlNormal3f].
void rlNormal3f(
  double x,
  double y,
  double z,
) => _module.rlNormal3f(x, y, z);

/// See [RaylibRlglFlatModule.rlColor4ub].
void rlColor4ub(
  int r,
  int g,
  int b,
  int a,
) => _module.rlColor4ub(r, g, b, a);

/// See [RaylibRlglFlatModule.rlColor3f].
void rlColor3f(
  double x,
  double y,
  double z,
) => _module.rlColor3f(x, y, z);

/// See [RaylibRlglFlatModule.rlColor4f].
void rlColor4f(
  double x,
  double y,
  double z,
  double w,
) => _module.rlColor4f(x, y, z, w);

/// See [RaylibRlglFlatModule.rlEnableVertexArray].
bool rlEnableVertexArray(
  int vaoId,
) => _module.rlEnableVertexArray(vaoId);

/// See [RaylibRlglFlatModule.rlDisableVertexArray].
void rlDisableVertexArray() => _module.rlDisableVertexArray();

/// See [RaylibRlglFlatModule.rlEnableVertexBuffer].
void rlEnableVertexBuffer(
  int id,
) => _module.rlEnableVertexBuffer(id);

/// See [RaylibRlglFlatModule.rlDisableVertexBuffer].
void rlDisableVertexBuffer() => _module.rlDisableVertexBuffer();

/// See [RaylibRlglFlatModule.rlEnableVertexBufferElement].
void rlEnableVertexBufferElement(
  int id,
) => _module.rlEnableVertexBufferElement(id);

/// See [RaylibRlglFlatModule.rlDisableVertexBufferElement].
void rlDisableVertexBufferElement() => _module.rlDisableVertexBufferElement();

/// See [RaylibRlglFlatModule.rlEnableVertexAttribute].
void rlEnableVertexAttribute(
  int index,
) => _module.rlEnableVertexAttribute(index);

/// See [RaylibRlglFlatModule.rlDisableVertexAttribute].
void rlDisableVertexAttribute(
  int index,
) => _module.rlDisableVertexAttribute(index);

/// See [RaylibRlglFlatModule.rlEnableStatePointer].
void rlEnableStatePointer(
  int vertexAttribType,
  MemoryPointer<RVoid> buffer,
) => _module.rlEnableStatePointer(vertexAttribType, buffer);

/// See [RaylibRlglFlatModule.rlDisableStatePointer].
void rlDisableStatePointer(
  int vertexAttribType,
) => _module.rlDisableStatePointer(vertexAttribType);

/// See [RaylibRlglFlatModule.rlActiveTextureSlot].
void rlActiveTextureSlot(
  int slot,
) => _module.rlActiveTextureSlot(slot);

/// See [RaylibRlglFlatModule.rlEnableTexture].
void rlEnableTexture(
  int id,
) => _module.rlEnableTexture(id);

/// See [RaylibRlglFlatModule.rlDisableTexture].
void rlDisableTexture() => _module.rlDisableTexture();

/// See [RaylibRlglFlatModule.rlEnableTextureCubemap].
void rlEnableTextureCubemap(
  int id,
) => _module.rlEnableTextureCubemap(id);

/// See [RaylibRlglFlatModule.rlDisableTextureCubemap].
void rlDisableTextureCubemap() => _module.rlDisableTextureCubemap();

/// See [RaylibRlglFlatModule.rlTextureParameters].
void rlTextureParameters(
  int id,
  int param,
  int value,
) => _module.rlTextureParameters(id, param, value);

/// See [RaylibRlglFlatModule.rlCubemapParameters].
void rlCubemapParameters(
  int id,
  int param,
  int value,
) => _module.rlCubemapParameters(id, param, value);

/// See [RaylibRlglFlatModule.rlEnableShader].
void rlEnableShader(
  int id,
) => _module.rlEnableShader(id);

/// See [RaylibRlglFlatModule.rlDisableShader].
void rlDisableShader() => _module.rlDisableShader();

/// See [RaylibRlglFlatModule.rlEnableFramebuffer].
void rlEnableFramebuffer(
  int id,
) => _module.rlEnableFramebuffer(id);

/// See [RaylibRlglFlatModule.rlDisableFramebuffer].
void rlDisableFramebuffer() => _module.rlDisableFramebuffer();

/// See [RaylibRlglFlatModule.rlGetActiveFramebuffer].
int rlGetActiveFramebuffer() => _module.rlGetActiveFramebuffer();

/// See [RaylibRlglFlatModule.rlActiveDrawBuffers].
void rlActiveDrawBuffers(
  int count,
) => _module.rlActiveDrawBuffers(count);

/// See [RaylibRlglFlatModule.rlBlitFramebuffer].
void rlBlitFramebuffer(
  int srcX,
  int srcY,
  int srcWidth,
  int srcHeight,
  int dstX,
  int dstY,
  int dstWidth,
  int dstHeight,
  int bufferMask,
) => _module.rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask);

/// See [RaylibRlglFlatModule.rlBindFramebuffer].
void rlBindFramebuffer(
  int target,
  int framebuffer,
) => _module.rlBindFramebuffer(target, framebuffer);

/// See [RaylibRlglFlatModule.rlEnableColorBlend].
void rlEnableColorBlend() => _module.rlEnableColorBlend();

/// See [RaylibRlglFlatModule.rlDisableColorBlend].
void rlDisableColorBlend() => _module.rlDisableColorBlend();

/// See [RaylibRlglFlatModule.rlEnableDepthTest].
void rlEnableDepthTest() => _module.rlEnableDepthTest();

/// See [RaylibRlglFlatModule.rlDisableDepthTest].
void rlDisableDepthTest() => _module.rlDisableDepthTest();

/// See [RaylibRlglFlatModule.rlEnableDepthMask].
void rlEnableDepthMask() => _module.rlEnableDepthMask();

/// See [RaylibRlglFlatModule.rlDisableDepthMask].
void rlDisableDepthMask() => _module.rlDisableDepthMask();

/// See [RaylibRlglFlatModule.rlEnableBackfaceCulling].
void rlEnableBackfaceCulling() => _module.rlEnableBackfaceCulling();

/// See [RaylibRlglFlatModule.rlDisableBackfaceCulling].
void rlDisableBackfaceCulling() => _module.rlDisableBackfaceCulling();

/// See [RaylibRlglFlatModule.rlColorMask].
void rlColorMask(
  bool r,
  bool g,
  bool b,
  bool a,
) => _module.rlColorMask(r, g, b, a);

/// See [RaylibRlglFlatModule.rlSetCullFace].
void rlSetCullFace(
  int mode,
) => _module.rlSetCullFace(mode);

/// See [RaylibRlglFlatModule.rlEnableScissorTest].
void rlEnableScissorTest() => _module.rlEnableScissorTest();

/// See [RaylibRlglFlatModule.rlDisableScissorTest].
void rlDisableScissorTest() => _module.rlDisableScissorTest();

/// See [RaylibRlglFlatModule.rlScissor].
void rlScissor(
  int x,
  int y,
  int width,
  int height,
) => _module.rlScissor(x, y, width, height);

/// See [RaylibRlglFlatModule.rlEnablePointMode].
void rlEnablePointMode() => _module.rlEnablePointMode();

/// See [RaylibRlglFlatModule.rlDisablePointMode].
void rlDisablePointMode() => _module.rlDisablePointMode();

/// See [RaylibRlglFlatModule.rlSetPointSize].
void rlSetPointSize(
  double size,
) => _module.rlSetPointSize(size);

/// See [RaylibRlglFlatModule.rlGetPointSize].
double rlGetPointSize() => _module.rlGetPointSize();

/// See [RaylibRlglFlatModule.rlEnableWireMode].
void rlEnableWireMode() => _module.rlEnableWireMode();

/// See [RaylibRlglFlatModule.rlDisableWireMode].
void rlDisableWireMode() => _module.rlDisableWireMode();

/// See [RaylibRlglFlatModule.rlSetLineWidth].
void rlSetLineWidth(
  double width,
) => _module.rlSetLineWidth(width);

/// See [RaylibRlglFlatModule.rlGetLineWidth].
double rlGetLineWidth() => _module.rlGetLineWidth();

/// See [RaylibRlglFlatModule.rlEnableSmoothLines].
void rlEnableSmoothLines() => _module.rlEnableSmoothLines();

/// See [RaylibRlglFlatModule.rlDisableSmoothLines].
void rlDisableSmoothLines() => _module.rlDisableSmoothLines();

/// See [RaylibRlglFlatModule.rlEnableStereoRender].
void rlEnableStereoRender() => _module.rlEnableStereoRender();

/// See [RaylibRlglFlatModule.rlDisableStereoRender].
void rlDisableStereoRender() => _module.rlDisableStereoRender();

/// See [RaylibRlglFlatModule.rlIsStereoRenderEnabled].
bool rlIsStereoRenderEnabled() => _module.rlIsStereoRenderEnabled();

/// See [RaylibRlglFlatModule.rlClearColor].
void rlClearColor(
  int r,
  int g,
  int b,
  int a,
) => _module.rlClearColor(r, g, b, a);

/// See [RaylibRlglFlatModule.rlClearScreenBuffers].
void rlClearScreenBuffers() => _module.rlClearScreenBuffers();

/// See [RaylibRlglFlatModule.rlCheckErrors].
void rlCheckErrors() => _module.rlCheckErrors();

/// See [RaylibRlglFlatModule.rlSetBlendMode].
void rlSetBlendMode(
  int mode,
) => _module.rlSetBlendMode(mode);

/// See [RaylibRlglFlatModule.rlSetBlendFactors].
void rlSetBlendFactors(
  int glSrcFactor,
  int glDstFactor,
  int glEquation,
) => _module.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation);

/// See [RaylibRlglFlatModule.rlSetBlendFactorsSeparate].
void rlSetBlendFactorsSeparate(
  int glSrcRGB,
  int glDstRGB,
  int glSrcAlpha,
  int glDstAlpha,
  int glEqRGB,
  int glEqAlpha,
) => _module.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha);

/// See [RaylibRlglFlatModule.rlglInit].
void rlglInit(
  int width,
  int height,
) => _module.rlglInit(width, height);

/// See [RaylibRlglFlatModule.rlglClose].
void rlglClose() => _module.rlglClose();

/// See [RaylibRlglFlatModule.rlLoadExtensions].
void rlLoadExtensions(
  MemoryPointer<RVoid> loader,
) => _module.rlLoadExtensions(loader);

/// See [RaylibRlglFlatModule.rlGetProcAddress].
MemoryPointer<RVoid> rlGetProcAddress(
  MemoryPointer<RChar> procName,
) => _module.rlGetProcAddress(procName);

/// See [RaylibRlglFlatModule.rlGetVersion].
int rlGetVersion() => _module.rlGetVersion();

/// See [RaylibRlglFlatModule.rlSetFramebufferWidth].
void rlSetFramebufferWidth(
  int width,
) => _module.rlSetFramebufferWidth(width);

/// See [RaylibRlglFlatModule.rlGetFramebufferWidth].
int rlGetFramebufferWidth() => _module.rlGetFramebufferWidth();

/// See [RaylibRlglFlatModule.rlSetFramebufferHeight].
void rlSetFramebufferHeight(
  int height,
) => _module.rlSetFramebufferHeight(height);

/// See [RaylibRlglFlatModule.rlGetFramebufferHeight].
int rlGetFramebufferHeight() => _module.rlGetFramebufferHeight();

/// See [RaylibRlglFlatModule.rlGetTextureIdDefault].
int rlGetTextureIdDefault() => _module.rlGetTextureIdDefault();

/// See [RaylibRlglFlatModule.rlGetShaderIdDefault].
int rlGetShaderIdDefault() => _module.rlGetShaderIdDefault();

/// See [RaylibRlglFlatModule.rlGetShaderLocsDefault].
MemoryPointer<RInt> rlGetShaderLocsDefault() => _module.rlGetShaderLocsDefault();

/// See [RaylibRlglFlatModule.rlLoadRenderBatch].
RlRenderBatchD rlLoadRenderBatch(
  int numBuffers,
  int bufferElements,
) => _module.rlLoadRenderBatch(numBuffers, bufferElements);

/// See [RaylibRlglFlatModule.rlUnloadRenderBatch].
void rlUnloadRenderBatch(
  RlRenderBatchD batch,
) => _module.rlUnloadRenderBatch(batch);

/// See [RaylibRlglFlatModule.rlDrawRenderBatch].
void rlDrawRenderBatch(
  StructPointer<RlRenderBatchD> batch,
) => _module.rlDrawRenderBatch(batch);

/// See [RaylibRlglFlatModule.rlSetRenderBatchActive].
void rlSetRenderBatchActive(
  StructPointer<RlRenderBatchD> batch,
) => _module.rlSetRenderBatchActive(batch);

/// See [RaylibRlglFlatModule.rlDrawRenderBatchActive].
void rlDrawRenderBatchActive() => _module.rlDrawRenderBatchActive();

/// See [RaylibRlglFlatModule.rlCheckRenderBatchLimit].
bool rlCheckRenderBatchLimit(
  int vCount,
) => _module.rlCheckRenderBatchLimit(vCount);

/// See [RaylibRlglFlatModule.rlSetTexture].
void rlSetTexture(
  int id,
) => _module.rlSetTexture(id);

/// See [RaylibRlglFlatModule.rlLoadVertexArray].
int rlLoadVertexArray() => _module.rlLoadVertexArray();

/// See [RaylibRlglFlatModule.rlLoadVertexBuffer].
int rlLoadVertexBuffer(
  MemoryPointer<RVoid> buffer,
  int size,
  bool dynamic,
) => _module.rlLoadVertexBuffer(buffer, size, dynamic);

/// See [RaylibRlglFlatModule.rlLoadVertexBufferElement].
int rlLoadVertexBufferElement(
  MemoryPointer<RVoid> buffer,
  int size,
  bool dynamic,
) => _module.rlLoadVertexBufferElement(buffer, size, dynamic);

/// See [RaylibRlglFlatModule.rlUpdateVertexBuffer].
void rlUpdateVertexBuffer(
  int bufferId,
  MemoryPointer<RVoid> data,
  int dataSize,
  int offset,
) => _module.rlUpdateVertexBuffer(bufferId, data, dataSize, offset);

/// See [RaylibRlglFlatModule.rlUpdateVertexBufferElements].
void rlUpdateVertexBufferElements(
  int id,
  MemoryPointer<RVoid> data,
  int dataSize,
  int offset,
) => _module.rlUpdateVertexBufferElements(id, data, dataSize, offset);

/// See [RaylibRlglFlatModule.rlUnloadVertexArray].
void rlUnloadVertexArray(
  int vaoId,
) => _module.rlUnloadVertexArray(vaoId);

/// See [RaylibRlglFlatModule.rlUnloadVertexBuffer].
void rlUnloadVertexBuffer(
  int vboId,
) => _module.rlUnloadVertexBuffer(vboId);

/// See [RaylibRlglFlatModule.rlSetVertexAttribute].
void rlSetVertexAttribute(
  int index,
  int compSize,
  int type,
  bool normalized,
  int stride,
  int offset,
) => _module.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset);

/// See [RaylibRlglFlatModule.rlSetVertexAttributeDivisor].
void rlSetVertexAttributeDivisor(
  int index,
  int divisor,
) => _module.rlSetVertexAttributeDivisor(index, divisor);

/// See [RaylibRlglFlatModule.rlSetVertexAttributeDefault].
void rlSetVertexAttributeDefault(
  int locIndex,
  MemoryPointer<RVoid> value,
  int attribType,
  int count,
) => _module.rlSetVertexAttributeDefault(locIndex, value, attribType, count);

/// See [RaylibRlglFlatModule.rlDrawVertexArray].
void rlDrawVertexArray(
  int offset,
  int count,
) => _module.rlDrawVertexArray(offset, count);

/// See [RaylibRlglFlatModule.rlDrawVertexArrayElements].
void rlDrawVertexArrayElements(
  int offset,
  int count,
  MemoryPointer<RVoid> buffer,
) => _module.rlDrawVertexArrayElements(offset, count, buffer);

/// See [RaylibRlglFlatModule.rlDrawVertexArrayInstanced].
void rlDrawVertexArrayInstanced(
  int offset,
  int count,
  int instances,
) => _module.rlDrawVertexArrayInstanced(offset, count, instances);

/// See [RaylibRlglFlatModule.rlDrawVertexArrayElementsInstanced].
void rlDrawVertexArrayElementsInstanced(
  int offset,
  int count,
  MemoryPointer<RVoid> buffer,
  int instances,
) => _module.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances);

/// See [RaylibRlglFlatModule.rlLoadTexture].
int rlLoadTexture(
  MemoryPointer<RVoid> data,
  int width,
  int height,
  int format,
  int mipmapCount,
) => _module.rlLoadTexture(data, width, height, format, mipmapCount);

/// See [RaylibRlglFlatModule.rlLoadTextureDepth].
int rlLoadTextureDepth(
  int width,
  int height,
  bool useRenderBuffer,
) => _module.rlLoadTextureDepth(width, height, useRenderBuffer);

/// See [RaylibRlglFlatModule.rlLoadTextureCubemap].
int rlLoadTextureCubemap(
  MemoryPointer<RVoid> data,
  int size,
  int format,
  int mipmapCount,
) => _module.rlLoadTextureCubemap(data, size, format, mipmapCount);

/// See [RaylibRlglFlatModule.rlUpdateTexture].
void rlUpdateTexture(
  int id,
  int offsetX,
  int offsetY,
  int width,
  int height,
  int format,
  MemoryPointer<RVoid> data,
) => _module.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data);

/// See [RaylibRlglFlatModule.rlGetGlTextureFormats].
void rlGetGlTextureFormats(
  int format,
  MemoryPointer<RUnsignedInt> glInternalFormat,
  MemoryPointer<RUnsignedInt> glFormat,
  MemoryPointer<RUnsignedInt> glType,
) => _module.rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType);

/// See [RaylibRlglFlatModule.rlGetPixelFormatName].
MemoryPointer<RChar> rlGetPixelFormatName(
  int format,
) => _module.rlGetPixelFormatName(format);

/// See [RaylibRlglFlatModule.rlUnloadTexture].
void rlUnloadTexture(
  int id,
) => _module.rlUnloadTexture(id);

/// See [RaylibRlglFlatModule.rlGenTextureMipmaps].
void rlGenTextureMipmaps(
  int id,
  int width,
  int height,
  int format,
  MemoryPointer<RInt> mipmaps,
) => _module.rlGenTextureMipmaps(id, width, height, format, mipmaps);

/// See [RaylibRlglFlatModule.rlReadTexturePixels].
MemoryPointer<RVoid> rlReadTexturePixels(
  int id,
  int width,
  int height,
  int format,
) => _module.rlReadTexturePixels(id, width, height, format);

/// See [RaylibRlglFlatModule.rlReadScreenPixels].
MemoryPointer<RUnsignedChar> rlReadScreenPixels(
  int width,
  int height,
) => _module.rlReadScreenPixels(width, height);

/// See [RaylibRlglFlatModule.rlLoadFramebuffer].
int rlLoadFramebuffer() => _module.rlLoadFramebuffer();

/// See [RaylibRlglFlatModule.rlFramebufferAttach].
void rlFramebufferAttach(
  int fboId,
  int texId,
  int attachType,
  int texType,
  int mipLevel,
) => _module.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel);

/// See [RaylibRlglFlatModule.rlFramebufferComplete].
bool rlFramebufferComplete(
  int id,
) => _module.rlFramebufferComplete(id);

/// See [RaylibRlglFlatModule.rlUnloadFramebuffer].
void rlUnloadFramebuffer(
  int id,
) => _module.rlUnloadFramebuffer(id);

/// See [RaylibRlglFlatModule.rlCopyFramebuffer].
void rlCopyFramebuffer(
  int x,
  int y,
  int width,
  int height,
  int format,
  MemoryPointer<RVoid> pixels,
) => _module.rlCopyFramebuffer(x, y, width, height, format, pixels);

/// See [RaylibRlglFlatModule.rlResizeFramebuffer].
void rlResizeFramebuffer(
  int width,
  int height,
) => _module.rlResizeFramebuffer(width, height);

/// See [RaylibRlglFlatModule.rlLoadShader].
int rlLoadShader(
  MemoryPointer<RChar> code,
  int type,
) => _module.rlLoadShader(code, type);

/// See [RaylibRlglFlatModule.rlLoadShaderProgram].
int rlLoadShaderProgram(
  MemoryPointer<RChar> vsCode,
  MemoryPointer<RChar> fsCode,
) => _module.rlLoadShaderProgram(vsCode, fsCode);

/// See [RaylibRlglFlatModule.rlLoadShaderProgramEx].
int rlLoadShaderProgramEx(
  int vsId,
  int fsId,
) => _module.rlLoadShaderProgramEx(vsId, fsId);

/// See [RaylibRlglFlatModule.rlLoadShaderProgramCompute].
int rlLoadShaderProgramCompute(
  int csId,
) => _module.rlLoadShaderProgramCompute(csId);

/// See [RaylibRlglFlatModule.rlUnloadShader].
void rlUnloadShader(
  int id,
) => _module.rlUnloadShader(id);

/// See [RaylibRlglFlatModule.rlUnloadShaderProgram].
void rlUnloadShaderProgram(
  int id,
) => _module.rlUnloadShaderProgram(id);

/// See [RaylibRlglFlatModule.rlGetLocationUniform].
int rlGetLocationUniform(
  int shaderId,
  MemoryPointer<RChar> uniformName,
) => _module.rlGetLocationUniform(shaderId, uniformName);

/// See [RaylibRlglFlatModule.rlGetLocationAttrib].
int rlGetLocationAttrib(
  int shaderId,
  MemoryPointer<RChar> attribName,
) => _module.rlGetLocationAttrib(shaderId, attribName);

/// See [RaylibRlglFlatModule.rlSetUniform].
void rlSetUniform(
  int locIndex,
  MemoryPointer<RVoid> value,
  int uniformType,
  int count,
) => _module.rlSetUniform(locIndex, value, uniformType, count);

/// See [RaylibRlglFlatModule.rlSetUniformMatrix].
void rlSetUniformMatrix(
  int locIndex,
  MatrixD mat,
) => _module.rlSetUniformMatrix(locIndex, mat);

/// See [RaylibRlglFlatModule.rlSetUniformMatrices].
void rlSetUniformMatrices(
  int locIndex,
  StructPointer<MatrixD> mat,
  int count,
) => _module.rlSetUniformMatrices(locIndex, mat, count);

/// See [RaylibRlglFlatModule.rlSetUniformSampler].
void rlSetUniformSampler(
  int locIndex,
  int textureId,
) => _module.rlSetUniformSampler(locIndex, textureId);

/// See [RaylibRlglFlatModule.rlSetShader].
void rlSetShader(
  int id,
  MemoryPointer<RInt> locs,
) => _module.rlSetShader(id, locs);

/// See [RaylibRlglFlatModule.rlComputeShaderDispatch].
void rlComputeShaderDispatch(
  int groupX,
  int groupY,
  int groupZ,
) => _module.rlComputeShaderDispatch(groupX, groupY, groupZ);

/// See [RaylibRlglFlatModule.rlLoadShaderBuffer].
int rlLoadShaderBuffer(
  int size,
  MemoryPointer<RVoid> data,
  int usageHint,
) => _module.rlLoadShaderBuffer(size, data, usageHint);

/// See [RaylibRlglFlatModule.rlUnloadShaderBuffer].
void rlUnloadShaderBuffer(
  int ssboId,
) => _module.rlUnloadShaderBuffer(ssboId);

/// See [RaylibRlglFlatModule.rlUpdateShaderBuffer].
void rlUpdateShaderBuffer(
  int id,
  MemoryPointer<RVoid> data,
  int dataSize,
  int offset,
) => _module.rlUpdateShaderBuffer(id, data, dataSize, offset);

/// See [RaylibRlglFlatModule.rlBindShaderBuffer].
void rlBindShaderBuffer(
  int id,
  int index,
) => _module.rlBindShaderBuffer(id, index);

/// See [RaylibRlglFlatModule.rlReadShaderBuffer].
void rlReadShaderBuffer(
  int id,
  MemoryPointer<RVoid> dest,
  int count,
  int offset,
) => _module.rlReadShaderBuffer(id, dest, count, offset);

/// See [RaylibRlglFlatModule.rlCopyShaderBuffer].
void rlCopyShaderBuffer(
  int destId,
  int srcId,
  int destOffset,
  int srcOffset,
  int count,
) => _module.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count);

/// See [RaylibRlglFlatModule.rlGetShaderBufferSize].
int rlGetShaderBufferSize(
  int id,
) => _module.rlGetShaderBufferSize(id);

/// See [RaylibRlglFlatModule.rlBindImageTexture].
void rlBindImageTexture(
  int id,
  int index,
  int format,
  bool readonly,
) => _module.rlBindImageTexture(id, index, format, readonly);

/// See [RaylibRlglFlatModule.rlGetMatrixModelview].
MatrixD rlGetMatrixModelview() => _module.rlGetMatrixModelview();

/// See [RaylibRlglFlatModule.rlGetMatrixProjection].
MatrixD rlGetMatrixProjection() => _module.rlGetMatrixProjection();

/// See [RaylibRlglFlatModule.rlGetMatrixTransform].
MatrixD rlGetMatrixTransform() => _module.rlGetMatrixTransform();

/// See [RaylibRlglFlatModule.rlGetMatrixProjectionStereo].
MatrixD rlGetMatrixProjectionStereo(
  int eye,
) => _module.rlGetMatrixProjectionStereo(eye);

/// See [RaylibRlglFlatModule.rlGetMatrixViewOffsetStereo].
MatrixD rlGetMatrixViewOffsetStereo(
  int eye,
) => _module.rlGetMatrixViewOffsetStereo(eye);

/// See [RaylibRlglFlatModule.rlSetMatrixProjection].
void rlSetMatrixProjection(
  MatrixD proj,
) => _module.rlSetMatrixProjection(proj);

/// See [RaylibRlglFlatModule.rlSetMatrixModelview].
void rlSetMatrixModelview(
  MatrixD view,
) => _module.rlSetMatrixModelview(view);

/// See [RaylibRlglFlatModule.rlSetMatrixProjectionStereo].
void rlSetMatrixProjectionStereo(
  MatrixD right,
  MatrixD left,
) => _module.rlSetMatrixProjectionStereo(right, left);

/// See [RaylibRlglFlatModule.rlSetMatrixViewOffsetStereo].
void rlSetMatrixViewOffsetStereo(
  MatrixD right,
  MatrixD left,
) => _module.rlSetMatrixViewOffsetStereo(right, left);

/// See [RaylibRlglFlatModule.rlLoadDrawCube].
void rlLoadDrawCube() => _module.rlLoadDrawCube();

/// See [RaylibRlglFlatModule.rlLoadDrawQuad].
void rlLoadDrawQuad() => _module.rlLoadDrawQuad();