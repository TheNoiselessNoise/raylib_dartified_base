import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

// Exports everything that can be shared across Dart and Flat layers.

RaylibBase get _rl => RaylibBase.instance;

/// See [RaylibBase.Temp].
RaylibTemp get $ => _rl.$;

/// See [RaylibTemp.TypedDataList$].
RaylibTempTypedDataListAllocator get TypedDataList$ => $.TypedDataList$;
/// See [RaylibTemp.String$].
RaylibTempStringAllocator get String$ => $.String$;
/// See [RaylibTemp.Bool$].
RaylibTempScalarAllocator<bool, RBool> get Bool$ => $.Bool$;
/// See [RaylibTemp.Int8$].
RaylibTempScalarIntAllocator<Int8List, RInt8> get Int8$ => $.Int8$;
/// See [RaylibTemp.Uint8$].
RaylibTempScalarIntAllocator<Uint8List, RUint8> get Uint8$ => $.Uint8$;
/// See [RaylibTemp.Int16$].
RaylibTempScalarIntAllocator<Int16List, RInt16> get Int16$ => $.Int16$;
/// See [RaylibTemp.Uint16$].
RaylibTempScalarIntAllocator<Uint16List, RUint16> get Uint16$ => $.Uint16$;
/// See [RaylibTemp.Int32$].
RaylibTempScalarIntAllocator<Int32List, RInt32> get Int32$ => $.Int32$;
/// See [RaylibTemp.Uint32$].
RaylibTempScalarIntAllocator<Uint32List, RUint32> get Uint32$ => $.Uint32$;
/// See [RaylibTemp.Int64$].
RaylibTempScalarIntAllocator<Int64List, RInt64> get Int64$ => $.Int64$;
/// See [RaylibTemp.Uint64$].
RaylibTempScalarIntAllocator<Uint64List, RUint64> get Uint64$ => $.Uint64$;
/// See [RaylibTemp.Float32$].
RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float32$ => $.Float32$;
/// See [RaylibTemp.Float64$].
RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Float64$ => $.Float64$;
/// See [RaylibTemp.Char$].
RaylibTempScalarIntAllocator<Int8List, RInt8> get Char$ => $.Char$;
/// See [RaylibTemp.UnsignedChar$].
RaylibTempScalarIntAllocator<Uint8List, RUint8> get UnsignedChar$ => $.UnsignedChar$;
/// See [RaylibTemp.Short$].
RaylibTempScalarIntAllocator<Int16List, RInt16> get Short$ => $.Short$;
/// See [RaylibTemp.UnsignedShort$].
RaylibTempScalarIntAllocator<Uint16List, RUint16> get UnsignedShort$ => $.UnsignedShort$;
/// See [RaylibTemp.Int$].
RaylibTempScalarIntAllocator<Int32List, RInt32> get Int$ => $.Int$;
/// See [RaylibTemp.UnsignedInt$].
RaylibTempScalarIntAllocator<Uint32List, RUint32> get UnsignedInt$ => $.UnsignedInt$;
/// See [RaylibTemp.Float$].
RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float$ => $.Float$;
/// See [RaylibTemp.Double$].
RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Double$ => $.Double$;

/// See [RaylibTemp.float3$].
RaylibTempStructAllocator<float3D> get float3$ => $.float3$;
/// See [RaylibTemp.float16$].
RaylibTempStructAllocator<float16D> get float16$ => $.float16$;

/// See [RaylibTemp.AutomationEventList$].
RaylibTempStructAllocator<AutomationEventListD> get AutomationEventList$ => $.AutomationEventList$;
/// See [RaylibTemp.AutomationEvent$].
RaylibTempStructAllocator<AutomationEventD> get AutomationEvent$ => $.AutomationEvent$;
/// See [RaylibTemp.AudioStream$].
RaylibTempStructAllocator<AudioStreamD> get AudioStream$ => $.AudioStream$;
/// See [RaylibTemp.BoneInfo$].
RaylibTempStructAllocator<BoneInfoD> get BoneInfo$ => $.BoneInfo$;
/// See [RaylibTemp.BoundingBox$].
RaylibTempStructAllocator<BoundingBoxD> get BoundingBox$ => $.BoundingBox$;
/// See [RaylibTemp.Camera2D$].
RaylibTempStructAllocator<Camera2DD> get Camera2D$ => $.Camera2D$;
/// See [RaylibTemp.Camera3D$].
RaylibTempStructAllocator<Camera3DD> get Camera3D$ => $.Camera3D$;
/// See [RaylibTemp.Color$].
RaylibTempStructAllocator<ColorD> get Color$ => $.Color$;
/// See [RaylibTemp.FilePathList$].
RaylibTempStructAllocator<FilePathListD> get FilePathList$ => $.FilePathList$;
/// See [RaylibTemp.Font$].
RaylibTempStructAllocator<FontD> get Font$ => $.Font$;
/// See [RaylibTemp.GestureEvent$].
RaylibTempStructAllocator<GestureEventD> get GestureEvent$ => $.GestureEvent$;
/// See [RaylibTemp.GlyphInfo$].
RaylibTempStructAllocator<GlyphInfoD> get GlyphInfo$ => $.GlyphInfo$;
/// See [RaylibTemp.Image$].
RaylibTempStructAllocator<ImageD> get Image$ => $.Image$;
/// See [RaylibTemp.Light$].
RaylibTempStructAllocator<LightD> get Light$ => $.Light$;
/// See [RaylibTemp.Material$].
RaylibTempStructAllocator<MaterialD> get Material$ => $.Material$;
/// See [RaylibTemp.MaterialMap$].
RaylibTempStructAllocator<MaterialMapD> get MaterialMap$ => $.MaterialMap$;
/// See [RaylibTemp.Matrix$].
RaylibTempStructAllocator<MatrixD> get Matrix$ => $.Matrix$;
/// See [RaylibTemp.Mesh$].
RaylibTempStructAllocator<MeshD> get Mesh$ => $.Mesh$;
/// See [RaylibTemp.Model$].
RaylibTempStructAllocator<ModelD> get Model$ => $.Model$;
/// See [RaylibTemp.ModelAnimation$].
RaylibTempStructAllocator<ModelAnimationD> get ModelAnimation$ => $.ModelAnimation$;
/// See [RaylibTemp.ModelSkeleton$].
RaylibTempStructAllocator<ModelSkeletonD> get ModelSkeleton$ => $.ModelSkeleton$;
/// See [RaylibTemp.Music$].
RaylibTempStructAllocator<MusicD> get Music$ => $.Music$;
/// See [RaylibTemp.NPatchInfo$].
RaylibTempStructAllocator<NPatchInfoD> get NPatchInfo$ => $.NPatchInfo$;
/// See [RaylibTemp.Quaternion$].
RaylibTempStructAllocator<QuaternionD> get Quaternion$ => $.Quaternion$;
/// See [RaylibTemp.Rectangle$].
RaylibTempStructAllocator<RectangleD> get Rectangle$ => $.Rectangle$;
/// See [RaylibTemp.RlDrawCall$].
RaylibTempStructAllocator<RlDrawCallD> get RlDrawCall$ => $.RlDrawCall$;
/// See [RaylibTemp.RlRenderBatch$].
RaylibTempStructAllocator<RlRenderBatchD> get RlRenderBatch$ => $.RlRenderBatch$;
/// See [RaylibTemp.RlVertexBuffer$].
RaylibTempStructAllocator<RlVertexBufferD> get RlVertexBuffer$ => $.RlVertexBuffer$;
/// See [RaylibTemp.Ray$].
RaylibTempStructAllocator<RayD> get Ray$ => $.Ray$;
/// See [RaylibTemp.RayCollision$].
RaylibTempStructAllocator<RayCollisionD> get RayCollision$ => $.RayCollision$;
/// See [RaylibTemp.RenderTexture$].
RaylibTempStructAllocator<RenderTextureD> get RenderTexture$ => $.RenderTexture$;
/// See [RaylibTemp.Shader$].
RaylibTempStructAllocator<ShaderD> get Shader$ => $.Shader$;
/// See [RaylibTemp.Sound$].
RaylibTempStructAllocator<SoundD> get Sound$ => $.Sound$;
/// See [RaylibTemp.Texture$].
RaylibTempStructAllocator<TextureD> get Texture$ => $.Texture$;
/// See [RaylibTemp.Transform$].
RaylibTempStructAllocator<TransformD> get Transform$ => $.Transform$;
/// See [RaylibTemp.Vector2$].
RaylibTempStructAllocator<Vector2D> get Vector2$ => $.Vector2$;
/// See [RaylibTemp.Vector3$].
RaylibTempStructAllocator<Vector3D> get Vector3$ => $.Vector3$;
/// See [RaylibTemp.Vector4$].
RaylibTempStructAllocator<Vector4D> get Vector4$ => $.Vector4$;
/// See [RaylibTemp.VrDeviceInfo$].
RaylibTempStructAllocator<VrDeviceInfoD> get VrDeviceInfo$ => $.VrDeviceInfo$;
/// See [RaylibTemp.VrStereoConfig$].
RaylibTempStructAllocator<VrStereoConfigD> get VrStereoConfig$ => $.VrStereoConfig$;
/// See [RaylibTemp.Wave$].
RaylibTempStructAllocator<WaveD> get Wave$ => $.Wave$;

/// See [RaylibTemp.MsfGifResult$].
RaylibTempStructAllocator<MsfGifResultD> get MsfGifResult$ => $.MsfGifResult$;
/// See [RaylibTemp.MsfGifState$].
RaylibTempStructAllocator<MsfGifStateD> get MsfGifState$ => $.MsfGifState$;

/// See [RaylibBase.rand].
double rand() => _rl.rand();

/// See [RaylibBase.randC].
double randC() => _rl.randC();

/// See [RaylibTempUtils.realloc].
MemoryPointer<RVoid> realloc(MemoryPointer oldPtr, int oldSize, int newSize)
  => $.Utils.realloc(oldPtr, oldSize, newSize);

/// See [RaylibTempUtils.memset].
void memset(MemoryPointer ptr, int value, int size)
  => $.Utils.memset(ptr, value, size);

/// See [RaylibTempUtils.memcpy].
void memcpy(MemoryPointer dest, MemoryPointer src, int n)
  => $.Utils.memcpy(dest, src, n);

/// See [RaylibTempUtils.memcmp].
int memcmp(MemoryPointer a, MemoryPointer b, int n)
  => $.Utils.memcmp(a, b, n);

/// See [RaylibTempUtils.strlen].
int strlen(MemoryPointer ptr)
  => $.Utils.strlen(ptr);

/// See [RaylibTempUtils.strnlen].
int strnlen(MemoryPointer ptr, int maxLen)
  => $.Utils.strnlen(ptr, maxLen);

/// See [RaylibTempUtils.strcmp].
int strcmp(MemoryPointer a, MemoryPointer b)
  => $.Utils.strcmp(a, b);

/// See [RaylibTempUtils.strcpy].
void strcpy(MemoryPointer dest, MemoryPointer src)
  => $.Utils.strcpy(dest, src);

/// See [RaylibTempUtils.strncpy].
void strncpy(MemoryPointer dest, MemoryPointer src, int n)
  => $.Utils.strncpy(dest, src, n);

/// See [RaylibTempUtils.strncat].
void strncat(MemoryPointer dest, MemoryPointer src, int n)
  => $.Utils.strncat(dest, src, n);

/// See [RaylibTempUtils.strstr].
MemoryPointer<RVoid> strstr(MemoryPointer haystack, MemoryPointer needle)
  => $.Utils.strstr(haystack, needle);

extension StringToRaylibC on String {
  MemoryPointer<RChar> get toC => $.String$.Value(this);
}

ColorD get LIGHTGRAY => .LIGHTGRAY;
ColorD get GRAY => .GRAY;
ColorD get DARKGRAY => .DARKGRAY;
ColorD get YELLOW => .YELLOW;
ColorD get GOLD => .GOLD;
ColorD get ORANGE => .ORANGE;
ColorD get PINK => .PINK;
ColorD get RED => .RED;
ColorD get MAROON => .MAROON;
ColorD get GREEN => .GREEN;
ColorD get LIME => .LIME;
ColorD get DARKGREEN => .DARKGREEN;
ColorD get SKYBLUE => .SKYBLUE;
ColorD get BLUE => .BLUE;
ColorD get DARKBLUE => .DARKBLUE;
ColorD get PURPLE => .PURPLE;
ColorD get VIOLET => .VIOLET;
ColorD get DARKPURPLE => .DARKPURPLE;
ColorD get BEIGE => .BEIGE;
ColorD get BROWN => .BROWN;
ColorD get DARKBROWN => .DARKBROWN;
ColorD get WHITE => .WHITE;
ColorD get BLACK => .BLACK;
ColorD get BLANK => .BLANK;
ColorD get MAGENTA => .MAGENTA;
ColorD get RAYWHITE => .RAYWHITE;
ColorD get TRANSPARENT => .TRANSPARENT;