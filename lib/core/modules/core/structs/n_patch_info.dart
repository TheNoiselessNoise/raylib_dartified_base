part of '../../../raylib_dartified_base.dart';

enum NPatchInfoField with StructFields {
  source,
  left,
  top,
  right,
  bottom,
  layout,
}

/// N-patch layout info.
class NPatchInfoD extends RaylibStructLiteral<NPatchInfoD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<NPatchInfoField> structLayout = .aligned({
    .source: RStruct(RectangleD.structLayout),
    .left:   RInt32(),
    .top:    RInt32(),
    .right:  RInt32(),
    .bottom: RInt32(),
    .layout: RInt32(),
  });

  static StructPointer<NPatchInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, NPatchInfoD.new, NPatchInfoD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Texture source rectangle
  RectangleD source;
  
  /// Left border offset
  int left;
  
  /// Top border offset
  int top;
  
  /// Right border offset
  int right;
  
  /// Bottom border offset
  int bottom;
  
  /// Layout of the n-patch
  NPatchLayout layout;

  NPatchInfoD({
    super.op,
    RectangleD? source,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.layout = .NPATCH_NINE_PATCH,
  }) :
    source = source ?? .new();

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
    source.structWriteInto(p.offsetBy(structLayout.offset(.source)));
    p.writeInt32(left, structLayout.offset(.left));
    p.writeInt32(top, structLayout.offset(.top));
    p.writeInt32(right, structLayout.offset(.right));
    p.writeInt32(bottom, structLayout.offset(.bottom));
    p.writeInt32(layout.value, structLayout.offset(.layout));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    source.structReadFrom(p.offsetBy(structLayout.offset(.source)));
    left = p.readInt32(structLayout.offset(.left));
    top = p.readInt32(structLayout.offset(.top));
    right = p.readInt32(structLayout.offset(.right));
    bottom = p.readInt32(structLayout.offset(.bottom));
    layout = .fromValue(p.readInt32(structLayout.offset(.layout)));
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