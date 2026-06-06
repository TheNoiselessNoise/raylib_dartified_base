part of '../raylib_dartified_base.dart';

/// Exposes Raylib's quaternion math API as module-level functions by delegating
/// to the corresponding [QuaternionBase] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibQuaternionExtensionBase<
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
  RectangleStructType extends RectangleBase<RectangleStructType>,
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

  RaylibQuaternionExtensionBase(super.rl);

  /// See [QuaternionBase.add].
  QuaternionStructType QuaternionAdd(QuaternionStructType q1, QuaternionStructType q2)
    => q1.add(q2);

  /// See [QuaternionBase.addValue].
  QuaternionStructType QuaternionAddValue(QuaternionStructType q, double add)
    => q.addValue(add);

  /// See [QuaternionBase.sub].
  QuaternionStructType QuaternionSubtract(QuaternionStructType q1, QuaternionStructType q2)
    => q1.sub(q2);

  /// See [QuaternionBase.subValue].
  QuaternionStructType QuaternionSubtractValue(QuaternionStructType q, double sub)
    => q.subValue(sub);

  /// See [RaylibQuaternionFactories.identity].
  QuaternionStructType QuaternionIdentity()
    => RaylibQuaternionFactories.identity() as QuaternionStructType;

  /// See [QuaternionBase.length].
  double QuaternionLength(QuaternionStructType q)
    => q.length;

  /// See [QuaternionBase.normalize].
  QuaternionStructType QuaternionNormalize(QuaternionStructType q)
    => q.normalize();

  /// See [QuaternionBase.invert].
  QuaternionStructType QuaternionInvert(QuaternionStructType q)
    => q.invert();

  /// See [QuaternionBase.mul].
  QuaternionStructType QuaternionMultiply(QuaternionStructType q1, QuaternionStructType q2)
    => q1.mul(q2);

  /// See [QuaternionBase.scale].
  QuaternionStructType QuaternionScale(QuaternionStructType q, double mul)
    => q.scale(mul);

  /// See [QuaternionBase.div].
  QuaternionStructType QuaternionDivide(QuaternionStructType q1, QuaternionStructType q2)
    => q1.div(q2);

  /// See [QuaternionBase.lerp].
  QuaternionStructType QuaternionLerp(QuaternionStructType q1, QuaternionStructType q2, double amount)
    => q1.lerp(q2, amount);

  /// See [QuaternionBase.nLerp].
  QuaternionStructType QuaternionNlerp(QuaternionStructType q1, QuaternionStructType q2, double amount)
    => q1.nLerp(q2, amount);

  /// See [QuaternionBase.sLerp].
  QuaternionStructType QuaternionSlerp(QuaternionStructType q1, QuaternionStructType q2, double amount)
    => q1.sLerp(q2, amount);

  /// See [QuaternionBase.cubicHermiteSpline].
  QuaternionStructType QuaternionCubicHermiteSpline(QuaternionStructType q1, QuaternionStructType outTangent1, QuaternionStructType q2, QuaternionStructType inTangent2, double t)
    => q1.cubicHermiteSpline(outTangent1, q2, inTangent2, t);

  /// See [RaylibQuaternionFactories.fromVector3ToVector3].
  QuaternionStructType QuaternionFromVector3ToVector3(Vector3StructType from, Vector3StructType to)
    => RaylibQuaternionFactories.fromVector3ToVector3(from, to) as QuaternionStructType;

  /// See [RaylibQuaternionFactories.fromMatrix].
  QuaternionStructType QuaternionFromMatrix(MatrixStructType mat)
    => RaylibQuaternionFactories.fromMatrix(mat) as QuaternionStructType;

  /// See [QuaternionBase.toMatrix].
  MatrixStructType QuaternionToMatrix(QuaternionStructType q)
    => q.toMatrix();

  /// See [RaylibQuaternionFactories.fromAxisAngle].
  QuaternionStructType QuaternionFromAxisAngle(Vector3StructType axis, double angle)
    => RaylibQuaternionFactories.fromAxisAngle(axis, angle) as QuaternionStructType;

  /// See [QuaternionBase.toAxisAngle].
  (Vector3StructType outAxis, double outAngle) QuaternionToAxisAngle(QuaternionStructType q)
    => q.toAxisAngle();

  /// See [RaylibQuaternionFactories.fromEuler].
  QuaternionStructType QuaternionFromEuler(double pitch, double yaw, double roll)
    => RaylibQuaternionFactories.fromEuler(pitch, yaw, roll) as QuaternionStructType;

  /// See [QuaternionBase.toEuler].
  Vector3StructType QuaternionToEuler(QuaternionStructType q)
    => q.toEuler();

  /// See [QuaternionBase.transform].
  QuaternionStructType QuaternionTransform(QuaternionStructType q, MatrixStructType mat)
    => q.transform(mat);

  /// See [QuaternionBase.equals].
  bool QuaternionEquals(QuaternionStructType p, QuaternionStructType q)
    => p.equals(q);
}