// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic factory hub for [Vector3Base] construction.
///
/// [zeroFactory] and [createFactory] are injected by the concrete backend package
/// before use (e.g. `RaylibVector3Factories.createFactory = Vector3D.vec3`).
/// Derived helpers are implemented here in terms of those factories so the math stays in one place.
class RaylibVector3Factories {
  /// Creates a zero vector `(0, 0, 0)`. Injected by the backend package.
  static late Vector3Base Function() zeroFactory;

  /// Creates a vector from [x], [y], [z] components. Injected by the backend package.
  static late Vector3Base Function(num x, num y, num z) createFactory;

  // derived

  /// Creates a vector from [x], [y], [z] and immediately normalizes it.
  static Vector3Base normalized(num x, num y, num z) => createFactory(
    x.toDouble(),
    y.toDouble(),
    z.toDouble(),
  ).normalize() as Vector3Base;

  /// Returns a vector perpendicular to [o] by crossing it with its least-aligned cardinal axis.
  static Vector3Base perpendicular(Vector3Base o) {
    double min = o.x.abs();
    Vector3Base cardinalAxis = createFactory(1.0, 0.0, 0.0);

    if ((o.y).abs() < min) {
      min = (o.y).abs();
      cardinalAxis = createFactory(0.0, 1.0, 0.0);
    }

    if ((o.z).abs() < min) {
      cardinalAxis = createFactory(0.0, 0.0, 1.0);
    }

    return o.crossProduct(cardinalAxis) as Vector3Base;
  }

  /// Computes the barycentric coordinates of point [p] relative to triangle ([a], [b], [c]).
  static Vector3Base barycenter(Vector3Base p, Vector3Base a, Vector3Base b, Vector3Base c) {
    final v0 = b.sub(a);
    final v1 = c.sub(a);
    final v2 = p.sub(a);
    final d00 = v0.dotProduct(v0);
    final d01 = v0.dotProduct(v1);
    final d11 = v1.dotProduct(v1);
    final d20 = v2.dotProduct(v0);
    final d21 = v2.dotProduct(v1);
    final denom = d00*d11 - d01*d01;
    final y = (d11*d20 - d01*d21)/denom;
    final z = (d00*d21 - d01*d20)/denom;
    final x = 1.0 - (z + y);
    return createFactory(x, y, z);
  }
}