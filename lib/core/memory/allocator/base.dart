part of '../../raylib_dartified_base.dart';

/// Base class for Raylib temporary allocators, managing typed memory slots
/// with a consistent allocation/free lifecycle.
class RaylibTempAllocator<R extends RType> {
  final RaylibTemp temp;

  /// Debug name for this allocator, used in logging and diagnostics.
  late String name;

  /// Size in bytes of a single element this allocator manages.
  final int byteSize;

  RaylibTempAllocator(this.temp, {
    required this.byteSize,
  }) { name = '$R'; }

  MemoryPointer<RPointer<X>> _allocatePointer<X extends RType>(int count)
    => MemoryPointer.calloc(count, RType.nativeWordSize);

  /// Active allocation slots, keyed by slot name.
  /// Each entry holds the pointer and its element count.
  final Map<String, (MemoryPointer<R>, int)> slots = {};

  /// Returns the canonical slot key for [key], falling back to `default`
  /// when [key] is `null`.
  String _slotKey([String? key]) => key ?? 'default';

  /// Returns a slot key guaranteed to be unique within this temp context,
  /// by prefixing [key] with the next available ID.
  String _uniqueSlotKey(String key) => '${key}_${temp.nextId()}';

  /// Allocates [count] raw elements and returns the wrapped pointer.
  /// 
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<R> Raw([int count = 1]) => MemoryPointer.calloc(count, byteSize);

  /// Returns the pointer stored in [key], allocating (or reallocating)
  /// if necessary.
  ///
  /// If the slot already exists and its current capacity is >= [count], the
  /// existing pointer is reused. If capacity is insufficient the old block is
  /// freed and a new one of size [count] is allocated.
  ///
  /// [key]   – slot identifier (must not be null).
  /// [count] – minimum element capacity required (default: 1).
  MemoryPointer<R> At(String key, [int count = 1]) {
    final existing = slots[key];
    if (existing != null) {
      final (ptr, currentCount) = existing;
      if (count <= currentCount) return ptr.cast();
      ptr.free();
    }

    if (slots.length >= RaylibConfig.maxTrackedAllocations) {
      temp.dispose(); // free everything
      throw StateError(
        'Maximum tracked allocations reached for `$name` '
        '(${RaylibConfig.maxTrackedAllocations}). '
        'The temporary allocator was disposed to prevent further allocations. '
        'This may indicate excessive temporary allocation or a bug in '
        '`raylib_dartified`. If this limit is legitimately too low for your use case, '
        'increase `RaylibConfig.maxTrackedAllocations` before initializing `Raylib`.',
      );
    }

    final ptr = Raw(count);
    ptr._allocationKey = key;
    slots[key] = (ptr, count);
    return ptr;
  }

  /// Allocates (or reuses) a slot identified by a unique [key] suffix.
  ///
  /// Behaves like [At], but prepends a monotonic ID from [RaylibTemp.nextId] to
  /// [key], ensuring the slot is never accidentally shared with an unrelated
  /// call that happens to use the same base key.
  ///
  /// Useful when the same allocation site may be called multiple times within
  /// a single scope and each call must get its own independent buffer.
  MemoryPointer<R> AtUnique({String key = '@unique:', int count = 1}) => At(_uniqueSlotKey(key), count);

  /// Returns the total byte size for [count] elements.
  int Size([int count = 1]) => byteSize * count;

  /// Returns the pointer stored under [key], or `null` if the slot does not
  /// exist. Does **not** allocate.
  MemoryPointer<R>? Slot(String key) => slots[key]?.$1;

  /// Returns `true` if a slot with the given [key] exists.
  bool Has(String key) => slots.containsKey(key);

  /// Frees the native memory owned by slot [key] and removes it from the
  /// table.
  ///
  /// Throws if [key] has not been allocated.
  void Free(String key) {
    if (!slots.containsKey(key)) throw StateError('[FREE] Cannot free unallocated slot $key');
    slots[key]!.$1.free();
    slots.remove(key);
  }

  /// Removes the slot entry for [key] from the table **without** freeing the
  /// underlying memory.
  ///
  /// Use when ownership of the pointer has been transferred elsewhere.
  void Unslot(String key) => slots.remove(key);

  /// Frees all currently tracked slots and clears the slot table.
  ///
  /// Called automatically by the owning [RaylibTemp] during disposal.
  void dispose() {
    if (slots.isEmpty) return;

    temp.debugFreeInfo('Freeing user-defined ${slots.length} $name slots');
    slots.entries.forEach((x) {
      temp.debugFreeInfo('[FREE] ${x.key}');
      x.value.$1.free();
    });
    slots.clear();
  }
}

abstract class RaylibTempArrayAllocator<X, R extends RType> extends RaylibTempAllocator<R> {
  /// Writes [value] into the [i]-th element of the array at [ptr].
  final void Function(MemoryPointer<R> ptr, int i, X value) indexSetterFunc;
  
  RaylibTempArrayAllocator(super.temp, {
    required super.byteSize,
    required this.indexSetterFunc,
  });
  
  /// Allocates an unslotted array and populates it from [array].
  ///
  /// The caller is responsible for freeing the returned pointer.
  MemoryPointer<R> RawArray(List<X> array) {
    final p = Raw(array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(p, i, array[i]);
    return p;
  }

  /// Writes [array] into a slot of sufficient capacity and returns the pointer.
  ///
  /// [key] defaults to `default`. The slot is grown automatically if the
  /// current capacity is smaller than `array.length`.
  MemoryPointer<R> Array(List<X> array, {String? key}) {
    final p = At(_slotKey(key), array.length);
    for (int i = 0; i < array.length; i++) indexSetterFunc(p, i, array[i]);
    return p;
  }
}

/// Dispatches a [TypedDataList] to the correct typed allocator on [temp],
/// allowing callers to allocate any supported typed list without knowing
/// the concrete element type at the call site.
final class RaylibTempTypedDataListAllocator {
  final RaylibTemp temp;

  RaylibTempTypedDataListAllocator(this.temp);

  int ElementSize(TypedDataList data) {
    if (data is Int8List) return temp.Int8$.byteSize;
    if (data is Uint8List) return temp.Uint8$.byteSize;
    if (data is Int16List) return temp.Int16$.byteSize;
    if (data is Uint16List) return temp.Uint16$.byteSize;
    if (data is Int32List) return temp.Int32$.byteSize;
    if (data is Uint32List) return temp.Uint32$.byteSize;
    if (data is Int64List) return temp.Int64$.byteSize;
    if (data is Uint64List) return temp.Uint64$.byteSize;
    if (data is Float32List) return temp.Float32$.byteSize;
    if (data is Float64List) return temp.Float64$.byteSize;
    throw UnimplementedError('Unknown typed list: ${data.runtimeType}');
  }

  MemoryPointer<RVoid> Array(TypedDataList data, {String? key}) {
    if (data is Int8List) return temp.Int8$.Array(data, key: key).cast();
    if (data is Uint8List) return temp.Uint8$.Array(data, key: key).cast();
    if (data is Int16List) return temp.Int16$.Array(data, key: key).cast();
    if (data is Uint16List) return temp.Uint16$.Array(data, key: key).cast();
    if (data is Int32List) return temp.Int32$.Array(data, key: key).cast();
    if (data is Uint32List) return temp.Uint32$.Array(data, key: key).cast();
    if (data is Int64List) return temp.Int64$.Array(data, key: key).cast();
    if (data is Uint64List) return temp.Uint64$.Array(data, key: key).cast();
    if (data is Float32List) return temp.Float32$.Array(data, key: key).cast();
    if (data is Float64List) return temp.Float64$.Array(data, key: key).cast();
    throw UnimplementedError('Unknown typed list: ${data.runtimeType}');
  }
}