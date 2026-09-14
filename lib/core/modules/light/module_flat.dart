part of '../../raylib_dartified_base.dart';

/// Re-exports [RaylibLightConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibLightModuleExtras<R extends RaylibBase> on RaylibModule<R> {

  /// See [RaylibLightConstants.MAX_LIGHTS].
  int get MAX_LIGHTS => RaylibLightConstants.MAX_LIGHTS;

}

/// Backend-agnostic contract for the Raylib Light module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibLightFlatModule<R extends RaylibBase> extends RaylibModule<R> with RaylibLightModuleExtras<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibLightDartCaptureIds();

  RaylibLightFlatModule(super.rl);

  /// Create a light and get its shader locations
  LightD CreateLight(
    int type,
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
