part of '../../raylib_dartified_base.dart';

/// Backend-agnostic Raylib Light module.
final class RaylibLightDart<R extends RaylibBase> extends RaylibModule<R> with RaylibLightModuleExtras<R> {

  final _debugLabels = _RaylibLightDartDebugLabels();

  RaylibLightDart(super.rl);

  RaylibLightFlatModule get _flat => rl.module();

  /// Create a light and get its shader locations
  LightD CreateLight(
    LightType type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => run(
    () => _debugLabels.CreateLight(type, position, target, color, shader),
    () => _flat.CreateLight(
      type.value,
      position,
      target,
      color,
      shader,
    ),
  );

  /// Send light properties to shader
  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => run(
    () => _debugLabels.UpdateLightValues(shader, light),
    () => _flat.UpdateLightValues(
      shader,
      light,
    ),
  );

}
