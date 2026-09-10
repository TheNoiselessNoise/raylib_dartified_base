part of '../../../raylib_dartified_base.dart';

enum WaveField with StructFields {
  frameCount,
  sampleRate,
  sampleSize,
  channels,
  data,
}

/// Wave, audio wave data
class WaveD extends RaylibStruct<WaveD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<WaveField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<WaveField> struct = .aligned({
    .frameCount: RUnsignedInt(), // Total number of frames (considering channels)
    .sampleRate: RUnsignedInt(), // Frequency (samples per second)
    .sampleSize: RUnsignedInt(), // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    .channels:   RUnsignedInt(), // Number of channels (1-mono, 2-stereo, ...)
    .data:       RPointer(RVoid()), // Buffer data pointer
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<WaveD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, WaveD.new, WaveD.pointer);

  static final _frameCountF = struct.scalar<int, RUnsignedInt>(.frameCount);
  static final _sampleRateF = struct.scalar<int, RUnsignedInt>(.sampleRate);
  static final _sampleSizeF = struct.scalar<int, RUnsignedInt>(.sampleSize);
  static final _channelsF = struct.scalar<int, RUnsignedInt>(.channels);
  static final _dataF = struct.pointerUnknown<RVoid>(.data);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Computes the total number of samples for a wave with the given
  /// [frameCount] and [channels], i.e. `frameCount * channels`.
  ///
  /// Returns 0 if either argument is 0.
  static int BASE_waveLength(int frameCount, int channels) {
    if (frameCount == 0 || channels == 0) return 0;
    return frameCount * channels;
  }

  /// Total number of samples across all channels, derived from
  /// [frameCount] and [channels].
  int get waveLength => BASE_waveLength(frameCount, channels);

  /// Total number of samples the [dataBuffer] buffer can hold, derived from
  /// its byte length and [sampleSize].
  int get bufferLength => dataBuffer.lengthInBytes ~/ (sampleSize ~/ 8);

  // ░██     ░██ ░██████████░██████░██           ░██████   
  // ░██     ░██     ░██      ░██  ░██          ░██   ░██  
  // ░██     ░██     ░██      ░██  ░██         ░██         
  // ░██     ░██     ░██      ░██  ░██          ░████████  
  // ░██     ░██     ░██      ░██  ░██                 ░██ 
  //  ░██   ░██      ░██      ░██  ░██          ░██   ░██  
  //   ░██████       ░██    ░██████░██████████   ░██████   

  static ByteBuffer BASE_bufferCopy(ByteBuffer data, int sampleSize) => switch (sampleSize) {
    8  => data.asUint8List().sublist(0).buffer,
    16 => data.asInt16List().sublist(0).buffer,
    32 => data.asFloat32List().sublist(0).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

  static int BASE_bufferLength(ByteBuffer data, int sampleSize)
    => data.lengthInBytes ~/ (sampleSize ~/ 8);

  static ByteBuffer BASE_dummyData(int sampleSize, int dataLength) => switch (sampleSize) {
    8  => Uint8List(dataLength).buffer,
    16  => Int16List(dataLength).buffer,
    32  => Float32List(dataLength).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };
  
  static void BASE_dataSetList(MemoryPointer ptr, ByteBuffer src, int sampleSize, int dataLength) {
    final byteCount = dataLength * (sampleSize ~/ 8);
    final srcBytes = src.asUint8List(0, byteCount);
    ptr.cast<RUint8>().writeArray(srcBytes);
  }

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _frameCount;
  /// Total number of frames (considering channels)
  int get frameCount => _frameCount = _frameCountF.readOr(op, _frameCount);
  set frameCount(int value) => _frameCount = _frameCountF.writeIf(op, value);
  
  int _sampleRate;
  /// Frequency (samples per second)
  int get sampleRate => _sampleRate = _sampleRateF.readOr(op, _sampleRate);
  set sampleRate(int value) => _sampleRate = _sampleRateF.writeIf(op, value);

  int _sampleSize;
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  int get sampleSize => _sampleSize = _sampleSizeF.readOr(op, _sampleSize);
  set sampleSize(int value) => _sampleSize = _sampleSizeF.writeIf(op, value);

  int _channels;
  /// Number of channels (1-mono, 2-stereo, ...)
  int get channels => _channels = _channelsF.readOr(op, _channels);
  set channels(int value) => _channels = _channelsF.writeIf(op, value);

  /// Buffer data pointer
  /// 
  /// `void *data;`
  late final LivePointerSync<RVoid> _data = _dataF.live(() => op);
  MemoryPointer<RVoid> get data => _data.derefPtr();

  late ByteBuffer _dataBuffer;
  /// Raw audio buffer data
  ByteBuffer get dataBuffer => op == null ? _dataBuffer : switch (sampleSize) {
    8  => data.to<Uint8List>(waveLength).buffer,
    16 => data.to<Int16List>(waveLength).buffer,
    32 => data.to<Float32List>(waveLength).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

  bool _isNew = true;

  WaveD({
    super.op,
    int frameCount = 0,
    int sampleRate = 0,
    int sampleSize = 8, // NOTE: we can't have it as `0` due to `BASE_dummyData`
    int channels = 0,
    ByteBuffer? data,
  }) :
    _frameCount = frameCount,
    _sampleRate = sampleRate,
    _sampleSize = sampleSize,
    _channels = channels
  {
    _isNew = false;
    _dataBuffer = data ?? BASE_dummyData(sampleSize, waveLength);
  }

  factory WaveD.zero() => .new();

  @override
  WaveD setDart(WaveD o) {
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    _dataBuffer = BASE_bufferCopy(o.dataBuffer, sampleSize);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _dataF.allocate(temp, p, '${key}_data', count: _dataBuffer.lengthInBytes);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _frameCountF.write(p, _frameCount);
    _sampleRateF.write(p, _sampleRate);
    _sampleSizeF.write(p, _sampleSize);
    _channelsF.write(p, _channels);
    _data.syncInto(p);

    if (!data.isNull && _isNew) {
      _isNew = false;
      assert(waveLength <= BASE_bufferLength(_dataBuffer, sampleSize));
      BASE_dataSetList(data, _dataBuffer, sampleSize, waveLength);
    }
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _frameCount = _frameCountF.read(p);
    _sampleRate = _sampleRateF.read(p);
    _sampleSize = _sampleSizeF.read(p);
    _channels = _channelsF.read(p);
    _data.syncFrom(p);
    // NOTE: no need to sync `dataBuffer` here, it's already live
  }

  @override
  WaveD clone() => .new(
    op: op,
    frameCount: frameCount,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
    data: BASE_bufferCopy(dataBuffer, sampleSize),
  );

  @override
  String signature() => '$structName(frameCount: $frameCount, sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels, waveLength: $waveLength)';
}