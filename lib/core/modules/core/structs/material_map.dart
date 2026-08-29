part of '../../../raylib_dartified_base.dart';

enum MaterialMapField with StructFields {
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

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<MaterialMapField> structLayout = .aligned({
    .texture: RStruct(TextureD.structLayout), // Material map texture
    .color:   RStruct(ColorD.structLayout), // Material map color
    .value:   RFloat(), // Material map value
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MaterialMapD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, MaterialMapD.new, MaterialMapD.pointer);

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
    structOnOp((p) => _texture.structReadFrom(p.offsetBy(structLayout.offset(.texture))));
    return _texture;
  }
  set texture(TextureD value) {
    _texture = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.texture))));
  }

  ColorD _color;
  /// Material map color
  ColorD get color {
    structOnOp((p) => _color.structReadFrom(p.offsetBy(structLayout.offset(.color))));
    return _color;
  }
  set color(ColorD value) {
    _color = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.color))));
  }

  double _value;
  /// Material map value
  double get value {
    structOnOp((p) => _value = p.readFloat(structLayout.offset(.value)));
    return _value;
  }
  set value(double value) {
    _value = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.value)));
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
  void structWriteInto(MemoryPointer<RStruct> p) {
    _texture.structWriteInto(p.offsetBy(structLayout.offset(.texture)));
    _color.structWriteInto(p.offsetBy(structLayout.offset(.color)));
    p.writeFloat(_value, structLayout.offset(.value));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _texture.structReadFrom(p.offsetBy(structLayout.offset(.texture)));
    _color.structReadFrom(p.offsetBy(structLayout.offset(.color)));
    _value = p.readFloat(structLayout.offset(.value));
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