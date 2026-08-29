part of '../../../raylib_dartified_base.dart';

enum RayCollisionField with StructFields {
  hit,
  distance,
  point,
  normal,
}

/// Ray hit information.
class RayCollisionD extends RaylibStructLiteral<RayCollisionD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<RayCollisionField> structLayout = .aligned({
    .hit:      RBool(),
    .distance: RFloat32(),
    .point:    RStruct(Vector3D.structLayout),
    .normal:   RStruct(Vector3D.structLayout),
  });

  static StructPointer<RayCollisionD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RayCollisionD.new, RayCollisionD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Did the ray hit something?
  bool hit;
  
  /// Distance to the nearest hit
  double distance;
  
  /// Point of the nearest hit
  Vector3D point;
  
  /// Surface normal of hit
  Vector3D normal;

  RayCollisionD({
    super.op,
    this.hit = false,
    this.distance = 0,
    Vector3D? point,
    Vector3D? normal
  }) :
    point = point ?? .zero(),
    normal = normal ?? .zero();

  factory RayCollisionD.zero() => .new();

  @override
  RayCollisionD setD(RayCollisionD o) {
    hit = o.hit;
    distance = o.distance;
    point.setD(o.point);
    normal.setD(o.normal);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeBool(hit, structLayout.offset(.hit));
    p.writeFloat32(distance, structLayout.offset(.distance));
    point.structWriteInto(p.offsetBy(structLayout.offset(.point)));
    normal.structWriteInto(p.offsetBy(structLayout.offset(.normal)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    hit = p.readBool(structLayout.offset(.hit));
    distance = p.readFloat32(structLayout.offset(.distance));
    point.structReadFrom(p.offsetBy(structLayout.offset(.point)));
    normal.structReadFrom(p.offsetBy(structLayout.offset(.normal)));
  }

  @override
  RayCollisionD clone() => .new(
    op: op,
    hit: hit,
    distance: distance,
    point: point.clone(),
    normal: normal.clone()
  );

  @override
  String signature() => '$structName(hit: $hit, distance: $distance, point: $point, normal: $normal)';
}