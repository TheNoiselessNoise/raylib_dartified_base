part of '../../../raylib_dartified_base.dart';

enum TransformField with StructFields {
  translation,
  rotation,
  scale,
}

/// Vertex transformation data.
class TransformD extends RaylibStructLiteral<TransformD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<TransformField> structLayout = .aligned({
    .translation: RStruct(Vector3D.structLayout),
    .rotation: RStruct(QuaternionD.structLayout),
    .scale: RStruct(Vector3D.structLayout),
  });

  static StructPointer<TransformD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, TransformD.new, TransformD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Translation
  Vector3D translation;
  
  /// Rotation
  QuaternionD rotation;
  
  /// Scale
  Vector3D scale;

  TransformD({
    super.op,
    Vector3D? translation,
    QuaternionD? rotation,
    Vector3D? scale,
  }) :
    translation = translation ?? .zero(),
    rotation = rotation ?? .zero(),
    scale = scale ?? .zero();

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
    translation.structWriteInto(p.offsetBy(structLayout.offset(.translation)));
    rotation.structWriteInto(p.offsetBy(structLayout.offset(.rotation)));
    scale.structWriteInto(p.offsetBy(structLayout.offset(.scale)));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    translation.structReadFrom(p.offsetBy(structLayout.offset(.translation)));
    rotation.structReadFrom(p.offsetBy(structLayout.offset(.rotation)));
    scale.structReadFrom(p.offsetBy(structLayout.offset(.scale)));
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