part of '../raylib_dartified_base.dart';

/// Backend-agnostic handle to a raw memory buffer returned by a C function.
abstract class MemoryPointer<X extends RType> {

  // ░███████   ░██████████ ░████████   ░██     ░██   ░██████  
  // ░██   ░██  ░██         ░██    ░██  ░██     ░██  ░██   ░██ 
  // ░██    ░██ ░██         ░██    ░██  ░██     ░██ ░██        
  // ░██    ░██ ░█████████  ░████████   ░██     ░██ ░██  █████ 
  // ░██    ░██ ░██         ░██     ░██ ░██     ░██ ░██     ██ 
  // ░██   ░██  ░██         ░██     ░██  ░██   ░██   ░██  ░███ 
  // ░███████   ░██████████ ░█████████    ░██████     ░█████░█ 

  /// Provides more information on double-frees or reads/writes on an invalid pointer.
  static bool debug = false;

  static final Map<int, List<void Function(String source, dynamic value)>> _readWatch = {};
  static final Map<int, List<void Function(String source, dynamic value)>> _writeWatch = {};

  static void Function(MemoryPointer ptr, String source, dynamic value)? _readAnyWatch;
  static void Function(MemoryPointer ptr, String source, dynamic value)? _writeAnyWatch;

  static void watchRead(int address, void Function(String source, dynamic value) fn) {
    _readWatch.putIfAbsent(address, () => []);
    _readWatch[address]!.add(fn);
  }

  static void watchWrite(int address, void Function(String source, dynamic value) fn) {
    _writeWatch.putIfAbsent(address, () => []);
    _writeWatch[address]!.add(fn);
  }

  static void watchReadAny(void Function(MemoryPointer ptr, String source, dynamic value)? fn)
    => _readAnyWatch = fn;

  static void watchWriteAny(void Function(MemoryPointer ptr, String source, dynamic value)? fn)
    => _writeAnyWatch = fn;

  static void checkRead(int address, String source, [dynamic value]) {
    _readAnyWatch?.call(MemoryPointer.fromAddress(address), source, value);
    final watch = _readWatch[address];
    if (watch == null) return;
    watch.forEach((f) => f(source, value));
  }

  static void checkWrite(int address, String source, [dynamic value]) {
    _writeAnyWatch?.call(MemoryPointer.fromAddress(address), source, value);
    final watch = _writeWatch[address];
    if (watch == null) return;
    watch.forEach((f) => f(source, value));
  }

  // ░████████      ░███      ░██████  ░██     ░██ 
  // ░██    ░██    ░██░██    ░██   ░██ ░██    ░██  
  // ░██    ░██   ░██  ░██  ░██        ░██   ░██   
  // ░████████   ░█████████ ░██        ░███████    
  // ░██     ░██ ░██    ░██ ░██        ░██   ░██   
  // ░██     ░██ ░██    ░██  ░██   ░██ ░██    ░██  
  // ░█████████  ░██    ░██   ░██████  ░██     ░██ 

  static MemoryPointer<Y> _defaultFromAddress<Y extends RType>(int address) {
    throw StateError(
      'MemoryPointer.fromAddress called before a memory backend was initialized.'
    );
  }

  /// Creates a new [MemoryPointer] from a given address.
  static MemoryPointer<Y> Function<Y extends RType>(int address) fromAddress = _defaultFromAddress;

  static MemoryPointer<RVoid> _defaultFromBytes<T extends TypedDataList>(T data) {
    throw StateError(
      'MemoryPointer.fromBytes called before a memory backend was initialized.'
    );
  }

  /// Allocates a new pointer and writes [data] into it.
  /// 
  /// Caller owns the result and must free() it.
  static MemoryPointer<RVoid> Function<T extends TypedDataList>(T data) fromBytes = _defaultFromBytes;

  /// Allocates a new NUL-terminated UTF-8 C string from [text] and
  /// returns a pointer to it.
  /// 
  /// Caller owns the result and must free() it.
  static MemoryPointer<RUint8> Function(String text, [int? bufferSize]) fromString = (text, [bufferSize]) {
    throw StateError(
      'MemoryPointer.fromString called before a memory backend was initialized.'
    );
  };

  static MemoryPointer<Y> _defaultNullptrFactory<Y extends RType>() {
    throw StateError(
      'MemoryPointer.nullptr called before a memory backend was initialized.'
    );
  }

  /// Constructs a nullptr.
  static MemoryPointer<Y> Function<Y extends RType>() nullptr = _defaultNullptrFactory;

  static MemoryPointer<Y> _defaultMalloc<Y extends RType>(int size) {
    throw StateError(
      'MemoryPointer.malloc called before a memory backend was initialized.'
    );
  }

  /// Allocates a memory of given [size].
  static MemoryPointer<Y> Function<Y extends RType>(int size) malloc = _defaultMalloc;

  static MemoryPointer<Y> _defaultCalloc<Y extends RType>(int nmemb, int size) {
    throw StateError(
      'MemoryPointer.calloc called before a memory backend was initialized.'
    );
  }

  /// Allocates a memory of given `nmemb * size` and zero initializes it.
  static MemoryPointer<Y> Function<Y extends RType>(int nmemb, int size) calloc = _defaultCalloc;

  // ░████████   ░██     ░██ ░██████████░██████████
  // ░██    ░██  ░██     ░██ ░██        ░██        
  // ░██    ░██  ░██     ░██ ░██        ░██        
  // ░████████   ░██     ░██ ░█████████ ░█████████ 
  // ░██     ░██ ░██     ░██ ░██        ░██        
  // ░██     ░██  ░██   ░██  ░██        ░██        
  // ░█████████    ░██████   ░██        ░██        

  static final List<MemoryPointer> _scratchBuffers = [];

  /// Called automatically at [RaylibBase.boot] (backend has initialized).
  static void _initializeScratchBuffers() {
    if (_scratchBuffers.isNotEmpty) _freeScratchBuffers();
    _scratchBuffers.add(calloc(1, RaylibConfig.MAX_STRUCT_BYTE_SIZE));
    _scratchBuffers.add(calloc(1, RaylibConfig.MAX_STRUCT_BYTE_SIZE));
  }

  /// Called automatically at [RaylibBase.dispose].
  static void _freeScratchBuffers() {
    _scratchBuffers.forEach((s) => s.free());
    _scratchBuffers.clear();
  }

  /// Returns a static thread-local scratch buffer for short-lived operations.
  /// Standard slots: 0 and 1 (used for binary operations like equality).
  static MemoryPointer<Y> scratch<Y extends RType>(int slot) {
    if (slot < 0 || slot >= _scratchBuffers.length) {
      throw StateError('MemoryPointer invalid scratch buffer index $slot.');
    }
    return _scratchBuffers[slot].cast();
  }

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  /// Check if the pointer is a `nullptr`.
  bool get isNull;

  /// Reinterprets this pointer as pointing to [Y] instead of [X].
  ///
  /// Same address/offset, no copy, no runtime check, purely a
  /// compile-time relabeling of what the memory is assumed to contain.
  /// The caller is responsible for [Y] actually matching the underlying data.
  MemoryPointer<Y> cast<Y extends RType>();

  /// Copies [length] bytes, viewed as [T].
  /// [T] must be a concrete TypedDataList type: Uint8List, Int32List,
  /// Float32List, etc. Throws if [T] isn't one of those.
  T to<T extends TypedDataList>(int length);

  /// Zero-copy view as [T]. Invalid after free()/heap growth.
  T asView<T extends TypedDataList>(int length);

  /// Frees the underlying allocation. Only call this if you
  /// actually own it.
  void free();

  /// Debug/logging only. Do NOT branch logic on this.
  int get address;

  /// [address] in hexadecimal format.
  String get hex => '0x${address.toRadixString(16).toUpperCase()}';

  /// Same buffer, address advanced by [byteOffset] bytes. Same type [X].
  /// Backends implement via pointer arithmetic (native) or address+offset (wasm).
  MemoryPointer<Y> offsetBy<Y extends RType>(int byteOffset);

  /// Reads [length] bytes at [byteOffset].
  Uint8List readBytes(int byteOffset, int length);

  /// Fills [length] bytes starting at [byteOffset] with the low byte of [value].
  void fillBytes(int value, int length, [int byteOffset = 0]) {
    offsetBy(byteOffset)
      .asView<Uint8List>(length)
      .fillRange(0, length, value & 0xFF);
  }

  /// Bulk-copies [length] bytes from [src] into this pointer.
  void copyBytesFrom(MemoryPointer src, int length, {int destOffset = 0, int srcOffset = 0}) {
    offsetBy(destOffset)
      .asView<Uint8List>(length)
      .setRange(0, length, src.offsetBy(srcOffset).asView<Uint8List>(length));
  }

  /// memcmp-style comparison of [length] bytes.
  int compareBytes(MemoryPointer other, int length, {int offset = 0, int otherOffset = 0}) {
    final a = offsetBy(offset).asView<Uint8List>(length);
    final b = other.offsetBy(otherOffset).asView<Uint8List>(length);
    for (int i = 0; i < length; i++) {
      final diff = a[i] - b[i];
      if (diff != 0) return diff;
    }
    return 0;
  }

  /// Hashes the bytes until [byteSize].
  int computeByteHash(int byteSize) {
    // 0x811c9dc5 is the 32-bit FNV offset basis
    var hash = 0x811c9dc5; 
    
    // Read bytes from memory address
    for (var i = 0; i < byteSize; i++) {
      // 0x01000193 is the 32-bit FNV prime
      hash = (hash ^ readUint8(i)) * 0x01000193; 
      // Force 32-bit unsigned wrap in Dart VM
      hash &= 0xFFFFFFFF; 
    }
    
    return hash;
  }

  /// Reads a pointer value at `address + byteOffset` and returns it typed as pointing to [Y].
  MemoryPointer<Y> readPtr<Y extends RType>([int byteOffset = 0]);

  /// Writes a pointer at given `address + byteOffset`.
  void writePtr(MemoryPointer? value, [int byteOffset = 0]);

  /// Reads a value of type [RSize] at given `address + byteOffset`.
  int readSize([int byteOffset = 0]);

  /// Reads a value of type [RBool] at given `address + byteOffset`.
  bool readBool([int byteOffset = 0]) => readUint8(byteOffset) != 0;

  /// Reads a value of type [RInt8] at given `address + byteOffset`.
  int readInt8([int byteOffset = 0]);

  /// Reads a value of type [RUint8] at given `address + byteOffset`.
  int readUint8([int byteOffset = 0]);
  
  /// Reads a value of type [RInt16] at given `address + byteOffset`.
  int readInt16([int byteOffset = 0]);
  
  /// Reads a value of type [RUint16] at given `address + byteOffset`.
  int readUint16([int byteOffset = 0]);
  
  /// Reads a value of type [RInt32] at given `address + byteOffset`.
  int readInt32([int byteOffset = 0]);
  
  /// Reads a value of type [RUint32] at given `address + byteOffset`.
  int readUint32([int byteOffset = 0]);
  
  /// Reads a value of type [RInt64] at given `address + byteOffset`.
  int readInt64([int byteOffset = 0]);
  
  /// Reads a value of type [RUint64] at given `address + byteOffset`.
  int readUint64([int byteOffset = 0]);
  
  /// Reads a value of type [RFloat32] at given `address + byteOffset`.
  double readFloat32([int byteOffset = 0]);
  
  /// Reads a value of type [RFloat64] at given `address + byteOffset`.
  double readFloat64([int byteOffset = 0]);

  /// Reads a value of type [RChar] at given `address + byteOffset`.
  int readChar([int byteOffset = 0]) => readInt8(byteOffset);

  /// Reads a value of type [RUnsignedChar] at given `address + byteOffset`.
  int readUnsignedChar([int byteOffset = 0]) => readUint8(byteOffset);

  /// Reads a value of type [RShort] at given `address + byteOffset`.
  int readShort([int byteOffset = 0]) => readInt16(byteOffset);

  /// Reads a value of type [RUnsignedShort] at given `address + byteOffset`.
  int readUnsignedShort([int byteOffset = 0]) => readUint16(byteOffset);

  /// Reads a value of type [RInt] at given `address + byteOffset`.
  int readInt([int byteOffset = 0]) => readInt32(byteOffset);

  /// Reads a value of type [RUnsignedInt] at given `address + byteOffset`.
  int readUnsignedInt([int byteOffset = 0]) => readUint32(byteOffset);

  /// Reads a value of type [RFloat] at given `address + byteOffset`.
  double readFloat([int byteOffset = 0]) => readFloat32(byteOffset);

  /// Reads a value of type [RDouble] at given `address + byteOffset`.
  double readDouble([int byteOffset = 0]) => readFloat64(byteOffset);

  /// Reads a fixed-size char-buffer field as a UTF-8 string, stopping early at NUL if present.
  String readStringUTF8([int? maxLength, int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt8>().toDartString(maxLength);

  /// Reads a fixed-size char-buffer field as a UTF-16 string, stopping early at NUL if present.
  String readStringUTF16([int? maxLength, int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt16>().toDartString(maxLength);

  /// Reads a fixed-size char-buffer field as a UTF-32 string, stopping early at NUL if present.
  String readStringUTF32([int? maxLength, int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt32>().toDartString(maxLength);

  /// Writes a [value] of type [RSize] at given `address + byteOffset`.
  void writeSize(int value, [int byteOffset = 0]);

  /// Writes a [value] of type [RBool] at given `address + byteOffset`.
  void writeBool(bool value, [int byteOffset = 0]);

  /// Writes a [value] of type [RInt8] at given `address + byteOffset`.
  void writeInt8(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RUint8] at given `address + byteOffset`.
  void writeUint8(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RInt16] at given `address + byteOffset`.
  void writeInt16(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RUint16] at given `address + byteOffset`.
  void writeUint16(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RInt32] at given `address + byteOffset`.
  void writeInt32(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RUint32] at given `address + byteOffset`.
  void writeUint32(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RInt64] at given `address + byteOffset`.
  void writeInt64(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RUint64] at given `address + byteOffset`.
  void writeUint64(int value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RFloat32] at given `address + byteOffset`.
  void writeFloat32(double value, [int byteOffset = 0]);
  
  /// Writes a [value] of type [RFloat64] at given `address + byteOffset`.
  void writeFloat64(double value, [int byteOffset = 0]);

  /// Writes a [value] of type [RChar] at given `address + byteOffset`.
  void writeChar(int value, [int byteOffset = 0]) => writeInt8(value, byteOffset);

  /// Writes a [value] of type [RUnsignedChar] at given `address + byteOffset`.
  void writeUnsignedChar(int value, [int byteOffset = 0]) => writeUint8(value, byteOffset);

  /// Writes a [value] of type [RShort] at given `address + byteOffset`.
  void writeShort(int value, [int byteOffset = 0]) => writeInt16(value, byteOffset);

  /// Writes a [value] of type [RUnsignedShort] at given `address + byteOffset`.
  void writeUnsignedShort(int value, [int byteOffset = 0]) => writeUint16(value, byteOffset);

  /// Writes a [value] of type [RInt] at given `address + byteOffset`.
  void writeInt(int value, [int byteOffset = 0]) => writeInt32(value, byteOffset);

  /// Writes a [value] of type [RUnsignedInt] at given `address + byteOffset`.
  void writeUnsignedInt(int value, [int byteOffset = 0]) => writeUint32(value, byteOffset);

  /// Writes a [value] of type [RFloat] at given `address + byteOffset`.
  void writeFloat(double value, [int byteOffset = 0]) => writeFloat32(value, byteOffset);

  /// Writes a [value] of type [RDouble] at given `address + byteOffset`.
  void writeDouble(double value, [int byteOffset = 0]) => writeFloat64(value, byteOffset);

  /// Writes a UTF-8 [text] into a fixed-size [maxLength]-byte buffer field at
  /// `address + byteOffset`. Truncates if too long; otherwise NUL-terminates
  /// and zero-pads the remainder.
  void writeStringUTF8(String text, [int? maxLength, int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt8>().writeString(text, maxLength);

  /// Writes a UTF-16 [text] into a fixed-size [maxLength]-byte buffer field at
  /// `address + byteOffset`. Truncates if too long; otherwise NUL-terminates
  /// and zero-pads the remainder.
  void writeStringUTF16(String text, [int? maxLength, int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt16>().writeString(text, maxLength);

  /// Writes a UTF-32 [text] into a fixed-size [maxLength]-byte buffer field at
  /// `address + byteOffset`. Truncates if too long; otherwise NUL-terminates
  /// and zero-pads the remainder.
  void writeStringUTF32(String text, [int? maxLength, int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt32>().writeString(text, maxLength);

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is MemoryPointer && address == other.address;

  @override
  int get hashCode => address.hashCode;
}

/// A `MemoryPointer<RStruct>` that also knows its element type D, so it can
/// offer .ref/[]/[]= the similar way scalar RType extensions do.
final class StructPointer<D extends RaylibStruct<D>> extends MemoryPointer<RStruct> {
  final MemoryPointer ptr;
  final StructLayout struct;
  final StructFactory<D> create;
  final StructPointerFactory<D> pointerFactory;

  StructPointer(this.ptr, this.struct, this.create, this.pointerFactory);

  factory StructPointer.nullable(
    MemoryPointer? ptr,
    StructLayout struct,
    StructFactory<D> create,
    StructPointerFactory<D> pointerFactory,
  ) => .new(
    ptr ?? MemoryPointer.nullptr(),
    struct,
    create,
    pointerFactory,
  );

  /// Live view, mutations write through immediately.
  D get ref {
    final value = create(op: this)..structSyncFromMemory();
    if (!value._requiresOp) value.op = null;
    return value;
  }

  /// Bulk-copies [v]'s current field values into memory. Does not change identity of [ref].
  set ref(D v) => _copyOrWrite(ptr, v);

  void _copyOrWrite(MemoryPointer dst, D v) {
    final src = v.op;
    if (src != null) {
      if (src.address == dst.address) return;
      dst.copyBytesFrom(src, struct.byteSize);
    } else {
      v.structWriteInto(dst);
    }
  }

  D _getAtIndex(int i, {bool owned = true}) {
    final inner = ptr.offsetBy(i * struct.byteSize);
    final value = create(op: pointerFactory(inner))..structSyncFromMemory();
    if (!owned) value.op = null;
    return value;
  }

  /// Returns the struct at [i] as a memory-backed value.
  ///
  /// The returned struct retains a [StructPointer] to the corresponding
  /// memory location, so changes made to it are written through to memory.
  D owned(int i) => _getAtIndex(i, owned: true);

  /// Returns a detached copy of the struct at [i].
  ///
  /// Changes made to the returned struct are not written back to memory.
  D operator [](int i) => _getAtIndex(i, owned: false);
  
  /// Writes the current field values of [v] into the struct at [i].
  ///
  /// This copies the value into memory and does not attach [v] to the
  /// destination memory location.
  // void operator []=(int i, D v) => v.structWriteInto(ptr.offsetBy(i * struct.byteSize));
  void operator []=(int i, D v) => _copyOrWrite(ptr.offsetBy(i * struct.byteSize), v);

  /// Writes [items] sequentially into the memory referenced by this pointer.
  ///
  /// The number of items written must not exceed the allocated struct array
  /// capacity.
  void writeArray(List<D> items) {
    for (var i = 0; i < items.length; i++) {
      _copyOrWrite(ptr.offsetBy(i * struct.byteSize), items[i]);
    }
  }

  /// Reads [count] structs sequentially from the memory referenced by this
  /// pointer.
  ///
  /// If [owned] is `true`, each returned struct retains a [StructPointer] to
  /// its corresponding memory location, making it a live memory-backed value.
  ///
  /// If [owned] is `false`, each returned struct is a detached copy and does
  /// not retain a pointer to the underlying memory.
  List<D> readArray(int count, {bool owned = true}) => .generate(count,
    (i) => _getAtIndex(i, owned: owned),
  );

  StructLiveList<D, RStruct> live([List<D>? initial]) => .live(
    () => ptr,
    readAt: (_, i) => this[i],
    writeAt: (_, i, v) => this[i] = v,
    initial: initial ?? [],
  );

  // MemoryPointer redirection

  @override
  bool get isNull => ptr.isNull;

  @override
  void free() => ptr.free();

  @override
  int get address => ptr.address;

  @override
  String get hex => ptr.hex;

  @override
  MemoryPointer<Y> cast<Y extends RType>() => ptr.cast();

  @override
  T to<T extends TypedDataList>(int length) => ptr.to(length);

  @override
  T asView<T extends TypedDataList>(int length) => ptr.asView(length);

  @override
  MemoryPointer<Y> offsetBy<Y extends RType>(int byteOffset) => ptr.offsetBy(byteOffset);

  @override
  Uint8List readBytes(int byteOffset, int length) => ptr.readBytes(byteOffset, length);

  @override
  void fillBytes(int value, int length, [int byteOffset = 0])
    => ptr.fillBytes(value, length, byteOffset);

  @override
  void copyBytesFrom(MemoryPointer src, int length, {int destOffset = 0, int srcOffset = 0})
    => ptr.copyBytesFrom(src, length, destOffset: destOffset, srcOffset: srcOffset);

  @override
  int compareBytes(MemoryPointer other, int length, {int offset = 0, int otherOffset = 0})
    => ptr.compareBytes(other, length, offset: offset, otherOffset: otherOffset);

  @override
  int computeByteHash(int byteSize)
    => ptr.computeByteHash(byteSize);

  @override
  MemoryPointer<Y> readPtr<Y extends RType>([int byteOffset = 0]) => ptr.readPtr(byteOffset);

  @override
  void writePtr(MemoryPointer? value, [int byteOffset = 0]) => ptr.writePtr(value, byteOffset);

  @override
  int readSize([int byteOffset = 0]) => ptr.readSize(byteOffset);

  @override
  bool readBool([int byteOffset = 0]) => ptr.readBool(byteOffset);

  @override
  int readInt8([int byteOffset = 0]) => ptr.readInt8(byteOffset);

  @override
  int readUint8([int byteOffset = 0]) => ptr.readUint8(byteOffset);
  
  @override
  int readInt16([int byteOffset = 0]) => ptr.readInt16(byteOffset);
  
  @override
  int readUint16([int byteOffset = 0]) => ptr.readUint16(byteOffset);
  
  @override
  int readInt32([int byteOffset = 0]) => ptr.readInt32(byteOffset);
  
  @override
  int readUint32([int byteOffset = 0]) => ptr.readUint32(byteOffset);
  
  @override
  int readInt64([int byteOffset = 0]) => ptr.readInt64(byteOffset);
  
  @override
  int readUint64([int byteOffset = 0]) => ptr.readUint64(byteOffset);
  
  @override
  double readFloat32([int byteOffset = 0]) => ptr.readFloat32(byteOffset);
  
  @override
  double readFloat64([int byteOffset = 0]) => ptr.readFloat64(byteOffset);

  @override
  int readChar([int byteOffset = 0]) => ptr.readChar(byteOffset);

  @override
  int readUnsignedChar([int byteOffset = 0]) => ptr.readUnsignedChar(byteOffset);

  @override
  int readShort([int byteOffset = 0]) => ptr.readShort(byteOffset);

  @override
  int readUnsignedShort([int byteOffset = 0]) => ptr.readUnsignedShort(byteOffset);

  @override
  int readInt([int byteOffset = 0]) => ptr.readInt(byteOffset);

  @override
  int readUnsignedInt([int byteOffset = 0]) => ptr.readUnsignedInt(byteOffset);

  @override
  double readFloat([int byteOffset = 0]) => ptr.readFloat(byteOffset);

  @override
  double readDouble([int byteOffset = 0]) => ptr.readDouble(byteOffset);

  @override
  String readStringUTF8([int? maxLength, int byteOffset = 0])
    => ptr.readStringUTF8(maxLength, byteOffset);

  @override
  String readStringUTF16([int? maxLength, int byteOffset = 0])
    => ptr.readStringUTF16(maxLength, byteOffset);

  @override
  String readStringUTF32([int? maxLength, int byteOffset = 0])
    => ptr.readStringUTF32(maxLength, byteOffset);

  @override
  void writeSize(int value, [int byteOffset = 0]) => ptr.writeSize(value, byteOffset);

  @override
  void writeBool(bool value, [int byteOffset = 0]) => ptr.writeBool(value, byteOffset);

  @override
  void writeInt8(int value, [int byteOffset = 0]) => ptr.writeInt8(value, byteOffset);
  
  @override
  void writeUint8(int value, [int byteOffset = 0]) => ptr.writeUint8(value, byteOffset);
  
  @override
  void writeInt16(int value, [int byteOffset = 0]) => ptr.writeInt16(value, byteOffset);
  
  @override
  void writeUint16(int value, [int byteOffset = 0]) => ptr.writeUint16(value, byteOffset);
  
  @override
  void writeInt32(int value, [int byteOffset = 0]) => ptr.writeInt32(value, byteOffset);
  
  @override
  void writeUint32(int value, [int byteOffset = 0]) => ptr.writeUint32(value, byteOffset);
  
  @override
  void writeInt64(int value, [int byteOffset = 0]) => ptr.writeInt64(value, byteOffset);
  
  @override
  void writeUint64(int value, [int byteOffset = 0]) => ptr.writeUint64(value, byteOffset);
  
  @override
  void writeFloat32(double value, [int byteOffset = 0]) => ptr.writeFloat32(value, byteOffset);
  
  @override
  void writeFloat64(double value, [int byteOffset = 0]) => ptr.writeFloat64(value, byteOffset);

  @override
  void writeChar(int value, [int byteOffset = 0]) => ptr.writeChar(value, byteOffset);

  @override
  void writeUnsignedChar(int value, [int byteOffset = 0]) => ptr.writeUnsignedChar(value, byteOffset);

  @override
  void writeShort(int value, [int byteOffset = 0]) => ptr.writeShort(value, byteOffset);

  @override
  void writeUnsignedShort(int value, [int byteOffset = 0]) => ptr.writeUnsignedShort(value, byteOffset);

  @override
  void writeInt(int value, [int byteOffset = 0]) => ptr.writeInt(value, byteOffset);

  @override
  void writeUnsignedInt(int value, [int byteOffset = 0]) => ptr.writeUnsignedInt(value, byteOffset);

  @override
  void writeFloat(double value, [int byteOffset = 0]) => ptr.writeFloat(value, byteOffset);

  @override
  void writeDouble(double value, [int byteOffset = 0]) => ptr.writeDouble(value, byteOffset);

  @override
  void writeStringUTF8(String text, [int? maxLength, int byteOffset = 0])
    => ptr.writeStringUTF8(text, maxLength, byteOffset);

  @override
  void writeStringUTF16(String text, [int? maxLength, int byteOffset = 0])
    => ptr.writeStringUTF16(text, maxLength, byteOffset);

  @override
  void writeStringUTF32(String text, [int? maxLength, int byteOffset = 0])
    => ptr.writeStringUTF32(text, maxLength, byteOffset);
}