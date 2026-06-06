// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [QuaternionBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
/// 
/// ---
/// 
/// A unit quaternion representing a 3D rotation as `xi + yj + zk + w`.
mixin QuaternionBase<
  Q extends QuaternionBase<Q, M, V3, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<Q> {

  Q get _this => this as Q;
  // ignore: unused_element
  Q get _qZero => RaylibQuaternionFactories.zeroFactory() as Q;
  Q _q(num x, num y, num z, num w) => RaylibQuaternionFactories.createFactory(x, y, z, w) as Q;

  /// Imaginary i component
  abstract double x;

  /// Imaginary j component
  abstract double y;

  /// Imaginary k component
  abstract double z;

  /// Real (scalar) component
  abstract double w;

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble], truncating any fractional part.
  /// 
  /// Returns this instance for fluent chaining.
  Q set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return _this;
  }

  /// Euclidean distance between this quaternion and [o] in 4D space.
  double distance(Q o) => math.sqrt(distanceSqr(o));

  /// Squared Euclidean distance between this quaternion and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(Q o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);

  /// Dot product of this quaternion and [o].
  double dotProduct(Q o) => x * o.x + y * o.y + z * o.z + w * o.w;

  /// Euclidean length (magnitude) of this quaternion.
  double get length => math.sqrt(lengthSqr);

  /// Squared length of this quaternion.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y + z * z + w * w;

  /// Returns a formatted string representation of this quaternion.
  ///
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0], [z0], and [w0].
  ///
  /// Example: `[ <x>, <y>, <z>, <w> ]`
  String format([int x0 = 0, int? y0, int? z0, int? w0]) =>
    '[ '
      '${x.toStringAsFixed(x0)}, '
      '${y.toStringAsFixed(y0 ?? x0)}, '
      '${z.toStringAsFixed(z0 ?? x0)}, '
      '${w.toStringAsFixed(w0 ?? x0)} '
    ']';

  /// Returns a new quaternion that is the component-wise sum of this and [o].
  Q add(Q o) => _q(x + o.x, y + o.y, z + o.z, w + o.w);

  /// Returns a new quaternion with [value] added to each component.
  Q addValue(num value) => _q(x + value, y + value, z + value, w + value);

  /// Returns a new quaternion that is the component-wise difference of this and [o].
  Q sub(Q o) => _q(x - o.x, y - o.y, z - o.z, w - o.w);

  /// Returns a new quaternion with [value] subtracted from each component.
  Q subValue(num value) => _q(x - value, y - value, z - value, w - value);

  /// Returns a new quaternion with all components scaled by [o].
  Q scale(num o) => _q(x * o, y * o, z * o, w * o);

  /// Returns the Hamilton product of this quaternion and [o].
  ///
  /// Not commutative: `a.mul(b) != b.mul(a)`.
  Q mul(Q o) => _q(
    x*o.w + w*o.x + y*o.z - z*o.y,
    y*o.w + w*o.y + z*o.x - x*o.z,
    z*o.w + w*o.z + x*o.y - y*o.x,
    w*o.w - x*o.x - y*o.y - z*o.z,
  );

  /// Returns a new quaternion with all components divided by [o].
  Q divideBy(num o) => scale(1 / o);

  /// Returns a new quaternion that is the component-wise quotient of this and [o].
  Q div(Q o) => _q(x / o.x, y / o.y, z / o.z, w / o.w);

  /// Returns a new quaternion with all components negated.
  Q negate() => _q(-x, -y, -z, -w);

  /// Returns a normalized (unit-length) copy of this quaternion.
  ///
  /// If [length] is zero, treats it as 1 to avoid division by zero.
  Q normalize() {
    double length = this.length;
    if (length == 0.0) length = 1.0;
    final ilength = 1.0/length;
    return _q(x*ilength, y*ilength, z*ilength, w*ilength);
  }

  /// Returns a new quaternion with each component being the component-wise minimum of this and [o].
  Q min(Q o) => _q(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
    math.min(w, o.w),
  );

  /// Returns a new quaternion with each component being the component-wise maximum of this and [o].
  Q max(Q o) => _q(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
    math.max(w, o.w),
  );

  /// Linear interpolation between this and [o] by [amount] (component-wise).
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  Q lerp(Q o, double amount) => _q(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
    w + amount*(o.w - w),
  );

  /// Returns the inverse (conjugate divided by squared length) of this quaternion.
  ///
  /// Returns `this` unchanged if the squared length is zero.
  Q invert() {
    final lengthSq = x*x + y*y + z*z + w*w;

    if (lengthSq != 0.0) {
      final invLength = 1.0/lengthSq;

      return _q(
        x * -invLength,
        y * -invLength,
        z * -invLength,
        w * invLength,
      );
    }

    return _this;
  }

  /// Normalized linear interpolation between this and [o] by [amount].
  ///
  /// Faster than [sLerp] but does not maintain constant angular velocity.
  Q nLerp(Q o, double amount) => lerp(o, amount).normalize();

  /// Spherical linear interpolation between this and [o] by [amount].
  ///
  /// Maintains constant angular velocity along the shortest arc.
  /// Falls back to [nLerp] when the quaternions are nearly parallel
  /// (cosine > 0.95), and to a simple average when `sinHalfTheta` is
  /// near zero.
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  Q sLerp(Q o, double amount) {
    double cosHalfTheta = x*o.x + y*o.y + z*o.z + w*o.w;

    if (cosHalfTheta < 0)
    {
      o = _q(-o.x, -o.y, -o.z, -o.w);
      cosHalfTheta = -cosHalfTheta;
    }

    if (cosHalfTheta.abs() >= 1.0) return _this;
    else if (cosHalfTheta > 0.95) return nLerp(o, amount);
    else
    {
      final halfTheta = math.acos(cosHalfTheta);
      final sinHalfTheta = math.sqrt(1.0 - cosHalfTheta*cosHalfTheta);

      if (sinHalfTheta.abs() < RaylibConstants.EPSILON)
      {
        return _q(
          x*0.5 + o.x*0.5,
          y*0.5 + o.y*0.5,
          z*0.5 + o.z*0.5,
          w*0.5 + o.w*0.5,
        );
      }
      else
      {
        final ratioA = math.sin((1 - amount)*halfTheta)/sinHalfTheta;
        final ratioB = math.sin(amount*halfTheta)/sinHalfTheta;

        return _q(
          x*ratioA + o.x*ratioB,
          y*ratioA + o.y*ratioB,
          z*ratioA + o.z*ratioB,
          w*ratioA + o.w*ratioB,
        );
      }
    }
  }

  /// Interpolates along a cubic Hermite spline between this and [q2].
  ///
  /// [outTangent1] is the outgoing tangent at this point,
  /// [inTangent2] is the incoming tangent at [q2],
  /// [t] is the interpolation parameter in `[0.0, 1.0]`.
  ///
  /// Result is normalized.
  Q cubicHermiteSpline(
    Q outTangent1,
    Q q2,
    Q inTangent2,
    double t,
  ) {
    final t2 = t*t;
    final t3 = t2*t;
    final h00 = 2*t3 - 3*t2 + 1;
    final h10 = t3 - 2*t2 + t;
    final h01 = -2*t3 + 3*t2;
    final h11 = t3 - t2;

    Q p0 = scale(h00);
    Q m0 = outTangent1.scale(h10);
    Q p1 = q2.scale(h01);
    Q m1 = inTangent2.scale(h11);

    return p0.add(m0).add(p1).add(m1).normalize();
  }

  /// Converts this quaternion to an equivalent rotation matrix.
  M toMatrix() {
    M result = RaylibMatrixFactories.identity() as M;

    final a2 = x*x;
    final b2 = y*y;
    final c2 = z*z;
    final ac = x*z;
    final ab = x*y;
    final bc = y*z;
    final ad = w*x;
    final bd = w*y;
    final cd = w*z;

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

  /// Decomposes this quaternion into an axis–angle representation.
  ///
  /// Returns `(axis, angle)` where [angle] is in radians.
  /// If the quaternion represents a zero rotation, the axis defaults to `(1, 0, 0)`.
  (V3 outAxis, double outAngle) toAxisAngle() {
    final q = w.abs() > 1.0 ? normalize() : this;

    V3 resAxis = RaylibVector3Factories.zeroFactory() as V3;
    final resAngle = 2.0*math.acos(q.w);
    final den = math.sqrt(1.0 - q.w*q.w);

    if (den > RaylibConstants.EPSILON) {
      resAxis.x = q.x/den;
      resAxis.y = q.y/den;
      resAxis.z = q.z/den;
    } else {
      // This occurs when the angle is zero.
      // Not a problem: just set an arbitrary normalized axis.
      resAxis.x = 1.0;
    }

    return (resAxis, resAngle);
  }

  /// Converts this quaternion to Euler angles `(roll, pitch, yaw)` in radians.
  ///
  /// - X = roll (rotation around X axis)
  /// - Y = pitch (rotation around Y axis)
  /// - Z = yaw (rotation around Z axis)
  V3 toEuler() {
    // Roll (x-axis rotation)
    final x0 = 2.0*(w*x + y*z);
    final x1 = 1.0 - 2.0*(x*x + y*y);

    // Pitch (y-axis rotation)
    double y0 = 2.0*(w*y - z*x);
    y0 = y0 > 1.0 ? 1.0 : y0;
    y0 = y0 < -1.0 ? -1.0 : y0;

    // Yaw (z-axis rotation)
    final z0 = 2.0*(w*z + x*y);
    final z1 = 1.0 - 2.0*(y*y + z*z);

    return RaylibVector3Factories.createFactory(
      math.atan2(x0, x1),
      math.asin(y0),
      math.atan2(z0, z1),
    ) as V3;
  }

  /// Transforms this quaternion by the given matrix [mat].
  Q transform(M mat) => _q(
    mat.m0*x + mat.m4*y + mat.m8*z + mat.m12*w,
    mat.m1*x + mat.m5*y + mat.m9*z + mat.m13*w,
    mat.m2*x + mat.m6*y + mat.m10*z + mat.m14*w,
    mat.m3*x + mat.m7*y + mat.m11*z + mat.m15*w,
  );

  /// Returns `true` if this quaternion is approximately equal to [o].
  ///
  /// Uses epsilon-based comparison per component, and also considers
  /// `q == -q` as equal (both represent the same rotation).
  bool equals(Q o) => (
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w - o.w).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))))
  ) || (
    (((x + o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y + o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z + o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w + o.w).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))))
  );

  /// Converts this quaternion to a [V4] with the same `(x, y, z, w)` components.
  V4 toVector4() => RaylibVector4Factories.createFactory(x, y, z, w) as V4;

  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y, z, w]`
  List<double> toArray() => [x, y, z, w];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1}, w: ${w.f1})';
}