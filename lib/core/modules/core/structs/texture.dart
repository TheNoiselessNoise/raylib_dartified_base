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

  @override
  StructLayout<TextureField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<TextureField> struct = .aligned({
    .id:      RUnsignedInt(), // OpenGL texture id
    .width:   RInt(), // Texture base width
    .height:  RInt(), // Texture base height
    .mipmaps: RInt(), // Mipmap levels, 1 by default
    .format:  RInt(), // Data format (PixelFormat type)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<TextureD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, TextureD.new, TextureD.pointer);

  static final field_id = struct.scalar<int, RUnsignedInt>(.id);
  static final field_width = struct.scalar<int, RInt>(.width);
  static final field_height = struct.scalar<int, RInt>(.height);
  static final field_mipmaps = struct.scalar<int, RInt>(.mipmaps);
  static final field_format = struct.scalar<int, RInt>(.format);

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
  set id(int value) => _id = field_id.writeIf(op, value);

  int _width;
  /// Texture base wwidthth
  int get width => _width = field_width.readOr(op, _width);
  set width(int value) => _width = field_width.writeIf(op, value);

  int _height;
  /// Texture base height
  int get height => _height = field_height.readOr(op, _height);
  set height(int value) => _height = field_height.writeIf(op, value);

  int _mipmaps;
  /// Mipmap levels, 1 by default
  int get mipmaps => _mipmaps = field_mipmaps.readOr(op, _mipmaps);
  set mipmaps(int value) => _mipmaps = field_mipmaps.writeIf(op, value);

  PixelFormat _format;
  /// Data format (PixelFormat type)
  PixelFormat get format => _format = .fromValue(field_format.readOr(op, _format.value));
  set format(PixelFormat value) => _format = .fromValue(field_format.writeIf(op, value.value));

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