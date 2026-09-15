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

  static final field_hResolution = struct.scalar<int, RInt>(.hResolution);
  static final field_vResolution = struct.scalar<int, RInt>(.vResolution);
  static final field_hScreenSize = struct.scalar<double, RFloat>(.hScreenSize);
  static final field_vScreenSize = struct.scalar<double, RFloat>(.vScreenSize);
  static final field_eyeToScreenDistance = struct.scalar<double, RFloat>(.eyeToScreenDistance);
  static final field_lensSeparationDistance = struct.scalar<double, RFloat>(.lensSeparationDistance);
  static final field_interpupillaryDistance = struct.scalar<double, RFloat>(.interpupillaryDistance);
  static final field_lensDistortionValues = struct.scalarArray<double, RFloat>(.lensDistortionValues);
  static final field_chromaAbCorrection = struct.scalarArray<double, RFloat>(.chromaAbCorrection);

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
  int get hResolution => _hResolution = field_hResolution.readOr(op, _hResolution);
  set hResolution(int value) => _hResolution = field_hResolution.writeIf(op, value);

  int _vResolution;
  /// Vertical resolution in pixels
  int get vResolution => _vResolution = field_vResolution.readOr(op, _vResolution);
  set vResolution(int value) => _vResolution = field_vResolution.writeIf(op, value);

  double _hScreenSize;
  /// Horizontal size in meters
  double get hScreenSize => _hScreenSize = field_hScreenSize.readOr(op, _hScreenSize);
  set hScreenSize(double value) => _hScreenSize = field_hScreenSize.writeIf(op, value);

  double _vScreenSize;
  /// Vertical size in meters
  double get vScreenSize => _vScreenSize = field_vScreenSize.readOr(op, _vScreenSize);
  set vScreenSize(double value) => _vScreenSize = field_vScreenSize.writeIf(op, value);

  double _eyeToScreenDistance;
  /// Distance between eye and display in meters
  double get eyeToScreenDistance => _eyeToScreenDistance = field_eyeToScreenDistance.readOr(op, _eyeToScreenDistance);
  set eyeToScreenDistance(double value) => _eyeToScreenDistance = field_eyeToScreenDistance.writeIf(op, value);

  double _lensSeparationDistance;
  /// Lens separation distance in meters
  double get lensSeparationDistance => _lensSeparationDistance = field_lensSeparationDistance.readOr(op, _lensSeparationDistance);
  set lensSeparationDistance(double value) => _lensSeparationDistance = field_lensSeparationDistance.writeIf(op, value);

  double _interpupillaryDistance;
  /// IPD (distance between pupils) in meters
  double get interpupillaryDistance => _interpupillaryDistance = field_interpupillaryDistance.readOr(op, _interpupillaryDistance);
  set interpupillaryDistance(double value) => _interpupillaryDistance = field_interpupillaryDistance.writeIf(op, value);

  late final StructLiveList<double, RFloat> _lensDistortionValues;
  /// Lens distortion constant parameters
  StructLiveList<double, RFloat> get lensDistortionValues => _lensDistortionValues;
  set lensDistortionValues(List<double> value) => _lensDistortionValues.inner = value;

  late final StructLiveList<double, RFloat> _chromaAbCorrection;
  /// Chromatic aberration correction parameters
  StructLiveList<double, RFloat> get chromaAbCorrection => _chromaAbCorrection;
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
    _lensDistortionValues = field_lensDistortionValues.live(() => op,
      lensDistortionValues ?? .filled(field_lensDistortionValues.codec.type.count, 0)
    );

    _chromaAbCorrection = field_chromaAbCorrection.live(() => op,
      chromaAbCorrection ?? .filled(field_chromaAbCorrection.codec.type.count, 0)
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
    field_hResolution.write(p, _hResolution);
    field_vResolution.write(p, _vResolution);
    field_hScreenSize.write(p, _hScreenSize);
    field_vScreenSize.write(p, _vScreenSize);
    field_eyeToScreenDistance.write(p, _eyeToScreenDistance);
    field_lensSeparationDistance.write(p, _lensSeparationDistance);
    field_interpupillaryDistance.write(p, _interpupillaryDistance);
    _lensDistortionValues.writeInto(p);
    _chromaAbCorrection.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _hResolution = field_hResolution.read(p);
    _vResolution = field_vResolution.read(p);
    _hScreenSize = field_hScreenSize.read(p);
    _vScreenSize = field_vScreenSize.read(p);
    _eyeToScreenDistance = field_eyeToScreenDistance.read(p);
    _lensSeparationDistance = field_lensSeparationDistance.read(p);
    _interpupillaryDistance = field_interpupillaryDistance.read(p);
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