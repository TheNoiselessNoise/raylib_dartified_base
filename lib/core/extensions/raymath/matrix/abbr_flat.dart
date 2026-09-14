import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibMatrixFlatExt get _module => RaylibBase.instance.module();

/// See [RaylibMatrixFlatExt.MatrixDeterminant].
double MatrixDeterminant(
  MatrixD mat,
) => _module.MatrixDeterminant(mat);

/// See [RaylibMatrixFlatExt.MatrixTrace].
double MatrixTrace(
  MatrixD mat,
) => _module.MatrixTrace(mat);

/// See [RaylibMatrixFlatExt.MatrixTranspose].
MatrixD MatrixTranspose(
  MatrixD mat,
) => _module.MatrixTranspose(mat);

/// See [RaylibMatrixFlatExt.MatrixInvert].
MatrixD MatrixInvert(
  MatrixD mat,
) => _module.MatrixInvert(mat);

/// See [RaylibMatrixFlatExt.MatrixIdentity].
MatrixD MatrixIdentity() => _module.MatrixIdentity();

/// See [RaylibMatrixFlatExt.MatrixAdd].
MatrixD MatrixAdd(
  MatrixD left,
  MatrixD right,
) => _module.MatrixAdd(left, right);

/// See [RaylibMatrixFlatExt.MatrixSubtract].
MatrixD MatrixSubtract(
  MatrixD left,
  MatrixD right,
) => _module.MatrixSubtract(left, right);

/// See [RaylibMatrixFlatExt.MatrixMultiply].
MatrixD MatrixMultiply(
  MatrixD left,
  MatrixD right,
) => _module.MatrixMultiply(left, right);

/// See [RaylibMatrixFlatExt.MatrixMultiplyValue].
MatrixD MatrixMultiplyValue(
  MatrixD left,
  double value,
) => _module.MatrixMultiplyValue(left, value);

/// See [RaylibMatrixFlatExt.MatrixTranslate].
MatrixD MatrixTranslate(
  double x,
  double y,
  double z,
) => _module.MatrixTranslate(x, y, z);

/// See [RaylibMatrixFlatExt.MatrixRotate].
MatrixD MatrixRotate(
  Vector3D axis,
  double angle,
) => _module.MatrixRotate(axis, angle);

/// See [RaylibMatrixFlatExt.MatrixRotateX].
MatrixD MatrixRotateX(
  double angle,  
) => _module.MatrixRotateX(angle);

/// See [RaylibMatrixFlatExt.MatrixRotateY].
MatrixD MatrixRotateY(
  double angle,
) => _module.MatrixRotateY(angle);

/// See [RaylibMatrixFlatExt.MatrixRotateZ].
MatrixD MatrixRotateZ(
  double angle,
) => _module.MatrixRotateZ(angle);

/// See [RaylibMatrixFlatExt.MatrixRotateXYZ].
MatrixD MatrixRotateXYZ(
  Vector3D angle,
) => _module.MatrixRotateXYZ(angle);

/// See [RaylibMatrixFlatExt.MatrixRotateZYX].
MatrixD MatrixRotateZYX(
  Vector3D angle,
) => _module.MatrixRotateZYX(angle);

/// See [RaylibMatrixFlatExt.MatrixScale].
MatrixD MatrixScale(
  double x,
  double y,
  double z,
) => _module.MatrixScale(x, y, z);

/// See [RaylibMatrixFlatExt.MatrixFrustum].
MatrixD MatrixFrustum(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixFrustum(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixFlatExt.MatrixPerspective].
MatrixD MatrixPerspective(
  double fovY,
  double aspect,
  double nearPlane,
  double farPlane,
) => _module.MatrixPerspective(fovY, aspect, nearPlane, farPlane);

/// See [RaylibMatrixFlatExt.MatrixOrtho].
MatrixD MatrixOrtho(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixFlatExt.MatrixLookAt].
MatrixD MatrixLookAt(
  Vector3D eye,
  Vector3D target,
  Vector3D up,
) => _module.MatrixLookAt(eye, target, up);

/// See [RaylibMatrixFlatExt.MatrixToFloatV].
float16D MatrixToFloatV(
  MatrixD mat,
) => _module.MatrixToFloatV(mat);

/// See [RaylibMatrixFlatExt.MatrixCompose].
MatrixD MatrixCompose(
  Vector3D translation,
  QuaternionD rotation,
  Vector3D scale,
) => _module.MatrixCompose(translation, rotation, scale);

/// See [RaylibMatrixFlatExt.MatrixDecompose].
void MatrixDecompose(
  MatrixD mat,
  StructPointer<Vector3D> translation,
  StructPointer<QuaternionD> rotation,
  StructPointer<Vector3D> scale,
) => _module.MatrixDecompose(mat, translation, rotation, scale);