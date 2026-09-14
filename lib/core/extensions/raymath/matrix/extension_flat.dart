part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Audio flat module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibMatrixFlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibMatrixFlatExt(super.rl);

  /// Compute matrix determinant
  double MatrixDeterminant(
    MatrixD mat,
  );

  /// Get the trace of the matrix (sum of the values along the diagonal)
  double MatrixTrace(
    MatrixD mat,
  );

  /// Transposes provided matrix
  MatrixD MatrixTranspose(
    MatrixD mat,
  );

  /// Invert provided matrix
  MatrixD MatrixInvert(
    MatrixD mat,
  );

  /// Get identity matrix
  MatrixD MatrixIdentity();

  /// Add two matrices
  MatrixD MatrixAdd(
    MatrixD left,
    MatrixD right,
  );

  /// Subtract two matrices (left - right)
  MatrixD MatrixSubtract(
    MatrixD left,
    MatrixD right,
  );

  /// Get two matrix multiplication
  /// 
  /// NOTE: When multiplying matrices... the order matters!
  MatrixD MatrixMultiply(
    MatrixD left,
    MatrixD right,
  );

  /// Multiply matrix components by value
  MatrixD MatrixMultiplyValue(
    MatrixD left,
    double value,
  );

  /// Get translation matrix
  MatrixD MatrixTranslate(
    double x,
    double y,
    double z,
  );

  /// Create rotation matrix from axis and angle
  /// 
  /// NOTE: Angle should be provided in radians
  MatrixD MatrixRotate(
    Vector3D axis,
    double angle,
  );

  /// Get x-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixD MatrixRotateX(
    double angle,  
  );

  /// Get y-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixD MatrixRotateY(
    double angle,
  );

  /// Get z-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixD MatrixRotateZ(
    double angle,
  );

  /// Get xyz-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixD MatrixRotateXYZ(
    Vector3D angle,
  );

  /// Get zyx-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixD MatrixRotateZYX(
    Vector3D angle,
  );

  /// Get scaling matrix
  MatrixD MatrixScale(
    double x,
    double y,
    double z,
  );

  /// Get perspective projection matrix
  MatrixD MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  );

  /// Get perspective projection matrix
  ///
  /// NOTE: Fovy angle must be provided in radians
  MatrixD MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  );

  /// Get orthographic projection matrix
  MatrixD MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  );

  /// Get camera look-at matrix (view matrix)
  MatrixD MatrixLookAt(
    Vector3D eye,
    Vector3D target,
    Vector3D up,
  );

  /// Get float array of matrix data
  float16D MatrixToFloatV(
    MatrixD mat,
  );

  /// Compose a transformation matrix from rotational, translational and scaling components
  MatrixD MatrixCompose(
    Vector3D translation,
    QuaternionD rotation,
    Vector3D scale,
  );

  /// Decompose a transformation matrix into its rotational, translational and scaling components and remove shear
  void MatrixDecompose(
    MatrixD mat,
    StructPointer<Vector3D> translation,
    StructPointer<QuaternionD> rotation,
    StructPointer<Vector3D> scale,
  );
}