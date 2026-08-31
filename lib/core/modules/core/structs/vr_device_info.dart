part of '../../../raylib_dartified_base.dart';

enum VrDeviceInfoField with StructFields {
  hResolution,
  vResolution,
  hScreenSize,
  vScreenSize,
  eyeToScreenDistance,
  lensSeparationDistance,
  interpupillaryDistance,
  lensDistortionValues,
  chromaAbCorrection,
}

/// VrDeviceInfo, Head-Mounted-Display device parameters
class VrDeviceInfoD extends RaylibStruct<VrDeviceInfoD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<VrDeviceInfoField> struct = .aligned({
    .hResolution:            RInt(), // Horizontal resolution in pixels
    .vResolution:            RInt(), // Vertical resolution in pixels
    .hScreenSize:            RFloat(), // Horizontal size in meters
    .vScreenSize:            RFloat(), // Vertical size in meters
    .eyeToScreenDistance:    RFloat(), // Distance between eye and display in meters
    .lensSeparationDistance: RFloat(), // Lens separation distance in meters
    .interpupillaryDistance: RFloat(), // IPD (distance between pupils) in meters
    .lensDistortionValues:   RFloat(BASE_paramsCount), // Lens distortion constant parameters
    .chromaAbCorrection:     RFloat(BASE_paramsCount), // Chromatic aberration correction parameters
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<VrDeviceInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, VrDeviceInfoD.new, VrDeviceInfoD.pointer);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [lensDistortionValues] and [chromaAbCorrection] arrays.
  static int get BASE_paramsCount => 4;

  /// Number of components in the [lensDistortionValues] and [chromaAbCorrection] arrays.
  int get paramsCount => BASE_paramsCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int _hResolution;
  /// Horizontal resolution in pixels
  int get hResolution {
    structOnOp((p) => _hResolution = p.readInt(struct.offset(.hResolution)));
    return _hResolution;
  }
  set hResolution(int value) {
    _hResolution = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.hResolution)));
  }

  int _vResolution;
  /// Vertical resolution in pixels
  int get vResolution {
    structOnOp((p) => _vResolution = p.readInt(struct.offset(.vResolution)));
    return _vResolution;
  }
  set vResolution(int value) {
    _vResolution = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.vResolution)));
  }

  double _hScreenSize;
  /// Horizontal size in meters
  double get hScreenSize {
    structOnOp((p) => _hScreenSize = p.readFloat(struct.offset(.hScreenSize)));
    return _hScreenSize;
  }
  set hScreenSize(double value) {
    _hScreenSize = value;
    structOnOp((p) => p.writeFloat(value, struct.offset(.hScreenSize)));
  }

  double _vScreenSize;
  /// Vertical size in meters
  double get vScreenSize {
    structOnOp((p) => _vScreenSize = p.readFloat(struct.offset(.vScreenSize)));
    return _vScreenSize;
  }
  set vScreenSize(double value) {
    _vScreenSize = value;
    structOnOp((p) => p.writeFloat(value, struct.offset(.vScreenSize)));
  }

  double _eyeToScreenDistance;
  /// Distance between eye and display in meters
  double get eyeToScreenDistance {
    structOnOp((p) => _eyeToScreenDistance = p.readFloat(struct.offset(.eyeToScreenDistance)));
    return _eyeToScreenDistance;
  }
  set eyeToScreenDistance(double value) {
    _eyeToScreenDistance = value;
    structOnOp((p) => p.writeFloat(value, struct.offset(.eyeToScreenDistance)));
  }

  double _lensSeparationDistance;
  /// Lens separation distance in meters
  double get lensSeparationDistance {
    structOnOp((p) => _lensSeparationDistance = p.readFloat(struct.offset(.lensSeparationDistance)));
    return _lensSeparationDistance;
  }
  set lensSeparationDistance(double value) {
    _lensSeparationDistance = value;
    structOnOp((p) => p.writeFloat(value, struct.offset(.lensSeparationDistance)));
  }

  double _interpupillaryDistance;
  /// IPD (distance between pupils) in meters
  double get interpupillaryDistance {
    structOnOp((p) => _interpupillaryDistance = p.readFloat(struct.offset(.interpupillaryDistance)));
    return _interpupillaryDistance;
  }
  set interpupillaryDistance(double value) {
    _interpupillaryDistance = value;
    structOnOp((p) => p.writeFloat(value, struct.offset(.interpupillaryDistance)));
  }

  late LiveListInlineScalar<double, RFloat> _lensDistortionValues;
  /// Lens distortion constant parameters
  LiveListInlineScalar<double, RFloat> get lensDistortionValues => _lensDistortionValues;
  set lensDistortionValues(List<double> value) {
    assert(value.length <= paramsCount);
    _lensDistortionValues.inner = value;
  }

  late LiveListInlineScalar<double, RFloat> _chromaAbCorrection;
  /// Chromatic aberration correction parameters
  LiveListInlineScalar<double, RFloat> get chromaAbCorrection => _chromaAbCorrection;
  set chromaAbCorrection(List<double> value) {
    assert(value.length <= paramsCount);
    _chromaAbCorrection.inner = value;
  }

  VrDeviceInfoD({
    super.op,
    int hResolution = 0,
    int vResolution = 0,
    double hScreenSize = 0,
    double vScreenSize = 0,
    double eyeToScreenDistance = 0,
    double lensSeparationDistance = 0,
    double interpupillaryDistance = 0,
    List<double>? lensDistortionValues,
    List<double>? chromaAbCorrection,
  }) :
    _hResolution = hResolution,
    _vResolution = vResolution,
    _hScreenSize = hScreenSize,
    _vScreenSize = vScreenSize,
    _eyeToScreenDistance = eyeToScreenDistance,
    _lensSeparationDistance = lensSeparationDistance,
    _interpupillaryDistance = interpupillaryDistance
  {
    _lensDistortionValues = .new(
      () => op?.cast(),
      struct.offset(.lensDistortionValues),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      lensDistortionValues ?? .filled(paramsCount, 0),
    );

    _chromaAbCorrection = .new(
      () => op?.cast(),
      struct.offset(.chromaAbCorrection),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      chromaAbCorrection ?? .filled(paramsCount, 0),
    );
  }

  factory VrDeviceInfoD.zero() => .new();

  @override
  VrDeviceInfoD setD(VrDeviceInfoD o) {
    hResolution = o.hResolution;
    vResolution = o.vResolution;
    hScreenSize = o.hScreenSize;
    vScreenSize = o.vScreenSize;
    eyeToScreenDistance = o.eyeToScreenDistance;
    lensSeparationDistance = o.lensSeparationDistance;
    interpupillaryDistance = o.interpupillaryDistance;
    lensDistortionValues = .from(o.lensDistortionValues);
    chromaAbCorrection = .from(o.chromaAbCorrection);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeInt(_hResolution, struct.offset(.hResolution));
    p.writeInt(_vResolution, struct.offset(.vResolution));
    p.writeFloat(_hScreenSize, struct.offset(.hScreenSize));
    p.writeFloat(_vScreenSize, struct.offset(.vScreenSize));
    p.writeFloat(_eyeToScreenDistance, struct.offset(.eyeToScreenDistance));
    p.writeFloat(_lensSeparationDistance, struct.offset(.lensSeparationDistance));
    p.writeFloat(_interpupillaryDistance, struct.offset(.interpupillaryDistance));
    p.offsetBy(struct.offset(.lensDistortionValues)).cast<RFloat>().writeArray(_lensDistortionValues.inner);
    p.offsetBy(struct.offset(.chromaAbCorrection)).cast<RFloat>().writeArray(_chromaAbCorrection.inner);
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _hResolution = p.readInt(struct.offset(.hResolution));
    _vResolution = p.readInt(struct.offset(.vResolution));
    _hScreenSize = p.readFloat(struct.offset(.hScreenSize));
    _vScreenSize = p.readFloat(struct.offset(.vScreenSize));
    _eyeToScreenDistance = p.readFloat(struct.offset(.eyeToScreenDistance));
    _lensSeparationDistance = p.readFloat(struct.offset(.lensSeparationDistance));
    _interpupillaryDistance = p.readFloat(struct.offset(.interpupillaryDistance));
    _lensDistortionValues.raw = p.offsetBy(struct.offset(.lensDistortionValues)).cast<RFloat>().readArray(paramsCount);
    _chromaAbCorrection.raw = p.offsetBy(struct.offset(.chromaAbCorrection)).cast<RFloat>().readArray(paramsCount);
  }

  @override
  VrDeviceInfoD clone() => .new(
    op: op,
    hResolution: hResolution,
    vResolution: vResolution,
    hScreenSize: hScreenSize,
    vScreenSize: vScreenSize,
    eyeToScreenDistance: eyeToScreenDistance,
    lensSeparationDistance: lensSeparationDistance,
    interpupillaryDistance: interpupillaryDistance,
    lensDistortionValues: .from(lensDistortionValues),
    chromaAbCorrection: .from(chromaAbCorrection),
  );

  @override
  String signature() => '$structName(res: ${hResolution}x$vResolution, screen: ${hScreenSize}x$vScreenSize)';
}