part of '../../../raylib_dartified_base.dart';

enum AudioStreamField with StructFields {
  buffer,
  processor,
  sampleRate,
  sampleSize,
  channels,
}

/// AudioStream, custom audio stream
class AudioStreamD extends RaylibStruct<AudioStreamD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<AudioStreamField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<AudioStreamField> struct = .aligned({
    .buffer:     RPointer(ROpaque()), // Pointer to internal data used by the audio system
    .processor:  RPointer(ROpaque()), // Pointer to internal data processor, useful for audio effects
    .sampleRate: RUnsignedInt(), // Frequency (samples per second)
    .sampleSize: RUnsignedInt(), // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    .channels:   RUnsignedInt(), // Number of channels (1-mono, 2-stereo, ...)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<AudioStreamD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, AudioStreamD.new, AudioStreamD.pointer);

  static final field_buffer = struct.pointerUnknown<ROpaque>(.buffer);
  static final field_processor = struct.pointerUnknown<ROpaque>(.processor);
  static final field_sampleRate = struct.scalar<int, RUnsignedInt>(.sampleRate);
  static final field_sampleSize = struct.scalar<int, RUnsignedInt>(.sampleSize);
  static final field_channels = struct.scalar<int, RUnsignedInt>(.channels);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Pointer to internal data used by the audio system
  /// 
  /// `rAudioBuffer *buffer;`
  late final LivePointerSync<ROpaque> _buffer = field_buffer.live(() => op);
  MemoryPointer<ROpaque> get buffer => _buffer.derefPtr();

  /// Pointer to internal data processor, useful for audio effects
  /// 
  /// `rAudioProcessor *processor;`
  late final LivePointerSync<ROpaque> _processor = field_processor.live(() => op);
  MemoryPointer<ROpaque> get processor => _processor.derefPtr();

  int _sampleRate;
  /// Frequency (samples per second)
  int get sampleRate => _sampleRate = field_sampleRate.readOr(op, _sampleRate);
  set sampleRate(int value) => _sampleRate = field_sampleRate.writeIf(op, value);

  int _sampleSize;
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  int get sampleSize => _sampleSize = field_sampleSize.readOr(op, _sampleSize);
  set sampleSize(int value) => _sampleSize = field_sampleSize.writeIf(op, value);

  int _channels;
  /// Number of channels (1-mono, 2-stereo, ...)
  int get channels => _channels = field_channels.readOr(op, _channels);
  set channels(int value) => _channels = field_channels.writeIf(op, value);

  AudioStreamD({
    super.op,
    int sampleRate = 0,
    int sampleSize = 0,
    int channels = 0,
  }) :
    _sampleRate = sampleRate,
    _sampleSize = sampleSize,
    _channels = channels;

  factory AudioStreamD.zero() => .new();

  @override
  AudioStreamD setDart(AudioStreamD o)
    => throw UnsupportedError('$runtimeType cannot support `setDart` method.');

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_buffer.allocate(temp, p, '${key}_buffer');
    field_processor.allocate(temp, p, '${key}_processor');
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _buffer.syncInto(p);
    _processor.syncInto(p);
    field_sampleRate.write(p, _sampleRate);
    field_sampleSize.write(p, _sampleSize);
    field_channels.write(p, _channels);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _buffer.syncFrom(p);
    _processor.syncFrom(p);
    _sampleRate = field_sampleRate.read(p);
    _sampleSize = field_sampleSize.read(p);
    _channels = field_channels.read(p);
  }

  @override
  AudioStreamD clone() => .new(
    op: op,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
  );

  @override
  String signature() => '$structName(sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels)';
}