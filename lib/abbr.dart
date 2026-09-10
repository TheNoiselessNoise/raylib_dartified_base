export 'core/modules/core/abbr_consts.dart';
export 'core/modules/gui/abbr_consts.dart';
export 'core/modules/light/abbr_consts.dart';
export 'core/modules/rlgl/abbr_consts.dart';
import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibBase get _rl => RaylibBase.instance;

/// See [RaylibBase.dispose].
void disposeRaylib() => _rl.dispose();

/// See [RaylibBase.CloseWindowAndDispose].
void CloseWindowAndDispose() => _rl.CloseWindowAndDispose();

/// See [RaylibBase.Temp].
RaylibTemp get Temp => _rl.Temp;

/// See [RaylibTemp.TypedDataList$].
RaylibTempTypedDataListAllocator get TypedDataList$ => Temp.TypedDataList$;
/// See [RaylibTemp.String$].
RaylibTempStringAllocator get String$ => Temp.String$;
/// See [RaylibTemp.Bool$].
RaylibTempScalarAllocator<bool, RBool> get Bool$ => Temp.Bool$;
/// See [RaylibTemp.Int8$].
RaylibTempScalarIntAllocator<Int8List, RInt8> get Int8$ => Temp.Int8$;
/// See [RaylibTemp.Uint8$].
RaylibTempScalarIntAllocator<Uint8List, RUint8> get Uint8$ => Temp.Uint8$;
/// See [RaylibTemp.Int16$].
RaylibTempScalarIntAllocator<Int16List, RInt16> get Int16$ => Temp.Int16$;
/// See [RaylibTemp.Uint16$].
RaylibTempScalarIntAllocator<Uint16List, RUint16> get Uint16$ => Temp.Uint16$;
/// See [RaylibTemp.Int32$].
RaylibTempScalarIntAllocator<Int32List, RInt32> get Int32$ => Temp.Int32$;
/// See [RaylibTemp.Uint32$].
RaylibTempScalarIntAllocator<Uint32List, RUint32> get Uint32$ => Temp.Uint32$;
/// See [RaylibTemp.Int64$].
RaylibTempScalarIntAllocator<Int64List, RInt64> get Int64$ => Temp.Int64$;
/// See [RaylibTemp.Uint64$].
RaylibTempScalarIntAllocator<Uint64List, RUint64> get Uint64$ => Temp.Uint64$;
/// See [RaylibTemp.Float32$].
RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float32$ => Temp.Float32$;
/// See [RaylibTemp.Float64$].
RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Float64$ => Temp.Float64$;
/// See [RaylibTemp.Char$].
RaylibTempScalarIntAllocator<Int8List, RInt8> get Char$ => Temp.Char$;
/// See [RaylibTemp.UnsignedChar$].
RaylibTempScalarIntAllocator<Uint8List, RUint8> get UnsignedChar$ => Temp.UnsignedChar$;
/// See [RaylibTemp.Short$].
RaylibTempScalarIntAllocator<Int16List, RInt16> get Short$ => Temp.Short$;
/// See [RaylibTemp.UnsignedShort$].
RaylibTempScalarIntAllocator<Uint16List, RUint16> get UnsignedShort$ => Temp.UnsignedShort$;
/// See [RaylibTemp.Int$].
RaylibTempScalarIntAllocator<Int32List, RInt32> get Int$ => Temp.Int$;
/// See [RaylibTemp.UnsignedInt$].
RaylibTempScalarIntAllocator<Uint32List, RUint32> get UnsignedInt$ => Temp.UnsignedInt$;
/// See [RaylibTemp.Float$].
RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float$ => Temp.Float$;
/// See [RaylibTemp.Double$].
RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Double$ => Temp.Double$;

/// See [RaylibTemp.AutomationEventList$].
RaylibTempStructAllocator<AutomationEventListD> get AutomationEventList$ => Temp.AutomationEventList$;
/// See [RaylibTemp.AutomationEvent$].
RaylibTempStructAllocator<AutomationEventD> get AutomationEvent$ => Temp.AutomationEvent$;
/// See [RaylibTemp.AudioStream$].
RaylibTempStructAllocator<AudioStreamD> get AudioStream$ => Temp.AudioStream$;
/// See [RaylibTemp.BoneInfo$].
RaylibTempStructAllocator<BoneInfoD> get BoneInfo$ => Temp.BoneInfo$;
/// See [RaylibTemp.BoundingBox$].
RaylibTempStructAllocator<BoundingBoxD> get BoundingBox$ => Temp.BoundingBox$;
/// See [RaylibTemp.Camera2D$].
RaylibTempStructAllocator<Camera2DD> get Camera2D$ => Temp.Camera2D$;
/// See [RaylibTemp.Camera3D$].
RaylibTempStructAllocator<Camera3DD> get Camera3D$ => Temp.Camera3D$;
/// See [RaylibTemp.Color$].
RaylibTempStructAllocator<ColorD> get Color$ => Temp.Color$;
/// See [RaylibTemp.FilePathList$].
RaylibTempStructAllocator<FilePathListD> get FilePathList$ => Temp.FilePathList$;
/// See [RaylibTemp.Font$].
RaylibTempStructAllocator<FontD> get Font$ => Temp.Font$;
/// See [RaylibTemp.GestureEvent$].
RaylibTempStructAllocator<GestureEventD> get GestureEvent$ => Temp.GestureEvent$;
/// See [RaylibTemp.GlyphInfo$].
RaylibTempStructAllocator<GlyphInfoD> get GlyphInfo$ => Temp.GlyphInfo$;
/// See [RaylibTemp.Image$].
RaylibTempStructAllocator<ImageD> get Image$ => Temp.Image$;
/// See [RaylibTemp.Light$].
RaylibTempStructAllocator<LightD> get Light$ => Temp.Light$;
/// See [RaylibTemp.Material$].
RaylibTempStructAllocator<MaterialD> get Material$ => Temp.Material$;
/// See [RaylibTemp.MaterialMap$].
RaylibTempStructAllocator<MaterialMapD> get MaterialMap$ => Temp.MaterialMap$;
/// See [RaylibTemp.Matrix$].
RaylibTempStructAllocator<MatrixD> get Matrix$ => Temp.Matrix$;
/// See [RaylibTemp.Mesh$].
RaylibTempStructAllocator<MeshD> get Mesh$ => Temp.Mesh$;
/// See [RaylibTemp.Model$].
RaylibTempStructAllocator<ModelD> get Model$ => Temp.Model$;
/// See [RaylibTemp.ModelAnimation$].
RaylibTempStructAllocator<ModelAnimationD> get ModelAnimation$ => Temp.ModelAnimation$;
/// See [RaylibTemp.ModelSkeleton$].
RaylibTempStructAllocator<ModelSkeletonD> get ModelSkeleton$ => Temp.ModelSkeleton$;
/// See [RaylibTemp.Music$].
RaylibTempStructAllocator<MusicD> get Music$ => Temp.Music$;
/// See [RaylibTemp.NPatchInfo$].
RaylibTempStructAllocator<NPatchInfoD> get NPatchInfo$ => Temp.NPatchInfo$;
/// See [RaylibTemp.Quaternion$].
RaylibTempStructAllocator<QuaternionD> get Quaternion$ => Temp.Quaternion$;
/// See [RaylibTemp.Rectangle$].
RaylibTempStructAllocator<RectangleD> get Rectangle$ => Temp.Rectangle$;
/// See [RaylibTemp.RlDrawCall$].
RaylibTempStructAllocator<RlDrawCallD> get RlDrawCall$ => Temp.RlDrawCall$;
/// See [RaylibTemp.RlRenderBatch$].
RaylibTempStructAllocator<RlRenderBatchD> get RlRenderBatch$ => Temp.RlRenderBatch$;
/// See [RaylibTemp.RlVertexBuffer$].
RaylibTempStructAllocator<RlVertexBufferD> get RlVertexBuffer$ => Temp.RlVertexBuffer$;
/// See [RaylibTemp.Ray$].
RaylibTempStructAllocator<RayD> get Ray$ => Temp.Ray$;
/// See [RaylibTemp.RayCollision$].
RaylibTempStructAllocator<RayCollisionD> get RayCollision$ => Temp.RayCollision$;
/// See [RaylibTemp.RenderTexture$].
RaylibTempStructAllocator<RenderTextureD> get RenderTexture$ => Temp.RenderTexture$;
/// See [RaylibTemp.Shader$].
RaylibTempStructAllocator<ShaderD> get Shader$ => Temp.Shader$;
/// See [RaylibTemp.Sound$].
RaylibTempStructAllocator<SoundD> get Sound$ => Temp.Sound$;
/// See [RaylibTemp.Texture$].
RaylibTempStructAllocator<TextureD> get Texture$ => Temp.Texture$;
/// See [RaylibTemp.Transform$].
RaylibTempStructAllocator<TransformD> get Transform$ => Temp.Transform$;
/// See [RaylibTemp.Vector2$].
RaylibTempStructAllocator<Vector2D> get Vector2$ => Temp.Vector2$;
/// See [RaylibTemp.Vector3$].
RaylibTempStructAllocator<Vector3D> get Vector3$ => Temp.Vector3$;
/// See [RaylibTemp.Vector4$].
RaylibTempStructAllocator<Vector4D> get Vector4$ => Temp.Vector4$;
/// See [RaylibTemp.VrDeviceInfo$].
RaylibTempStructAllocator<VrDeviceInfoD> get VrDeviceInfo$ => Temp.VrDeviceInfo$;
/// See [RaylibTemp.VrStereoConfig$].
RaylibTempStructAllocator<VrStereoConfigD> get VrStereoConfig$ => Temp.VrStereoConfig$;
/// See [RaylibTemp.Wave$].
RaylibTempStructAllocator<WaveD> get Wave$ => Temp.Wave$;

/// See [RaylibTemp.MsfGifResult$].
RaylibTempStructAllocator<MsfGifResultD> get MsfGifResult$ => Temp.MsfGifResult$;
/// See [RaylibTemp.MsfGifState$].
RaylibTempStructAllocator<MsfGifStateD> get MsfGifState$ => Temp.MsfGifState$;

/// See [RaylibBase.rand].
double rand() => _rl.rand();

/// See [RaylibBase.randC].
double randC() => _rl.randC();

/// See [RaylibTempUtils.realloc].
MemoryPointer<RVoid> realloc(MemoryPointer oldPtr, int oldSize, int newSize)
  => Temp.Utils.realloc(oldPtr, oldSize, newSize);

/// See [RaylibTempUtils.memset].
void memset(MemoryPointer ptr, int value, int size)
  => Temp.Utils.memset(ptr, value, size);

/// See [RaylibTempUtils.memcpy].
void memcpy(MemoryPointer dest, MemoryPointer src, int n)
  => Temp.Utils.memcpy(dest, src, n);

/// See [RaylibTempUtils.memcmp].
int memcmp(MemoryPointer a, MemoryPointer b, int n)
  => Temp.Utils.memcmp(a, b, n);

/// See [RaylibTempUtils.strlen].
int strlen(MemoryPointer ptr)
  => Temp.Utils.strlen(ptr);

/// See [RaylibTempUtils.strnlen].
int strnlen(MemoryPointer ptr, int maxLen)
  => Temp.Utils.strnlen(ptr, maxLen);

/// See [RaylibTempUtils.strcmp].
int strcmp(MemoryPointer a, MemoryPointer b)
  => Temp.Utils.strcmp(a, b);

/// See [RaylibTempUtils.strcpy].
void strcpy(MemoryPointer dest, MemoryPointer src)
  => Temp.Utils.strcpy(dest, src);

/// See [RaylibTempUtils.strncpy].
void strncpy(MemoryPointer dest, MemoryPointer src, int n)
  => Temp.Utils.strncpy(dest, src, n);

/// See [RaylibTempUtils.strncat].
void strncat(MemoryPointer dest, MemoryPointer src, int n)
  => Temp.Utils.strncat(dest, src, n);

/// See [RaylibTempUtils.strstr].
MemoryPointer<RVoid> strstr(MemoryPointer haystack, MemoryPointer needle)
  => Temp.Utils.strstr(haystack, needle);