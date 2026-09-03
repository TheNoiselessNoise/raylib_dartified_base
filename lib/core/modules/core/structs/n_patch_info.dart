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

  static final _sourceF = struct.struct(.source, RectangleD.pointer);
  static final _leftF = struct.scalar<int, RInt>(.left);
  static final _topF = struct.scalar<int, RInt>(.top);
  static final _rightF = struct.scalar<int, RInt>(.right);
  static final _bottomF = struct.scalar<int, RInt>(.bottom);
  static final _layoutF = struct.enumValue(.layout, NPatchLayout.fromValue);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  RectangleD _source;
  /// Texture source rectangle
  RectangleD get source => _source = _sourceF.readOr(op?.ptr, _source);
  set source(RectangleD value) => _source = _sourceF.writeIf(op?.ptr, value);

  int _left;
  /// Left border offset
  int get left => _left = _leftF.readOr(op?.ptr, _left);
  set left(int value) => _left = _leftF.writeIf(op?.ptr, value);

  int _top;
  /// Top border offset
  int get top => _top = _topF.readOr(op?.ptr, _top);
  set top(int value) => _top = _topF.writeIf(op?.ptr, value);

  int _right;
  /// Right border offset
  int get right => _right = _rightF.readOr(op?.ptr, _right);
  set right(int value) => _right = _rightF.writeIf(op?.ptr, value);

  int _bottom;
  /// Bottom border offset
  int get bottom => _bottom = _bottomF.readOr(op?.ptr, _bottom);
  set bottom(int value) => _bottom = _bottomF.writeIf(op?.ptr, value);

  NPatchLayout _layout;
  /// Layout of the n-patch: 3x3, 1x3 or 3x1
  NPatchLayout get layout => _layout = _layoutF.readOr(op?.ptr, _layout);
  set layout(NPatchLayout value) => _layout = _layoutF.writeIf(op?.ptr, value);

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
    _sourceF.write(p, _source);
    _leftF.write(p, _left);
    _topF.write(p, _top);
    _rightF.write(p, _right);
    _bottomF.write(p, _bottom);
    _layoutF.write(p, _layout);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _source = _sourceF.read(p);
    _left = _leftF.read(p);
    _top = _topF.read(p);
    _right = _rightF.read(p);
    _bottom = _bottomF.read(p);
    _layout = _layoutF.read(p);
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