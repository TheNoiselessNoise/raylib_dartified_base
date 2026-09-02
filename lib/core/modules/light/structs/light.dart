part of '../../../raylib_dartified_base.dart';

enum LightField with StructFields {
  type,
  enabled,
  position,
  target,
  color,
  attenuation,
  enabledLoc,
  typeLoc,
  positionLoc,
  targetLoc,
  colorLoc,
  attenuationLoc,
}

/// Light
class LightD extends RaylibStruct<LightD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<LightField> struct = .aligned({
    .type:           RInt(),
    .enabled:        RBool(),
    .position:       RStruct(Vector3D.struct),
    .target:         RStruct(Vector3D.struct),
    .color:          RStruct(ColorD.struct),
    .attenuation:    RFloat(),

    // Shader locations
    .enabledLoc:     RInt(),
    .typeLoc:        RInt(),
    .positionLoc:    RInt(),
    .targetLoc:      RInt(),
    .colorLoc:       RInt(),
    .attenuationLoc: RInt(),
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<LightD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, LightD.new, LightD.pointer);

  static final _typeF = struct.scalar<int, RInt>(.type);
  static final _enabledF = struct.scalar<bool, RBool>(.enabled);
  static final _positionF = struct.struct(.position, Vector3D.pointer);
  static final _targetF = struct.struct(.target, Vector3D.pointer);
  static final _colorF = struct.struct(.color, ColorD.pointer);
  static final _attenuationF = struct.scalar<double, RFloat>(.attenuation);
  
  static final _enabledLocF = struct.scalar<int, RInt>(.enabledLoc);
  static final _typeLocF = struct.scalar<int, RInt>(.typeLoc);
  static final _positionLocF = struct.scalar<int, RInt>(.positionLoc);
  static final _targetLocF = struct.scalar<int, RInt>(.targetLoc);
  static final _colorLocF = struct.scalar<int, RInt>(.colorLoc);
  static final _attenuationLocF = struct.scalar<int, RInt>(.attenuationLoc);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  LightType _type;
  /// Light type (directional or point)
  LightType get type => _type = .fromValue(_typeF.readOr(op?.ptr, _type.value));
  set type(LightType value) => _type = .fromValue(_typeF.writeIf(op?.ptr, value.value));

  bool _enabled;
  /// Whether the light is currently active
  bool get enabled => _enabled = _enabledF.readOr(op?.ptr, _enabled);
  set enabled(bool value) => _enabled = _enabledF.writeIf(op?.ptr, value);
  
  Vector3D _position;
  /// Light position in world space
  Vector3D get position => _position = _positionF.readOr(op?.ptr, _position);
  set position(Vector3D value) => _position = _positionF.writeIf(op?.ptr, value);
  
  Vector3D _target;
  /// Light target direction (used for directional lights)
  Vector3D get target => _target = _targetF.readOr(op?.ptr, _target);
  set target(Vector3D value) => _target = _targetF.writeIf(op?.ptr, value);
  
  ColorD _color;
  /// Light color
  ColorD get color => _color = _colorF.readOr(op?.ptr, _color);
  set color(ColorD value) => _color = _colorF.writeIf(op?.ptr, value);
  
  double _attenuation;
  /// Light attenuation factor (falloff over distance)
  double get attenuation => _attenuation = _attenuationF.readOr(op?.ptr, _attenuation);
  set attenuation(double value) => _attenuation = _attenuationF.writeIf(op?.ptr, value);

  int _enabledLoc;
  /// Shader location for [enabled]
  int get enabledLoc => _enabledLoc = _enabledLocF.readOr(op?.ptr, _enabledLoc);
  set enabledLoc(int value) => _enabledLoc = _enabledLocF.writeIf(op?.ptr, value);
  
  int _typeLoc;
  /// Shader location for [type]
  int get typeLoc => _typeLoc = _typeLocF.readOr(op?.ptr, _typeLoc);
  set typeLoc(int value) => _typeLoc = _typeLocF.writeIf(op?.ptr, value);
  
  int _positionLoc;
  /// Shader location for [position]
  int get positionLoc => _positionLoc = _positionLocF.readOr(op?.ptr, _positionLoc);
  set positionLoc(int value) => _positionLoc = _positionLocF.writeIf(op?.ptr, value);
  
  int _targetLoc;
  /// Shader location for [target]
  int get targetLoc => _targetLoc = _targetLocF.readOr(op?.ptr, _targetLoc);
  set targetLoc(int value) => _targetLoc = _targetLocF.writeIf(op?.ptr, value);
  
  int _colorLoc;
  /// Shader location for [color]
  int get colorLoc => _colorLoc = _colorLocF.readOr(op?.ptr, _colorLoc);
  set colorLoc(int value) => _colorLoc = _colorLocF.writeIf(op?.ptr, value);
  
  int _attenuationLoc;
  /// Shader location for [attenuation]
  int get attenuationLoc => _attenuationLoc = _attenuationLocF.readOr(op?.ptr, _attenuationLoc);
  set attenuationLoc(int value) => _attenuationLoc = _attenuationLocF.writeIf(op?.ptr, value);

  LightD({
    super.op,
    LightType type = .LIGHT_POINT,
    bool enabled = false,
    Vector3D? position,
    Vector3D? target,
    ColorD? color,
    double attenuation = 0,
    int enabledLoc = 0,
    int typeLoc = 0,
    int positionLoc = 0,
    int targetLoc = 0,
    int colorLoc = 0,
    int attenuationLoc = 0,
  }) :
    _type = type,
    _enabled = enabled,
    _position = position ?? .zero(),
    _target = target ?? .zero(),
    _color = color ?? .zero(),
    _attenuation = attenuation,
    _enabledLoc = enabledLoc,
    _typeLoc = typeLoc,
    _positionLoc = positionLoc,
    _targetLoc = targetLoc,
    _colorLoc = colorLoc,
    _attenuationLoc = attenuationLoc;

  factory LightD.zero() => .new();

  @override
  LightD setDart(LightD o) {
    type = o.type;
    enabled = o.enabled;
    position.setDart(o.position);
    target.setDart(o.target);
    color.setDart(o.color);
    attenuation = o.attenuation;
    enabledLoc = o.enabledLoc;
    typeLoc = o.typeLoc;
    positionLoc = o.positionLoc;
    targetLoc = o.targetLoc;
    colorLoc = o.colorLoc;
    attenuationLoc = o.attenuationLoc;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _typeF.write(p, _type.value);
    _enabledF.write(p, _enabled);
    _positionF.write(p, _position);
    _targetF.write(p, _target);
    _colorF.write(p, _color);
    _attenuationF.write(p, _attenuation);
    _enabledLocF.write(p, _enabledLoc);
    _typeLocF.write(p, _typeLoc);
    _positionLocF.write(p, _positionLoc);
    _targetLocF.write(p, _targetLoc);
    _colorLocF.write(p, _colorLoc);
    _attenuationLocF.write(p, _attenuationLoc);
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _type = .fromValue(_typeF.read(p));
    _enabled = _enabledF.read(p);
    _position = _positionF.read(p);
    _target = _targetF.read(p);
    _color = _colorF.read(p);
    _attenuation = _attenuationF.read(p);
    _enabledLoc = _enabledLocF.read(p);
    _typeLoc = _typeLocF.read(p);
    _positionLoc = _positionLocF.read(p);
    _targetLoc = _targetLocF.read(p);
    _colorLoc = _colorLocF.read(p);
    _attenuationLoc = _attenuationLocF.read(p);
  }

  @override
  LightD clone() => .new(
    op: op,
    type: type,
    enabled: enabled,
    position: position.clone(),
    target: target.clone(),
    color: color.clone(),
    attenuation: attenuation,
    enabledLoc: enabledLoc,
    typeLoc: typeLoc,
    positionLoc: positionLoc,
    targetLoc: targetLoc,
    colorLoc: colorLoc,
    attenuationLoc: attenuationLoc,
  );

  @override
  String signature() => '$structName(${type.name}, enabled: $enabled, position: $position, target: $target)';
}