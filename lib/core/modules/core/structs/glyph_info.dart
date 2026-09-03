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

  @override
  StructLayout<GlyphInfoField> get structLayout => struct;

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

  static final _valueF = struct.scalar<int, RInt>(.value);
  static final _offsetXF = struct.scalar<int, RInt>(.offsetX);
  static final _offsetYF = struct.scalar<int, RInt>(.offsetY);
  static final _advanceXF = struct.scalar<int, RInt>(.advanceX);
  static final _imageF = struct.struct(.image, ImageD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _value;
  /// Character value (Unicode)
  int get value => _value = _valueF.readOr(op?.ptr, _value);
  set value(int value) => _value = _valueF.writeIf(op?.ptr, value);

  int _offsetX;
  /// Character offset X when drawing
  int get offsetX => _offsetX = _offsetXF.readOr(op?.ptr, _offsetX);
  set offsetX(int value) => _offsetX = _offsetXF.writeIf(op?.ptr, value);

  int _offsetY;
  /// Character offset Y when drawing
  int get offsetY => _offsetY = _offsetYF.readOr(op?.ptr, _offsetY);
  set offsetY(int value) => _offsetY = _offsetYF.writeIf(op?.ptr, value);

  int _advanceX;
  /// Character advance position X
  int get advanceX => _advanceX = _advanceXF.readOr(op?.ptr, _advanceX);
  set advanceX(int value) => _advanceX = _advanceXF.writeIf(op?.ptr, value);

  ImageD _image;
  /// Character image data
  ImageD get image => _image = _imageF.readOr(op?.ptr, _image);
  set image(ImageD value) => _image = _imageF.writeIf(op?.ptr, value);

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
  GlyphInfoD setDart(GlyphInfoD o) {
    value = o.value;
    offsetX = o.offsetX;
    offsetY = o.offsetY;
    advanceX = o.advanceX;
    image.setDart(o.image);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _valueF.write(p, _value);
    _offsetXF.write(p, _offsetX);
    _offsetYF.write(p, _offsetY);
    _advanceXF.write(p, _advanceX);
    _imageF.write(p, _image);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _value = _valueF.read(p);
    _offsetX = _offsetXF.read(p);
    _offsetY = _offsetYF.read(p);
    _advanceX = _advanceXF.read(p);
    _image = _imageF.read(p);
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