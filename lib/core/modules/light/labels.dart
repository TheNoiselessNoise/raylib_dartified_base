part of '../../raylib_dartified_base.dart';

class _RaylibLightDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibLightDart.CreateLight].
  String CreateLight(
    LightType type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => 'CreateLight(${type.name}, $position, $target, $color, $shader)';

  /// Label for [RaylibLightDart.UpdateLightValues].
  String UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => 'UpdateLightValues($shader, $light)';
  
}
