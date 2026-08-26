part of '../../../raylib_dartified_base.dart';

enum GlyphInfoField {
  value,
  offsetX,
  offsetY,
  advanceX,
  image,
}

/// Font characters glyphs info.
class GlyphInfoD extends RaylibStruct<GlyphInfoD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<GlyphInfoField> structLayout = .aligned(structFields);
  static final Map<GlyphInfoField, RType> structFields = {
    .value:    RInt32(),
    .offsetX:  RInt32(),
    .offsetY:  RInt32(),
    .advanceX: RInt32(),
    .image:    RStruct(ImageD.structLayout),
  };

  static StructPointer<GlyphInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, GlyphInfoD.new, GlyphInfoD.pointer);

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
    structOnOp((p) => _value = p.readInt32(structLayout.offset(.value)));
    return _value;
  }
  set value(int value) {
    _value = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.value)));
  }
  
  int _offsetX;
  /// Character offset X when drawing
  int get offsetX {
    structOnOp((p) => _offsetX = p.readInt32(structLayout.offset(.offsetX)));
    return _offsetX;
  }
  set offsetX(int value) {
    _offsetX = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.offsetX)));
  }
  
  int _offsetY;
  /// Character offset Y when drawing
  int get offsetY {
    structOnOp((p) => _offsetY = p.readInt32(structLayout.offset(.offsetY)));
    return _offsetY;
  }
  set offsetY(int value) {
    _offsetY = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.offsetY)));
  }
  
  int _advanceX;
  /// Character advance position X
  int get advanceX {
    structOnOp((p) => _advanceX = p.readInt32(structLayout.offset(.advanceX)));
    return _advanceX;
  }
  set advanceX(int value) {
    _advanceX = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.advanceX)));
  }
  
  ImageD _image;
  /// Character image data
  ImageD get image {
    structOnOp((p) => _image.structReadFrom(p.offsetBy(structLayout.offset(.image))));
    return _image;
  }
  set image(ImageD value) {
    _image = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.image))));
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
    p.writeInt32(_value, structLayout.offset(.value));
    p.writeInt32(_offsetX, structLayout.offset(.offsetX));
    p.writeInt32(_offsetY, structLayout.offset(.offsetY));
    p.writeInt32(_advanceX, structLayout.offset(.advanceX));
    _image.structWriteInto(p.offsetBy(structLayout.offset(.image)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _value = p.readInt32(structLayout.offset(.value));
    _offsetX = p.readInt32(structLayout.offset(.offsetX));
    _offsetY = p.readInt32(structLayout.offset(.offsetY));
    _advanceX = p.readInt32(structLayout.offset(.advanceX));
    _image.structReadFrom(p.offsetBy(structLayout.offset(.image)));
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