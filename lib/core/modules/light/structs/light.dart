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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<LightD> struct = .new(
    factory: LightD.new,
    layout: .aligned<LightField>({
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
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<LightField> structLayout = struct.layoutOf();

  /// Field descriptor for [type].
  static final field_type = structLayout.scalar<int, RInt>(.type);
  /// Field descriptor for [enabled].
  static final field_enabled = structLayout.scalar<bool, RBool>(.enabled);
  /// Field descriptor for [position].
  static final field_position = structLayout.struct<Vector3D>(.position);
  /// Field descriptor for [target].
  static final field_target = structLayout.struct<Vector3D>(.target);
  /// Field descriptor for [color].
  static final field_color = structLayout.struct<ColorD>(.color);
  /// Field descriptor for [attenuation].
  static final field_attenuation = structLayout.scalar<double, RFloat>(.attenuation);
  /// Field descriptor for [enabledLoc].
  static final field_enabledLoc = structLayout.scalar<int, RInt>(.enabledLoc);
  /// Field descriptor for [typeLoc].
  static final field_typeLoc = structLayout.scalar<int, RInt>(.typeLoc);
  /// Field descriptor for [positionLoc].
  static final field_positionLoc = structLayout.scalar<int, RInt>(.positionLoc);
  /// Field descriptor for [targetLoc].
  static final field_targetLoc = structLayout.scalar<int, RInt>(.targetLoc);
  /// Field descriptor for [colorLoc].
  static final field_colorLoc = structLayout.scalar<int, RInt>(.colorLoc);
  /// Field descriptor for [attenuationLoc].
  static final field_attenuationLoc = structLayout.scalar<int, RInt>(.attenuationLoc);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  LightType _type;
  /// Light type (directional or point)
  LightType get type => _type = .fromValue(field_type.readOr(op, _type.value));
  set type(LightType value) => _type = .fromValue(field_type.writeOr(op, value.value));

  bool _enabled;
  /// Whether the light is currently active
  bool get enabled => _enabled = field_enabled.readOr(op, _enabled);
  set enabled(bool value) => _enabled = field_enabled.writeOr(op, value);
  
  Vector3D _position;
  /// Light position in world space
  Vector3D get position => _position = field_position.readOr(op, _position);
  set position(Vector3D value) => _position = field_position.writeOr(op, value);
  
  Vector3D _target;
  /// Light target direction (used for directional lights)
  Vector3D get target => _target = field_target.readOr(op, _target);
  set target(Vector3D value) => _target = field_target.writeOr(op, value);
  
  ColorD _color;
  /// Light color
  ColorD get color => _color = field_color.readOr(op, _color);
  set color(ColorD value) => _color = field_color.writeOr(op, value);
  
  double _attenuation;
  /// Light attenuation factor (falloff over distance)
  double get attenuation => _attenuation = field_attenuation.readOr(op, _attenuation);
  set attenuation(double value) => _attenuation = field_attenuation.writeOr(op, value);

  int _enabledLoc;
  /// Shader location for [enabled]
  int get enabledLoc => _enabledLoc = field_enabledLoc.readOr(op, _enabledLoc);
  set enabledLoc(int value) => _enabledLoc = field_enabledLoc.writeOr(op, value);
  
  int _typeLoc;
  /// Shader location for [type]
  int get typeLoc => _typeLoc = field_typeLoc.readOr(op, _typeLoc);
  set typeLoc(int value) => _typeLoc = field_typeLoc.writeOr(op, value);
  
  int _positionLoc;
  /// Shader location for [position]
  int get positionLoc => _positionLoc = field_positionLoc.readOr(op, _positionLoc);
  set positionLoc(int value) => _positionLoc = field_positionLoc.writeOr(op, value);
  
  int _targetLoc;
  /// Shader location for [target]
  int get targetLoc => _targetLoc = field_targetLoc.readOr(op, _targetLoc);
  set targetLoc(int value) => _targetLoc = field_targetLoc.writeOr(op, value);
  
  int _colorLoc;
  /// Shader location for [color]
  int get colorLoc => _colorLoc = field_colorLoc.readOr(op, _colorLoc);
  set colorLoc(int value) => _colorLoc = field_colorLoc.writeOr(op, value);
  
  int _attenuationLoc;
  /// Shader location for [attenuation]
  int get attenuationLoc => _attenuationLoc = field_attenuationLoc.readOr(op, _attenuationLoc);
  set attenuationLoc(int value) => _attenuationLoc = field_attenuationLoc.writeOr(op, value);

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
  void structWriteInto(MemoryPointer p) {
    field_type.write(p, _type.value);
    field_enabled.write(p, _enabled);
    field_position.write(p, _position);
    field_target.write(p, _target);
    field_color.write(p, _color);
    field_attenuation.write(p, _attenuation);
    field_enabledLoc.write(p, _enabledLoc);
    field_typeLoc.write(p, _typeLoc);
    field_positionLoc.write(p, _positionLoc);
    field_targetLoc.write(p, _targetLoc);
    field_colorLoc.write(p, _colorLoc);
    field_attenuationLoc.write(p, _attenuationLoc);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _type = .fromValue(field_type.read(p));
    _enabled = field_enabled.read(p);
    _position = field_position.read(p);
    _target = field_target.read(p);
    _color = field_color.read(p);
    _attenuation = field_attenuation.read(p);
    _enabledLoc = field_enabledLoc.read(p);
    _typeLoc = field_typeLoc.read(p);
    _positionLoc = field_positionLoc.read(p);
    _targetLoc = field_targetLoc.read(p);
    _colorLoc = field_colorLoc.read(p);
    _attenuationLoc = field_attenuationLoc.read(p);
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