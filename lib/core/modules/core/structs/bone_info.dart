part of '../../../raylib_dartified_base.dart';

enum BoneInfoField with StructFields {
  name,
  parent,
}

/// Bone, skeletal animation bone.
class BoneInfoD extends RaylibStructLiteral<BoneInfoD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<BoneInfoField> structLayout = .aligned({
    .name:   RChar(BASE_nameLength),
    .parent: RInt32(),
  });

  static StructPointer<BoneInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, BoneInfoD.new, BoneInfoD.pointer);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Size of the native [name] buffer.
  static int get BASE_nameLength => 32;

  /// Size of the native [name] buffer.
  int get nameLength => BASE_nameLength;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Bone name
  String name;

  /// Bone parent
  int parent;

  BoneInfoD({
    super.op,
    this.name = '',
    this.parent = 0,
  });

  factory BoneInfoD.zero() => .new();

  @override
  BoneInfoD setD(BoneInfoD o) {
    name = o.name;
    parent = o.parent;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeStringUTF8(name, nameLength, structLayout.offset(.name));
    p.writeInt32(parent, structLayout.offset(.parent));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    name = p.readStringUTF8(nameLength, structLayout.offset(.name));
    parent = p.readInt32(structLayout.offset(.parent));
  }

  @override
  BoneInfoD clone() => .new(
    op: op,
    name: name,
    parent: parent,
  );

  @override
  String signature() => '$structName(name: $name, parent: $parent)';
}