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
  V? read<V>(MemoryPointer p, int offset);

  /// Write a [value] of [RType] into a [p] at given [offset].
  void write<V>(MemoryPointer p, int offset, V? value);
}

/// Marker type for any int-like [RType]s.
mixin RTypeIntLike on RType {}

/// Marker type for any double-like [RType]s.
mixin RTypeDoubleLike on RType {}

/// Marker type for any unknown-like [RType]s.
mixin RTypeUnknownLike on RType {}

/// Base class for any [RType] whose size matches the platform's native word size
/// (4 bytes on 32-bit, 8 bytes on 64-bit).
abstract class RWordSizedType extends RType {
  const RWordSizedType();

  @override
  int get byteSize => RType.nativeWordSize;
}

final class RArray<E extends RType> extends RType {
  final E element;
  final int count;

  const RArray(this.element, [this.count = 1]);

  @override
  int get byteSize => element.byteSize * count;

  @override
  int get alignment => element.alignment;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => throw UnsupportedError('$this is not directly readable. Use appropriate field, not `StructField`.');

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => throw UnsupportedError('$this is not directly writable. Use appropriate field, not `StructField`.');
}

/// Marker type for a `callback/function` pointer.
final class RFunction<F> extends RType {
  const RFunction();

  @override
  int get byteSize => throw UnsupportedError('$this does not have a known size');

  @override
  V? read<V>(MemoryPointer p, int offset)
    => throw UnsupportedError('$this is not readable');

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => throw UnsupportedError('$this is not writable');
}

/// Marker type for a `opaque` type - any type.
final class ROpaque extends RType with RTypeUnknownLike {
  const ROpaque();

  @override
  int get byteSize => throw UnsupportedError('$this does not have a known size');

  @override
  V? read<V>(MemoryPointer p, int offset)
    => throw UnsupportedError('$this is not readable');

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => throw UnsupportedError('$this is not writable');
}

/// Marker type for a `void` type - any type.
final class RVoid extends RType with RTypeUnknownLike {
  const RVoid();

  @override
  int get byteSize => throw UnsupportedError('$this does not have a known size');

  @override
  V? read<V>(MemoryPointer p, int offset)
    => throw UnsupportedError('$this is not readable');

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => throw UnsupportedError('$this is not writable');
}

/// A raw address into backend memory.
/// 
/// Maps to any C pointer type (`void*`, `Image*`, `unsigned char*`, ...).
final class RPointer<X extends RType> extends RWordSizedType {
  final X target;
  
  const RPointer(this.target);

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readPtr(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writePtr(value as MemoryPointer?, offset);
}

/// Platform-dependent unsigned integer for object sizes. Maps to C `size_t`.
final class RSize extends RWordSizedType with RTypeIntLike {
  const RSize();

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readSize(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeSize(value as int, offset);
}

/// Platform-dependent signed integer for object sizes. Maps to C `ssize_t`.
final class RSsize extends RWordSizedType with RTypeIntLike {
  const RSsize();

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readSsize(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeSsize(value as int, offset);
}

/// Platform-dependent signed integer capable of holding a pointer. Maps to C `intptr_t`.
final class RIntPtr extends RWordSizedType with RTypeIntLike {
  const RIntPtr();

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readIntPtr(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeIntPtr(value as int, offset);
}

/// Platform-dependent unsigned integer capable of holding a pointer. Maps to C `uintptr_t`.
final class RUintPtr extends RWordSizedType with RTypeIntLike {
  const RUintPtr();

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readUintPtr(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeUintPtr(value as int, offset);
}

/// Platform-dependent signed integer representing the difference between pointers. Maps to C `ptrdiff_t`.
final class RPtrDiff extends RWordSizedType with RTypeIntLike {
  const RPtrDiff();

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readPtrDiff(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writePtrDiff(value as int, offset);
}

/// Unsigned 8-bit integer. Maps to C `bool`.
final class RBool extends RType {
  const RBool();

  static final int scalarByteSize = 1;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readBool(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeBool(value as bool, offset);
}

/// Signed 8-bit integer. Maps to C `int8_t`.
final class RInt8 extends RType with RTypeIntLike {
  const RInt8();

  static final int scalarByteSize = 1;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readInt8(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeInt8(value as int, offset);
}

/// Unsigned 8-bit integer. Maps to C `uint8_t`.
final class RUint8 extends RType with RTypeIntLike {
  const RUint8();

  static final int scalarByteSize = 1;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readUnsignedChar(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeUnsignedChar(value as int, offset);
}

/// Signed 16-bit integer. Maps to C `int16_t`.
final class RInt16 extends RType with RTypeIntLike {
  const RInt16();

  static final int scalarByteSize = 2;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readInt16(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeInt16(value as int, offset);
}

/// Unsigned 16-bit integer. Maps to C `uint16_t`.
final class RUint16 extends RType with RTypeIntLike {
  const RUint16();

  static final int scalarByteSize = 2;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readUint16(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeUint16(value as int, offset);
}

/// Signed 32-bit integer. Maps to C `int32_t`.
final class RInt32 extends RType with RTypeIntLike {
  const RInt32();

  static final int scalarByteSize = 4;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readInt32(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeInt32(value as int, offset);
}

/// Unsigned 32-bit integer. Maps to C `uint32_t`.
final class RUint32 extends RType with RTypeIntLike {
  const RUint32();

  static final int scalarByteSize = 4;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readUint32(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeUint32(value as int, offset);
}

/// Signed 64-bit integer. Maps to C `int64_t`.
final class RInt64 extends RType with RTypeIntLike {
  const RInt64();

  static final int scalarByteSize = 8;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readInt64(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeInt64(value as int, offset);
}

/// Unsigned 64-bit integer. Maps to C `uint64_t`.
final class RUint64 extends RType with RTypeIntLike {
  const RUint64();

  static final int scalarByteSize = 8;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readUint64(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeUint64(value as int, offset);
}

/// IEEE-754 single-precision float. Maps to C `float`.
final class RFloat32 extends RType {
  const RFloat32();

  static final int scalarByteSize = 4;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readFloat32(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeFloat32(value as double, offset);
}

/// IEEE-754 double-precision float. Maps to C `double`.
final class RFloat64 extends RType {
  const RFloat64();

  static final int scalarByteSize = 8;

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readFloat64(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeFloat64(value as double, offset);
}

/// Platform-dependent signed long integer. Maps to C `long`.
final class RLong extends RType with RTypeIntLike {
  const RLong();

  static int get scalarByteSize => switch (currentRaylibPlatform) {
    .windows => 4,
    _ => RType.nativeWordSize, 
  };

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readLong(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeLong(value as int, offset);
}

/// Platform-dependent unsigned long integer. Maps to C `unsigned long`.
final class RUnsignedLong extends RType with RTypeIntLike {
  const RUnsignedLong();

  static int get scalarByteSize => switch (currentRaylibPlatform) {
    .windows => 4,
    _ => RType.nativeWordSize, 
  };

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readUnsignedLong(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeUnsignedLong(value as int, offset);
}

/// Signed 64-bit integer. Maps to C `long long`.
final class RLongLong extends RType with RTypeIntLike {
  const RLongLong();

  static final int scalarByteSize = 8; 

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readLongLong(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeLongLong(value as int, offset);
}

/// Unsigned 64-bit integer. Maps to C `unsigned long long`.
final class RUnsignedLongLong extends RType with RTypeIntLike {
  const RUnsignedLongLong();

  static final int scalarByteSize = 8; 

  @override
  int get byteSize => scalarByteSize;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => p.readUnsignedLongLong(offset) as V;

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
    => p.writeUnsignedLongLong(value as int, offset);
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
  final StructType struct;

  const RStruct(this.struct);

  @override
  int get byteSize => struct.layout.byteSize;

  @override
  int get alignment => struct.layout.alignment;

  @override
  V? read<V>(MemoryPointer p, int offset)
    => throw UnsupportedError('$this is not directly readable. Use appropriate field, not `StructField`.');

  @override
  void write<V>(MemoryPointer p, int offset, V? value)
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
  bool operator [](int i) => readBool(i * RBool.scalarByteSize);
  void operator []=(int i, bool v) => writeBool(v, i * RBool.scalarByteSize);

  List<bool> readArray(int count) => .generate(count, (i) => this[i]);

  void writeArray(List<bool> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }
}

extension PointerArrayOnPointer on MemoryPointer<RPointer> {
  /// Reads [count] pointers from this pointer array.
  List<MemoryPointer<X>> readPtrArray<X extends RType>(int count)
    => .generate(count, (i) => readPtr(i * RType.nativeWordSize));
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
  /// terminator included), if not provided, string's length is used instead.
  void writeStringArray(List<String> strings, [List<int>? slotSizes]) {
    slotSizes ??= strings.map((s) => s.length).toList();
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
    List<List<D>> rows,
  ) {
    final type = StructTypes.of<D>();
    for (var i = 0; i < rows.length; i++) {
      type.ptr(readPtr(i * RType.nativeWordSize)).writeArray(rows[i]);
    }
  }

  List<StructLiveList<D, RStruct>> readMatrix<D extends RaylibStruct<D>>(
    int rowCount,
    int rowLength, {
    bool owned = false,
    bool materialize = false,
  }) {
    final type = StructTypes.of<D>();
    final List<StructLiveList<D, RStruct>> list = .generate(rowCount,
      (i) {
        final live = type.ptr(readPtr(i * RType.nativeWordSize)).live(owned: owned);
        if (materialize) live.materialize(count: rowLength, safe: true);
        return live;
      },
    );
    return list;
  }
}