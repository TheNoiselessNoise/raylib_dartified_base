part of '../raylib_dartified_base.dart';

/// Pool of preallocated, reusable buffers for short-lived operations that
/// need a temporary [MemoryPointer] without going through a full alloc/free
/// cycle (e.g. binary operations like equality that need scratch space for
/// one call).
///
/// Buffers are stack-allocated in LIFO order via [acquire]/[ScratchHandle.release]:
/// a handle is only valid between its own acquire and release, and must be
/// released before any handle acquired before it. Releasing out of order is
/// a programming error and throws [StateError].
///
/// Lifecycle is tied to the backend, not to this class directly.
///
/// Not instantiatable, use as a static namespace.
final class MemoryScratch {

  MemoryScratch._();

  static final List<MemoryPointer> _buffers = [];
  static final List<int> _sizes = [];
  static int _top = 0;

  /// Resets the stack pointer. Does not resize or free [_buffers]; existing
  /// allocations are reused by subsequent [acquire] calls if large enough.
  static void _initialize() => _top = 0;

  /// Frees all backing allocations and empties the pool. Any outstanding
  /// [ScratchHandle] becomes dangling, callers must not hold handles
  /// across a backend lifecycle boundary.
  static void dispose() {
    _buffers.forEach((b) => b.free());
    _buffers.clear();
    _sizes.clear();
    _top = 0;
  }

  /// Claims the next scratch slot on the stack, allocating a new backing
  /// buffer if the stack has never reached this depth before.
  ///
  /// By default the buffer is [RaylibConfig.maxStructByteSize] bytes.
  /// Pass [sizeInBytes] to request more; if the buffer already allocated at
  /// this depth is smaller than [sizeInBytes], it is freed and reallocated
  /// at the larger size before being handed out, this permanently grows
  /// that depth's footprint for subsequent acquires, per the class-level
  /// note on the pool never shrinking. [sizeInBytes] must be positive if
  /// given.
  ///
  /// The returned [ScratchHandle] owns exclusive access to its slot until
  /// [ScratchHandle.release] is called. Handles must be released in
  /// strict LIFO order, release the most recently acquired handle first,
  /// or [ScratchHandle.release] throws [StateError].
  ///
  /// Typical usage:
  /// ```dart
  /// final a = MemoryScratch.acquire();
  /// final b = MemoryScratch.acquire(sizeInBytes: 256);
  /// try {
  ///   // use a.pointer / b.pointer
  /// } finally {
  ///   b.release();
  ///   a.release();
  /// }
  /// ```
  static ScratchHandle<Y> acquire<Y extends RType>({int? sizeInBytes}) {
    if (sizeInBytes != null && sizeInBytes <= 0) {
      throw ArgumentError.value(sizeInBytes, 'sizeInBytes', 'must be positive');
    }
    final requiredSize = sizeInBytes ?? RaylibConfig.maxStructByteSize;

    if (_top == _buffers.length) {
      _buffers.add(.calloc(1, requiredSize));
      _sizes.add(requiredSize);
    } else if (_sizes[_top] < requiredSize) {
      _buffers[_top].free();
      _buffers[_top] = .calloc(1, requiredSize);
      _sizes[_top] = requiredSize;
    }

    final slot = _top++;
    return ScratchHandle._(slot, _buffers[slot].cast<Y>());
  }

  /// Pops [slot] off the stack. Throws [StateError] if [slot] is not
  /// currently the top of the stack, i.e. a more recently acquired handle
  /// has not yet been released.
  static void _release(int slot) {
    if (slot != _top - 1) {
      throw StateError(
        'Scratch buffers released out of order (releasing $slot, top is ${_top - 1}). '
        'Scratch handles must be released LIFO.',
      );
    }
    _top--;
  }
}

/// A live claim on one [MemoryScratch] slot, returned by [MemoryScratch.acquire].
///
/// [pointer] is valid only until [release] is called, and only as long as no
/// handle acquired after this one is still outstanding. Never retain
/// [pointer] beyond that window, and never call [release] more than once
/// per handle (subsequent calls are a no-op).
final class ScratchHandle<Y extends RType> {
  final int _slot;

  /// Scratch memory for this claim, cast to [Y]. Contents are short-lived
  /// and undefined once [release] is called or a nested [MemoryScratch.acquire]
  /// invalidates the stack ordering guarantee.
  final MemoryPointer<Y> pointer;
  bool _released = false;

  ScratchHandle._(this._slot, this.pointer);

  /// Releases this slot back to [MemoryScratch]. Must be called exactly
  /// once, before releasing any handle acquired before this one. Safe to
  /// call from a `finally` block; idempotent on repeat calls.
  void release() {
    if (_released) return;
    _released = true;
    MemoryScratch._release(_slot);
  }
}