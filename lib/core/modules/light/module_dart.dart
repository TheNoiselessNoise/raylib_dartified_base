part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Light module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibLightModule<R extends RaylibBase> extends RaylibModule<R> with RaylibLightModuleExtras<R> {

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibLightModuleDebugLabels();

  RaylibLightModule(super.rl);

  /// Create a light and get its shader locations
  LightD CreateLight(
    LightType type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  );

  /// Send light properties to shader
  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  );

}
