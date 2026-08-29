export 'core/modules/core/abbr_consts.dart';
export 'core/modules/gui/abbr_consts.dart';
export 'core/modules/light/abbr_consts.dart';
export 'core/modules/rlgl/abbr_consts.dart';
import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibBase get _rl => RaylibBase.instance;

void disposeRaylib() => _rl.dispose();

void CloseWindowAndDispose() => _rl.CloseWindowAndDispose();

RaylibTemp get Temp => _rl.Temp;

RaylibTempTypedDataListAllocator get TypedDataList$ => Temp.TypedDataList$;

RaylibTempStringAllocator get String$ => Temp.String$;

RaylibTempScalarAllocator<bool, RBool> get Bool$ => Temp.Bool$;
RaylibTempScalarIntAllocator<Int8List, RInt8> get Int8$ => Temp.Int8$;
RaylibTempScalarIntAllocator<Uint8List, RUint8> get Uint8$ => Temp.Uint8$;
RaylibTempScalarIntAllocator<Int16List, RInt16> get Int16$ => Temp.Int16$;
RaylibTempScalarIntAllocator<Uint16List, RUint16> get Uint16$ => Temp.Uint16$;
RaylibTempScalarIntAllocator<Int32List, RInt32> get Int32$ => Temp.Int32$;
RaylibTempScalarIntAllocator<Uint32List, RUint32> get Uint32$ => Temp.Uint32$;
RaylibTempScalarIntAllocator<Int64List, RInt64> get Int64$ => Temp.Int64$;
RaylibTempScalarIntAllocator<Uint64List, RUint64> get Uint64$ => Temp.Uint64$;
RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float32$ => Temp.Float32$;
RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Float64$ => Temp.Float64$;
RaylibTempScalarIntAllocator<Int8List, RInt8> get Char$ => Temp.Char$;
RaylibTempScalarIntAllocator<Uint8List, RUint8> get UnsignedChar$ => Temp.UnsignedChar$;
RaylibTempScalarIntAllocator<Int16List, RInt16> get Short$ => Temp.Short$;
RaylibTempScalarIntAllocator<Uint16List, RUint16> get UnsignedShort$ => Temp.UnsignedShort$;
RaylibTempScalarIntAllocator<Int32List, RInt32> get Int$ => Temp.Int$;
RaylibTempScalarIntAllocator<Uint32List, RUint32> get UnsignedInt$ => Temp.UnsignedInt$;
RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float$ => Temp.Float$;
RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Double$ => Temp.Double$;

RaylibTempStructAllocator<AutomationEventListD, AutomationEventListField> get AutomationEventList$ => Temp.AutomationEventList$;
RaylibTempStructAllocator<AutomationEventD, AutomationEventField> get AutomationEvent$ => Temp.AutomationEvent$;
RaylibTempStructAllocator<AudioStreamD, AudioStreamField> get AudioStream$ => Temp.AudioStream$;
RaylibTempStructAllocator<BoneInfoD, BoneInfoField> get BoneInfo$ => Temp.BoneInfo$;
RaylibTempStructAllocator<BoundingBoxD, BoundingBoxField> get BoundingBox$ => Temp.BoundingBox$;
RaylibTempStructAllocator<Camera2DD, Camera2DField> get Camera2D$ => Temp.Camera2D$;
RaylibTempStructAllocator<Camera3DD, Camera3DField> get Camera3D$ => Temp.Camera3D$;
RaylibTempStructAllocator<ColorD, ColorField> get Color$ => Temp.Color$;
RaylibTempStructAllocator<FilePathListD, FilePathListField> get FilePathList$ => Temp.FilePathList$;
RaylibTempStructAllocator<FontD, FontField> get Font$ => Temp.Font$;
RaylibTempStructAllocator<GestureEventD, GestureEventField> get GestureEvent$ => Temp.GestureEvent$;
RaylibTempStructAllocator<GlyphInfoD, GlyphInfoField> get GlyphInfo$ => Temp.GlyphInfo$;
RaylibTempStructAllocator<ImageD, ImageField> get Image$ => Temp.Image$;
RaylibTempStructAllocator<LightD, LightField> get Light$ => Temp.Light$;
RaylibTempStructAllocator<MaterialD, MaterialField> get Material$ => Temp.Material$;
RaylibTempStructAllocator<MaterialMapD, MaterialMapField> get MaterialMap$ => Temp.MaterialMap$;
RaylibTempStructAllocator<MatrixD, MatrixField> get Matrix$ => Temp.Matrix$;
RaylibTempStructAllocator<MeshD, MeshField> get Mesh$ => Temp.Mesh$;
RaylibTempStructAllocator<ModelD, ModelField> get Model$ => Temp.Model$;
RaylibTempStructAllocator<ModelAnimationD, ModelAnimationField> get ModelAnimation$ => Temp.ModelAnimation$;
RaylibTempStructAllocator<ModelSkeletonD, ModelSkeletonField> get ModelSkeleton$ => Temp.ModelSkeleton$;
RaylibTempStructAllocator<MusicD, MusicField> get Music$ => Temp.Music$;
RaylibTempStructAllocator<NPatchInfoD, NPatchInfoField> get NPatchInfo$ => Temp.NPatchInfo$;
RaylibTempStructAllocator<QuaternionD, QuaternionField> get Quaternion$ => Temp.Quaternion$;
RaylibTempStructAllocator<RectangleD, RectangleField> get Rectangle$ => Temp.Rectangle$;
RaylibTempStructAllocator<RlDrawCallD, RlDrawCallField> get RlDrawCall$ => Temp.RlDrawCall$;
RaylibTempStructAllocator<RlRenderBatchD, RlRenderBatchField> get RlRenderBatch$ => Temp.RlRenderBatch$;
RaylibTempStructAllocator<RlVertexBufferD, RlVertexBufferField> get RlVertexBuffer$ => Temp.RlVertexBuffer$;
RaylibTempStructAllocator<RayD, RayField> get Ray$ => Temp.Ray$;
RaylibTempStructAllocator<RayCollisionD, RayCollisionField> get RayCollision$ => Temp.RayCollision$;
RaylibTempStructAllocator<RenderTextureD, RenderTextureField> get RenderTexture$ => Temp.RenderTexture$;
RaylibTempStructAllocator<ShaderD, ShaderField> get Shader$ => Temp.Shader$;
RaylibTempStructAllocator<SoundD, SoundField> get Sound$ => Temp.Sound$;
RaylibTempStructAllocator<TextureD, TextureField> get Texture$ => Temp.Texture$;
RaylibTempStructAllocator<TransformD, TransformField> get Transform$ => Temp.Transform$;
RaylibTempStructAllocator<Vector2D, Vector2Field> get Vector2$ => Temp.Vector2$;
RaylibTempStructAllocator<Vector3D, Vector3Field> get Vector3$ => Temp.Vector3$;
RaylibTempStructAllocator<Vector4D, Vector4Field> get Vector4$ => Temp.Vector4$;
RaylibTempStructAllocator<VrDeviceInfoD, VrDeviceInfoField> get VrDeviceInfo$ => Temp.VrDeviceInfo$;
RaylibTempStructAllocator<VrStereoConfigD, VrStereoConfigField> get VrStereoConfig$ => Temp.VrStereoConfig$;
RaylibTempStructAllocator<WaveD, WaveField> get Wave$ => Temp.Wave$;

RaylibTempStructAllocator<MsfGifResultD, MsfGifResultField> get MsfGifResult$ => Temp.MsfGifResult$;
RaylibTempStructAllocator<MsfGifStateD, MsfGifStateField> get MsfGifState$ => Temp.MsfGifState$;

double rand() => _rl.rand();

double randC() => _rl.randC();

MemoryPointer<RVoid> realloc(MemoryPointer<RVoid> oldPtr, int oldSize, int newSize)
  => Temp.Utils.realloc(oldPtr, oldSize, newSize);

void memset(MemoryPointer<RVoid> ptr, int value, int size)
  => Temp.Utils.memset(ptr, value, size);

void memcpy(MemoryPointer<RVoid> dest, MemoryPointer<RVoid> src, int n)
  => Temp.Utils.memcpy(dest, src, n);

int memcmp(MemoryPointer<RVoid> a, MemoryPointer<RVoid> b, int n)
  => Temp.Utils.memcmp(a, b, n);

int strlen(MemoryPointer<RVoid> ptr)
  => Temp.Utils.strlen(ptr);

int strnlen(MemoryPointer<RVoid> ptr, int maxLen)
  => Temp.Utils.strnlen(ptr, maxLen);

int strcmp(MemoryPointer<RVoid> a, MemoryPointer<RVoid> b)
  => Temp.Utils.strcmp(a, b);

void strcpy(MemoryPointer<RVoid> dest, MemoryPointer<RVoid> src)
  => Temp.Utils.strcpy(dest, src);

void strncpy(MemoryPointer<RVoid> dest, MemoryPointer<RVoid> src, int n)
  => Temp.Utils.strncpy(dest, src, n);

void strncat(MemoryPointer<RVoid> dest, MemoryPointer<RVoid> src, int n)
  => Temp.Utils.strncat(dest, src, n);

MemoryPointer<RVoid> strstr(MemoryPointer<RVoid> haystack, MemoryPointer<RVoid> needle)
  => Temp.Utils.strstr(haystack, needle);