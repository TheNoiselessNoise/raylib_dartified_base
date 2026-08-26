part of '../../raylib_dartified_base.dart';

class _RaylibCameraModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibCameraModule.GetCameraForward].
  String GetCameraForward(
    Camera3DD camera,
  ) => 'GetCameraForward($camera)';

  /// Label for [RaylibCameraModule.GetCameraUp].
  String GetCameraUp(
    Camera3DD camera,
  ) => 'GetCameraUp($camera)';

  /// Label for [RaylibCameraModule.GetCameraRight].
  String GetCameraRight(
    Camera3DD camera,
  ) => 'GetCameraRight($camera)';

  /// Label for [RaylibCameraModule.CameraMoveForward].
  String CameraMoveForward(
    Camera3DD camera,
    num distance,
    bool moveInWorldPlane,
  ) => 'CameraMoveForward($camera, $distance, $moveInWorldPlane)';

  /// Label for [RaylibCameraModule.CameraMoveUp].
  String CameraMoveUp(
    Camera3DD camera,
    num distance,
  ) => 'CameraMoveUp($camera, $distance)';

  /// Label for [RaylibCameraModule.CameraMoveRight].
  String CameraMoveRight(
    Camera3DD camera,
    num distance,
    bool moveInWorldPlane,
  ) => 'CameraMoveRight($camera, $distance, $moveInWorldPlane)';

  /// Label for [RaylibCameraModule.CameraMoveToTarget].
  String CameraMoveToTarget(
    Camera3DD camera,
    num delta,
  ) => 'CameraMoveToTarget($camera, $delta)';

  /// Label for [RaylibCameraModule.CameraYaw].
  String CameraYaw(
    Camera3DD camera,
    num angle,
    bool rotateAroundTarget,
  ) => 'CameraYaw($camera, $angle, $rotateAroundTarget)';

  /// Label for [RaylibCameraModule.CameraPitch].
  String CameraPitch(
    Camera3DD camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => 'CameraPitch($camera, $angle, $lockView, $rotateAroundTarget, $rotateUp)';

  /// Label for [RaylibCameraModule.CameraRoll].
  String CameraRoll(
    Camera3DD camera,
    num angle,
  ) => 'CameraRoll($camera, $angle)';

  /// Label for [RaylibCameraModule.GetCameraViewMatrix].
  String GetCameraViewMatrix(
    Camera3DD camera,
  ) => 'GetCameraViewMatrix($camera)';

  /// Label for [RaylibCameraModule.GetCameraProjectionMatrix].
  String GetCameraProjectionMatrix(
    Camera3DD camera,
    num aspect,
  ) => 'GetCameraProjectionMatrix($camera)';
  
}
