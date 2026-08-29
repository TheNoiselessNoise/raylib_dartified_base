part of '../../../raylib_dartified_base.dart';

enum ImageField with StructFields {
  data,
  width,
  height,
  mipmaps,
  format,
}

/// Image, pixel data stored in CPU memory (RAM)
class ImageD extends RaylibStruct<ImageD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<ImageField> structLayout = .aligned({
    .data:    RPointer<RVoid>(), // Image raw data
    .width:   RInt(), // Image base width
    .height:  RInt(), // Image base height
    .mipmaps: RInt(), // Mipmap levels, 1 by default
    .format:  RInt(), // Data format (PixelFormat type)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<ImageD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, ImageD.new, ImageD.pointer);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Returns the number of bytes per pixel for the given [format].
  ///
  /// Throws a [StateError] if [format] is [PixelFormat.PIXELFORMAT_NONE],
  /// and an [UnsupportedError] for compressed formats which have no fixed
  /// bytes-per-pixel value.
  static int BASE_bytesPerPixel(PixelFormat format) => switch (format) {
    .PIXELFORMAT_NONE => throw StateError('Cannot compute bytes per pixel for PIXELFORMAT_NONE'),
    .PIXELFORMAT_UNCOMPRESSED_GRAYSCALE => 1,
    .PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA => 2,
    .PIXELFORMAT_UNCOMPRESSED_R5G6B5 => 2,
    .PIXELFORMAT_UNCOMPRESSED_R8G8B8 => 3,
    .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 => 4,
    .PIXELFORMAT_UNCOMPRESSED_R32 => 4,
    .PIXELFORMAT_UNCOMPRESSED_R32G32B32 => 12,
    .PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 => 16,
    .PIXELFORMAT_UNCOMPRESSED_R16 => 2,
    .PIXELFORMAT_UNCOMPRESSED_R16G16B16 => 6,
    .PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 => 8,
    _ => throw UnsupportedError('Compressed formats have no simple bpp: $format'),
  };

  /// Returns the total byte length of all image data across all frames.
  ///
  /// Returns 0 if [frameSize] is 0 (i.e. width or height is 0).
  static int BASE_dataLength(int frameSize, int frameCount) {
    if (frameSize == 0) return 0;
    return frameSize * frameCount;
  }

  /// Returns the byte size of a single frame.
  ///
  /// Returns 0 if either [width] or [height] is 0.
  ///
  /// Throws a [StateError] if [format] is [PixelFormat.PIXELFORMAT_NONE].
  static int BASE_frameSize(int width, int height, PixelFormat format) {
    if (width == 0 || height == 0) return 0;
    if (format == .PIXELFORMAT_NONE) throw StateError('Image format must be set before accessing data layout');
    return width * height * BASE_bytesPerPixel(format);
  }

  /// Number of bytes per pixel, derived from [format].
  ///
  /// See [BASE_bytesPerPixel] for supported formats and error conditions.
  int get bytesPerPixel => BASE_bytesPerPixel(format);

  /// Total byte length of [data], equal to [frameSize] * [frameCount].
  ///
  /// Returns 0 if [width] or [height] is 0.
  int get dataLength => BASE_dataLength(frameSize, frameCount);

  /// Byte size of a single frame, equal to [width] * [height] * [bytesPerPixel].
  ///
  /// Returns 0 if [width] or [height] is 0.
  int get frameSize => BASE_frameSize(width, height, format);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  late LiveListPointerScalar<int, RUint8> _data;
  /// Image raw data
  ///
  /// For single-frame images this is exactly `frameSize` bytes.
  /// 
  /// For multi-frame images (e.g. animated GIFs) this is `frameSize * frameCount` bytes.
  LiveListPointerScalar<int, RUint8> get data {
    structOnOp((p) => _data.ptr = p.readPtr(structLayout.offset(.data)));
    return _data;
  }
  set data(Uint8List value) {
    assert(value.length <= dataLength);
    structOnOp((p) => _data.ptr = p.readPtr(structLayout.offset(.data)));
    _data.inner = value;
  }

  int _width;
  /// Image base width
  int get width {
    structOnOp((p) => _width = p.readInt(structLayout.offset(.width)));
    return _width;
  }
  set width(int value) {
    _width = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.width)));
  }
  
  int _height;
  /// Image base height
  int get height {
    structOnOp((p) => _height = p.readInt(structLayout.offset(.height)));
    return _height;
  }
  set height(int value) {
    _height = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.height)));
  }
  
  int _mipmaps;
  /// Mipmap levels, 1 by default
  /// 
  /// 1 means no mipmaps (base image only).
  int get mipmaps {
    structOnOp((p) => _mipmaps = p.readInt(structLayout.offset(.mipmaps)));
    return _mipmaps;
  }
  set mipmaps(int value) {
    _mipmaps = value;
    structOnOp((p) => p.writeInt(value, structLayout.offset(.mipmaps)));
  }
  
  PixelFormat _format;
  /// Data format (PixelFormat type)
  ///
  /// Must be set to a value other than [PixelFormat.PIXELFORMAT_NONE] before
  /// accessing [bytesPerPixel], [frameSize], or [dataLength].
  PixelFormat get format {
    structOnOp((p) => _format = .fromValue(p.readInt(structLayout.offset(.format))));
    return _format;
  }
  set format(PixelFormat value) {
    _format = value;
    structOnOp((p) => p.writeInt(value.value, structLayout.offset(.format)));
  }

  int _frameCount = 1;
  /// Number of frames in the image.
  ///
  /// Always 1 for static images. Greater than 1 for animated formats such as GIF.
  ///
  /// Setting this value also updates the `data` according to [dataLength].
  int get frameCount => _frameCount;
  set frameCount(int value) {
    _frameCount = frameCount;
    structOnOp((p) => data = p.asView<Uint8List>(dataLength));
  }

  ImageD({
    super.op,
    Uint8List? data,
    int width = 0,
    int height = 0,
    int mipmaps = 0,
    PixelFormat format = .PIXELFORMAT_NONE,
  }) :
    _width = width,
    _height = height,
    _mipmaps = mipmaps,
    _format = format 
  {
    _data = .new(
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      data ?? .filled(dataLength, 0),
      op?.offsetBy(structLayout.offset(.data)),
    );
  }

  factory ImageD.zero() => .new();

  @override
  ImageD setD(ImageD o) {
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    data = .fromList(o.data);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {
    _data.ptr = temp.Uint8$.RawArray(data.inner);
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writePtr(_data.ptr, structLayout.offset(.data));
    p.writeInt(_width, structLayout.offset(.width));
    p.writeInt(_height, structLayout.offset(.height));
    p.writeInt(_mipmaps, structLayout.offset(.mipmaps));
    p.writeInt(_format.value, structLayout.offset(.format));
    
    _data.onPointer((p) => p.writeArray(_data.inner));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _data.ptr = p.readPtr(structLayout.offset(.data));
    _width = p.readInt(structLayout.offset(.width));
    _height = p.readInt(structLayout.offset(.height));
    _mipmaps = p.readInt(structLayout.offset(.mipmaps));
    _format = .fromValue(p.readInt(structLayout.offset(.format)));
    
    _data.onPointer((p) => _data.raw = p.readArray(dataLength));
  }

  @override
  ImageD clone() => .new(
    op: op,
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: format,
    data: .fromList(data),
  );

  @override
  String signature() => '$structName(data: ${data.length}, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';
}