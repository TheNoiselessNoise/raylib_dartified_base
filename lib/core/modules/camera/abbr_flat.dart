import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibCameraFlatModule get _module => RaylibBase.instance.CameraFlat;

/// See [RaylibCameraFlatModule.GetCameraForward].
Vector3D GetCameraForward(
  StructPointer<Camera3DD> camera,
) => _module.GetCameraForward(camera);

/// See [RaylibCameraFlatModule.GetCameraUp].
Vector3D GetCameraUp(
  StructPointer<Camera3DD> camera,
) => _module.GetCameraUp(camera);

/// See [RaylibCameraFlatModule.GetCameraRight].
Vector3D GetCameraRight(
  StructPointer<Camera3DD> camera,
) => _module.GetCameraRight(camera);

/// See [RaylibCameraFlatModule.CameraMoveForward].
void CameraMoveForward(
  StructPointer<Camera3DD> camera,
  double distance,
  bool moveInWorldPlane,
) => _module.CameraMoveForward(camera, distance, moveInWorldPlane);

/// See [RaylibCameraFlatModule.CameraMoveUp].
void CameraMoveUp(
  StructPointer<Camera3DD> camera,
  double distance,
) => _module.CameraMoveUp(camera, distance);

/// See [RaylibCameraFlatModule.CameraMoveRight].
void CameraMoveRight(
  StructPointer<Camera3DD> camera,
  double distance,
  bool moveInWorldPlane,
) => _module.CameraMoveRight(camera, distance, moveInWorldPlane);

/// See [RaylibCameraFlatModule.CameraMoveToTarget].
void CameraMoveToTarget(
  StructPointer<Camera3DD> camera,
  double delta,
) => _module.CameraMoveToTarget(camera, delta);

/// See [RaylibCameraFlatModule.CameraYaw].
void CameraYaw(
  StructPointer<Camera3DD> camera,
  double angle,
  bool rotateAroundTarget,
) => _module.CameraYaw(camera, angle, rotateAroundTarget);

/// See [RaylibCameraFlatModule.CameraPitch].
void CameraPitch(
  StructPointer<Camera3DD> camera,
  double angle,
  bool lockView,
  bool rotateAroundTarget,
  bool rotateUp,
) => _module.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);

/// See [RaylibCameraFlatModule.CameraRoll].
void CameraRoll(
  StructPointer<Camera3DD> camera,
  double angle,
) => _module.CameraRoll(camera, angle);

/// See [RaylibCameraFlatModule.GetCameraViewMatrix].
MatrixD GetCameraViewMatrix(
  StructPointer<Camera3DD> camera,
) => _module.GetCameraViewMatrix(camera);

/// See [RaylibCameraFlatModule.GetCameraProjectionMatrix].
MatrixD GetCameraProjectionMatrix(
  StructPointer<Camera3DD> camera,
  double aspect,
) => _module.GetCameraProjectionMatrix(camera, aspect);