// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [Vector2Base] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin Vector2Base<
  V2 extends Vector2Base<V2, M, V3, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<V2> {

  V2 _v2(num x, num y) => RaylibVector2Factories.createFactory(x, y) as V2;
  V2 get _v2Zero => RaylibVector2Factories.zeroFactory() as V2;
  V2 get _this => this as V2;

  abstract double x;
  abstract double y;

  double distance(V2 o) => math.sqrt(distanceSqr(o));
  double distanceSqr(V2 o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y);
  double dotProduct(V2 o) => x * o.x + y * o.y;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y;
  double angle(V2 o) => math.atan2(x*o.y - y*o.x, x*o.x + y*o.y);
  double lineAngle(V2 o) => -math.atan2(o.y - y, o.x - x);
  String format([int x0 = 0, int? y0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)} ]';

  V2 set(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    return _this;
  }

  V2 add(V2 o) => _v2(x + o.x, y + o.y);
  V2 addValue(num value) => _v2(x + value, y + value);
  V2 sub(V2 o) => _v2(x - o.x, y - o.y);
  V2 subValue(num value) => _v2(x - value, y - value);
  V2 scale(num o) => _v2(x * o, y * o);
  V2 negate() => _v2(-x, -y);
  V2 mul(V2 o) => _v2(x * o.x, y * o.y);
  V2 divideBy(num o) => scale(1 / o);
  V2 div(V2 o) => _v2(x / o.x, y / o.y);
  V2 transform(M o) => _v2(
    o.m0*x + o.m4*y + o.m8*0 + o.m12,
    o.m1*x + o.m5*y + o.m9*0 + o.m13
  );
  V2 normalize()
  {
    double length = this.length;
    if (length > 0) {
      double ilength = 1.0/length;
      return _v2(x*ilength, y*ilength);
    }
    return _v2Zero;
  }
  V2 lerp(V2 o, double amount) => _v2(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
  );
  V2 reflect(V2 normal) {
    double dot = dotProduct(normal);
    return _v2(
      x - (2.0*normal.x)*dot,
      y - (2.0*normal.y)*dot,
    );
  }
  V2 min(V2 o) => _v2(
    math.min(x, o.x),
    math.min(y, o.y),
  );
  V2 max(V2 o) => _v2(
    math.max(x, o.x),
    math.max(y, o.y),
  );
  V2 clamp(V2 min, V2 max) => _v2(
    math.min(max.x, math.max(min.x, x)),
    math.min(max.y, math.max(min.y, y)),
  );
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
  V2 rotate(double angle) {
    final cosres = math.cos(angle);
    final sinres = math.sin(angle);
    return _v2(
      x*cosres - y*sinres,
      x*sinres + y*cosres,
    );
  }
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

  V2 invert() => _v2(1.0/x, 1.0/y);

  bool equals(V2 o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs()))));

  List<double> toArray() => [x, y];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1})';
}
