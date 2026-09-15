part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector3D] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibVector3ExtDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibVector3ExtDartDebugLabels();

  RaylibVector3ExtDart(super.rl);

  /// See [Vector3D.zero].
  Vector3D Vector3Zero() => run(
    () => _debugLabels.Vector3Zero(),
    () => .zero(),
  );

  /// See [Vector3D.one].
  Vector3D Vector3One() => run(
    () => _debugLabels.Vector3One(),
    () => .one(),
  );

  /// See [Vector3D.add].
  Vector3D Vector3Add(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Add(v1, v2),
    () => v1.add(v2),
  );

  /// See [Vector3D.addValue].
  Vector3D Vector3AddValue(
    Vector3D v,
    double add,
  ) => run(
    () => _debugLabels.Vector3AddValue(v, add),
    () => v.addValue(add),
  );

  /// See [Vector3D.sub].
  Vector3D Vector3Subtract(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Subtract(v1, v2),
    () => v1.sub(v2),
  );

  /// See [Vector3D.subValue].
  Vector3D Vector3SubtractValue(
    Vector3D v,
    double sub,
  ) => run(
    () => _debugLabels.Vector3SubtractValue(v, sub),
    () => v.subValue(sub),
  );

  /// See [Vector3D.scale].
  Vector3D Vector3Scale(
    Vector3D v,
    double scalar,
  ) => run(
    () => _debugLabels.Vector3Scale(v, scalar),
    () => v.scale(scalar),
  );

  /// See [Vector3D.mul].
  Vector3D Vector3Multiply(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Multiply(v1, v2),
    () => v1.mul(v2),
  );

  /// See [Vector3D.crossProduct].
  Vector3D Vector3CrossProduct(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3CrossProduct(v1, v2),
    () => v1.crossProduct(v2),
  );

  /// See [Vector3D.perpendicular].
  Vector3D Vector3Perpendicular(
    Vector3D v,
  ) => run(
    () => _debugLabels.Vector3Perpendicular(v),
    () => .perpendicular(v),
  );

  /// See [Vector3D.length].
  double Vector3Length(
    Vector3D v,
  ) => run(
    () => _debugLabels.Vector3Length(v),
    () => v.length,
  );

  /// See [Vector3D.lengthSqr].
  double Vector3LengthSqr(
    Vector3D v,
  ) => run(
    () => _debugLabels.Vector3LengthSqr(v),
    () => v.lengthSqr,
  );

  /// See [Vector3D.dotProduct].
  double Vector3DotProduct(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3DotProduct(v1, v2),
    () => v1.dotProduct(v2),
  );

  /// See [Vector3D.distance].
  double Vector3Distance(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Distance(v1, v2),
    () => v1.distance(v2),
  );

  /// See [Vector3D.distanceSqr].
  double Vector3DistanceSqr(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3DistanceSqr(v1, v2),
    () => v1.distanceSqr(v2),
  );

  /// See [Vector3D.angle].
  double Vector3Angle(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Angle(v1, v2),
    () => v1.angle(v2),
  );

  /// See [Vector3D.negate].
  Vector3D Vector3Negate(
    Vector3D v,
  ) => run(
    () => _debugLabels.Vector3Negate(v),
    () => v.negate(),
  );

  /// See [Vector3D.div].
  Vector3D Vector3Divide(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Divide(v1, v2),
    () => v1.div(v2),
  );

  /// See [Vector3D.normalize].
  Vector3D Vector3Normalize(
    Vector3D v,
  ) => run(
    () => _debugLabels.Vector3Normalize(v),
    () => v.normalize(),
  );

  /// See [Vector3D.project].
  Vector3D Vector3Project(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Project(v1, v2),
    () => v1.project(v2),
  );

  /// See [Vector3D.reject].
  Vector3D Vector3Reject(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Reject(v1, v2),
    () => v1.reject(v2),
  );

  /// See [Vector3D.orthoNormalize].
  void Vector3OrthoNormalize(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3OrthoNormalize(v1, v2),
    () => v2.setDart(v1.orthoNormalize(v2)),
  );

  /// See [Vector3D.transform].
  Vector3D Vector3Transform(
    Vector3D v,
    MatrixD mat,
  ) => run(
    () => _debugLabels.Vector3Transform(v, mat),
    () => v.transform(mat),
  );

  /// See [Vector3D.rotateByQuaternion].
  Vector3D Vector3RotateByQuaternion(
    Vector3D v,
    QuaternionD q,
  ) => run(
    () => _debugLabels.Vector3RotateByQuaternion(v, q),
    () => v.rotateByQuaternion(q),
  );

  /// See [Vector3D.rotateByAxisAngle].
  Vector3D Vector3RotateByAxisAngle(
    Vector3D v,
    Vector3D axis,
    double angle,
  ) => run(
    () => _debugLabels.Vector3RotateByAxisAngle(v, axis, angle),
    () => v.rotateByAxisAngle(axis, angle),
  );

  /// See [Vector3D.moveTowards].
  Vector3D Vector3MoveTowards(
    Vector3D v,
    Vector3D target,
    double maxDistance,
  ) => run(
    () => _debugLabels.Vector3MoveTowards(v, target, maxDistance),
    () => v.moveTowards(target, maxDistance),
  );

  /// See [Vector3D.lerp].
  Vector3D Vector3Lerp(
    Vector3D v1,
    Vector3D v2,
    double amount,
  ) => run(
    () => _debugLabels.Vector3Lerp(v1, v2, amount),
    () => v1.lerp(v2, amount),
  );

  /// See [Vector3D.cubicHermite].
  Vector3D Vector3CubicHermite(
    Vector3D v1,
    Vector3D tangent1,
    Vector3D v2,
    Vector3D tangent2,
    double amount,
  ) => run(
    () => _debugLabels.Vector3CubicHermite(v1, tangent1, v2, tangent2, amount),
    () => v1.cubicHermite(tangent1, v2, tangent2, amount),
  );

  /// See [Vector3D.reflect].
  Vector3D Vector3Reflect(
    Vector3D v,
    Vector3D normal,
  ) => run(
    () => _debugLabels.Vector3Reflect(v, normal),
    () => v.reflect(normal),
  );

  /// See [Vector3D.min].
  Vector3D Vector3Min(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Min(v1, v2),
    () => v1.min(v2),
  );

  /// See [Vector3D.max].
  Vector3D Vector3Max(
    Vector3D v1,
    Vector3D v2,
  ) => run(
    () => _debugLabels.Vector3Max(v1, v2),
    () => v1.max(v2),
  );

  /// See [Vector3D.barycenter].
  Vector3D Vector3Barycenter(
    Vector3D p,
    Vector3D a,
    Vector3D b,
    Vector3D c,
  ) => run(
    () => _debugLabels.Vector3Barycenter(p, a, b, c),
    () => .barycenter(p, a, b, c),
  );

  /// See [Vector3D.unproject].
  Vector3D Vector3Unproject(
    Vector3D source,
    MatrixD projection,
    MatrixD view,
  ) => run(
    () => _debugLabels.Vector3Unproject(source, projection, view),
    () => source.unproject(projection, view),
  );

  /// See [Vector3D.toArray].
  float3D Vector3ToFloatV(
    Vector3D v,
  ) => run(
    () => _debugLabels.Vector3ToFloatV(v),
    () => v.toFloatV(),
  );

  /// See [Vector3D.invert].
  Vector3D Vector3Invert(
    Vector3D v,
  ) => run(
    () => _debugLabels.Vector3Invert(v),
    () => v.invert(),
  );

  /// See [Vector3D.clamp].
  Vector3D Vector3Clamp(
    Vector3D v,
    Vector3D min,
    Vector3D max,
  ) => run(
    () => _debugLabels.Vector3Clamp(v, min, max),
    () => v.clamp(min, max),
  );

  /// See [Vector3D.clampValue].
  Vector3D Vector3ClampValue(
    Vector3D v,
    double min,
    double max,
  ) => run(
    () => _debugLabels.Vector3ClampValue(v, min, max),
    () => v.clampValue(min, max),
  );

  /// See [Vector3D.equals].
  bool Vector3Equals(
    Vector3D p,
    Vector3D q,
  ) => run(
    () => _debugLabels.Vector3Equals(p, q),
    () => p.equals(q),
  );

  /// See [Vector3D.refract].
  Vector3D Vector3Refract(
    Vector3D v,
    Vector3D n,
    double r,
  ) => run(
    () => _debugLabels.Vector3Refract(v, n, r),
    () => v.refract(n, r),
  );
}