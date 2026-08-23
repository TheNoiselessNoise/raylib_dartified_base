part of '../../../raylib_dartified_base.dart';

enum MaterialMapField {
  texture,
  color,
  value,
}

/// Material map
class MaterialMapD extends RaylibStruct<MaterialMapD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<MaterialMapField> structLayout = .aligned(structFields);
  static final Map<MaterialMapField, RType> structFields = {
    .texture: RStruct(TextureD.structLayout),
    .color:   RStruct(ColorD.structLayout),
    .value:   RFloat32(),
  };

  static StructPointer<MaterialMapD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, MaterialMapD.new);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  TextureD _texture;
  /// Material map texture
  TextureD get texture {
    structOnOp((p) => _texture.readFrom(p.offsetBy(structLayout.offset(.texture))));
    return _texture;
  }
  set texture(TextureD value) {
    _texture = value;
    structOnOp((p) => value.writeInto(p.offsetBy(structLayout.offset(.texture))));
  }

  ColorD _color;
  /// Material map color
  ColorD get color {
    structOnOp((p) => _color.readFrom(p.offsetBy(structLayout.offset(.color))));
    return _color;
  }
  set color(ColorD value) {
    _color = value;
    structOnOp((p) => value.writeInto(p.offsetBy(structLayout.offset(.color))));
  }

  double _value;
  /// Material map value
  double get value {
    structOnOp((p) => _value = p.readFloat32(structLayout.offset(.value)));
    return _value;
  }
  set value(double value) {
    _value = value;
    structOnOp((p) => p.writeFloat32(value, structLayout.offset(.value)));
  }
  
  MaterialMapD({
    super.op,
    TextureD? texture,
    ColorD? color,
    double value = 0,
  }) :
    _texture = texture ?? .zero(),
    _color = color ?? .zero(),
    _value = value;

  factory MaterialMapD.zero() => .new();

  @override
  MaterialMapD setD(MaterialMapD o) {
    texture.setD(o.texture); 
    color.setD(o.color); 
    value = o.value;
    return this;
  }

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    _texture.writeInto(p.offsetBy(structLayout.offset(.texture)));
    _color.writeInto(p.offsetBy(structLayout.offset(.color)));
    p.writeFloat(_value, structLayout.offset(.value));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _texture.readFrom(p.offsetBy(structLayout.offset(.texture)));
    _color.readFrom(p.offsetBy(structLayout.offset(.color)));
    _value = p.readFloat32(structLayout.offset(.value));
  }

  @override
  MaterialMapD clone() => .new(
    op: op,
    texture: texture.clone(),
    color: color.clone(),
    value: value,
  );

  @override
  String signature() => '$structName(texture: $texture, color: $color, value: $value)';
}