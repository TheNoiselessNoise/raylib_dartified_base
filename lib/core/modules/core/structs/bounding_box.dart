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

  @override
  StructLayout<BoundingBoxField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<BoundingBoxField> struct = .aligned({
    .min: RStruct(Vector3D.struct), // Minimum vertex box-corner
    .max: RStruct(Vector3D.struct), // Maximum vertex box-corner
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<BoundingBoxD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, BoundingBoxD.new, BoundingBoxD.pointer);

  static final _minF = struct.struct(.min, Vector3D.pointer);
  static final _maxF = struct.struct(.max, Vector3D.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _min;
  /// Minimum vertex box-corner
  Vector3D get min => _min = _minF.readOr(op, _min);
  set min(Vector3D value) => _min = _minF.writeIf(op, value);

  Vector3D _max;
  /// Maximum vertex box-corner
  Vector3D get max => _max = _maxF.readOr(op, _max);
  set max(Vector3D value) => _max = _maxF.writeIf(op, value);

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
  void structWriteInto(MemoryPointerHandle p) {
    _minF.write(p, _min);
    _maxF.write(p, _max);
  }

  @override
  void structReadFrom(MemoryPointerHandle p) {
    _min = _minF.read(p);
    _max = _maxF.read(p);
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