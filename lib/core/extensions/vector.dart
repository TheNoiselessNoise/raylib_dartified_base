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

  /// See [Vector2Base.add].
  Vector2StructType Vector2Add(Vector2StructType v1, Vector2StructType v2)
    => v1.add(v2);

  /// See [Vector2Base.addValue].
  Vector2StructType Vector2AddValue(Vector2StructType v, double add)
    => v.addValue(add);

  /// See [Vector2Base.sub].
  Vector2StructType Vector2Subtract(Vector2StructType v1, Vector2StructType v2)
    => v1.sub(v2);

  /// See [Vector2Base.subValue].
  Vector2StructType Vector2SubtractValue(Vector2StructType v, double sub)
    => v.subValue(sub);

  /// See [Vector2Base.length].
  double Vector2Length(Vector2StructType v)
    => v.length;

  /// See [Vector2Base.lengthSqr].
  double Vector2LengthSqr(Vector2StructType v)
    => v.lengthSqr;

  /// See [Vector2Base.dotProduct].
  double Vector2DotProduct(Vector2StructType v1, Vector2StructType v2)
    => v1.dotProduct(v2);

  /// See [Vector2Base.distance].
  double Vector2Distance(Vector2StructType v1, Vector2StructType v2)
    => v1.distance(v2);

  /// See [Vector2Base.distanceSqr].
  double Vector2DistanceSqr(Vector2StructType v1, Vector2StructType v2)
    => v1.distanceSqr(v2);

  /// See [Vector2Base.angle].
  double Vector2Angle(Vector2StructType v1, Vector2StructType v2)
    => v1.angle(v2);

  /// See [Vector2Base.lineAngle].
  double Vector2LineAngle(Vector2StructType start, Vector2StructType end)
    => start.lineAngle(end);

  /// See [Vector2Base.scale].
  Vector2StructType Vector2Scale(Vector2StructType v, double scale)
    => v.scale(scale);

  /// See [Vector2Base.mul].
  Vector2StructType Vector2Multiply(Vector2StructType v1, Vector2StructType v2)
    => v1.mul(v2);

  /// See [Vector2Base.negate].
  Vector2StructType Vector2Negate(Vector2StructType v)
    => v.negate();

  /// See [Vector2Base.div].
  Vector2StructType Vector2Divide(Vector2StructType v1, Vector2StructType v2)
    => v1.div(v2);

  /// See [Vector2Base.normalize].
  Vector2StructType Vector2Normalize(Vector2StructType v)
    => v.normalize();

  /// See [Vector2Base.transform].
  Vector2StructType Vector2Transform(Vector2StructType v, MatrixStructType mat)
    => v.transform(mat);

  /// See [Vector2Base.lerp].
  Vector2StructType Vector2Lerp(Vector2StructType v1, Vector2StructType v2, double amount)
    => v1.lerp(v2, amount);

  /// See [Vector2Base.reflect].
  Vector2StructType Vector2Reflect(Vector2StructType v, Vector2StructType normal)
    => v.reflect(normal);

  /// See [Vector2Base.min].
  Vector2StructType Vector2Min(Vector2StructType v1, Vector2StructType v2)
    => v1.min(v2);

  /// See [Vector2Base.max].
  Vector2StructType Vector2Max(Vector2StructType v1, Vector2StructType v2)
    => v1.max(v2);

  /// See [Vector2Base.rotate].
  Vector2StructType Vector2Rotate(Vector2StructType v, double angle)
    => v.rotate(angle);

  /// See [Vector2Base.moveTowards].
  Vector2StructType Vector2MoveTowards(Vector2StructType v, Vector2StructType target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  /// See [Vector2Base.invert].
  Vector2StructType Vector2Invert(Vector2StructType v)
    => v.invert();

  /// See [Vector2Base.clamp].
  Vector2StructType Vector2Clamp(Vector2StructType v, Vector2StructType min, Vector2StructType max)
    => v.clamp(min, max);

  /// See [Vector2Base.clampValue].
  Vector2StructType Vector2ClampValue(Vector2StructType v, double min, double max)
    => v.clampValue(min, max);

  /// See [Vector2Base.equals].
  bool Vector2Equals(Vector2StructType p, Vector2StructType q)
    => p.equals(q);

  /// See [Vector2Base.refract].
  Vector2StructType Vector2Refract(Vector2StructType v, Vector2StructType n, double r)
    => v.refract(n, r);

  // Vector3

  /// See [Vector3Base.add].
  Vector3StructType Vector3Add(Vector3StructType v1, Vector3StructType v2)
    => v1.add(v2);

  /// See [Vector3Base.addValue].
  Vector3StructType Vector3AddValue(Vector3StructType v, double add)
    => v.addValue(add);

  /// See [Vector3Base.sub].
  Vector3StructType Vector3DSubtract(Vector3StructType v1, Vector3StructType v2)
    => v1.sub(v2);

  /// See [Vector3Base.subValue].
  Vector3StructType Vector3SubtractValue(Vector3StructType v, double sub)
    => v.subValue(sub);

  /// See [Vector3Base.scale].
  Vector3StructType Vector3Scale(Vector3StructType v, double scalar)
    => v.scale(scalar);

  /// See [Vector3Base.mul].
  Vector3StructType Vector3Multiply(Vector3StructType v1, Vector3StructType v2)
    => v1.mul(v2);

  /// See [Vector3Base.crossProduct].
  Vector3StructType Vector3CrossProduct(Vector3StructType v1, Vector3StructType v2)
    => v1.crossProduct(v2);

  /// See [RaylibVector3Factories.perpendicular].
  Vector3StructType Vector3Perpendicular(Vector3StructType v)
    => RaylibVector3Factories.perpendicular(v) as Vector3StructType;

  /// See [Vector3Base.length].
  double Vector3Length(Vector3StructType v)
    => v.length;

  /// See [Vector3Base.lengthSqr].
  double Vector3LengthSqr(Vector3StructType v)
    => v.lengthSqr;

  /// See [Vector3Base.dotProduct].
  double Vector3DotProduct(Vector3StructType v1, Vector3StructType v2)
    => v1.dotProduct(v2);

  /// See [Vector3Base.distance].
  double Vector3Distance(Vector3StructType v1, Vector3StructType v2)
    => v1.distance(v2);

  /// See [Vector3Base.distanceSqr].
  double Vector3DistanceSqr(Vector3StructType v1, Vector3StructType v2)
    => v1.distanceSqr(v2);

  /// See [Vector3Base.angle].
  double Vector3Angle(Vector3StructType v1, Vector3StructType v2)
    => v1.angle(v2);

  /// See [Vector3Base.negate].
  Vector3StructType Vector3Negate(Vector3StructType v)
    => v.negate();

  /// See [Vector3Base.div].
  Vector3StructType Vector3Divide(Vector3StructType v1, Vector3StructType v2)
    => v1.div(v2);

  /// See [Vector3Base.normalize].
  Vector3StructType Vector3Normalize(Vector3StructType v)
    => v.normalize();

  /// See [Vector3Base.project].
  Vector3StructType Vector3Project(Vector3StructType v1, Vector3StructType v2)
    => v1.project(v2);

  /// See [Vector3Base.reject].
  Vector3StructType Vector3Reject(Vector3StructType v1, Vector3StructType v2)
    => v1.reject(v2);

  /// See [Vector3Base.orthoNormalize].
  void Vector3OrthoNormalize(Vector3StructType v1, Vector3StructType v2)
    => v2.setD(v1.orthoNormalize(v2));

  /// See [Vector3Base.transform].
  Vector3StructType Vector3Transform(Vector3StructType v, MatrixStructType mat)
    => v.transform(mat);

  /// See [Vector3Base.rotateByQuaternion].
  Vector3StructType Vector3RotateByQuaternion(Vector3StructType v, QuaternionStructType q)
    => v.rotateByQuaternion(q);

  /// See [Vector3Base.rotateByAxisAngle].
  Vector3StructType Vector3RotateByAxisAngle(Vector3StructType v, Vector3StructType axis, double angle)
    => v.rotateByAxisAngle(axis, angle);

  /// See [Vector3Base.moveTowards].
  Vector3StructType Vector3MoveTowards(Vector3StructType v, Vector3StructType target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  /// See [Vector3Base.lerp].
  Vector3StructType Vector3Lerp(Vector3StructType v1, Vector3StructType v2, double amount)
    => v1.lerp(v2, amount);

  /// See [Vector3Base.cubicHermite].
  Vector3StructType Vector3CubicHermite(Vector3StructType v1, Vector3StructType tangent1, Vector3StructType v2, Vector3StructType tangent2, double amount)
    => v1.cubicHermite(tangent1, v2, tangent2, amount);

  /// See [Vector3Base.reflect].
  Vector3StructType Vector3Reflect(Vector3StructType v, Vector3StructType normal)
    => v.reflect(normal);

  /// See [Vector3Base.min].
  Vector3StructType Vector3Min(Vector3StructType v1, Vector3StructType v2)
    => v1.min(v2);

  /// See [Vector3Base.max].
  Vector3StructType Vector3Max(Vector3StructType v1, Vector3StructType v2)
    => v1.max(v2);

  /// See [RaylibVector3Factories.barycenter].
  Vector3StructType Vector3Barycenter(Vector3StructType p, Vector3StructType a, Vector3StructType b, Vector3StructType c)
    => RaylibVector3Factories.barycenter(p, a, b, c) as Vector3StructType;

  /// See [Vector3Base.unproject].
  Vector3StructType Vector3Unproject(Vector3StructType source, MatrixStructType projection, MatrixStructType view)
    => source.unproject(projection, view);

  /// See [Vector3Base.invert].
  Vector3StructType Vector3Invert(Vector3StructType v)
    => v.invert();

  /// See [Vector3Base.clamp].
  Vector3StructType Vector3Clamp(Vector3StructType v, Vector3StructType min, Vector3StructType max)
    => v.clamp(min, max);

  /// See [Vector3Base.clampValue].
  Vector3StructType Vector3ClampValue(Vector3StructType v, double min, double max)
    => v.clampValue(min, max);

  /// See [Vector3Base.equals].
  bool Vector3Equals(Vector3StructType p, Vector3StructType q)
    => p.equals(q);

  /// See [Vector3Base.refract].
  Vector3StructType Vector3Refract(Vector3StructType v, Vector3StructType n, double r)
    => v.refract(n, r);

  // Vector4

  /// See [Vector4Base.add].
  Vector4StructType Vector4Add(Vector4StructType v1, Vector4StructType v2)
    => v1.add(v2);

  /// See [Vector4Base.addValue].
  Vector4StructType Vector4AddValue(Vector4StructType v, double add)
    => v.addValue(add);

  /// See [Vector4Base.sub].
  Vector4StructType Vector4Subtract(Vector4StructType v1, Vector4StructType v2)
    => v1.sub(v2);

  /// See [Vector4Base.subValue].
  Vector4StructType Vector4SubtractValue(Vector4StructType v, double sub)
    => v.subValue(sub);

  /// See [Vector4Base.length].
  double Vector4Length(Vector4StructType v)
    => v.length;

  /// See [Vector4Base.lengthSqr].
  double Vector4LengthSqr(Vector4StructType v)
    => v.lengthSqr;

  /// See [Vector4Base.dotProduct].
  double Vector4DotProduct(Vector4StructType v1, Vector4StructType v2)
    => v1.dotProduct(v2);

  /// See [Vector4Base.distance].
  double Vector4Distance(Vector4StructType v1, Vector4StructType v2)
    => v1.distance(v2);

  /// See [Vector4Base.distanceSqr].
  double Vector4DistanceSqr(Vector4StructType v1, Vector4StructType v2)
    => v1.distanceSqr(v2);

  /// See [Vector4Base.scale].
  Vector4StructType Vector4Scale(Vector4StructType v, double scale)
    => v.scale(scale);

  /// See [Vector4Base.mul].
  Vector4StructType Vector4Multiply(Vector4StructType v1, Vector4StructType v2)
    => v1.mul(v2);

  /// See [Vector4Base.negate].
  Vector4StructType Vector4Negate(Vector4StructType v)
    => v.negate();

  /// See [Vector4Base.div].
  Vector4StructType Vector4Divide(Vector4StructType v1, Vector4StructType v2)
    => v1.div(v2);

  /// See [Vector4Base.normalize].
  Vector4StructType Vector4Normalize(Vector4StructType v)
    => v.normalize();

  /// See [Vector4Base.min].
  Vector4StructType Vector4Min(Vector4StructType v1, Vector4StructType v2)
    => v1.min(v2);

  /// See [Vector4Base.max].
  Vector4StructType Vector4Max(Vector4StructType v1, Vector4StructType v2)
    => v1.max(v2);

  /// See [Vector4Base.lerp].
  Vector4StructType Vector4Lerp(Vector4StructType v1, Vector4StructType v2, double amount)
    => v1.lerp(v2, amount);

  /// See [Vector4Base.moveTowards].
  Vector4StructType Vector4MoveTowards(Vector4StructType v, Vector4StructType target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  /// See [Vector4Base.invert].
  Vector4StructType Vector4Invert(Vector4StructType v)
    => v.invert();

  /// See [Vector4Base.equals].
  bool Vector4Equals(Vector4StructType p, Vector4StructType q)
    => p.equals(q);
}