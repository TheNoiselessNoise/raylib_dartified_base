part of '../../../raylib_dartified_base.dart';

enum VrStereoConfigField with StructFields {
  projection,
  viewOffset,
  leftLensCenter,
  rightLensCenter,
  leftScreenCenter,
  rightScreenCenter,
  scale,
  scaleIn,
}

/// VrStereoConfig, VR stereo rendering configuration for simulator
class VrStereoConfig extends RaylibStruct<VrStereoConfig> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<VrStereoConfig> struct = ._builtin(
    factory: VrStereoConfig.new,
    layout: .aligned<VrStereoConfigField>({
      .projection:        RArray(RStruct(Matrix.struct), BASE_paramsCount), // VR projection matrices (per eye)
      .viewOffset:        RArray(RStruct(Matrix.struct), BASE_paramsCount), // VR view offset matrices (per eye)
      .leftLensCenter:    RArray(RFloat(), BASE_paramsCount), // VR left lens center
      .rightLensCenter:   RArray(RFloat(), BASE_paramsCount), // VR right lens center
      .leftScreenCenter:  RArray(RFloat(), BASE_paramsCount), // VR left screen center
      .rightScreenCenter: RArray(RFloat(), BASE_paramsCount), // VR right screen center
      .scale:             RArray(RFloat(), BASE_paramsCount), // VR distortion scale
      .scaleIn:           RArray(RFloat(), BASE_paramsCount), // VR distortion scale in
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<VrStereoConfigField> structLayout = struct.layoutOf();

  /// Field descriptor for [projection].
  static final field_projection = structLayout.structArray<Matrix>(.projection);
  /// Field descriptor for [viewOffset].
  static final field_viewOffset = structLayout.structArray<Matrix>(.viewOffset);
  /// Field descriptor for [leftLensCenter].
  static final field_leftLensCenter = structLayout.scalarArray<double, RFloat>(.leftLensCenter);
  /// Field descriptor for [rightLensCenter].
  static final field_rightLensCenter = structLayout.scalarArray<double, RFloat>(.rightLensCenter);
  /// Field descriptor for [leftScreenCenter].
  static final field_leftScreenCenter = structLayout.scalarArray<double, RFloat>(.leftScreenCenter);
  /// Field descriptor for [rightScreenCenter].
  static final field_rightScreenCenter = structLayout.scalarArray<double, RFloat>(.rightScreenCenter);
  /// Field descriptor for [scale].
  static final field_scale = structLayout.scalarArray<double, RFloat>(.scale);
  /// Field descriptor for [scaleIn].
  static final field_scaleIn = structLayout.scalarArray<double, RFloat>(.scaleIn);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [projection], [viewOffset], [leftLensCenter], [rightLensCenter], [leftScreenCenter], [rightScreenCenter], [scale] and [scaleIn] arrays.
  static int get BASE_paramsCount => 2;

  /// Number of components in the [projection], [viewOffset], [leftLensCenter], [rightLensCenter], [leftScreenCenter], [rightScreenCenter], [scale] and [scaleIn] arrays.
  int get paramsCount => BASE_paramsCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  late final StructLiveListStruct<Matrix> _projection;
  /// VR projection matrices (per eye)
  StructLiveListStruct<Matrix> get projection => _projection;
  set projection(List<Matrix> value) => _projection.inner = value;
  
  late final StructLiveListStruct<Matrix> _viewOffset;
  /// VR view offset matrices (per eye)
  StructLiveListStruct<Matrix> get viewOffset => _viewOffset;
  set viewOffset(List<Matrix> value) => _viewOffset.inner = value;
  
  late final StructLiveList<double, RFloat> _leftLensCenter;
  /// VR left lens center
  StructLiveList<double, RFloat> get leftLensCenter => _leftLensCenter;
  set leftLensCenter(List<double> value) => _leftLensCenter.inner = value;
  
  late final StructLiveList<double, RFloat> _rightLensCenter;
  /// VR right lens center
  StructLiveList<double, RFloat> get rightLensCenter => _rightLensCenter;
  set rightLensCenter(List<double> value) => _rightLensCenter.inner = value;
  
  late final StructLiveList<double, RFloat> _leftScreenCenter;
  /// VR left screen center
  StructLiveList<double, RFloat> get leftScreenCenter => _leftScreenCenter;
  set leftScreenCenter(List<double> value) => _leftScreenCenter.inner = value;
  
  late final StructLiveList<double, RFloat> _rightScreenCenter;
  /// VR right screen center
  StructLiveList<double, RFloat> get rightScreenCenter => _rightScreenCenter;
  set rightScreenCenter(List<double> value) => _rightScreenCenter.inner = value;
  
  late final StructLiveList<double, RFloat> _scale;
  /// VR distortion scale
  StructLiveList<double, RFloat> get scale => _scale;
  set scale(List<double> value) => _scale.inner = value;
  
  late final StructLiveList<double, RFloat> _scaleIn;
  /// VR distortion scale in
  StructLiveList<double, RFloat> get scaleIn => _scaleIn;
  set scaleIn(List<double> value) => _scaleIn.inner = value;

  VrStereoConfig({
    super.op,
    List<Matrix>? projection,
    List<Matrix>? viewOffset,
    List<double>? leftLensCenter,
    List<double>? rightLensCenter,
    List<double>? leftScreenCenter,
    List<double>? rightScreenCenter,
    List<double>? scale,
    List<double>? scaleIn,
  }) {
    _projection = field_projection.live(() => op, projection ?? .generate(field_projection.codec.type.count, (_) => .zero()));
    _viewOffset = field_viewOffset.live(() => op, viewOffset ?? .generate(field_viewOffset.codec.type.count, (_) => .zero()));
    _leftLensCenter = field_leftLensCenter.live(() => op, leftLensCenter ?? .filled(field_leftLensCenter.codec.type.count, 0));
    _rightLensCenter = field_rightLensCenter.live(() => op, rightLensCenter ?? .filled(field_rightLensCenter.codec.type.count, 0));
    _leftScreenCenter = field_leftScreenCenter.live(() => op, leftScreenCenter ?? .filled(field_leftScreenCenter.codec.type.count, 0));
    _rightScreenCenter = field_rightScreenCenter.live(() => op, rightScreenCenter ?? .filled(field_rightScreenCenter.codec.type.count, 0));
    _scale = field_scale.live(() => op, scale ?? .filled(field_scale.codec.type.count, 0));
    _scaleIn = field_scaleIn.live(() => op, scaleIn ?? .filled(field_scaleIn.codec.type.count, 0));
  }

  factory VrStereoConfig.zero() => .new();

  @override
  VrStereoConfig setDart(VrStereoConfig o) {
    projection = .from(o.projection);
    viewOffset = .from(o.viewOffset);
    leftLensCenter = .from(o.leftLensCenter);
    rightLensCenter = .from(o.rightLensCenter);
    leftScreenCenter = .from(o.leftScreenCenter);
    rightScreenCenter = .from(o.rightScreenCenter);
    scale = .from(o.scale);
    scaleIn = .from(o.scaleIn);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _projection.writeInto(p);
    _viewOffset.writeInto(p);
    _leftLensCenter.writeInto(p);
    _rightLensCenter.writeInto(p);
    _leftScreenCenter.writeInto(p);
    _rightScreenCenter.writeInto(p);
    _scale.writeInto(p);
    _scaleIn.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _projection.readFrom(p);
    _viewOffset.readFrom(p);
    _leftLensCenter.readFrom(p);
    _rightLensCenter.readFrom(p);
    _leftScreenCenter.readFrom(p);
    _rightScreenCenter.readFrom(p);
    _scale.readFrom(p);
    _scaleIn.readFrom(p);
  }

  @override
  VrStereoConfig clone() => .new(
    op: op,
    projection: .from(projection),
    viewOffset: .from(viewOffset),
    leftLensCenter: .from(leftLensCenter),
    rightLensCenter: .from(rightLensCenter),
    leftScreenCenter: .from(leftScreenCenter),
    rightScreenCenter: .from(rightScreenCenter),
    scale: .from(scale),
    scaleIn: .from(scaleIn),
  );

  @override
  String signature() => '$structName()';
}