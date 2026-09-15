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

  @override
  StructLayout<Camera2DField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<Camera2DField> struct = .aligned({
    .offset:   RStruct(Vector2D.struct), // Camera offset (screen space offset from window origin)
    .target:   RStruct(Vector2D.struct), // Camera target (world space target point that is mapped to screen space offset)
    .rotation: RFloat(), // Camera rotation in degrees (pivots around target)
    .zoom:     RFloat(), // Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<Camera2DD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, Camera2DD.new, Camera2DD.pointer);

  static final field_offset = struct.struct(.offset, Vector2D.pointer);
  static final field_target = struct.struct(.target, Vector2D.pointer);
  static final field_rotation = struct.scalar<double, RFloat>(.rotation);
  static final field_zoom = struct.scalar<double, RFloat>(.zoom);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  Vector2D _offset;
  /// Camera offset (screen space offset from window origin)
  Vector2D get offset => _offset = field_offset.readOr(op, _offset);
  set offset(Vector2D value) => _offset = field_offset.writeIf(op, value);
  
  Vector2D _target;
  /// Camera target (world space target point that is mapped to screen space offset)
  Vector2D get target => _target = field_target.readOr(op, _target);
  set target(Vector2D value) => _target = field_target.writeIf(op, value);

  double _rotation;
  /// Camera rotation in degrees (pivots around target)
  double get rotation => _rotation = field_rotation.readOr(op, _rotation);
  set rotation(double value) => _rotation = field_rotation.writeIf(op, value);

  double _zoom;
  /// Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
  double get zoom => _zoom = field_zoom.readOr(op, _zoom);
  set zoom(double value) => _zoom = field_zoom.writeIf(op, value);

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
  Camera2DD setDart(Camera2DD o) {
    offset.setDart(o.offset);
    target.setDart(o.target);
    rotation = o.rotation;
    zoom = o.zoom;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_offset.write(p, _offset);
    field_target.write(p, _target);
    field_rotation.write(p, _rotation);
    field_zoom.write(p, _zoom);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _offset = field_offset.read(p);
    _target = field_target.read(p);
    _rotation = field_rotation.read(p);
    _zoom = field_zoom.read(p);
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