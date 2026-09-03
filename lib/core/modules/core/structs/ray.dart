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

  @override
  StructLayout<RayField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RayField> struct = .aligned({
    .position:  RStruct(Vector3D.struct), // Ray position (origin)
    .direction: RStruct(Vector3D.struct), // Ray direction (normalized)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RayD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, RayD.new, RayD.pointer);

  static final _positionF = struct.struct(.position, Vector3D.pointer);
  static final _directionF = struct.struct(.direction, Vector3D.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _position;
  /// Ray position (origin)
  Vector3D get position => _position = _positionF.readOr(op?.ptr, _position);
  set position(Vector3D value) => _position = _positionF.writeIf(op?.ptr, value);

  Vector3D _direction;
  /// Ray direction (normalized)
  Vector3D get direction => _direction = _directionF.readOr(op?.ptr, _direction);
  set direction(Vector3D value) => _direction = _directionF.writeIf(op?.ptr, value);

  RayD({
    super.op,
    Vector3D? position,
    Vector3D? direction
  }) :
    _position = position ?? .zero(),
    _direction = direction ?? .zero();

  factory RayD.zero() => .new();

  @override
  RayD setDart(RayD o) {
    position.setDart(o.position);
    direction.setDart(o.direction);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _positionF.write(p, _position);
    _directionF.write(p, _direction);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _position = _positionF.read(p);
    _direction = _directionF.read(p);
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