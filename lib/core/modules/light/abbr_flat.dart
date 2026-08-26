import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibLightFlatModule get _module => RaylibBase.instance.LightFlat;

/// See [RaylibLightFlatModule.CreateLight].
LightD CreateLight(
  int type,
  Vector3D position,
  Vector3D target,
  ColorD color,
  ShaderD shader,
) => _module.CreateLight(type, position, target, color, shader);

/// See [RaylibLightFlatModule.UpdateLightValues].
void UpdateLightValues(
  ShaderD shader,
  LightD light,
) => _module.UpdateLightValues(shader, light);

