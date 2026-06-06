// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [Vector3Base] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
///
/// ---
///
/// A 3D vector with [x], [y], and [z] components.
mixin Vector3Base<
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<V3> {

  V3 get _this => this as V3;
  // ignore: unused_element
  V3 get _v3Zero => RaylibVector3Factories.zeroFactory() as V3;
  V3 _v3(num x, num y, num z) => RaylibVector3Factories.createFactory(x, y, z) as V3;

  /// X component
  abstract double x;

  /// Y component
  abstract double y;

  /// Z component
  abstract double z;

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble], truncating any fractional part.
  /// 
  /// Returns this instance for fluent chaining.
  V3 set(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    return _this;
  }

  /// Euclidean distance between this vector and [o].
  double distance(V3 o) => math.sqrt(distanceSqr(o));
  
  /// Squared Euclidean distance between this vector and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(V3 o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z);
  
  /// Dot product of this vector and [o].
  double dotProduct(V3 o) => x * o.x + y * o.y + z * o.z;
  
  /// Euclidean length (magnitude) of this vector.
  double get length => math.sqrt(lengthSqr);
  
  /// Squared length of this vector.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y + z * z;
  
  /// Angle between this vector and [o] in radians, in the range `[0, π]`.
  ///
  /// Computed via `atan2(|cross|, dot)` for numerical stability.
  double angle(V3 o) {
    final cross = _v3(
      y*o.z - z*o.y,
      z*o.x - x*o.z,
      x*o.y - y*o.x
    );
    return math.atan2(cross.length, dotProduct(o));
  }

  /// Returns a formatted string representation of this vector.
  ///
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0] and [z0].
  ///
  /// Example: `[ <x>, <y>, <z> ]`
  String format([int x0 = 0, int? y0, int? z0]) =>
    '[ '
      '${x.toStringAsFixed(x0)}, '
      '${y.toStringAsFixed(y0 ?? x0)}, '
      '${z.toStringAsFixed(z0 ?? x0)} '
    ']';
  
  /// Returns a new vector that is the component-wise sum of this and [o].
  V3 add(V3 o) => _v3(x + o.x, y + o.y, z + o.z);
  
  /// Returns a new vector with [value] added to each component.
  V3 addValue(num value) => _v3(x + value, y + value, z + value);
  
  /// Returns a new vector that is the component-wise difference of this and [o].
  V3 sub(V3 o) => _v3(x - o.x, y - o.y, z - o.z);
  
  /// Returns a new vector with [value] subtracted from each component.
  V3 subValue(num value) => _v3(x - value, y - value, z - value);
  
  /// Returns a new vector with all components scaled by [o].
  V3 scale(num o) => _v3(x * o, y * o, z * o);
  
  /// Returns a new vector that is the component-wise product of this and [o].
  V3 mul(V3 o) => _v3(x * o.x, y * o.y, z * o.z);
  
  /// Returns a new vector with all components divided by [o].
  V3 divideBy(num o) => scale(1 / o);
  
  /// Returns a new vector that is the component-wise quotient of this and [o].
  V3 div(V3 o) => _v3(x / o.x, y / o.y, z / o.z);
  
  /// Returns a new vector with all components negated.
  V3 negate() => _v3(-x, -y, -z);
  
  /// Transforms this vector by matrix [o].
  ///
  /// Applies the full 4x4 affine transformation; the W component is
  /// implicitly treated as 1 (i.e. the translation column is applied).
  V3 transform(M o) => _v3(
    o.m0*x + o.m4*y + o.m8*z + o.m12,
    o.m1*x + o.m5*y + o.m9*z + o.m13,
    o.m2*x + o.m6*y + o.m10*z + o.m14,
  );

  /// Projects this vector onto [o].
  ///
  /// Returns the component of this vector that is parallel to [o].
  V3 project(V3 o) {
    final v1dv2 = (x*o.x + y*o.y + z*o.z);
    final v2dv2 = (o.x*o.x + o.y*o.y + o.z*o.z);
    final mag = v1dv2/v2dv2;
    return _v3(
      o.x*mag,
      o.y*mag,
      o.z*mag,
    );
  }

  /// Rejects [o] from this vector.
  ///
  /// Returns the component of this vector that is perpendicular to [o].
  /// Complement of [project]: `project(o).add(reject(o)) == this`.
  V3 reject(V3 o) {
    final v1dv2 = (x*o.x + y*o.y + z*o.z);
    final v2dv2 = (o.x*o.x + o.y*o.y + o.z*o.z);
    final mag = v1dv2/v2dv2;
    return _v3(
      x - (o.x*mag),
      y - (o.y*mag),
      z - (o.z*mag),
    );
  }

  /// Reflects this vector off a surface with the given [normal].
  ///
  /// [normal] is assumed to be normalized.
  V3 reflect(V3 normal) {
    final dot = dotProduct(normal);
    return _v3(
      x - (2.0*normal.x)*dot,
      y - (2.0*normal.y)*dot,
      z - (2.0*normal.z)*dot,
    );
  }

  /// Returns a new vector with each component being the component-wise minimum of this and [o].
  V3 min(V3 o) => _v3(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
  );

  /// Returns a new vector with each component being the component-wise maximum of this and [o].
  V3 max(V3 o) => _v3(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
  );

  /// Cross product of this vector and [o].
  ///
  /// Returns a vector perpendicular to both, following the right-hand rule.
  V3 crossProduct(V3 o) => _v3(
    y*o.z - z*o.y,
    z*o.x - x*o.z,
    x*o.y - y*o.x
  );

  /// Returns a normalized (unit-length) copy of this vector.
  ///
  /// Returns a copy of this vector unchanged if [length] is zero.
  V3 normalize() {
    final length = this.length;
    if (length != 0.0)
    {
      final ilength = 1.0/length;
      return _v3(
        x * ilength,
        y * ilength,
        z * ilength,
      );
    }

    return _v3(x, y, z);
  }

  /// Orthonormalizes this vector against [o] using the Gram-Schmidt process.
  ///
  /// Normalizes `this` in place via [setD], then returns a vector
  /// perpendicular to the normalized `this` in the plane of `this` and [o].
  V3 orthoNormalize(V3 o) {
    final n1 = normalize();
    final vn1 = n1.crossProduct(o).normalize();
    setD(n1);
    return vn1.crossProduct(n1);
  }

  /// Rotates this vector around [axis] by [angle] radians.
  ///
  /// Uses the Rodrigues rotation formula via quaternion half-angle.
  /// [axis] is normalized internally.
  V3 rotateByAxisAngle(V3 axis, double angle) {
    final w = axis.normalize().scale(math.sin(angle / 2.0));
    final wv = w.crossProduct(_this);
    final wwv = w.crossProduct(wv).scale(2);
    return add(wv.scale(2 * math.cos(angle / 2.0))).add(wwv);
  }

  /// Moves this vector towards [target] by at most [maxDistance].
  ///
  /// Returns [target] directly if already within [maxDistance].
  V3 moveTowards(V3 target, double maxDistance) {
    final dx = target.x - x;
    final dy = target.y - y;
    final dz = target.z - z;
    final value = (dx*dx) + (dy*dy) + (dz*dz);

    if (
      (value == 0) ||
      ((maxDistance >= 0) && (value <= maxDistance*maxDistance))
    ) return target;

    final dist = math.sqrt(value);

    return _v3(
      x + dx/dist*maxDistance,
      y + dy/dist*maxDistance,
      z + dz/dist*maxDistance,
    );
  }

  /// Linear interpolation between this and [o] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  V3 lerp(V3 o, double amount) => _v3(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
  );

  /// Clamps each component of this vector between the corresponding components of [min] and [max].
  V3 clamp(V3 min, V3 max) => _v3(
    math.min(max.x, math.max(min.x, x)),
    math.min(max.y, math.max(min.y, y)),
    math.min(max.z, math.max(min.z, z)),
  );

  /// Clamps the length of this vector to the range `[min, max]`.
  ///
  /// Returns `this` unchanged if [lengthSqr] is zero.
  V3 clampValue(double min, double max) {
    double length = lengthSqr;
    if (length > 0.0) {
      length = math.sqrt(length);

      double scale = 1;
      if (length < min) {
        scale = min/length;
      } else if (length > max) {
        scale = max/length;
      }

      return this.scale(scale);
    }

    return _this;
  }

  /// Returns `true` if this vector is approximately equal to [o].
  ///
  /// Uses epsilon-based per-component comparison scaled to the magnitude
  /// of the compared values.
  bool equals(V3 o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs()))));

  /// Interpolates along a cubic Hermite spline between this and [v2].
  ///
  /// [tangent1] is the outgoing tangent at this point,
  /// [tangent2] is the incoming tangent at [v2],
  V3 cubicHermite(V3 tangent1, V3 v2, V3 tangent2, double amount) {
    final p2 = amount*amount;
    final p3 = amount*amount*amount;

    return _v3(
      (2*p3 - 3*p2 + 1)*x + (p3 - 2*p2 + amount)*tangent1.x + (-2*p3 + 3*p2)*v2.x + (p3 - p2)*tangent2.x,
      (2*p3 - 3*p2 + 1)*y + (p3 - 2*p2 + amount)*tangent1.y + (-2*p3 + 3*p2)*v2.y + (p3 - p2)*tangent2.y,
      (2*p3 - 3*p2 + 1)*z + (p3 - 2*p2 + amount)*tangent1.z + (-2*p3 + 3*p2)*v2.z + (p3 - p2)*tangent2.z,
    );
  }

  /// Returns a new vector with `this` rotated by quaternion [q].
  V3 rotateByQuaternion(Q q) => _v3(
    x*(q.x*q.x + q.w*q.w - q.y*q.y - q.z*q.z) + y*(2*q.x*q.y - 2*q.w*q.z) + z*(2*q.x*q.z + 2*q.w*q.y),
    x*(2*q.w*q.z + 2*q.x*q.y) + y*(q.w*q.w - q.x*q.x + q.y*q.y - q.z*q.z) + z*(-2*q.w*q.x + 2*q.y*q.z),
    x*(-2*q.w*q.y + 2*q.x*q.z) + y*(2*q.w*q.x + 2*q.y*q.z)+ z*(q.w*q.w - q.x*q.x - q.y*q.y + q.z*q.z),
  );

  /// Returns a new vector with each component replaced by its reciprocal (`1/x`, `1/y`, `1/z`).
  V3 invert() => _v3(1.0/x, 1.0/y, 1.0/z);

  /// Refracts this vector through a surface with normal [n] and ratio [r].
  ///
  /// [r] is the ratio of indices of refraction (`n1 / n2`).
  /// Returns `this` unchanged if total internal reflection occurs
  /// (i.e. the discriminant is negative).
  V3 refract(V3 n, double r) {
    final dot = dotProduct(n);
    double d = 1.0 - r*r*(1.0 - dot*dot);

    if (d >= 0.0) {
      d = math.sqrt(d);
      return _v3(
        r*x - (r*dot + d)*n.x,
        r*y - (r*dot + d)*n.y,
        r*z - (r*dot + d)*n.z,
      );
    }

    return _this;
  }

  /// Unprojects this screen-space vector back into world space.
  ///
  /// [projection] and [view] are the camera's projection and view matrices.
  /// Internally multiplies and inverts the combined view-projection matrix,
  /// then applies a perspective divide.
  V3 unproject(M projection, M view) {
    final matViewProj = view.mul(projection).invert();
    final qtransformed = RaylibQuaternionFactories.createFactory(x, y, z, 1.0).transform(matViewProj);
    return _v3(
      qtransformed.x/qtransformed.w,
      qtransformed.y/qtransformed.w,
      qtransformed.z/qtransformed.w,
    );
  }

  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y, z]`
  List<double> toArray() => [x, y, z];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1})';
}