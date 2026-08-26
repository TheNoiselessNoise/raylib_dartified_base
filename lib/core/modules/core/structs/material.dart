part of '../../../raylib_dartified_base.dart';

enum MaterialField {
  shader,
  maps,
  params
}

/// Includes shader and maps.
class MaterialD extends RaylibStruct<MaterialD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<MaterialField> structLayout = .aligned(structFields);
  static final Map<MaterialField, RType> structFields = {
    .shader: RStruct(ShaderD.structLayout),
    .maps:   RPointer<RStruct>(),
    .params: RFloat32(BASE_paramsCount),
  };

  static StructPointer<MaterialD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, MaterialD.new, MaterialD.pointer);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [maps] buffer.
  static int get BASE_mapsCount => RaylibConstants.MAX_MATERIAL_MAPS;

  /// Number of components in the [maps] buffer.
  int get mapsCount => BASE_mapsCount;

  /// Number of components in the [params] array.
  static int get BASE_paramsCount => 4;

  /// Number of components in the [params] array.
  int get paramsCount => BASE_paramsCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  ShaderD _shader;
  /// Material shader
  ShaderD get shader {
    structOnOp((p) => _shader.structReadFrom(p.offsetBy(structLayout.offset(.shader))));
    return _shader;
  }
  set shader(ShaderD value) {
    _shader = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(structLayout.offset(.shader))));
  }
  
  late LiveListPointerStruct<MaterialMapD> _maps;
  /// Material maps array of length [RaylibConstants.MAX_MATERIAL_MAPS]
  LiveListPointerStruct<MaterialMapD> get maps {
    structOnOp((p) => _maps.ptr = p.readPtr(structLayout.offset(.maps)));
    return _maps;
  }
  set maps(List<MaterialMapD> value) {
    assert(value.length <= mapsCount);
    structOnOp((p) => _maps.ptr = p.readPtr(structLayout.offset(.maps)));
    _maps.inner = value;
  }

  late LiveListInlineScalar<double, RFloat32> _params;
  /// Material generic parameters (if required) of length [paramsCount]
  LiveListInlineScalar<double, RFloat32> get params => _params;
  set params(List<double> value) {
    assert(value.length <= paramsCount);
    _params.inner = value;
  }

  MaterialD({
    super.op,
    ShaderD? shader,
    List<MaterialMapD>? maps,
    List<double>? params,
  }) :
    _shader = shader ?? .zero()
  {
    _maps = .new(
      maps ?? [],
      MaterialMapD.pointer(op?.readPtr(structLayout.offset(.maps))),
    );

    _params = .new(
      params ?? .filled(BASE_paramsCount, 0),
      () => op?.cast(),
      structLayout.offset(.params),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
    );
  }

  factory MaterialD.zero() => .new();

  @override
  MaterialD setD(MaterialD o) {
    shader.setD(o.shader);
    maps = o.maps.map((x) => x.clone()).toList();
    params = .from(o.params);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {
    if (_maps.inner.isNotEmpty) {
      _maps.structPtr = temp.MaterialMap$.Array(_maps.inner, key: '${key}_maps');
    }
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _shader.structWriteInto(p.offsetBy(structLayout.offset(.shader)));
    p.writePtr(_maps.ptr, structLayout.offset(.maps));
    p.offsetBy(structLayout.offset(.params)).cast<RFloat32>().writeArray(_params.inner);

    _maps.onStructPointer((p) => p.writeArray(_maps.inner));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _shader.structReadFrom(p.offsetBy(structLayout.offset(.shader)));
    _maps.ptr = p.readPtr(structLayout.offset(.maps));
    _params.raw = p.offsetBy(structLayout.offset(.params)).cast<RFloat32>().readArray(paramsCount);

    _maps.onStructPointer((p) => _maps.raw = p.readArray(mapsCount));
  }

  @override
  MaterialD clone() => .new(
    op: op,
    shader: shader.clone(),
    maps: maps.map((x) => x.clone()).toList(),
    params: .from(params),
  );

  @override
  String signature() => '$structName(shader: $shader, maps: ${maps.length}, params: ${params.join(', ')})';
}