part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [LightBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin LightBase<
  X extends LightBase<X, V3, M, Q, V4, C>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  M extends MatrixBase<M, V3, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>,
  C extends ColorBase<C>

> on RaylibStructObjectBase<X> {
  
  /// Light type (directional or point)
  abstract LightType type;

  /// Whether the light is currently active
  abstract bool enabled;

  /// Light position in world space
  abstract V3 position;

  /// Light target direction (used for directional lights)
  abstract V3 target;

  /// Light color
  abstract C color;

  /// Light attenuation factor (falloff over distance)
  abstract double attenuation;

  /// Shader location for [enabled]
  abstract int enabledLoc;

  /// Shader location for [type]
  abstract int typeLoc;

  /// Shader location for [position]
  abstract int positionLoc;

  /// Shader location for [target]
  abstract int targetLoc;

  /// Shader location for [color]
  abstract int colorLoc;

  /// Shader location for [attenuation]
  abstract int attenuationLoc;

  @override
  String signature() => '$structName(${type.name}, enabled: $enabled, position: $position, target: $target, ...)';
}