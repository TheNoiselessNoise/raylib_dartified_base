part of '../../../raylib_dartified_base.dart';

enum RenderTextureField with StructFields {
  id,
  texture,
  depth,
}

/// RenderTexture, fbo for texture rendering
class RenderTextureD extends RaylibStructLiteral<RenderTextureD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RenderTextureField> structLayout = .aligned({
    .id:      RUnsignedInt(), // OpenGL framebuffer object id
    .texture: RStruct(TextureD.structLayout), // Color buffer attachment texture
    .depth:   RStruct(TextureD.structLayout), // Depth buffer attachment texture
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RenderTextureD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RenderTextureD.new, RenderTextureD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int _id;
  /// OpenGL framebuffer object id
  int get id {
    structOnOp((p) => _id = p.readUnsignedInt(structLayout.offset(.id)));
    return _id;
  }
  set id(int value) {
    _id = value;
    structOnOp((p) => p.writeUnsignedInt(value, structLayout.offset(.id)));
  }

  TextureD _texture;
  /// Color buffer attachment texture
  TextureD get texture {
    structOnOp((p) => _texture.structReadFrom(p.offsetBy(structLayout.offset(.texture))));
    return _texture;
  }
  set texture(TextureD value) {
    _texture = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.texture))));
  }
  
  TextureD _depth;
  /// Depth buffer attachment texture
  TextureD get depth {
    structOnOp((p) => _depth.structReadFrom(p.offsetBy(structLayout.offset(.depth))));
    return _depth;
  }
  set depth(TextureD value) {
    _depth = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.depth))));
  }

  RenderTextureD({
    super.op,
    int id = 0,
    TextureD? texture,
    TextureD? depth,
  }) :
    _id = id,
    _texture = texture ?? .new(),
    _depth = depth ?? .new();

  factory RenderTextureD.zero() => .new();

  @override
  RenderTextureD setD(RenderTextureD o) {
    id = o.id;
    texture = o.texture;
    depth = o.texture;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeUnsignedInt(_id, structLayout.offset(.id));
    _texture.structWriteInto(p.offsetBy(structLayout.offset(.texture)));
    _depth.structWriteInto(p.offsetBy(structLayout.offset(.depth)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _id = p.readUnsignedInt(structLayout.offset(.id));
    _texture.structReadFrom(p.offsetBy(structLayout.offset(.texture)));
    _depth.structReadFrom(p.offsetBy(structLayout.offset(.depth)));
  }

  @override
  RenderTextureD clone() => .new(
    op: op,
    id: id,
    texture: texture.clone(),
    depth: depth.clone(),
  );

  @override
  String signature() => '$structName(id: $id, texture: $texture, depth: $depth)';
}