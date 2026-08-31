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

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  RectangleD _source;
  /// Texture source rectangle
  RectangleD get source {
    structOnOp((p) => _source.structReadFrom(p.offsetBy(struct.offset(.source))));
    return _source;
  }
  set source(RectangleD value) {
    _source = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(struct.offset(.source))));
  }
  
  int _left;
  /// Left border offset
  int get left {
    structOnOp((p) => _left = p.readInt(struct.offset(.left)));
    return _left;
  }
  set left(int value) {
    _left = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.left)));
  }
  
  int _top;
  /// Top border offset
  int get top {
    structOnOp((p) => _top = p.readInt(struct.offset(.top)));
    return _top;
  }
  set top(int value) {
    _top = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.top)));
  }
  
  int _right;
  /// Right border offset
  int get right {
    structOnOp((p) => _right = p.readInt(struct.offset(.right)));
    return _right;
  }
  set right(int value) {
    _right = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.right)));
  }
  
  int _bottom;
  /// Bottom border offset
  int get bottom {
    structOnOp((p) => _bottom = p.readInt(struct.offset(.bottom)));
    return _bottom;
  }
  set bottom(int value) {
    _bottom = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.bottom)));
  }
  
  NPatchLayout _layout;
  /// Layout of the n-patch: 3x3, 1x3 or 3x1
  NPatchLayout get layout {
    structOnOp((p) => _layout = .fromValue(p.readInt(struct.offset(.layout))));
    return _layout;
  }
  set layout(NPatchLayout value) {
    _layout = value;
    structOnOp((p) => p.writeInt(value.value, struct.offset(.layout)));
  }

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
  NPatchInfoD setD(NPatchInfoD o) {
    source.setD(o.source);
    left = o.left;
    top = o.top;
    right = o.right;
    bottom = o.bottom;
    layout = o.layout;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _source.structWriteInto(p.offsetBy(struct.offset(.source)));
    p.writeInt(_left, struct.offset(.left));
    p.writeInt(_top, struct.offset(.top));
    p.writeInt(_right, struct.offset(.right));
    p.writeInt(_bottom, struct.offset(.bottom));
    p.writeInt(_layout.value, struct.offset(.layout));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _source.structReadFrom(p.offsetBy(struct.offset(.source)));
    _left = p.readInt(struct.offset(.left));
    _top = p.readInt(struct.offset(.top));
    _right = p.readInt(struct.offset(.right));
    _bottom = p.readInt(struct.offset(.bottom));
    _layout = .fromValue(p.readInt(struct.offset(.layout)));
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