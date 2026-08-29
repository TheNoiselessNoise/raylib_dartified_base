part of '../../../raylib_dartified_base.dart';

enum RayField with StructFields {
  position,
  direction,
}

/// Ray, ray for raycasting
class RayD extends RaylibStructLiteral<RayD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RayField> structLayout = .aligned({
    .position:  RStruct(Vector3D.structLayout), // Ray position (origin)
    .direction: RStruct(Vector3D.structLayout), // Ray direction (normalized)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RayD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RayD.new, RayD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  Vector3D _position;
  /// Ray position (origin)
  Vector3D get position {
    structOnOp((p) => _position.structReadFrom(p.offsetBy(structLayout.offset(.position))));
    return _position;
  }
  set position(Vector3D value) {
    _position = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.position))));
  }
  
  Vector3D _direction;
  /// Ray direction (normalized)
  Vector3D get direction {
    structOnOp((p) => _direction.structReadFrom(p.offsetBy(structLayout.offset(.direction))));
    return _direction;
  }
  set direction(Vector3D value) {
    _direction = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.direction))));
  }

  RayD({
    super.op,
    Vector3D? position,
    Vector3D? direction
  }) :
    _position = position ?? .zero(),
    _direction = direction ?? .zero();

  factory RayD.zero() => .new();

  @override
  RayD setD(RayD o) {
    position.setD(o.position);
    direction.setD(o.direction);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _position.structWriteInto(p.offsetBy(structLayout.offset(.position)));
    _direction.structWriteInto(p.offsetBy(structLayout.offset(.direction)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _position.structReadFrom(p.offsetBy(structLayout.offset(.position)));
    _direction.structReadFrom(p.offsetBy(structLayout.offset(.direction)));
  }

  @override
  RayD clone() => .new(
    op: op,
    position: position.clone(),
    direction: direction.clone(),
  );

  @override
  String signature() => '$structName(position: $position, direction: $direction)';
}