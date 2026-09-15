part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's vector math API as module-level functions by delegating
/// to the corresponding [Vector4D] methods/factories.
/// Exists purely for Raylib API symmetry.
abstract class RaylibVector4FlatExt<R extends RaylibBase> extends RaylibModule<R> {

  RaylibVector4FlatExt(super.rl);

  /// Get vector zero
  Vector4D Vector4Zero();

  /// Get vector one
  Vector4D Vector4One();

  /// Add two vectors
  Vector4D Vector4Add(
    Vector4D v1,
    Vector4D v2,
  );

  /// Add value to vector components
  Vector4D Vector4AddValue(
    Vector4D v,
    double add,
  );

  /// Substract vectors
  Vector4D Vector4Subtract(
    Vector4D v1,
    Vector4D v2,
  );

  /// Substract value from vector components
  Vector4D Vector4SubtractValue(
    Vector4D v,
    double add,
  );

  /// Vector length
  double Vector4Length(
    Vector4D v,
  );

  /// Vector square length
  double Vector4LengthSqr(
    Vector4D v,
  );

  /// Vectors dot product
  double Vector4DotProduct(
    Vector4D v1,
    Vector4D v2,
  );

  /// Calculate distance between two vectors
  double Vector4Distance(
    Vector4D v1,
    Vector4D v2,
  );

  /// Calculate square distance between two vectors
  double Vector4DistanceSqr(
    Vector4D v1,
    Vector4D v2,
  );

  /// Scale vector components by value (multiply)
  Vector4D Vector4Scale(
    Vector4D v,
    double scale,
  );

  /// Multiply vector by vector
  Vector4D Vector4Multiply(
    Vector4D v1,
    Vector4D v2,
  );

  /// Negate vector
  Vector4D Vector4Negate(
    Vector4D v,
  );

  /// Divide vector by vector
  Vector4D Vector4Divide(
    Vector4D v1,
    Vector4D v2,
  );

  /// Normalize provided vector
  Vector4D Vector4Normalize(
    Vector4D v,
  );

  /// Get min value for each pair of components
  Vector4D Vector4Min(
    Vector4D v1,
    Vector4D v2,
  );

  /// Get max value for each pair of components
  Vector4D Vector4Max(
    Vector4D v1,
    Vector4D v2,
  );

  /// Calculate linear interpolation between two vectors
  Vector4D Vector4Lerp(
    Vector4D v1,
    Vector4D v2,
    double amount,
  );

  /// Move Vector towards target
  Vector4D Vector4MoveTowards(
    Vector4D v,
    Vector4D target,
    double maxDistance,
  );

  /// Invert the given vector
  Vector4D Vector4Invert(
    Vector4D v,
  );

  /// Check whether two given vectors are almost equal
  bool Vector4Equals(
    Vector4D p,
    Vector4D q,
  );
}