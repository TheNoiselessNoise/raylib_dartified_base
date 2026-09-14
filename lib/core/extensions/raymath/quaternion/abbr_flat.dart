import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibQuaternionFlatExt get _module => RaylibBase.instance.module();

/// See [RaylibQuaternionFlatExt.QuaternionAdd].
QuaternionD QuaternionAdd(
  QuaternionD q1,
  QuaternionD q2,
) => _module.QuaternionAdd(q1, q2);

/// See [RaylibQuaternionFlatExt.QuaternionAddValue].
QuaternionD QuaternionAddValue(
  QuaternionD q,
  double add,
) => _module.QuaternionAddValue(q, add);

/// See [RaylibQuaternionFlatExt.QuaternionSubtract].
QuaternionD QuaternionSubtract(
  QuaternionD q1,
  QuaternionD q2,
) => _module.QuaternionSubtract(q1, q2);

/// See [RaylibQuaternionFlatExt.QuaternionSubtractValue].
QuaternionD QuaternionSubtractValue(
  QuaternionD q,
  double sub,
) => _module.QuaternionSubtractValue(q, sub);

/// See [RaylibQuaternionFlatExt.QuaternionIdentity].
QuaternionD QuaternionIdentity() => _module.QuaternionIdentity();

/// See [RaylibQuaternionFlatExt.QuaternionLength].
double QuaternionLength(
  QuaternionD q,
) => _module.QuaternionLength(q);

/// See [RaylibQuaternionFlatExt.QuaternionNormalize].
QuaternionD QuaternionNormalize(
  QuaternionD q,
) => _module.QuaternionNormalize(q);

/// See [RaylibQuaternionFlatExt.QuaternionInvert].
QuaternionD QuaternionInvert(
  QuaternionD q,
) => _module.QuaternionInvert(q);

/// See [RaylibQuaternionFlatExt.QuaternionMultiply].
QuaternionD QuaternionMultiply(
  QuaternionD q1,
  QuaternionD q2,
) => _module.QuaternionMultiply(q1, q2);

/// See [RaylibQuaternionFlatExt.QuaternionScale].
QuaternionD QuaternionScale(
  QuaternionD q,
  double mul,
) => _module.QuaternionScale(q, mul);

/// See [RaylibQuaternionFlatExt.QuaternionDivide].
QuaternionD QuaternionDivide(
  QuaternionD q1,
  QuaternionD q2,
) => _module.QuaternionDivide(q1, q2);

/// See [RaylibQuaternionFlatExt.QuaternionLerp].
QuaternionD QuaternionLerp(
  QuaternionD q1,
  QuaternionD q2,
  double amount,
) => _module.QuaternionLerp(q1, q2, amount);

/// See [RaylibQuaternionFlatExt.QuaternionNlerp].
QuaternionD QuaternionNlerp(
  QuaternionD q1,
  QuaternionD q2,
  double amount,
) => _module.QuaternionNlerp(q1, q2, amount);

/// See [RaylibQuaternionFlatExt.QuaternionSlerp].
QuaternionD QuaternionSlerp(
  QuaternionD q1,
  QuaternionD q2,
  double amount,
) => _module.QuaternionSlerp(q1, q2, amount);

/// See [RaylibQuaternionFlatExt.QuaternionCubicHermiteSpline].
QuaternionD QuaternionCubicHermiteSpline(
  QuaternionD q1,
  QuaternionD outTangent1,
  QuaternionD q2,
  QuaternionD inTangent2,
  double t,
) => _module.QuaternionCubicHermiteSpline(q1, outTangent1, q2, inTangent2, t);

/// See [RaylibQuaternionFlatExt.QuaternionFromVector3ToVector3].
QuaternionD QuaternionFromVector3ToVector3(
  Vector3D from,
  Vector3D to,
) => _module.QuaternionFromVector3ToVector3(from, to);

/// See [RaylibQuaternionFlatExt.QuaternionFromMatrix].
QuaternionD QuaternionFromMatrix(
  MatrixD mat,
) => _module.QuaternionFromMatrix(mat);

/// See [RaylibQuaternionFlatExt.QuaternionToMatrix].
MatrixD QuaternionToMatrix(
  QuaternionD q,
) => _module.QuaternionToMatrix(q);

/// See [RaylibQuaternionFlatExt.QuaternionFromAxisAngle].
QuaternionD QuaternionFromAxisAngle(
  Vector3D axis,
  double angle,
) => _module.QuaternionFromAxisAngle(axis, angle);

/// See [RaylibQuaternionFlatExt.QuaternionToAxisAngle].
void QuaternionToAxisAngle(
  QuaternionD q,
  StructPointer<Vector3D> outAxis,
  MemoryPointer<RFloat> outAngle,
) => _module.QuaternionToAxisAngle(q, outAxis, outAngle);

/// See [RaylibQuaternionFlatExt.QuaternionFromEuler].
QuaternionD QuaternionFromEuler(
  double pitch,
  double yaw,
  double roll,
) => _module.QuaternionFromEuler(pitch, yaw, roll);

/// See [RaylibQuaternionFlatExt.QuaternionToEuler].
Vector3D QuaternionToEuler(
  QuaternionD q,
) => _module.QuaternionToEuler(q);

/// See [RaylibQuaternionFlatExt.QuaternionTransform].
QuaternionD QuaternionTransform(
  QuaternionD q,
  MatrixD mat,
) => _module.QuaternionTransform(q, mat);

/// See [RaylibQuaternionFlatExt.QuaternionEquals].
int QuaternionEquals(
  QuaternionD p,
  QuaternionD q,
) => _module.QuaternionEquals(p, q);