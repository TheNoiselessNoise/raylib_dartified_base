import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibVector3FlatExt get _module => RaylibBase.instance.module();

/// See [RaylibVector3ExtDart.Vector3Zero].
Vector3D Vector3Zero() => _module.Vector3Zero();

/// See [RaylibVector3ExtDart.Vector3One].
Vector3D Vector3One() => _module.Vector3One();

/// See [RaylibVector3ExtDart.Vector3Add].
Vector3D Vector3Add(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Add(v1, v2);

/// See [RaylibVector3ExtDart.Vector3AddValue].
Vector3D Vector3AddValue(
  Vector3D v,
  double add,
) => _module.Vector3AddValue(v, add);

/// See [RaylibVector3ExtDart.Vector3Subtract].
Vector3D Vector3Subtract(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Subtract(v1, v2);

/// See [RaylibVector3ExtDart.Vector3SubtractValue].
Vector3D Vector3SubtractValue(
  Vector3D v,
  double sub,
) => _module.Vector3SubtractValue(v, sub);

/// See [RaylibVector3ExtDart.Vector3Scale].
Vector3D Vector3Scale(
  Vector3D v,
  double scalar,
) => _module.Vector3Scale(v, scalar);

/// See [RaylibVector3ExtDart.Vector3Multiply].
Vector3D Vector3Multiply(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Multiply(v1, v2);

/// See [RaylibVector3ExtDart.Vector3CrossProduct].
Vector3D Vector3CrossProduct(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3CrossProduct(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Perpendicular].
Vector3D Vector3Perpendicular(
  Vector3D v,
) => _module.Vector3Perpendicular(v);

/// See [RaylibVector3ExtDart.Vector3Length].
double Vector3Length(
  Vector3D v,
) => _module.Vector3Length(v);

/// See [RaylibVector3ExtDart.Vector3LengthSqr].
double Vector3LengthSqr(
  Vector3D v,
) => _module.Vector3LengthSqr(v);

/// See [RaylibVector3ExtDart.Vector3DotProduct].
double Vector3DotProduct(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3DotProduct(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Distance].
double Vector3Distance(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Distance(v1, v2);

/// See [RaylibVector3ExtDart.Vector3DistanceSqr].
double Vector3DistanceSqr(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3DistanceSqr(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Angle].
double Vector3Angle(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Angle(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Negate].
Vector3D Vector3Negate(
  Vector3D v,
) => _module.Vector3Negate(v);

/// See [RaylibVector3ExtDart.Vector3Divide].
Vector3D Vector3Divide(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Divide(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Normalize].
Vector3D Vector3Normalize(
  Vector3D v,
) => _module.Vector3Normalize(v);

/// See [RaylibVector3ExtDart.Vector3Project].
Vector3D Vector3Project(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Project(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Reject].
Vector3D Vector3Reject(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Reject(v1, v2);

/// See [RaylibVector3ExtDart.Vector3OrthoNormalize].
void Vector3OrthoNormalize(
  StructPointer<Vector3D> v1,
  StructPointer<Vector3D> v2,
) => _module.Vector3OrthoNormalize(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Transform].
Vector3D Vector3Transform(
  Vector3D v,
  MatrixD mat,
) => _module.Vector3Transform(v, mat);

/// See [RaylibVector3ExtDart.Vector3RotateByQuaternion].
Vector3D Vector3RotateByQuaternion(
  Vector3D v,
  QuaternionD q,
) => _module.Vector3RotateByQuaternion(v, q);

/// See [RaylibVector3ExtDart.Vector3RotateByAxisAngle].
Vector3D Vector3RotateByAxisAngle(
  Vector3D v,
  Vector3D axis,
  double angle,
) => _module.Vector3RotateByAxisAngle(v, axis, angle);

/// See [RaylibVector3ExtDart.Vector3MoveTowards].
Vector3D Vector3MoveTowards(
  Vector3D v,
  Vector3D target,
  double maxDistance,
) => _module.Vector3MoveTowards(v, target, maxDistance);

/// See [RaylibVector3ExtDart.Vector3Lerp].
Vector3D Vector3Lerp(
  Vector3D v1,
  Vector3D v2,
  double amount,
) => _module.Vector3Lerp(v1, v2, amount);

/// See [RaylibVector3ExtDart.Vector3CubicHermite].
Vector3D Vector3CubicHermite(
  Vector3D v1,
  Vector3D tangent1,
  Vector3D v2,
  Vector3D tangent2,
  double amount,
) => _module.Vector3CubicHermite(v1, tangent1, v2, tangent2, amount);

/// See [RaylibVector3ExtDart.Vector3Reflect].
Vector3D Vector3Reflect(
  Vector3D v,
  Vector3D normal,
) => _module.Vector3Reflect(v, normal);

/// See [RaylibVector3ExtDart.Vector3Min].
Vector3D Vector3Min(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Min(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Max].
Vector3D Vector3Max(
  Vector3D v1,
  Vector3D v2,
) => _module.Vector3Max(v1, v2);

/// See [RaylibVector3ExtDart.Vector3Barycenter].
Vector3D Vector3Barycenter(
  Vector3D p,
  Vector3D a,
  Vector3D b,
  Vector3D c,
) => _module.Vector3Barycenter(p, a, b, c);

/// See [RaylibVector3ExtDart.Vector3Unproject].
Vector3D Vector3Unproject(
  Vector3D source,
  MatrixD projection,
  MatrixD view,
) => _module.Vector3Unproject(source, projection, view);

/// See [RaylibVector3ExtDart.Vector3ToFloatV].
float3D Vector3ToFloatV(
  Vector3D v,
) => _module.Vector3ToFloatV(v);

/// See [RaylibVector3ExtDart.Vector3Invert].
Vector3D Vector3Invert(
  Vector3D v,
) => _module.Vector3Invert(v);

/// See [RaylibVector3ExtDart.Vector3Clamp].
Vector3D Vector3Clamp(
  Vector3D v,
  Vector3D min,
  Vector3D max,
) => _module.Vector3Clamp(v, min, max);

/// See [RaylibVector3ExtDart.Vector3ClampValue].
Vector3D Vector3ClampValue(
  Vector3D v,
  double min,
  double max,
) => _module.Vector3ClampValue(v, min, max);

/// See [RaylibVector3ExtDart.Vector3Equals].
int Vector3Equals(
  Vector3D p,
  Vector3D q,
) => _module.Vector3Equals(p, q);

/// See [RaylibVector3ExtDart.Vector3Refract].
Vector3D Vector3Refract(
  Vector3D v,
  Vector3D n,
  double r,
) => _module.Vector3Refract(v, n, r);