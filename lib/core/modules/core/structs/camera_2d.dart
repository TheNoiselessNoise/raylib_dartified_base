part of '../../../raylib_dartified_base.dart';

// TODO: on all structs structOnOp

enum Camera2DField {
  offset,
  target,
  rotation,
  zoom,
}

/// Defines position/orientation in 2D space.
class Camera2DD extends RaylibStructLiteral<Camera2DD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<Camera2DField> structLayout = .aligned(structFields);
  static final Map<Camera2DField, RType> structFields = {
    .offset:   RStruct(Vector2D.structLayout),
    .target:   RStruct(Vector2D.structLayout),
    .rotation: RFloat32(),
    .zoom:     RFloat32(),
  };

  static StructPointer<Camera2DD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, Camera2DD.new, Camera2DD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Camera offset (displacement from target)
  Vector2D offset;

  /// Camera target (rotation and zoom origin)
  Vector2D target;

  /// Camera rotation in degrees
  double rotation;

  /// Camera zoom (scaling), should be 1.0f by default
  double zoom;

  Camera2DD({
    super.op,
    Vector2D? offset,
    Vector2D? target,
    this.rotation = 0,
    this.zoom = 0,
  }) :
    offset = offset ?? .zero(),
    target = target ?? .zero();

  factory Camera2DD.zero() => .new();

  @override
  Camera2DD setD(Camera2DD o) {
    offset.setD(o.offset);
    target.setD(o.target);
    rotation = o.rotation;
    zoom = o.zoom;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    offset.structWriteInto(p.offsetBy(structLayout.offset(.offset)));
    target.structWriteInto(p.offsetBy(structLayout.offset(.target)));
    p.writeFloat32(rotation, structLayout.offset(.rotation));
    p.writeFloat32(zoom, structLayout.offset(.zoom));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    offset.structReadFrom(p.offsetBy(structLayout.offset(.offset)));
    target.structReadFrom(p.offsetBy(structLayout.offset(.target)));
    rotation = p.readFloat32(structLayout.offset(.rotation));
    zoom = p.readFloat32(structLayout.offset(.zoom));
  }
  
  @override
  Camera2DD clone() => .new(
    op: op,
    offset: offset.clone(),
    target: target.clone(),
    rotation: rotation,
    zoom: zoom,
  );

  @override
  String signature() => '$structName(offset: $offset, target: $target, rotation: $rotation, zoom: $zoom)';
}