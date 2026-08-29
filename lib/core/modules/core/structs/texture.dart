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
  static final StructLayout<TextureField> structLayout = .aligned({
    .id:      RUnsignedInt(), // OpenGL texture id
    .width:   RInt(), // Texture base width
    .height:  RInt(), // Texture base height
    .mipmaps: RInt(), // Mipmap levels, 1 by default
    .format:  RInt(), // Data format (PixelFormat type)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<TextureD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, TextureD.new, TextureD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int _id;
  /// OpenGL texture id
  int get id {
    structOnOp((p) => _id = p.readUnsignedInt(structLayout.offset(.id)));
    return _id;
  }
  set id(int value) {
    _id = value;
    structOnOp((p) => p.writeUnsignedInt(value, structLayout.offset(.id)));
  }

  int _width;
  /// Texture base width
  int get width {
    structOnOp((p) => _width = p.readInt(structLayout.offset(.width)));
    return _width;
  }
  set width(int value) {
    _width = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.width)));
  }

  int _height;
  /// Texture base height
  int get height {
    structOnOp((p) => _height = p.readInt(structLayout.offset(.height)));
    return _height;
  }
  set height(int value) {
    _height = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.height)));
  }

  int _mipmaps;
  /// Mipmap levels, 1 by default
  int get mipmaps {
    structOnOp((p) => _mipmaps = p.readInt(structLayout.offset(.mipmaps)));
    return _mipmaps;
  }
  set mipmaps(int value) {
    _mipmaps = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.mipmaps)));
  }

  PixelFormat _format;
  /// Data format (PixelFormat type)
  PixelFormat get format {
    structOnOp((p) => _format = .fromValue(p.readInt(structLayout.offset(.format))));
    return _format;
  }
  set format(PixelFormat value) {
    _format = value;
    structOnOp((p) => p.writeInt(value.value, structLayout.offset(.format)));
  }

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
  TextureD setD(TextureD o) {
    id = o.id;
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeUnsignedInt(_id, structLayout.offset(.id));
    p.writeInt(_width, structLayout.offset(.width));
    p.writeInt(_height, structLayout.offset(.height));
    p.writeInt(_mipmaps, structLayout.offset(.mipmaps));
    p.writeInt(_format.value, structLayout.offset(.format));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _id = p.readUnsignedInt(structLayout.offset(.id));
    _width = p.readInt(structLayout.offset(.width));
    _height = p.readInt(structLayout.offset(.height));
    _mipmaps = p.readInt(structLayout.offset(.mipmaps));
    _format = .fromValue(p.readInt(structLayout.offset(.format)));
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