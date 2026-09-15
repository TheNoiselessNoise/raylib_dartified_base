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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<RayCollisionD> struct = .new(
    factory: RayCollisionD.new,
    layout: .aligned<RayCollisionField>({
      .hit:      RBool(), // Did the ray hit something?
      .distance: RFloat(), // Distance to the nearest hit
      .point:    RStruct(Vector3D.struct), // Point of the nearest hit
      .normal:   RStruct(Vector3D.struct), // Surface normal of hit
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<RayCollisionField> structLayout = struct.layoutOf();

  /// Field descriptor for [hit].
  static final field_hit = structLayout.scalar<bool, RBool>(.hit);
  /// Field descriptor for [distance].
  static final field_distance = structLayout.scalar<double, RFloat>(.distance);
  /// Field descriptor for [point].
  static final field_point = structLayout.struct<Vector3D>(.point);
  /// Field descriptor for [normal].
  static final field_normal = structLayout.struct<Vector3D>(.normal);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  bool _hit;
  /// Did the ray hit something?
  bool get hit => _hit = field_hit.readOr(op, _hit);
  set hit(bool value) => _hit = field_hit.writeOr(op, value);

  double _distance;
  /// Distance to the nearest hit
  double get distance => _distance = field_distance.readOr(op, _distance);
  set distance(double value) => _distance = field_distance.writeOr(op, value);

  Vector3D _point;
  /// Point of the nearest hit
  Vector3D get point => _point = field_point.readOr(op, _point);
  set point(Vector3D value) => _point = field_point.writeOr(op, value);

  Vector3D _normal;
  /// Surface normal of hit
  Vector3D get normal => _normal = field_normal.readOr(op, _normal);
  set normal(Vector3D value) => _normal = field_normal.writeOr(op, value);

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
  RayCollisionD setDart(RayCollisionD o) {
    hit = o.hit;
    distance = o.distance;
    point.setDart(o.point);
    normal.setDart(o.normal);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_hit.write(p, _hit);
    field_distance.write(p, _distance);
    field_point.write(p, _point);
    field_normal.write(p, _normal);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _hit = field_hit.read(p);
    _distance = field_distance.read(p);
    _point = field_point.read(p);
    _normal = field_normal.read(p);
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