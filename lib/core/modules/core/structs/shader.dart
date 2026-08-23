part of '../../../raylib_dartified_base.dart';

enum ShaderField {
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

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<ShaderField> structLayout = .aligned(structFields);
  static final Map<ShaderField, RType> structFields = {
    .id:   RUint32(),
    .locs: RPointer<RInt32>(), // exactly `shaderLocsCount` values
  };

  static StructPointer<ShaderD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, ShaderD.new);

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
  int get id {
    structOnOp((p) => _id = p.readUint32(structLayout.offset(.id)));
    return _id;
  }
  set id(int value) {
    _id = value;
    structOnOp((p) => p.writeUint32(value, structLayout.offset(.id)));
  }

  late LiveListPointerScalar<int, RInt32> _locs;
  /// Shader locations array of length [shaderLocsCount]
  LiveListPointerScalar<int, RInt32> get locs {
    structOnOp((p) => _locs.ptr = p.readPtr(structLayout.offset(.locs)));
    return _locs;
  }
  set locs(List<int> value) {
    structOnOp((p) => _locs.ptr = p.readPtr(structLayout.offset(.locs)));
    _locs.raw = value;
  }

  ShaderD({
    super.op,
    int id = 0,
    List<int>? locs,
  }) :
    _id = id
  {
    _locs = .new(
      locs ?? .filled(shaderLocsCount, 0), RInt32.scalarByteSize,
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.locs))
    );
  }

  factory ShaderD.zero() => .new();

  @override
  ShaderD setD(ShaderD o) {
    id = o.id;
    locs = .from(o.locs);
    return this;
  }

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeUint32(_id, structLayout.offset(.id));
    p.writePtr(_locs.ptr, structLayout.offset(.locs));

    _locs.onPointer((p) => p.writeArray(_locs.inner));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _id = p.readUint32(structLayout.offset(.id));
    _locs.ptr = p.readPtr(structLayout.offset(.locs));

    _locs.onPointer((p) => _locs.raw = p.readArray(shaderLocsCount));
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