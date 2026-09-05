part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Camera module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
final class RaylibCameraModule<R extends RaylibBase<R>> extends RaylibModule<R> {

  final _debugLabels = _RaylibCameraModuleDebugLabels();

  RaylibCameraModule(super.rl);

  /// Returns the forward vector (normalized) of [camera].
  Vector3D GetCameraForward(
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetCameraForward(camera),
    () => rl.CameraFlat.GetCameraForward(
      rl.Temp.Camera3D$.Ref1(camera),
    ),
  );

  /// Returns the up vector (normalized) of [camera].
  /// 
  /// The up vector might not be perpendicular to the forward vector.
  Vector3D GetCameraUp(
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetCameraUp(camera),
    () => rl.CameraFlat.GetCameraUp(
      rl.Temp.Camera3D$.Ref1(camera),
    ),
  );

  /// Returns the right vector (normalized) of [camera].
  Vector3D GetCameraRight(
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetCameraRight(camera),
    () => rl.CameraFlat.GetCameraRight(
      rl.Temp.Camera3D$.Ref1(camera),
    ),
  );

  /// Moves the [camera] in its forward direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveForward(
    Camera3DD camera,
    num distance,
    bool moveInWorldPlane,
  ) => run(
    () => _debugLabels.CameraMoveForward(camera, distance, moveInWorldPlane),
    () => rl.CameraFlat.CameraMoveForward(
      rl.Temp.Camera3D$.Ref1(camera),
      distance.toDouble(),
      moveInWorldPlane,
    ),
  );

  /// Moves the [camera] in its up direction by [distance].
  void CameraMoveUp(
    Camera3DD camera,
    num distance,
  ) => run(
    () => _debugLabels.CameraMoveUp(camera, distance),
    () => rl.CameraFlat.CameraMoveUp(
      rl.Temp.Camera3D$.Ref1(camera),
      distance.toDouble(),
    ),
  );

  /// Moves the [camera] target in its current right direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveRight(
    Camera3DD camera,
    num distance,
    bool moveInWorldPlane,
  ) => run(
    () => _debugLabels.CameraMoveRight(camera, distance, moveInWorldPlane),
    () => rl.CameraFlat.CameraMoveRight(
      rl.Temp.Camera3D$.Ref1(camera),
      distance.toDouble(),
      moveInWorldPlane,
    ),
  );

  /// Moves [camera] closer to or further from its target by [delta].
  void CameraMoveToTarget(
    Camera3DD camera,
    num delta,
  ) => run(
    () => _debugLabels.CameraMoveToTarget(camera, delta),
    () => rl.CameraFlat.CameraMoveToTarget(
      rl.Temp.Camera3D$.Ref1(camera),
      delta.toDouble(),
    ),
  );

  /// Rotates [camera] around its up vector by [angle] radians.
  ///
  /// Yaw is "looking left and right".
  ///
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  void CameraYaw(
    Camera3DD camera,
    num angle,
    bool rotateAroundTarget,
  ) => run(
    () => _debugLabels.CameraYaw(camera, angle, rotateAroundTarget),
    () => rl.CameraFlat.CameraYaw(
      rl.Temp.Camera3D$.Ref1(camera),
      angle.toDouble(),
      rotateAroundTarget,
    ),
  );

  /// Rotates [camera] around its right vector by [angle] radians.
  /// 
  /// Pitch is "looking up and down".
  ///
  /// If [lockView] is `true`, pitch is clamped to prevent flipping.
  /// 
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  /// 
  /// If [rotateUp] is `true`, the up vector is rotated as well (typically useful in [CameraMode.CAMERA_FREE]).
  void CameraPitch(
    Camera3DD camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => run(
    () => _debugLabels.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp),
    () => rl.CameraFlat.CameraPitch(
      rl.Temp.Camera3D$.Ref1(camera),
      angle.toDouble(),
      lockView,
      rotateAroundTarget,
      rotateUp,
    ),
  );

  /// Rotates [camera] around its forward vector by [angle] radians.
  /// 
  /// Roll is "turning your head sideways to the left or right"
  void CameraRoll(
    Camera3DD camera,
    num angle,
  ) => run(
    () => _debugLabels.CameraRoll(camera, angle),
    () => rl.CameraFlat.CameraRoll(
      rl.Temp.Camera3D$.Ref1(camera),
      angle.toDouble(),
    ),
  );

  /// Returns the view matrix for [camera].
  MatrixD GetCameraViewMatrix(
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetCameraViewMatrix(camera),
    () => rl.CameraFlat.GetCameraViewMatrix(
      rl.Temp.Camera3D$.Ref1(camera),
    ),
  );

  /// Returns the projection matrix for [camera] with the given [aspect] ratio.
  MatrixD GetCameraProjectionMatrix(
    Camera3DD camera,
    num aspect,
  ) => run(
    () => _debugLabels.GetCameraProjectionMatrix(camera, aspect),
    () => rl.CameraFlat.GetCameraProjectionMatrix(
      rl.Temp.Camera3D$.Ref1(camera),
      aspect.toDouble(),
    ),
  );
}
