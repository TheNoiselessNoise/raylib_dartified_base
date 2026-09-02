part of '../../../raylib_dartified_base.dart';

enum MaterialField with StructFields {
  shader,
  maps,
  params,
}

// TODO: translate

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
  static final StructLayout<MaterialField> struct = .aligned({
    .shader: RStruct(ShaderD.struct), // Material shader
    .maps:   RPointer(RArray(RStruct(MaterialMapD.struct), BASE_mapsCount)), // Material maps array (MAX_MATERIAL_MAPS)
    .params: RArray(RFloat(), BASE_paramsCount), // Material generic parameters (if required)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MaterialD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MaterialD.new, MaterialD.pointer);

  static final _shaderF = struct.struct(.shader, ShaderD.pointer);
  static final _mapsF = struct.pointerStructFixedArray(.maps, MaterialMapD.pointer);
  static final _paramsF = struct.scalarArray<double, RFloat>(.params);

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
  ShaderD get shader => _shader = _shaderF.readOr(op?.ptr, _shader);
  set shader(ShaderD value) => _shader = _shaderF.writeIf(op?.ptr, value);

  late LiveStructList<MaterialMapD, RStruct> _maps;
  /// Material maps array (MAX_MATERIAL_MAPS)
  LiveStructList<MaterialMapD, RStruct> get maps => _maps;
  set maps(List<MaterialMapD> value) {
    assert(value.length <= BASE_mapsCount);
    _maps.inner = value;
  }

  late LiveStructList<double, RFloat> _params;
  /// Material generic parameters (if required)
  LiveStructList<double, RFloat> get params => _params;
  set params(List<double> value) {
    assert(value.length <= BASE_paramsCount);
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
    // TODO: this
    // _maps = _mapsF.live(
    //   () => op?.ptr,
    //   .generate(BASE_mapsCount, (_) => .zero()),
    // );

    _params = .new(
      () => op?.cast(),
      struct.offset(.params),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      params ?? .filled(BASE_paramsCount, 0),
    );
  }

  factory MaterialD.zero() => .new();

  @override
  MaterialD setDart(MaterialD o) {
    shader.setDart(o.shader);
    maps = o.maps.map((x) => x.clone()).toList();
    params = .from(o.params);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {
    if (_maps.inner.isNotEmpty) {
      _maps.structPtr = temp.MaterialMap$.ArrayStruct(_maps.inner, key: '${key}_maps');
    }
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    _shader.structWriteInto(p.offsetBy(struct.offset(.shader)));
    p.writePtr(_maps.ptr, struct.offset(.maps));
    p.offsetBy(struct.offset(.params)).cast<RFloat>().writeArray(_params.inner);

    _maps.onStructPointer((p) => p.writeArray(_maps.inner));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _shader.structReadFrom(p.offsetBy(struct.offset(.shader)));
    _maps.ptr = p.readPtr(struct.offset(.maps));
    _params.raw = p.offsetBy(struct.offset(.params)).cast<RFloat>().readArray(paramsCount);

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