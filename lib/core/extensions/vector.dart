part of '../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector2Base]/[Vector3Base]/[Vector4Base] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibVectorExtensionBase<
  R extends RaylibBase,

  MatrixStructType extends MatrixBase<
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,
  QuaternionStructType extends QuaternionBase<
    QuaternionStructType,
    MatrixStructType,
    Vector3StructType,
    Vector4StructType
  >,
  Vector2StructType extends Vector2Base<
    Vector2StructType,
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,
  Vector3StructType extends Vector3Base<
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  Vector4StructType extends Vector4Base<
    Vector4StructType,
    QuaternionStructType,
    MatrixStructType,
    Vector3StructType
  >

> extends RaylibModule<R> {

  RaylibVectorExtensionBase(super.rl);

  // Vector3

  Vector2StructType Vector2Add(Vector2StructType v1, Vector2StructType v2)
    => v1.add(v2);

  Vector2StructType Vector2AddValue(Vector2StructType v, double add)
    => v.addValue(add);

  Vector2StructType Vector2Subtract(Vector2StructType v1, Vector2StructType v2)
    => v1.sub(v2);

  Vector2StructType Vector2SubtractValue(Vector2StructType v, double sub)
    => v.subValue(sub);

  double Vector2Length(Vector2StructType v)
    => v.length;

  double Vector2LengthSqr(Vector2StructType v)
    => v.lengthSqr;

  double Vector2DotProduct(Vector2StructType v1, Vector2StructType v2)
    => v1.dotProduct(v2);

  double Vector2Distance(Vector2StructType v1, Vector2StructType v2)
    => v1.distance(v2);

  double Vector2DistanceSqr(Vector2StructType v1, Vector2StructType v2)
    => v1.distanceSqr(v2);

  double Vector2Angle(Vector2StructType v1, Vector2StructType v2)
    => v1.angle(v2);

  double Vector2LineAngle(Vector2StructType start, Vector2StructType end)
    => start.lineAngle(end);

  Vector2StructType Vector2Scale(Vector2StructType v, double scale)
    => v.scale(scale);

  Vector2StructType Vector2Multiply(Vector2StructType v1, Vector2StructType v2)
    => v1.mul(v2);

  Vector2StructType Vector2Negate(Vector2StructType v)
    => v.negate();

  Vector2StructType Vector2Divide(Vector2StructType v1, Vector2StructType v2)
    => v1.div(v2);

  Vector2StructType Vector2Normalize(Vector2StructType v)
    => v.normalize();

  Vector2StructType Vector2Transform(Vector2StructType v, MatrixStructType mat)
    => v.transform(mat);

  Vector2StructType Vector2Lerp(Vector2StructType v1, Vector2StructType v2, double amount)
    => v1.lerp(v2, amount);

  Vector2StructType Vector2Reflect(Vector2StructType v, Vector2StructType normal)
    => v.reflect(normal);

  Vector2StructType Vector2Min(Vector2StructType v1, Vector2StructType v2)
    => v1.min(v2);

  Vector2StructType Vector2Max(Vector2StructType v1, Vector2StructType v2)
    => v1.max(v2);

  Vector2StructType Vector2Rotate(Vector2StructType v, double angle)
    => v.rotate(angle);

  Vector2StructType Vector2MoveTowards(Vector2StructType v, Vector2StructType target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  Vector2StructType Vector2Invert(Vector2StructType v)
    => v.invert();

  Vector2StructType Vector2Clamp(Vector2StructType v, Vector2StructType min, Vector2StructType max)
    => v.clamp(min, max);

  Vector2StructType Vector2ClampValue(Vector2StructType v, double min, double max)
    => v.clampValue(min, max);

  bool Vector2Equals(Vector2StructType p, Vector2StructType q)
    => p.equals(q);

  Vector2StructType Vector2Refract(Vector2StructType v, Vector2StructType n, double r)
    => v.refract(n, r);

  // Vector3

  Vector3StructType Vector3Add(Vector3StructType v1, Vector3StructType v2)
    => v1.add(v2);

  Vector3StructType Vector3AddValue(Vector3StructType v, double add)
    => v.addValue(add);

  Vector3StructType Vector3DSubtract(Vector3StructType v1, Vector3StructType v2)
    => v1.sub(v2);

  Vector3StructType Vector3SubtractValue(Vector3StructType v, double sub)
    => v.subValue(sub);

  Vector3StructType Vector3Scale(Vector3StructType v, double scalar)
    => v.scale(scalar);

  Vector3StructType Vector3Multiply(Vector3StructType v1, Vector3StructType v2)
    => v1.mul(v2);

  Vector3StructType Vector3CrossProduct(Vector3StructType v1, Vector3StructType v2)
    => v1.crossProduct(v2);

  Vector3StructType Vector3Perpendicular(Vector3StructType v)
    => RaylibVector3Factories.perpendicular(v) as Vector3StructType;

  double Vector3Length(Vector3StructType v)
    => v.length;

  double Vector3LengthSqr(Vector3StructType v)
    => v.lengthSqr;

  double Vector3DotProduct(Vector3StructType v1, Vector3StructType v2)
    => v1.dotProduct(v2);

  double Vector3Distance(Vector3StructType v1, Vector3StructType v2)
    => v1.distance(v2);

  double Vector3DistanceSqr(Vector3StructType v1, Vector3StructType v2)
    => v1.distanceSqr(v2);

  double Vector3Angle(Vector3StructType v1, Vector3StructType v2)
    => v1.angle(v2);

  Vector3StructType Vector3Negate(Vector3StructType v)
    => v.negate();

  Vector3StructType Vector3Divide(Vector3StructType v1, Vector3StructType v2)
    => v1.div(v2);

  Vector3StructType Vector3Normalize(Vector3StructType v)
    => v.normalize();

  Vector3StructType Vector3Project(Vector3StructType v1, Vector3StructType v2)
    => v1.project(v2);

  Vector3StructType Vector3Reject(Vector3StructType v1, Vector3StructType v2)
    => v1.reject(v2);

  void Vector3OrthoNormalize(Vector3StructType v1, Vector3StructType v2)
    => v2.setD(v1.orthoNormalize(v2));

  Vector3StructType Vector3Transform(Vector3StructType v, MatrixStructType mat)
    => v.transform(mat);

  Vector3StructType Vector3RotateByQuaternion(Vector3StructType v, QuaternionStructType q)
    => v.rotateByQuaternion(q);

  Vector3StructType Vector3RotateByAxisAngle(Vector3StructType v, Vector3StructType axis, double angle)
    => v.rotateByAxisAngle(axis, angle);

  Vector3StructType Vector3MoveTowards(Vector3StructType v, Vector3StructType target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  Vector3StructType Vector3Lerp(Vector3StructType v1, Vector3StructType v2, double amount)
    => v1.lerp(v2, amount);

  Vector3StructType Vector3CubicHermite(Vector3StructType v1, Vector3StructType tangent1, Vector3StructType v2, Vector3StructType tangent2, double amount)
    => v1.cubicHermite(tangent1, v2, tangent2, amount);

  Vector3StructType Vector3Reflect(Vector3StructType v, Vector3StructType normal)
    => v.reflect(normal);

  Vector3StructType Vector3Min(Vector3StructType v1, Vector3StructType v2)
    => v1.min(v2);

  Vector3StructType Vector3Max(Vector3StructType v1, Vector3StructType v2)
    => v1.max(v2);

  Vector3StructType Vector3Barycenter(Vector3StructType p, Vector3StructType a, Vector3StructType b, Vector3StructType c)
    => RaylibVector3Factories.barycenter(p, a, b, c) as Vector3StructType;

  Vector3StructType Vector3Unproject(Vector3StructType source, MatrixStructType projection, MatrixStructType view)
    => source.unproject(projection, view);

  Vector3StructType Vector3Invert(Vector3StructType v)
    => v.invert();

  Vector3StructType Vector3Clamp(Vector3StructType v, Vector3StructType min, Vector3StructType max)
    => v.clamp(min, max);

  Vector3StructType Vector3ClampValue(Vector3StructType v, double min, double max)
    => v.clampValue(min, max);

  bool Vector3Equals(Vector3StructType p, Vector3StructType q)
    => p.equals(q);

  Vector3StructType Vector3Refract(Vector3StructType v, Vector3StructType n, double r)
    => v.refract(n, r);

  // Vector4

  Vector4StructType Vector4Add(Vector4StructType v1, Vector4StructType v2)
    => v1.add(v2);

  Vector4StructType Vector4AddValue(Vector4StructType v, double add)
    => v.addValue(add);

  Vector4StructType Vector4Subtract(Vector4StructType v1, Vector4StructType v2)
    => v1.sub(v2);

  Vector4StructType Vector4SubtractValue(Vector4StructType v, double sub)
    => v.subValue(sub);

  double Vector4Length(Vector4StructType v)
    => v.length;

  double Vector4LengthSqr(Vector4StructType v)
    => v.lengthSqr;

  double Vector4DotProduct(Vector4StructType v1, Vector4StructType v2)
    => v1.dotProduct(v2);

  double Vector4Distance(Vector4StructType v1, Vector4StructType v2)
    => v1.distance(v2);

  double Vector4DistanceSqr(Vector4StructType v1, Vector4StructType v2)
    => v1.distanceSqr(v2);

  Vector4StructType Vector4Scale(Vector4StructType v, double scale)
    => v.scale(scale);

  Vector4StructType Vector4Multiply(Vector4StructType v1, Vector4StructType v2)
    => v1.mul(v2);

  Vector4StructType Vector4Negate(Vector4StructType v)
    => v.negate();

  Vector4StructType Vector4Divide(Vector4StructType v1, Vector4StructType v2)
    => v1.div(v2);

  Vector4StructType Vector4Normalize(Vector4StructType v)
    => v.normalize();

  Vector4StructType Vector4Min(Vector4StructType v1, Vector4StructType v2)
    => v1.min(v2);

  Vector4StructType Vector4Max(Vector4StructType v1, Vector4StructType v2)
    => v1.max(v2);

  Vector4StructType Vector4Lerp(Vector4StructType v1, Vector4StructType v2, double amount)
    => v1.lerp(v2, amount);

  Vector4StructType Vector4MoveTowards(Vector4StructType v, Vector4StructType target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  Vector4StructType Vector4Invert(Vector4StructType v)
    => v.invert();

  bool Vector4Equals(Vector4StructType p, Vector4StructType q)
    => p.equals(q);
}