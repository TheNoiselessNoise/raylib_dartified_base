part of '../../../raylib_dartified_base.dart';

enum Camera3DField with StructFields {
  position,
  target,
  up,
  fovy,
  projection,
}

/// Camera, defines position/orientation in 3d space
class Camera3DD extends RaylibStructLiteral<Camera3DD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<Camera3DField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<Camera3DField> struct = .aligned({
    .position:   RStruct(Vector3D.struct), // Camera position
    .target:     RStruct(Vector3D.struct), // Camera target it looks-at
    .up:         RStruct(Vector3D.struct), // Camera up vector (rotation over its axis)
    .fovy:       RFloat(), // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
    .projection: RInt(), // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<Camera3DD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, Camera3DD.new, Camera3DD.pointer);

  static final field_position = struct.struct(.position, Vector3D.pointer);
  static final field_target = struct.struct(.target, Vector3D.pointer);
  static final field_up = struct.struct(.up, Vector3D.pointer);
  static final field_fovy = struct.scalar<double, RFloat>(.fovy);
  static final field_projection = struct.scalar<int, RInt>(.projection);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _position;
  /// Camera position
  Vector3D get position => _position = field_position.readOr(op, _position);
  set position(Vector3D value) => _position = field_position.writeIf(op, value);

  Vector3D _target;
  /// Camera target it looks-at
  Vector3D get target => _target = field_target.readOr(op, _target);
  set target(Vector3D value) => _target = field_target.writeIf(op, value);

  Vector3D _up;
  /// Camera up vector (rotation over its axis)
  Vector3D get up => _up = field_up.readOr(op, _up);
  set up(Vector3D value) => _up = field_up.writeIf(op, value);

  double _fovy;
  /// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
  double get fovy => _fovy = field_fovy.readOr(op, _fovy);
  set fovy(double value) => _fovy = field_fovy.writeIf(op, value);

  CameraProjection _projection;
  /// Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
  CameraProjection get projection => _projection = .fromValue(field_projection.readOr(op, _projection.value));
  set projection(CameraProjection value) => _projection = .fromValue(field_projection.writeIf(op, value.value));

  Camera3DD({
    super.op,
    Vector3D? position,
    Vector3D? target,
    Vector3D? up,
    double fovy = 45,
    CameraProjection projection = .CAMERA_PERSPECTIVE,
  }) :
    _position = position ?? .zero(),
    _target = target ?? .zero(),
    _up = up ?? .zero(),
    _fovy = fovy,
    _projection = projection;

  factory Camera3DD.zero() => .new();

  @override
  Camera3DD setDart(Camera3DD o) {
    position.setDart(o.position);
    target.setDart(o.target);
    up.setDart(o.up);
    fovy = o.fovy;
    projection = o.projection;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_position.write(p, _position);
    field_target.write(p, _target);
    field_up.write(p, _up);
    field_fovy.write(p, _fovy);
    field_projection.write(p, _projection.value);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _position = field_position.read(p);
    _target = field_target.read(p);
    _up = field_up.read(p);
    _fovy = field_fovy.read(p);
    _projection = .fromValue(field_projection.read(p));
  }

  @override
  Camera3DD clone() => .new(
    op: op,
    position: position.clone(),
    target: target.clone(),
    up: up.clone(),
    fovy: fovy,
    projection: projection,
  );

  @override
  String signature() => '$structName(position: $position, target: $target, up: $up, fovy: $fovy, projection: ${projection.name})';
}