part of '../../../raylib_dartified_base.dart';

class _RaylibQuaternionExtDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibQuaternionExtDart.QuaternionAdd].
  String QuaternionAdd(
    QuaternionD q1,
    QuaternionD q2,
  ) => 'QuaternionAdd($q1, $q2)';

  /// Label for [RaylibQuaternionExtDart.QuaternionAddValue].
  String QuaternionAddValue(
    QuaternionD q,
    double add,
  ) => 'QuaternionAddValue($q, $add)';

  /// Label for [RaylibQuaternionExtDart.QuaternionSubtract].
  String QuaternionSubtract(
    QuaternionD q1,
    QuaternionD q2,
  ) => 'QuaternionSubtract($q1, $q2)';

  /// Label for [RaylibQuaternionExtDart.QuaternionSubtractValue].
  String QuaternionSubtractValue(
    QuaternionD q,
    double sub,
  ) => 'QuaternionSubtractValue($q, $sub)';

  /// Label for [RaylibQuaternionExtDart.QuaternionIdentity].
  String QuaternionIdentity()
    => 'QuaternionIdentity()';

  /// Label for [RaylibQuaternionExtDart.QuaternionLength].
  String QuaternionLength(
    QuaternionD q,
  ) => 'QuaternionLength($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionNormalize].
  String QuaternionNormalize(
    QuaternionD q,
  ) => 'QuaternionNormalize($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionInvert].
  String QuaternionInvert(
    QuaternionD q,
  ) => 'QuaternionInvert($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionMultiply].
  String QuaternionMultiply(
    QuaternionD q1,
    QuaternionD q2,
  ) => 'QuaternionMultiply($q1, $q2)';

  /// Label for [RaylibQuaternionExtDart.QuaternionScale].
  String QuaternionScale(
    QuaternionD q,
    double mul,
  ) => 'QuaternionScale($q, $mul)';

  /// Label for [RaylibQuaternionExtDart.QuaternionDivide].
  String QuaternionDivide(
    QuaternionD q1,
    QuaternionD q2,
  ) => 'QuaternionDivide($q1, $q2)';

  /// Label for [RaylibQuaternionExtDart.QuaternionLerp].
  String QuaternionLerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => 'QuaternionLerp($q1, $q2, $amount)';

  /// Label for [RaylibQuaternionExtDart.QuaternionNlerp].
  String QuaternionNlerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => 'QuaternionNlerp($q1, $q2, $amount)';

  /// Label for [RaylibQuaternionExtDart.QuaternionSlerp].
  String QuaternionSlerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  ) => 'QuaternionSlerp($q1, $q2, $amount)';

  /// Label for [RaylibQuaternionExtDart.QuaternionCubicHermiteSpline].
  String QuaternionCubicHermiteSpline(
    QuaternionD q1,
    QuaternionD outTangent1,
    QuaternionD q2,
    QuaternionD inTangent2,
    double t,
  ) => 'QuaternionCubicHermiteSpline($q1, $outTangent1, $q2, $inTangent2, $t)';

  /// Label for [RaylibQuaternionExtDart.QuaternionFromVector3ToVector3].
  String QuaternionFromVector3ToVector3(
    Vector3D from,
    Vector3D to,
  ) => 'QuaternionFromVector3ToVector3($from, $to)';

  /// Label for [RaylibQuaternionExtDart.QuaternionFromMatrix].
  String QuaternionFromMatrix(
    MatrixD mat,
  ) => 'QuaternionFromMatrix($mat)';

  /// Label for [RaylibQuaternionExtDart.QuaternionToMatrix].
  String QuaternionToMatrix(
    QuaternionD q,
  ) => 'QuaternionToMatrix($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionFromAxisAngle].
  String QuaternionFromAxisAngle(
    Vector3D axis,
    double angle,
  ) => 'QuaternionFromAxisAngle($axis, $angle)';

  /// Label for [RaylibQuaternionExtDart.QuaternionToAxisAngle].
  String QuaternionToAxisAngle(
    QuaternionD q,
  ) => 'QuaternionToAxisAngle($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionFromEuler].
  String QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => 'QuaternionFromEuler($pitch, $yaw, $roll)';

  /// Label for [RaylibQuaternionExtDart.QuaternionToEuler].
  String QuaternionToEuler(
    QuaternionD q,
  ) => 'QuaternionToEuler($q)';

  /// Label for [RaylibQuaternionExtDart.QuaternionTransform].
  String QuaternionTransform(
    QuaternionD q,
    MatrixD mat,
  ) => 'QuaternionTransform($q, $mat)';

  /// Label for [RaylibQuaternionExtDart.QuaternionEquals].
  String QuaternionEquals(
    QuaternionD p,
    QuaternionD q,
  ) => 'QuaternionEquals($p, $q)';
  
}
