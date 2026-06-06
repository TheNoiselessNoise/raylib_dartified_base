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

  /// Returns the forward vector (normalized) of [camera].
  Vector3StructType GetCameraForward(
    Camera3DStructType camera,
  );

  /// Returns the up vector (normalized) of [camera].
  /// 
  /// The up vector might not be perpendicular to the forward vector.
  Vector3StructType GetCameraUp(
    Camera3DStructType camera,
  );

  /// Returns the right vector (normalized) of [camera].
  Vector3StructType GetCameraRight(
    Camera3DStructType camera,
  );

  /// Moves the [camera] in its forward direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveForward(
    Camera3DStructType camera,
    num distance,
    bool moveInWorldPlane,
  );

  /// Moves the [camera] in its up direction by [distance].
  void CameraMoveUp(
    Camera3DStructType camera,
    num distance,
  );

  /// Moves the [camera] target in its current right direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveRight(
    Camera3DStructType camera,
    num distance,
    bool moveInWorldPlane,
  );

  /// Moves [camera] closer to or further from its target by [delta].
  void CameraMoveToTarget(
    Camera3DStructType camera,
    num delta,
  );

  /// Rotates [camera] around its up vector by [angle] radians.
  ///
  /// Yaw is "looking left and right".
  ///
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  void CameraYaw(
    Camera3DStructType camera,
    num angle,
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
    Camera3DStructType camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  );

  /// Rotates [camera] around its forward vector by [angle] radians.
  /// 
  /// Roll is "turning your head sideways to the left or right"
  void CameraRoll(
    Camera3DStructType camera,
    num angle,
  );

  /// Returns the view matrix for [camera].
  MatrixStructType GetCameraViewMatrix(
    Camera3DStructType camera,
  );

  /// Returns the projection matrix for [camera] with the given [aspect] ratio.
  MatrixStructType GetCameraProjectionMatrix(
    Camera3DStructType camera,
    num aspect,
  );
}
