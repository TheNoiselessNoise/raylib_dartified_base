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

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  // TODO: this

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
    p.writeInt(type.value, struct.offset(.type));
    p.writeBool(enabled, struct.offset(.enabled));
    position.structWriteInto(p.offsetBy(struct.offset(.position)));
    target.structWriteInto(p.offsetBy(struct.offset(.target)));
    color.structWriteInto(p.offsetBy(struct.offset(.color)));
    p.writeFloat(attenuation, struct.offset(.attenuation));
    p.writeInt(enabledLoc, struct.offset(.enabledLoc));
    p.writeInt(typeLoc, struct.offset(.typeLoc));
    p.writeInt(positionLoc, struct.offset(.positionLoc));
    p.writeInt(targetLoc, struct.offset(.targetLoc));
    p.writeInt(colorLoc, struct.offset(.colorLoc));
    p.writeInt(attenuationLoc, struct.offset(.attenuationLoc));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    type = .fromValue(p.readInt(struct.offset(.type)));
    enabled = p.readBool(struct.offset(.enabled));
    position.structReadFrom(p.offsetBy(struct.offset(.position)));
    target.structReadFrom(p.offsetBy(struct.offset(.target)));
    color.structReadFrom(p.offsetBy(struct.offset(.color)));
    attenuation = p.readFloat(struct.offset(.attenuation));
    enabledLoc = p.readInt(struct.offset(.enabledLoc));
    typeLoc = p.readInt(struct.offset(.typeLoc));
    positionLoc = p.readInt(struct.offset(.positionLoc));
    targetLoc = p.readInt(struct.offset(.targetLoc));
    colorLoc = p.readInt(struct.offset(.colorLoc));
    attenuationLoc = p.readInt(struct.offset(.attenuationLoc));
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