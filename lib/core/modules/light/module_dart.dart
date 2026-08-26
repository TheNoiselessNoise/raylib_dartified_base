part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Light module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
final class RaylibLightModule<R extends RaylibBase<R>> extends RaylibModule<R> with RaylibLightModuleExtras<R> {

  final _debugLabels = _RaylibLightModuleDebugLabels();

  RaylibLightModule(super.rl);

  /// Create a light and get its shader locations
  LightD CreateLight(
    LightType type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => run(
    () => _debugLabels.CreateLight(type, position, target, color, shader),
    () => rl.LightFlat.CreateLight(
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
    () => rl.LightFlat.UpdateLightValues(
      shader,
      light,
    ),
  );

}
