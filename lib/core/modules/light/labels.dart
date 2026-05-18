part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Light module function call,
/// logged to the console when debug output is enabled.
class RaylibLightModuleDebugLabels extends RaylibDebugLabelsBase {
  
  String CreateLight(
    LightType type,
    Vector3Base position,
    Vector3Base target,
    ColorBase color,
    ShaderBase shader,
  ) => 'CreateLight(${type.name}, $position, $target, $color, $shader)';

  String UpdateLightValues(
    ShaderBase shader,
    LightBase light,
  ) => 'UpdateLightValues($shader, $light)';
  
}
