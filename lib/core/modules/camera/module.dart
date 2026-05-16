part of '../../raylib_dartified_base.dart';

abstract interface class RaylibCameraModuleBase<
  // types
  Camera3DStructType extends Camera3DBase,
  MatrixStructType extends MatrixBase,
  Vector3StructType extends Vector3Base
  
> with RaylibModuleBase {

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
