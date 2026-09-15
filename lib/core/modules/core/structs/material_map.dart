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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<MaterialMapD> struct = .new(
    factory: MaterialMapD.new,
    layout: .aligned<MaterialMapField>({
      .texture: RStruct(TextureD.struct), // Material map texture
      .color:   RStruct(ColorD.struct), // Material map color
      .value:   RFloat(), // Material map value
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<MaterialMapField> structLayout = struct.layoutOf();

  /// Field descriptor for [texture].
  static final field_texture = structLayout.struct<TextureD>(.texture);
  /// Field descriptor for [color].
  static final field_color = structLayout.struct<ColorD>(.color);
  /// Field descriptor for [value].
  static final field_value = structLayout.scalar<double, RFloat>(.value);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  TextureD _texture;
  /// Material map texture
  TextureD get texture => _texture = field_texture.readOr(op, _texture);
  set texture(TextureD value) => _texture = field_texture.writeOr(op, value);

  ColorD _color;
  /// Material map color
  ColorD get color => _color = field_color.readOr(op, _color);
  set color(ColorD value) => _color = field_color.writeOr(op, value);

  double _value;
  /// Material map value
  double get value => _value = field_value.readOr(op, _value);
  set value(double value) => _value = field_value.writeOr(op, value);
  
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
  MaterialMapD setDart(MaterialMapD o) {
    texture.setDart(o.texture); 
    color.setDart(o.color); 
    value = o.value;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_texture.write(p, _texture);
    field_color.write(p, _color);
    field_value.write(p, _value);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _texture = field_texture.read(p);
    _color = field_color.read(p);
    _value = field_value.read(p);
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