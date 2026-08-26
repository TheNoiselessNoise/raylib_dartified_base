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

  late final RaylibTempStructAllocator<AutomationEventListD> AutomationEventList$;
  late final RaylibTempStructAllocator<AutomationEventD> AutomationEvent$;
  late final RaylibTempStructAllocator<AudioStreamD> AudioStream$;
  late final RaylibTempStructAllocator<BoneInfoD> BoneInfo$;
  late final RaylibTempStructAllocator<BoundingBoxD> BoundingBox$;
  late final RaylibTempStructAllocator<Camera2DD> Camera2D$;
  late final RaylibTempStructAllocator<Camera3DD> Camera3D$;
  late final RaylibTempStructAllocator<ColorD> Color$;
  late final RaylibTempStructAllocator<FilePathListD> FilePathList$;
  late final RaylibTempStructAllocator<FontD> Font$;
  late final RaylibTempStructAllocator<GestureEventD> GestureEvent$;
  late final RaylibTempStructAllocator<GlyphInfoD> GlyphInfo$;
  late final RaylibTempStructAllocator<ImageD> Image$;
  late final RaylibTempStructAllocator<LightD> Light$;
  late final RaylibTempStructAllocator<MaterialMapD> MaterialMap$;
  late final RaylibTempStructAllocator<MaterialD> Material$;
  late final RaylibTempStructAllocator<MatrixD> Matrix$;
  late final RaylibTempStructAllocator<MeshD> Mesh$;
  late final RaylibTempStructAllocator<ModelAnimationD> ModelAnimation$;
  late final RaylibTempStructAllocator<ModelSkeletonD> ModelSkeleton$;
  late final RaylibTempStructAllocator<ModelD> Model$;
  late final RaylibTempStructAllocator<MusicD> Music$;
  late final RaylibTempStructAllocator<NPatchInfoD> NPatchInfo$;
  late final RaylibTempStructAllocator<QuaternionD> Quaternion$;
  late final RaylibTempStructAllocator<RayCollisionD> RayCollision$;
  late final RaylibTempStructAllocator<RayD> Ray$;
  late final RaylibTempStructAllocator<RectangleD> Rectangle$;
  late final RaylibTempStructAllocator<RenderTextureD> RenderTexture$;
  late final RaylibTempStructAllocator<RlDrawCallD> RlDrawCall$;
  late final RaylibTempStructAllocator<RlRenderBatchD> RlRenderBatch$;
  late final RaylibTempStructAllocator<RlVertexBufferD> RlVertexBuffer$;
  late final RaylibTempStructAllocator<ShaderD> Shader$;
  late final RaylibTempStructAllocator<SoundD> Sound$;
  late final RaylibTempStructAllocator<TextureD> Texture$;
  late final RaylibTempStructAllocator<TransformD> Transform$;
  late final RaylibTempStructAllocator<Vector2D> Vector2$;
  late final RaylibTempStructAllocator<Vector3D> Vector3$;
  late final RaylibTempStructAllocator<Vector4D> Vector4$;
  late final RaylibTempStructAllocator<VrDeviceInfoD> VrDeviceInfo$;
  late final RaylibTempStructAllocator<VrStereoConfigD> VrStereoConfig$;
  late final RaylibTempStructAllocator<WaveD> Wave$;

  void _initStructAllocators() {
    AutomationEventList$ = .new(this, byteSize: AutomationEventListD.byteSize, factory: AutomationEventListD.new, pointerFactory: AutomationEventListD.pointer);
    AutomationEvent$ = .new(this, byteSize: AutomationEventD.byteSize, factory: AutomationEventD.new, pointerFactory: AutomationEventD.pointer);
    AudioStream$ = .new(this, byteSize: AudioStreamD.byteSize, factory: AudioStreamD.new, pointerFactory: AudioStreamD.pointer);
    BoneInfo$ = .new(this, byteSize: BoneInfoD.byteSize, factory: BoneInfoD.new, pointerFactory: BoneInfoD.pointer);
    BoundingBox$ = .new(this, byteSize: BoundingBoxD.byteSize, factory: BoundingBoxD.new, pointerFactory: BoundingBoxD.pointer);
    Camera2D$ = .new(this, byteSize: Camera2DD.byteSize, factory: Camera2DD.new, pointerFactory: Camera2DD.pointer);
    Camera3D$ = .new(this, byteSize: Camera3DD.byteSize, factory: Camera3DD.new, pointerFactory: Camera3DD.pointer);
    Color$ = .new(this, byteSize: ColorD.byteSize, factory: ColorD.new, pointerFactory: ColorD.pointer);
    FilePathList$ = .new(this, byteSize: FilePathListD.byteSize, factory: FilePathListD.new, pointerFactory: FilePathListD.pointer);
    Font$ = .new(this, byteSize: FontD.byteSize, factory: FontD.new, pointerFactory: FontD.pointer);
    GestureEvent$ = .new(this, byteSize: GestureEventD.byteSize, factory: GestureEventD.new, pointerFactory: GestureEventD.pointer);
    GlyphInfo$ = .new(this, byteSize: GlyphInfoD.byteSize, factory: GlyphInfoD.new, pointerFactory: GlyphInfoD.pointer);
    Image$ = .new(this, byteSize: ImageD.byteSize, factory: ImageD.new, pointerFactory: ImageD.pointer);
    Light$ = .new(this, byteSize: LightD.byteSize, factory: LightD.new, pointerFactory: LightD.pointer);
    MaterialMap$ = .new(this, byteSize: MaterialMapD.byteSize, factory: MaterialMapD.new, pointerFactory: MaterialMapD.pointer);
    Material$ = .new(this, byteSize: MaterialD.byteSize, factory: MaterialD.new, pointerFactory: MaterialD.pointer);
    Matrix$ = .new(this, byteSize: MatrixD.byteSize, factory: MatrixD.new, pointerFactory: MatrixD.pointer);
    Mesh$ = .new(this, byteSize: MeshD.byteSize, factory: MeshD.new, pointerFactory: MeshD.pointer);
    ModelAnimation$ = .new(this, byteSize: ModelAnimationD.byteSize, factory: ModelAnimationD.new, pointerFactory: ModelAnimationD.pointer);
    ModelSkeleton$ = .new(this, byteSize: ModelSkeletonD.byteSize, factory: ModelSkeletonD.new, pointerFactory: ModelSkeletonD.pointer);
    Model$ = .new(this, byteSize: ModelD.byteSize, factory: ModelD.new, pointerFactory: ModelD.pointer);
    Music$ = .new(this, byteSize: MusicD.byteSize, factory: MusicD.new, pointerFactory: MusicD.pointer);
    NPatchInfo$ = .new(this, byteSize: NPatchInfoD.byteSize, factory: NPatchInfoD.new, pointerFactory: NPatchInfoD.pointer);
    Quaternion$ = .new(this, byteSize: QuaternionD.byteSize, factory: QuaternionD.new, pointerFactory: QuaternionD.pointer);
    RayCollision$ = .new(this, byteSize: RayCollisionD.byteSize, factory: RayCollisionD.new, pointerFactory: RayCollisionD.pointer);
    Ray$ = .new(this, byteSize: RayD.byteSize, factory: RayD.new, pointerFactory: RayD.pointer);
    Rectangle$ = .new(this, byteSize: RectangleD.byteSize, factory: RectangleD.new, pointerFactory: RectangleD.pointer);
    RenderTexture$ = .new(this, byteSize: RenderTextureD.byteSize, factory: RenderTextureD.new, pointerFactory: RenderTextureD.pointer);
    RlDrawCall$ = .new(this, byteSize: RlDrawCallD.byteSize, factory: RlDrawCallD.new, pointerFactory: RlDrawCallD.pointer);
    RlRenderBatch$ = .new(this, byteSize: RlRenderBatchD.byteSize, factory: RlRenderBatchD.new, pointerFactory: RlRenderBatchD.pointer);
    RlVertexBuffer$ = .new(this, byteSize: RlVertexBufferD.byteSize, factory: RlVertexBufferD.new, pointerFactory: RlVertexBufferD.pointer);
    Shader$ = .new(this, byteSize: ShaderD.byteSize, factory: ShaderD.new, pointerFactory: ShaderD.pointer);
    Sound$ = .new(this, byteSize: SoundD.byteSize, factory: SoundD.new, pointerFactory: SoundD.pointer);
    Texture$ = .new(this, byteSize: TextureD.byteSize, factory: TextureD.new, pointerFactory: TextureD.pointer);
    Transform$ = .new(this, byteSize: TransformD.byteSize, factory: TransformD.new, pointerFactory: TransformD.pointer);
    Vector2$ = .new(this, byteSize: Vector2D.byteSize, factory: Vector2D.new, pointerFactory: Vector2D.pointer);
    Vector3$ = .new(this, byteSize: Vector3D.byteSize, factory: Vector3D.new, pointerFactory: Vector3D.pointer);
    Vector4$ = .new(this, byteSize: Vector4D.byteSize, factory: Vector4D.new, pointerFactory: Vector4D.pointer);
    VrDeviceInfo$ = .new(this, byteSize: VrDeviceInfoD.byteSize, factory: VrDeviceInfoD.new, pointerFactory: VrDeviceInfoD.pointer);
    VrStereoConfig$ = .new(this, byteSize: VrStereoConfigD.byteSize, factory: VrStereoConfigD.new, pointerFactory: VrStereoConfigD.pointer);
    Wave$ = .new(this, byteSize: WaveD.byteSize, factory: WaveD.new, pointerFactory: WaveD.pointer);
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

  late final RaylibTempStructAllocator<MsfGifResultD> MsfGifResult$;
  late final RaylibTempStructAllocator<MsfGifStateD> MsfGifState$;

  void _initOptionalStructAllocators() {
    MsfGifResult$ = .new(this, byteSize: MsfGifResultD.byteSize, factory: MsfGifResultD.new, pointerFactory: MsfGifResultD.pointer);
    MsfGifState$ = .new(this, byteSize: MsfGifStateD.byteSize, factory: MsfGifStateD.new, pointerFactory: MsfGifStateD.pointer);
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