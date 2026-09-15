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

  @override
  StructLayout<TransformField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<TransformField> struct = .aligned({
    .translation: RStruct(Vector3D.struct), // Translation
    .rotation: RStruct(QuaternionD.struct), // Rotation
    .scale: RStruct(Vector3D.struct), // Scale
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<TransformD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, TransformD.new, TransformD.pointer);

  static final field_translation = struct.struct(.translation, Vector3D.pointer);
  static final field_rotation = struct.struct(.rotation, QuaternionD.pointer);
  static final field_scale = struct.struct(.scale, Vector3D.pointer);

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
  set translation(Vector3D value) => _translation = field_translation.writeIf(op, value);

  QuaternionD _rotation;
  /// Rotation
  QuaternionD get rotation => _rotation = field_rotation.readOr(op, _rotation);
  set rotation(QuaternionD value) => _rotation = field_rotation.writeIf(op, value);

  Vector3D _scale;
  /// Scale
  Vector3D get scale => _scale = field_scale.readOr(op, _scale);
  set scale(Vector3D value) => _scale = field_scale.writeIf(op, value);
  
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