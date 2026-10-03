part of '../../../raylib_dartified_base.dart';

enum GlyphInfoField with StructFields {
  value,
  offsetX,
  offsetY,
  advanceX,
  image,
}

/// GlyphInfo, font characters glyphs info
class GlyphInfo extends RaylibStruct<GlyphInfo> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<GlyphInfo> struct = ._builtin(
    factory: GlyphInfo.new,
    layout: .aligned<GlyphInfoField>({
      .value:    RInt(), // Character value (Unicode)
      .offsetX:  RInt(), // Character offset X when drawing
      .offsetY:  RInt(), // Character offset Y when drawing
      .advanceX: RInt(), // Character advance position X
      .image:    RStruct(Image.struct), // Character image data
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<GlyphInfoField> structLayout = struct.layoutOf();

  /// Field descriptor for [value].
  static final field_value = structLayout.scalar<int, RInt>(.value);
  /// Field descriptor for [offsetX].
  static final field_offsetX = structLayout.scalar<int, RInt>(.offsetX);
  /// Field descriptor for [offsetY].
  static final field_offsetY = structLayout.scalar<int, RInt>(.offsetY);
  /// Field descriptor for [advanceX].
  static final field_advanceX = structLayout.scalar<int, RInt>(.advanceX);
  /// Field descriptor for [image].
  static final field_image = structLayout.struct<Image>(.image);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _value;
  /// Character value (Unicode)
  int get value => _value = field_value.readOr(op, _value);
  set value(int value) => _value = field_value.writeOr(op, value);

  int _offsetX;
  /// Character offset X when drawing
  int get offsetX => _offsetX = field_offsetX.readOr(op, _offsetX);
  set offsetX(int value) => _offsetX = field_offsetX.writeOr(op, value);

  int _offsetY;
  /// Character offset Y when drawing
  int get offsetY => _offsetY = field_offsetY.readOr(op, _offsetY);
  set offsetY(int value) => _offsetY = field_offsetY.writeOr(op, value);

  int _advanceX;
  /// Character advance position X
  int get advanceX => _advanceX = field_advanceX.readOr(op, _advanceX);
  set advanceX(int value) => _advanceX = field_advanceX.writeOr(op, value);

  Image _image;
  /// Character image data
  Image get image => _image = field_image.readOr(op, _image);
  set image(Image value) => _image = field_image.writeOr(op, value);

  GlyphInfo({
    super.op,
    int value = 0,
    int offsetX = 0,
    int offsetY = 0,
    int advanceX = 0,
    Image? image,
  }) :
    _value = value,
    _offsetX = offsetX,
    _offsetY = offsetY,
    _advanceX = advanceX,
    _image = image ?? .zero();

  factory GlyphInfo.zero() => .new();

  @override
  GlyphInfo setDart(GlyphInfo o) {
    value = o.value;
    offsetX = o.offsetX;
    offsetY = o.offsetY;
    advanceX = o.advanceX;
    image.setDart(o.image);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_value.write(p, _value);
    field_offsetX.write(p, _offsetX);
    field_offsetY.write(p, _offsetY);
    field_advanceX.write(p, _advanceX);
    field_image.write(p, _image);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _value = field_value.read(p);
    _offsetX = field_offsetX.read(p);
    _offsetY = field_offsetY.read(p);
    _advanceX = field_advanceX.read(p);
    _image = field_image.read(p);
  }

  @override
  GlyphInfo clone() => .new(
    op: op,
    value: value,
    offsetX: offsetX,
    offsetY: offsetY,
    advanceX: advanceX,
    image: image.clone(),
  );

  @override
  String signature() => '$structName(value: $value, offsetX: $offsetX, offsetY: $offsetY, advanceX: $advanceX, image: $image)';
}