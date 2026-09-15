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

  @override
  StructLayout<NPatchInfoField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<NPatchInfoField> struct = .aligned({
    .source: RStruct(RectangleD.struct), // Texture source rectangle
    .left:   RInt(), // Left border offset
    .top:    RInt(), // Top border offset
    .right:  RInt(), // Right border offset
    .bottom: RInt(), // Bottom border offset
    .layout: RInt(), // Layout of the n-patch: 3x3, 1x3 or 3x1
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<NPatchInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, NPatchInfoD.new, NPatchInfoD.pointer);

  static final field_source = struct.struct(.source, RectangleD.pointer);
  static final field_left = struct.scalar<int, RInt>(.left);
  static final field_top = struct.scalar<int, RInt>(.top);
  static final field_right = struct.scalar<int, RInt>(.right);
  static final field_bottom = struct.scalar<int, RInt>(.bottom);
  static final field_layout = struct.enumValue(.layout, NPatchLayout.fromValue);

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
  set source(RectangleD value) => _source = field_source.writeIf(op, value);

  int _left;
  /// Left border offset
  int get left => _left = field_left.readOr(op, _left);
  set left(int value) => _left = field_left.writeIf(op, value);

  int _top;
  /// Top border offset
  int get top => _top = field_top.readOr(op, _top);
  set top(int value) => _top = field_top.writeIf(op, value);

  int _right;
  /// Right border offset
  int get right => _right = field_right.readOr(op, _right);
  set right(int value) => _right = field_right.writeIf(op, value);

  int _bottom;
  /// Bottom border offset
  int get bottom => _bottom = field_bottom.readOr(op, _bottom);
  set bottom(int value) => _bottom = field_bottom.writeIf(op, value);

  NPatchLayout _layout;
  /// Layout of the n-patch: 3x3, 1x3 or 3x1
  NPatchLayout get layout => _layout = field_layout.readOr(op, _layout);
  set layout(NPatchLayout value) => _layout = field_layout.writeIf(op, value);

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