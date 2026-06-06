part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Camera module function call,
/// logged to the console when debug output is enabled.
class RaylibCameraModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibCameraModuleBase.GetCameraForward].
  String GetCameraForward(
    Camera3DBase camera,
  ) => 'GetCameraForward($camera)';

  /// Label for [RaylibCameraModuleBase.GetCameraUp].
  String GetCameraUp(
    Camera3DBase camera,
  ) => 'GetCameraUp($camera)';

  /// Label for [RaylibCameraModuleBase.GetCameraRight].
  String GetCameraRight(
    Camera3DBase camera,
  ) => 'GetCameraRight($camera)';

  /// Label for [RaylibCameraModuleBase.CameraMoveForward].
  String CameraMoveForward(
    Camera3DBase camera,
    num distance,
    bool moveInWorldPlane,
  ) => 'CameraMoveForward($camera, $distance, $moveInWorldPlane)';

  /// Label for [RaylibCameraModuleBase.CameraMoveUp].
  String CameraMoveUp(
    Camera3DBase camera,
    num distance,
  ) => 'CameraMoveUp($camera, $distance)';

  /// Label for [RaylibCameraModuleBase.CameraMoveRight].
  String CameraMoveRight(
    Camera3DBase camera,
    num distance,
    bool moveInWorldPlane,
  ) => 'CameraMoveRight($camera, $distance, $moveInWorldPlane)';

  /// Label for [RaylibCameraModuleBase.CameraMoveToTarget].
  String CameraMoveToTarget(
    Camera3DBase camera,
    num delta,
  ) => 'CameraMoveToTarget($camera, $delta)';

  /// Label for [RaylibCameraModuleBase.CameraYaw].
  String CameraYaw(
    Camera3DBase camera,
    num angle,
    bool rotateAroundTarget,
  ) => 'CameraYaw($camera, $angle, $rotateAroundTarget)';

  /// Label for [RaylibCameraModuleBase.CameraPitch].
  String CameraPitch(
    Camera3DBase camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => 'CameraPitch($camera, $angle, $lockView, $rotateAroundTarget, $rotateUp)';

  /// Label for [RaylibCameraModuleBase.CameraRoll].
  String CameraRoll(
    Camera3DBase camera,
    num angle,
  ) => 'CameraRoll($camera, $angle)';

  /// Label for [RaylibCameraModuleBase.GetCameraViewMatrix].
  String GetCameraViewMatrix(
    Camera3DBase camera,
  ) => 'GetCameraViewMatrix($camera)';

  /// Label for [RaylibCameraModuleBase.GetCameraProjectionMatrix].
  String GetCameraProjectionMatrix(
    Camera3DBase camera,
    num aspect,
  ) => 'GetCameraProjectionMatrix($camera)';
  
}
