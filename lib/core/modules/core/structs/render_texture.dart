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

  @override
  StructLayout<RenderTextureField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RenderTextureField> struct = .aligned({
    .id:      RUnsignedInt(), // OpenGL framebuffer object id
    .texture: RStruct(TextureD.struct), // Color buffer attachment texture
    .depth:   RStruct(TextureD.struct), // Depth buffer attachment texture
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RenderTextureD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, RenderTextureD.new, RenderTextureD.pointer);

  static final field_id = struct.scalar<int, RUnsignedInt>(.id);
  static final field_texture = struct.struct(.texture, TextureD.pointer);
  static final field_depth = struct.struct(.depth, TextureD.pointer);

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
  set id(int value) => _id = field_id.writeIf(op, value);

  TextureD _texture;
  /// Color buffer attachment texture
  TextureD get texture => _texture = field_texture.readOr(op, _texture);
  set texture(TextureD value) => _texture = field_texture.writeIf(op, value);

  TextureD _depth;
  /// Depth buffer attachment texture
  TextureD get depth => _depth = field_depth.readOr(op, _depth);
  set depth(TextureD value) => _depth = field_depth.writeIf(op, value);

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