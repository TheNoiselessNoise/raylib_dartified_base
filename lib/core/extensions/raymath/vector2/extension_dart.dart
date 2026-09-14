part of '../../../raylib_dartified_base.dart';

// TODO: debug labels and `run`

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector2D] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibVector2ExtDart<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector2ExtDart(super.rl);

  /// See [Vector2D.zero].
  Vector2D Vector2Zero()
    => .zero();

  /// See [Vector2D.one].
  Vector2D Vector2One()
    => .one();

  /// See [Vector2D.add].
  Vector2D Vector2Add(
    Vector2D v1,
    Vector2D v2,
  ) => v1.add(v2);

  /// See [Vector2D.addValue].
  Vector2D Vector2AddValue(
    Vector2D v,
    double add,
  ) => v.addValue(add);

  /// See [Vector2D.sub].
  Vector2D Vector2Subtract(
    Vector2D v1,
    Vector2D v2,
  ) => v1.sub(v2);

  /// See [Vector2D.subValue].
  Vector2D Vector2SubtractValue(
    Vector2D v,
    double sub,
  ) => v.subValue(sub);

  /// See [Vector2D.length].
  double Vector2Length(
    Vector2D v,
  ) => v.length;

  /// See [Vector2D.lengthSqr].
  double Vector2LengthSqr(
    Vector2D v,
  ) => v.lengthSqr;

  /// See [Vector2D.dotProduct].
  double Vector2DotProduct(
    Vector2D v1,
    Vector2D v2,
  ) => v1.dotProduct(v2);

  /// See [Vector2D.crossProduct].
  double Vector2CrossProduct(
    Vector2D v1,
    Vector2D v2,
  ) => v1.crossProduct(v2);

  /// See [Vector2D.distance].
  double Vector2Distance(
    Vector2D v1,
    Vector2D v2,
  ) => v1.distance(v2);

  /// See [Vector2D.distanceSqr].
  double Vector2DistanceSqr(
    Vector2D v1,
    Vector2D v2,
  ) => v1.distanceSqr(v2);

  /// See [Vector2D.angle].
  double Vector2Angle(
    Vector2D v1,
    Vector2D v2,
  ) => v1.angle(v2);

  /// See [Vector2D.lineAngle].
  double Vector2LineAngle(
    Vector2D start,
    Vector2D end,
  ) => start.lineAngle(end);

  /// See [Vector2D.scale].
  Vector2D Vector2Scale(
    Vector2D v,
    double scale,
  ) => v.scale(scale);

  /// See [Vector2D.mul].
  Vector2D Vector2Multiply(
    Vector2D v1,
    Vector2D v2,
  ) => v1.mul(v2);

  /// See [Vector2D.negate].
  Vector2D Vector2Negate(
    Vector2D v,
  ) => v.negate();

  /// See [Vector2D.div].
  Vector2D Vector2Divide(
    Vector2D v1,
    Vector2D v2,
  ) => v1.div(v2);

  /// See [Vector2D.normalize].
  Vector2D Vector2Normalize(
    Vector2D v,
  ) => v.normalize();

  /// See [Vector2D.transform].
  Vector2D Vector2Transform(
    Vector2D v,
    MatrixD mat,
  ) => v.transform(mat);

  /// See [Vector2D.lerp].
  Vector2D Vector2Lerp(
    Vector2D v1,
    Vector2D v2,
    double amount,
  ) => v1.lerp(v2, amount);

  /// See [Vector2D.reflect].
  Vector2D Vector2Reflect(
    Vector2D v,
    Vector2D normal,
  ) => v.reflect(normal);

  /// See [Vector2D.min].
  Vector2D Vector2Min(
    Vector2D v1,
    Vector2D v2,
  ) => v1.min(v2);

  /// See [Vector2D.max].
  Vector2D Vector2Max(
    Vector2D v1,
    Vector2D v2,
  ) => v1.max(v2);

  /// See [Vector2D.rotate].
  Vector2D Vector2Rotate(
    Vector2D v,
    double angle,
  ) => v.rotate(angle);

  /// See [Vector2D.moveTowards].
  Vector2D Vector2MoveTowards(
    Vector2D v,
    Vector2D target,
    double maxDistance,
  ) => v.moveTowards(target, maxDistance);

  /// See [Vector2D.invert].
  Vector2D Vector2Invert(
    Vector2D v,
  ) => v.invert();

  /// See [Vector2D.clamp].
  Vector2D Vector2Clamp(
    Vector2D v,
    Vector2D min,
    Vector2D max,
  ) => v.clamp(min, max);

  /// See [Vector2D.clampValue].
  Vector2D Vector2ClampValue(
    Vector2D v,
    double min,
    double max,
  ) => v.clampValue(min, max);

  /// See [Vector2D.equals].
  bool Vector2Equals(
    Vector2D p,
    Vector2D q,
  ) => p.equals(q);

  /// See [Vector2D.refract].
  Vector2D Vector2Refract(
    Vector2D v,
    Vector2D n,
    double r,
  ) => v.refract(n, r);
}