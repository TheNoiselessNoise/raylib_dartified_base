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

  @override
  StructLayout<RayCollisionField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RayCollisionField> struct = .aligned({
    .hit:      RBool(), // Did the ray hit something?
    .distance: RFloat(), // Distance to the nearest hit
    .point:    RStruct(Vector3D.struct), // Point of the nearest hit
    .normal:   RStruct(Vector3D.struct), // Surface normal of hit
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RayCollisionD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, RayCollisionD.new, RayCollisionD.pointer);

  static final _hitF = struct.scalar<bool, RBool>(.hit);
  static final _distanceF = struct.scalar<double, RFloat>(.distance);
  static final _pointF = struct.struct(.point, Vector3D.pointer);
  static final _normalF = struct.struct(.normal, Vector3D.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  bool _hit;
  /// Did the ray hit something?
  bool get hit => _hit = _hitF.readOr(op?.ptr, _hit);
  set hit(bool value) => _hit = _hitF.writeIf(op?.ptr, value);

  double _distance;
  /// Distance to the nearest hit
  double get distance => _distance = _distanceF.readOr(op?.ptr, _distance);
  set distance(double value) => _distance = _distanceF.writeIf(op?.ptr, value);

  Vector3D _point;
  /// Point of the nearest hit
  Vector3D get point => _point = _pointF.readOr(op?.ptr, _point);
  set point(Vector3D value) => _point = _pointF.writeIf(op?.ptr, value);

  Vector3D _normal;
  /// Surface normal of hit
  Vector3D get normal => _normal = _normalF.readOr(op?.ptr, _normal);
  set normal(Vector3D value) => _normal = _normalF.writeIf(op?.ptr, value);

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
    _hitF.write(p, _hit);
    _distanceF.write(p, _distance);
    _pointF.write(p, _point);
    _normalF.write(p, _normal);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _hit = _hitF.read(p);
    _distance = _distanceF.read(p);
    _point = _pointF.read(p);
    _normal = _normalF.read(p);
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