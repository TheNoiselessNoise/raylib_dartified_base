part of '../../../raylib_dartified_base.dart';

enum RayField with StructFields {
  position,
  direction,
}

/// Ray, ray for raycasting
class Ray extends RaylibStructLiteral<Ray> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<Ray> struct = ._builtin(
    factory: Ray.new,
    layout: .aligned<RayField>({
      .position:  RStruct(Vector3.struct), // Ray position (origin)
      .direction: RStruct(Vector3.struct), // Ray direction (normalized)
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<RayField> structLayout = struct.layoutOf();

  /// Field descriptor for [position].
  static final field_position = structLayout.struct<Vector3>(.position);
  /// Field descriptor for [direction].
  static final field_direction = structLayout.struct<Vector3>(.direction);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3 _position;
  /// Ray position (origin)
  Vector3 get position => _position = field_position.readOr(op, _position);
  set position(Vector3 value) => _position = field_position.writeOr(op, value);

  Vector3 _direction;
  /// Ray direction (normalized)
  Vector3 get direction => _direction = field_direction.readOr(op, _direction);
  set direction(Vector3 value) => _direction = field_direction.writeOr(op, value);

  Ray({
    super.op,
    Vector3? position,
    Vector3? direction
  }) :
    _position = position ?? .zero(),
    _direction = direction ?? .zero();

  factory Ray.zero() => .new();

  @override
  Ray setDart(Ray o) {
    position.setDart(o.position);
    direction.setDart(o.direction);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_position.write(p, _position);
    field_direction.write(p, _direction);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _position = field_position.read(p);
    _direction = field_direction.read(p);
  }

  @override
  Ray clone() => .new(
    op: op,
    position: position.clone(),
    direction: direction.clone(),
  );

  @override
  String signature() => '$structName(position: $position, direction: $direction)';
}