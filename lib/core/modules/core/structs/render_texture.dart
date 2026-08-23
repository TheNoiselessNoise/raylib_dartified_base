part of '../../../raylib_dartified_base.dart';

enum RenderTextureField {
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

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<RenderTextureField> structLayout = .aligned(structFields);
  static final Map<RenderTextureField, RType> structFields = {
    .id:      RUint32(),
    .texture: RStruct(TextureD.structLayout),
    .depth:   RStruct(TextureD.structLayout),
  };

  static StructPointer<RenderTextureD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RenderTextureD.new);

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
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeUint32(id, structLayout.offset(.id));
    texture.writeInto(p.offsetBy(structLayout.offset(.texture)));
    depth.writeInto(p.offsetBy(structLayout.offset(.depth)));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    id = p.readUint32(structLayout.offset(.id));
    texture.readFrom(p.offsetBy(structLayout.offset(.texture)));
    depth.readFrom(p.offsetBy(structLayout.offset(.depth)));
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