part of '../../../raylib_dartified_base.dart';

enum Camera2DField with StructFields {
  offset,
  target,
  rotation,
  zoom,
}

/// Camera2D, defines position/orientation in 2d space
class Camera2D extends RaylibStructLiteral<Camera2D> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<Camera2D> struct = ._builtin(
    factory: Camera2D.new,
    layout: .aligned<Camera2DField>({
      .offset:   RStruct(Vector2.struct), // Camera offset (screen space offset from window origin)
      .target:   RStruct(Vector2.struct), // Camera target (world space target point that is mapped to screen space offset)
      .rotation: RFloat(), // Camera rotation in degrees (pivots around target)
      .zoom:     RFloat(), // Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<Camera2DField> structLayout = struct.layoutOf();

  /// Field descriptor for [offset].
  static final field_offset = structLayout.struct<Vector2>(.offset);
  /// Field descriptor for [target].
  static final field_target = structLayout.struct<Vector2>(.target);
  /// Field descriptor for [rotation].
  static final field_rotation = structLayout.scalar<double, RFloat>(.rotation);
  /// Field descriptor for [zoom].
  static final field_zoom = structLayout.scalar<double, RFloat>(.zoom);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  Vector2 _offset;
  /// Camera offset (screen space offset from window origin)
  Vector2 get offset => _offset = field_offset.readOr(op, _offset);
  set offset(Vector2 value) => _offset = field_offset.writeOr(op, value);
  
  Vector2 _target;
  /// Camera target (world space target point that is mapped to screen space offset)
  Vector2 get target => _target = field_target.readOr(op, _target);
  set target(Vector2 value) => _target = field_target.writeOr(op, value);

  double _rotation;
  /// Camera rotation in degrees (pivots around target)
  double get rotation => _rotation = field_rotation.readOr(op, _rotation);
  set rotation(double value) => _rotation = field_rotation.writeOr(op, value);

  double _zoom;
  /// Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
  double get zoom => _zoom = field_zoom.readOr(op, _zoom);
  set zoom(double value) => _zoom = field_zoom.writeOr(op, value);

  Camera2D({
    super.op,
    Vector2? offset,
    Vector2? target,
    double rotation = 0,
    double zoom = 1,
  }) :
    _offset = offset ?? .zero(),
    _target = target ?? .zero(),
    _rotation = rotation,
    _zoom = zoom;

  factory Camera2D.zero() => .new();

  @override
  Camera2D setDart(Camera2D o) {
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
  Camera2D clone() => .new(
    op: op,
    offset: offset.clone(),
    target: target.clone(),
    rotation: rotation,
    zoom: zoom,
  );

  @override
  String signature() => '$structName(offset: $offset, target: $target, rotation: $rotation, zoom: $zoom)';
}