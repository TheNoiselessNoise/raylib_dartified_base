part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector3D] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibVector3FlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector3FlatExt(super.rl);

  /// Vector with components value 0.0f
  Vector3D Vector3Zero();

  /// Vector with components value 1.0f
  Vector3D Vector3One();

  /// Add two vectors
  Vector3D Vector3Add(
    Vector3D v1,
    Vector3D v2,
  );

  /// Add vector and double value
  Vector3D Vector3AddValue(
    Vector3D v,
    double add,
  );

  /// Subtract two vectors
  Vector3D Vector3Subtract(
    Vector3D v1,
    Vector3D v2,
  );

  /// Subtract vector by double value
  Vector3D Vector3SubtractValue(
    Vector3D v,
    double sub,
  );

  /// Multiply vector by scalar
  Vector3D Vector3Scale(
    Vector3D v,
    double scalar,
  );

  /// Multiply vector by vector
  Vector3D Vector3Multiply(
    Vector3D v1,
    Vector3D v2,
  );

  /// Calculate two vectors cross product
  Vector3D Vector3CrossProduct(
    Vector3D v1,
    Vector3D v2,
  );

  /// Calculate one vector perpendicular vector
  Vector3D Vector3Perpendicular(
    Vector3D v,
  );

  /// Calculate vector length
  double Vector3Length(
    Vector3D v,
  );

  /// Calculate vector square length
  double Vector3LengthSqr(
    Vector3D v,
  );

  /// Calculate two vectors dot product
  double Vector3DotProduct(
    Vector3D v1,
    Vector3D v2,
  );

  /// Calculate distance between two vectors
  double Vector3Distance(
    Vector3D v1,
    Vector3D v2,
  );

  /// Calculate square distance between two vectors
  double Vector3DistanceSqr(
    Vector3D v1,
    Vector3D v2,
  );

  /// Calculate angle between two vectors
  double Vector3Angle(
    Vector3D v1,
    Vector3D v2,
  );

  /// Negate provided vector (invert direction)
  Vector3D Vector3Negate(
    Vector3D v,
  );

  /// Divide vector by vector
  Vector3D Vector3Divide(
    Vector3D v1,
    Vector3D v2,
  );

  /// Normalize provided vector
  Vector3D Vector3Normalize(
    Vector3D v,
  );

  /// Calculate the projection of the vector v1 on to v2
  Vector3D Vector3Project(
    Vector3D v1,
    Vector3D v2,
  );

  /// Calculate the rejection of the vector v1 on to v2
  Vector3D Vector3Reject(
    Vector3D v1,
    Vector3D v2,
  );

  /// Orthonormalize provided vectors
  /// Makes vectors normalized and orthogonal to each other
  /// Gram-Schmidt function implementation
  void Vector3OrthoNormalize(
    StructPointer<Vector3D> v1,
    StructPointer<Vector3D> v2,
  );

  /// Transforms a Vector3 by a given Matrix
  Vector3D Vector3Transform(
    Vector3D v,
    MatrixD mat,
  );

  /// Transform a vector by quaternion rotation
  Vector3D Vector3RotateByQuaternion(
    Vector3D v,
    QuaternionD q,
  );

  /// Rotates a vector around an axis
  Vector3D Vector3RotateByAxisAngle(
    Vector3D v,
    Vector3D axis,
    double angle,
  );

  /// Move Vector towards target
  Vector3D Vector3MoveTowards(
    Vector3D v,
    Vector3D target,
    double maxDistance,
  );

  /// Calculate linear interpolation between two vectors
  Vector3D Vector3Lerp(
    Vector3D v1,
    Vector3D v2,
    double amount,
  );

  /// Calculate cubic hermite interpolation between two vectors and their tangents
  /// as described in the GLTF 2.0 specification: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#interpolation-cubic
  Vector3D Vector3CubicHermite(
    Vector3D v1,
    Vector3D tangent1,
    Vector3D v2,
    Vector3D tangent2,
    double amount,
  );

  /// Calculate reflected vector to normal
  Vector3D Vector3Reflect(
    Vector3D v,
    Vector3D normal,
  );

  /// Get min value for each pair of components
  Vector3D Vector3Min(
    Vector3D v1,
    Vector3D v2,
  );

  /// Get max value for each pair of components
  Vector3D Vector3Max(
    Vector3D v1,
    Vector3D v2,
  );

  /// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
  /// 
  /// NOTE: Assumes P is on the plane of the triangle
  Vector3D Vector3Barycenter(
    Vector3D p,
    Vector3D a,
    Vector3D b,
    Vector3D c,
  );

  /// Projects a Vector3 from screen space into object space
  Vector3D Vector3Unproject(
    Vector3D source,
    MatrixD projection,
    MatrixD view,
  );

  /// Get Vector3 as float array
  float3D Vector3ToFloatV(
    Vector3D v,
  );

  /// Invert the given vector
  Vector3D Vector3Invert(
    Vector3D v,
  );

  /// Clamp the components of the vector between
  /// min and max values specified by the given vectors
  Vector3D Vector3Clamp(
    Vector3D v,
    Vector3D min,
    Vector3D max,
  );

  /// Clamp the magnitude of the vector between two values
  Vector3D Vector3ClampValue(
    Vector3D v,
    double min,
    double max,
  );

  /// Check whether two given vectors are almost equal
  bool Vector3Equals(
    Vector3D p,
    Vector3D q,
  );

  /// Compute the direction of a refracted ray
  /// v: normalized direction of the incoming ray
  /// n: normalized normal vector of the interface of two optical media
  /// r: ratio of the refractive index of the medium from where the ray comes
  /// to the refractive index of the medium on the other side of the surface
  Vector3D Vector3Refract(
    Vector3D v,
    Vector3D n,
    double r,
  );
}