part of '../../../raylib_dartified_base.dart';

enum NPatchInfoField with StructFields {
  source,
  left,
  top,
  right,
  bottom,
  layout,
}

/// NPatchInfo, n-patch layout info
class NPatchInfoD extends RaylibStructLiteral<NPatchInfoD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<NPatchInfoD> struct = .new(
    factory: NPatchInfoD.new,
    layout: .aligned<NPatchInfoField>({
      .source: RStruct(RectangleD.struct), // Texture source rectangle
      .left:   RInt(), // Left border offset
      .top:    RInt(), // Top border offset
      .right:  RInt(), // Right border offset
      .bottom: RInt(), // Bottom border offset
      .layout: RInt(), // Layout of the n-patch: 3x3, 1x3 or 3x1
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<NPatchInfoField> structLayout = struct.layoutOf();

  /// Field descriptor for [source].
  static final field_source = structLayout.struct<RectangleD>(.source);
  /// Field descriptor for [left].
  static final field_left = structLayout.scalar<int, RInt>(.left);
  /// Field descriptor for [top].
  static final field_top = structLayout.scalar<int, RInt>(.top);
  /// Field descriptor for [right].
  static final field_right = structLayout.scalar<int, RInt>(.right);
  /// Field descriptor for [bottom].
  static final field_bottom = structLayout.scalar<int, RInt>(.bottom);
  /// Field descriptor for [layout].
  static final field_layout = structLayout.enumValue(.layout, NPatchLayout.fromValue);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  RectangleD _source;
  /// Texture source rectangle
  RectangleD get source => _source = field_source.readOr(op, _source);
  set source(RectangleD value) => _source = field_source.writeOr(op, value);

  int _left;
  /// Left border offset
  int get left => _left = field_left.readOr(op, _left);
  set left(int value) => _left = field_left.writeOr(op, value);

  int _top;
  /// Top border offset
  int get top => _top = field_top.readOr(op, _top);
  set top(int value) => _top = field_top.writeOr(op, value);

  int _right;
  /// Right border offset
  int get right => _right = field_right.readOr(op, _right);
  set right(int value) => _right = field_right.writeOr(op, value);

  int _bottom;
  /// Bottom border offset
  int get bottom => _bottom = field_bottom.readOr(op, _bottom);
  set bottom(int value) => _bottom = field_bottom.writeOr(op, value);

  NPatchLayout _layout;
  /// Layout of the n-patch: 3x3, 1x3 or 3x1
  NPatchLayout get layout => _layout = field_layout.readOr(op, _layout);
  set layout(NPatchLayout value) => _layout = field_layout.writeOr(op, value);

  NPatchInfoD({
    super.op,
    RectangleD? source,
    int left = 0,
    int top = 0,
    int right = 0,
    int bottom = 0,
    NPatchLayout layout = .NPATCH_NINE_PATCH,
  }) :
    _source = source ?? .new(),
    _left = left,
    _top = top,
    _right = right,
    _bottom = bottom,
    _layout = layout;

  factory NPatchInfoD.zero() => .new();

  @override
  NPatchInfoD setDart(NPatchInfoD o) {
    source.setDart(o.source);
    left = o.left;
    top = o.top;
    right = o.right;
    bottom = o.bottom;
    layout = o.layout;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_source.write(p, _source);
    field_left.write(p, _left);
    field_top.write(p, _top);
    field_right.write(p, _right);
    field_bottom.write(p, _bottom);
    field_layout.write(p, _layout);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _source = field_source.read(p);
    _left = field_left.read(p);
    _top = field_top.read(p);
    _right = field_right.read(p);
    _bottom = field_bottom.read(p);
    _layout = field_layout.read(p);
  }

  @override
  NPatchInfoD clone() => .new(
    op: op,
    source: source.clone(),
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    layout: layout,
  );

  @override
  String signature() => '$structName(source: $source, left: $left, top: $top, right: $right, bottom: $bottom, layout: $layout)';
}