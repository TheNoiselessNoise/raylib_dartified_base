import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibMatrixExtDart get _module => RaylibBase.instance.module();

/// See [RaylibMatrixExtDart.MatrixDeterminant].
double MatrixDeterminant(
  MatrixD mat,
) => _module.MatrixDeterminant(mat);

/// See [RaylibMatrixExtDart.MatrixTrace].
double MatrixTrace(
  MatrixD mat,
) => _module.MatrixTrace(mat);

/// See [RaylibMatrixExtDart.MatrixTranspose].
MatrixD MatrixTranspose(
  MatrixD mat,
) => _module.MatrixTranspose(mat);

/// See [RaylibMatrixExtDart.MatrixInvert].
MatrixD MatrixInvert(
  MatrixD mat,
) => _module.MatrixInvert(mat);

/// See [RaylibMatrixExtDart.MatrixIdentity].
MatrixD MatrixIdentity() => _module.MatrixIdentity();

/// See [RaylibMatrixExtDart.MatrixAdd].
MatrixD MatrixAdd(
  MatrixD left,
  MatrixD right,
) => _module.MatrixAdd(left, right);

/// See [RaylibMatrixExtDart.MatrixSubtract].
MatrixD MatrixSubtract(
  MatrixD left,
  MatrixD right,
) => _module.MatrixSubtract(left, right);

/// See [RaylibMatrixExtDart.MatrixMultiply].
MatrixD MatrixMultiply(
  MatrixD left,
  MatrixD right,
) => _module.MatrixMultiply(left, right);

/// See [RaylibMatrixExtDart.MatrixMultiplyValue].
MatrixD MatrixMultiplyValue(
  MatrixD left,
  double value,
) => _module.MatrixMultiplyValue(left, value);

/// See [RaylibMatrixExtDart.MatrixTranslate].
MatrixD MatrixTranslate(
  double x,
  double y,
  double z,
) => _module.MatrixTranslate(x, y, z);

/// See [RaylibMatrixExtDart.MatrixRotate].
MatrixD MatrixRotate(
  Vector3D axis,
  double angle,
) => _module.MatrixRotate(axis, angle);

/// See [RaylibMatrixExtDart.MatrixRotateX].
MatrixD MatrixRotateX(
  double angle,
) => _module.MatrixRotateX(angle);

/// See [RaylibMatrixExtDart.MatrixRotateY].
MatrixD MatrixRotateY(
  double angle,
) => _module.MatrixRotateY(angle);

/// See [RaylibMatrixExtDart.MatrixRotateZ].
MatrixD MatrixRotateZ(
  double angle,
) => _module.MatrixRotateZ(angle);

/// See [RaylibMatrixExtDart.MatrixRotateXYZ].
MatrixD MatrixRotateXYZ(
  Vector3D angle,
) => _module.MatrixRotateXYZ(angle);

/// See [RaylibMatrixExtDart.MatrixRotateZYX].
MatrixD MatrixRotateZYX(
  Vector3D angle,
) => _module.MatrixRotateZYX(angle);

/// See [RaylibMatrixExtDart.MatrixScale].
MatrixD MatrixScale(
  double x,
  double y,
  double z,
) => _module.MatrixScale(x, y, z);

/// See [RaylibMatrixExtDart.MatrixFrustum].
MatrixD MatrixFrustum(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixFrustum(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixExtDart.MatrixPerspective].
MatrixD MatrixPerspective(
  double fovY,
  double aspect,
  double nearPlane,
  double farPlane,
) => _module.MatrixPerspective(fovY, aspect, nearPlane, farPlane);

/// See [RaylibMatrixExtDart.MatrixOrtho].
MatrixD MatrixOrtho(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixExtDart.MatrixLookAt].
MatrixD MatrixLookAt(
  Vector3D eye,
  Vector3D target,
  Vector3D up,
) => _module.MatrixLookAt(eye, target, up);

/// See [RaylibMatrixExtDart.MatrixToFloatV].
float16D MatrixToFloatV(
  MatrixD mat,
) => _module.MatrixToFloatV(mat);

/// See [RaylibMatrixExtDart.MatrixCompose].
MatrixD MatrixCompose(
  Vector3D translation,
  QuaternionD rotation,
  Vector3D scale,
) => _module.MatrixCompose(translation, rotation, scale);

/// See [RaylibMatrixExtDart.MatrixDecompose].
(Vector3D translation, QuaternionD rotation, Vector3D scale) MatrixDecompose(
  MatrixD mat,
) => _module.MatrixDecompose(mat);