part of '../../../raylib_dartified_base.dart';

enum GlyphInfoField with StructFields {
  value,
  offsetX,
  offsetY,
  advanceX,
  image,
}

/// GlyphInfo, font characters glyphs info
class GlyphInfoD extends RaylibStruct<GlyphInfoD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<GlyphInfoField> struct = .aligned({
    .value:    RInt(), // Character value (Unicode)
    .offsetX:  RInt(), // Character offset X when drawing
    .offsetY:  RInt(), // Character offset Y when drawing
    .advanceX: RInt(), // Character advance position X
    .image:    RStruct(ImageD.struct), // Character image data
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<GlyphInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, GlyphInfoD.new, GlyphInfoD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int _value;
  /// Character value (Unicode)
  int get value {
    structOnOp((p) => _value = p.readInt(struct.offset(.value)));
    return _value;
  }
  set value(int value) {
    _value = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.value)));
  }
  
  int _offsetX;
  /// Character offset X when drawing
  int get offsetX {
    structOnOp((p) => _offsetX = p.readInt(struct.offset(.offsetX)));
    return _offsetX;
  }
  set offsetX(int value) {
    _offsetX = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.offsetX)));
  }
  
  int _offsetY;
  /// Character offset Y when drawing
  int get offsetY {
    structOnOp((p) => _offsetY = p.readInt(struct.offset(.offsetY)));
    return _offsetY;
  }
  set offsetY(int value) {
    _offsetY = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.offsetY)));
  }
  
  int _advanceX;
  /// Character advance position X
  int get advanceX {
    structOnOp((p) => _advanceX = p.readInt(struct.offset(.advanceX)));
    return _advanceX;
  }
  set advanceX(int value) {
    _advanceX = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.advanceX)));
  }
  
  ImageD _image;
  /// Character image data
  ImageD get image {
    structOnOp((p) => _image.structReadFrom(p.offsetBy(struct.offset(.image))));
    return _image;
  }
  set image(ImageD value) {
    _image = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(struct.offset(.image))));
  }

  GlyphInfoD({
    super.op,
    int value = 0,
    int offsetX = 0,
    int offsetY = 0,
    int advanceX = 0,
    ImageD? image,
  }) :
    _value = value,
    _offsetX = offsetX,
    _offsetY = offsetY,
    _advanceX = advanceX,
    _image = image ?? .zero();

  factory GlyphInfoD.zero() => .new();

  @override
  GlyphInfoD setD(GlyphInfoD o) {
    value = o.value;
    offsetX = o.offsetX;
    offsetY = o.offsetY;
    advanceX = o.advanceX;
    image.setD(o.image);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeInt(_value, struct.offset(.value));
    p.writeInt(_offsetX, struct.offset(.offsetX));
    p.writeInt(_offsetY, struct.offset(.offsetY));
    p.writeInt(_advanceX, struct.offset(.advanceX));
    _image.structWriteInto(p.offsetBy(struct.offset(.image)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _value = p.readInt(struct.offset(.value));
    _offsetX = p.readInt(struct.offset(.offsetX));
    _offsetY = p.readInt(struct.offset(.offsetY));
    _advanceX = p.readInt(struct.offset(.advanceX));
    _image.structReadFrom(p.offsetBy(struct.offset(.image)));
  }

  @override
  GlyphInfoD clone() => .new(
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