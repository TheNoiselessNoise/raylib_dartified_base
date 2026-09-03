part of '../../../raylib_dartified_base.dart';

enum WaveField with StructFields {
  frameCount,
  sampleRate,
  sampleSize,
  channels,
  data,
}

// TODO: translate

/// Wave, audio wave data
class WaveD extends RaylibStruct<WaveD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

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
  
  static void BASE_dataSetList(MemoryPointer<RVoid> ptr, ByteBuffer src, int sampleSize, int dataLength) {
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
  int get frameCount {
    structOnOp((p) => _frameCount = p.readUnsignedInt(struct.offset(.frameCount)));
    return _frameCount;
  }
  set frameCount(int value) {
    _frameCount = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.frameCount)));
  }
  
  int _sampleRate;
  /// Frequency (samples per second)
  int get sampleRate {
    structOnOp((p) => _sampleRate = p.readUnsignedInt(struct.offset(.sampleRate)));
    return _sampleRate;
  }
  set sampleRate(int value) {
    _sampleRate = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.sampleRate)));
  }
  
  int _sampleSize;
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  int get sampleSize {
    structOnOp((p) => _sampleSize = p.readUnsignedInt(struct.offset(.sampleSize)));
    return _sampleSize;
  }
  set sampleSize(int value) {
    _sampleSize = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.sampleSize)));
  }
  
  int _channels;
  /// Number of channels (1-mono, 2-stereo, ...)
  int get channels {
    structOnOp((p) => _channels = p.readUnsignedInt(struct.offset(.channels)));
    return _channels;
  }
  set channels(int value) {
    _channels = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.channels)));
  }
  
  /// Raw audio buffer data
  late ByteBuffer dataBuffer;

  /// Buffer data pointer
  /// 
  /// `void *data;`
  MemoryPointer<RVoid> data = MemoryPointer.nullptr;

  WaveD({
    super.op,
    int frameCount = 0,
    int sampleRate = 0,
    int sampleSize = 0,
    int channels = 0,
    ByteBuffer? data,
  }) :
    _frameCount = frameCount,
    _sampleRate = sampleRate,
    _sampleSize = sampleSize,
    _channels = channels
  {
    dataBuffer = data ?? BASE_dummyData(sampleSize, waveLength);
  }

  factory WaveD.zero() => .new();

  @override
  WaveD setDart(WaveD o) {
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    dataBuffer = BASE_bufferCopy(o.dataBuffer, sampleSize);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    if (dataBuffer.lengthInBytes > 0) data = switch (sampleSize) {
     8  => temp.Uint8$.Array(dataBuffer.asUint8List(), key: '${key}_data').cast(),
     16 => temp.Int16$.Array(dataBuffer.asInt16List(), key: '${key}_data').cast(),
     32 => temp.Float32$.Array(dataBuffer.asFloat32List(), key: '${key}_data').cast(),
      _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
    };
  }

  @override
  void structWriteInto(MemoryPointer p) {
    p.writeUnsignedInt(_frameCount, struct.offset(.frameCount));
    p.writeUnsignedInt(_sampleRate, struct.offset(.sampleRate));
    p.writeUnsignedInt(_sampleSize, struct.offset(.sampleSize));
    p.writeUnsignedInt(_channels, struct.offset(.channels));
    p.writePtr(data, struct.offset(.data));

    if (!data.isNull) {
      assert(waveLength <= BASE_bufferLength(dataBuffer, sampleSize));
      BASE_dataSetList(data, dataBuffer, sampleSize, waveLength);
    }
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _frameCount = p.readUnsignedInt(struct.offset(.frameCount));
    _sampleRate = p.readUnsignedInt(struct.offset(.sampleRate));
    _sampleSize = p.readUnsignedInt(struct.offset(.sampleSize));
    _channels = p.readUnsignedInt(struct.offset(.channels));
    data = p.readPtr(struct.offset(.data));

    if (!data.isNull) dataBuffer = switch (sampleSize) {
      8  => data.to<Uint8List>(waveLength).buffer,
      16 => data.to<Int16List>(waveLength).buffer,
      32 => data.to<Float32List>(waveLength).buffer,
      _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
    };
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