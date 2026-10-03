part of '../../../raylib_dartified_base.dart';

enum MaterialMapField with StructFields {
  texture,
  color,
  value,
}

/// Material map
class MaterialMap extends RaylibStruct<MaterialMap> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<MaterialMap> struct = ._builtin(
    factory: MaterialMap.new,
    layout: .aligned<MaterialMapField>({
      .texture: RStruct(Texture.struct), // Material map texture
      .color:   RStruct(Color.struct), // Material map color
      .value:   RFloat(), // Material map value
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<MaterialMapField> structLayout = struct.layoutOf();

  /// Field descriptor for [texture].
  static final field_texture = structLayout.struct<Texture>(.texture);
  /// Field descriptor for [color].
  static final field_color = structLayout.struct<Color>(.color);
  /// Field descriptor for [value].
  static final field_value = structLayout.scalar<double, RFloat>(.value);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Texture _texture;
  /// Material map texture
  Texture get texture => _texture = field_texture.readOr(op, _texture);
  set texture(Texture value) => _texture = field_texture.writeOr(op, value);

  Color _color;
  /// Material map color
  Color get color => _color = field_color.readOr(op, _color);
  set color(Color value) => _color = field_color.writeOr(op, value);

  double _value;
  /// Material map value
  double get value => _value = field_value.readOr(op, _value);
  set value(double value) => _value = field_value.writeOr(op, value);
  
  MaterialMap({
    super.op,
    Texture? texture,
    Color? color,
    double value = 0,
  }) :
    _texture = texture ?? .zero(),
    _color = color ?? .zero(),
    _value = value;

  factory MaterialMap.zero() => .new();

  @override
  MaterialMap setDart(MaterialMap o) {
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
  MaterialMap clone() => .new(
    op: op,
    texture: texture.clone(),
    color: color.clone(),
    value: value,
  );

  @override
  String signature() => '$structName(texture: $texture, color: $color, value: $value)';
}