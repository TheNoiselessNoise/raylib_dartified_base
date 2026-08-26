import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibCameraModule get _module => RaylibBase.instance.CameraDart;

/// See [RaylibCameraModule.GetCameraForward].
Vector3D GetCameraForward(
  Camera3DD camera,
) => _module.GetCameraForward(camera);

/// See [RaylibCameraModule.GetCameraUp].
Vector3D GetCameraUp(
  Camera3DD camera,
) => _module.GetCameraUp(camera);

/// See [RaylibCameraModule.GetCameraRight].
Vector3D GetCameraRight(
  Camera3DD camera,
) => _module.GetCameraRight(camera);

/// See [RaylibCameraModule.CameraMoveForward].
void CameraMoveForward(
  Camera3DD camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveForward(camera, distance, moveInWorldPlane);

/// See [RaylibCameraModule.CameraMoveUp].
void CameraMoveUp(
  Camera3DD camera,
  num distance,
) => _module.CameraMoveUp(camera, distance);

/// See [RaylibCameraModule.CameraMoveRight].
void CameraMoveRight(
  Camera3DD camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveRight(camera, distance, moveInWorldPlane);

/// See [RaylibCameraModule.CameraMoveToTarget].
void CameraMoveToTarget(
  Camera3DD camera,
  num delta,
) => _module.CameraMoveToTarget(camera, delta);

/// See [RaylibCameraModule.CameraYaw].
void CameraYaw(
  Camera3DD camera,
  num angle,
  bool rotateAroundTarget,
) => _module.CameraYaw(camera, angle, rotateAroundTarget);

/// See [RaylibCameraModule.CameraPitch].
void CameraPitch(
  Camera3DD camera,
  num angle,
  bool lockView,
  bool rotateAroundTarget,
  bool rotateUp,
) => _module.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);

/// See [RaylibCameraModule.CameraRoll].
void CameraRoll(
  Camera3DD camera,
  num angle,
) => _module.CameraRoll(camera, angle);

/// See [RaylibCameraModule.GetCameraViewMatrix].
MatrixD GetCameraViewMatrix(
  Camera3DD camera,
) => _module.GetCameraViewMatrix(camera);

/// See [RaylibCameraModule.GetCameraProjectionMatrix].
MatrixD GetCameraProjectionMatrix(
  Camera3DD camera,
  num aspect,
) => _module.GetCameraProjectionMatrix(camera, aspect);
