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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<BoneInfoD> struct = .new(
    factory: BoneInfoD.new,
    layout: .aligned<BoneInfoField>({
      .name:   RArray(RChar(), BASE_nameLength), // Bone name
      .parent: RInt(), // Bone parent
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<BoneInfoField> structLayout = struct.layoutOf();

  /// Field descriptor for [name].
  static final field_name = structLayout.stringAsCharArray<RChar>(.name);
  /// Field descriptor for [parent].
  static final field_parent = structLayout.scalar<int, RInt>(.parent);

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
  String get name => _name = field_name.readOr(op, _name);
  set name(String value) => _name = field_name.writeOr(op, value);
  
  int _parent;
  /// Bone parent
  int get parent => _parent = field_parent.readOr(op, _parent);
  set parent(int value) => _parent = field_parent.writeOr(op, value);

  BoneInfoD({
    super.op,
    String name = '',
    int parent = 0,
  }) :
    _name = name,
    _parent = parent;

  factory BoneInfoD.zero() => .new();

  @override
  BoneInfoD setDart(BoneInfoD o) {
    name = o.name;
    parent = o.parent;
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_name.write(p, _name);
    field_parent.write(p, _parent);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _name = field_name.readBounded(p, BASE_nameLength);
    _parent = field_parent.read(p);
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