part of '../../raylib_dartified_base.dart';

/// Dart-side utility helpers with no direct Raylib counterpart.
abstract class RaylibUtilsModuleBase<R extends RaylibBase> extends RaylibModule<R> {

  RaylibUtilsModuleBase(super.rl);

  /// Number of `uint32` words in an MD5 hash (128 bits).
  int get md5Uint32HashLength => 4;

  /// Number of `uint32` words in a SHA-1 hash (160 bits).
  int get sha1Uint32HashLength => 5;

  // TODO: ON NEW RAYLIB RELEASE - SHA256
  /// Number of `uint32` words in a SHA-256 hash (256 bits).
  // int get sha256Uint32HashLength => 8;

  /// Combines multiple [RaylibEnum] values into a single bitmask via bitwise OR.
  int EnumsAsFlagsOr(Iterable<RaylibEnum> values) {
    return values.fold(0, (acc, e) => acc | e.value);
  }

}
