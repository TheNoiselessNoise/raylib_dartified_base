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
  static final StructLayout<TransformField> structLayout = .aligned({
    .translation: RStruct(Vector3D.structLayout), // Translation
    .rotation: RStruct(QuaternionD.structLayout), // Rotation
    .scale: RStruct(Vector3D.structLayout), // Scale
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<TransformD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, TransformD.new, TransformD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Vector3D _translation;
  /// Translation
  Vector3D get translation {
    structOnOp((p) => _translation.structReadFrom(p.offsetBy(structLayout.offset(.translation))));
    return _translation;
  }
  set translation(Vector3D value) {
    _translation = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.translation))));
  }

  QuaternionD _rotation;
  /// Rotation
  QuaternionD get rotation {
    structOnOp((p) => _rotation.structReadFrom(p.offsetBy(structLayout.offset(.rotation))));
    return _rotation;
  }
  set rotation(QuaternionD value) {
    _rotation = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.rotation))));
  }

  Vector3D _scale;
  /// Scale
  Vector3D get scale {
    structOnOp((p) => _scale.structReadFrom(p.offsetBy(structLayout.offset(.scale))));
    return _scale;
  }
  set scale(Vector3D value) {
    _scale = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.scale))));
  }
  
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
  TransformD setD(TransformD o) {
    translation.setD(o.translation);
    rotation.setD(o.rotation);
    scale.setD(o.scale);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _translation.structWriteInto(p.offsetBy(structLayout.offset(.translation)));
    _rotation.structWriteInto(p.offsetBy(structLayout.offset(.rotation)));
    _scale.structWriteInto(p.offsetBy(structLayout.offset(.scale)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _translation.structReadFrom(p.offsetBy(structLayout.offset(.translation)));
    _rotation.structReadFrom(p.offsetBy(structLayout.offset(.rotation)));
    _scale.structReadFrom(p.offsetBy(structLayout.offset(.scale)));
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