part of '../../../raylib_dartified_base.dart';

enum TextureField with StructFields {
  id,
  width,
  height,
  mipmaps,
  format,
}

/// Texture, tex data stored in GPU memory (VRAM)
class TextureD extends RaylibStruct<TextureD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<TextureD> struct = .new(
    factory: TextureD.new,
    layout: .aligned<TextureField>({
      .id:      RUnsignedInt(), // OpenGL texture id
      .width:   RInt(), // Texture base width
      .height:  RInt(), // Texture base height
      .mipmaps: RInt(), // Mipmap levels, 1 by default
      .format:  RInt(), // Data format (PixelFormat type)
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<TextureField> structLayout = struct.layoutOf();

  /// Field descriptor for [id].
  static final field_id = structLayout.scalar<int, RUnsignedInt>(.id);
  /// Field descriptor for [width].
  static final field_width = structLayout.scalar<int, RInt>(.width);
  /// Field descriptor for [height].
  static final field_height = structLayout.scalar<int, RInt>(.height);
  /// Field descriptor for [mipmaps].
  static final field_mipmaps = structLayout.scalar<int, RInt>(.mipmaps);
  /// Field descriptor for [format].
  static final field_format = structLayout.scalar<int, RInt>(.format);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _id;
  /// OpenGL texture id
  int get id => _id = field_id.readOr(op, _id);
  set id(int value) => _id = field_id.writeOr(op, value);

  int _width;
  /// Texture base wwidthth
  int get width => _width = field_width.readOr(op, _width);
  set width(int value) => _width = field_width.writeOr(op, value);

  int _height;
  /// Texture base height
  int get height => _height = field_height.readOr(op, _height);
  set height(int value) => _height = field_height.writeOr(op, value);

  int _mipmaps;
  /// Mipmap levels, 1 by default
  int get mipmaps => _mipmaps = field_mipmaps.readOr(op, _mipmaps);
  set mipmaps(int value) => _mipmaps = field_mipmaps.writeOr(op, value);

  PixelFormat _format;
  /// Data format (PixelFormat type)
  PixelFormat get format => _format = .fromValue(field_format.readOr(op, _format.value));
  set format(PixelFormat value) => _format = .fromValue(field_format.writeOr(op, value.value));

  TextureD({
    super.op,
    int id = 0,
    int width = 0,
    int height = 0,
    int mipmaps = 0,
    PixelFormat format = .PIXELFORMAT_NONE,
  }) :
    _id = id,
    _width = width,
    _height = height,
    _mipmaps = mipmaps,
    _format = format;

  factory TextureD.zero() => .new();

  @override
  TextureD setDart(TextureD o) {
    id = o.id;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_id.write(p, _id);
    field_width.write(p, _width);
    field_height.write(p, _height);
    field_mipmaps.write(p, _mipmaps);
    field_format.write(p, _format.value);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _id = field_id.read(p);
    _width = field_width.read(p);
    _height = field_height.read(p);
    _mipmaps = field_mipmaps.read(p);
    _format = .fromValue(field_format.read(p));
  }

  @override
  TextureD clone() => .new(
    op: op,
    id: id,
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: format,
  );

  @override
  String signature() => '$structName(id: $id, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';
}