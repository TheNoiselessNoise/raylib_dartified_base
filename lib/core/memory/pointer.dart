part of '../raylib_dartified_base.dart';

sealed class RType {
  const RType();

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

  /// Size of a single element.
  int get byteSize;

  /// Natural alignment for this field, per C rules,
  /// arrays align to their element size, not their total size.
  int get alignment => byteSize;

  /// Read this [RType] from a [p] at given [offset].
  V? read<V>(MemoryPointerHandle p, int offset);

  /// Write a [value] of [RType] into a [p] at given [offset].
  void write<V>(MemoryPointerHandle p, int offset, V? value);
}

/// Marker type for any int-like [RType]s.
mixin RTypeIntLike on RType {}

/// Marker type for any double-like [RType]s.
mixin RTypeDoubleLike on RType {}

/// Marker type for any unknown-like [RType]s.
mixin RTypeUnknownLike on RType {}

final class RArray<E extends RType> extends RType {
  final E element;
  final int count;

  const RArray(this.element, [this.count = 1]);

  @override
  int get byteSize => element.byteSize * count;

  @override
  int get alignment => element.alignment;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => throw UnsupportedError('$this is not directly readable. Use appropriate field, not `StructField`.');

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => throw UnsupportedError('$this is not directly writable. Use appropriate field, not `StructField`.');
}

/// Marker type for a `callback/function` pointer.
final class RFunction<F> extends RType {
  const RFunction();

  @override
  int get byteSize => throw UnsupportedError('$this does not have a known size');

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => throw UnsupportedError('$this is not readable');

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => throw UnsupportedError('$this is not writable');
}

/// Marker type for a `opaque` type - any type.
final class ROpaque extends RType with RTypeUnknownLike {
  const ROpaque();

  @override
  int get byteSize => throw UnsupportedError('$this does not have a known size');

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => throw UnsupportedError('$this is not readable');

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => throw UnsupportedError('$this is not writable');
}

/// Marker type for a `void` type - any type.
final class RVoid extends RType with RTypeUnknownLike {
  const RVoid();

  @override
  int get byteSize => throw UnsupportedError('$this does not have a known size');

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => throw UnsupportedError('$this is not readable');

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => throw UnsupportedError('$this is not writable');
}

/// A raw address into backend memory.
/// 
/// Maps to any C pointer type (`void*`, `Image*`, `unsigned char*`, ...).
/// 
/// [X] works only as an information what this pointer **SHOULD** point to.
final class RPointer<X extends RType> extends RType {
  final X target;
  
  const RPointer(this.target);

  @override
  int get byteSize => RType.nativeWordSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readPtr(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writePtr(value as MemoryPointerHandle?, offset);
}

/// Unsigned pointer-sized integer. Maps to C `size_t`.
final class RSize extends RType with RTypeIntLike {
  const RSize();

  @override
  int get byteSize => RType.nativeWordSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readSize(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeSize(value as int, offset);
}

/// Unsigned 8-bit integer. Maps to C `bool`.
final class RBool extends RType {
  const RBool();

  static final int scalarByteSize = 1;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readBool(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeBool(value as bool, offset);
}

/// Signed 8-bit integer. Maps to C `int8_t`.
final class RInt8 extends RType with RTypeIntLike {
  const RInt8();

  static final int scalarByteSize = 1;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readInt8(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeInt8(value as int, offset);
}

/// Unsigned 8-bit integer. Maps to C `uint8_t`.
final class RUint8 extends RType with RTypeIntLike {
  const RUint8();

  static final int scalarByteSize = 1;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readUnsignedChar(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeUnsignedChar(value as int, offset);
}

/// Signed 16-bit integer. Maps to C `int16_t`.
final class RInt16 extends RType with RTypeIntLike {
  const RInt16();

  static final int scalarByteSize = 2;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readInt16(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeInt16(value as int, offset);
}

/// Unsigned 16-bit integer. Maps to C `uint16_t`.
final class RUint16 extends RType with RTypeIntLike {
  const RUint16();

  static final int scalarByteSize = 2;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readUint16(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeUint16(value as int, offset);
}

/// Signed 32-bit integer. Maps to C `int32_t`.
final class RInt32 extends RType with RTypeIntLike {
  const RInt32();

  static final int scalarByteSize = 4;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readInt32(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeInt32(value as int, offset);
}

/// Unsigned 32-bit integer. Maps to C `uint32_t`.
final class RUint32 extends RType with RTypeIntLike {
  const RUint32();

  static final int scalarByteSize = 4;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readUint32(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeUint32(value as int, offset);
}

/// Signed 64-bit integer. Maps to C `int64_t`.
final class RInt64 extends RType with RTypeIntLike {
  const RInt64();

  static final int scalarByteSize = 8;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readInt64(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeInt64(value as int, offset);
}

/// Unsigned 64-bit integer. Maps to C `uint64_t`.
final class RUint64 extends RType with RTypeIntLike {
  const RUint64();

  static final int scalarByteSize = 8;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readUint64(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeUint64(value as int, offset);
}

/// IEEE-754 single-precision float. Maps to C `float`.
final class RFloat32 extends RType {
  const RFloat32();

  static final int scalarByteSize = 4;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readFloat32(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeFloat32(value as double, offset);
}

/// IEEE-754 double-precision float. Maps to C `double`.
final class RFloat64 extends RType {
  const RFloat64();

  static final int scalarByteSize = 8;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => p.readFloat64(offset) as V;

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => p.writeFloat64(value as double, offset);
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

  const RStruct(this.layout);

  @override
  int get byteSize => layout.byteSize;

  @override
  int get alignment => layout.alignment;

  @override
  V? read<V>(MemoryPointerHandle p, int offset)
    => throw UnsupportedError('$this is not directly readable. Use appropriate field, not `StructField`.');

  @override
  void write<V>(MemoryPointerHandle p, int offset, V? value)
    => throw UnsupportedError('$this is not directly writable. Use appropriate field, not `StructField`.');
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

extension MemoryPointerStringIO on MemoryPointer<RPointer<RChar>> {
  /// Reads [count] C strings from a `char**`-style pointer (this pointer
  /// points at an array of char* pointers, each read and decoded).
  List<String> readStringArray(int count) {
    if (isNull) return const [];
    return .generate(count, (i) {
      final strPtr = readPtr<RChar>(i * RType.nativeWordSize);
      return strPtr.isNull ? '' : strPtr.toDartString();
    });
  }

  /// Writes [strings] into this pre-allocated char**-sized buffer.
  /// Both the outer array (strings.length pointer slots) and each inner
  /// char* target buffer must already exist. [slotSizes[i]] is the real
  /// allocated byte capacity of slot i's buffer (bytes available,
  /// terminator included).
  void writeStringArray(List<String> strings, List<int> slotSizes) {
    assert(strings.length == slotSizes.length);

    for (final (i, s) in strings.indexed) {
      readPtr<RChar>(i * RType.nativeWordSize).writeString(s, slotSizes[i]);
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
  /// 
  /// If [maxLength] is provided reads at most [maxLength] bytes as
  /// a UTF-8 string, stopping early at a NUL byte if found first.
  /// Use when you know a bound (e.g. a fixed-size char buffer) but
  /// the string may be shorter.
  String toDartString([int? maxLength]) => _decodeUtf8(0, maxLength);

  String _decodeUtf8([int startOffset = 0, int? maxLength]) {
    var end = startOffset;
    while (
      (maxLength == null || end - startOffset < maxLength) &&
      readInt8(end) != 0
    ) end++;
    return utf8.decode(readBytes(startOffset, end - startOffset));
  }

  /// Writes [text] into a buffer field at `address + byteOffset`. If
  /// [maxLength] is null, it's derived from the UTF-8 byte length of [text]
  /// (caller is responsible for the field actually being that size).
  /// Truncates if [text] exceeds [maxLength]; otherwise NUL-terminates and
  /// zero-pads the remainder.
  void writeString(String text, [int? maxLength, int byteOffset = 0]) {
    final bytes = utf8.encode(text);
    final len = maxLength ?? bytes.length;
    final writeLen = bytes.length < len ? bytes.length : len;
    final dst = offsetBy(byteOffset).asView<Uint8List>(len);
    dst.setRange(0, writeLen, bytes);
    dst.fillRange(writeLen, len, 0);
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
  String toDartString([int? maxLength]) => _decodeUtf16(0, maxLength);

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

  /// Writes [text] into a buffer field at `address + elementOffset*2`. If
  /// [maxLength] is null, it's derived from the UTF-16 code unit length of
  /// [text] (caller is responsible for the field actually being that size).
  ///
  /// [maxLength] is in UTF-16 code units, not bytes. Truncates if [text]
  /// exceeds [maxLength]; otherwise NUL-terminates and zero-pads the
  /// remainder.
  void writeString(String text, [int? maxLength, int elementOffset = 0]) {
    var units = text.codeUnits; // List<int>, one per UTF-16 code unit
    var len = maxLength ?? units.length;
    var writeLen = units.length < len ? units.length : len;

    // Don't leave a lone leading surrogate at the truncation boundary.
    if (
      writeLen < units.length &&
      writeLen > 0 && _isHighSurrogate(units[writeLen - 1])
    ) writeLen--;

    final dst = offsetBy(elementOffset * 2).asView<Uint16List>(len);
    dst.setRange(0, writeLen, units);
    dst.fillRange(writeLen, len, 0);
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
  String toDartString([int? maxLength]) => _decodeUtf32(0, maxLength);

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

  /// Writes [text] into a buffer field at `address + elementOffset*4`. If
  /// [maxLength] is null, it's derived from the UTF-32 code unit (rune)
  /// length of [text] (caller is responsible for the field actually being
  /// that size).
  ///
  /// [maxLength] is in UTF-32 code units (runes), not bytes. Truncates if
  /// [text] exceeds [maxLength]; otherwise NUL-terminates and zero-pads the
  /// remainder.
  void writeString(String text, [int? maxLength, int elementOffset = 0]) {
    final runes = text.runes.toList(); // full scalar values, no surrogates
    final len = maxLength ?? runes.length;
    final writeLen = runes.length < len ? runes.length : len;
    final dst = offsetBy(elementOffset * 4).asView<Uint32List>(len);
    dst.setRange(0, writeLen, runes);
    dst.fillRange(writeLen, len, 0);
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

extension MemoryPointerMatrixIO on MemoryPointer<RPointer<RStruct>> {
  void writeMatrix<D extends RaylibStruct<D>>(
    List<StructLiveList<D, RStruct>> rows
  ) {
    final pSize = RType.nativeWordSize;
    for (var i = 0; i < rows.length; i++) {
      final row = rows[i];
      final p = row.ptrOf()!;
      writePtr(p, i * pSize);
      row.writeInto(p);
    }
  }

  List<List<D>> readMatrix<D extends RaylibStruct<D>>(
    int rowCount,
    int rowLength,
    StructPointer<D> Function(MemoryPointerHandle ptr) factory,
    {bool owned = false}
  ) {
    final pSize = RType.nativeWordSize;
    return List.generate(rowCount, (i) {
      final rowPtr = factory(readPtr(i * pSize));
      return rowPtr.isNull 
        ? const []
        : rowPtr.readArray(rowLength, owned: owned);
    });
  }
}

abstract interface class MemoryPointerHandle {
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
  void copyBytesFrom(MemoryPointerHandle src, int length, {int destOffset = 0, int srcOffset = 0}) {
    offsetBy(destOffset)
      .asView<Uint8List>(length)
      .setRange(0, length, src.offsetBy(srcOffset).asView<Uint8List>(length));
  }

  /// memcmp-style comparison of [length] bytes.
  int compareBytes(MemoryPointerHandle other, int length, {int offset = 0, int otherOffset = 0}) {
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
  void writePtr(MemoryPointerHandle? value, [int byteOffset = 0]);

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
}

/// Backend-agnostic handle to a raw memory buffer returned by a C function.
abstract class MemoryPointer<X extends RType> extends MemoryPointerHandle {
  /// Provides more information on double-frees or reads/writes on an invalid pointer.
  static bool debug = false;

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
}

/// A `MemoryPointer<RStruct>` that also knows its element type D, so it can
/// offer .value/[]/[]= the same way scalar RType extensions do.
final class StructPointer<D extends RaylibStruct<D>> extends MemoryPointerHandle {
  MemoryPointerHandle ptr;
  final StructLayout struct;
  final StructFactory<D> create;
  final StructPointerFactory<D> pointerFactory;

  StructPointer(this.ptr, this.struct, this.create, this.pointerFactory);

  factory StructPointer.nullable(
    MemoryPointerHandle? ptr,
    StructLayout struct,
    StructFactory<D> create,
    StructPointerFactory<D> pointerFactory,
  ) => .new(
    ptr ?? MemoryPointer.nullptr(),
    struct,
    create,
    pointerFactory,
  );

  late final D _ref = create(op: this)..structSyncFromMemory();

  /// Live view, mutations write through immediately.
  D get ref => _ref;

  /// Bulk-copies [v]'s current field values into memory. Does not change identity of [ref].
  set ref(D v) => _copyOrWrite(ptr, v);

  void _copyOrWrite(MemoryPointerHandle dst, D v) {
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
  void copyBytesFrom(MemoryPointerHandle src, int length, {int destOffset = 0, int srcOffset = 0})
    => ptr.copyBytesFrom(src, length, destOffset: destOffset, srcOffset: srcOffset);

  @override
  int compareBytes(MemoryPointerHandle other, int length, {int offset = 0, int otherOffset = 0})
    => ptr.compareBytes(other, length, offset: offset, otherOffset: otherOffset);

  @override
  int computeByteHash(int byteSize)
    => ptr.computeByteHash(byteSize);

  @override
  MemoryPointer<Y> readPtr<Y extends RType>([int byteOffset = 0]) => ptr.readPtr(byteOffset);

  @override
  void writePtr(MemoryPointerHandle? value, [int byteOffset = 0]) => ptr.writePtr(value, byteOffset);

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