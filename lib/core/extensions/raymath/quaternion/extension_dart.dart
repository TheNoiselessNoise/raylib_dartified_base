part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's quaternion math API as module-level functions by delegating
/// to the corresponding [Quaternion] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibQuaternionExtDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibQuaternionExtDartDebugLabels();

  RaylibQuaternionExtDart(super.rl);

  /// See [Quaternion.add].
  Quaternion QuaternionAdd(
    Quaternion q1,
    Quaternion q2,
  ) => run(
    () => _debugLabels.QuaternionAdd(q1, q2),
    () => q1.add(q2),
  );

  /// See [Quaternion.addValue].
  Quaternion QuaternionAddValue(
    Quaternion q,
    double add,
  ) => run(
    () => _debugLabels.QuaternionAddValue(q, add),
    () => q.addValue(add),
  );

  /// See [Quaternion.sub].
  Quaternion QuaternionSubtract(
    Quaternion q1,
    Quaternion q2,
  ) => run(
    () => _debugLabels.QuaternionSubtract(q1, q2),
    () => q1.sub(q2),
  );

  /// See [Quaternion.subValue].
  Quaternion QuaternionSubtractValue(
    Quaternion q,
    double sub,
  ) => run(
    () => _debugLabels.QuaternionSubtractValue(q, sub),
    () => q.subValue(sub),
  );

  /// See [QuaternionD.identity].
  Quaternion QuaternionIdentity() => run(
    () => _debugLabels.QuaternionIdentity(),
    () => .identity(),
  );

  /// See [Quaternion.length].
  double QuaternionLength(
    Quaternion q,
  ) => run(
    () => _debugLabels.QuaternionLength(q),
    () => q.length,
  );

  /// See [Quaternion.normalize].
  Quaternion QuaternionNormalize(
    Quaternion q,
  ) => run(
    () => _debugLabels.QuaternionNormalize(q),
    () => q.normalize(),
  );

  /// See [Quaternion.invert].
  Quaternion QuaternionInvert(
    Quaternion q,
  ) => run(
    () => _debugLabels.QuaternionInvert(q),
    () => q.invert(),
  );

  /// See [Quaternion.mul].
  Quaternion QuaternionMultiply(
    Quaternion q1,
    Quaternion q2,
  ) => run(
    () => _debugLabels.QuaternionMultiply(q1, q2),
    () => q1.mul(q2),
  );

  /// See [Quaternion.scale].
  Quaternion QuaternionScale(
    Quaternion q,
    double mul,
  ) => run(
    () => _debugLabels.QuaternionScale(q, mul),
    () => q.scale(mul),
  );

  /// See [Quaternion.div].
  Quaternion QuaternionDivide(
    Quaternion q1,
    Quaternion q2,
  ) => run(
    () => _debugLabels.QuaternionDivide(q1, q2),
    () => q1.div(q2),
  );

  /// See [Quaternion.lerp].
  Quaternion QuaternionLerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => run(
    () => _debugLabels.QuaternionLerp(q1, q2, amount),
    () => q1.lerp(q2, amount),
  );

  /// See [Quaternion.nLerp].
  Quaternion QuaternionNlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => run(
    () => _debugLabels.QuaternionNlerp(q1, q2, amount),
    () => q1.nLerp(q2, amount),
  );

  /// See [Quaternion.sLerp].
  Quaternion QuaternionSlerp(
    Quaternion q1,
    Quaternion q2,
    double amount,
  ) => run(
    () => _debugLabels.QuaternionSlerp(q1, q2, amount),
    () => q1.sLerp(q2, amount),
  );

  /// See [Quaternion.cubicHermiteSpline].
  Quaternion QuaternionCubicHermiteSpline(
    Quaternion q1,
    Quaternion outTangent1,
    Quaternion q2,
    Quaternion inTangent2,
    double t,
  ) => run(
    () => _debugLabels.QuaternionCubicHermiteSpline(q1, outTangent1, q2, inTangent2, t),
    () => q1.cubicHermiteSpline(outTangent1, q2, inTangent2, t),
  );

  /// See [QuaternionD.fromVector3ToVector3].
  Quaternion QuaternionFromVector3ToVector3(
    Vector3 from,
    Vector3 to,
  ) => run(
    () => _debugLabels.QuaternionFromVector3ToVector3(from, to),
    () => .fromVector3ToVector3(from, to),
  );

  /// See [QuaternionD.fromMatrix].
  Quaternion QuaternionFromMatrix(
    Matrix mat,
  ) => run(
    () => _debugLabels.QuaternionFromMatrix(mat),
    () => .fromMatrix(mat),
  );

  /// See [Quaternion.toMatrix].
  Matrix QuaternionToMatrix(
    Quaternion q,
  ) => run(
    () => _debugLabels.QuaternionToMatrix(q),
    () => q.toMatrix(),
  );

  /// See [QuaternionD.fromAxisAngle].
  Quaternion QuaternionFromAxisAngle(
    Vector3 axis,
    double angle,
  ) => run(
    () => _debugLabels.QuaternionFromAxisAngle(axis, angle),
    () => .fromAxisAngle(axis, angle),
  );

  /// See [Quaternion.toAxisAngle].
  (Vector3 outAxis, double outAngle) QuaternionToAxisAngle(
    Quaternion q,
  ) => run(
    () => _debugLabels.QuaternionToAxisAngle(q),
    () => q.toAxisAngle(),
  );

  /// See [QuaternionD.fromEuler].
  Quaternion QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  ) => run(
    () => _debugLabels.QuaternionFromEuler(pitch, yaw, roll),
    () => .fromEuler(pitch, yaw, roll),
  );

  /// See [Quaternion.toEuler].
  Vector3 QuaternionToEuler(
    Quaternion q,
  ) => run(
    () => _debugLabels.QuaternionToEuler(q),
    () => q.toEuler(),
  );

  /// See [Quaternion.transform].
  Quaternion QuaternionTransform(
    Quaternion q,
    Matrix mat,
  ) => run(
    () => _debugLabels.QuaternionTransform(q, mat),
    () => q.transform(mat),
  );

  /// See [Quaternion.equals].
  bool QuaternionEquals(
    Quaternion p,
    Quaternion q,
  ) => run(
    () => _debugLabels.QuaternionEquals(p, q),
    () => p.equals(q),
  );
}