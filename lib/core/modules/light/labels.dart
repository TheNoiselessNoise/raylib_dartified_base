part of '../../raylib_dartified_base.dart';

class _RaylibLightModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibLightModule.CreateLight].
  String CreateLight(
    LightType type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => 'CreateLight(${type.name}, $position, $target, $color, $shader)';

  /// Label for [RaylibLightModule.UpdateLightValues].
  String UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => 'UpdateLightValues($shader, $light)';
  
}
