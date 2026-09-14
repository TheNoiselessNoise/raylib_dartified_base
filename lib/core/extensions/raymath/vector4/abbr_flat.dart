import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibVector4FlatExt get _module => RaylibBase.instance.module();

/// See [RaylibVector4FlatExt.Vector4Zero].
Vector4D Vector4Zero() => _module.Vector4Zero();

/// See [RaylibVector4FlatExt.Vector4One].
Vector4D Vector4One() => _module.Vector4One();

/// See [RaylibVector4FlatExt.Vector4Add].
Vector4D Vector4Add(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4Add(v1, v2);

/// See [RaylibVector4FlatExt.Vector4AddValue].
Vector4D Vector4AddValue(
  Vector4D v,
  double add,
) => _module.Vector4AddValue(v, add);

/// See [RaylibVector4FlatExt.Vector4Subtract].
Vector4D Vector4Subtract(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4Subtract(v1, v2);

/// See [RaylibVector4FlatExt.Vector4SubtractValue].
Vector4D Vector4SubtractValue(
  Vector4D v,
  double add,
) => _module.Vector4SubtractValue(v, add);

/// See [RaylibVector4FlatExt.Vector4Length].
double Vector4Length(
  Vector4D v,
) => _module.Vector4Length(v);

/// See [RaylibVector4FlatExt.Vector4LengthSqr].
double Vector4LengthSqr(
  Vector4D v,
) => _module.Vector4LengthSqr(v);

/// See [RaylibVector4FlatExt.Vector4DotProduct].
double Vector4DotProduct(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4DotProduct(v1, v2);

/// See [RaylibVector4FlatExt.Vector4Distance].
double Vector4Distance(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4Distance(v1, v2);

/// See [RaylibVector4FlatExt.Vector4DistanceSqr].
double Vector4DistanceSqr(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4DistanceSqr(v1, v2);

/// See [RaylibVector4FlatExt.Vector4Scale].
Vector4D Vector4Scale(
  Vector4D v,
  double scale,
) => _module.Vector4Scale(v, scale);

/// See [RaylibVector4FlatExt.Vector4Multiply].
Vector4D Vector4Multiply(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4Multiply(v1, v2);

/// See [RaylibVector4FlatExt.Vector4Negate].
Vector4D Vector4Negate(
  Vector4D v,
) => _module.Vector4Negate(v);

/// See [RaylibVector4FlatExt.Vector4Divide].
Vector4D Vector4Divide(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4Divide(v1, v2);

/// See [RaylibVector4FlatExt.Vector4Normalize].
Vector4D Vector4Normalize(
  Vector4D v,
) => _module.Vector4Normalize(v);

/// See [RaylibVector4FlatExt.Vector4Min].
Vector4D Vector4Min(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4Min(v1, v2);

/// See [RaylibVector4FlatExt.Vector4Max].
Vector4D Vector4Max(
  Vector4D v1,
  Vector4D v2,
) => _module.Vector4Max(v1, v2);

/// See [RaylibVector4FlatExt.Vector4Lerp].
Vector4D Vector4Lerp(
  Vector4D v1,
  Vector4D v2,
  double amount,
) => _module.Vector4Lerp(v1, v2, amount);

/// See [RaylibVector4FlatExt.Vector4MoveTowards].
Vector4D Vector4MoveTowards(
  Vector4D v,
  Vector4D target,
  double maxDistance,
) => _module.Vector4MoveTowards(v, target, maxDistance);

/// See [RaylibVector4FlatExt.Vector4Invert].
Vector4D Vector4Invert(
  Vector4D v,
) => _module.Vector4Invert(v);

/// See [RaylibVector4FlatExt.Vector4Equals].
int Vector4Equals(
  Vector4D p,
  Vector4D q,
) => _module.Vector4Equals(p, q);