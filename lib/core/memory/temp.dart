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

  /// Returns the struct allocator registered under struct type [X].
  RaylibTempScalarAllocator? scalarAlloc<Y extends RType>()
    => _builtInScalarAllocators[Y];

  final Map<Type, RaylibTempStructAllocator> _builtInStructAllocators = {};
  final Map<Type, RaylibTempStructAllocator> _customStructAllocators = {};

  void _initStructAllocators() {
    StructTypes.register(float3.struct);
    StructTypes.register(float16.struct);

    StructTypes.register(AutomationEventList.struct);
    StructTypes.register(AutomationEvent.struct);
    StructTypes.register(AudioStream.struct);
    StructTypes.register(BoneInfo.struct);
    StructTypes.register(BoundingBox.struct);
    StructTypes.register(Camera2D.struct);
    StructTypes.register(Camera3D.struct);
    StructTypes.register(Color.struct);
    StructTypes.register(FilePathList.struct);
    StructTypes.register(Font.struct);
    StructTypes.register(GestureEvent.struct);
    StructTypes.register(GlyphInfo.struct);
    StructTypes.register(Image.struct);
    StructTypes.register(Light.struct);
    StructTypes.register(MaterialMap.struct);
    StructTypes.register(Material.struct);
    StructTypes.register(Matrix.struct);
    StructTypes.register(Mesh.struct);
    StructTypes.register(ModelAnimation.struct);
    StructTypes.register(ModelSkeleton.struct);
    StructTypes.register(Model.struct);
    StructTypes.register(Music.struct);
    StructTypes.register(NPatchInfo.struct);
    StructTypes.register(Quaternion.struct);
    StructTypes.register(RayCollision.struct);
    StructTypes.register(Ray.struct);
    StructTypes.register(Rectangle.struct);
    StructTypes.register(RenderTexture.struct);
    StructTypes.register(RlDrawCall.struct);
    StructTypes.register(RlRenderBatch.struct);
    StructTypes.register(RlVertexBuffer.struct);
    StructTypes.register(Shader.struct);
    StructTypes.register(Sound.struct);
    StructTypes.register(Texture.struct);
    StructTypes.register(Transform.struct);
    StructTypes.register(Vector2.struct);
    StructTypes.register(Vector3.struct);
    StructTypes.register(Vector4.struct);
    StructTypes.register(VrDeviceInfo.struct);
    StructTypes.register(VrStereoConfig.struct);
    StructTypes.register(Wave.struct);
  }

  void _initOptionalStructAllocators() {
    StructTypes.register(MsfGifResult.struct);
    StructTypes.register(MsfGifState.struct);
  }

  /// Gets (or creates) a struct allocator.
  RaylibTempStructAllocator<X> structAlloc<X extends RaylibStruct<X>>([StructType<X>? struct]) {
    if (!StructTypes.exists<X>()) {
      if (struct == null) throw StateError(
        'Allocator for $X does not exist. If you want to register it, pass the `struct`.'
      );
      StructTypes.register(struct);
    }

    final map = StructTypes.isBuiltIn<X>()
      ? _builtInStructAllocators
      : _customStructAllocators;
    return (map[X] ??= RaylibTempStructAllocator<X>(this, StructTypes.of<X>())) as RaylibTempStructAllocator<X>;
  }

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

    if (_customStructAllocators.isNotEmpty) {
      debugFreeInfo('Freeing ${_customStructAllocators.length} custom struct allocators...');
      _customStructAllocators.values.forEach((a) => a.dispose());
    }
  }
}