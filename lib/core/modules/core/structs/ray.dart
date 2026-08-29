part of '../../../raylib_dartified_base.dart';

enum RayField with StructFields {
  position,
  direction,
}

/// Ray for raycasting.
class RayD extends RaylibStructLiteral<RayD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<RayField> structLayout = .aligned({
    .position:  RStruct(Vector3D.structLayout),
    .direction: RStruct(Vector3D.structLayout),
  });

  static StructPointer<RayD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RayD.new, RayD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Ray position (origin)
  Vector3D position;
  
  /// Ray direction (normalized)
  Vector3D direction;

  RayD({
    super.op,
    Vector3D? position,
    Vector3D? direction
  }) :
    position = position ?? .zero(),
    direction = direction ?? .zero();

  factory RayD.zero() => .new();

  @override
  RayD setD(RayD o) {
    position.setD(o.position);
    direction.setD(o.direction);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    position.structWriteInto(p.offsetBy(structLayout.offset(.position)));
    direction.structWriteInto(p.offsetBy(structLayout.offset(.direction)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    position.structReadFrom(p.offsetBy(structLayout.offset(.position)));
    direction.structReadFrom(p.offsetBy(structLayout.offset(.direction)));
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