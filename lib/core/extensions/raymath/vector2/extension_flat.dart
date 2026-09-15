part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector2D] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibVector2FlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector2FlatExt(super.rl);

  /// Vector with components value 0.0f
  Vector2D Vector2Zero();

  /// Vector with components value 1.0f
  Vector2D Vector2One();

  /// Add two vectors (v1 + v2)
  Vector2D Vector2Add(
    Vector2D v1,
    Vector2D v2,
  );

  /// Add vector and double value
  Vector2D Vector2AddValue(
    Vector2D v,
    double add,
  );

  /// Subtract two vectors (v1 - v2)
  Vector2D Vector2Subtract(
    Vector2D v1,
    Vector2D v2,
  );

  /// Subtract vector by double value
  Vector2D Vector2SubtractValue(
    Vector2D v,
    double sub,
  );

  /// Calculate vector length
  double Vector2Length(
    Vector2D v,
  );

  /// Calculate vector square length
  double Vector2LengthSqr(
    Vector2D v,
  );

  /// Calculate two vectors dot product
  double Vector2DotProduct(
    Vector2D v1,
    Vector2D v2,
  );

  /// Calculate two vectors cross product
  double Vector2CrossProduct(
    Vector2D v1,
    Vector2D v2,
  );

  /// Calculate distance between two vectors
  double Vector2Distance(
    Vector2D v1,
    Vector2D v2,
  );

  /// Calculate square distance between two vectors
  double Vector2DistanceSqr(
    Vector2D v1,
    Vector2D v2,
  );

  /// Calculate the signed angle from v1 to v2, relative to the origin (0, 0)
  /// 
  /// NOTE: Coordinate system convention: positive X right, positive Y down
  /// positive angles appear clockwise, and negative angles appear counterclockwise
  double Vector2Angle(
    Vector2D v1,
    Vector2D v2,
  );

  /// Calculate angle defined by a two vectors line
  /// 
  /// NOTE: Parameters need to be normalized
  double Vector2LineAngle(
    Vector2D start,
    Vector2D end,
  );

  /// Scale vector (multiply by value)
  Vector2D Vector2Scale(
    Vector2D v,
    double scale,
  );

  /// Multiply vector by vector
  Vector2D Vector2Multiply(
    Vector2D v1,
    Vector2D v2,
  );

  /// Negate vector
  Vector2D Vector2Negate(
    Vector2D v,
  );

  /// Divide vector by vector
  Vector2D Vector2Divide(
    Vector2D v1,
    Vector2D v2,
  );

  /// Normalize provided vector
  Vector2D Vector2Normalize(
    Vector2D v,
  );

  /// Transforms a Vector2 by a given Matrix
  Vector2D Vector2Transform(
    Vector2D v,
    MatrixD mat,
  );

  /// Calculate linear interpolation between two vectors
  Vector2D Vector2Lerp(
    Vector2D v1,
    Vector2D v2,
    double amount,
  );

  /// Calculate reflected vector to normal
  Vector2D Vector2Reflect(
    Vector2D v,
    Vector2D normal,
  );

  /// Get min value for each pair of components
  Vector2D Vector2Min(
    Vector2D v1,
    Vector2D v2,
  );

  /// Get max value for each pair of components
  Vector2D Vector2Max(
    Vector2D v1,
    Vector2D v2,
  );

  /// Rotate vector by angle
  Vector2D Vector2Rotate(
    Vector2D v,
    double angle,
  );

  /// Move Vector towards target
  Vector2D Vector2MoveTowards(
    Vector2D v,
    Vector2D target,
    double maxDistance,
  );

  /// Invert the given vector
  Vector2D Vector2Invert(
    Vector2D v,
  );

  /// Clamp the components of the vector between
  /// min and max values specified by the given vectors
  Vector2D Vector2Clamp(
    Vector2D v,
    Vector2D min,
    Vector2D max,
  );

  /// Clamp the magnitude of the vector between two min and max values
  Vector2D Vector2ClampValue(
    Vector2D v,
    double min,
    double max,
  );

  /// Check whether two given vectors are almost equal
  bool Vector2Equals(
    Vector2D p,
    Vector2D q,
  );

  /// Compute the direction of a refracted ray
  /// v: normalized direction of the incoming ray
  /// n: normalized normal vector of the interface of two optical media
  /// r: ratio of the refractive index of the medium from where the ray comes
  /// to the refractive index of the medium on the other side of the surface
  Vector2D Vector2Refract(
    Vector2D v,
    Vector2D n,
    double r,
  );
}