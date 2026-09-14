part of '../../../raylib_dartified_base.dart';

// TODO: debug labels and `run`

/// Exposes Raylib's matrix math API as module-level functions by delegating
/// to the corresponding [MatrixD] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibMatrixExtDart<R extends RaylibBase> extends RaylibModule<R> {

  RaylibMatrixExtDart(super.rl);

  /// See [MatrixD.determinant].
  double MatrixDeterminant(
    MatrixD mat,
  ) => mat.determinant();

  /// See [MatrixD.trace].
  double MatrixTrace(
    MatrixD mat,
  ) => mat.trace();

  /// See [MatrixD.transpose].
  MatrixD MatrixTranspose(
    MatrixD mat,
  ) => mat.transpose();

  /// See [MatrixD.invert].
  MatrixD MatrixInvert(
    MatrixD mat,
  ) => mat.invert();

  /// See [MatrixD.identity].
  MatrixD MatrixIdentity()
    => .identity();

  /// See [MatrixD.add].
  MatrixD MatrixAdd(
    MatrixD left,
    MatrixD right,
  ) => left.add(right);

  /// See [MatrixD.sub].
  MatrixD MatrixSubtract(
    MatrixD left,
    MatrixD right,
  ) => left.sub(right);

  /// See [MatrixD.mul].
  MatrixD MatrixMultiply(
    MatrixD left,
    MatrixD right,
  ) => left.mul(right);

  /// See [MatrixD.mulValue].
  MatrixD MatrixMultiplyValue(
    MatrixD left,
    double value,
  ) => left.mulValue(value);

  /// See [MatrixD.translate].
  MatrixD MatrixTranslate(
    double x,
    double y,
    double z,
  ) => .translate(x, y, z);

  /// See [MatrixD.rotateAngle].
  MatrixD MatrixRotate(
    Vector3D axis,
    double angle,
  ) => .rotateAngle(axis, angle);

  /// See [MatrixD.rotateX].
  MatrixD MatrixRotateX(
    double angle,
  ) => .rotateX(angle);

  /// See [MatrixD.rotateY].
  MatrixD MatrixRotateY(
    double angle,
  ) => .rotateY(angle);

  /// See [MatrixD.rotateZ].
  MatrixD MatrixRotateZ(
    double angle,
  ) => .rotateZ(angle);

  /// See [MatrixD.rotateXYZ].
  MatrixD MatrixRotateXYZ(
    Vector3D angle,
  ) => .rotateXYZ(angle);

  /// See [MatrixD.rotateZYX].
  MatrixD MatrixRotateZYX(
    Vector3D angle,
  ) => .rotateZYX(angle);

  /// See [MatrixD.scale].
  MatrixD MatrixScale(
    double x,
    double y,
    double z,
  ) => .scale(x, y, z);

  /// See [MatrixD.frustum].
  MatrixD MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => .frustum(left, right, bottom, top, nearPlane, farPlane);

  /// See [MatrixD.perspective].
  MatrixD MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => .perspective(fovY, aspect, nearPlane, farPlane);

  /// See [MatrixD.ortho].
  MatrixD MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => .ortho(left, right, bottom, top, nearPlane, farPlane);

  /// See [MatrixD.lookAt].
  MatrixD MatrixLookAt(
    Vector3D eye,
    Vector3D target,
    Vector3D up,
  ) => .lookAt(eye, target, up);
  
  /// See [MatrixD.toFloatV].
  float16D MatrixToFloatV(
    MatrixD mat,
  ) => mat.toFloatV();

  /// See [MatrixD.compose].
  MatrixD MatrixCompose(
    Vector3D translation,
    QuaternionD rotation, 
    Vector3D scale,
  ) => .compose(translation, rotation, scale);

  /// See [MatrixD.decompose].
  (Vector3D translation, QuaternionD rotation, Vector3D scale) MatrixDecompose(
    MatrixD mat,
  ) => mat.decompose();
}