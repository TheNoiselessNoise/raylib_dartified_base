part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Camera module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibCameraFlatModule<R extends RaylibBase> extends RaylibModule<R> {

  RaylibCameraFlatModule(super.rl);

  /// Returns the forward vector (normalized) of [camera].
  Vector3D GetCameraForward(
    StructPointer<Camera3DD> camera,
  );

  /// Returns the up vector (normalized) of [camera].
  /// 
  /// The up vector might not be perpendicular to the forward vector.
  Vector3D GetCameraUp(
    StructPointer<Camera3DD> camera,
  );

  /// Returns the right vector (normalized) of [camera].
  Vector3D GetCameraRight(
    StructPointer<Camera3DD> camera,
  );

  /// Moves the [camera] in its forward direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveForward(
    StructPointer<Camera3DD> camera,
    double distance,
    bool moveInWorldPlane,
  );

  /// Moves the [camera] in its up direction by [distance].
  void CameraMoveUp(
    StructPointer<Camera3DD> camera,
    double distance,
  );

  /// Moves the [camera] target in its current right direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveRight(
    StructPointer<Camera3DD> camera,
    double distance,
    bool moveInWorldPlane,
  );

  /// Moves [camera] closer to or further from its target by [delta].
  void CameraMoveToTarget(
    StructPointer<Camera3DD> camera,
    double delta,
  );

  /// Rotates [camera] around its up vector by [angle] radians.
  ///
  /// Yaw is "looking left and right".
  ///
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  void CameraYaw(
    StructPointer<Camera3DD> camera,
    double angle,
    bool rotateAroundTarget,
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
    StructPointer<Camera3DD> camera,
    double angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  );

  /// Rotates [camera] around its forward vector by [angle] radians.
  /// 
  /// Roll is "turning your head sideways to the left or right"
  void CameraRoll(
    StructPointer<Camera3DD> camera,
    double angle,
  );

  /// Returns the view matrix for [camera].
  MatrixD GetCameraViewMatrix(
    StructPointer<Camera3DD> camera,
  );

  /// Returns the projection matrix for [camera] with the given [aspect] ratio.
  MatrixD GetCameraProjectionMatrix(
    StructPointer<Camera3DD> camera,
    double aspect,
  );
}


