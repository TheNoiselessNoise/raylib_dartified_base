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
  static final StructLayout<MaterialMapField> struct = .aligned({
    .texture: RStruct(TextureD.struct), // Material map texture
    .color:   RStruct(ColorD.struct), // Material map color
    .value:   RFloat(), // Material map value
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MaterialMapD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MaterialMapD.new, MaterialMapD.pointer);

  static final _textureF = struct.struct<TextureD>(.texture, TextureD.pointer);
  static final _colorF = struct.struct<ColorD>(.color, ColorD.pointer);
  static final _valueF = struct.scalar<double, RFloat>(.value);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  TextureD _texture;
  /// Material map texture
  TextureD get texture => _texture = _textureF.readOr(op?.ptr, _texture);
  set texture(TextureD value) => _texture = _textureF.writeIf(op?.ptr, value);

  ColorD _color;
  /// Material map color
  ColorD get color => _color = _colorF.readOr(op?.ptr, _color);
  set color(ColorD value) => _color = _colorF.writeIf(op?.ptr, value);

  double _value;
  /// Material map value
  double get value => _value = _valueF.readOr(op?.ptr, _value);
  set value(double value) => _value = _valueF.writeIf(op?.ptr, value);
  
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
  void structWriteInto(MemoryPointer<RStruct> p) {
    _textureF.write(p, _texture);
    _colorF.write(p, _color);
    _valueF.write(p, _value);
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _texture = _textureF.read(p);
    _color = _colorF.read(p);
    _value = _valueF.read(p);
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