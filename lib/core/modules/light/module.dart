part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Light module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full Core API surface across different backends.
abstract class RaylibLightModuleBase<
  R extends RaylibBase,

  // types
  ColorStructType extends ColorBase<ColorStructType>,
  LightStructType extends LightBase<
    LightStructType,
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType,
    ColorStructType
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
  ShaderStructType extends ShaderBase<ShaderStructType>,
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
  final RaylibDebugLabels = RaylibLightModuleDebugLabels();

  RaylibLightModuleBase(super.rl);

  /// Create a light and get its shader locations
  LightStructType CreateLight(
    LightType type,
    Vector3StructType position,
    Vector3StructType target,
    ColorStructType color,
    ShaderStructType shader,
  );

  /// Send light properties to shader
  void UpdateLightValues(
    ShaderStructType shader,
    LightStructType light,
  );
  
}
