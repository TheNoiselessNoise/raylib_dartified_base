import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibQuaternionExtDart get _module => RaylibBase.instance.module();

/// See [RaylibQuaternionExtDart.QuaternionAdd].
QuaternionD QuaternionAdd(
  QuaternionD q1,
  QuaternionD q2,
) => _module.QuaternionAdd(q1, q2);

/// See [RaylibQuaternionExtDart.QuaternionAddValue].
QuaternionD QuaternionAddValue(
  QuaternionD q,
  double add,
) => _module.QuaternionAddValue(q, add);

/// See [RaylibQuaternionExtDart.QuaternionSubtract].
QuaternionD QuaternionSubtract(
  QuaternionD q1,
  QuaternionD q2,
) => _module.QuaternionSubtract(q1, q2);

/// See [RaylibQuaternionExtDart.QuaternionSubtractValue].
QuaternionD QuaternionSubtractValue(
  QuaternionD q,
  double sub,
) => _module.QuaternionSubtractValue(q, sub);

/// See [RaylibQuaternionExtDart.QuaternionIdentity].
QuaternionD QuaternionIdentity() => _module.QuaternionIdentity();

/// See [RaylibQuaternionExtDart.QuaternionLength].
double QuaternionLength(
  QuaternionD q,
) => _module.QuaternionLength(q);

/// See [RaylibQuaternionExtDart.QuaternionNormalize].
QuaternionD QuaternionNormalize(
  QuaternionD q,
) => _module.QuaternionNormalize(q);

/// See [RaylibQuaternionExtDart.QuaternionInvert].
QuaternionD QuaternionInvert(
  QuaternionD q,
) => _module.QuaternionInvert(q);

/// See [RaylibQuaternionExtDart.QuaternionMultiply].
QuaternionD QuaternionMultiply(
  QuaternionD q1,
  QuaternionD q2,
) => _module.QuaternionMultiply(q1, q2);

/// See [RaylibQuaternionExtDart.QuaternionScale].
QuaternionD QuaternionScale(
  QuaternionD q,
  double mul,
) => _module.QuaternionScale(q, mul);

/// See [RaylibQuaternionExtDart.QuaternionDivide].
QuaternionD QuaternionDivide(
  QuaternionD q1,
  QuaternionD q2,
) => _module.QuaternionDivide(q1, q2);

/// See [RaylibQuaternionExtDart.QuaternionLerp].
QuaternionD QuaternionLerp(
  QuaternionD q1,
  QuaternionD q2,
  double amount,
) => _module.QuaternionLerp(q1, q2, amount);

/// See [RaylibQuaternionExtDart.QuaternionNlerp].
QuaternionD QuaternionNlerp(
  QuaternionD q1,
  QuaternionD q2,
  double amount,
) => _module.QuaternionNlerp(q1, q2, amount);

/// See [RaylibQuaternionExtDart.QuaternionSlerp].
QuaternionD QuaternionSlerp(
  QuaternionD q1,
  QuaternionD q2,
  double amount,
) => _module.QuaternionSlerp(q1, q2, amount);

/// See [RaylibQuaternionExtDart.QuaternionCubicHermiteSpline].
QuaternionD QuaternionCubicHermiteSpline(
  QuaternionD q1,
  QuaternionD outTangent1,
  QuaternionD q2,
  QuaternionD inTangent2,
  double t,
) => _module.QuaternionCubicHermiteSpline(q1, outTangent1, q2, inTangent2, t);

/// See [RaylibQuaternionExtDart.QuaternionFromVector3ToVector3].
QuaternionD QuaternionFromVector3ToVector3(
  Vector3D from,
  Vector3D to,
) => _module.QuaternionFromVector3ToVector3(from, to);

/// See [RaylibQuaternionExtDart.QuaternionFromMatrix].
QuaternionD QuaternionFromMatrix(
  MatrixD mat,
) => _module.QuaternionFromMatrix(mat);

/// See [RaylibQuaternionExtDart.QuaternionToMatrix].
MatrixD QuaternionToMatrix(
  QuaternionD q,
) => _module.QuaternionToMatrix(q);

/// See [RaylibQuaternionExtDart.QuaternionFromAxisAngle].
QuaternionD QuaternionFromAxisAngle(
  Vector3D axis,
  double angle,
) => _module.QuaternionFromAxisAngle(axis, angle);

/// See [RaylibQuaternionExtDart.QuaternionToAxisAngle].
(Vector3D outAxis, double outAngle) QuaternionToAxisAngle(
  QuaternionD q,
) => _module.QuaternionToAxisAngle(q);

/// See [RaylibQuaternionExtDart.QuaternionFromEuler].
QuaternionD QuaternionFromEuler(
  double pitch,
  double yaw,
  double roll,
) => _module.QuaternionFromEuler(pitch, yaw, roll);

/// See [RaylibQuaternionExtDart.QuaternionToEuler].
Vector3D QuaternionToEuler(
  QuaternionD q,
) => _module.QuaternionToEuler(q);

/// See [RaylibQuaternionExtDart.QuaternionTransform].
QuaternionD QuaternionTransform(
  QuaternionD q,
  MatrixD mat,
) => _module.QuaternionTransform(q, mat);

/// See [RaylibQuaternionExtDart.QuaternionEquals].
bool QuaternionEquals(
  QuaternionD p,
  QuaternionD q,
) => _module.QuaternionEquals(p, q);