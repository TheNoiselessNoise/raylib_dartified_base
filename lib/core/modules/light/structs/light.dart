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

  static final StructLayout<LightField> structLayout = .aligned({
    .type:           RInt32(),
    .enabled:        RBool(),
    .position:       RStruct(Vector3D.structLayout),
    .target:         RStruct(Vector3D.structLayout),
    .color:          RStruct(ColorD.structLayout),
    .attenuation:    RFloat32(),
    .enabledLoc:     RInt32(),
    .typeLoc:        RInt32(),
    .positionLoc:    RInt32(),
    .targetLoc:      RInt32(),
    .colorLoc:       RInt32(),
    .attenuationLoc: RInt32(),
  });

  static StructPointer<LightD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, LightD.new, LightD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Light type (directional or point)
  LightType type;
  
  /// Whether the light is currently active
  bool enabled;
  
  /// Light position in world space
  Vector3D position;
  
  /// Light target direction (used for directional lights)
  Vector3D target;
  
  /// Light color
  ColorD color;
  
  /// Light attenuation factor (falloff over distance)
  double attenuation;
  
  /// Shader location for [enabled]
  int enabledLoc;
  
  /// Shader location for [type]
  int typeLoc;
  
  /// Shader location for [position]
  int positionLoc;
  
  /// Shader location for [target]
  int targetLoc;
  
  /// Shader location for [color]
  int colorLoc;
  
  /// Shader location for [attenuation]
  int attenuationLoc;

  LightD({
    super.op,
    this.type = .LIGHT_POINT,
    this.enabled = false,
    Vector3D? position,
    Vector3D? target,
    ColorD? color,
    this.attenuation = 0,
    this.enabledLoc = 0,
    this.typeLoc = 0,
    this.positionLoc = 0,
    this.targetLoc = 0,
    this.colorLoc = 0,
    this.attenuationLoc = 0,
  }) :
    position = position ?? .zero(),
    target = target ?? .zero(),
    color = color ?? .zero();

  factory LightD.zero() => .new();

  @override
  LightD setD(LightD o) {
    type = o.type;
    enabled = o.enabled;
    position.setD(o.position);
    target.setD(o.target);
    color.setD(o.color);
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
    p.writeInt32(type.value, structLayout.offset(.type));
    p.writeBool(enabled, structLayout.offset(.enabled));
    position.structWriteInto(p.offsetBy(structLayout.offset(.position)));
    target.structWriteInto(p.offsetBy(structLayout.offset(.target)));
    color.structWriteInto(p.offsetBy(structLayout.offset(.color)));
    p.writeFloat32(attenuation, structLayout.offset(.attenuation));
    p.writeInt32(enabledLoc, structLayout.offset(.enabledLoc));
    p.writeInt32(typeLoc, structLayout.offset(.typeLoc));
    p.writeInt32(positionLoc, structLayout.offset(.positionLoc));
    p.writeInt32(targetLoc, structLayout.offset(.targetLoc));
    p.writeInt32(colorLoc, structLayout.offset(.colorLoc));
    p.writeInt32(attenuationLoc, structLayout.offset(.attenuationLoc));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    type = .fromValue(p.readInt32(structLayout.offset(.type)));
    enabled = p.readBool(structLayout.offset(.enabled));
    position.structReadFrom(p.offsetBy(structLayout.offset(.position)));
    target.structReadFrom(p.offsetBy(structLayout.offset(.target)));
    color.structReadFrom(p.offsetBy(structLayout.offset(.color)));
    attenuation = p.readFloat32(structLayout.offset(.attenuation));
    enabledLoc = p.readInt32(structLayout.offset(.enabledLoc));
    typeLoc = p.readInt32(structLayout.offset(.typeLoc));
    positionLoc = p.readInt32(structLayout.offset(.positionLoc));
    targetLoc = p.readInt32(structLayout.offset(.targetLoc));
    colorLoc = p.readInt32(structLayout.offset(.colorLoc));
    attenuationLoc = p.readInt32(structLayout.offset(.attenuationLoc));
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