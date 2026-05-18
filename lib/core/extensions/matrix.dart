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

  double MatrixDeterminant(MatrixStructType mat) => mat.determinant();

  double MatrixTrace(MatrixStructType mat) => mat.trace();

  MatrixStructType MatrixTranspose(MatrixStructType mat) => mat.transpose();

  MatrixStructType MatrixInvert(MatrixStructType mat) => mat.invert();

  MatrixStructType MatrixIdentity()
    => RaylibMatrixFactories.identity() as MatrixStructType;

  MatrixStructType MatrixAdd(MatrixStructType left, MatrixStructType right) => left.add(right);

  MatrixStructType MatrixSubtract(MatrixStructType left, MatrixStructType right) => left.sub(right);

  MatrixStructType MatrixMultiply(MatrixStructType left, MatrixStructType right) => left.mul(right);

  MatrixStructType MatrixTranslate(double x, double y, double z)
    => RaylibMatrixFactories.translate(x, y, z) as MatrixStructType;

  MatrixStructType MatrixRotate(Vector3StructType axis, double angle)
    => RaylibMatrixFactories.rotateAngle(axis, angle) as MatrixStructType;

  MatrixStructType MatrixRotateX(double angle)
    => RaylibMatrixFactories.rotateX(angle) as MatrixStructType;

  MatrixStructType MatrixRotateY(double angle)
    => RaylibMatrixFactories.rotateY(angle) as MatrixStructType;

  MatrixStructType MatrixRotateZ(double angle)
    => RaylibMatrixFactories.rotateZ(angle) as MatrixStructType;

  MatrixStructType MatrixRotateXYZ(Vector3StructType angle)
    => RaylibMatrixFactories.rotateXYZ(angle) as MatrixStructType;

  MatrixStructType MatrixRotateZYX(Vector3StructType angle)
    => RaylibMatrixFactories.rotateZYX(angle) as MatrixStructType;

  MatrixStructType MatrixScale(double x, double y, double z)
    => RaylibMatrixFactories.scale(x, y, z) as MatrixStructType;

  MatrixStructType MatrixFrustum(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => RaylibMatrixFactories.frustum(left, right, bottom, top, nearPlane, farPlane) as MatrixStructType;

  MatrixStructType MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane)
    => RaylibMatrixFactories.perspective(fovY, aspect, nearPlane, farPlane) as MatrixStructType;

  MatrixStructType MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => RaylibMatrixFactories.ortho(left, right, bottom, top, nearPlane, farPlane) as MatrixStructType;

  MatrixStructType MatrixLookAt(Vector3StructType eye, Vector3StructType target, Vector3StructType up)
    => RaylibMatrixFactories.lookAt(eye, target, up) as MatrixStructType;

  (Vector3StructType translation, QuaternionStructType rotation, Vector3StructType scale) MatrixDecompose(MatrixStructType mat)
    => mat.decompose();
}