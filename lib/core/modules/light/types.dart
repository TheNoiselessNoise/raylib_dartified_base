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
  abstract LightType type;
  abstract bool enabled;
  abstract V3 position;
  abstract V3 target;
  abstract C color;
  abstract double attenuation;
  abstract int enabledLoc;
  abstract int typeLoc;
  abstract int positionLoc;
  abstract int targetLoc;
  abstract int colorLoc;
  abstract int attenuationLoc;

  @override
  String signature() => '$structName(${type.name}, enabled: $enabled, position: $position, target: $target, ...)';
}