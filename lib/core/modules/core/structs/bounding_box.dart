part of '../../../raylib_dartified_base.dart';

enum BoundingBoxField with StructFields {
  min,
  max,
}

/// BoundingBox
class BoundingBoxD extends RaylibStructLiteral<BoundingBoxD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<BoundingBoxD> struct = .new(
    factory: BoundingBoxD.new,
    layout: .aligned<BoundingBoxField>({
      .min: RStruct(Vector3D.struct), // Minimum vertex box-corner
      .max: RStruct(Vector3D.struct), // Maximum vertex box-corner
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<BoundingBoxField> structLayout = struct.layoutOf();

  /// Field descriptor for [min].
  static final field_min = structLayout.struct<Vector3D>(.min);
  /// Field descriptor for [max].
  static final field_max = structLayout.struct<Vector3D>(.max);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _min;
  /// Minimum vertex box-corner
  Vector3D get min => _min = field_min.readOr(op, _min);
  set min(Vector3D value) => _min = field_min.writeOr(op, value);

  Vector3D _max;
  /// Maximum vertex box-corner
  Vector3D get max => _max = field_max.readOr(op, _max);
  set max(Vector3D value) => _max = field_max.writeOr(op, value);

  BoundingBoxD({
    super.op,
    Vector3D? min,
    Vector3D? max,
  }) :
    _min = min ?? .zero(),
    _max = max ?? .zero();

  factory BoundingBoxD.zero() => .new();

  factory BoundingBoxD.bbox(
    Vector3D min,
    Vector3D max,
  ) => .new(
    min: min,
    max: max,
  );

  @override
  BoundingBoxD setDart(BoundingBoxD o) {
    min.setDart(o.min);
    max.setDart(o.max);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_min.write(p, _min);
    field_max.write(p, _max);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _min = field_min.read(p);
    _max = field_max.read(p);
  }
  
  @override
  BoundingBoxD clone() => .new(
    op: op,
    min: min.clone(),
    max: max.clone(),
  );

  @override
  String signature() => '$structName(min: $min, max: $max)';
}