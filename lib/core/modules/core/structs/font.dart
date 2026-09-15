part of '../../../raylib_dartified_base.dart';

enum FontField with StructFields {
  baseSize,
  glyphCount,
  glyphPadding,
  texture,
  recs,
  glyphs,
}

/// Font, font texture and GlyphInfo array data
class FontD extends RaylibStruct<FontD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<FontD> struct = .new(
    factory: FontD.new,
    layout: .aligned<FontField>({
      .baseSize:     RInt(), // Base size (default chars height)
      .glyphCount:   RInt(), // Number of glyph characters
      .glyphPadding: RInt(), // Padding around the glyph characters
      .texture:      RStruct(TextureD.struct), // Texture atlas containing the glyphs
      .recs:         RPointer(RStruct(RectangleD.struct)), // Rectangles in texture for the glyphs
      .glyphs:       RPointer(RStruct(GlyphInfoD.struct)), // Glyphs info data
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<FontField> structLayout = struct.layoutOf();

  /// Field descriptor for [baseSize].
  static final field_baseSize = structLayout.scalar<int, RInt>(.baseSize);
  /// Field descriptor for [glyphCount].
  static final field_glyphCount = structLayout.scalar<int, RInt>(.glyphCount);
  /// Field descriptor for [glyphPadding].
  static final field_glyphPadding = structLayout.scalar<int, RInt>(.glyphPadding);
  /// Field descriptor for [texture].
  static final field_texture = structLayout.struct<TextureD>(.texture);
  /// Field descriptor for [recs].
  static final field_recs = structLayout.pointerStructArray<RectangleD>(.recs);
  /// Field descriptor for [glyphs].
  static final field_glyphs = structLayout.pointerStructArray<GlyphInfoD>(.glyphs);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _baseSize;
  /// Base size (default chars height)
  int get baseSize => _baseSize = field_baseSize.readOr(op, _baseSize);
  set baseSize(int value) => _baseSize = field_baseSize.writeOr(op, value);

  int _glyphCount;
  /// Number of glyph characters
  int get glyphCount => _glyphCount = field_glyphCount.readOr(op, _glyphCount);
  set glyphCount(int value) => _glyphCount = field_glyphCount.writeOr(op, value);

  int _glyphPadding;
  /// Padding around the glyph characters
  int get glyphPadding => _glyphPadding = field_glyphPadding.readOr(op, _glyphPadding);
  set glyphPadding(int value) => _glyphPadding = field_glyphPadding.writeOr(op, value);

  TextureD _texture;
  /// Texture atlas containing the glyphs
  TextureD get texture => _texture = field_texture.readOr(op, _texture);
  set texture(TextureD value) => _texture = field_texture.writeOr(op, value);

  late final StructLiveListStruct<RectangleD> _recs;
  /// Rectangles in texture for the glyphs
  StructLiveListStruct<RectangleD> get recs => _recs;
  set recs(List<RectangleD> value) => _recs.inner = value;

  late final StructLiveListStruct<GlyphInfoD> _glyphs;
  /// Glyphs info data
  StructLiveListStruct<GlyphInfoD> get glyphs => _glyphs;
  set glyphs(List<GlyphInfoD> value) => _glyphs.inner = value;

  FontD({
    super.op,
    int baseSize = 0,
    int glyphCount = 0,
    int glyphPadding = 0,
    TextureD? texture,
    List<RectangleD>? recs,
    List<GlyphInfoD>? glyphs,
  }) :
    _baseSize = baseSize,
    _glyphCount = glyphCount,
    _glyphPadding = glyphPadding,
    _texture = texture ?? .new()
  {
    _recs = field_recs.live(() => op, recs ?? []);
    _glyphs = field_glyphs.live(() => op, glyphs ?? []);
  }

  factory FontD.zero() => .new();

  @override
  FontD setDart(FontD o) {
    baseSize = o.baseSize;
    glyphCount = o.glyphCount;
    glyphPadding = o.glyphPadding;
    texture.setDart(o.texture);
    recs = o.recs;
    glyphs = o.glyphs;
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    if (recs.inner.isNotEmpty) {
      field_recs.allocate(temp, p, '${key}_recs', count: _recs.inner.length, raw: true);
    }
    if (glyphs.inner.isNotEmpty) {
      field_glyphs.allocate(temp, p, '${key}_glyphs', count: _glyphs.inner.length, raw: true);
    }
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_baseSize.write(p, _baseSize);
    field_glyphCount.write(p, _glyphCount);
    field_glyphPadding.write(p, _glyphPadding);
    field_texture.write(p, _texture);
    _recs.writeInto(p);
    _glyphs.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _baseSize = field_baseSize.read(p);
    _glyphCount = field_glyphCount.read(p);
    _glyphPadding = field_glyphPadding.read(p);
    _texture = field_texture.read(p);
    _recs.readFrom(p, count: glyphCount);
    _glyphs.readFrom(p, count: glyphCount);
  }

  @override
  FontD clone() => .new(
    op: op,
    baseSize: baseSize,
    glyphCount: glyphCount,
    glyphPadding: glyphPadding,
    texture: texture.clone(),
    recs: recs.map((x) => x.clone()).toList(),
    glyphs: glyphs.map((x) => x.clone()).toList(),
  );
  
  @override
  String signature() => '$structName(baseSize: $baseSize, glyphCount: $glyphCount, glyphPadding: $glyphPadding, texture: $texture, recs: ${recs.length}, glyphs: ${glyphs.length})';
}