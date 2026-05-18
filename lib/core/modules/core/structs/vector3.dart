// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [Vector3Base] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin Vector3Base<
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<V3> {

  V3 _v3(num x, num y, num z) => RaylibVector3Factories.createFactory(x, y, z) as V3;
  // ignore: unused_element
  V3 get _v3Zero => RaylibVector3Factories.zeroFactory() as V3;
  V3 get _this => this as V3;

  abstract double x;
  abstract double y;
  abstract double z;

  V3 set(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    return _this;
  }

  double distance(V3 o) => math.sqrt(distanceSqr(o));
  double distanceSqr(V3 o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z);
  double dotProduct(V3 o) => x * o.x + y * o.y + z * o.z;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y + z * z;
  double angle(V3 o) {
    final cross = _v3(
      y*o.z - z*o.y,
      z*o.x - x*o.z,
      x*o.y - y*o.x
    );
    return math.atan2(cross.length, dotProduct(o));
  }
  String format([int x0 = 0, int? y0, int? z0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)} ]';

  V3 add(V3 o) => _v3(x + o.x, y + o.y, z + o.z);
  V3 addValue(num value) => _v3(x + value, y + value, z + value);
  V3 sub(V3 o) => _v3(x - o.x, y - o.y, z - o.z);
  V3 subValue(num value) => _v3(x - value, y - value, z - value);
  V3 scale(num o) => _v3(x * o, y * o, z * o);
  V3 mul(V3 o) => _v3(x * o.x, y * o.y, z * o.z);
  V3 divideBy(num o) => scale(1 / o);
  V3 div(V3 o) => _v3(x / o.x, y / o.y, z / o.z);
  V3 negate() => _v3(-x, -y, -z);
  V3 transform(M o) => _v3(
    o.m0*x + o.m4*y + o.m8*z + o.m12,
    o.m1*x + o.m5*y + o.m9*z + o.m13,
    o.m2*x + o.m6*y + o.m10*z + o.m14,
  );
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
  V3 reflect(V3 normal) {
    final dot = dotProduct(normal);
    return _v3(
      x - (2.0*normal.x)*dot,
      y - (2.0*normal.y)*dot,
      z - (2.0*normal.z)*dot,
    );
  }
  V3 min(V3 o) => _v3(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
  );
  V3 max(V3 o) => _v3(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
  );
  V3 crossProduct(V3 o) => _v3(
    y*o.z - z*o.y,
    z*o.x - x*o.z,
    x*o.y - y*o.x
  );
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

  V3 orthoNormalize(V3 o) {
    final n1 = normalize();
    final vn1 = n1.crossProduct(o).normalize();
    setD(n1);
    return vn1.crossProduct(n1);
  }
  V3 rotateByAxisAngle(V3 axis, double angle) {
    final w = axis.normalize().scale(math.sin(angle / 2.0));
    final wv = w.crossProduct(_this);
    final wwv = w.crossProduct(wv).scale(2);
    return add(wv.scale(2 * math.cos(angle / 2.0))).add(wwv);
  }
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
  V3 lerp(V3 o, double amount) => _v3(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
  );
  V3 clamp(V3 min, V3 max) => _v3(
    math.min(max.x, math.max(min.x, x)),
    math.min(max.y, math.max(min.y, y)),
    math.min(max.z, math.max(min.z, z)),
  );
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

  bool equals(V3 o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs()))));

  V3 cubicHermite(V3 tangent1, V3 v2, V3 tangent2, double amount) {
    final p2 = amount*amount;
    final p3 = amount*amount*amount;

    return _v3(
      (2*p3 - 3*p2 + 1)*x + (p3 - 2*p2 + amount)*tangent1.x + (-2*p3 + 3*p2)*v2.x + (p3 - p2)*tangent2.x,
      (2*p3 - 3*p2 + 1)*y + (p3 - 2*p2 + amount)*tangent1.y + (-2*p3 + 3*p2)*v2.y + (p3 - p2)*tangent2.y,
      (2*p3 - 3*p2 + 1)*z + (p3 - 2*p2 + amount)*tangent1.z + (-2*p3 + 3*p2)*v2.z + (p3 - p2)*tangent2.z,
    );
  }
  V3 rotateByQuaternion(Q q) => _v3(
    x*(q.x*q.x + q.w*q.w - q.y*q.y - q.z*q.z) + y*(2*q.x*q.y - 2*q.w*q.z) + z*(2*q.x*q.z + 2*q.w*q.y),
    x*(2*q.w*q.z + 2*q.x*q.y) + y*(q.w*q.w - q.x*q.x + q.y*q.y - q.z*q.z) + z*(-2*q.w*q.x + 2*q.y*q.z),
    x*(-2*q.w*q.y + 2*q.x*q.z) + y*(2*q.w*q.x + 2*q.y*q.z)+ z*(q.w*q.w - q.x*q.x - q.y*q.y + q.z*q.z),
  );

  V3 invert() => _v3(1.0/x, 1.0/y, 1.0/z);

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

  V3 unproject(M projection, M view) {
    final matViewProj = view.mul(projection).invert();
    final qtransformed = RaylibQuaternionFactories.createFactory(x, y, z, 1.0).transform(matViewProj);
    return _v3(
      qtransformed.x/qtransformed.w,
      qtransformed.y/qtransformed.w,
      qtransformed.z/qtransformed.w,
    );
  }

  List<double> toArray() => [x, y, z];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1})';
}