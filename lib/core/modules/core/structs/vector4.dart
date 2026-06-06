// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [Vector4Base] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
///
/// ---
///
/// A 4D vector with [x], [y], [z], and [w] components.
///
/// Also serves as the underlying representation for [QuaternionBase];
/// see [toQuaternion].
mixin Vector4Base<
  V4 extends Vector4Base<V4, Q, M, V3>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>

> on RaylibStructObjectBase<V4> {

  V4 get _this => this as V4;
  // ignore: unused_element
  V4 get _v4Zero => RaylibVector4Factories.zeroFactory() as V4;
  V4 _v4(num x, num y, num z, num w) => RaylibVector4Factories.createFactory(x, y, z, w) as V4;

  /// X component
  abstract double x;

  /// Y component
  abstract double y;

  /// Z component
  abstract double z;

  /// W component
  abstract double w;

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble], truncating any fractional part.
  /// 
  /// Returns this instance for fluent chaining.
  V4 set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return _this;
  }

  /// Euclidean distance between this vector and [o].
  double distance(V4 o) => math.sqrt(distanceSqr(o));
  
  /// Squared Euclidean distance between this vector and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(V4 o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);
  
  /// Dot product of this vector and [o].
  double dotProduct(V4 o) => x * o.x + y * o.y + z * o.z + w * o.w;
  
  /// Euclidean length (magnitude) of this vector.
  double get length => math.sqrt(lengthSqr);
  
  /// Squared length of this vector.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y + z * z + w * w;

  /// Returns a formatted string representation of this vector.
  ///
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0], [z0], and [w0].
  ///
  /// Example: `[ <x>, <y>, <z>, <w> ]`
  String format([int x0 = 0, int? y0, int? z0, int? w0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)}, ${w.toStringAsFixed(w0 ?? x0)} ]';

  /// Returns a new vector that is the component-wise sum of this and [o].
  V4 add(V4 o) => _v4(x + o.x, y + o.y, z + o.z, w + o.w);
  
  /// Returns a new vector with [value] added to each component.
  V4 addValue(num value) => _v4(x + value, y + value, z + value, w + value);
  
  /// Returns a new vector that is the component-wise difference of this and [o].
  V4 sub(V4 o) => _v4(x - o.x, y - o.y, z - o.z, w - o.w);
  
  /// Returns a new vector with [value] subtracted from each component.
  V4 subValue(num value) => _v4(x - value, y - value, z - value, w - value);
  
  /// Returns a new vector with all components scaled by [o].
  V4 scale(num o) => _v4(x * o, y * o, z * o, w * o);
  
  /// Returns a new vector that is the component-wise product of this and [o].
  V4 mul(V4 o) => _v4(x * o.x, y * o.y, z * o.z, w * o.w);
  
  /// Returns a new vector with all components divided by [o].
  V4 divideBy(num o) => scale(1 / o);
  
  /// Returns a new vector that is the component-wise quotient of this and [o].
  V4 div(V4 o) => _v4(x / o.x, y / o.y, z / o.z, w / o.w);
  
  /// Returns a new vector with all components negated.
  V4 negate() => _v4(-x, -y, -z, -w);
  
  /// Returns a normalized (unit-length) copy of this vector.
  ///
  /// If [length] is zero, treats it as 1 to avoid division by zero.
  V4 normalize() {
    double length = this.length;
    if (length == 0.0) length = 1.0;
    final ilength = 1.0/length;
    return _v4(
      x*ilength,
      y*ilength,
      z*ilength,
      w*ilength,
    );
  }

  /// Returns a new vector with each component being the component-wise minimum of this and [o].
  V4 min(V4 o) => _v4(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
    math.min(w, o.w),
  );

  /// Returns a new vector with each component being the component-wise maximum of this and [o].
  V4 max(V4 o) => _v4(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
    math.max(w, o.w),
  );

  /// Linear interpolation between this and [o] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  V4 lerp(V4 o, double amount) => _v4(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
    w + amount*(o.w - w),
  );

  /// Moves this vector towards [target] by at most [maxDistance].
  ///
  /// Returns [target] directly if already within [maxDistance].
  V4 moveTowards(V4 target, double maxDistance) {
    final dx = target.x - x;
    final dy = target.y - y;
    final dz = target.z - z;
    final dw = target.w - w;
    final value = (dx*dx) + (dy*dy) + (dz*dz) + (dw*dw);

    if (
      (value == 0) ||
      ((maxDistance >= 0) && (value <= maxDistance*maxDistance))
    ) return target;

    final dist = math.sqrt(value);

    return _v4(
      x + dx/dist*maxDistance,
      y + dy/dist*maxDistance,
      z + dz/dist*maxDistance,
      w + dw/dist*maxDistance,
    );
  }

  /// Returns a new vector with each component replaced by its reciprocal.
  V4 invert() => _v4(1.0/x, 1.0/y, 1.0/z, 1.0/w);

  /// Returns `true` if this vector is approximately equal to [o].
  ///
  /// Uses epsilon-based per-component comparison scaled to the magnitude
  /// of the compared values.
  bool equals(V4 o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w - o.w).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))));

  /// Converts this vector to a quaternion with the same `(x, y, z, w)` components.
  Q toQuaternion() => RaylibQuaternionFactories.fromVector4(this) as Q;

  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y, z, w]`
  List<double> toArray() => [x, y, z, w];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1}, w: ${w.f1})';
}