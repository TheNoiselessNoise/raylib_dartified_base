part of '../../../raylib_dartified_base.dart';

enum BoneInfoField with StructFields {
  name,
  parent,
}

/// Bone, skeletal animation bone
class BoneInfoD extends RaylibStructLiteral<BoneInfoD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<BoneInfoField> struct = .aligned({
    .name:   RChar(BASE_nameLength), // Bone name
    .parent: RInt(), // Bone parent
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<BoneInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, BoneInfoD.new, BoneInfoD.pointer);

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
  
  String _name;
  /// Bone name
  String get name {
    structOnOp((p) => _name = p.readStringUTF8(nameLength, struct.offset(.name)));
    return _name;
  }
  set name(String value) {
    assert(value.length <= nameLength);
    _name = value;
    structOnOp((p) => p.writeStringUTF8(value, nameLength, struct.offset(.name)));
  }

  int _parent;
  /// Bone parent
  int get parent {
    structOnOp((p) => _parent = p.readInt(struct.offset(.parent)));
    return _parent;
  }
  set parent(int value) {
    _parent = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.parent)));
  }

  BoneInfoD({
    super.op,
    String name = '',
    int parent = 0,
  }) :
    _name = name,
    _parent = parent;

  factory BoneInfoD.zero() => .new();

  @override
  BoneInfoD setD(BoneInfoD o) {
    name = o.name;
    parent = o.parent;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeStringUTF8(_name, nameLength, struct.offset(.name));
    p.writeInt(_parent, struct.offset(.parent));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _name = p.readStringUTF8(nameLength, struct.offset(.name));
    _parent = p.readInt(struct.offset(.parent));
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