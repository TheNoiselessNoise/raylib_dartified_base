import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibLightDart get _module => RaylibBase.instance.module();

/// See [RaylibLightDart.CreateLight].
LightD CreateLight(
  LightType type,
  Vector3D position,
  Vector3D target,
  ColorD color,
  ShaderD shader,
) => _module.CreateLight(type, position, target, color, shader);

/// See [RaylibLightDart.UpdateLightValues].
void UpdateLightValues(
  ShaderD shader,
  LightD light,
) => _module.UpdateLightValues(shader, light);
