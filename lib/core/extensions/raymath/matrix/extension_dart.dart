part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's matrix math API as module-level functions by delegating
/// to the corresponding [MatrixD] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibMatrixExtDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibMatrixExtDartDebugLabels();

  RaylibMatrixExtDart(super.rl);

  /// See [MatrixD.determinant].
  double MatrixDeterminant(
    MatrixD mat,
  ) => run(
    () => _debugLabels.MatrixDeterminant(mat),
    () => mat.determinant(),
  );

  /// See [MatrixD.trace].
  double MatrixTrace(
    MatrixD mat,
  ) => run(
    () => _debugLabels.MatrixTrace(mat),
    () => mat.trace(),
  );

  /// See [MatrixD.transpose].
  MatrixD MatrixTranspose(
    MatrixD mat,
  ) => run(
    () => _debugLabels.MatrixTranspose(mat),
    () => mat.transpose(),
  );

  /// See [MatrixD.invert].
  MatrixD MatrixInvert(
    MatrixD mat,
  ) => run(
    () => _debugLabels.MatrixInvert(mat),
    () => mat.invert(),
  );

  /// See [MatrixD.identity].
  MatrixD MatrixIdentity() => run(
    () => _debugLabels.MatrixIdentity(),
    () => .identity(),
  );

  /// See [MatrixD.add].
  MatrixD MatrixAdd(
    MatrixD left,
    MatrixD right,
  ) => run(
    () => _debugLabels.MatrixAdd(left, right),
    () => left.add(right),
  );

  /// See [MatrixD.sub].
  MatrixD MatrixSubtract(
    MatrixD left,
    MatrixD right,
  ) => run(
    () => _debugLabels.MatrixSubtract(left, right),
    () => left.sub(right),
  );

  /// See [MatrixD.mul].
  MatrixD MatrixMultiply(
    MatrixD left,
    MatrixD right,
  ) => run(
    () => _debugLabels.MatrixMultiply(left, right),
    () => left.mul(right),
  );

  /// See [MatrixD.mulValue].
  MatrixD MatrixMultiplyValue(
    MatrixD left,
    double value,
  ) => run(
    () => _debugLabels.MatrixMultiplyValue(left, value),
    () => left.mulValue(value),
  );

  /// See [MatrixD.translate].
  MatrixD MatrixTranslate(
    double x,
    double y,
    double z,
  ) => run(
    () => _debugLabels.MatrixTranslate(x, y, z),
    () => .translate(x, y, z),
  );

  /// See [MatrixD.rotateAngle].
  MatrixD MatrixRotate(
    Vector3D axis,
    double angle,
  ) => run(
    () => _debugLabels.MatrixRotate(axis, angle),
    () => .rotateAngle(axis, angle),
  );

  /// See [MatrixD.rotateX].
  MatrixD MatrixRotateX(
    double angle,
  ) => run(
    () => _debugLabels.MatrixRotateX(angle),
    () => .rotateX(angle),
  );

  /// See [MatrixD.rotateY].
  MatrixD MatrixRotateY(
    double angle,
  ) => run(
    () => _debugLabels.MatrixRotateY(angle),
    () => .rotateY(angle),
  );

  /// See [MatrixD.rotateZ].
  MatrixD MatrixRotateZ(
    double angle,
  ) => run(
    () => _debugLabels.MatrixRotateZ(angle),
    () => .rotateZ(angle),
  );

  /// See [MatrixD.rotateXYZ].
  MatrixD MatrixRotateXYZ(
    Vector3D angle,
  ) => run(
    () => _debugLabels.MatrixRotateXYZ(angle),
    () => .rotateXYZ(angle),
  );

  /// See [MatrixD.rotateZYX].
  MatrixD MatrixRotateZYX(
    Vector3D angle,
  ) => run(
    () => _debugLabels.MatrixRotateZYX(angle),
    () => .rotateZYX(angle),
  );

  /// See [MatrixD.scale].
  MatrixD MatrixScale(
    double x,
    double y,
    double z,
  ) => run(
    () => _debugLabels.MatrixScale(x, y, z),
    () => .scale(x, y, z),
  );

  /// See [MatrixD.frustum].
  MatrixD MatrixFrustum(
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
  MatrixD MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => run(
    () => _debugLabels.MatrixPerspective(fovY, aspect, nearPlane, farPlane),
    () => .perspective(fovY, aspect, nearPlane, farPlane),
  );

  /// See [MatrixD.ortho].
  MatrixD MatrixOrtho(
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
  MatrixD MatrixLookAt(
    Vector3D eye,
    Vector3D target,
    Vector3D up,
  ) => run(
    () => _debugLabels.MatrixLookAt(eye, target, up),
    () => .lookAt(eye, target, up),
  );
  
  /// See [MatrixD.toFloatV].
  float16D MatrixToFloatV(
    MatrixD mat,
  ) => run(
    () => _debugLabels.MatrixToFloatV(mat),
    () => mat.toFloatV(),
  );

  /// See [MatrixD.compose].
  MatrixD MatrixCompose(
    Vector3D translation,
    QuaternionD rotation, 
    Vector3D scale,
  ) => run(
    () => _debugLabels.MatrixCompose(translation, rotation, scale),
    () => .compose(translation, rotation, scale),
  );

  /// See [MatrixD.decompose].
  (Vector3D translation, QuaternionD rotation, Vector3D scale) MatrixDecompose(
    MatrixD mat,
  ) => run(
    () => _debugLabels.MatrixDecompose(mat),
    () => mat.decompose(),
  );
}