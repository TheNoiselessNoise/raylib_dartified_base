part of '../../../raylib_dartified_base.dart';

enum Camera3DField with StructFields {
  position,
  target,
  up,
  fovy,
  projection,
}

/// Camera, defines position/orientation in 3d space
class Camera3D extends RaylibStructLiteral<Camera3D> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<Camera3D> struct = ._builtin(
    factory: Camera3D.new,
    layout: .aligned<Camera3DField>({
      .position:   RStruct(Vector3.struct), // Camera position
      .target:     RStruct(Vector3.struct), // Camera target it looks-at
      .up:         RStruct(Vector3.struct), // Camera up vector (rotation over its axis)
      .fovy:       RFloat(), // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
      .projection: RInt(), // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<Camera3DField> structLayout = struct.layoutOf();

  /// Field descriptor for [position].
  static final field_position = structLayout.struct<Vector3>(.position);
  /// Field descriptor for [target].
  static final field_target = structLayout.struct<Vector3>(.target);
  /// Field descriptor for [up].
  static final field_up = structLayout.struct<Vector3>(.up);
  /// Field descriptor for [fovy].
  static final field_fovy = structLayout.scalar<double, RFloat>(.fovy);
  /// Field descriptor for [projection].
  static final field_projection = structLayout.scalar<int, RInt>(.projection);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3 _position;
  /// Camera position
  Vector3 get position => _position = field_position.readOr(op, _position);
  set position(Vector3 value) => _position = field_position.writeOr(op, value);

  Vector3 _target;
  /// Camera target it looks-at
  Vector3 get target => _target = field_target.readOr(op, _target);
  set target(Vector3 value) => _target = field_target.writeOr(op, value);

  Vector3 _up;
  /// Camera up vector (rotation over its axis)
  Vector3 get up => _up = field_up.readOr(op, _up);
  set up(Vector3 value) => _up = field_up.writeOr(op, value);

  double _fovy;
  /// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
  double get fovy => _fovy = field_fovy.readOr(op, _fovy);
  set fovy(double value) => _fovy = field_fovy.writeOr(op, value);

  CameraProjection _projection;
  /// Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
  CameraProjection get projection => _projection = .fromValue(field_projection.readOr(op, _projection.value));
  set projection(CameraProjection value) => _projection = .fromValue(field_projection.writeOr(op, value.value));

  Camera3D({
    super.op,
    Vector3? position,
    Vector3? target,
    Vector3? up,
    double fovy = 45,
    CameraProjection projection = .CAMERA_PERSPECTIVE,
  }) :
    _position = position ?? .zero(),
    _target = target ?? .zero(),
    _up = up ?? .zero(),
    _fovy = fovy,
    _projection = projection;

  factory Camera3D.zero() => .new();

  @override
  Camera3D setDart(Camera3D o) {
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
  Camera3D clone() => .new(
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