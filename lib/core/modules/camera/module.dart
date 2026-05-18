part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Camera module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full Core API surface across different backends.
abstract class RaylibCameraModuleBase<
  R extends RaylibBase,

  // types
  Camera3DStructType extends Camera3DBase<
    Camera3DStructType,
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
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

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibCameraModuleDebugLabels();

  RaylibCameraModuleBase(super.rl);

  Vector3StructType GetCameraForward(
    Camera3DStructType camera,
  );

  Vector3StructType GetCameraUp(
    Camera3DStructType camera,
  );

  Vector3StructType GetCameraRight(
    Camera3DStructType camera,
  );

  void CameraMoveForward(
    Camera3DStructType camera,
    num distance,
    bool moveInWorldPlane,
  );

  void CameraMoveUp(
    Camera3DStructType camera,
    num distance,
  );

  void CameraMoveRight(
    Camera3DStructType camera,
    num distance,
    bool moveInWorldPlane,
  );

  void CameraMoveToTarget(
    Camera3DStructType camera,
    num delta,
  );

  void CameraYaw(
    Camera3DStructType camera,
    num angle,
    bool rotateAroundTarget,
  );

  void CameraPitch(
    Camera3DStructType camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  );

  void CameraRoll(
    Camera3DStructType camera,
    num angle,
  );

  MatrixStructType GetCameraViewMatrix(
    Camera3DStructType camera,
  );

  MatrixStructType GetCameraProjectionMatrix(
    Camera3DStructType camera,
    num aspect,
  );
}
