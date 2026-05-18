// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic factory hub for [MatrixBase] construction.
///
/// [zeroFactory] and [createFactory] are injected by the concrete backend package
/// before use (e.g. `RaylibMatrixFactories.createFactory = MatrixD.mat`).
/// Derived helpers are implemented here in terms of those factories so the math stays in one place.
class RaylibMatrixFactories {
  /// Creates a zero matrix `(0, ..., 0)`. Injected by the backend package.
  static late MatrixBase Function() zeroFactory;

  /// Creates a matrix from [m0], ..., [m15] components. Injected by the backend package.
  static late MatrixBase Function(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) createFactory;

  // derived

  /// Returns the 4x4 identity matrix.
  static MatrixBase identity() => createFactory(
    1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 1, 0,
    0, 0, 0, 1,
  );

  /// Returns a view matrix oriented from [eye] toward [target], with [up] defining the vertical axis.
  static MatrixBase lookAt(Vector3Base eye, Vector3Base target, Vector3Base up)
  {
    final vz = eye.sub(target).normalize() as Vector3Base;
    final vx = up.crossProduct(vz).normalize() as Vector3Base;
    final vy = vz.crossProduct(vx);

    final result = zeroFactory();

    result.m0 = vx.x;
    result.m1 = vy.x;
    result.m2 = vz.x;

    result.m4 = vx.y;
    result.m5 = vy.y;
    result.m6 = vz.y;

    result.m8 = vx.z;
    result.m9 = vy.z;
    result.m10 = vz.z;

    result.m12 = vx.dotProduct(eye);
    result.m13 = vy.dotProduct(eye);
    result.m14 = vz.dotProduct(eye);
    result.m15 = 1.0;

    return result;
  }

  /// Returns a scaling matrix for the given [x], [y], [z] factors.
  static MatrixBase scale(double x, double y, double z) => createFactory(
    x, 0, 0, 0,
    0, y, 0, 0,
    0, 0, z, 0,
    0, 0, 0, 1,
  );

  /// Returns a translation matrix for the given [x], [y], [z] offsets.
  static MatrixBase translate(num x, num y, num z) => createFactory(
    1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 1, 0,
    x.toDouble(), y.toDouble(), z.toDouble(), 1,
  );
  
  /// Returns a translation matrix from [v]'s components. Convenience wrapper for [translate].
  static MatrixBase translateVector3(Vector3Base v) => translate(v.x, v.y, v.z);

  /// Returns a rotation matrix around [axis] by [angle] radians.
  static MatrixBase rotateAngle(Vector3Base axis, double angle) {
    double x = axis.x, y = axis.y, z = axis.z;

    final lengthSquared = x*x + y*y + z*z;

    if ((lengthSquared != 1.0) && (lengthSquared != 0.0))
    {
      final ilength = 1.0/math.sqrt(lengthSquared);
      x *= ilength;
      y *= ilength;
      z *= ilength;
    }

    final sinres = math.sin(angle);
    final cosres = math.cos(angle);
    final t = 1.0 - cosres;

    final result = zeroFactory();

    result.m0 = x*x*t + cosres;
    result.m1 = y*x*t + z*sinres;
    result.m2 = z*x*t - y*sinres;

    result.m4 = x*y*t - z*sinres;
    result.m5 = y*y*t + cosres;
    result.m6 = z*y*t + x*sinres;

    result.m8 = x*z*t + y*sinres;
    result.m9 = y*z*t - x*sinres;
    result.m10 = z*z*t + cosres;

    result.m15 = 1.0;

    return result;
  }

  /// Returns a rotation matrix applied in X > Y > Z order from [angle]'s components (in radians).
  static MatrixBase rotateXYZ(Vector3Base angle) {
    final result = identity();

    final cosz = math.cos(-angle.z);
    final sinz = math.sin(-angle.z);
    final cosy = math.cos(-angle.y);
    final siny = math.sin(-angle.y);
    final cosx = math.cos(-angle.x);
    final sinx = math.sin(-angle.x);

    result.m0 = cosz*cosy;
    result.m1 = (cosz*siny*sinx) - (sinz*cosx);
    result.m2 = (cosz*siny*cosx) + (sinz*sinx);

    result.m4 = sinz*cosy;
    result.m5 = (sinz*siny*sinx) + (cosz*cosx);
    result.m6 = (sinz*siny*cosx) - (cosz*sinx);

    result.m8 = -siny;
    result.m9 = cosy*sinx;
    result.m10= cosy*cosx;

    return result;
  }

  /// Returns a rotation matrix applied in Z > Y > X order from [angle]'s components (in radians).
  static MatrixBase rotateZYX(Vector3Base angle) {
    final result = zeroFactory();

    final cz = math.cos(angle.z);
    final sz = math.sin(angle.z);
    final cy = math.cos(angle.y);
    final sy = math.sin(angle.y);
    final cx = math.cos(angle.x);
    final sx = math.sin(angle.x);

    result.m0 = cz*cy;
    result.m4 = cz*sy*sx - cx*sz;
    result.m8 = sz*sx + cz*cx*sy;

    result.m1 = cy*sz;
    result.m5 = cz*cx + sz*sy*sx;
    result.m9 = cx*sz*sy - cz*sx;

    result.m2 = -sy;
    result.m6 = cy*sx;
    result.m10 = cy*cx;

    result.m15 = 1;

    return result;
  }

  /// Returns a perspective projection matrix defined by the given frustum planes.
  static MatrixBase frustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) {
    final result = zeroFactory();

    final rl = right - left;
    final tb = top - bottom;
    final fn = farPlane - nearPlane;

    result.m0 = (nearPlane*2.0)/rl;
    result.m5 = (nearPlane*2.0)/tb;
    result.m8 = (right + left)/rl;
    result.m9 = (top + bottom)/tb;
    result.m10 = -(farPlane + nearPlane)/fn;
    result.m11 = -1.0;
    result.m14 = -(farPlane*nearPlane*2.0)/fn;

    return result;
  }

  /// Returns a perspective projection matrix from a vertical FOV [fovY] (in radians), [aspect] ratio, and clip planes.
  static MatrixBase perspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) {
    final top = nearPlane*math.tan(fovY*0.5);
    final right = top*aspect;

    return frustum(-right, right, -top, top, nearPlane, farPlane);
  }

  /// Returns an orthographic projection matrix defined by the given clip planes.
  static MatrixBase ortho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) {
    final result = zeroFactory();

    final rl = right - left;
    final tb = top - bottom;
    final fn = farPlane - nearPlane;

    result.m0 = 2.0/rl;
    result.m5 = 2.0/tb;
    result.m10 = -2.0/fn;
    result.m12 = -(left + right)/rl;
    result.m13 = -(top + bottom)/tb;
    result.m14 = -(farPlane + nearPlane)/fn;
    result.m15 = 1.0;

    return result;
  }

  /// Returns a rotation matrix around the X axis by [angle] radians.
  static MatrixBase rotateX(double angle) {
    final result = identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m5 = cosres;
    result.m6 = sinres;
    result.m9 = -sinres;
    result.m10 = cosres;

    return result;
  }

  /// Returns a rotation matrix around the Y axis by [angle] radians.
  static MatrixBase rotateY(double angle) {
    final result = identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m0 = cosres;
    result.m2 = -sinres;
    result.m8 = sinres;
    result.m10 = cosres;

    return result;
  }

  /// Returns a rotation matrix around the Z axis by [angle] radians.
  static MatrixBase rotateZ(double angle) {
    final result = identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m0 = cosres;
    result.m1 = sinres;
    result.m4 = -sinres;
    result.m5 = cosres;

    return result;
  }

  /// Returns the rotation matrix equivalent of quaternion [q].
  static MatrixBase fromQuaternion(QuaternionBase q) {
    final result = identity();

    final a2 = q.x*q.x;
    final b2 = q.y*q.y;
    final c2 = q.z*q.z;
    final ac = q.x*q.z;
    final ab = q.x*q.y;
    final bc = q.y*q.z;
    final ad = q.w*q.x;
    final bd = q.w*q.y;
    final cd = q.w*q.z;

    result.m0 = 1 - 2*(b2 + c2);
    result.m1 = 2*(ab + cd);
    result.m2 = 2*(ac - bd);

    result.m4 = 2*(ab - cd);
    result.m5 = 1 - 2*(a2 + c2);
    result.m6 = 2*(bc + ad);

    result.m8 = 2*(ac + bd);
    result.m9 = 2*(bc - ad);
    result.m10 = 1 - 2*(a2 + b2);

    return result;
  }
}