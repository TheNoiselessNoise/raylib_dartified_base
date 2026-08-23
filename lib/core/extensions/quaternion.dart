part of '../raylib_dartified_base.dart';

/// Exposes Raylib's quaternion math API as module-level functions by delegating
/// to the corresponding [QuaternionD] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibQuaternionExtension extends RaylibModule {

  RaylibQuaternionExtension(super.rl);

  /// See [QuaternionD.add].
  QuaternionD QuaternionAdd(QuaternionD q1, QuaternionD q2)
    => q1.add(q2);

  /// See [QuaternionD.addValue].
  QuaternionD QuaternionAddValue(QuaternionD q, double add)
    => q.addValue(add);

  /// See [QuaternionD.sub].
  QuaternionD QuaternionSubtract(QuaternionD q1, QuaternionD q2)
    => q1.sub(q2);

  /// See [QuaternionD.subValue].
  QuaternionD QuaternionSubtractValue(QuaternionD q, double sub)
    => q.subValue(sub);

  /// See [QuaternionD.identity].
  QuaternionD QuaternionIdentity()
    => .identity();

  /// See [QuaternionD.length].
  double QuaternionLength(QuaternionD q)
    => q.length;

  /// See [QuaternionD.normalize].
  QuaternionD QuaternionNormalize(QuaternionD q)
    => q.normalize();

  /// See [QuaternionD.invert].
  QuaternionD QuaternionInvert(QuaternionD q)
    => q.invert();

  /// See [QuaternionD.mul].
  QuaternionD QuaternionMultiply(QuaternionD q1, QuaternionD q2)
    => q1.mul(q2);

  /// See [QuaternionD.scale].
  QuaternionD QuaternionScale(QuaternionD q, double mul)
    => q.scale(mul);

  /// See [QuaternionD.div].
  QuaternionD QuaternionDivide(QuaternionD q1, QuaternionD q2)
    => q1.div(q2);

  /// See [QuaternionD.lerp].
  QuaternionD QuaternionLerp(QuaternionD q1, QuaternionD q2, double amount)
    => q1.lerp(q2, amount);

  /// See [QuaternionD.nLerp].
  QuaternionD QuaternionNlerp(QuaternionD q1, QuaternionD q2, double amount)
    => q1.nLerp(q2, amount);

  /// See [QuaternionD.sLerp].
  QuaternionD QuaternionSlerp(QuaternionD q1, QuaternionD q2, double amount)
    => q1.sLerp(q2, amount);

  /// See [QuaternionD.cubicHermiteSpline].
  QuaternionD QuaternionCubicHermiteSpline(QuaternionD q1, QuaternionD outTangent1, QuaternionD q2, QuaternionD inTangent2, double t)
    => q1.cubicHermiteSpline(outTangent1, q2, inTangent2, t);

  /// See [QuaternionD.fromVector3ToVector3].
  QuaternionD QuaternionFromVector3ToVector3(Vector3D from, Vector3D to)
    => .fromVector3ToVector3(from, to);

  /// See [QuaternionD.fromMatrix].
  QuaternionD QuaternionFromMatrix(MatrixD mat)
    => .fromMatrix(mat);

  /// See [QuaternionD.toMatrix].
  MatrixD QuaternionToMatrix(QuaternionD q)
    => q.toMatrix();

  /// See [QuaternionD.fromAxisAngle].
  QuaternionD QuaternionFromAxisAngle(Vector3D axis, double angle)
    => .fromAxisAngle(axis, angle);

  /// See [QuaternionD.toAxisAngle].
  (Vector3D outAxis, double outAngle) QuaternionToAxisAngle(QuaternionD q)
    => q.toAxisAngle();

  /// See [QuaternionD.fromEuler].
  QuaternionD QuaternionFromEuler(double pitch, double yaw, double roll)
    => .fromEuler(pitch, yaw, roll);

  /// See [QuaternionD.toEuler].
  Vector3D QuaternionToEuler(QuaternionD q)
    => q.toEuler();

  /// See [QuaternionD.transform].
  QuaternionD QuaternionTransform(QuaternionD q, MatrixD mat)
    => q.transform(mat);

  /// See [QuaternionD.equals].
  bool QuaternionEquals(QuaternionD p, QuaternionD q)
    => p.equals(q);
}