part of '../../../raylib_dartified_base.dart';

enum WaveField {
  frameCount,
  sampleRate,
  sampleSize,
  channels,
  data,
}

/// Audio wave data.
class WaveD extends RaylibStruct<WaveD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<WaveField> structLayout = .aligned(structFields);
  static final Map<WaveField, RType> structFields = {
    .frameCount: RUint32(),
    .sampleRate: RUint32(),
    .sampleSize: RUint32(),
    .channels:   RUint32(),
    .data:       RPointer<RVoid>(),
  };

  static StructPointer<WaveD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, WaveD.new);

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

  /// Total number of samples the [data] buffer can hold, derived from
  /// its byte length and [sampleSize].
  int get bufferLength => data.lengthInBytes ~/ (sampleSize ~/ 8);

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

  static ByteBuffer BASE_dataToBuffer(MemoryPointer<RVoid> data, int sampleSize, int waveLength) => switch (sampleSize) {
    8  => data.to<Uint8List>(waveLength).buffer,
    16 => data.to<Int16List>(waveLength).buffer,
    32 => data.to<Float32List>(waveLength).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

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

  static ByteBuffer BASE_dataToBufferOrZero(MemoryPointer<RVoid> data, int sampleSize, int waveLength)
    => !data.isNull
      ? BASE_dataToBuffer(data, sampleSize, waveLength)
      : BASE_dummyData(sampleSize, waveLength);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Total number of frames (considering channels)
  int frameCount;
  
  /// Frequency (samples per second)
  int sampleRate;
  
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  int sampleSize;
  
  /// Number of channels (1-mono, 2-stereo, ...)
  int channels;
  
  /// Raw audio buffer data
  late ByteBuffer data;

  MemoryPointer<RVoid> _dataPtr = MemoryPointer.nullptr;

  WaveD({
    super.op,
    this.frameCount = 0,
    this.sampleRate = 0,
    this.sampleSize = 8,
    this.channels = 0,
    ByteBuffer? data,
  }) {
    this.data = data ?? BASE_dummyData(sampleSize, waveLength);
  }

  factory WaveD.zero() => .new();

  @override
  WaveD setD(WaveD o) {
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    data = BASE_bufferCopy(o.data, sampleSize);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {
    if (data.lengthInBytes > 0) _dataPtr = switch (sampleSize) {
     8  => temp.Uint8$.Array(data.asUint8List(), key: '${key}_data').cast(),
     16 => temp.Int16$.Array(data.asInt16List(), key: '${key}_data').cast(),
     32 => temp.Float32$.Array(data.asFloat32List(), key: '${key}_data').cast(),
      _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
    };
  }

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeUint32(frameCount, structLayout.offset(.frameCount));
    p.writeUint32(sampleRate, structLayout.offset(.sampleRate));
    p.writeUint32(sampleSize, structLayout.offset(.sampleSize));
    p.writeUint32(channels, structLayout.offset(.channels));
    p.writePtr(_dataPtr, structLayout.offset(.data));

    if (!_dataPtr.isNull) {
      assert(waveLength <= BASE_bufferLength(data, sampleSize));
      BASE_dataSetList(_dataPtr, data, sampleSize, waveLength);
    }
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    frameCount = p.readUint32(structLayout.offset(.frameCount));
    sampleRate = p.readUint32(structLayout.offset(.sampleRate));
    sampleSize = p.readUint32(structLayout.offset(.sampleSize));
    channels = p.readUint32(structLayout.offset(.channels));
    _dataPtr = p.readPtr(structLayout.offset(.data));

    if (!_dataPtr.isNull) data = switch (sampleSize) {
      8  => _dataPtr.to<Uint8List>(waveLength).buffer,
      16 => _dataPtr.to<Int16List>(waveLength).buffer,
      32 => _dataPtr.to<Float32List>(waveLength).buffer,
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
    data: BASE_bufferCopy(data, sampleSize),
  );

  @override
  String signature() => '$structName(frameCount: $frameCount, sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels, waveLength: $waveLength)';
}