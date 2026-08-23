part of '../../../raylib_dartified_base.dart';

enum ImageField {
  data,
  width,
  height,
  mipmaps,
  format,
}

/// Pixel data stored in CPU memory (RAM).
class ImageD extends RaylibStruct<ImageD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<ImageField> structLayout = .aligned(structFields);
  static final Map<ImageField, RType> structFields = {
    .data:    RPointer<RUint8>(),
    .width:   RInt32(),
    .height:  RInt32(),
    .mipmaps: RInt32(),
    .format:  RInt32(),
  };

  static StructPointer<ImageD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, ImageD.new);

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
  
  late Uint8List _data;
  MemoryPointer<RUint8> _dataPtr = MemoryPointer.nullptr.cast();
  /// Raw pixel data for the image.
  ///
  /// For single-frame images this is exactly `frameSize` bytes.
  /// 
  /// For multi-frame images (e.g. animated GIFs) this is `frameSize * frameCount` bytes.
  Uint8List get data {
    structOnOp((p) => _dataPtr = p.readPtr(structLayout.offset(.data)));
    if (!_dataPtr.isNull) _data = _dataPtr.asView<Uint8List>(dataLength);
    return _data;
  }
  set data(Uint8List value) {
    assert(value.length <= dataLength);
    _data = value;
    structOnOp((p) => _dataPtr = p.readPtr(structLayout.offset(.data)));
    if (!_dataPtr.isNull) _dataPtr.asView<Uint8List>(dataLength).setAll(0, value);
  }

  int _width;
  /// Width of the image in pixels.
  int get width {
    structOnOp((p) => _width = p.readInt32(structLayout.offset(.width)));
    return _width;
  }
  set width(int value) {
    _width = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.width)));
  }
  
  int _height;
  /// Height of the image in pixels.
  int get height {
    structOnOp((p) => _height = p.readInt32(structLayout.offset(.height)));
    return _height;
  }
  set height(int value) {
    _height = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.height)));
  }
  
  int _mipmaps;
  /// Number of mipmap levels. 1 means no mipmaps (base image only).
  int get mipmaps {
    structOnOp((p) => _mipmaps = p.readInt32(structLayout.offset(.mipmaps)));
    return _mipmaps;
  }
  set mipmaps(int value) {
    _mipmaps = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.mipmaps)));
  }
  
  PixelFormat _format;
  /// Pixel format of the image data.
  ///
  /// Must be set to a value other than [PixelFormat.PIXELFORMAT_NONE] before
  /// accessing any data structLayout properties such as [bytesPerPixel],
  /// [frameSize], or [dataLength].
  PixelFormat get format {
    structOnOp((p) => _format = .fromValue(p.readInt32(structLayout.offset(.format))));
    return _format;
  }
  set format(PixelFormat value) {
    _format = value;
    structOnOp((p) => p.writeInt32(value.value, structLayout.offset(.format)));
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
    _data = data ?? .new(dataLength);
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
    _dataPtr = temp.Uint8$.RawArray(data);
  }

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    p.writePtr(_dataPtr, structLayout.offset(.data));
    p.writeInt32(_width, structLayout.offset(.width));
    p.writeInt32(_height, structLayout.offset(.height));
    p.writeInt32(_mipmaps, structLayout.offset(.mipmaps));
    p.writeInt32(_format.value, structLayout.offset(.format));
    
    if (!_dataPtr.isNull) _dataPtr.asView<Uint8List>(dataLength).setAll(0, data);
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _dataPtr = p.readPtr(structLayout.offset(.data));
    _width = p.readInt32(structLayout.offset(.width));
    _height = p.readInt32(structLayout.offset(.height));
    _mipmaps = p.readInt32(structLayout.offset(.mipmaps));
    _format = .fromValue(p.readInt32(structLayout.offset(.format)));
    
    if (!_dataPtr.isNull) data = _dataPtr.asView<Uint8List>(dataLength);
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