part of '../raylib_dartified_base.dart';

/// Pool of preallocated, reusable buffers for short-lived operations that
/// need a temporary [MemoryPointer] without going through a full alloc/free
/// cycle (e.g. binary operations like equality that need scratch space for
/// one call).
///
/// Buffers are slot-indexed and *not* stack- or ref-counted: callers must
/// treat a scratch slot as invalidated the moment another operation might
/// reuse the same slot. Never hold a scratch pointer across calls that
/// might themselves use scratch space.
///
/// Lifecycle is tied to the backend, not to this class directly.
/// 
/// Not instantiatable, use as a static namespace.
final class MemoryScratch {

  MemoryScratch._();

  static final List<MemoryPointer> _scratchBuffers = [];

  static void _initialize() {
    if (_scratchBuffers.isNotEmpty) _dispose();
    _scratchBuffers.add(.calloc(1, RaylibConfig.MAX_STRUCT_BYTE_SIZE));
    _scratchBuffers.add(.calloc(1, RaylibConfig.MAX_STRUCT_BYTE_SIZE));
  }

  static void _dispose() {
    _scratchBuffers.forEach((s) => s.free());
    _scratchBuffers.clear();
  }

  /// Returns the scratch buffer at [slot], cast to [Y].
  ///
  /// Standard slots: `0` and `1` (used for binary operations like equality).
  /// Contents are short-lived and may be overwritten by any subsequent
  /// scratch use, do NOT retain the returned pointer.
  static MemoryPointer<Y> get<Y extends RType>(int slot) {
    if (slot < 0 || slot >= _scratchBuffers.length) {
      throw StateError('MemoryPointer invalid scratch buffer index $slot.');
    }
    return _scratchBuffers[slot].cast();
  }
}