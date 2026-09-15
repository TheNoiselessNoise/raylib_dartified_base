part of '../raylib_dartified_base.dart';

class RaylibTempUtils {
  final RaylibTemp temp;

  RaylibTempUtils(this.temp);

  MemoryPointer<RVoid> realloc(MemoryPointer oldPtr, int oldSize, int newSize) {
    final newPtr = MemoryPointer.malloc<RVoid>(newSize);
    newPtr.copyBytesFrom(oldPtr, oldSize < newSize ? oldSize : newSize);
    oldPtr.free();
    return newPtr;
  }

  void memset(MemoryPointer ptr, int value, int size)
    => ptr.fillBytes(value, size);

  void memcpy(MemoryPointer dest, MemoryPointer src, int n)
    => dest.copyBytesFrom(src, n);

  int memcmp(MemoryPointer a, MemoryPointer b, int n)
    => a.compareBytes(b, n);

  int strlen(MemoryPointer ptr) {
    var i = 0;
    while (ptr.readUint8(i) != 0) i++;
    return i;
  }

  int strnlen(MemoryPointer ptr, int maxLen) {
    var i = 0;
    while (i < maxLen && ptr.readUint8(i) != 0) i++;
    return i;
  }

  int strcmp(MemoryPointer a, MemoryPointer b) {
    var i = 0;
    while (true) {
      final ca = a.readUint8(i), cb = b.readUint8(i);
      if (ca != cb) return ca - cb;
      if (ca == 0) return 0;
      i++;
    }
  }

  void strcpy(MemoryPointer dest, MemoryPointer src)
    => dest.copyBytesFrom(src, strlen(src) + 1); // include NUL

  void strncpy(MemoryPointer dest, MemoryPointer src, int n) {
    final srcLen = strlen(src);
    final copyLen = srcLen < n ? srcLen + 1 : n; // include NUL only if it fits
    dest.copyBytesFrom(src, copyLen);
    if (copyLen < n) dest.fillBytes(0, n - copyLen, copyLen); // pad rest with NUL
  }

  void strncat(MemoryPointer dest, MemoryPointer src, int n) {
    final destLen = strlen(dest);
    final copyLen = strlen(src).clamp(0, n);
    dest.copyBytesFrom(src, copyLen, destOffset: destLen);
    dest.offsetBy(destLen + copyLen).fillBytes(0, 1); // terminator
  }

  MemoryPointer<RVoid> strstr(MemoryPointer haystack, MemoryPointer needle) {
    final needleLen = strlen(needle);
    if (needleLen == 0) return haystack.cast();
    var i = 0;
    while (haystack.readUint8(i) != 0) {
      var j = 0;
      while (j < needleLen && haystack.readUint8(i + j) == needle.readUint8(j)) j++;
      if (j == needleLen) return haystack.offsetBy(i);
      i++;
    }
    return MemoryPointer.nullptr();
  }
}

/// Root of the temporary allocator hierarchy for a given [RaylibBase] context.
///
/// Owns the set of typed allocators (e.g. [Int8$], [Float32$], struct allocators)
/// and governs the lifetime of all slots allocated.
/// 
/// All allocated slots are freed on [dispose].
final class RaylibTemp<R extends RaylibBase> extends RaylibModule {
  RaylibTemp(super.rl);

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
    if (RaylibConfig.tempStringSlots > 0) {
      logInfo('[TEMP] Allocating ${RaylibConfig.tempStringSlots} String slots');
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

  late final RaylibTempAllocator<RPointer> _pointerAllocator;

  void _initSpecialAllocators() {
    TypedDataList$ = .new(this);

    String$ = .new(this,
      byteSize: RChar.scalarByteSize,
      slotCount: RaylibConfig.tempStringSlots,
    );
  }

  // scalars

  late final RaylibTempScalarAllocator<bool, RBool> Bool$;
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
  RaylibTempScalarIntAllocator<Int8List, RChar> get Char$ => Int8$;
  RaylibTempScalarIntAllocator<Uint8List, RUnsignedChar> get UnsignedChar$ => Uint8$;
  RaylibTempScalarIntAllocator<Int16List, RShort> get Short$ => Int16$;
  RaylibTempScalarIntAllocator<Uint16List, RUnsignedShort> get UnsignedShort$ => Uint16$;
  RaylibTempScalarIntAllocator<Int32List, RInt> get Int$ => Int32$;
  RaylibTempScalarIntAllocator<Uint32List, RUnsignedInt> get UnsignedInt$ => Uint32$;
  RaylibTempScalarFloatAllocator<Float32List, RFloat> get Float$ => Float32$;
  RaylibTempScalarFloatAllocator<Float64List, RDouble> get Double$ => Float64$;

  final Map<Type, RaylibTempScalarAllocator> _builtInScalarAllocators = {};
  A _bScalar<X extends RType, A extends RaylibTempScalarAllocator>(A allocator)
    => _builtInScalarAllocators[X] = allocator;

  void _initScalarAllocators() {
    Bool$ = _bScalar(.new(this,
      byteSize: RBool.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value,
    ));

    Int8$ = _bScalar(.new(this,
      byteSize: RInt8.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asInt8List(offset, len),
    ));

    Uint8$ = _bScalar(.new(this,
      byteSize: RUint8.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asUint8List(offset, len),
    ));

    Int16$ = _bScalar(.new(this,
      byteSize: RInt16.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asInt16List(offset, len),
    ));

    Uint16$ = _bScalar(.new(this,
      byteSize: RUint16.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asUint16List(offset, len),
    ));

    Int32$ = _bScalar(.new(this,
      byteSize: RInt32.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asInt32List(offset, len),
    ));

    Uint32$ = _bScalar(.new(this,
      byteSize: RUint32.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asUint32List(offset, len),
    ));

    Int64$ = _bScalar(.new(this,
      byteSize: RInt64.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asInt64List(offset, len),
    ));

    Uint64$ = _bScalar(.new(this,
      byteSize: RUint64.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toInt(),
      fromList: (list) => .fromList(list.cast<int>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asUint64List(offset, len),
    ));

    Float32$ = _bScalar(.new(this,
      byteSize: RFloat32.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toDouble(),
      fromList: (list) => .fromList(list.cast<double>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asFloat32List(offset, len),
    ));

    Float64$ = _bScalar(.new(this,
      byteSize: RFloat64.scalarByteSize,
      indexSetterFunc: (ptr, i, value) => ptr[i] = value.toDouble(),
      fromList: (list) => .fromList(list.cast<double>().toList()),
      asView: (ptr, length) => ptr.asView(length),
      fromBuffer: (buf, offset, len) => buf.asFloat64List(offset, len),
    ));

    _builtInScalarAllocators[RChar] = Char$;
    _builtInScalarAllocators[RUnsignedChar] = UnsignedChar$;
    _builtInScalarAllocators[RShort] = Short$;
    _builtInScalarAllocators[RUnsignedShort] = UnsignedShort$;
    _builtInScalarAllocators[RInt] = Int$;
    _builtInScalarAllocators[RUnsignedInt] = UnsignedInt$;
    _builtInScalarAllocators[RFloat] = Float$;
    _builtInScalarAllocators[RDouble] = Double$;

    _pointerAllocator = .new(this, byteSize: RType.nativeWordSize);
  }

  // structs

  late final RaylibTempStructAllocator<float3D> float3$;
  late final RaylibTempStructAllocator<float16D> float16$;

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

  final Map<Type, RaylibTempStructAllocator> _builtInStructAllocators = {};
  RaylibTempStructAllocator<X> _bStruct<X extends RaylibStruct<X>>(RaylibTempStructAllocator<X> allocator)
    => _builtInStructAllocators[X] = allocator;

  void _initStructAllocators() {
    float3$ = _bStruct(.new(this, layout: float3D.struct, factory: float3D.new, pointerFactory: float3D.pointer));
    float16$ = _bStruct(.new(this, layout: float16D.struct, factory: float16D.new, pointerFactory: float16D.pointer));

    AutomationEventList$ = _bStruct(.new(this, layout: AutomationEventListD.struct, factory: AutomationEventListD.new, pointerFactory: AutomationEventListD.pointer));
    AutomationEvent$ = _bStruct(.new(this, layout: AutomationEventD.struct, factory: AutomationEventD.new, pointerFactory: AutomationEventD.pointer));
    AudioStream$ = _bStruct(.new(this, layout: AudioStreamD.struct, factory: AudioStreamD.new, pointerFactory: AudioStreamD.pointer));
    BoneInfo$ = _bStruct(.new(this, layout: BoneInfoD.struct, factory: BoneInfoD.new, pointerFactory: BoneInfoD.pointer));
    BoundingBox$ = _bStruct(.new(this, layout: BoundingBoxD.struct, factory: BoundingBoxD.new, pointerFactory: BoundingBoxD.pointer));
    Camera2D$ = _bStruct(.new(this, layout: Camera2DD.struct, factory: Camera2DD.new, pointerFactory: Camera2DD.pointer));
    Camera3D$ = _bStruct(.new(this, layout: Camera3DD.struct, factory: Camera3DD.new, pointerFactory: Camera3DD.pointer));
    Color$ = _bStruct(.new(this, layout: ColorD.struct, factory: ColorD.new, pointerFactory: ColorD.pointer));
    FilePathList$ = _bStruct(.new(this, layout: FilePathListD.struct, factory: FilePathListD.new, pointerFactory: FilePathListD.pointer));
    Font$ = _bStruct(.new(this, layout: FontD.struct, factory: FontD.new, pointerFactory: FontD.pointer));
    GestureEvent$ = _bStruct(.new(this, layout: GestureEventD.struct, factory: GestureEventD.new, pointerFactory: GestureEventD.pointer));
    GlyphInfo$ = _bStruct(.new(this, layout: GlyphInfoD.struct, factory: GlyphInfoD.new, pointerFactory: GlyphInfoD.pointer));
    Image$ = _bStruct(.new(this, layout: ImageD.struct, factory: ImageD.new, pointerFactory: ImageD.pointer));
    Light$ = _bStruct(.new(this, layout: LightD.struct, factory: LightD.new, pointerFactory: LightD.pointer));
    MaterialMap$ = _bStruct(.new(this, layout: MaterialMapD.struct, factory: MaterialMapD.new, pointerFactory: MaterialMapD.pointer));
    Material$ = _bStruct(.new(this, layout: MaterialD.struct, factory: MaterialD.new, pointerFactory: MaterialD.pointer));
    Matrix$ = _bStruct(.new(this, layout: MatrixD.struct, factory: MatrixD.new, pointerFactory: MatrixD.pointer));
    Mesh$ = _bStruct(.new(this, layout: MeshD.struct, factory: MeshD.new, pointerFactory: MeshD.pointer));
    ModelAnimation$ = _bStruct(.new(this, layout: ModelAnimationD.struct, factory: ModelAnimationD.new, pointerFactory: ModelAnimationD.pointer));
    ModelSkeleton$ = _bStruct(.new(this, layout: ModelSkeletonD.struct, factory: ModelSkeletonD.new, pointerFactory: ModelSkeletonD.pointer));
    Model$ = _bStruct(.new(this, layout: ModelD.struct, factory: ModelD.new, pointerFactory: ModelD.pointer));
    Music$ = _bStruct(.new(this, layout: MusicD.struct, factory: MusicD.new, pointerFactory: MusicD.pointer));
    NPatchInfo$ = _bStruct(.new(this, layout: NPatchInfoD.struct, factory: NPatchInfoD.new, pointerFactory: NPatchInfoD.pointer));
    Quaternion$ = _bStruct(.new(this, layout: QuaternionD.struct, factory: QuaternionD.new, pointerFactory: QuaternionD.pointer));
    RayCollision$ = _bStruct(.new(this, layout: RayCollisionD.struct, factory: RayCollisionD.new, pointerFactory: RayCollisionD.pointer));
    Ray$ = _bStruct(.new(this, layout: RayD.struct, factory: RayD.new, pointerFactory: RayD.pointer));
    Rectangle$ = _bStruct(.new(this, layout: RectangleD.struct, factory: RectangleD.new, pointerFactory: RectangleD.pointer));
    RenderTexture$ = _bStruct(.new(this, layout: RenderTextureD.struct, factory: RenderTextureD.new, pointerFactory: RenderTextureD.pointer));
    RlDrawCall$ = _bStruct(.new(this, layout: RlDrawCallD.struct, factory: RlDrawCallD.new, pointerFactory: RlDrawCallD.pointer));
    RlRenderBatch$ = _bStruct(.new(this, layout: RlRenderBatchD.struct, factory: RlRenderBatchD.new, pointerFactory: RlRenderBatchD.pointer));
    RlVertexBuffer$ = _bStruct(.new(this, layout: RlVertexBufferD.struct, factory: RlVertexBufferD.new, pointerFactory: RlVertexBufferD.pointer));
    Shader$ = _bStruct(.new(this, layout: ShaderD.struct, factory: ShaderD.new, pointerFactory: ShaderD.pointer));
    Sound$ = _bStruct(.new(this, layout: SoundD.struct, factory: SoundD.new, pointerFactory: SoundD.pointer));
    Texture$ = _bStruct(.new(this, layout: TextureD.struct, factory: TextureD.new, pointerFactory: TextureD.pointer));
    Transform$ = _bStruct(.new(this, layout: TransformD.struct, factory: TransformD.new, pointerFactory: TransformD.pointer));
    Vector2$ = _bStruct(.new(this, layout: Vector2D.struct, factory: Vector2D.new, pointerFactory: Vector2D.pointer));
    Vector3$ = _bStruct(.new(this, layout: Vector3D.struct, factory: Vector3D.new, pointerFactory: Vector3D.pointer));
    Vector4$ = _bStruct(.new(this, layout: Vector4D.struct, factory: Vector4D.new, pointerFactory: Vector4D.pointer));
    VrDeviceInfo$ = _bStruct(.new(this, layout: VrDeviceInfoD.struct, factory: VrDeviceInfoD.new, pointerFactory: VrDeviceInfoD.pointer));
    VrStereoConfig$ = _bStruct(.new(this, layout: VrStereoConfigD.struct, factory: VrStereoConfigD.new, pointerFactory: VrStereoConfigD.pointer));
    Wave$ = _bStruct(.new(this, layout: WaveD.struct, factory: WaveD.new, pointerFactory: WaveD.pointer));
  }

  // optional structs

  late final RaylibTempStructAllocator<MsfGifResultD> MsfGifResult$;
  late final RaylibTempStructAllocator<MsfGifStateD> MsfGifState$;

  void _initOptionalStructAllocators() {
    MsfGifResult$ = _bStruct(.new(this, layout: MsfGifResultD.struct, factory: MsfGifResultD.new, pointerFactory: MsfGifResultD.pointer));
    MsfGifState$ = _bStruct(.new(this, layout: MsfGifStateD.struct, factory: MsfGifStateD.new, pointerFactory: MsfGifStateD.pointer));
  }

  final Map<Type, RaylibTempScalarAllocator> _customScalarAllocators = {};
  // A _cScalar<X extends RType, A extends RaylibTempScalarAllocator>(A allocator)
  //   => _customScalarAllocators[X] = allocator;

  final Map<Type, RaylibTempStructAllocator> _customStructAllocators = {};
  RaylibTempStructAllocator<X> _cStruct<X extends RaylibStruct<X>>(RaylibTempStructAllocator<X> allocator)
    => _customStructAllocators[X] = allocator;

  /// Creates and registers a struct allocator.
  RaylibTempStructAllocator<X> createStructAllocator<X extends RaylibStruct<X>>({
    required StructLayout layout,
    required StructFactory<X> factory,
    required StructPointerFactory<X> pointerFactory,
  }) => _cStruct(.new(this,
    layout: layout,
    factory: factory,
    pointerFactory: pointerFactory,
  ));

  /// Returns the struct allocator registered under struct type [X].
  RaylibTempScalarAllocator? scalarAlloc<Y extends RType>()
    => _builtInScalarAllocators[Y] ?? _customScalarAllocators[Y];

  /// Returns the struct allocator registered under struct type [X].
  RaylibTempStructAllocator<X>? structAlloc<X extends RaylibStruct<X>>()
    => (
      _builtInStructAllocators[X] ??
      _customStructAllocators[X]
    ) as RaylibTempStructAllocator<X>?;

  /// Frees all allocators, then delegates to [RaylibModule.dispose].
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();

    debugFreeInfo('Freeing built-in ${_builtInScalarAllocators.length + 2} scalar allocators...');
    String$.dispose();
    _pointerAllocator.dispose();
    _builtInScalarAllocators.values.forEach((a) => a.dispose());

    debugFreeInfo('Freeing built-in ${_builtInStructAllocators.length} struct allocators...');
    _builtInStructAllocators.values.forEach((a) => a.dispose());

    if (_customScalarAllocators.isNotEmpty) {
      debugFreeInfo('Freeing ${_customScalarAllocators.length} custom scalar allocators...');
      _customScalarAllocators.values.forEach((a) => a.dispose());
    }

    if (_customStructAllocators.isNotEmpty) {
      debugFreeInfo('Freeing ${_customStructAllocators.length} custom struct allocators...');
      _customStructAllocators.values.forEach((a) => a.dispose());
    }
  }
}