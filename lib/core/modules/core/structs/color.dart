part of '../../../raylib_dartified_base.dart';

enum ColorField with StructFields {
  r,
  g,
  b,
  a,
}

/// Color, 4 components, R8G8B8A8 (32bit)
class ColorD extends RaylibStructLiteral<ColorD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<ColorField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<ColorField> struct = .aligned({
    .r: RUnsignedChar(), // Color red value
    .g: RUnsignedChar(), // Color green value
    .b: RUnsignedChar(), // Color blue value
    .a: RUnsignedChar(), // Color alpha value
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<ColorD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, ColorD.new, ColorD.pointer);

  static final _rF = struct.scalar<int, RUnsignedChar>(.r);
  static final _gF = struct.scalar<int, RUnsignedChar>(.g);
  static final _bF = struct.scalar<int, RUnsignedChar>(.b);
  static final _aF = struct.scalar<int, RUnsignedChar>(.a);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _r;
  /// Color red value
  ///
  /// Expected range: 0-255
  int get r => _r = _rF.readOr(op, _r);
  set r(int value) => _r = _rF.writeIf(op, value);
  
  int _g;
  /// Color green value
  ///
  /// Expected range: 0-255
  int get g => _g = _gF.readOr(op, _g);
  set g(int value) => _g = _gF.writeIf(op, value);
  
  int _b;
  /// Color blue value
  ///
  /// Expected range: 0-255
  int get b => _b = _bF.readOr(op, _b);
  set b(int value) => _b = _bF.writeIf(op, value);
  
  int _a;
  /// Color alpha value
  ///
  /// Expected range: 0-255
  int get a => _a = _aF.readOr(op, _a);
  set a(int value) => _a = _aF.writeIf(op, value);

  ColorD({
    super.op,
    int r = 0,
    int g = 0,
    int b = 0,
    int a = 0,
  }) :
    _r = r,
    _g = g,
    _b = b,
    _a = a;

  factory ColorD.zero() => .new();

  factory ColorD.color(
    num r,
    num g,
    num b,
    num a,
  ) => .new(
    r: r.toInt(),
    g: g.toInt(),
    b: b.toInt(),
    a: a.toInt(),
  );

  @override
  ColorD setDart(ColorD o) => set(o.r, o.g, o.b, o.a);

  @override
  void structWriteInto(MemoryPointerHandle p) {
    _rF.write(p, _r);
    _gF.write(p, _g);
    _bF.write(p, _b);
    _aF.write(p, _a);
  }

  @override
  void structReadFrom(MemoryPointerHandle p) {
    _r = _rF.read(p);
    _g = _gF.read(p);
    _b = _bF.read(p);
    _a = _aF.read(p);
  }

  @override
  ColorD clone() => .new(
    op: op,
    r: r,
    g: g, 
    b: b, 
    a: a,
  );

  // Base Raylib Colors
  static ColorD get LIGHTGRAY => .color(200, 200, 200, 255);
  static ColorD get GRAY => .color(130, 130, 130, 255);
  static ColorD get DARKGRAY => .color(80, 80, 80, 255);
  static ColorD get YELLOW => .color(253, 249, 0, 255);
  static ColorD get GOLD => .color(255, 203, 0, 255);
  static ColorD get ORANGE => .color(255, 161, 0, 255);
  static ColorD get PINK => .color(255, 109, 194, 255);
  static ColorD get RED => .color(230, 41, 55, 255);
  static ColorD get MAROON => .color(190, 33, 55, 255);
  static ColorD get GREEN => .color(0, 228, 48, 255);
  static ColorD get LIME => .color(0, 158, 47, 255);
  static ColorD get DARKGREEN => .color(0, 117, 44, 255);
  static ColorD get SKYBLUE => .color(102, 191, 255, 255);
  static ColorD get BLUE => .color(0, 121, 241, 255);
  static ColorD get DARKBLUE => .color(0, 82, 172, 255);
  static ColorD get PURPLE => .color(200, 122, 255, 255);
  static ColorD get VIOLET => .color(135, 60, 190, 255);
  static ColorD get DARKPURPLE => .color(112, 31, 126, 255);
  static ColorD get BEIGE => .color(211, 176, 131, 255);
  static ColorD get BROWN => .color(127, 106, 79, 255);
  static ColorD get DARKBROWN => .color(76, 63, 47, 255);
  static ColorD get WHITE => .color(255, 255, 255, 255);
  static ColorD get BLACK => .color(0, 0, 0, 255);
  static ColorD get BLANK => .color(0, 0, 0, 0);
  static ColorD get MAGENTA => .color(255, 0, 255, 255);
  static ColorD get RAYWHITE => .color(245, 245, 245, 255);
  static ColorD get TRANSPARENT => .color(255, 255, 255, 0);

  // Extra

  // Cyans & Teals
  static ColorD get CYAN => .color(0, 255, 255, 255);
  static ColorD get DARKCYAN => .color(0, 139, 139, 255);
  static ColorD get TEAL => .color(0, 128, 128, 255);
  static ColorD get DARKTEAL => .color(0, 80, 80, 255);
  static ColorD get AQUA => .color(0, 210, 210, 255);
  static ColorD get TURQUOISE => .color(64, 224, 208, 255);
  static ColorD get DARKTURQUOISE => .color(0, 148, 133, 255);
  static ColorD get MINTGREEN => .color(60, 255, 180, 255);
  static ColorD get SEAFOAM => .color(46, 194, 160, 255);

  // Reds & Pinks
  static ColorD get DARKRED => .color(139, 0, 0, 255);
  static ColorD get CRIMSON => .color(220, 20, 60, 255);
  static ColorD get SCARLET => .color(255, 36, 0, 255);
  static ColorD get ROSE => .color(255, 0, 127, 255);
  static ColorD get HOTPINK => .color(255, 20, 147, 255);
  static ColorD get SALMON => .color(250, 128, 114, 255);
  static ColorD get CORAL => .color(255, 127, 80, 255);
  static ColorD get TOMATO => .color(255, 99, 71, 255);

  // Oranges & Yellows
  static ColorD get DARKORANGE => .color(255, 100, 0, 255);
  static ColorD get AMBER => .color(255, 191, 0, 255);
  static ColorD get KHAKI => .color(195, 176, 93, 255);
  static ColorD get OLIVE => .color(107, 142, 35, 255);
  static ColorD get DARKOLIVE => .color(64, 90, 20, 255);
  static ColorD get PEACH => .color(255, 218, 185, 255);
  static ColorD get LEMON => .color(255, 247, 0, 255);

  // Greens
  static ColorD get CHARTREUSE => .color(127, 255, 0, 255);
  static ColorD get SPRINGGREEN => .color(0, 255, 127, 255);
  static ColorD get EMERALD => .color(0, 201, 87, 255);
  static ColorD get FOREST => .color(34, 139, 34, 255);
  static ColorD get DARKFOREST => .color(20, 80, 20, 255);
  static ColorD get SAGE => .color(100, 148, 100, 255);
  static ColorD get MINT => .color(189, 252, 201, 255);
  static ColorD get JADE => .color(0, 168, 107, 255);
  static ColorD get MOSS => .color(82, 118, 72, 255);

  // Blues
  static ColorD get NAVY => .color(0, 0, 128, 255);
  static ColorD get DARKNAVY => .color(0, 0, 80, 255);
  static ColorD get ROYALBLUE => .color(65, 105, 225, 255);
  static ColorD get CORNFLOWER => .color(100, 149, 237, 255);
  static ColorD get STEELBLUE => .color(70, 130, 180, 255);
  static ColorD get DODGERBLUE => .color(30, 144, 255, 255);
  static ColorD get MIDNIGHTBLUE => .color(25, 25, 112, 255);
  static ColorD get CADET => .color(95, 158, 160, 255);
  static ColorD get PERIWINKLE => .color(153, 153, 255, 255);
  static ColorD get AZURE => .color(0, 127, 255, 255);
  static ColorD get ICE => .color(180, 220, 255, 255);

  // Purples & Violets
  static ColorD get LAVENDER => .color(181, 126, 220, 255);
  static ColorD get DARKVIOLET => .color(90, 0, 200, 255);
  static ColorD get INDIGO => .color(75, 0, 130, 255);
  static ColorD get PLUM => .color(142, 69, 133, 255);
  static ColorD get ORCHID => .color(218, 112, 214, 255);
  static ColorD get FUCHSIA => .color(255, 0, 200, 255);
  static ColorD get LILAC => .color(200, 162, 200, 255);
  static ColorD get MAUVE => .color(153, 102, 153, 255);
  static ColorD get GRAPE => .color(111, 45, 168, 255);
  static ColorD get AMETHYST => .color(153, 102, 204, 255);

  // Neutrals & Browns
  static ColorD get TAN => .color(210, 180, 140, 255);
  static ColorD get SAND => .color(194, 178, 128, 255);
  static ColorD get SIENNA => .color(160, 82, 45, 255);
  static ColorD get CHOCOLATE => .color(210, 105, 30, 255);
  static ColorD get COPPER => .color(184, 115, 51, 255);
  static ColorD get BRONZE => .color(140, 90, 50, 255);
  static ColorD get GOLDENROD => .color(218, 165, 32, 255);
  static ColorD get IVORY => .color(255, 255, 240, 255);
  static ColorD get CREAM => .color(255, 253, 208, 255);
  static ColorD get LINEN => .color(250, 240, 230, 255);
  static ColorD get SNOW => .color(255, 250, 250, 255);
  static ColorD get OFFWHITE => .color(230, 230, 220, 255);

  // Grays
  static ColorD get SILVER => .color(192, 192, 192, 255);
  static ColorD get DIMGRAY => .color(105, 105, 105, 255);
  static ColorD get CHARCOAL => .color(54, 69, 79, 255);
  static ColorD get JET => .color(52, 52, 52, 255);
  static ColorD get SLATE => .color(112, 128, 144, 255);
  static ColorD get DARKSLATE => .color(47, 79, 79, 255);
  static ColorD get ASH => .color(178, 190, 181, 255);

  // Neons / UI accents
  static ColorD get NEONGREEN => .color(57, 255, 20, 255);
  static ColorD get NEONBLUE => .color(31, 81, 255, 255);
  static ColorD get NEONPINK => .color(255, 16, 240, 255);
  static ColorD get NEONYELLOW => .color(255, 255, 0, 255);
  static ColorD get NEONORANGE => .color(255, 103, 0, 255);
  static ColorD get NEONPURPLE => .color(188, 19, 254, 255);
  static ColorD get NEONRED => .color(255, 7, 58, 255);
  static ColorD get NEONCYAN => .color(0, 255, 230, 255);

  /// Sets all components at once.
  ///
  /// Values are converted using [num.toInt], truncating any fractional part.
  ///
  /// Returns this instance for fluent chaining.
  ColorD set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this;
  }

  /// Returns this color encoded as an uppercase hexadecimal RGBA string.
  ///
  /// Format: `RRGGBBAA`
  ///
  /// Example:
  /// ```dart
  /// color.toHex(); // "FF0000FF"
  /// ```
  String toHex() =>
    '${r.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${g.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${b.toRadixString(16).padLeft(2, '0').toUpperCase()}'
    '${a.toRadixString(16).padLeft(2, '0').toUpperCase()}';

  /// Returns the components as a new int list.
  ///
  /// Order: `[r, g, b, a]`
  List<int> toArray() => [r, g, b, a];

  /// Returns [Vector4D] with each component normalized.
  Vector4D normalized() => .vec4(
    r / 255,
    g / 255,
    b / 255,
    a / 255,
  );

  @override
  String signature() => '$structName(r: $r, g: $g, b: $b, a: $a)';
}