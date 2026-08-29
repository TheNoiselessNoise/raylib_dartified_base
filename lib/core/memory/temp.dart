part of '../raylib_dartified_base.dart';

class RaylibTempUtils {
  final RaylibTemp temp;

  RaylibTempUtils(this.temp);

  MemoryPointer<RVoid> realloc(MemoryPointer<RVoid> oldPtr, int oldSize, int newSize) {
    final newPtr = MemoryPointer.malloc<RVoid>(newSize);
    newPtr.copyBytesFrom(oldPtr, oldSize < newSize ? oldSize : newSize);
    oldPtr.free();
    return newPtr;
  }

  void memset(MemoryPointer<RVoid> ptr, int value, int size)
    => ptr.fillBytes(value, size);

  void memcpy(MemoryPointer<RVoid> dest, MemoryPointer<RVoid> src, int n)
    => dest.copyBytesFrom(src, n);

  int memcmp(MemoryPointer<RVoid> a, MemoryPointer<RVoid> b, int n)
    => a.compareBytes(b, n);

  int strlen(MemoryPointer<RVoid> ptr) {
    var i = 0;
    while (ptr.readUint8(i) != 0) i++;
    return i;
  }

  int strnlen(MemoryPointer<RVoid> ptr, int maxLen) {
    var i = 0;
    while (i < maxLen && ptr.readUint8(i) != 0) i++;
    return i;
  }

  int strcmp(MemoryPointer<RVoid> a, MemoryPointer<RVoid> b) {
    var i = 0;
    while (true) {
      final ca = a.readUint8(i), cb = b.readUint8(i);
      if (ca != cb) return ca - cb;
      if (ca == 0) return 0;
      i++;
    }
  }

  void strcpy(MemoryPointer<RVoid> dest, MemoryPointer<RVoid> src)
    => dest.copyBytesFrom(src, strlen(src) + 1); // include NUL

  void strncpy(MemoryPointer<RVoid> dest, MemoryPointer<RVoid> src, int n) {
    final srcLen = strlen(src);
    final copyLen = srcLen < n ? srcLen + 1 : n; // include NUL only if it fits
    dest.copyBytesFrom(src, copyLen);
    if (copyLen < n) dest.fillBytes(0, n - copyLen, copyLen); // pad rest with NUL
  }

  void strncat(MemoryPointer<RVoid> dest, MemoryPointer<RVoid> src, int n) {
    final destLen = strlen(dest);
    final copyLen = strlen(src).clamp(0, n);
    dest.copyBytesFrom(src, copyLen, destOffset: destLen);
    dest.offsetBy(destLen + copyLen).fillBytes(0, 1); // terminator
  }

  MemoryPointer<RVoid> strstr(MemoryPointer<RVoid> haystack, MemoryPointer<RVoid> needle) {
    final needleLen = strlen(needle);
    if (needleLen == 0) return haystack;
    var i = 0;
    while (haystack.readUint8(i) != 0) {
      var j = 0;
      while (j < needleLen && haystack.readUint8(i + j) == needle.readUint8(j)) j++;
      if (j == needleLen) return haystack.offsetBy(i);
      i++;
    }
    return MemoryPointer.nullptr;
  }
}

/// Root of the temporary allocator hierarchy for a given [RaylibBase] context.
///
/// Owns the set of typed allocators (e.g. [Int8$], [Float32$], struct allocators)
/// and governs the lifetime of all slots allocated.
/// 
/// All allocated slots are freed on [dispose].
final class RaylibTemp<R extends RaylibBase<R>> extends RaylibModule<R> {
  final RaylibTempOptions options;

  RaylibTemp(super.rl, {
    RaylibTempOptions? options
  }) : options = options ?? .new();

  /// Whether sync-back is currently enabled.
  bool _enableSyncing = true;

  /// Enables or disables struct sync-back after C calls. See [RaylibModule.disableSync].
  void enableSyncing(bool sync) => _enableSyncing = sync;

  /// Whether sync-back is currently enabled.
  bool get doSync => _enableSyncing;

  /// Monotonically increasing ID.
  int _currentId = 0;

  /// Returns a monotonically increasing ID, used to generate unique slot keys.
  int nextId() => _currentId++;

  /// If logging of slot deallocation events is enabled.
  bool _debugFreeEnabled = false;

  /// Enables or disables logging of slot deallocation events.
  void debugFree(bool v) => _debugFreeEnabled = v;

  /// Logs [message] if free debugging is enabled.
  void debugFreeInfo(String message) { if (_debugFreeEnabled) logInfo(message); }

  /// If logging of struct sync-back events is enabled.
  bool _debugSyncEnabled = false;

  /// Enables or disables logging of struct sync-back events.
  void debugSync(bool v) => _debugSyncEnabled = v;

  /// Logs [message] if sync debugging is enabled.
  void debugSyncInfo(String message) { if (_debugSyncEnabled) logInfo(message); }

  @override
  @mustCallSuper
  void load() {
    if (options.stringCount > 0) {
      logInfo('[TEMP] Allocating ${options.stringCount} String slots');
    }

    Utils = .new(this);

    _initSpecialAllocators();
    _initScalarAllocators();
    _initStructAllocators();
    _initOptionalStructAllocators();
  }

  late final RaylibTempUtils Utils;

  // special

  late final RaylibTempTypedDataListAllocator TypedDataList$;
  late final RaylibTempStringAllocator String$;

  void _initSpecialAllocators() {
    TypedDataList$ = .new(this);

    String$ = .new(this,
      byteSize: RChar.scalarByteSize,
      slotCount: options.stringCount,
      indexSetterFunc: (ptrptr, i, ptr) => ptrptr.writePtr(ptr, i),
    );
  }

  void _disposeSpecialAllocators() {
    String$.dispose();
  }

  // scalars

  late final RaylibTempScalarAllocator<bool ,RBool> Bool$;
  late final RaylibTempScalarIntAllocator<Int8List, RInt8> Int8$;
  late final RaylibTempScalarIntAllocator<Uint8List, RUint8> Uint8$;
  late final RaylibTempScalarIntAllocator<Int16List, RInt16> Int16$;
  late final RaylibTempScalarIntAllocator<Uint16List, RUint16> Uint16$;
  late final RaylibTempScalarIntAllocator<Int32List, RInt32> Int32$;
  late final RaylibTempScalarIntAllocator<Uint32List, RUint32> Uint32$;
  late final RaylibTempScalarIntAllocator<Int64List, RInt64> Int64$;
  late final RaylibTempScalarIntAllocator<Uint64List, RUint64> Uint64$;
  late final RaylibTempScalarFloatAllocator<Float32List, RFloat32> Float32$;
  late final RaylibTempScalarFloatAllocator<Float64List, RFloat64> Float64$;
  RaylibTempScalarIntAllocator<Int8List, RInt8> get Char$ => Int8$;
  RaylibTempScalarIntAllocator<Uint8List, RUint8> get UnsignedChar$ => Uint8$;
  RaylibTempScalarIntAllocator<Int16List, RInt16> get Short$ => Int16$;
  RaylibTempScalarIntAllocator<Uint16List, RUint16> get UnsignedShort$ => Uint16$;
  RaylibTempScalarIntAllocator<Int32List, RInt32> get Int$ => Int32$;
  RaylibTempScalarIntAllocator<Uint32List, RUint32> get UnsignedInt$ => Uint32$;
  RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float$ => Float32$;
  RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Double$ => Float64$;

  void _initScalarAllocators() {
    Bool$ = .new(this,
      byteSize: RBool.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value,
      scalarSetterFunc: (ptr, value) => ptr.value = value,
    );

    Int8$ = .new(this,
      byteSize: RInt8.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asInt8List(offset, len),
    );

    Uint8$ = .new(this,
      byteSize: RUint8.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asUint8List(offset, len),
    );

    Int16$ = .new(this,
      byteSize: RInt16.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asInt16List(offset, len),
    );

    Uint16$ = .new(this,
      byteSize: RUint16.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asUint16List(offset, len),
    );

    Int32$ = .new(this,
      byteSize: RInt32.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asInt32List(offset, len),
    );

    Uint32$ = .new(this,
      byteSize: RUint32.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asUint32List(offset, len),
    );

    Int64$ = .new(this,
      byteSize: RInt64.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asInt64List(offset, len),
    );

    Uint64$ = .new(this,
      byteSize: RUint64.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asUint64List(offset, len),
    );

    Float32$ = .new(this,
      byteSize: RFloat32.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toDouble(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toDouble(),
      fromList: (list) => .fromList(list.cast<double>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asFloat32List(offset, len),
    );

    Float64$ = .new(this,
      byteSize: RFloat64.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toDouble(),
      scalarSetterFunc: (ptr, value) => ptr.value = value.toDouble(),
      fromList: (list) => .fromList(list.cast<double>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asFloat64List(offset, len),
    );
  }

  void _disposeScalarAllocators() {
    Bool$.dispose();
    Int8$.dispose();
    Uint8$.dispose();
    Int16$.dispose();
    Uint16$.dispose();
    Int32$.dispose();
    Uint32$.dispose();
    Int64$.dispose();
    Uint64$.dispose();
    Float32$.dispose();
    Float64$.dispose();
  }

  // structs

  late final RaylibTempStructAllocator<AutomationEventListD, AutomationEventListField> AutomationEventList$;
  late final RaylibTempStructAllocator<AutomationEventD, AutomationEventField> AutomationEvent$;
  late final RaylibTempStructAllocator<AudioStreamD, AudioStreamField> AudioStream$;
  late final RaylibTempStructAllocator<BoneInfoD, BoneInfoField> BoneInfo$;
  late final RaylibTempStructAllocator<BoundingBoxD, BoundingBoxField> BoundingBox$;
  late final RaylibTempStructAllocator<Camera2DD, Camera2DField> Camera2D$;
  late final RaylibTempStructAllocator<Camera3DD, Camera3DField> Camera3D$;
  late final RaylibTempStructAllocator<ColorD, ColorField> Color$;
  late final RaylibTempStructAllocator<FilePathListD, FilePathListField> FilePathList$;
  late final RaylibTempStructAllocator<FontD, FontField> Font$;
  late final RaylibTempStructAllocator<GestureEventD, GestureEventField> GestureEvent$;
  late final RaylibTempStructAllocator<GlyphInfoD, GlyphInfoField> GlyphInfo$;
  late final RaylibTempStructAllocator<ImageD, ImageField> Image$;
  late final RaylibTempStructAllocator<LightD, LightField> Light$;
  late final RaylibTempStructAllocator<MaterialMapD, MaterialMapField> MaterialMap$;
  late final RaylibTempStructAllocator<MaterialD, MaterialField> Material$;
  late final RaylibTempStructAllocator<MatrixD, MatrixField> Matrix$;
  late final RaylibTempStructAllocator<MeshD, MeshField> Mesh$;
  late final RaylibTempStructAllocator<ModelAnimationD, ModelAnimationField> ModelAnimation$;
  late final RaylibTempStructAllocator<ModelSkeletonD, ModelSkeletonField> ModelSkeleton$;
  late final RaylibTempStructAllocator<ModelD, ModelField> Model$;
  late final RaylibTempStructAllocator<MusicD, MusicField> Music$;
  late final RaylibTempStructAllocator<NPatchInfoD, NPatchInfoField> NPatchInfo$;
  late final RaylibTempStructAllocator<QuaternionD, QuaternionField> Quaternion$;
  late final RaylibTempStructAllocator<RayCollisionD, RayCollisionField> RayCollision$;
  late final RaylibTempStructAllocator<RayD, RayField> Ray$;
  late final RaylibTempStructAllocator<RectangleD, RectangleField> Rectangle$;
  late final RaylibTempStructAllocator<RenderTextureD, RenderTextureField> RenderTexture$;
  late final RaylibTempStructAllocator<RlDrawCallD, RlDrawCallField> RlDrawCall$;
  late final RaylibTempStructAllocator<RlRenderBatchD, RlRenderBatchField> RlRenderBatch$;
  late final RaylibTempStructAllocator<RlVertexBufferD, RlVertexBufferField> RlVertexBuffer$;
  late final RaylibTempStructAllocator<ShaderD, ShaderField> Shader$;
  late final RaylibTempStructAllocator<SoundD, SoundField> Sound$;
  late final RaylibTempStructAllocator<TextureD, TextureField> Texture$;
  late final RaylibTempStructAllocator<TransformD, TransformField> Transform$;
  late final RaylibTempStructAllocator<Vector2D, Vector2Field> Vector2$;
  late final RaylibTempStructAllocator<Vector3D, Vector3Field> Vector3$;
  late final RaylibTempStructAllocator<Vector4D, Vector4Field> Vector4$;
  late final RaylibTempStructAllocator<VrDeviceInfoD, VrDeviceInfoField> VrDeviceInfo$;
  late final RaylibTempStructAllocator<VrStereoConfigD, VrStereoConfigField> VrStereoConfig$;
  late final RaylibTempStructAllocator<WaveD, WaveField> Wave$;

  void _initStructAllocators() {
    AutomationEventList$ = .new(this, layout: AutomationEventListD.structLayout, factory: AutomationEventListD.new, pointerFactory: AutomationEventListD.pointer);
    AutomationEvent$ = .new(this, layout: AutomationEventD.structLayout, factory: AutomationEventD.new, pointerFactory: AutomationEventD.pointer);
    AudioStream$ = .new(this, layout: AudioStreamD.structLayout, factory: AudioStreamD.new, pointerFactory: AudioStreamD.pointer);
    BoneInfo$ = .new(this, layout: BoneInfoD.structLayout, factory: BoneInfoD.new, pointerFactory: BoneInfoD.pointer);
    BoundingBox$ = .new(this, layout: BoundingBoxD.structLayout, factory: BoundingBoxD.new, pointerFactory: BoundingBoxD.pointer);
    Camera2D$ = .new(this, layout: Camera2DD.structLayout, factory: Camera2DD.new, pointerFactory: Camera2DD.pointer);
    Camera3D$ = .new(this, layout: Camera3DD.structLayout, factory: Camera3DD.new, pointerFactory: Camera3DD.pointer);
    Color$ = .new(this, layout: ColorD.structLayout, factory: ColorD.new, pointerFactory: ColorD.pointer);
    FilePathList$ = .new(this, layout: FilePathListD.structLayout, factory: FilePathListD.new, pointerFactory: FilePathListD.pointer);
    Font$ = .new(this, layout: FontD.structLayout, factory: FontD.new, pointerFactory: FontD.pointer);
    GestureEvent$ = .new(this, layout: GestureEventD.structLayout, factory: GestureEventD.new, pointerFactory: GestureEventD.pointer);
    GlyphInfo$ = .new(this, layout: GlyphInfoD.structLayout, factory: GlyphInfoD.new, pointerFactory: GlyphInfoD.pointer);
    Image$ = .new(this, layout: ImageD.structLayout, factory: ImageD.new, pointerFactory: ImageD.pointer);
    Light$ = .new(this, layout: LightD.structLayout, factory: LightD.new, pointerFactory: LightD.pointer);
    MaterialMap$ = .new(this, layout: MaterialMapD.structLayout, factory: MaterialMapD.new, pointerFactory: MaterialMapD.pointer);
    Material$ = .new(this, layout: MaterialD.structLayout, factory: MaterialD.new, pointerFactory: MaterialD.pointer);
    Matrix$ = .new(this, layout: MatrixD.structLayout, factory: MatrixD.new, pointerFactory: MatrixD.pointer);
    Mesh$ = .new(this, layout: MeshD.structLayout, factory: MeshD.new, pointerFactory: MeshD.pointer);
    ModelAnimation$ = .new(this, layout: ModelAnimationD.structLayout, factory: ModelAnimationD.new, pointerFactory: ModelAnimationD.pointer);
    ModelSkeleton$ = .new(this, layout: ModelSkeletonD.structLayout, factory: ModelSkeletonD.new, pointerFactory: ModelSkeletonD.pointer);
    Model$ = .new(this, layout: ModelD.structLayout, factory: ModelD.new, pointerFactory: ModelD.pointer);
    Music$ = .new(this, layout: MusicD.structLayout, factory: MusicD.new, pointerFactory: MusicD.pointer);
    NPatchInfo$ = .new(this, layout: NPatchInfoD.structLayout, factory: NPatchInfoD.new, pointerFactory: NPatchInfoD.pointer);
    Quaternion$ = .new(this, layout: QuaternionD.structLayout, factory: QuaternionD.new, pointerFactory: QuaternionD.pointer);
    RayCollision$ = .new(this, layout: RayCollisionD.structLayout, factory: RayCollisionD.new, pointerFactory: RayCollisionD.pointer);
    Ray$ = .new(this, layout: RayD.structLayout, factory: RayD.new, pointerFactory: RayD.pointer);
    Rectangle$ = .new(this, layout: RectangleD.structLayout, factory: RectangleD.new, pointerFactory: RectangleD.pointer);
    RenderTexture$ = .new(this, layout: RenderTextureD.structLayout, factory: RenderTextureD.new, pointerFactory: RenderTextureD.pointer);
    RlDrawCall$ = .new(this, layout: RlDrawCallD.structLayout, factory: RlDrawCallD.new, pointerFactory: RlDrawCallD.pointer);
    RlRenderBatch$ = .new(this, layout: RlRenderBatchD.structLayout, factory: RlRenderBatchD.new, pointerFactory: RlRenderBatchD.pointer);
    RlVertexBuffer$ = .new(this, layout: RlVertexBufferD.structLayout, factory: RlVertexBufferD.new, pointerFactory: RlVertexBufferD.pointer);
    Shader$ = .new(this, layout: ShaderD.structLayout, factory: ShaderD.new, pointerFactory: ShaderD.pointer);
    Sound$ = .new(this, layout: SoundD.structLayout, factory: SoundD.new, pointerFactory: SoundD.pointer);
    Texture$ = .new(this, layout: TextureD.structLayout, factory: TextureD.new, pointerFactory: TextureD.pointer);
    Transform$ = .new(this, layout: TransformD.structLayout, factory: TransformD.new, pointerFactory: TransformD.pointer);
    Vector2$ = .new(this, layout: Vector2D.structLayout, factory: Vector2D.new, pointerFactory: Vector2D.pointer);
    Vector3$ = .new(this, layout: Vector3D.structLayout, factory: Vector3D.new, pointerFactory: Vector3D.pointer);
    Vector4$ = .new(this, layout: Vector4D.structLayout, factory: Vector4D.new, pointerFactory: Vector4D.pointer);
    VrDeviceInfo$ = .new(this, layout: VrDeviceInfoD.structLayout, factory: VrDeviceInfoD.new, pointerFactory: VrDeviceInfoD.pointer);
    VrStereoConfig$ = .new(this, layout: VrStereoConfigD.structLayout, factory: VrStereoConfigD.new, pointerFactory: VrStereoConfigD.pointer);
    Wave$ = .new(this, layout: WaveD.structLayout, factory: WaveD.new, pointerFactory: WaveD.pointer);
  }

  void _disposeStructAllocators() {
    AutomationEventList$.dispose();
    AutomationEvent$.dispose();
    AudioStream$.dispose();
    BoneInfo$.dispose();
    BoundingBox$.dispose();
    Camera2D$.dispose();
    Camera3D$.dispose();
    Color$.dispose();
    FilePathList$.dispose();
    Font$.dispose();
    GestureEvent$.dispose();
    GlyphInfo$.dispose();
    Image$.dispose();
    Light$.dispose();
    Material$.dispose();
    MaterialMap$.dispose();
    Matrix$.dispose();
    Mesh$.dispose();
    Model$.dispose();
    ModelAnimation$.dispose();
    ModelSkeleton$.dispose();
    Music$.dispose();
    NPatchInfo$.dispose();
    Quaternion$.dispose();
    Rectangle$.dispose();
    RlDrawCall$.dispose();
    RlRenderBatch$.dispose();
    RlVertexBuffer$.dispose();
    Ray$.dispose();
    RayCollision$.dispose();
    RenderTexture$.dispose();
    Shader$.dispose();
    Sound$.dispose();
    Texture$.dispose();
    Transform$.dispose();
    Vector2$.dispose();
    Vector3$.dispose();
    Vector4$.dispose();
    VrDeviceInfo$.dispose();
    VrStereoConfig$.dispose();
    Wave$.dispose();
  }

  // optional structs

  late final RaylibTempStructAllocator<MsfGifResultD, MsfGifResultField> MsfGifResult$;
  late final RaylibTempStructAllocator<MsfGifStateD, MsfGifStateField> MsfGifState$;

  void _initOptionalStructAllocators() {
    MsfGifResult$ = .new(this, layout: MsfGifResultD.structLayout, factory: MsfGifResultD.new, pointerFactory: MsfGifResultD.pointer);
    MsfGifState$ = .new(this, layout: MsfGifStateD.structLayout, factory: MsfGifStateD.new, pointerFactory: MsfGifStateD.pointer);
  }

  void _disposeOptionalStructAllocators() {
    MsfGifResult$.dispose();
    MsfGifState$.dispose();
  }

  /// All user-registered allocators keyed by [Type], iterated during [dispose].
  final Map<Type, RaylibTempAllocator> customAllocators = {};

  /// Registers a allocator [alloc]. Throws [StateError] if [A] already exists.
  void registerAllocator<A extends RaylibTempAllocator>(A alloc) {
    if (customAllocators.containsKey(A)) {
      throw StateError("Allocator '${alloc.name}' ('$A') already exists!");
    }

    customAllocators[A] = alloc;
  }

  /// Returns the allocator registered under distinct type [A], or throws [StateError] if absent.
  A getAllocatorOrThrow<A extends RaylibTempAllocator>() {
    final alloc = customAllocators[A];
    if (alloc == null) throw StateError("No allocator registered for '$A'!");
    return alloc as A;
  }

  /// Returns the allocator registered under distinct type [A].
  A? alloc<A extends RaylibTempAllocator>() => customAllocators[A] as A?;

  /// Frees all allocators, then delegates to [RaylibModule.dispose].
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();

    debugFreeInfo('Freeing built-in allocators...');
    _disposeSpecialAllocators();
    _disposeScalarAllocators();
    _disposeStructAllocators();
    _disposeOptionalStructAllocators();

    if (customAllocators.isNotEmpty) {
      debugFreeInfo('Freeing ${customAllocators.length} allocators...');
      _disposeCustomAllocators();
    }
  }

  void _disposeCustomAllocators()
    => customAllocators.values.forEach((a) => a.dispose());
}