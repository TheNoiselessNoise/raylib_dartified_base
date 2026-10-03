part of '../../../raylib_dartified_base.dart';

enum MaterialField with StructFields {
  shader,
  maps,
  params,
}

/// Material, includes shader and maps
class Material extends RaylibStruct<Material> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<Material> struct = ._builtin(
    factory: Material.new,
    layout: .aligned<MaterialField>({
      .shader: RStruct(Shader.struct), // Material shader
      .maps:   RPointer(RArray(RStruct(MaterialMap.struct), BASE_mapsCount)), // Material maps array (MAX_MATERIAL_MAPS)
      .params: RArray(RFloat(), BASE_paramsCount), // Material generic parameters (if required)
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<MaterialField> structLayout = struct.layoutOf();

  /// Field descriptor for [shader].
  static final field_shader = structLayout.struct<Shader>(.shader);
  /// Field descriptor for [maps].
  static final field_maps = structLayout.pointerStructFixedArray<MaterialMap>(.maps);
  /// Field descriptor for [params].
  static final field_params = structLayout.scalarArray<double, RFloat>(.params);

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

  Shader _shader;
  /// Material shader
  Shader get shader => _shader = field_shader.readOr(op, _shader);
  set shader(Shader value) => _shader = field_shader.writeOr(op, value);

  late final StructLiveListStruct<MaterialMap> _maps;
  /// Material maps array (MAX_MATERIAL_MAPS)
  StructLiveListStruct<MaterialMap> get maps => _maps;
  set maps(List<MaterialMap> value) => _maps.inner = value;

  late final StructLiveList<double, RFloat> _params;
  /// Material generic parameters (if required)
  StructLiveList<double, RFloat> get params => _params;
  set params(List<double> value) => _params.inner = value;

  Material({
    super.op,
    Shader? shader,
    List<MaterialMap>? maps,
    List<double>? params,
  }) :
    _shader = shader ?? .zero()
  {
    _maps = field_maps.live(() => op, maps ?? .generate(BASE_mapsCount, (_) => .zero()));
    _params = field_params.live(() => op, params ?? .filled(field_params.codec.type.count, 0));
  }

  factory Material.zero() => .new();

  @override
  Material setDart(Material o) {
    shader.setDart(o.shader);
    maps = o.maps.map((x) => x.clone()).toList();
    params = .from(o.params);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_maps.allocate(temp, p, '${key}_maps', count: BASE_mapsCount);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_shader.write(p, _shader);
    _maps.writeInto(p);
    _params.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _shader = field_shader.read(p);
    _maps.readFrom(p, count: mapsCount);
    _params.readFrom(p);
  }

  @override
  Material clone() => .new(
    op: op,
    shader: shader.clone(),
    maps: maps.map((x) => x.clone()).toList(),
    params: .from(params),
  );

  @override
  String signature() => '$structName(shader: $shader, maps: ${maps.length}, params: ${params.join(', ')})';
}