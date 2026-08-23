part of '../../../raylib_dartified_base.dart';

enum Camera3DField {
  position,
  target,
  up,
  fovy,
  projection,
}

/// Defines position/orientation in 3D space.
class Camera3DD extends RaylibStructLiteral<Camera3DD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<Camera3DField> structLayout = .aligned(structFields);
  static final Map<Camera3DField, RType> structFields = {
    .position:   RStruct(Vector3D.structLayout),
    .target:     RStruct(Vector3D.structLayout),
    .up:         RStruct(Vector3D.structLayout),
    .fovy:       RFloat32(),
    .projection: RInt32(),
  };

  static StructPointer<Camera3DD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, Camera3DD.new);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Camera position
  Vector3D position;
  
  /// Camera target it looks-at
  Vector3D target;
  
  /// Camera up vector (rotation over its axis)
  Vector3D up;
  
  /// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
  double fovy;
  
  /// Camera projection: [CameraProjection.CAMERA_PERSPECTIVE] or [CameraProjection.CAMERA_ORTHOGRAPHIC]
  CameraProjection projection;

  Camera3DD({
    super.op,
    Vector3D? position,
    Vector3D? target,
    Vector3D? up,
    this.fovy = 45,
    this.projection = .CAMERA_PERSPECTIVE,
  }) :
    position = position ?? .zero(),
    target = target ?? .zero(),
    up = up ?? .zero();

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
  void writeInto(MemoryPointer<RStruct> p) {
    position.writeInto(p.offsetBy(structLayout.offset(.position)));
    target.writeInto(p.offsetBy(structLayout.offset(.target)));
    up.writeInto(p.offsetBy(structLayout.offset(.up)));
    p.writeFloat32(fovy, structLayout.offset(.fovy));
    p.writeInt32(projection.value, structLayout.offset(.projection));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    position.readFrom(p.offsetBy(structLayout.offset(.position)));
    target.readFrom(p.offsetBy(structLayout.offset(.target)));
    up.readFrom(p.offsetBy(structLayout.offset(.up)));
    fovy = p.readFloat32(structLayout.offset(.fovy));
    projection = .fromValue(p.readInt32(structLayout.offset(.projection)));
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