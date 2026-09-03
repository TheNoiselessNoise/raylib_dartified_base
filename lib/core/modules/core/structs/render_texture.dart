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

  static final _idF = struct.scalar<int, RUnsignedInt>(.id);
  static final _textureF = struct.struct(.texture, TextureD.pointer);
  static final _depthF = struct.struct(.depth, TextureD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _id;
  /// OpenGL framebuffer object id
  int get id => _id = _idF.readOr(op?.ptr, _id);
  set id(int value) => _id = _idF.writeIf(op?.ptr, value);

  TextureD _texture;
  /// Color buffer attachment texture
  TextureD get texture => _texture = _textureF.readOr(op?.ptr, _texture);
  set texture(TextureD value) => _texture = _textureF.writeIf(op?.ptr, value);

  TextureD _depth;
  /// Depth buffer attachment texture
  TextureD get depth => _depth = _depthF.readOr(op?.ptr, _depth);
  set depth(TextureD value) => _depth = _depthF.writeIf(op?.ptr, value);

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
    _idF.write(p, _id);
    _textureF.write(p, _texture);
    _depthF.write(p, _depth);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _id = _idF.read(p);
    _texture = _textureF.read(p);
    _depth = _depthF.read(p);
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