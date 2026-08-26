part of '../../../raylib_dartified_base.dart';

enum BoundingBoxField {
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

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<BoundingBoxField> structLayout = .aligned(structFields);
  static final Map<BoundingBoxField, RType> structFields = {
    .min: RStruct(Vector3D.structLayout),
    .max: RStruct(Vector3D.structLayout),
  };

  static StructPointer<BoundingBoxD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, BoundingBoxD.new, BoundingBoxD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Minimum vertex box-corner
  Vector3D min;

  /// Maximum vertex box-corner
  Vector3D max;

  BoundingBoxD({
    super.op,
    Vector3D? min,
    Vector3D? max,
  }) :
    min = min ?? .zero(),
    max = max ?? .zero();

  factory BoundingBoxD.zero() => .new();

  factory BoundingBoxD.bbox(
    Vector3D min,
    Vector3D max,
  ) => .new(min: min, max: max);

  @override
  BoundingBoxD setD(BoundingBoxD o) {
    min.setD(o.min);
    max.setD(o.max);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    min.structWriteInto(p.offsetBy(structLayout.offset(.min)));
    max.structWriteInto(p.offsetBy(structLayout.offset(.max)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    min.structReadFrom(p.offsetBy(structLayout.offset(.min)));
    max.structReadFrom(p.offsetBy(structLayout.offset(.max)));
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