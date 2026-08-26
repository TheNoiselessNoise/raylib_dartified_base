part of '../../raylib_dartified_base.dart';

/// Re-exports [RaylibLightConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibLightModuleExtras<R extends RaylibBase<R>> on RaylibModule<R> {

  /// See [RaylibLightConstants.MAX_LIGHTS].
  int get MAX_LIGHTS => RaylibLightConstants.MAX_LIGHTS;

}

/// Backend-agnostic contract for the Raylib Light module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
final class RaylibLightFlatModule<R extends RaylibBase<R>> extends RaylibModule<R> with RaylibLightModuleExtras<R> {

  RaylibLightFlatModule(super.rl);

  final List<StructPointer<LightD>> _lights = [];

  late final MemoryPointer<RInt8> _lightInt8ValuePtr;
  late final MemoryPointer<RFloat> _lightFloat3ValuePtr;
  late final MemoryPointer<RFloat> _lightFloat4ValuePtr;

  @override
  @mustCallSuper
  @DoNotAbbreviate()
  void load() {
    super.load();
    _lightInt8ValuePtr = rl.Temp.Int8$.Raw();
    _lightFloat3ValuePtr = rl.Temp.Float$.Raw(3);
    _lightFloat4ValuePtr = rl.Temp.Float$.Raw(4);
  }

  @override
  @nonVirtual
  @DoNotAbbreviate()
  void dispose() {
    super.dispose();
    _lights.forEach((p) => p.free());
    _lightInt8ValuePtr.free();
    _lightFloat3ValuePtr.free();
    _lightFloat4ValuePtr.free();
  }

  /// Create a light and get its shader locations
  LightD CreateLight(
    int type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) {
    final light = rl.Temp.Light$.RawStruct();
    light.ref.enabled = true;
    light.ref.type = .fromValue(type);
    light.ref.position = position;
    light.ref.target = target;
    light.ref.color = color;

    int index = _lights.length;
    light.ref.enabledLoc = rl.CoreFlat.GetShaderLocation(
      shader, rl.Temp.String$.Value("lights[$index].enabled"),
    );
    light.ref.typeLoc = rl.CoreFlat.GetShaderLocation(
      shader, rl.Temp.String$.Value("lights[$index].type"),
    );
    light.ref.positionLoc = rl.CoreFlat.GetShaderLocation(
      shader, rl.Temp.String$.Value("lights[$index].position"),
    );
    light.ref.targetLoc = rl.CoreFlat.GetShaderLocation(
      shader, rl.Temp.String$.Value("lights[$index].target"),
    );
    light.ref.colorLoc = rl.CoreFlat.GetShaderLocation(
      shader, rl.Temp.String$.Value("lights[$index].color"),
    );

    UpdateLightValues(shader, light.ref);

    _lights.add(light);

    return light.ref;
  }

  /// Send light properties to shader
  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) {
    _lightInt8ValuePtr.value = light.enabled.toInt();
    rl.CoreFlat.SetShaderValue(
      shader,
      light.enabledLoc,
      _lightInt8ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_INT.value
    );

    _lightInt8ValuePtr.value = light.type.value;
    rl.CoreFlat.SetShaderValue(
      shader,
      light.typeLoc,
      _lightInt8ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_INT.value
    );

    _lightFloat3ValuePtr[0] = light.position.x;
    _lightFloat3ValuePtr[1] = light.position.y;
    _lightFloat3ValuePtr[2] = light.position.z;
    rl.CoreFlat.SetShaderValue(
      shader,
      light.positionLoc,
      _lightFloat3ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
    );

    _lightFloat3ValuePtr[0] = light.target.x;
    _lightFloat3ValuePtr[1] = light.target.y;
    _lightFloat3ValuePtr[2] = light.target.z;
    rl.CoreFlat.SetShaderValue(
      shader,
      light.targetLoc,
      _lightFloat3ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
    );

    _lightFloat4ValuePtr[0] = light.color.r / 255;
    _lightFloat4ValuePtr[1] = light.color.g / 255;
    _lightFloat4ValuePtr[2] = light.color.b / 255;
    _lightFloat4ValuePtr[3] = light.color.a / 255;
    rl.CoreFlat.SetShaderValue(
      shader,
      light.colorLoc,
      _lightFloat4ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
    );
  }

}
