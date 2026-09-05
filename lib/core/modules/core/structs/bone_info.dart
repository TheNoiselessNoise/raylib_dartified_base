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

  @override
  StructLayout<BoneInfoField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<BoneInfoField> struct = .aligned({
    .name:   RArray(RChar(), BASE_nameLength), // Bone name
    .parent: RInt(), // Bone parent
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<BoneInfoD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, BoneInfoD.new, BoneInfoD.pointer);

  static final _nameF = struct.stringAsCharArray<RChar>(.name);
  static final _parentF = struct.scalar<int, RInt>(.parent);

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
  String get name => _name = _nameF.readOr(op, _name);
  set name(String value) => _name = _nameF.writeIf(op, value);
  
  int _parent;
  /// Bone parent
  int get parent => _parent = _parentF.readOr(op, _parent);
  set parent(int value) => _parent = _parentF.writeIf(op, value);

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
  void structWriteInto(MemoryPointerHandle p) {
    _nameF.write(p, _name);
    _parentF.write(p, _parent);
  }

  @override
  void structReadFrom(MemoryPointerHandle p) {
    _name = _nameF.readBounded(p, BASE_nameLength);
    _parent = _parentF.read(p);
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