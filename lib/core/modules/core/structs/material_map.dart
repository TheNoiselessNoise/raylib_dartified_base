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

  @override
  StructLayout<MaterialMapField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<MaterialMapField> struct = .aligned({
    .texture: RStruct(TextureD.struct), // Material map texture
    .color:   RStruct(ColorD.struct), // Material map color
    .value:   RFloat(), // Material map value
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MaterialMapD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MaterialMapD.new, MaterialMapD.pointer);

  static final field_texture = struct.struct(.texture, TextureD.pointer);
  static final field_color = struct.struct(.color, ColorD.pointer);
  static final field_value = struct.scalar<double, RFloat>(.value);

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
  set texture(TextureD value) => _texture = field_texture.writeIf(op, value);

  ColorD _color;
  /// Material map color
  ColorD get color => _color = field_color.readOr(op, _color);
  set color(ColorD value) => _color = field_color.writeIf(op, value);

  double _value;
  /// Material map value
  double get value => _value = field_value.readOr(op, _value);
  set value(double value) => _value = field_value.writeIf(op, value);
  
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