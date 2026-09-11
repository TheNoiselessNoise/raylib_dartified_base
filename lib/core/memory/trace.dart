part of '../raylib_dartified_base.dart';

/// Global observation hooks for memory reads/writes, keyed by address.
///
/// Purely diagnostic: watchers are notified *after* a read or write has
/// already happened, they cannot cancel or alter the operation. Backends
/// call [checkRead]/[checkWrite] themselves after each access; this class
/// only stores and dispatches to registered callbacks.
///
/// Not instantiatable, use as a static namespace.
final class MemoryTrace {

  MemoryTrace._();

  static final Map<int, List<void Function(String source, dynamic value)>> _readWatch = {};
  static final Map<int, List<void Function(String source, dynamic value)>> _writeWatch = {};

  static void Function(MemoryPointer ptr, String source, dynamic value)? _readAnyWatch;
  static void Function(MemoryPointer ptr, String source, dynamic value)? _writeAnyWatch;

  /// Registers [fn] to run whenever [address] is read from.
  /// Multiple watchers on the same address are all called, in registration order.
  static void watchRead(int address, void Function(String source, dynamic value) fn) {
    _readWatch.putIfAbsent(address, () => []);
    _readWatch[address]!.add(fn);
  }

  /// Registers [fn] to run whenever [address] is written to.
  /// Multiple watchers on the same address are all called, in registration order.
  static void watchWrite(int address, void Function(String source, dynamic value) fn) {
    _writeWatch.putIfAbsent(address, () => []);
    _writeWatch[address]!.add(fn);
  }

  /// Sets a single global callback invoked on every read, regardless of address.
  /// Pass `null` to unsubscribe. Replaces any previously set callback.
  static void watchReadAny(void Function(MemoryPointer ptr, String source, dynamic value)? fn)
    => _readAnyWatch = fn;

  /// Sets a single global callback invoked on every write, regardless of address.
  /// Pass `null` to unsubscribe. Replaces any previously set callback.
  static void watchWriteAny(void Function(MemoryPointer ptr, String source, dynamic value)? fn)
    => _writeAnyWatch = fn;

  /// Called by backend implementations after a read completes.
  /// Dispatches to the global watcher (if any) and any watchers on [address].
  static void checkRead(int address, String source, [dynamic value]) {
    _readAnyWatch?.call(MemoryPointer.fromAddress(address), source, value);
    final watch = _readWatch[address];
    if (watch == null) return;
    watch.forEach((f) => f(source, value));
  }

  /// Unregisters any read watchers on [address].
  static void unregisterRead(int address)
    => _readWatch.remove(address);

  /// Called by backend implementations after a write completes.
  /// Dispatches to the global watcher (if any) and any watchers on [address].
  static void checkWrite(int address, String source, [dynamic value]) {
    _writeAnyWatch?.call(MemoryPointer.fromAddress(address), source, value);
    final watch = _writeWatch[address];
    if (watch == null) return;
    watch.forEach((f) => f(source, value));
  }

  /// Unregisters any write watchers on [address].
  static void unregisterWrite(int address)
    => _writeWatch.remove(address);
}