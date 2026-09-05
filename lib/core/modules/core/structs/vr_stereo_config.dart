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

  @override
  StructLayout<VrStereoConfigField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<VrStereoConfigField> struct = .aligned({
    .projection:        RArray(RStruct(MatrixD.struct), BASE_paramsCount), // VR projection matrices (per eye)
    .viewOffset:        RArray(RStruct(MatrixD.struct), BASE_paramsCount), // VR view offset matrices (per eye)
    .leftLensCenter:    RArray(RFloat(), BASE_paramsCount), // VR left lens center
    .rightLensCenter:   RArray(RFloat(), BASE_paramsCount), // VR right lens center
    .leftScreenCenter:  RArray(RFloat(), BASE_paramsCount), // VR left screen center
    .rightScreenCenter: RArray(RFloat(), BASE_paramsCount), // VR right screen center
    .scale:             RArray(RFloat(), BASE_paramsCount), // VR distortion scale
    .scaleIn:           RArray(RFloat(), BASE_paramsCount), // VR distortion scale in
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<VrStereoConfigD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, VrStereoConfigD.new, VrStereoConfigD.pointer);

  static final _projectionF = struct.structArray(.projection, MatrixD.pointer);
  static final _viewOffsetF = struct.structArray(.viewOffset, MatrixD.pointer);
  static final _leftLensCenterF = struct.scalarArray<double, RFloat>(.leftLensCenter);
  static final _rightLensCenterF = struct.scalarArray<double, RFloat>(.rightLensCenter);
  static final _leftScreenCenterF = struct.scalarArray<double, RFloat>(.leftScreenCenter);
  static final _rightScreenCenterF = struct.scalarArray<double, RFloat>(.rightScreenCenter);
  static final _scaleF = struct.scalarArray<double, RFloat>(.scale);
  static final _scaleInF = struct.scalarArray<double, RFloat>(.scaleIn);

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
  
  late final StructLiveListStruct<MatrixD> _projection;
  /// VR projection matrices (per eye)
  StructLiveListStruct<MatrixD> get projection => _projection;
  set projection(List<MatrixD> value) => _projection.inner = value;
  
  late final StructLiveListStruct<MatrixD> _viewOffset;
  /// VR view offset matrices (per eye)
  StructLiveListStruct<MatrixD> get viewOffset => _viewOffset;
  set viewOffset(List<MatrixD> value) => _viewOffset.inner = value;
  
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
    _projection = _projectionF.live(() => op?.ptr, projection ?? .generate(_projectionF.codec.type.count, (_) => .zero()));
    _viewOffset = _viewOffsetF.live(() => op?.ptr, viewOffset ?? .generate(_viewOffsetF.codec.type.count, (_) => .zero()));
    _leftLensCenter = _leftLensCenterF.live(() => op?.ptr, leftLensCenter ?? .filled(_leftLensCenterF.codec.type.count, 0));
    _rightLensCenter = _rightLensCenterF.live(() => op?.ptr, rightLensCenter ?? .filled(_rightLensCenterF.codec.type.count, 0));
    _leftScreenCenter = _leftScreenCenterF.live(() => op?.ptr, leftScreenCenter ?? .filled(_leftScreenCenterF.codec.type.count, 0));
    _rightScreenCenter = _rightScreenCenterF.live(() => op?.ptr, rightScreenCenter ?? .filled(_rightScreenCenterF.codec.type.count, 0));
    _scale = _scaleF.live(() => op?.ptr, scale ?? .filled(_scaleF.codec.type.count, 0));
    _scaleIn = _scaleInF.live(() => op?.ptr, scaleIn ?? .filled(_scaleInF.codec.type.count, 0));
  }

  factory VrStereoConfigD.zero() => .new();

  @override
  VrStereoConfigD setDart(VrStereoConfigD o) {
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