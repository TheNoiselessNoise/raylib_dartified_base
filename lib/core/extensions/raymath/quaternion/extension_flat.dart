part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's quaternion math API as module-level functions by delegating
/// to the corresponding [QuaternionD] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibQuaternionFlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibQuaternionFlatExt(super.rl);

  /// Add two quaternions
  QuaternionD QuaternionAdd(
    QuaternionD q1,
    QuaternionD q2,
  );

  /// Add quaternion and double value
  QuaternionD QuaternionAddValue(
    QuaternionD q,
    double add,
  );

  /// Subtract two quaternions
  QuaternionD QuaternionSubtract(
    QuaternionD q1,
    QuaternionD q2,
  );

  /// Subtract quaternion and double value
  QuaternionD QuaternionSubtractValue(
    QuaternionD q,
    double sub,
  );

  /// Get identity quaternion
  QuaternionD QuaternionIdentity();

  /// Computes the length of a quaternion
  double QuaternionLength(
    QuaternionD q,
  );

  /// Normalize provided quaternion
  QuaternionD QuaternionNormalize(
    QuaternionD q,
  );

  /// Invert provided quaternion
  QuaternionD QuaternionInvert(
    QuaternionD q,
  );

  /// Calculate two quaternion multiplication
  QuaternionD QuaternionMultiply(
    QuaternionD q1,
    QuaternionD q2,
  );

  /// Scale quaternion by double value
  QuaternionD QuaternionScale(
    QuaternionD q,
    double mul,
  );

  /// Divide two quaternions
  QuaternionD QuaternionDivide(
    QuaternionD q1,
    QuaternionD q2,
  );

  /// Calculate linear interpolation between two quaternions
  QuaternionD QuaternionLerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  );

  /// Calculate slerp-optimized interpolation between two quaternions
  QuaternionD QuaternionNlerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  );

  /// Calculates spherical linear interpolation between two quaternions
  QuaternionD QuaternionSlerp(
    QuaternionD q1,
    QuaternionD q2,
    double amount,
  );

  /// Calculate quaternion cubic spline interpolation using Cubic Hermite Spline algorithm
  /// as described in the GLTF 2.0 specification: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#interpolation-cubic
  QuaternionD QuaternionCubicHermiteSpline(
    QuaternionD q1,
    QuaternionD outTangent1,
    QuaternionD q2,
    QuaternionD inTangent2,
    double t,
  );

  /// Calculate quaternion based on the rotation from one vector to another
  QuaternionD QuaternionFromVector3ToVector3(
    Vector3D from,
    Vector3D to,
  );

  /// Get a quaternion for a given rotation matrix
  QuaternionD QuaternionFromMatrix(
    MatrixD mat,
  );

  /// Get a matrix for a given quaternion
  MatrixD QuaternionToMatrix(
    QuaternionD q,
  );

  /// Get rotation quaternion for an angle and axis
  /// 
  /// NOTE: Angle must be provided in radians
  QuaternionD QuaternionFromAxisAngle(
    Vector3D axis,
    double angle,
  );

  /// Get the rotation angle and axis for a given quaternion
  void QuaternionToAxisAngle(
    QuaternionD q,
    StructPointer<Vector3D> outAxis,
    MemoryPointer<RFloat> outAngle,
  );

  /// Get the quaternion equivalent to Euler angles
  /// 
  /// NOTE: Rotation order is ZYX
  QuaternionD QuaternionFromEuler(
    double pitch,
    double yaw,
    double roll,
  );

  /// Get the Euler angles equivalent to quaternion (roll, pitch, yaw)
  /// 
  /// NOTE: Angles are returned in a Vector3 struct in radians
  Vector3D QuaternionToEuler(
    QuaternionD q,
  );

  /// Transform a quaternion given a transformation matrix
  QuaternionD QuaternionTransform(
    QuaternionD q,
    MatrixD mat,
  );

  /// Check whether two given quaternions are almost equal
  bool QuaternionEquals(
    QuaternionD p,
    QuaternionD q,
  );
}