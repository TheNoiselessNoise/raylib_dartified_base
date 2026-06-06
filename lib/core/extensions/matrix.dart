part of '../raylib_dartified_base.dart';

/// Exposes Raylib's matrix math API as module-level functions by delegating
/// to the corresponding [MatrixBase] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibMatrixExtensionBase<
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

  RaylibMatrixExtensionBase(super.rl);

  /// See [MatrixBase.determinant].
  double MatrixDeterminant(MatrixStructType mat)
    => mat.determinant();

  /// See [MatrixBase.trace].
  double MatrixTrace(MatrixStructType mat)
    => mat.trace();

  /// See [MatrixBase.transpose].
  MatrixStructType MatrixTranspose(MatrixStructType mat)
    => mat.transpose();

  /// See [MatrixBase.invert].
  MatrixStructType MatrixInvert(MatrixStructType mat)
    => mat.invert();

  /// See [RaylibMatrixFactories.identity].
  MatrixStructType MatrixIdentity()
    => RaylibMatrixFactories.identity() as MatrixStructType;

  /// See [MatrixBase.add].
  MatrixStructType MatrixAdd(MatrixStructType left, MatrixStructType right)
    => left.add(right);

  /// See [MatrixBase.sub].
  MatrixStructType MatrixSubtract(MatrixStructType left, MatrixStructType right)
    => left.sub(right);

  /// See [MatrixBase.mul].
  MatrixStructType MatrixMultiply(MatrixStructType left, MatrixStructType right)
    => left.mul(right);

  /// See [RaylibMatrixFactories.translate].
  MatrixStructType MatrixTranslate(double x, double y, double z)
    => RaylibMatrixFactories.translate(x, y, z) as MatrixStructType;

  /// See [RaylibMatrixFactories.rotateAngle].
  MatrixStructType MatrixRotate(Vector3StructType axis, double angle)
    => RaylibMatrixFactories.rotateAngle(axis, angle) as MatrixStructType;

  /// See [RaylibMatrixFactories.rotateX].
  MatrixStructType MatrixRotateX(double angle)
    => RaylibMatrixFactories.rotateX(angle) as MatrixStructType;

  /// See [RaylibMatrixFactories.rotateY].
  MatrixStructType MatrixRotateY(double angle)
    => RaylibMatrixFactories.rotateY(angle) as MatrixStructType;

  /// See [RaylibMatrixFactories.rotateZ].
  MatrixStructType MatrixRotateZ(double angle)
    => RaylibMatrixFactories.rotateZ(angle) as MatrixStructType;

  /// See [RaylibMatrixFactories.rotateXYZ].
  MatrixStructType MatrixRotateXYZ(Vector3StructType angle)
    => RaylibMatrixFactories.rotateXYZ(angle) as MatrixStructType;

  /// See [RaylibMatrixFactories.rotateZYX].
  MatrixStructType MatrixRotateZYX(Vector3StructType angle)
    => RaylibMatrixFactories.rotateZYX(angle) as MatrixStructType;

  /// See [RaylibMatrixFactories.scale].
  MatrixStructType MatrixScale(double x, double y, double z)
    => RaylibMatrixFactories.scale(x, y, z) as MatrixStructType;

  /// See [RaylibMatrixFactories.frustum].
  MatrixStructType MatrixFrustum(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => RaylibMatrixFactories.frustum(left, right, bottom, top, nearPlane, farPlane) as MatrixStructType;

  /// See [RaylibMatrixFactories.perspective].
  MatrixStructType MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane)
    => RaylibMatrixFactories.perspective(fovY, aspect, nearPlane, farPlane) as MatrixStructType;

  /// See [RaylibMatrixFactories.ortho].
  MatrixStructType MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => RaylibMatrixFactories.ortho(left, right, bottom, top, nearPlane, farPlane) as MatrixStructType;

  /// See [RaylibMatrixFactories.lookAt].
  MatrixStructType MatrixLookAt(Vector3StructType eye, Vector3StructType target, Vector3StructType up)
    => RaylibMatrixFactories.lookAt(eye, target, up) as MatrixStructType;

  /// See [MatrixBase.decompose].
  (Vector3StructType translation, QuaternionStructType rotation, Vector3StructType scale) MatrixDecompose(MatrixStructType mat)
    => mat.decompose();
}