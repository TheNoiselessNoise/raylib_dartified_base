part of '../../../raylib_dartified_base.dart';

// TODO: debug labels and `run`

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector4D] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibVector4ExtDart<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector4ExtDart(super.rl);

  /// See [Vector4D.zero].
  Vector4D Vector4Zero()
    => .zero();

  /// See [Vector4D.one].
  Vector4D Vector4One()
    => .one();

  /// See [Vector4D.add].
  Vector4D Vector4Add(
    Vector4D v1,
    Vector4D v2,
  ) => v1.add(v2);

  /// See [Vector4D.addValue].
  Vector4D Vector4AddValue(
    Vector4D v,
    double add,
  ) => v.addValue(add);

  /// See [Vector4D.sub].
  Vector4D Vector4Subtract(
    Vector4D v1,
    Vector4D v2,
  ) => v1.sub(v2);

  /// See [Vector4D.subValue].
  Vector4D Vector4SubtractValue(
    Vector4D v,
    double sub,
  ) => v.subValue(sub);

  /// See [Vector4D.length].
  double Vector4Length(
    Vector4D v,
  ) => v.length;

  /// See [Vector4D.lengthSqr].
  double Vector4LengthSqr(
    Vector4D v,
  ) => v.lengthSqr;

  /// See [Vector4D.dotProduct].
  double Vector4DotProduct(
    Vector4D v1,
    Vector4D v2,
  ) => v1.dotProduct(v2);

  /// See [Vector4D.distance].
  double Vector4Distance(
    Vector4D v1,
    Vector4D v2,
  ) => v1.distance(v2);

  /// See [Vector4D.distanceSqr].
  double Vector4DistanceSqr(
    Vector4D v1,
    Vector4D v2,
  ) => v1.distanceSqr(v2);

  /// See [Vector4D.scale].
  Vector4D Vector4Scale(
    Vector4D v,
    double scale,
  ) => v.scale(scale);

  /// See [Vector4D.mul].
  Vector4D Vector4Multiply(
    Vector4D v1,
    Vector4D v2,
  ) => v1.mul(v2);

  /// See [Vector4D.negate].
  Vector4D Vector4Negate(
    Vector4D v,
  ) => v.negate();

  /// See [Vector4D.div].
  Vector4D Vector4Divide(
    Vector4D v1,
    Vector4D v2,
  ) => v1.div(v2);

  /// See [Vector4D.normalize].
  Vector4D Vector4Normalize(
    Vector4D v,
  ) => v.normalize();

  /// See [Vector4D.min].
  Vector4D Vector4Min(
    Vector4D v1,
    Vector4D v2,
  ) => v1.min(v2);

  /// See [Vector4D.max].
  Vector4D Vector4Max(
    Vector4D v1,
    Vector4D v2,
  ) => v1.max(v2);

  /// See [Vector4D.lerp].
  Vector4D Vector4Lerp(
    Vector4D v1,
    Vector4D v2,
    double amount,
  ) => v1.lerp(v2, amount);

  /// See [Vector4D.moveTowards].
  Vector4D Vector4MoveTowards(
    Vector4D v,
    Vector4D target,
    double maxDistance,
  ) => v.moveTowards(target, maxDistance);

  /// See [Vector4D.invert].
  Vector4D Vector4Invert(
    Vector4D v,
  ) => v.invert();

  /// See [Vector4D.equals].
  bool Vector4Equals(
    Vector4D p,
    Vector4D q,
  ) => p.equals(q);
}