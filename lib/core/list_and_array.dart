part of 'raylib_dartified_base.dart';

/// A [ListMixin]-backed list that intercepts writes and forwards them to native
/// memory via [onElementSet] and [onSet].
abstract class _RaylibLiveListBase<E, L extends List<E>> extends ListMixin<E> {
  L _inner;

  _RaylibLiveListBase([L? inner]) : _inner = (inner ?? <E>[] as L);

  L get inner => _inner;
  set inner(L value) {
    _inner = value;
    onSet(value);
  }
  set raw(L value) => _inner = value;
  
  /// Called when element at [index] is set.
  /// Implement in platform-specific subclass to writthrough to memory.
  void onElementSet(int index, E value);

  /// Called when list is overwritten.
  /// Implement in platform-specific subclass to write through to memory.
  void onSet(L value);

  @override
  operator []=(int index, E value) {
    _inner[index] = value;
    onElementSet(index, value);
  }

  @override
  E operator [](int index) => _inner[index];

  @override
  int get length => _inner.length;

  @override
  set length(int newLength) => _inner.length = newLength;
}

/// Concrete [_RaylibLiveListBase] for untyped element lists.
abstract class RaylibLiveList<E> extends _RaylibLiveListBase<E, List<E>> {
  RaylibLiveList([super._inner]);
}

abstract class LiveListPointerBase<E, R extends RType> extends RaylibLiveList<E> {
  MemoryPointer<R>? ptr;

  LiveListPointerBase([super.inner, this.ptr]);

  bool get isPointerValid => ptr != null && !ptr!.isNull;

  void onPointer(void Function(MemoryPointer<R> p) fn) {
    if (!isPointerValid) return;
    fn(ptr!);
  }

  @override
  void onElementSet(int index, E value) {
    if (!isPointerValid) return;
    indexSetter(ptr!, index, value);
  }

  @override
  void onSet(List<E> value) {
    if (!isPointerValid) return;
    arraySetter(ptr!, value);
  }

  @override
  E operator [](int index) => isPointerValid
    ? indexGetter(ptr!, index)
    : inner[index];

  E indexGetter(MemoryPointer<R> ptr, int index);
  void indexSetter(MemoryPointer<R> ptr, int index, E value);
  void arraySetter(MemoryPointer<R> ptr, List<E> array);
}

class LiveListPointerStruct<D extends RaylibStruct<D>> extends LiveListPointerBase<D, RStruct> {
  StructPointer<D>? structPtr;

  @override
  MemoryPointer<RStruct>? get ptr => structPtr?.ptr.cast();

  LiveListPointerStruct([super.inner, this.structPtr]);

  void onStructPointer(void Function(StructPointer<D> p) fn) {
    if (!isPointerValid) return;
    fn(structPtr!);
  }

  @override
  D indexGetter(MemoryPointer<RStruct> ptr, int index)
    => isPointerValid
      ? structPtr!.owned(index)
      : inner[index];

  @override
  void indexSetter(MemoryPointer<RStruct> ptr, int index, D value)
    => isPointerValid
      ? structPtr![index] = value
      : inner[index] = value;

  @override
  void arraySetter(MemoryPointer<RStruct> ptr, List<D> array)
    => isPointerValid
      ? structPtr!.writeArray(array)
      : raw = array;
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

extension MemoryPointerMatrixIO on MemoryPointer<RPointer<RStruct>> {
  void writeMatrix<D extends RaylibStruct<D>>(
    List<LiveListPointerStruct<D>> rows
  ) {
    final pSize = RType.nativeWordSize;
    for (var i = 0; i < rows.length; i++) {
      final row = rows[i];
      writePtr(row.ptr, i * pSize);
      row.onPointer((rp) => row.structPtr!.writeArray(row.inner));
    }
  }

  List<List<D>> readMatrix<D extends RaylibStruct<D>>(
    int rowCount,
    int rowLength,
    StructPointer<D> Function(MemoryPointer ptr) factory,
    {bool owned = false}
  ) {
    final pSize = RType.nativeWordSize;
    return List.generate(rowCount, (i) {
      final rowPtr = factory(readPtr(i * pSize));
      return rowPtr.ptr.isNull 
        ? const []
        : rowPtr.readArray(rowLength, owned: owned);
    });
  }
}

class LiveListPointerScalar<E, R extends RType> extends LiveListPointerBase<E, R> {
  final E Function(MemoryPointer<R> ptr, int index) _get;
  final void Function(MemoryPointer<R> ptr, int index, E value) _set;

  LiveListPointerScalar(this._get, this._set, [super.inner, super.ptr]);

  List<E> readArray(int count) => .generate(count, (i) => this[i]);
  
  void writeArray(List<E> values) {
    for (var i = 0; i < values.length; i++) {
      this[i] = values[i];
    }
  }

  @override
  E indexGetter(MemoryPointer<R> ptr, int index) => _get(ptr, index);

  @override
  void indexSetter(MemoryPointer<R> ptr, int index, E value) => _set(ptr, index, value);

  @override
  void arraySetter(MemoryPointer<R> ptr, List<E> array) {
    for (var i = 0; i < array.length; i++) {
      _set(ptr, i, array[i]);
    }
  }
}

class LiveListInlineScalar<E, R extends RType> extends RaylibLiveList<E> {
  final MemoryPointer<R>? Function() resolveBase;
  final int byteOffset;
  final E Function(MemoryPointer<R> p, int i) get;
  final void Function(MemoryPointer<R> p, int i, E v) set;

  LiveListInlineScalar(this.resolveBase, this.byteOffset, this.get, this.set, [super.inner]);

  MemoryPointer<R>? get _field {
    final p = resolveBase();
    return (p != null && !p.isNull) ? p.offsetBy(byteOffset) : null;
  }

  @override
  E operator [](int index) {
    final f = _field;
    return f != null ? get(f, index) : inner[index];
  }

  @override
  void onElementSet(int index, E value) {
    final f = _field;
    if (f != null) set(f, index, value);
  }

  @override
  void onSet(List<E> value) {
    final f = _field;
    if (f != null) {
      for (var i = 0; i < value.length; i++) set(f, i, value[i]);
    }
  }
}

class LiveListInlineStruct<D extends RaylibStruct<D>> extends RaylibLiveList<D> {
  final MemoryPointer<RVoid>? Function() resolveBase;
  final int byteOffset;
  final StructPointerFactory<D> factory;

  LiveListInlineStruct(
    this.resolveBase,
    this.byteOffset,
    this.factory,
    [super.inner]
  );

  MemoryPointer<RVoid>? get _field {
    final p = resolveBase();
    return (p != null && !p.isNull) ? p.offsetBy(byteOffset) : null;
  }

  @override
  D operator [](int index) {
    final f = _field;
    if (f == null) return inner[index];
    return factory(f)[index];
  }

  @override
  void onElementSet(int index, D value) {
    final f = _field;
    if (f != null) factory(f).ref = value;
  }

  @override
  void onSet(List<D> value) {
    final f = _field;
    if (f != null) factory(f).writeArray(value);
  }
}

class LiveListPointerPointerStruct<D extends RaylibStruct<D>> extends RaylibLiveList<LiveListPointerStruct<D>> {
  MemoryPointer<RVoid>? ptr; // outer: pointer to an array of row pointers
  final int elementByteSize; // size of one D (row stride)
  final D Function() create;

  LiveListPointerPointerStruct(this.elementByteSize, this.create, [super.inner, this.ptr]);

  bool get isPointerValid => ptr != null && !ptr!.isNull;

  void onPointer(void Function(MemoryPointer<RVoid> p) fn) {
    if (!isPointerValid) return;
    fn(ptr!);
  }

  /// Slot [i]'s current row pointer, or the null pointer if outer is invalid
  /// or the row hasn't been allocated yet.
  MemoryPointer<RVoid> innerPointer(int i) => isPointerValid
    ? ptr!.readPtr(i * RType.nativeWordSize)
    : MemoryPointer.nullptr;

  @override
  void onElementSet(int index, LiveListPointerStruct<D> value) {
    if (!isPointerValid) return;
    ptr!.writePtr(value.ptr, index * RType.nativeWordSize);
  }

  @override
  void onSet(List<LiveListPointerStruct<D>> value) {
    if (!isPointerValid) return;
    for (var i = 0; i < value.length; i++) {
      ptr!.writePtr(value[i].ptr, i * RType.nativeWordSize);
    }
  }
}

/// Outer pointer-to-pointer container. Row type R is whatever live-list
/// variant backs a single row (`LiveListPointerScalar<E>` or
/// `LiveListPointerStruct<D>`). This class only manages the outer array
/// of row pointers, not what's inside each row.
class LiveListPointerPointer<X, R extends LiveListPointerBase<X, RVoid>>
    extends RaylibLiveList<R> {
  MemoryPointer<RVoid>? ptr; // pointer to an array of row pointers

  LiveListPointerPointer([super.inner, this.ptr]);

  bool get isPointerValid => ptr != null && !ptr!.isNull;

  void onPointer(void Function(MemoryPointer<RVoid> p) fn) {
    if (isPointerValid) fn(ptr!);
  }

  MemoryPointer<RVoid> innerPointer(int i) => isPointerValid
    ? ptr!.readPtr(i * RType.nativeWordSize)
    : MemoryPointer.nullptr;

  @override
  void onElementSet(int index, R value) {
    if (isPointerValid) ptr!.writePtr(value.ptr, index * RType.nativeWordSize);
  }

  @override
  void onSet(List<R> value) {
    if (!isPointerValid) return;
    for (var i = 0; i < value.length; i++) {
      ptr!.writePtr(value[i].ptr, i * RType.nativeWordSize);
    }
  }
}