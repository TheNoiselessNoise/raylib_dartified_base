// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [Vector2Base] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
///
/// ---
///
/// A 2D vector with [x] and [y] components.
mixin Vector2Base<
  V2 extends Vector2Base<V2, M, V3, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<V2> {

  V2 get _this => this as V2;
  V2 get _v2Zero => RaylibVector2Factories.zeroFactory() as V2;
  V2 _v2(num x, num y) => RaylibVector2Factories.createFactory(x, y) as V2;

  /// X component
  abstract double x;

  /// Y component
  abstract double y;

  /// Euclidean distance between this vector and [o].
  double distance(V2 o) => math.sqrt(distanceSqr(o));

  /// Squared Euclidean distance between this vector and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(V2 o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y);
  
  /// Dot product of this vector and [o].
  double dotProduct(V2 o) => x * o.x + y * o.y;
  
  /// Euclidean length (magnitude) of this vector.
  double get length => math.sqrt(lengthSqr);
  
  /// Squared length of this vector.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y;
  
  /// Angle between this vector and [o] in radians.
  ///
  /// Returns the signed angle measured from this vector to [o],
  /// in the range `(-π, π]`.
  double angle(V2 o) => math.atan2(x*o.y - y*o.x, x*o.x + y*o.y);
  
  /// Angle of the line from this point to [o], relative to the X axis.
  ///
  /// Equivalent to `-atan2(dy, dx)`. Useful for screen-space direction.
  double lineAngle(V2 o) => -math.atan2(o.y - y, o.x - x);
  
  /// Returns a formatted string representation of this vector.
  ///
  /// [x0] sets the default precision for all components; [y0] overrides
  /// the precision for the Y component.
  ///
  /// Example: `[ <x>, <y> ]`
  String format([int x0 = 0, int? y0]) =>
    '[ '
      '${x.toStringAsFixed(x0)}, '
      '${y.toStringAsFixed(y0 ?? x0)} '
    ']';

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble], truncating any fractional part.
  /// 
  /// Returns this instance for fluent chaining.
  V2 set(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    return _this;
  }

  /// Returns a new vector that is the component-wise sum of this and [o].
  V2 add(V2 o) => _v2(x + o.x, y + o.y);

  /// Returns a new vector with [value] added to each component.
  V2 addValue(num value) => _v2(x + value, y + value);
  
  /// Returns a new vector that is the component-wise difference of this and [o].
  V2 sub(V2 o) => _v2(x - o.x, y - o.y);
  
  /// Returns a new vector with [value] subtracted from each component.
  V2 subValue(num value) => _v2(x - value, y - value);
  
  /// Returns a new vector with all components scaled by [o].
  V2 scale(num o) => _v2(x * o, y * o);
  
  /// Returns a new vector with all components negated.
  V2 negate() => _v2(-x, -y);
  
  /// Returns a new vector that is the component-wise product of this and [o].
  V2 mul(V2 o) => _v2(x * o.x, y * o.y);
  
  /// Returns a new vector with all components divided by [o].
  V2 divideBy(num o) => scale(1 / o);
  
  /// Returns a new vector that is the component-wise quotient of this and [o].
  V2 div(V2 o) => _v2(x / o.x, y / o.y);
  
  /// Transforms this vector by matrix [o].
  ///
  /// Applies the 2D affine transformation encoded in the top-left 2x2 portion
  /// of [o] plus the translation column (`m12`, `m13`). The Z component is
  /// treated as 0.
  V2 transform(M o) => _v2(
    o.m0*x + o.m4*y + o.m8*0 + o.m12,
    o.m1*x + o.m5*y + o.m9*0 + o.m13
  );
  
  /// Returns a normalized (unit-length) copy of this vector.
  ///
  /// Returns the zero vector if [length] is 0.
  V2 normalize() {
    double length = this.length;
    if (length > 0) {
      double ilength = 1.0/length;
      return _v2(x*ilength, y*ilength);
    }
    return _v2Zero;
  }

  /// Linear interpolation between this and [o] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  V2 lerp(V2 o, double amount) => _v2(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
  );
  
  /// Reflects this vector off a surface with the given [normal].
  ///
  /// [normal] is assumed to be normalized.
  V2 reflect(V2 normal) {
    double dot = dotProduct(normal);
    return _v2(
      x - (2.0*normal.x)*dot,
      y - (2.0*normal.y)*dot,
    );
  }
  
  /// Returns a new vector with each component being the component-wise minimum of this and [o].
  V2 min(V2 o) => _v2(
    math.min(x, o.x),
    math.min(y, o.y),
  );
  
  /// Returns a new vector with each component being the component-wise maximum of this and [o].
  V2 max(V2 o) => _v2(
    math.max(x, o.x),
    math.max(y, o.y),
  );
  
  /// Clamps each component of this vector between the corresponding components of [min] and [max].
  V2 clamp(V2 min, V2 max) => _v2(
    math.min(max.x, math.max(min.x, x)),
    math.min(max.y, math.max(min.y, y)),
  );
  
  /// Clamps the length of this vector to the range `[min, max]`.
  ///
  /// Returns `this` unchanged if [lengthSqr] is zero.
  V2 clampValue(double min, double max) {
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
  
  /// Rotates this vector by [angle] radians around the origin.
  V2 rotate(double angle) {
    final cosres = math.cos(angle);
    final sinres = math.sin(angle);
    return _v2(
      x*cosres - y*sinres,
      x*sinres + y*cosres,
    );
  }
  
  /// Moves this vector towards [target] by at most [maxDistance].
  ///
  /// Returns [target] directly if already within [maxDistance].
  V2 moveTowards(V2 target, double maxDistance) {
    final dx = target.x - x;
    final dy = target.y - y;
    final value = (dx*dx) + (dy*dy);

    if (
      (value == 0) ||
      ((maxDistance >= 0) && (value <= maxDistance*maxDistance))
    ) return target;

    final dist = math.sqrt(value);

    return _v2(
      x + dx/dist*maxDistance,
      y + dy/dist*maxDistance,
    );
  }

  /// Refracts this vector through a surface with normal [n] and ratio [r].
  ///
  /// [r] is the ratio of indices of refraction (`n1 / n2`).
  /// Returns `this` unchanged if total internal reflection occurs
  /// (i.e. the discriminant is negative).
  V2 refract(V2 n, double r) {
    final dot = dotProduct(n);
    double d = 1.0 - r*r*(1.0 - dot*dot);

    if (d >= 0.0) {
      d = math.sqrt(d);
      return _v2(
        r*x - (r*dot + d)*n.x,
        r*y - (r*dot + d)*n.y,
      );
    }

    return _this;
  }

  /// Returns a new vector with each component replaced by its reciprocal (`1/x`, `1/y`).
  V2 invert() => _v2(1.0/x, 1.0/y);

  /// Returns `true` if this vector is approximately equal to [o].
  ///
  /// Uses epsilon-based per-component comparison scaled to the magnitude
  /// of the compared values.
  bool equals(V2 o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs()))));


  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y]`
  List<double> toArray() => [x, y];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1})';
}
