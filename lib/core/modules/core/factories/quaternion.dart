// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic factory hub for [QuaternionBase] construction.
///
/// [zeroFactory] and [createFactory] are injected by the concrete backend package
/// before use (e.g. `RaylibQuaternionFactories.createFactory = QuaternionD.quat`).
/// Derived helpers are implemented here in terms of those factories so the math stays in one place.
class RaylibQuaternionFactories {
  /// Creates a zero quaternion `(0, 0, 0, 0)`. Injected by the backend package.
  static late QuaternionBase Function() zeroFactory;

  /// Creates a quaternion from [x], [y], [z], [w] components. Injected by the backend package.
  static late QuaternionBase Function(num x, num y, num z, num w) createFactory;

  // derived

  /// Returns the identity quaternion `(0, 0, 0, 1)`.
  static QuaternionBase identity() => createFactory(0.0, 0.0, 0.0, 1.0);

  /// Returns the shortest-arc quaternion rotating [from] to [to].
  static QuaternionBase fromVector3ToVector3(Vector3Base from, Vector3Base to) {
    final cross = from.crossProduct(to);
    return createFactory(
      cross.x,
      cross.y,
      cross.z,
      1.0 + from.dotProduct(to),
    ).normalize() as QuaternionBase;
  }

  /// Returns the quaternion equivalent of rotation matrix [mat].
  static QuaternionBase fromMatrix(MatrixBase mat) {
    final fourWSquaredMinus1 = mat.m0  + mat.m5 + mat.m10;
    final fourXSquaredMinus1 = mat.m0  - mat.m5 - mat.m10;
    final fourYSquaredMinus1 = mat.m5  - mat.m0 - mat.m10;
    final fourZSquaredMinus1 = mat.m10 - mat.m0 - mat.m5;

    int biggestIndex = 0;
    double fourBiggestSquaredMinus1 = fourWSquaredMinus1;
    if (fourXSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourXSquaredMinus1;
      biggestIndex = 1;
    }

    if (fourYSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourYSquaredMinus1;
      biggestIndex = 2;
    }

    if (fourZSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourZSquaredMinus1;
      biggestIndex = 3;
    }

    final biggestVal = math.sqrt(fourBiggestSquaredMinus1 + 1.0)*0.5;
    final mult = 0.25/biggestVal;

    return switch (biggestIndex) {
      0 => createFactory(
        biggestVal,
        (mat.m6 - mat.m9)*mult,
        (mat.m8 - mat.m2)*mult,
        (mat.m1 - mat.m4)*mult,
      ),
      1 => createFactory(
        biggestVal,
        (mat.m6 - mat.m9)*mult,
        (mat.m1 + mat.m4)*mult,
        (mat.m8 + mat.m2)*mult,
      ),
      2 => createFactory(
        biggestVal,
        (mat.m8 - mat.m2)*mult,
        (mat.m1 + mat.m4)*mult,
        (mat.m6 + mat.m9)*mult,
      ),
      3 => createFactory(
        biggestVal,
        (mat.m1 - mat.m4)*mult,
        (mat.m8 + mat.m2)*mult,
        (mat.m6 + mat.m9)*mult,
      ),
      _ => zeroFactory(),
    };
  }

  /// Returns a quaternion from [pitch], [yaw], [roll] Euler angles (in radians).
  static QuaternionBase fromEuler(double pitch, double yaw, double roll) {
    final x0 = math.cos(pitch*0.5);
    final x1 = math.sin(pitch*0.5);
    final y0 = math.cos(yaw*0.5);
    final y1 = math.sin(yaw*0.5);
    final z0 = math.cos(roll*0.5);
    final z1 = math.sin(roll*0.5);

    return createFactory(
      x1*y0*z0 - x0*y1*z1,
      x0*y1*z0 + x1*y0*z1,
      x0*y0*z1 - x1*y1*z0,
      x0*y0*z0 + x1*y1*z1,
    );
  }

  /// Returns a quaternion representing a rotation of [angle] radians around [axis].
  static QuaternionBase fromAxisAngle(Vector3Base axis, double angle)
  {
    QuaternionBase result = identity();

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
      ).normalize() as QuaternionBase;
    }

    return result;
  }

  /// Returns a quaternion from the raw XYZW components of [v].
  static QuaternionBase fromVector4(Vector4Base v) => createFactory(
    v.x,
    v.y,
    v.z,
    v.w,
  );
}