part of '../../../raylib_dartified_base.dart';

enum RayCollisionField with StructFields {
  hit,
  distance,
  point,
  normal,
}

/// RayCollision, ray hit information
class RayCollisionD extends RaylibStructLiteral<RayCollisionD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RayCollisionField> structLayout = .aligned({
    .hit:      RBool(), // Did the ray hit something?
    .distance: RFloat(), // Distance to the nearest hit
    .point:    RStruct(Vector3D.structLayout), // Point of the nearest hit
    .normal:   RStruct(Vector3D.structLayout), // Surface normal of hit
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RayCollisionD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RayCollisionD.new, RayCollisionD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  bool _hit;
  /// Did the ray hit something?
  bool get hit {
    structOnOp((p) => _hit = p.readBool(structLayout.offset(.hit)));
    return _hit;
  }
  set hit(bool value) {
    _hit = value;
    structOnOp((p) => p.writeBool(value, structLayout.offset(.hit)));
  }

  double _distance;
  /// Distance to the nearest hit
  double get distance {
    structOnOp((p) => _distance = p.readFloat(structLayout.offset(.distance)));
    return _distance;
  }
  set distance(double value) {
    _distance = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.distance)));
  }
  
  Vector3D _point;
  /// Point of the nearest hit
  Vector3D get point {
    structOnOp((p) => _point.structReadFrom(p.offsetBy(structLayout.offset(.point))));
    return _point;
  }
  set point(Vector3D value) {
    _point = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.point))));
  }
  
  Vector3D _normal;
  /// Surface normal of hit
  Vector3D get normal {
    structOnOp((p) => _normal.structReadFrom(p.offsetBy(structLayout.offset(.normal))));
    return _normal;
  }
  set normal(Vector3D value) {
    _normal = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.normal))));
  }

  RayCollisionD({
    super.op,
    bool hit = false,
    double distance = 0,
    Vector3D? point,
    Vector3D? normal
  }) :
    _hit = hit,
    _distance = distance,
    _point = point ?? .zero(),
    _normal = normal ?? .zero();

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
    p.writeBool(_hit, structLayout.offset(.hit));
    p.writeFloat(_distance, structLayout.offset(.distance));
    _point.structWriteInto(p.offsetBy(structLayout.offset(.point)));
    _normal.structWriteInto(p.offsetBy(structLayout.offset(.normal)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _hit = p.readBool(structLayout.offset(.hit));
    _distance = p.readFloat(structLayout.offset(.distance));
    _point.structReadFrom(p.offsetBy(structLayout.offset(.point)));
    _normal.structReadFrom(p.offsetBy(structLayout.offset(.normal)));
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