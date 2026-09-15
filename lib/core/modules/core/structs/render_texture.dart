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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<RenderTextureD> struct = .new(
    factory: RenderTextureD.new,
    layout: .aligned<RenderTextureField>({
      .id:      RUnsignedInt(), // OpenGL framebuffer object id
      .texture: RStruct(TextureD.struct), // Color buffer attachment texture
      .depth:   RStruct(TextureD.struct), // Depth buffer attachment texture
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<RenderTextureField> structLayout = struct.layoutOf();

  /// Field descriptor for [id].
  static final field_id = structLayout.scalar<int, RUnsignedInt>(.id);
  /// Field descriptor for [texture].
  static final field_texture = structLayout.struct<TextureD>(.texture);
  /// Field descriptor for [depth].
  static final field_depth = structLayout.struct<TextureD>(.depth);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _id;
  /// OpenGL framebuffer object id
  int get id => _id = field_id.readOr(op, _id);
  set id(int value) => _id = field_id.writeOr(op, value);

  TextureD _texture;
  /// Color buffer attachment texture
  TextureD get texture => _texture = field_texture.readOr(op, _texture);
  set texture(TextureD value) => _texture = field_texture.writeOr(op, value);

  TextureD _depth;
  /// Depth buffer attachment texture
  TextureD get depth => _depth = field_depth.readOr(op, _depth);
  set depth(TextureD value) => _depth = field_depth.writeOr(op, value);

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
  RenderTextureD setDart(RenderTextureD o) {
    id = o.id;
    texture = o.texture;
    depth = o.texture;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_id.write(p, _id);
    field_texture.write(p, _texture);
    field_depth.write(p, _depth);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _id = field_id.read(p);
    _texture = field_texture.read(p);
    _depth = field_depth.read(p);
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