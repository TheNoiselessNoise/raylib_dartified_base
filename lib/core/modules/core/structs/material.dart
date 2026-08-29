part of '../../../raylib_dartified_base.dart';

enum MaterialField with StructFields {
  shader,
  maps,
  params
}

/// Material, includes shader and maps
class MaterialD extends RaylibStruct<MaterialD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<MaterialField> structLayout = .aligned({
    .shader: RStruct(ShaderD.structLayout), // Material shader
    .maps:   RPointer<RStruct>(), // Material maps array (MAX_MATERIAL_MAPS)
    .params: RFloat(BASE_paramsCount), // Material generic parameters (if required)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
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
  /// Material maps array (MAX_MATERIAL_MAPS)
  LiveListPointerStruct<MaterialMapD> get maps {
    structOnOp((p) => _maps.ptr = p.readPtr(structLayout.offset(.maps)));
    return _maps;
  }
  set maps(List<MaterialMapD> value) {
    assert(value.length <= mapsCount);
    structOnOp((p) => _maps.ptr = p.readPtr(structLayout.offset(.maps)));
    _maps.inner = value;
  }

  late LiveListInlineScalar<double, RFloat> _params;
  /// Material generic parameters (if required)
  LiveListInlineScalar<double, RFloat> get params => _params;
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
    _maps = .new(maps, MaterialMapD.pointer(op?.readPtr(structLayout.offset(.maps))));

    _params = .new(
      () => op?.cast(),
      structLayout.offset(.params),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      params ?? .filled(BASE_paramsCount, 0),
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
    p.offsetBy(structLayout.offset(.params)).cast<RFloat>().writeArray(_params.inner);

    _maps.onStructPointer((p) => p.writeArray(_maps.inner));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _shader.structReadFrom(p.offsetBy(structLayout.offset(.shader)));
    _maps.ptr = p.readPtr(structLayout.offset(.maps));
    _params.raw = p.offsetBy(structLayout.offset(.params)).cast<RFloat>().readArray(paramsCount);

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