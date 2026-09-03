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

  static final _offsetF = struct.struct(.offset, Vector2D.pointer);
  static final _targetF = struct.struct(.target, Vector2D.pointer);
  static final _rotationF = struct.scalar<double, RFloat>(.rotation);
  static final _zoomF = struct.scalar<double, RFloat>(.zoom);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  Vector2D _offset;
  /// Camera offset (screen space offset from window origin)
  Vector2D get offset => _offset = _offsetF.readOr(op?.ptr, _offset);
  set offset(Vector2D value) => _offset = _offsetF.writeIf(op?.ptr, value);
  
  Vector2D _target;
  /// Camera target (world space target point that is mapped to screen space offset)
  Vector2D get target => _target = _targetF.readOr(op?.ptr, _target);
  set target(Vector2D value) => _target = _targetF.writeIf(op?.ptr, value);

  double _rotation;
  /// Camera rotation in degrees (pivots around target)
  double get rotation => _rotation = _rotationF.readOr(op?.ptr, _rotation);
  set rotation(double value) => _rotation = _rotationF.writeIf(op?.ptr, value);

  double _zoom;
  /// Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
  double get zoom => _zoom = _zoomF.readOr(op?.ptr, _zoom);
  set zoom(double value) => _zoom = _zoomF.writeIf(op?.ptr, value);

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
    _offsetF.write(p, _offset);
    _targetF.write(p, _target);
    _rotationF.write(p, _rotation);
    _zoomF.write(p, _zoom);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _offset = _offsetF.read(p);
    _target = _targetF.read(p);
    _rotation = _rotationF.read(p);
    _zoom = _zoomF.read(p);
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