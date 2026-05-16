part of '../../raylib_dartified_base.dart';

abstract interface class RaylibLightModuleBase<
  // types
  ColorStructType extends ColorBase,
  LightStructType extends LightBase,
  ShaderStructType extends ShaderBase,
  Vector3StructType extends Vector3Base
  
> with RaylibModuleBase {

  LightStructType CreateLight(
    LightType type,
    Vector3StructType position,
    Vector3StructType target,
    ColorStructType color,
    ShaderStructType shader,
  );

  void UpdateLightValues(
    ShaderStructType shader,
    LightStructType light,
  );
}
