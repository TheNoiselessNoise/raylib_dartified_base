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

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<BoundingBoxField> structLayout = .aligned({
    .min: RStruct(Vector3D.structLayout), // Minimum vertex box-corner
    .max: RStruct(Vector3D.structLayout), // Maximum vertex box-corner
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<BoundingBoxD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, BoundingBoxD.new, BoundingBoxD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _min;
  /// Minimum vertex box-corner
  Vector3D get min {
    structOnOp((p) => _min.structReadFrom(p.offsetBy(structLayout.offset(.min))));
    return _min;
  }
  set min(Vector3D value) {
    _min = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.min))));
  }
  
  Vector3D _max;
  /// Maximum vertex box-corner
  Vector3D get max {
    structOnOp((p) => _max.structReadFrom(p.offsetBy(structLayout.offset(.max))));
    return _max;
  }
  set max(Vector3D value) {
    _max = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.max))));
  }

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
  BoundingBoxD setD(BoundingBoxD o) {
    min.setD(o.min);
    max.setD(o.max);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _min.structWriteInto(p.offsetBy(structLayout.offset(.min)));
    _max.structWriteInto(p.offsetBy(structLayout.offset(.max)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _min.structReadFrom(p.offsetBy(structLayout.offset(.min)));
    _max.structReadFrom(p.offsetBy(structLayout.offset(.max)));
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