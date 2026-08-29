part of '../../../raylib_dartified_base.dart';

enum FontField with StructFields {
  baseSize,
  glyphCount,
  glyphPadding,
  texture,
  recs,
  glyphs,
}

/// Font texture and GlyphInfo array data.
class FontD extends RaylibStruct<FontD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<FontField> structLayout = .aligned({
    .baseSize:     RInt32(),
    .glyphCount:   RInt32(),
    .glyphPadding: RInt32(),
    .texture:      RStruct(TextureD.structLayout),
    .recs:         RPointer<RStruct>(),
    .glyphs:       RPointer<RStruct>(),
  });

  static StructPointer<FontD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, FontD.new, FontD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int _baseSize;
  /// Base size (default chars height)
  int get baseSize {
    structOnOp((p) => _baseSize = p.readInt32(structLayout.offset(.baseSize)));
    return _baseSize;
  }
  set baseSize(int value) {
    _baseSize = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.baseSize)));
  }

  int _glyphCount;
  /// Number of glyph characters
  int get glyphCount {
    structOnOp((p) => _glyphCount = p.readInt32(structLayout.offset(.glyphCount)));
    return _glyphCount;
  }
  set glyphCount(int value) {
    _glyphCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.glyphCount)));
  }

  int _glyphPadding;
  /// Padding around the glyph characters
  int get glyphPadding {
    structOnOp((p) => _glyphPadding = p.readInt32(structLayout.offset(.glyphPadding)));
    return _glyphPadding;
  }
  set glyphPadding(int value) {
    _glyphPadding = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.glyphPadding)));
  }

  TextureD _texture;
  /// Texture atlas containing the glyphs
  TextureD get texture {
    structOnOp((p) => _texture.structReadFrom(p.offsetBy(structLayout.offset(.texture))));
    return _texture;
  }
  set texture(TextureD value) {
    _texture = value;
    structOnOp((p) => _texture.structWriteInto(p.offsetBy(structLayout.offset(.texture))));
  }

  late LiveListPointerStruct<RectangleD> _recs;
  /// Rectangles in texture for the glyphs
  LiveListPointerStruct<RectangleD> get recs {
    structOnOp((p) => _recs.ptr = p.readPtr(structLayout.offset(.recs)));
    return _recs;
  }
  set recs(List<RectangleD> value) {
    assert(value.length <= glyphCount);
    structOnOp((p) => _recs.ptr = p.readPtr(structLayout.offset(.recs)));
    _recs.inner = value;
  }

  late LiveListPointerStruct<GlyphInfoD> _glyphs;
  /// Glyphs info data
  LiveListPointerStruct<GlyphInfoD> get glyphs {
    structOnOp((p) => _glyphs.ptr = p.readPtr(structLayout.offset(.glyphs)));
    return _glyphs;
  }
  set glyphs(List<GlyphInfoD> value) {
    assert(value.length <= glyphCount);
    structOnOp((p) => _glyphs.ptr = p.readPtr(structLayout.offset(.glyphs)));
    _glyphs.inner = value;
  }

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
    _recs = .new(
      recs ?? [],
      RectangleD.pointer(op?.readPtr(structLayout.offset(.recs))),
    );

    _glyphs = .new(
      glyphs ?? [],
      GlyphInfoD.pointer(op?.readPtr(structLayout.offset(.glyphs))),
    );
  }

  factory FontD.zero() => .new();

  @override
  FontD setD(FontD o) {
    baseSize = o.baseSize;
    glyphCount = o.glyphCount;
    glyphPadding = o.glyphPadding;
    texture.setD(o.texture);
    recs = .generate(o.glyphCount, (i) => o.recs[i]);
    glyphs = .generate(o.glyphCount, (i) => o.glyphs[i]);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {
    if (recs.inner.isNotEmpty) {
      _recs.ptr = temp.Rectangle$.Raw(recs.length);
    }
    if (glyphs.inner.isNotEmpty) {
      _glyphs.ptr = temp.GlyphInfo$.Raw(glyphs.length);
    }
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeInt32(_baseSize, structLayout.offset(.baseSize));
    p.writeInt32(_glyphCount, structLayout.offset(.glyphCount));
    p.writeInt32(_glyphPadding, structLayout.offset(.glyphPadding));
    _texture.structWriteInto(p.offsetBy(structLayout.offset(.texture)));
    p.writePtr(_recs.ptr, structLayout.offset(.recs));
    p.writePtr(_glyphs.ptr, structLayout.offset(.glyphs));

    _recs.onStructPointer((p) => p.writeArray(_recs.inner));
    _glyphs.onStructPointer((p) => p.writeArray(_glyphs.inner));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _baseSize = p.readInt32(structLayout.offset(.baseSize));
    _glyphCount = p.readInt32(structLayout.offset(.glyphCount));
    _glyphPadding = p.readInt32(structLayout.offset(.glyphPadding));
    _texture.structReadFrom(p.offsetBy(structLayout.offset(.texture)));
    _recs.ptr = p.readPtr(structLayout.offset(.recs));
    _glyphs.ptr = p.readPtr(structLayout.offset(.glyphs));

    _recs.onStructPointer((p) => _recs.raw = p.readArray(glyphCount));
    _glyphs.onStructPointer((p) => _glyphs.raw = p.readArray(glyphCount));
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