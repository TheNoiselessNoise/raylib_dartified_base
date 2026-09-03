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

  static final _idF = struct.scalar<int, RUnsignedInt>(.id);
  static final _widthF = struct.scalar<int, RInt>(.width);
  static final _heightF = struct.scalar<int, RInt>(.height);
  static final _mipmapsF = struct.scalar<int, RInt>(.mipmaps);
  static final _formatF = struct.scalar<int, RInt>(.format);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _id;
  /// OpenGL texture id
  int get id => _id = _idF.readOr(op?.ptr, _id);
  set id(int value) => _id = _idF.writeIf(op?.ptr, value);

  int _width;
  /// Texture base wwidthth
  int get width => _width = _widthF.readOr(op?.ptr, _width);
  set width(int value) => _width = _widthF.writeIf(op?.ptr, value);

  int _height;
  /// Texture base height
  int get height => _height = _heightF.readOr(op?.ptr, _height);
  set height(int value) => _height = _heightF.writeIf(op?.ptr, value);

  int _mipmaps;
  /// Mipmap levels, 1 by default
  int get mipmaps => _mipmaps = _mipmapsF.readOr(op?.ptr, _mipmaps);
  set mipmaps(int value) => _mipmaps = _mipmapsF.writeIf(op?.ptr, value);

  PixelFormat _format;
  /// Data format (PixelFormat type)
  PixelFormat get format => _format = .fromValue(_formatF.readOr(op?.ptr, _format.value));
  set format(PixelFormat value) => _format = .fromValue(_formatF.writeIf(op?.ptr, value.value));

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
    _idF.write(p, _id);
    _widthF.write(p, _width);
    _heightF.write(p, _height);
    _mipmapsF.write(p, _mipmaps);
    _formatF.write(p, _format.value);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _id = _idF.read(p);
    _width = _widthF.read(p);
    _height = _heightF.read(p);
    _mipmaps = _mipmapsF.read(p);
    _format = .fromValue(_formatF.read(p));
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