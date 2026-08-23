part of '../../../raylib_dartified_base.dart';

enum RayField {
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

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<RayField> structLayout = .aligned(structFields);
  static final Map<RayField, RType> structFields = {
    .position:  RStruct(Vector3D.structLayout),
    .direction: RStruct(Vector3D.structLayout),
  };

  static StructPointer<RayD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RayD.new);

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
  void writeInto(MemoryPointer<RStruct> p) {
    position.writeInto(p.offsetBy(structLayout.offset(.position)));
    direction.writeInto(p.offsetBy(structLayout.offset(.direction)));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    position.readFrom(p.offsetBy(structLayout.offset(.position)));
    direction.readFrom(p.offsetBy(structLayout.offset(.direction)));
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