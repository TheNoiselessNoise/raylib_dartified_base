part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's matrix math API as module-level functions by delegating
/// to the corresponding [Matrix] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibMatrixExtDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibMatrixExtDartDebugLabels();

  RaylibMatrixExtDart(super.rl);

  /// See [Matrix.determinant].
  double MatrixDeterminant(
    Matrix mat,
  ) => run(
    () => _debugLabels.MatrixDeterminant(mat),
    () => mat.determinant(),
  );

  /// See [Matrix.trace].
  double MatrixTrace(
    Matrix mat,
  ) => run(
    () => _debugLabels.MatrixTrace(mat),
    () => mat.trace(),
  );

  /// See [Matrix.transpose].
  Matrix MatrixTranspose(
    Matrix mat,
  ) => run(
    () => _debugLabels.MatrixTranspose(mat),
    () => mat.transpose(),
  );

  /// See [Matrix.invert].
  Matrix MatrixInvert(
    Matrix mat,
  ) => run(
    () => _debugLabels.MatrixInvert(mat),
    () => mat.invert(),
  );

  /// See [MatrixD.identity].
  Matrix MatrixIdentity() => run(
    () => _debugLabels.MatrixIdentity(),
    () => .identity(),
  );

  /// See [Matrix.add].
  Matrix MatrixAdd(
    Matrix left,
    Matrix right,
  ) => run(
    () => _debugLabels.MatrixAdd(left, right),
    () => left.add(right),
  );

  /// See [Matrix.sub].
  Matrix MatrixSubtract(
    Matrix left,
    Matrix right,
  ) => run(
    () => _debugLabels.MatrixSubtract(left, right),
    () => left.sub(right),
  );

  /// See [Matrix.mul].
  Matrix MatrixMultiply(
    Matrix left,
    Matrix right,
  ) => run(
    () => _debugLabels.MatrixMultiply(left, right),
    () => left.mul(right),
  );

  /// See [Matrix.mulValue].
  Matrix MatrixMultiplyValue(
    Matrix left,
    double value,
  ) => run(
    () => _debugLabels.MatrixMultiplyValue(left, value),
    () => left.mulValue(value),
  );

  /// See [MatrixD.translate].
  Matrix MatrixTranslate(
    double x,
    double y,
    double z,
  ) => run(
    () => _debugLabels.MatrixTranslate(x, y, z),
    () => .translate(x, y, z),
  );

  /// See [MatrixD.rotateAngle].
  Matrix MatrixRotate(
    Vector3 axis,
    double angle,
  ) => run(
    () => _debugLabels.MatrixRotate(axis, angle),
    () => .rotateAngle(axis, angle),
  );

  /// See [MatrixD.rotateX].
  Matrix MatrixRotateX(
    double angle,
  ) => run(
    () => _debugLabels.MatrixRotateX(angle),
    () => .rotateX(angle),
  );

  /// See [MatrixD.rotateY].
  Matrix MatrixRotateY(
    double angle,
  ) => run(
    () => _debugLabels.MatrixRotateY(angle),
    () => .rotateY(angle),
  );

  /// See [MatrixD.rotateZ].
  Matrix MatrixRotateZ(
    double angle,
  ) => run(
    () => _debugLabels.MatrixRotateZ(angle),
    () => .rotateZ(angle),
  );

  /// See [MatrixD.rotateXYZ].
  Matrix MatrixRotateXYZ(
    Vector3 angle,
  ) => run(
    () => _debugLabels.MatrixRotateXYZ(angle),
    () => .rotateXYZ(angle),
  );

  /// See [MatrixD.rotateZYX].
  Matrix MatrixRotateZYX(
    Vector3 angle,
  ) => run(
    () => _debugLabels.MatrixRotateZYX(angle),
    () => .rotateZYX(angle),
  );

  /// See [MatrixD.scale].
  Matrix MatrixScale(
    double x,
    double y,
    double z,
  ) => run(
    () => _debugLabels.MatrixScale(x, y, z),
    () => .scale(x, y, z),
  );

  /// See [MatrixD.frustum].
  Matrix MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => run(
    () => _debugLabels.MatrixFrustum(left, right, bottom, top, nearPlane, farPlane),
    () => .frustum(left, right, bottom, top, nearPlane, farPlane),
  );

  /// See [MatrixD.perspective].
  Matrix MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => run(
    () => _debugLabels.MatrixPerspective(fovY, aspect, nearPlane, farPlane),
    () => .perspective(fovY, aspect, nearPlane, farPlane),
  );

  /// See [MatrixD.ortho].
  Matrix MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => run(
    () => _debugLabels.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane),
    () => .ortho(left, right, bottom, top, nearPlane, farPlane),
  );

  /// See [MatrixD.lookAt].
  Matrix MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  ) => run(
    () => _debugLabels.MatrixLookAt(eye, target, up),
    () => .lookAt(eye, target, up),
  );
  
  /// See [Matrix.toFloatV].
  float16 MatrixToFloatV(
    Matrix mat,
  ) => run(
    () => _debugLabels.MatrixToFloatV(mat),
    () => mat.toFloatV(),
  );

  /// See [MatrixD.compose].
  Matrix MatrixCompose(
    Vector3 translation,
    Quaternion rotation, 
    Vector3 scale,
  ) => run(
    () => _debugLabels.MatrixCompose(translation, rotation, scale),
    () => .compose(translation, rotation, scale),
  );

  /// See [Matrix.decompose].
  (Vector3 translation, Quaternion rotation, Vector3 scale) MatrixDecompose(
    Matrix mat,
  ) => run(
    () => _debugLabels.MatrixDecompose(mat),
    () => mat.decompose(),
  );
}