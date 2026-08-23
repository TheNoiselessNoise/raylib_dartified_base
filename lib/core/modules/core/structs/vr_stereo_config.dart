part of '../../../raylib_dartified_base.dart';

enum VrStereoConfigField {
  projection,
  viewOffset,
  leftLensCenter,
  rightLensCenter,
  leftScreenCenter,
  rightScreenCenter,
  scale,
  scaleIn,
}

/// VR stereo rendering configuration for simulator.
class VrStereoConfigD extends RaylibStruct<VrStereoConfigD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<VrStereoConfigField> structLayout = .aligned(structFields);
  static final Map<VrStereoConfigField, RType> structFields = {
    .projection:        RStruct(MatrixD.structLayout, BASE_paramsCount),
    .viewOffset:        RStruct(MatrixD.structLayout, BASE_paramsCount),
    .leftLensCenter:    RFloat32(BASE_paramsCount),
    .rightLensCenter:   RFloat32(BASE_paramsCount),
    .leftScreenCenter:  RFloat32(BASE_paramsCount),
    .rightScreenCenter: RFloat32(BASE_paramsCount),
    .scale:             RFloat32(BASE_paramsCount),
    .scaleIn:           RFloat32(BASE_paramsCount),
  };

  static StructPointer<VrStereoConfigD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, VrStereoConfigD.new);

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
  
  late LiveListInlineScalar<double, RFloat32> _leftLensCenter;
  /// VR left lens center
  LiveListInlineScalar<double, RFloat32> get leftLensCenter => _leftLensCenter;
  set leftLensCenter(List<double> value) {
    assert(value.length <= paramsCount);
    _leftLensCenter.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat32> _rightLensCenter;
  /// VR right lens center
  LiveListInlineScalar<double, RFloat32> get rightLensCenter => _rightLensCenter;
  set rightLensCenter(List<double> value) {
    assert(value.length <= paramsCount);
    _rightLensCenter.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat32> _leftScreenCenter;
  /// VR left screen center
  LiveListInlineScalar<double, RFloat32> get leftScreenCenter => _leftScreenCenter;
  set leftScreenCenter(List<double> value) {
    assert(value.length <= paramsCount);
    _leftScreenCenter.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat32> _rightScreenCenter;
  /// VR right screen center
  LiveListInlineScalar<double, RFloat32> get rightScreenCenter => _rightScreenCenter;
  set rightScreenCenter(List<double> value) {
    assert(value.length <= paramsCount);
    _rightScreenCenter.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat32> _scale;
  /// VR distortion scale
  LiveListInlineScalar<double, RFloat32> get scale => _scale;
  set scale(List<double> value) {
    assert(value.length <= paramsCount);
    _scale.inner = value;
  }
  
  late LiveListInlineScalar<double, RFloat32> _scaleIn;
  /// VR distortion scale in
  LiveListInlineScalar<double, RFloat32> get scaleIn => _scaleIn;
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
      projection ?? .generate(paramsCount, (_) => .zero()),
      () => op,
      structLayout.offset(.projection),
      MatrixD.pointer,
    );

    _viewOffset = .new(
      viewOffset ?? .generate(paramsCount, (_) => .zero()),
      () => op,
      structLayout.offset(.viewOffset),
      MatrixD.pointer,
    );

    _leftLensCenter = .new(
      leftLensCenter ?? .filled(paramsCount, 0),
      () => op?.cast(),
      structLayout.offset(.leftLensCenter),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
    );

    _rightLensCenter = .new(
      rightLensCenter ?? .filled(paramsCount, 0),
      () => op?.cast(),
      structLayout.offset(.rightLensCenter),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
    );

    _leftScreenCenter = .new(
      leftScreenCenter ?? .filled(paramsCount, 0),
      () => op?.cast(),
      structLayout.offset(.leftScreenCenter),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
    );

    _rightScreenCenter = .new(
      rightScreenCenter ?? .filled(paramsCount, 0),
      () => op?.cast(),
      structLayout.offset(.rightScreenCenter),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
    );

    _scale = .new(
      scale ?? .filled(paramsCount, 0),
      () => op?.cast(),
      structLayout.offset(.scale),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
    );

    _scaleIn = .new(
      scaleIn ?? .filled(paramsCount, 0),
      () => op?.cast(),
      structLayout.offset(.scaleIn),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
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
  void writeInto(MemoryPointer<RStruct> p) {
    MatrixD.pointer(p.offsetBy(structLayout.offset(.projection))).writeArray(_projection.inner);
    MatrixD.pointer(p.offsetBy(structLayout.offset(.viewOffset))).writeArray(_viewOffset.inner);
    p.offsetBy(structLayout.offset(.leftLensCenter)).cast<RFloat32>().writeArray(_leftLensCenter.inner);
    p.offsetBy(structLayout.offset(.rightLensCenter)).cast<RFloat32>().writeArray(_rightLensCenter.inner);
    p.offsetBy(structLayout.offset(.leftScreenCenter)).cast<RFloat32>().writeArray(_leftScreenCenter.inner);
    p.offsetBy(structLayout.offset(.rightScreenCenter)).cast<RFloat32>().writeArray(_rightScreenCenter.inner);
    p.offsetBy(structLayout.offset(.scale)).cast<RFloat32>().writeArray(_scale.inner);
    p.offsetBy(structLayout.offset(.scaleIn)).cast<RFloat32>().writeArray(_scaleIn.inner);
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    projection = MatrixD.pointer(p.offsetBy(structLayout.offset(.projection))).readArray(paramsCount);
    viewOffset = MatrixD.pointer(p.offsetBy(structLayout.offset(.viewOffset))).readArray(paramsCount);
    leftLensCenter = p.offsetBy(structLayout.offset(.leftLensCenter)).cast<RFloat32>().readArray(paramsCount);
    rightLensCenter = p.offsetBy(structLayout.offset(.rightLensCenter)).cast<RFloat32>().readArray(paramsCount);
    leftScreenCenter = p.offsetBy(structLayout.offset(.leftScreenCenter)).cast<RFloat32>().readArray(paramsCount);
    rightScreenCenter = p.offsetBy(structLayout.offset(.rightScreenCenter)).cast<RFloat32>().readArray(paramsCount);
    scale = p.offsetBy(structLayout.offset(.scale)).cast<RFloat32>().readArray(paramsCount);
    scaleIn = p.offsetBy(structLayout.offset(.scaleIn)).cast<RFloat32>().readArray(paramsCount);
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