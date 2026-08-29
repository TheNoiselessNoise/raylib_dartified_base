part of '../../../raylib_dartified_base.dart';

enum RenderTextureField with StructFields {
  id,
  texture,
  depth,
}

/// FBO for texture rendering.
class RenderTextureD extends RaylibStructLiteral<RenderTextureD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<RenderTextureField> structLayout = .aligned({
    .id:      RUint32(),
    .texture: RStruct(TextureD.structLayout),
    .depth:   RStruct(TextureD.structLayout),
  });

  static StructPointer<RenderTextureD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RenderTextureD.new, RenderTextureD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// OpenGL framebuffer object id
  int id;

  /// Color buffer attachment texture
  TextureD texture;
  
  /// Depth buffer attachment texture
  TextureD depth;

  RenderTextureD({
    super.op,
    this.id = 0,
    TextureD? texture,
    TextureD? depth,
  }) :
    texture = texture ?? .new(),
    depth = depth ?? .new();

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
    p.writeUint32(id, structLayout.offset(.id));
    texture.structWriteInto(p.offsetBy(structLayout.offset(.texture)));
    depth.structWriteInto(p.offsetBy(structLayout.offset(.depth)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    id = p.readUint32(structLayout.offset(.id));
    texture.structReadFrom(p.offsetBy(structLayout.offset(.texture)));
    depth.structReadFrom(p.offsetBy(structLayout.offset(.depth)));
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