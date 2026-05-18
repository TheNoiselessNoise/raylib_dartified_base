// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic factory hub for [Vector4Base] construction.
///
/// [zeroFactory] and [createFactory] are injected by the concrete backend package
/// before use (e.g. `RaylibVector4Factories.createFactory = Vector4D.vec4`).
/// Derived helpers are implemented here in terms of those factories so the math stays in one place.
class RaylibVector4Factories {
  /// Creates a zero vector `(0, 0, 0, 0)`. Injected by the backend package.
  static late Vector4Base Function() zeroFactory;

  /// Creates a vector from [x], [y], [z], [w] components. Injected by the backend package.
  static late Vector4Base Function(num x, num y, num z, num w) createFactory;

  // derived
  
  /// Converts [color] RGBA channels from `0–255` to normalized `0.0–1.0` components.
  static Vector4Base colorNormalize(ColorBase color) => createFactory(
    color.r/255.0,
    color.g/255.0,
    color.b/255.0,
    color.a/255.0,
  );

  /// Creates a quaternion from an [axis] and rotation [angle] (in radians).
  static Vector4Base fromAxisAngle(Vector3Base axis, double angle)
  {
    Vector4Base result = createFactory(0, 0, 0, 1);

    if (axis.length != 0.0)
    {
      angle *= 0.5;

      axis = axis.normalize() as Vector3Base;

      final sinres = math.sin(angle);
      final cosres = math.cos(angle);

      return createFactory(
        axis.x*sinres,
        axis.y*sinres,
        axis.z*sinres,
        cosres,
      ).normalize() as Vector4Base;
    }

    return result;
  }

  /// Creates a [Vector4Base] from the raw XYZW components of [q].
  static Vector4Base fromQuaternion(QuaternionBase q) => createFactory(
    q.x,
    q.y,
    q.z,
    q.w,
  );
}