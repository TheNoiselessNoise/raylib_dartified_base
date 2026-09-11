part of '../raylib_dartified_base.dart';

/// Debug-time diagnostics for [MemoryPointer] misuse.
///
/// Currently limited to reporting accesses on freed pointers; not related
/// to [MemoryTrace] (which observes live reads/writes, not error paths).
///
/// Not instantiatable, use as a static namespace.
final class MemoryDebug {

  MemoryDebug._();

  /// When `true`, [checkPointer] throws a [StateError] naming the method
  /// and arguments that were attempted on the freed pointer. When `false`,
  /// it throws a generic "has been freed" error instead.
  ///
  /// Leave `false` in release builds, building the detailed message
  /// retains [arg1]/[arg2] and does extra string work on every check.
  static bool verbose = false;

  static void _throwPointerFreed()
    => throw StateError('MemoryPointer has been freed.');

  static void _throwPointerFreedDetailed(String method, List<Object?> args)
    => throw StateError('Tried to do `$method(${args.join(', ')})` on freed pointer.');

  /// Verifies [ptr] hasn't been freed before [method] operates on it.
  ///
  /// If [MemoryPointer.isFreed] is `true`, throws a [StateError], detailed
  /// (naming [method], [arg1], [arg2]) if [verbose] is `true`, generic otherwise.
  /// Does nothing if [ptr] is still valid.
  static void checkPointer(MemoryPointer ptr, String method, [Object? arg1, Object? arg2]) {
    if (!ptr.isFreed) return;
    if (verbose) _throwPointerFreedDetailed(method, [arg1, arg2]);
    else _throwPointerFreed();
  }
}