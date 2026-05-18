// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic factory hub for [Vector2Base] construction.
///
/// [zeroFactory] and [createFactory] are injected by the concrete backend package
/// before use (e.g. `RaylibVector2Factories.createFactory = Vector2D.vec2`).
class RaylibVector2Factories {
  /// Creates a zero vector `(0, 0)`. Injected by the backend package.
  static late Vector2Base Function() zeroFactory;

  /// Creates a vector from [x], [y] components. Injected by the backend package.
  static late Vector2Base Function(num x, num y) createFactory;
}