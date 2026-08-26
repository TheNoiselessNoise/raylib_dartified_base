part of '../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector2D]/[Vector3D]/[Vector4D] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibVectorExtension<R extends RaylibBase<R>> extends RaylibModule<R> {

  RaylibVectorExtension(super.rl);

  // Vector2

  /// See [Vector2D.add].
  Vector2D Vector2Add(Vector2D v1, Vector2D v2)
    => v1.add(v2);

  /// See [Vector2D.addValue].
  Vector2D Vector2AddValue(Vector2D v, double add)
    => v.addValue(add);

  /// See [Vector2D.sub].
  Vector2D Vector2Subtract(Vector2D v1, Vector2D v2)
    => v1.sub(v2);

  /// See [Vector2D.subValue].
  Vector2D Vector2SubtractValue(Vector2D v, double sub)
    => v.subValue(sub);

  /// See [Vector2D.length].
  double Vector2Length(Vector2D v)
    => v.length;

  /// See [Vector2D.lengthSqr].
  double Vector2LengthSqr(Vector2D v)
    => v.lengthSqr;

  /// See [Vector2D.dotProduct].
  double Vector2DotProduct(Vector2D v1, Vector2D v2)
    => v1.dotProduct(v2);

  /// See [Vector2D.distance].
  double Vector2Distance(Vector2D v1, Vector2D v2)
    => v1.distance(v2);

  /// See [Vector2D.distanceSqr].
  double Vector2DistanceSqr(Vector2D v1, Vector2D v2)
    => v1.distanceSqr(v2);

  /// See [Vector2D.angle].
  double Vector2Angle(Vector2D v1, Vector2D v2)
    => v1.angle(v2);

  /// See [Vector2D.lineAngle].
  double Vector2LineAngle(Vector2D start, Vector2D end)
    => start.lineAngle(end);

  /// See [Vector2D.scale].
  Vector2D Vector2Scale(Vector2D v, double scale)
    => v.scale(scale);

  /// See [Vector2D.mul].
  Vector2D Vector2Multiply(Vector2D v1, Vector2D v2)
    => v1.mul(v2);

  /// See [Vector2D.negate].
  Vector2D Vector2Negate(Vector2D v)
    => v.negate();

  /// See [Vector2D.div].
  Vector2D Vector2Divide(Vector2D v1, Vector2D v2)
    => v1.div(v2);

  /// See [Vector2D.normalize].
  Vector2D Vector2Normalize(Vector2D v)
    => v.normalize();

  /// See [Vector2D.transform].
  Vector2D Vector2Transform(Vector2D v, MatrixD mat)
    => v.transform(mat);

  /// See [Vector2D.lerp].
  Vector2D Vector2Lerp(Vector2D v1, Vector2D v2, double amount)
    => v1.lerp(v2, amount);

  /// See [Vector2D.reflect].
  Vector2D Vector2Reflect(Vector2D v, Vector2D normal)
    => v.reflect(normal);

  /// See [Vector2D.min].
  Vector2D Vector2Min(Vector2D v1, Vector2D v2)
    => v1.min(v2);

  /// See [Vector2D.max].
  Vector2D Vector2Max(Vector2D v1, Vector2D v2)
    => v1.max(v2);

  /// See [Vector2D.rotate].
  Vector2D Vector2Rotate(Vector2D v, double angle)
    => v.rotate(angle);

  /// See [Vector2D.moveTowards].
  Vector2D Vector2MoveTowards(Vector2D v, Vector2D target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  /// See [Vector2D.invert].
  Vector2D Vector2Invert(Vector2D v)
    => v.invert();

  /// See [Vector2D.clamp].
  Vector2D Vector2Clamp(Vector2D v, Vector2D min, Vector2D max)
    => v.clamp(min, max);

  /// See [Vector2D.clampValue].
  Vector2D Vector2ClampValue(Vector2D v, double min, double max)
    => v.clampValue(min, max);

  /// See [Vector2D.equals].
  bool Vector2Equals(Vector2D p, Vector2D q)
    => p.equals(q);

  /// See [Vector2D.refract].
  Vector2D Vector2Refract(Vector2D v, Vector2D n, double r)
    => v.refract(n, r);

  // Vector3

  /// See [Vector3D.add].
  Vector3D Vector3Add(Vector3D v1, Vector3D v2)
    => v1.add(v2);

  /// See [Vector3D.addValue].
  Vector3D Vector3AddValue(Vector3D v, double add)
    => v.addValue(add);

  /// See [Vector3D.sub].
  Vector3D Vector3DSubtract(Vector3D v1, Vector3D v2)
    => v1.sub(v2);

  /// See [Vector3D.subValue].
  Vector3D Vector3SubtractValue(Vector3D v, double sub)
    => v.subValue(sub);

  /// See [Vector3D.scale].
  Vector3D Vector3Scale(Vector3D v, double scalar)
    => v.scale(scalar);

  /// See [Vector3D.mul].
  Vector3D Vector3Multiply(Vector3D v1, Vector3D v2)
    => v1.mul(v2);

  /// See [Vector3D.crossProduct].
  Vector3D Vector3CrossProduct(Vector3D v1, Vector3D v2)
    => v1.crossProduct(v2);

  /// See [Vector3D.perpendicular].
  Vector3D Vector3Perpendicular(Vector3D v)
    => .perpendicular(v);

  /// See [Vector3D.length].
  double Vector3Length(Vector3D v)
    => v.length;

  /// See [Vector3D.lengthSqr].
  double Vector3LengthSqr(Vector3D v)
    => v.lengthSqr;

  /// See [Vector3D.dotProduct].
  double Vector3DotProduct(Vector3D v1, Vector3D v2)
    => v1.dotProduct(v2);

  /// See [Vector3D.distance].
  double Vector3Distance(Vector3D v1, Vector3D v2)
    => v1.distance(v2);

  /// See [Vector3D.distanceSqr].
  double Vector3DistanceSqr(Vector3D v1, Vector3D v2)
    => v1.distanceSqr(v2);

  /// See [Vector3D.angle].
  double Vector3Angle(Vector3D v1, Vector3D v2)
    => v1.angle(v2);

  /// See [Vector3D.negate].
  Vector3D Vector3Negate(Vector3D v)
    => v.negate();

  /// See [Vector3D.div].
  Vector3D Vector3Divide(Vector3D v1, Vector3D v2)
    => v1.div(v2);

  /// See [Vector3D.normalize].
  Vector3D Vector3Normalize(Vector3D v)
    => v.normalize();

  /// See [Vector3D.project].
  Vector3D Vector3Project(Vector3D v1, Vector3D v2)
    => v1.project(v2);

  /// See [Vector3D.reject].
  Vector3D Vector3Reject(Vector3D v1, Vector3D v2)
    => v1.reject(v2);

  /// See [Vector3D.orthoNormalize].
  void Vector3OrthoNormalize(Vector3D v1, Vector3D v2)
    => v2.setD(v1.orthoNormalize(v2));

  /// See [Vector3D.transform].
  Vector3D Vector3Transform(Vector3D v, MatrixD mat)
    => v.transform(mat);

  /// See [Vector3D.rotateByQuaternion].
  Vector3D Vector3RotateByQuaternion(Vector3D v, QuaternionD q)
    => v.rotateByQuaternion(q);

  /// See [Vector3D.rotateByAxisAngle].
  Vector3D Vector3RotateByAxisAngle(Vector3D v, Vector3D axis, double angle)
    => v.rotateByAxisAngle(axis, angle);

  /// See [Vector3D.moveTowards].
  Vector3D Vector3MoveTowards(Vector3D v, Vector3D target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  /// See [Vector3D.lerp].
  Vector3D Vector3Lerp(Vector3D v1, Vector3D v2, double amount)
    => v1.lerp(v2, amount);

  /// See [Vector3D.cubicHermite].
  Vector3D Vector3CubicHermite(Vector3D v1, Vector3D tangent1, Vector3D v2, Vector3D tangent2, double amount)
    => v1.cubicHermite(tangent1, v2, tangent2, amount);

  /// See [Vector3D.reflect].
  Vector3D Vector3Reflect(Vector3D v, Vector3D normal)
    => v.reflect(normal);

  /// See [Vector3D.min].
  Vector3D Vector3Min(Vector3D v1, Vector3D v2)
    => v1.min(v2);

  /// See [Vector3D.max].
  Vector3D Vector3Max(Vector3D v1, Vector3D v2)
    => v1.max(v2);

  /// See [Vector3D.barycenter].
  Vector3D Vector3Barycenter(Vector3D p, Vector3D a, Vector3D b, Vector3D c)
    => .barycenter(p, a, b, c);

  /// See [Vector3D.unproject].
  Vector3D Vector3Unproject(Vector3D source, MatrixD projection, MatrixD view)
    => source.unproject(projection, view);

  /// See [Vector3D.invert].
  Vector3D Vector3Invert(Vector3D v)
    => v.invert();

  /// See [Vector3D.clamp].
  Vector3D Vector3Clamp(Vector3D v, Vector3D min, Vector3D max)
    => v.clamp(min, max);

  /// See [Vector3D.clampValue].
  Vector3D Vector3ClampValue(Vector3D v, double min, double max)
    => v.clampValue(min, max);

  /// See [Vector3D.equals].
  bool Vector3Equals(Vector3D p, Vector3D q)
    => p.equals(q);

  /// See [Vector3D.refract].
  Vector3D Vector3Refract(Vector3D v, Vector3D n, double r)
    => v.refract(n, r);

  // Vector4

  /// See [Vector4D.add].
  Vector4D Vector4Add(Vector4D v1, Vector4D v2)
    => v1.add(v2);

  /// See [Vector4D.addValue].
  Vector4D Vector4AddValue(Vector4D v, double add)
    => v.addValue(add);

  /// See [Vector4D.sub].
  Vector4D Vector4Subtract(Vector4D v1, Vector4D v2)
    => v1.sub(v2);

  /// See [Vector4D.subValue].
  Vector4D Vector4SubtractValue(Vector4D v, double sub)
    => v.subValue(sub);

  /// See [Vector4D.length].
  double Vector4Length(Vector4D v)
    => v.length;

  /// See [Vector4D.lengthSqr].
  double Vector4LengthSqr(Vector4D v)
    => v.lengthSqr;

  /// See [Vector4D.dotProduct].
  double Vector4DotProduct(Vector4D v1, Vector4D v2)
    => v1.dotProduct(v2);

  /// See [Vector4D.distance].
  double Vector4Distance(Vector4D v1, Vector4D v2)
    => v1.distance(v2);

  /// See [Vector4D.distanceSqr].
  double Vector4DistanceSqr(Vector4D v1, Vector4D v2)
    => v1.distanceSqr(v2);

  /// See [Vector4D.scale].
  Vector4D Vector4Scale(Vector4D v, double scale)
    => v.scale(scale);

  /// See [Vector4D.mul].
  Vector4D Vector4Multiply(Vector4D v1, Vector4D v2)
    => v1.mul(v2);

  /// See [Vector4D.negate].
  Vector4D Vector4Negate(Vector4D v)
    => v.negate();

  /// See [Vector4D.div].
  Vector4D Vector4Divide(Vector4D v1, Vector4D v2)
    => v1.div(v2);

  /// See [Vector4D.normalize].
  Vector4D Vector4Normalize(Vector4D v)
    => v.normalize();

  /// See [Vector4D.min].
  Vector4D Vector4Min(Vector4D v1, Vector4D v2)
    => v1.min(v2);

  /// See [Vector4D.max].
  Vector4D Vector4Max(Vector4D v1, Vector4D v2)
    => v1.max(v2);

  /// See [Vector4D.lerp].
  Vector4D Vector4Lerp(Vector4D v1, Vector4D v2, double amount)
    => v1.lerp(v2, amount);

  /// See [Vector4D.moveTowards].
  Vector4D Vector4MoveTowards(Vector4D v, Vector4D target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  /// See [Vector4D.invert].
  Vector4D Vector4Invert(Vector4D v)
    => v.invert();

  /// See [Vector4D.equals].
  bool Vector4Equals(Vector4D p, Vector4D q)
    => p.equals(q);
}