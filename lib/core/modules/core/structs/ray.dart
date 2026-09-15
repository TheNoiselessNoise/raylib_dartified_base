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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<RayD> struct = .new(
    factory: RayD.new,
    layout: .aligned<RayField>({
      .position:  RStruct(Vector3D.struct), // Ray position (origin)
      .direction: RStruct(Vector3D.struct), // Ray direction (normalized)
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<RayField> structLayout = struct.layoutOf();

  /// Field descriptor for [position].
  static final field_position = structLayout.struct<Vector3D>(.position);
  /// Field descriptor for [direction].
  static final field_direction = structLayout.struct<Vector3D>(.direction);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _position;
  /// Ray position (origin)
  Vector3D get position => _position = field_position.readOr(op, _position);
  set position(Vector3D value) => _position = field_position.writeOr(op, value);

  Vector3D _direction;
  /// Ray direction (normalized)
  Vector3D get direction => _direction = field_direction.readOr(op, _direction);
  set direction(Vector3D value) => _direction = field_direction.writeOr(op, value);

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
    field_position.write(p, _position);
    field_direction.write(p, _direction);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _position = field_position.read(p);
    _direction = field_direction.read(p);
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