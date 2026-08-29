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

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<Camera3DField> structLayout = .aligned({
    .position:   RStruct(Vector3D.structLayout), // Camera position
    .target:     RStruct(Vector3D.structLayout), // Camera target it looks-at
    .up:         RStruct(Vector3D.structLayout), // Camera up vector (rotation over its axis)
    .fovy:       RFloat(), // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
    .projection: RInt(), // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<Camera3DD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, Camera3DD.new, Camera3DD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  Vector3D _position;
  /// Camera position
  Vector3D get position {
    structOnOp((p) => _position.structReadFrom(p.offsetBy(structLayout.offset(.position))));
    return _position;
  }
  set position(Vector3D value) {
    _position = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.position))));
  }
  
  Vector3D _target;
  /// Camera target it looks-at
  Vector3D get target {
    structOnOp((p) => _target.structReadFrom(p.offsetBy(structLayout.offset(.target))));
    return _target;
  }
  set target(Vector3D value) {
    _target = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.target))));
  }
  
  Vector3D _up;
  /// Camera up vector (rotation over its axis)
  Vector3D get up {
    structOnOp((p) => _up.structReadFrom(p.offsetBy(structLayout.offset(.up))));
    return _up;
  }
  set up(Vector3D value) {
    _up = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.up))));
  }
  
  double _fovy;
  /// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
  double get fovy {
    structOnOp((p) => _fovy = p.readFloat(structLayout.offset(.fovy)));
    return _fovy;
  }
  set fovy(double value) {
    _fovy = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.fovy)));
  }
  
  CameraProjection _projection;
  /// Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
  CameraProjection get projection {
    structOnOp((p) => _projection = .fromValue(p.readInt(structLayout.offset(.projection))));
    return _projection;
  }
  set projection(CameraProjection value) {
    _projection = value;
    structOnOp((p) => p.writeInt(value.value, structLayout.offset(.projection)));
  }

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
  Camera3DD setD(Camera3DD o) {
    position.setD(o.position);
    target.setD(o.target);
    up.setD(o.up);
    fovy = o.fovy;
    projection = o.projection;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _position.structWriteInto(p.offsetBy(structLayout.offset(.position)));
    _target.structWriteInto(p.offsetBy(structLayout.offset(.target)));
    _up.structWriteInto(p.offsetBy(structLayout.offset(.up)));
    p.writeFloat(_fovy, structLayout.offset(.fovy));
    p.writeInt(_projection.value, structLayout.offset(.projection));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _position.structReadFrom(p.offsetBy(structLayout.offset(.position)));
    _target.structReadFrom(p.offsetBy(structLayout.offset(.target)));
    _up.structReadFrom(p.offsetBy(structLayout.offset(.up)));
    _fovy = p.readFloat(structLayout.offset(.fovy));
    _projection = .fromValue(p.readInt(structLayout.offset(.projection)));
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