part of '../raylib_dartified_base.dart';

sealed class RType {
  final int count;

  const RType([this.count = 1]);

  static int? _nativeWordSize;

  /// Must be set once by the concrete backend during initialization,
  /// before any RType byteSize/elementByteSize is computed.
  static set nativeWordSize(int value) {
    assert(value == 4 || value == 8, 'unexpected word size: $value');
    _nativeWordSize = value;
  }

  static int get nativeWordSize {
    if (_nativeWordSize == null) {
      throw StateError('RType.nativeWordSize not initialized by backend');
    }

    return _nativeWordSize!;
  }

  static bool get isNative32Bit => RType.nativeWordSize == 4;

  /// Size of a single element, ignoring count. Also the natural alignment
  /// for this field, per C rules, arrays align to their element size,
  /// not their total size.
  int get elementByteSize => switch (this) {
    RFunction() || ROpaque() || RVoid() => throw UnsupportedError('$this does not have a known size'),
    RPointer()  => nativeWordSize,
    RSize()     => nativeWordSize,
    RBool()     => RBool.scalarByteSize,
    RInt8()     => RInt8.scalarByteSize,
    RUint8()    => RUint8.scalarByteSize,
    RInt16()    => RInt16.scalarByteSize,
    RUint16()   => RUint16.scalarByteSize,
    RInt32()    => RInt32.scalarByteSize,
    RUint32()   => RUint32.scalarByteSize,
    RInt64()    => RInt64.scalarByteSize,
    RUint64()   => RUint64.scalarByteSize,
    RFloat32()  => RFloat32.scalarByteSize,
    RFloat64()  => RFloat64.scalarByteSize,
    RStruct(:final layout) => layout.byteSize,
  };

  int get byteSize => elementByteSize * count;

  X? read<X>(MemoryPointer p, int offset) => switch (this) {
    RFunction() || ROpaque() || RVoid() => throw UnsupportedError('$this is not readable'),
    RPointer()  => p.readPtr(offset),
    RSize()     => p.readSize(offset),
    RBool()     => p.readBool(offset),
    RInt8()     => p.readInt8(offset),
    RUint8()    => p.readUnsignedChar(offset),
    RInt16()    => p.readInt16(offset),
    RUint16()   => p.readUint16(offset),
    RInt32()    => p.readInt32(offset),
    RUint32()   => p.readUint32(offset),
    RInt64()    => p.readInt64(offset),
    RUint64()   => p.readUint64(offset),
    RFloat32()  => p.readFloat(offset),
    RFloat64()  => p.readDouble(offset),
    RStruct()   => p.offsetBy(offset),
  } as X?;

  void write<X>(MemoryPointer p, int offset, X? value) => switch (this) {
    RFunction() || ROpaque() || RVoid() => throw UnsupportedError('$this is not writable'),
    RPointer()  => p.writePtr(value as MemoryPointer?, offset),
    RSize()     => p.writeSize(value as int, offset),
    RBool()     => p.writeBool(value as bool, offset),
    RInt8()     => p.writeInt8(value as int, offset),
    RUint8()    => p.writeUnsignedChar(value as int, offset),
    RInt16()    => p.writeInt16(value as int, offset),
    RUint16()   => p.writeUint16(value as int, offset),
    RInt32()    => p.writeInt32(value as int, offset),
    RUint32()   => p.writeUint32(value as int, offset),
    RInt64()    => p.writeInt64(value as int, offset),
    RUint64()   => p.writeUint64(value as int, offset),
    RFloat32()  => p.writeFloat(value as double, offset),
    RFloat64()  => p.writeDouble(value as double, offset),
    RStruct()   => throw UnsupportedError('$this requires a struct factory. Use `StructTypeField`, not `StructField`.'),
  };
}

/// Marker type for a `callback/function` pointer.
final class RFunction<F> extends RType { const RFunction([super.count]); }

/// Marker type for a `opaque` type - any type.
final class ROpaque extends RType { const ROpaque([super.count]); }

/// Marker type for a `void` type - any type.
final class RVoid extends RType { const RVoid([super.count]); }

/// A raw address into backend memory.
/// 
/// Maps to any C pointer type (`void*`, `Image*`, `unsigned char*`, ...).
/// 
/// [X] works only as an information what this pointer **SHOULD** point to.
final class RPointer<X extends RType> extends RType {
  final X target;
  
  const RPointer(this.target, [super.count]);
}

/// Unsigned pointer-sized integer. Maps to C `size_t`.
final class RSize extends RType { const RSize([super.count]); }

/// Unsigned 8-bit integer. Maps to C `bool`.
final class RBool extends RType {
  const RBool([super.count]);

  static final int scalarByteSize = 1;
}

/// Signed 8-bit integer. Maps to C `int8_t`.
final class RInt8 extends RType {
  const RInt8([super.count]);

  static final int scalarByteSize = 1;
}

/// Unsigned 8-bit integer. Maps to C `uint8_t`.
final class RUint8 extends RType {
  const RUint8([super.count]);

  static final int scalarByteSize = 1;
}

/// Signed 16-bit integer. Maps to C `int16_t`.
final class RInt16 extends RType {
  const RInt16([super.count]);

  static final int scalarByteSize = 2;
}

/// Unsigned 16-bit integer. Maps to C `uint16_t`.
final class RUint16 extends RType {
  const RUint16([super.count]);

  static final int scalarByteSize = 2;
}

/// Signed 32-bit integer. Maps to C `int32_t`.
final class RInt32 extends RType {
  const RInt32([super.count]);

  static final int scalarByteSize = 4;
}

/// Unsigned 32-bit integer. Maps to C `uint32_t`.
final class RUint32 extends RType {
  const RUint32([super.count]);

  static final int scalarByteSize = 4;
}

/// Signed 64-bit integer. Maps to C `int64_t`.
final class RInt64 extends RType {
  const RInt64([super.count]);

  static final int scalarByteSize = 8;
}

/// Unsigned 64-bit integer. Maps to C `uint64_t`.
final class RUint64 extends RType {
  const RUint64([super.count]);

  static final int scalarByteSize = 8;
}

/// IEEE-754 single-precision float. Maps to C `float`.
final class RFloat32 extends RType {
  const RFloat32([super.count]);

  static final int scalarByteSize = 4;
}

/// IEEE-754 double-precision float. Maps to C `double`.
final class RFloat64 extends RType {
  const RFloat64([super.count]);

  static final int scalarByteSize = 8;
}

/// C `char`. Alias for [RInt8].
typedef RChar = RInt8;

/// C `unsigned char`. Alias for [RUint8].
typedef RUnsignedChar = RUint8;

/// C `short`. Alias for [RInt16].
typedef RShort = RInt16;

/// C `unsigned short`. Alias for [RUint16].
typedef RUnsignedShort = RUint16;

/// C `int`. Alias for [RInt32].
typedef RInt = RInt32;

/// C `unsigned int`. Alias for [RUint32].
typedef RUnsignedInt = RUint32;

/// C `float`. Alias for [RFloat32].
typedef RFloat = RFloat32;

/// C `double`. Alias for [RFloat64].
typedef RDouble = RFloat64;

class RStruct extends RType {
  final StructLayout layout;

  const RStruct(this.layout, [super.count]);
}

extension SizePointer on MemoryPointer<RSize> {
  int get value => readSize();
  set value(int v) => writeSize(v);
  int operator [](int i) => readSize(i * RType.nativeWordSize);
  void operator []=(int i, int v) => writeSize(v, i * RType.nativeWordSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension BoolPointer on MemoryPointer<RBool> {
  bool get value => readBool();
  set value(bool v) => writeBool(v);
  bool operator [](int i) => readBool(i);
  void operator []=(int i, bool v) => writeBool(v, i);

  List<bool> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<bool> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Int8Pointer on MemoryPointer<RInt8> {
  int get value => readInt8();
  set value(int v) => writeInt8(v);
  int operator [](int i) => readInt8(i * RInt8.scalarByteSize);
  void operator []=(int i, int v) => writeInt8(v, i * RInt8.scalarByteSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Utf8StringPointer on MemoryPointer<RInt8> {
  /// Reads a NUL-terminated C string starting at this pointer,
  /// decoded as UTF-8. Scans for the NUL byte itself, no length needed.
  String toDartString() => _decodeUtf8();

  /// Reads at most [maxLength] bytes as a UTF-8 string, stopping
  /// early at a NUL byte if found first. Use when you know a bound
  /// (e.g. a fixed-size char buffer) but the string may be shorter.
  String toDartStringBounded(int maxLength) => _decodeUtf8(0, maxLength);

  String _decodeUtf8([int startOffset = 0, int? maxLength]) {
    var end = startOffset;
    while (
      (maxLength == null || end - startOffset < maxLength) &&
      readInt8(end) != 0
    ) end++;
    return utf8.decode(readBytes(startOffset, end - startOffset));
  }

  /// Writes [text] into a fixed-size [maxLength]-byte buffer field at
  /// `address + byteOffset`. Truncates if too long; otherwise NUL-terminates
  /// and zero-pads the remainder.
  void writeString(String text, int maxLength, [int byteOffset = 0]) {
    final bytes = utf8.encode(text);
    final writeLen = bytes.length < maxLength ? bytes.length : maxLength;
    final dst = offsetBy(byteOffset).asView<Uint8List>(maxLength);
    dst.setRange(0, writeLen, bytes);
    dst.fillRange(writeLen, maxLength, 0);
  }
}

extension Uint8Pointer on MemoryPointer<RUint8> {
  int get value => readUint8();
  set value(int v) => writeUint8(v);
  int operator [](int i) => readUint8(i * RUint8.scalarByteSize);
  void operator []=(int i, int v) => writeUint8(v, i * RUint8.scalarByteSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Int16Pointer on MemoryPointer<RInt16> {
  int get value => readInt16();
  set value(int v) => writeInt16(v);
  int operator [](int i) => readInt16(i * RInt16.scalarByteSize);
  void operator []=(int i, int v) => writeInt16(v, i * RInt16.scalarByteSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Utf16StringPointer on MemoryPointer<RInt16> {
  String toDartString() => _decodeUtf16();
  String toDartStringBounded(int maxLength) => _decodeUtf16(0, maxLength);

  String _decodeUtf16([int startOffset = 0, int? maxLength]) {
    final units = <int>[];
    var byteOffset = startOffset;
    var count = 0;
    while (maxLength == null || count < maxLength) {
      final unit = readUint16(byteOffset);
      if (unit == 0) break;
      units.add(unit);
      byteOffset += 2;
      count++;
    }
    return String.fromCharCodes(units);
  }

  /// Writes [text] into a fixed-size [maxLength]-byte buffer field at
  /// `address + byteOffset`. Truncates if too long; otherwise NUL-terminates
  /// and zero-pads the remainder.
  /// 
  /// [maxLength] is in UTF-16 code units, not bytes.
  void writeString(String text, int maxLength, [int elementOffset = 0]) {
    var units = text.codeUnits; // List<int>, one per UTF-16 code unit
    var writeLen = units.length < maxLength ? units.length : maxLength;

    // Don't leave a lone leading surrogate at the truncation boundary.
    if (
      writeLen < units.length &&
      writeLen > 0 && _isHighSurrogate(units[writeLen - 1])
    ) writeLen--;

    final dst = offsetBy(elementOffset * 2).asView<Uint16List>(maxLength);
    dst.setRange(0, writeLen, units);
    dst.fillRange(writeLen, maxLength, 0);
  }

  bool _isHighSurrogate(int u) => u >= 0xD800 && u <= 0xDBFF;
}

extension Uint16Pointer on MemoryPointer<RUint16> {
  int get value => readUint16();
  set value(int v) => writeUint16(v);
  int operator [](int i) => readUint16(i * RUint16.scalarByteSize);
  void operator []=(int i, int v) => writeUint16(v, i * RUint16.scalarByteSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Int32Pointer on MemoryPointer<RInt32> {
  int get value => readInt32();
  set value(int v) => writeInt32(v);
  int operator [](int i) => readInt32(i * RInt32.scalarByteSize);
  void operator []=(int i, int v) => writeInt32(v, i * RInt32.scalarByteSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Utf32StringPointer on MemoryPointer<RInt32> {
  String toDartString() => _decodeUtf32();
  String toDartStringBounded(int maxLength) => _decodeUtf32(0, maxLength);

  String _decodeUtf32([int startOffset = 0, int? maxLength]) {
    final runes = <int>[];
    var i = startOffset;
    while (maxLength == null || i - startOffset < maxLength) {
      final rune = readUint32(i);
      if (rune == 0) break;
      runes.add(rune);
      i += 4;
    }
    return .fromCharCodes(runes);
  }

  /// Writes [text] into a fixed-size [maxLength]-byte buffer field at
  /// `address + byteOffset`. Truncates if too long; otherwise NUL-terminates
  /// and zero-pads the remainder.
  /// 
  /// [maxLength] is in UTF-32 code units (runes), not bytes.
  void writeString(String text, int maxLength, [int elementOffset = 0]) {
    final runes = text.runes.toList(); // full scalar values, no surrogates
    final writeLen = runes.length < maxLength ? runes.length : maxLength;
    final dst = offsetBy(elementOffset * 4).asView<Uint32List>(maxLength);
    dst.setRange(0, writeLen, runes);
    dst.fillRange(writeLen, maxLength, 0);
  }
}

extension Uint32Pointer on MemoryPointer<RUint32> {
  int get value => readUint32();
  set value(int v) => writeUint32(v);
  int operator [](int i) => readUint32(i * RUint32.scalarByteSize);
  void operator []=(int i, int v) => writeUint32(v, i * RUint32.scalarByteSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Int64Pointer on MemoryPointer<RInt64> {
  int get value => readInt64();
  set value(int v) => writeInt64(v);
  int operator [](int i) => readInt64(i * RInt64.scalarByteSize);
  void operator []=(int i, int v) => writeInt64(v, i * RInt64.scalarByteSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Uint64Pointer on MemoryPointer<RUint64> {
  int get value => readUint64();
  set value(int v) => writeUint64(v);
  int operator [](int i) => readUint64(i * RUint64.scalarByteSize);
  void operator []=(int i, int v) => writeUint64(v, i * RUint64.scalarByteSize);

  List<int> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<int> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Float32Pointer on MemoryPointer<RFloat32> {
  double get value => readFloat32();
  set value(double v) => writeFloat32(v);
  double operator [](int i) => readFloat32(i * RFloat32.scalarByteSize);
  void operator []=(int i, double v) => writeFloat32(v, i * RFloat32.scalarByteSize);

  List<double> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<double> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension Float64Pointer on MemoryPointer<RFloat64> {
  double get value => readFloat64();
  set value(double v) => writeFloat64(v);
  double operator [](int i) => readFloat64(i * RFloat64.scalarByteSize);
  void operator []=(int i, double v) => writeFloat64(v, i * RFloat64.scalarByteSize);

  List<double> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<double> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

/// Backend-agnostic handle to a raw memory buffer returned by a C function.
abstract class MemoryPointer<X extends RType> {
  /// Provides more information on double-frees or reads/writes on an invalid pointer.
  static bool debug = false;

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
  void copyBytesFrom(MemoryPointer<RType> src, int length, {int destOffset = 0, int srcOffset = 0}) {
    offsetBy(destOffset)
      .asView<Uint8List>(length)
      .setRange(0, length, src.offsetBy(srcOffset).asView<Uint8List>(length));
  }

  /// memcmp-style comparison of [length] bytes.
  int compareBytes(MemoryPointer<RType> other, int length, {int offset = 0, int otherOffset = 0}) {
    final a = offsetBy(offset).asView<Uint8List>(length);
    final b = other.offsetBy(otherOffset).asView<Uint8List>(length);
    for (int i = 0; i < length; i++) {
      final diff = a[i] - b[i];
      if (diff != 0) return diff;
    }
    return 0;
  }

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
      'MemoryPointer.nullptrFactory called before a memory backend was initialized.'
    );
  }

  /// Constructs a nullptr.
  static MemoryPointer<Y> Function<Y extends RType>() nullptrFactory = _defaultNullptrFactory;

  /// Constructs a nullptr.
  static MemoryPointer<RVoid> get nullptr => nullptrFactory();

  static MemoryPointer<Y> _defaultMalloc<Y extends RType>(int size) {
    throw StateError(
      'MemoryPointer.malloc called before a memory backend was initialized.'
    );
  }

  /// Allocates a memory of given [size].
  static MemoryPointer<Y> Function<Y extends RType>(int size) malloc = _defaultMalloc;

  /// Reads a pointer value at `address + byteOffset` and returns it typed as pointing to [Y].
  MemoryPointer<Y> readPtr<Y extends RType>([int byteOffset = 0]);

  /// Writes a pointer at given `address + byteOffset`.
  void writePtr(MemoryPointer<RType>? value, [int byteOffset = 0]);

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
  String readStringUTF8(int maxLength, [int byteOffset = 0])
    => offsetBy(byteOffset).cast<RChar>().toDartStringBounded(maxLength);

  /// Reads a fixed-size char-buffer field as a UTF-16 string, stopping early at NUL if present.
  String readStringUTF16(int maxLength, [int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt16>().toDartStringBounded(maxLength);

  /// Reads a fixed-size char-buffer field as a UTF-32 string, stopping early at NUL if present.
  String readStringUTF32(int maxLength, [int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt32>().toDartStringBounded(maxLength);

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
  void writeStringUTF8(String text, int maxLength, [int byteOffset = 0])
    => offsetBy(byteOffset).cast<RChar>().writeString(text, maxLength);

  /// Writes a UTF-16 [text] into a fixed-size [maxLength]-byte buffer field at
  /// `address + byteOffset`. Truncates if too long; otherwise NUL-terminates
  /// and zero-pads the remainder.
  void writeStringUTF16(String text, int maxLength, [int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt16>().writeString(text, maxLength);

  /// Writes a UTF-32 [text] into a fixed-size [maxLength]-byte buffer field at
  /// `address + byteOffset`. Truncates if too long; otherwise NUL-terminates
  /// and zero-pads the remainder.
  void writeStringUTF32(String text, int maxLength, [int byteOffset = 0])
    => offsetBy(byteOffset).cast<RInt32>().writeString(text, maxLength);
}

/// A `MemoryPointer<RStruct>` that also knows its element type D, so it can
/// offer .value/[]/[]= the same way scalar RType extensions do. Structs
/// can't get this for free via `on MemoryPointer<RStruct>` because RStruct
/// itself doesn't encode which struct type it is, this wrapper supplies
/// that missing piece once, explicitly.
final class StructPointer<D extends RaylibStruct<D>> {
  MemoryPointer<RStruct> ptr;
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
    (ptr ?? MemoryPointer.nullptr).cast(),
    struct,
    create,
    pointerFactory,
  );

  /// See [MemoryPointer.isNull].
  bool get isNull => ptr.isNull;

  /// See [MemoryPointer.free].
  void free() => ptr.free();

  /// See [MemoryPointer.address].
  int get address => ptr.address;

  /// See [MemoryPointer.hex].
  String get hex => ptr.hex;

  late D _ref;
  int? _lastAddress;

  /// Live view, mutations write through immediately.
  D get ref {
    if (ptr.address == _lastAddress) return _ref;
    _lastAddress = ptr.address;
    final value = create(op: this)..structSyncFromMemory();
    if (!value.structRequiresOp) value.op = null;
    return _ref = value;
  }
  
  /// Bulk-copies [v]'s current field values into memory. Does not change identity of [ref].
  set ref(D v) => ref.setD(v);

  D _getAtIndex(int i, {bool owned = true}) {
    final inner = ptr.offsetBy(i * struct.byteSize).cast<RStruct>();
    final value = pointerFactory(inner).ref;
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
  void operator []=(int i, D v) => v.structWriteInto(ptr.offsetBy(i * struct.byteSize));

  /// Writes [items] sequentially into the memory referenced by this pointer.
  ///
  /// The number of items written must not exceed the allocated struct array
  /// capacity.
  void writeArray(List<D> items) {
    for (var i = 0; i < items.length; i++) {
      items[i].structWriteInto(ptr.offsetBy(i * struct.byteSize));
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

  // MemoryPointer redirection

  /// See [MemoryPointer.cast].
  MemoryPointer<Y> cast<Y extends RType>() => ptr.cast();

  /// See [MemoryPointer.to].
  T to<T extends TypedDataList>(int length) => ptr.to(length);

  /// See [MemoryPointer.asView].
  T asView<T extends TypedDataList>(int length) => ptr.asView(length);

  /// See [MemoryPointer.offsetBy].
  MemoryPointer<Y> offsetBy<Y extends RType>(int byteOffset) => ptr.offsetBy(byteOffset);

  /// See [MemoryPointer.fillBytes].
  void fillBytes(int value, int length, [int byteOffset = 0])
    => ptr.fillBytes(value, length, byteOffset);

  /// See [MemoryPointer.copyBytesFrom].
  void copyBytesFrom(StructPointer<D> src, int length, {int destOffset = 0, int srcOffset = 0})
    => ptr.copyBytesFrom(src.ptr, length, destOffset: destOffset, srcOffset: srcOffset);

  /// See [MemoryPointer.compareBytes].
  int compareBytes(StructPointer<D> other, int length, {int offset = 0, int otherOffset = 0})
    => ptr.compareBytes(other.ptr, length, offset: offset, otherOffset: otherOffset);

  /// See [MemoryPointer.readPtr].
  MemoryPointer<Y> readPtr<Y extends RType>([int byteOffset = 0]) => ptr.readPtr(byteOffset);

  /// See [MemoryPointer.writePtr].
  void writePtr(MemoryPointer<RType>? value, [int byteOffset = 0]) => ptr.writePtr(value, byteOffset);

  /// See [MemoryPointer.readSize].
  int readSize([int byteOffset = 0]) => ptr.readSize(byteOffset);

  /// See [MemoryPointer.readBool].
  bool readBool([int byteOffset = 0]) => ptr.readBool(byteOffset);

  /// See [MemoryPointer.readInt8].
  int readInt8([int byteOffset = 0]) => ptr.readInt8(byteOffset);

  /// See [MemoryPointer.readUint8].
  int readUint8([int byteOffset = 0]) => ptr.readUint8(byteOffset);
  
  /// See [MemoryPointer.readInt16].
  int readInt16([int byteOffset = 0]) => ptr.readInt16(byteOffset);
  
  /// See [MemoryPointer.readUint16].
  int readUint16([int byteOffset = 0]) => ptr.readUint16(byteOffset);
  
  /// See [MemoryPointer.readInt32].
  int readInt32([int byteOffset = 0]) => ptr.readInt32(byteOffset);
  
  /// See [MemoryPointer.readUint32].
  int readUint32([int byteOffset = 0]) => ptr.readUint32(byteOffset);
  
  /// See [MemoryPointer.readInt64].
  int readInt64([int byteOffset = 0]) => ptr.readInt64(byteOffset);
  
  /// See [MemoryPointer.readUint64].
  int readUint64([int byteOffset = 0]) => ptr.readUint64(byteOffset);
  
  /// See [MemoryPointer.readFloat32].
  double readFloat32([int byteOffset = 0]) => ptr.readFloat32(byteOffset);
  
  /// See [MemoryPointer.readFloat64].
  double readFloat64([int byteOffset = 0]) => ptr.readFloat64(byteOffset);

  /// See [MemoryPointer.readChar].
  int readChar([int byteOffset = 0]) => ptr.readChar(byteOffset);

  /// See [MemoryPointer.readUnsignedChar].
  int readUnsignedChar([int byteOffset = 0]) => ptr.readUnsignedChar(byteOffset);

  /// See [MemoryPointer.readShort].
  int readShort([int byteOffset = 0]) => ptr.readShort(byteOffset);

  /// See [MemoryPointer.readUnsignedShort].
  int readUnsignedShort([int byteOffset = 0]) => ptr.readUnsignedShort(byteOffset);

  /// See [MemoryPointer.readInt].
  int readInt([int byteOffset = 0]) => ptr.readInt(byteOffset);

  /// See [MemoryPointer.readUnsignedInt].
  int readUnsignedInt([int byteOffset = 0]) => ptr.readUnsignedInt(byteOffset);

  /// See [MemoryPointer.readFloat].
  double readFloat([int byteOffset = 0]) => ptr.readFloat(byteOffset);

  /// See [MemoryPointer.readDouble].
  double readDouble([int byteOffset = 0]) => ptr.readDouble(byteOffset);

  /// See [MemoryPointer.readStringUTF8].
  String readStringUTF8(int maxLength, [int byteOffset = 0])
    => ptr.readStringUTF8(maxLength, byteOffset);

  /// See [MemoryPointer.readStringUTF16].
  String readStringUTF16(int maxLength, [int byteOffset = 0])
    => ptr.readStringUTF16(maxLength, byteOffset);

  /// See [MemoryPointer.readStringUTF32].
  String readStringUTF32(int maxLength, [int byteOffset = 0])
    => ptr.readStringUTF32(maxLength, byteOffset);

  /// See [MemoryPointer.writeSize].
  void writeSize(int value, [int byteOffset = 0]) => ptr.writeSize(value, byteOffset);

  /// See [MemoryPointer.writeBool].
  void writeBool(bool value, [int byteOffset = 0]) => ptr.writeBool(value, byteOffset);

  /// See [MemoryPointer.writeInt8].
  void writeInt8(int value, [int byteOffset = 0]) => ptr.writeInt8(value, byteOffset);
  
  /// See [MemoryPointer.writeUint8].
  void writeUint8(int value, [int byteOffset = 0]) => ptr.writeUint8(value, byteOffset);
  
  /// See [MemoryPointer.writeInt16].
  void writeInt16(int value, [int byteOffset = 0]) => ptr.writeInt16(value, byteOffset);
  
  /// See [MemoryPointer.writeUint16].
  void writeUint16(int value, [int byteOffset = 0]) => ptr.writeUint16(value, byteOffset);
  
  /// See [MemoryPointer.writeInt32].
  void writeInt32(int value, [int byteOffset = 0]) => ptr.writeInt32(value, byteOffset);
  
  /// See [MemoryPointer.writeUint32].
  void writeUint32(int value, [int byteOffset = 0]) => ptr.writeUint32(value, byteOffset);
  
  /// See [MemoryPointer.writeInt64].
  void writeInt64(int value, [int byteOffset = 0]) => ptr.writeInt64(value, byteOffset);
  
  /// See [MemoryPointer.writeUint64].
  void writeUint64(int value, [int byteOffset = 0]) => ptr.writeUint64(value, byteOffset);
  
  /// See [MemoryPointer.writeFloat32].
  void writeFloat32(double value, [int byteOffset = 0]) => ptr.writeFloat32(value, byteOffset);
  
  /// See [MemoryPointer.writeFloat64].
  void writeFloat64(double value, [int byteOffset = 0]) => ptr.writeFloat64(value, byteOffset);

  /// See [MemoryPointer.writeChar].
  void writeChar(int value, [int byteOffset = 0]) => ptr.writeChar(value, byteOffset);

  /// See [MemoryPointer.writeUnsignedChar].
  void writeUnsignedChar(int value, [int byteOffset = 0]) => ptr.writeUnsignedChar(value, byteOffset);

  /// See [MemoryPointer.writeShort].
  void writeShort(int value, [int byteOffset = 0]) => ptr.writeShort(value, byteOffset);

  /// See [MemoryPointer.writeUnsignedShort].
  void writeUnsignedShort(int value, [int byteOffset = 0]) => ptr.writeUnsignedShort(value, byteOffset);

  /// See [MemoryPointer.writeInt].
  void writeInt(int value, [int byteOffset = 0]) => ptr.writeInt(value, byteOffset);

  /// See [MemoryPointer.writeUnsignedInt].
  void writeUnsignedInt(int value, [int byteOffset = 0]) => ptr.writeUnsignedInt(value, byteOffset);

  /// See [MemoryPointer.writeFloat].
  void writeFloat(double value, [int byteOffset = 0]) => ptr.writeFloat(value, byteOffset);

  /// See [MemoryPointer.writeDouble].
  void writeDouble(double value, [int byteOffset = 0]) => ptr.writeDouble(value, byteOffset);

  /// See [MemoryPointer.writeStringUTF8].
  void writeStringUTF8(String text, int maxLength, [int byteOffset = 0])
    => ptr.writeStringUTF8(text, maxLength, byteOffset);

  /// See [MemoryPointer.writeStringUTF16].
  void writeStringUTF16(String text, int maxLength, [int byteOffset = 0])
    => ptr.writeStringUTF16(text, maxLength, byteOffset);

  /// See [MemoryPointer.writeStringUTF32].
  void writeStringUTF32(String text, int maxLength, [int byteOffset = 0])
    => ptr.writeStringUTF32(text, maxLength, byteOffset);
}