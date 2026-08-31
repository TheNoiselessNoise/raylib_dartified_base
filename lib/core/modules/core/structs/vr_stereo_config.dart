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
class VrStereoConfigD extends RaylibStruct<VrStereoConfigD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<VrStereoConfigField> struct = .aligned({
    .projection:        RStruct(MatrixD.struct, BASE_paramsCount), // VR projection matrices (per eye)
    .viewOffset:        RStruct(MatrixD.struct, BASE_paramsCount), // VR view offset matrices (per eye)
    .leftLensCenter:    RFloat(BASE_paramsCount), // VR left lens center
    .rightLensCenter:   RFloat(BASE_paramsCount), // VR right lens center
    .leftScreenCenter:  RFloat(BASE_paramsCount), // VR left screen center
    .rightScreenCenter: RFloat(BASE_paramsCount), // VR right screen center
    .scale:             RFloat(BASE_paramsCount), // VR distortion scale
    .scaleIn:           RFloat(BASE_paramsCount), // VR distortion scale in
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<VrStereoConfigD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, VrStereoConfigD.new, VrStereoConfigD.pointer);

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
  
  late LiveListInlineStruct<MatrixD> _projection;
  /// VR projection matrices (per eye)
  LiveListInlineStruct<MatrixD> get projection => _projection;
  set projection(List<MatrixD> value) {
    assert(value.length <= paramsCount);
    _projection.inner = value;
  }
  
  late LiveListInlineStruct<MatrixD> _viewOffset;
  /// VR view offset matrices (per eye)
  LiveListInlineStruct<MatrixD> get viewOffset => _viewOffset;
  set viewOffset(List<MatrixD> value) {
    assert(value.length <= paramsCount);
    _viewOffset.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat> _leftLensCenter;
  /// VR left lens center
  LiveListInlineScalar<double, RFloat> get leftLensCenter => _leftLensCenter;
  set leftLensCenter(List<double> value) {
    assert(value.length <= paramsCount);
    _leftLensCenter.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat> _rightLensCenter;
  /// VR right lens center
  LiveListInlineScalar<double, RFloat> get rightLensCenter => _rightLensCenter;
  set rightLensCenter(List<double> value) {
    assert(value.length <= paramsCount);
    _rightLensCenter.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat> _leftScreenCenter;
  /// VR left screen center
  LiveListInlineScalar<double, RFloat> get leftScreenCenter => _leftScreenCenter;
  set leftScreenCenter(List<double> value) {
    assert(value.length <= paramsCount);
    _leftScreenCenter.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat> _rightScreenCenter;
  /// VR right screen center
  LiveListInlineScalar<double, RFloat> get rightScreenCenter => _rightScreenCenter;
  set rightScreenCenter(List<double> value) {
    assert(value.length <= paramsCount);
    _rightScreenCenter.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat> _scale;
  /// VR distortion scale
  LiveListInlineScalar<double, RFloat> get scale => _scale;
  set scale(List<double> value) {
    assert(value.length <= paramsCount);
    _scale.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat> _scaleIn;
  /// VR distortion scale in
  LiveListInlineScalar<double, RFloat> get scaleIn => _scaleIn;
  set scaleIn(List<double> value) {
    assert(value.length <= paramsCount);
    _scaleIn.inner = value;
  }

  VrStereoConfigD({
    super.op,
    List<MatrixD>? projection,
    List<MatrixD>? viewOffset,
    List<double>? leftLensCenter,
    List<double>? rightLensCenter,
    List<double>? leftScreenCenter,
    List<double>? rightScreenCenter,
    List<double>? scale,
    List<double>? scaleIn,
  }) {
    _projection = .new(
      () => op?.cast(),
      struct.offset(.projection),
      MatrixD.pointer,
      projection ?? .generate(paramsCount, (_) => .zero()),
    );

    _viewOffset = .new(
      () => op?.cast(),
      struct.offset(.viewOffset),
      MatrixD.pointer,
      viewOffset ?? .generate(paramsCount, (_) => .zero()),
    );

    _leftLensCenter = .new(
      () => op?.cast(),
      struct.offset(.leftLensCenter),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      leftLensCenter ?? .filled(paramsCount, 0),
    );

    _rightLensCenter = .new(
      () => op?.cast(),
      struct.offset(.rightLensCenter),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      rightLensCenter ?? .filled(paramsCount, 0),
    );

    _leftScreenCenter = .new(
      () => op?.cast(),
      struct.offset(.leftScreenCenter),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      leftScreenCenter ?? .filled(paramsCount, 0),
    );

    _rightScreenCenter = .new(
      () => op?.cast(),
      struct.offset(.rightScreenCenter),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      rightScreenCenter ?? .filled(paramsCount, 0),
    );

    _scale = .new(
      () => op?.cast(),
      struct.offset(.scale),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      scale ?? .filled(paramsCount, 0),
    );

    _scaleIn = .new(
      () => op?.cast(),
      struct.offset(.scaleIn),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      scaleIn ?? .filled(paramsCount, 0),
    );
  }
  factory VrStereoConfigD.zero() => .new();

  @override
  VrStereoConfigD setD(VrStereoConfigD o) {
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
  void structWriteInto(MemoryPointer<RStruct> p) {
    MatrixD.pointer(p.offsetBy(struct.offset(.projection))).writeArray(_projection.inner);
    MatrixD.pointer(p.offsetBy(struct.offset(.viewOffset))).writeArray(_viewOffset.inner);
    p.offsetBy(struct.offset(.leftLensCenter)).cast<RFloat>().writeArray(_leftLensCenter.inner);
    p.offsetBy(struct.offset(.rightLensCenter)).cast<RFloat>().writeArray(_rightLensCenter.inner);
    p.offsetBy(struct.offset(.leftScreenCenter)).cast<RFloat>().writeArray(_leftScreenCenter.inner);
    p.offsetBy(struct.offset(.rightScreenCenter)).cast<RFloat>().writeArray(_rightScreenCenter.inner);
    p.offsetBy(struct.offset(.scale)).cast<RFloat>().writeArray(_scale.inner);
    p.offsetBy(struct.offset(.scaleIn)).cast<RFloat>().writeArray(_scaleIn.inner);
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _projection.raw = MatrixD.pointer(p.offsetBy(struct.offset(.projection))).readArray(paramsCount);
    _viewOffset.raw = MatrixD.pointer(p.offsetBy(struct.offset(.viewOffset))).readArray(paramsCount);
    _leftLensCenter.raw = p.offsetBy(struct.offset(.leftLensCenter)).cast<RFloat>().readArray(paramsCount);
    _rightLensCenter.raw = p.offsetBy(struct.offset(.rightLensCenter)).cast<RFloat>().readArray(paramsCount);
    _leftScreenCenter.raw = p.offsetBy(struct.offset(.leftScreenCenter)).cast<RFloat>().readArray(paramsCount);
    _rightScreenCenter.raw = p.offsetBy(struct.offset(.rightScreenCenter)).cast<RFloat>().readArray(paramsCount);
    _scale.raw = p.offsetBy(struct.offset(.scale)).cast<RFloat>().readArray(paramsCount);
    _scaleIn.raw = p.offsetBy(struct.offset(.scaleIn)).cast<RFloat>().readArray(paramsCount);
  }

  @override
  VrStereoConfigD clone() => .new(
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