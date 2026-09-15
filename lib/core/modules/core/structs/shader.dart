part of '../../../raylib_dartified_base.dart';

enum ShaderField with StructFields {
  id,
  locs,
}

/// Shader
class ShaderD extends RaylibStruct<ShaderD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<ShaderField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<ShaderField> struct = .aligned({
    .id:   RUnsignedInt(), // Shader program id
    .locs: RPointer(RArray(RInt(), BASE_shaderLocsCount)), // Shader locations array (RL_MAX_SHADER_LOCATIONS)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<ShaderD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, ShaderD.new, ShaderD.pointer);

  static final field_id = struct.scalar<int, RUnsignedInt>(.id);
  static final field_locs = struct.pointerScalarFixedArray<int, RInt>(.locs);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [locs] buffer.
  static int get BASE_shaderLocsCount => RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS;

  /// Number of components in the [locs] buffer.
  int get shaderLocsCount => BASE_shaderLocsCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _id;
  /// Shader program id
  int get id => _id = field_id.readOr(op, _id);
  set id(int value) => _id = field_id.writeIf(op, value);

  late final StructLiveList<int, RInt> _locs;
  /// Shader locations array (RL_MAX_SHADER_LOCATIONS)
  StructLiveList<int, RInt> get locs => _locs;
  set locs(List<int> value) => _locs.inner = value;

  ShaderD({
    super.op,
    int id = 0,
    List<int>? locs,
  }) :
    _id = id
  {
    _locs = field_locs.live(() => op, .filled(BASE_shaderLocsCount, 0));
  }

  factory ShaderD.zero() => .new();

  @override
  ShaderD setDart(ShaderD o) {
    id = o.id;
    locs = .from(o.locs);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_locs.allocate(temp, p, '${key}_locs', count: BASE_shaderLocsCount);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_id.write(p, _id);
    _locs.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _id = field_id.read(p);
    _locs.readFrom(p, count: shaderLocsCount);
  }

  @override
  ShaderD clone() => .new(
    op: op,
    id: id,
    locs: .from(locs),
  );

  @override
  String signature() => '$structName(id: $id, locs: ${locs.join(', ')})';
}