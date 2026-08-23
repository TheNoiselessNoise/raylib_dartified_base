part of '../../../raylib_dartified_base.dart';

enum TextureField {
  id,
  width,
  height,
  mipmaps,
  format,
}

/// Tex data stored in GPU memory (VRAM).
class TextureD extends RaylibStruct<TextureD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<TextureField> structLayout = .aligned(structFields);
  static final Map<TextureField, RType> structFields = {
    .id:      RUint32(),
    .width:   RInt32(),
    .height:  RInt32(),
    .mipmaps: RInt32(),
    .format:  RInt32(),
  };

  static StructPointer<TextureD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, TextureD.new);

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
    structOnOp((p) => _id = p.readUint32(structLayout.offset(.id)));
    return _id;
  }
  set id(int value) {
    _id = value;
    structOnOp((p) => p.writeUint32(value, structLayout.offset(.id)));
  }

  int _width;
  /// Texture base width
  int get width {
    structOnOp((p) => _width = p.readInt32(structLayout.offset(.width)));
    return _width;
  }
  set width(int value) {
    _width = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.width)));
  }

  int _height;
  /// Texture base height
  int get height {
    structOnOp((p) => _height = p.readInt32(structLayout.offset(.height)));
    return _height;
  }
  set height(int value) {
    _height = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.height)));
  }

  int _mipmaps;
  /// Mipmap levels, 1 by default
  int get mipmaps {
    structOnOp((p) => _mipmaps = p.readInt32(structLayout.offset(.mipmaps)));
    return _mipmaps;
  }
  set mipmaps(int value) {
    _mipmaps = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.mipmaps)));
  }

  PixelFormat _format;
  /// Data format
  PixelFormat get format {
    structOnOp((p) => _format = .fromValue(p.readInt32(structLayout.offset(.format))));
    return _format;
  }
  set format(PixelFormat value) {
    _format = value;
    structOnOp((p) => p.writeInt32(value.value, structLayout.offset(.format)));
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
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeUint32(id, structLayout.offset(.id));
    p.writeInt32(width, structLayout.offset(.width));
    p.writeInt32(height, structLayout.offset(.height));
    p.writeInt32(mipmaps, structLayout.offset(.mipmaps));
    p.writeInt32(format.value, structLayout.offset(.format));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    id = p.readUint32(structLayout.offset(.id));
    width = p.readInt32(structLayout.offset(.width));
    height = p.readInt32(structLayout.offset(.height));
    mipmaps = p.readInt32(structLayout.offset(.mipmaps));
    format = .fromValue(p.readInt32(structLayout.offset(.format)));
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