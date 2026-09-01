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

  static final _translationF = struct.struct<Vector3D>(.translation, Vector3D.pointer);
  static final _rotationF = struct.struct<QuaternionD>(.rotation, QuaternionD.pointer);
  static final _scaleF = struct.struct<Vector3D>(.scale, Vector3D.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _translation;
  /// Translation
  Vector3D get translation => _translation = _translationF.readOr(op?.ptr, _translation);
  set translation(Vector3D value) => _translation = _translationF.writeIf(op?.ptr, value);

  QuaternionD _rotation;
  /// Rotation
  QuaternionD get rotation => _rotation = _rotationF.readOr(op?.ptr, _rotation);
  set rotation(QuaternionD value) => _rotation = _rotationF.writeIf(op?.ptr, value);

  Vector3D _scale;
  /// Scale
  Vector3D get scale => _scale = _scaleF.readOr(op?.ptr, _scale);
  set scale(Vector3D value) => _scale = _scaleF.writeIf(op?.ptr, value);
  
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
  void structWriteInto(MemoryPointer<RStruct> p) {
    _translationF.write(p, _translation);
    _rotationF.write(p, _rotation);
    _scaleF.write(p, _scale);
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _translation = _translationF.read(p);
    _rotation = _rotationF.read(p);
    _scale = _scaleF.read(p);
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