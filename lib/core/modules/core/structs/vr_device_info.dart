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

  @override
  StructLayout<VrDeviceInfoField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<VrDeviceInfoField> struct = .aligned({
    .hResolution:            RInt(), // Horizontal resolution in pixels
    .vResolution:            RInt(), // Vertical resolution in pixels
    .hScreenSize:            RFloat(), // Horizontal size in meters
    .vScreenSize:            RFloat(), // Vertical size in meters
    .eyeToScreenDistance:    RFloat(), // Distance between eye and display in meters
    .lensSeparationDistance: RFloat(), // Lens separation distance in meters
    .interpupillaryDistance: RFloat(), // IPD (distance between pupils) in meters
    .lensDistortionValues:   RArray(RFloat(), BASE_paramsCount), // Lens distortion constant parameters
    .chromaAbCorrection:     RArray(RFloat(), BASE_paramsCount), // Chromatic aberration correction parameters
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<VrDeviceInfoD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, VrDeviceInfoD.new, VrDeviceInfoD.pointer);

  static final _hResolutionF = struct.scalar<int, RInt>(.hResolution);
  static final _vResolutionF = struct.scalar<int, RInt>(.vResolution);
  static final _hScreenSizeF = struct.scalar<double, RFloat>(.hScreenSize);
  static final _vScreenSizeF = struct.scalar<double, RFloat>(.vScreenSize);
  static final _eyeToScreenDistanceF = struct.scalar<double, RFloat>(.eyeToScreenDistance);
  static final _lensSeparationDistanceF = struct.scalar<double, RFloat>(.lensSeparationDistance);
  static final _interpupillaryDistanceF = struct.scalar<double, RFloat>(.interpupillaryDistance);
  static final _lensDistortionValuesF = struct.scalarArray<double, RFloat>(.lensDistortionValues);
  static final _chromaAbCorrectionF = struct.scalarArray<double, RFloat>(.chromaAbCorrection);

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
  int get hResolution => _hResolution = _hResolutionF.readOr(op?.ptr, _hResolution);
  set hResolution(int value) => _hResolution = _hResolutionF.writeIf(op?.ptr, value);

  int _vResolution;
  /// Vertical resolution in pixels
  int get vResolution => _vResolution = _vResolutionF.readOr(op?.ptr, _vResolution);
  set vResolution(int value) => _vResolution = _vResolutionF.writeIf(op?.ptr, value);

  double _hScreenSize;
  /// Horizontal size in meters
  double get hScreenSize => _hScreenSize = _hScreenSizeF.readOr(op?.ptr, _hScreenSize);
  set hScreenSize(double value) => _hScreenSize = _hScreenSizeF.writeIf(op?.ptr, value);

  double _vScreenSize;
  /// Vertical size in meters
  double get vScreenSize => _vScreenSize = _vScreenSizeF.readOr(op?.ptr, _vScreenSize);
  set vScreenSize(double value) => _vScreenSize = _vScreenSizeF.writeIf(op?.ptr, value);

  double _eyeToScreenDistance;
  /// Distance between eye and display in meters
  double get eyeToScreenDistance => _eyeToScreenDistance = _eyeToScreenDistanceF.readOr(op?.ptr, _eyeToScreenDistance);
  set eyeToScreenDistance(double value) => _eyeToScreenDistance = _eyeToScreenDistanceF.writeIf(op?.ptr, value);

  double _lensSeparationDistance;
  /// Lens separation distance in meters
  double get lensSeparationDistance => _lensSeparationDistance = _lensSeparationDistanceF.readOr(op?.ptr, _lensSeparationDistance);
  set lensSeparationDistance(double value) => _lensSeparationDistance = _lensSeparationDistanceF.writeIf(op?.ptr, value);

  double _interpupillaryDistance;
  /// IPD (distance between pupils) in meters
  double get interpupillaryDistance => _interpupillaryDistance = _interpupillaryDistanceF.readOr(op?.ptr, _interpupillaryDistance);
  set interpupillaryDistance(double value) => _interpupillaryDistance = _interpupillaryDistanceF.writeIf(op?.ptr, value);

  late final LiveStructList<double, RFloat> _lensDistortionValues;
  /// Lens distortion constant parameters
  LiveStructList<double, RFloat> get lensDistortionValues => _lensDistortionValues;
  set lensDistortionValues(List<double> value) => _lensDistortionValues.inner = value;

  late final LiveStructList<double, RFloat> _chromaAbCorrection;
  /// Chromatic aberration correction parameters
  LiveStructList<double, RFloat> get chromaAbCorrection => _chromaAbCorrection;
  set chromaAbCorrection(List<double> value) => _chromaAbCorrection.inner = value;

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
    _lensDistortionValues = _lensDistortionValuesF.live(() => op?.ptr,
      lensDistortionValues ?? .filled(_lensDistortionValuesF.codec.type.count, 0)
    );

    _chromaAbCorrection = _chromaAbCorrectionF.live(() => op?.ptr,
      chromaAbCorrection ?? .filled(_chromaAbCorrectionF.codec.type.count, 0)
    );
  }

  factory VrDeviceInfoD.zero() => .new();

  @override
  VrDeviceInfoD setDart(VrDeviceInfoD o) {
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
  void structWriteInto(MemoryPointer p) {
    _hResolutionF.write(p, _hResolution);
    _vResolutionF.write(p, _vResolution);
    _hScreenSizeF.write(p, _hScreenSize);
    _vScreenSizeF.write(p, _vScreenSize);
    _eyeToScreenDistanceF.write(p, _eyeToScreenDistance);
    _lensSeparationDistanceF.write(p, _lensSeparationDistance);
    _interpupillaryDistanceF.write(p, _interpupillaryDistance);
    _lensDistortionValues.writeInto(p);
    _chromaAbCorrection.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _hResolution = _hResolutionF.read(p);
    _vResolution = _vResolutionF.read(p);
    _hScreenSize = _hScreenSizeF.read(p);
    _vScreenSize = _vScreenSizeF.read(p);
    _eyeToScreenDistance = _eyeToScreenDistanceF.read(p);
    _lensSeparationDistance = _lensSeparationDistanceF.read(p);
    _interpupillaryDistance = _interpupillaryDistanceF.read(p);
    _lensDistortionValues.readFrom(p);
    _chromaAbCorrection.readFrom(p);
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