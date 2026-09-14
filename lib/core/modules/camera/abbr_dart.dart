import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibCameraDart get _module => RaylibBase.instance.module();

/// See [RaylibCameraDart.GetCameraForward].
Vector3D GetCameraForward(
  Camera3DD camera,
) => _module.GetCameraForward(camera);

/// See [RaylibCameraDart.GetCameraUp].
Vector3D GetCameraUp(
  Camera3DD camera,
) => _module.GetCameraUp(camera);

/// See [RaylibCameraDart.GetCameraRight].
Vector3D GetCameraRight(
  Camera3DD camera,
) => _module.GetCameraRight(camera);

/// See [RaylibCameraDart.CameraMoveForward].
void CameraMoveForward(
  Camera3DD camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveForward(camera, distance, moveInWorldPlane);

/// See [RaylibCameraDart.CameraMoveUp].
void CameraMoveUp(
  Camera3DD camera,
  num distance,
) => _module.CameraMoveUp(camera, distance);

/// See [RaylibCameraDart.CameraMoveRight].
void CameraMoveRight(
  Camera3DD camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveRight(camera, distance, moveInWorldPlane);

/// See [RaylibCameraDart.CameraMoveToTarget].
void CameraMoveToTarget(
  Camera3DD camera,
  num delta,
) => _module.CameraMoveToTarget(camera, delta);

/// See [RaylibCameraDart.CameraYaw].
void CameraYaw(
  Camera3DD camera,
  num angle,
  bool rotateAroundTarget,
) => _module.CameraYaw(camera, angle, rotateAroundTarget);

/// See [RaylibCameraDart.CameraPitch].
void CameraPitch(
  Camera3DD camera,
  num angle,
  bool lockView,
  bool rotateAroundTarget,
  bool rotateUp,
) => _module.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);

/// See [RaylibCameraDart.CameraRoll].
void CameraRoll(
  Camera3DD camera,
  num angle,
) => _module.CameraRoll(camera, angle);

/// See [RaylibCameraDart.GetCameraViewMatrix].
MatrixD GetCameraViewMatrix(
  Camera3DD camera,
) => _module.GetCameraViewMatrix(camera);

/// See [RaylibCameraDart.GetCameraProjectionMatrix].
MatrixD GetCameraProjectionMatrix(
  Camera3DD camera,
  num aspect,
) => _module.GetCameraProjectionMatrix(camera, aspect);
