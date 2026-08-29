part of '../../../raylib_dartified_base.dart';

enum Camera2DField with StructFields {
  offset,
  target,
  rotation,
  zoom,
}

/// Camera2D, defines position/orientation in 2d space
class Camera2DD extends RaylibStructLiteral<Camera2DD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<Camera2DField> structLayout = .aligned({
    .offset:   RStruct(Vector2D.structLayout), // Camera offset (screen space offset from window origin)
    .target:   RStruct(Vector2D.structLayout), // Camera target (world space target point that is mapped to screen space offset)
    .rotation: RFloat(), // Camera rotation in degrees (pivots around target)
    .zoom:     RFloat(), // Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<Camera2DD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, Camera2DD.new, Camera2DD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  Vector2D _offset;
  /// Camera offset (screen space offset from window origin)
  Vector2D get offset {
    structOnOp((p) => _offset.structReadFrom(p.offsetBy(structLayout.offset(.offset))));
    return _offset;
  }
  set offset(Vector2D value) {
    _offset = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.offset))));
  }
  
  Vector2D _target;
  /// Camera target (world space target point that is mapped to screen space offset)
  Vector2D get target {
    structOnOp((p) => _target.structReadFrom(p.offsetBy(structLayout.offset(.target))));
    return _target;
  }
  set target(Vector2D value) {
    _target = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.target))));
  }

  double _rotation;
  /// Camera rotation in degrees (pivots around target)
  double get rotation {
    structOnOp((p) => _rotation = p.readFloat(structLayout.offset(.rotation)));
    return _rotation;
  }
  set rotation(double value) {
    _rotation = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.rotation)));
  }

  double _zoom;
  /// Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
  double get zoom {
    structOnOp((p) => _zoom = p.readFloat(structLayout.offset(.zoom)));
    return _zoom;
  }
  set zoom(double value) {
    _zoom = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.zoom)));
  }

  Camera2DD({
    super.op,
    Vector2D? offset,
    Vector2D? target,
    double rotation = 0,
    double zoom = 1,
  }) :
    _offset = offset ?? .zero(),
    _target = target ?? .zero(),
    _rotation = rotation,
    _zoom = zoom;

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
    _offset.structWriteInto(p.offsetBy(structLayout.offset(.offset)));
    _target.structWriteInto(p.offsetBy(structLayout.offset(.target)));
    p.writeFloat(_rotation, structLayout.offset(.rotation));
    p.writeFloat(_zoom, structLayout.offset(.zoom));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _offset.structReadFrom(p.offsetBy(structLayout.offset(.offset)));
    _target.structReadFrom(p.offsetBy(structLayout.offset(.target)));
    _rotation = p.readFloat(structLayout.offset(.rotation));
    _zoom = p.readFloat(structLayout.offset(.zoom));
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