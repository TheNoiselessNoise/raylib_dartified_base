part of '../../../raylib_dartified_base.dart';

enum TransformField with StructFields {
  translation,
  rotation,
  scale,
}

/// Transform, vertex transformation data
class TransformD extends RaylibStructLiteral<TransformD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<TransformD> struct = .new(
    factory: TransformD.new,
    layout: .aligned<TransformField>({
      .translation: RStruct(Vector3D.struct), // Translation
      .rotation: RStruct(QuaternionD.struct), // Rotation
      .scale: RStruct(Vector3D.struct), // Scale
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<TransformField> structLayout = struct.layoutOf();

  /// Field descriptor for [translation].
  static final field_translation = structLayout.struct<Vector3D>(.translation);
  /// Field descriptor for [rotation].
  static final field_rotation = structLayout.struct<QuaternionD>(.rotation);
  /// Field descriptor for [scale].
  static final field_scale = structLayout.struct<Vector3D>(.scale);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _translation;
  /// Translation
  Vector3D get translation => _translation = field_translation.readOr(op, _translation);
  set translation(Vector3D value) => _translation = field_translation.writeOr(op, value);

  QuaternionD _rotation;
  /// Rotation
  QuaternionD get rotation => _rotation = field_rotation.readOr(op, _rotation);
  set rotation(QuaternionD value) => _rotation = field_rotation.writeOr(op, value);

  Vector3D _scale;
  /// Scale
  Vector3D get scale => _scale = field_scale.readOr(op, _scale);
  set scale(Vector3D value) => _scale = field_scale.writeOr(op, value);
  
  TransformD({
    super.op,
    Vector3D? translation,
    QuaternionD? rotation,
    Vector3D? scale,
  }) :
    _translation = translation ?? .zero(),
    _rotation = rotation ?? .zero(),
    _scale = scale ?? .zero();

  factory TransformD.zero() => .new();

  @override
  TransformD setDart(TransformD o) {
    translation.setDart(o.translation);
    rotation.setDart(o.rotation);
    scale.setDart(o.scale);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_translation.write(p, _translation);
    field_rotation.write(p, _rotation);
    field_scale.write(p, _scale);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _translation = field_translation.read(p);
    _rotation = field_rotation.read(p);
    _scale = field_scale.read(p);
  }

  @override
  TransformD clone() => .new(
    op: op,
    translation: translation.clone(),
    rotation: rotation.clone(),
    scale: scale,
  );

  @override
  String signature() => '$structName(translation: $translation, rotation: $rotation, scale: $scale)';
}