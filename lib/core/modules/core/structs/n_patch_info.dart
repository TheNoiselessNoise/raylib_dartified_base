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
  static final StructLayout<NPatchInfoField> structLayout = .aligned({
    .source: RStruct(RectangleD.structLayout), // Texture source rectangle
    .left:   RInt(), // Left border offset
    .top:    RInt(), // Top border offset
    .right:  RInt(), // Right border offset
    .bottom: RInt(), // Bottom border offset
    .layout: RInt(), // Layout of the n-patch: 3x3, 1x3 or 3x1
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<NPatchInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, NPatchInfoD.new, NPatchInfoD.pointer);

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
    structOnOp((p) => _source.structReadFrom(p.offsetBy(structLayout.offset(.source))));
    return _source;
  }
  set source(RectangleD value) {
    _source = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.source))));
  }
  
  int _left;
  /// Left border offset
  int get left {
    structOnOp((p) => _left = p.readInt(structLayout.offset(.left)));
    return _left;
  }
  set left(int value) {
    _left = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.left)));
  }
  
  int _top;
  /// Top border offset
  int get top {
    structOnOp((p) => _top = p.readInt(structLayout.offset(.top)));
    return _top;
  }
  set top(int value) {
    _top = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.top)));
  }
  
  int _right;
  /// Right border offset
  int get right {
    structOnOp((p) => _right = p.readInt(structLayout.offset(.right)));
    return _right;
  }
  set right(int value) {
    _right = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.right)));
  }
  
  int _bottom;
  /// Bottom border offset
  int get bottom {
    structOnOp((p) => _bottom = p.readInt(structLayout.offset(.bottom)));
    return _bottom;
  }
  set bottom(int value) {
    _bottom = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.bottom)));
  }
  
  NPatchLayout _layout;
  /// Layout of the n-patch: 3x3, 1x3 or 3x1
  NPatchLayout get layout {
    structOnOp((p) => _layout = .fromValue(p.readInt(structLayout.offset(.layout))));
    return _layout;
  }
  set layout(NPatchLayout value) {
    _layout = value;
    structOnOp((p) => p.writeInt(value.value, structLayout.offset(.layout)));
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
    _source.structWriteInto(p.offsetBy(structLayout.offset(.source)));
    p.writeInt(_left, structLayout.offset(.left));
    p.writeInt(_top, structLayout.offset(.top));
    p.writeInt(_right, structLayout.offset(.right));
    p.writeInt(_bottom, structLayout.offset(.bottom));
    p.writeInt(_layout.value, structLayout.offset(.layout));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _source.structReadFrom(p.offsetBy(structLayout.offset(.source)));
    _left = p.readInt(structLayout.offset(.left));
    _top = p.readInt(structLayout.offset(.top));
    _right = p.readInt(structLayout.offset(.right));
    _bottom = p.readInt(structLayout.offset(.bottom));
    _layout = .fromValue(p.readInt(structLayout.offset(.layout)));
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