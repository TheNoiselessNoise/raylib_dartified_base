part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Camera module function call,
/// logged to the console when debug output is enabled.
class RaylibCameraModuleDebugLabels extends RaylibDebugLabelsBase {
  
  String GetCameraForward(
    Camera3DBase camera,
  ) => 'GetCameraForward($camera)';

  String GetCameraUp(
    Camera3DBase camera,
  ) => 'GetCameraUp($camera)';

  String GetCameraRight(
    Camera3DBase camera,
  ) => 'GetCameraRight($camera)';

  String CameraMoveForward(
    Camera3DBase camera,
    num distance,
    bool moveInWorldPlane,
  ) => 'CameraMoveForward($camera, $distance, $moveInWorldPlane)';

  String CameraMoveUp(
    Camera3DBase camera,
    num distance,
  ) => 'CameraMoveUp($camera, $distance)';

  String CameraMoveRight(
    Camera3DBase camera,
    num distance,
    bool moveInWorldPlane,
  ) => 'CameraMoveRight($camera, $distance, $moveInWorldPlane)';

  String CameraMoveToTarget(
    Camera3DBase camera,
    num delta,
  ) => 'CameraMoveToTarget($camera, $delta)';

  String CameraYaw(
    Camera3DBase camera,
    num angle,
    bool rotateAroundTarget,
  ) => 'CameraYaw($camera, $angle, $rotateAroundTarget)';

  String CameraPitch(
    Camera3DBase camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => 'CameraPitch($camera, $angle, $lockView, $rotateAroundTarget, $rotateUp)';

  String CameraRoll(
    Camera3DBase camera,
    num angle,
  ) => 'CameraRoll($camera, $angle)';

  String GetCameraViewMatrix(
    Camera3DBase camera,
  ) => 'GetCameraViewMatrix($camera)';

  String GetCameraProjectionMatrix(
    Camera3DBase camera,
    num aspect,
  ) => 'GetCameraProjectionMatrix($camera)';
  
}
