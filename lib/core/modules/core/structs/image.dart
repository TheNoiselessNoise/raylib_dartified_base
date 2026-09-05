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

  @override
  StructLayout<ImageField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<ImageField> struct = .aligned({
    .data:    RPointer(RVoid()), // Image raw data
    .width:   RInt(), // Image base width
    .height:  RInt(), // Image base height
    .mipmaps: RInt(), // Mipmap levels, 1 by default
    .format:  RInt(), // Data format (PixelFormat type)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<ImageD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, ImageD.new, ImageD.pointer);

  static final _dataF = struct.pointerUnknown<RVoid>(.data);
  static final _widthF = struct.scalar<int, RInt>(.width);
  static final _heightF = struct.scalar<int, RInt>(.height);
  static final _mipmapsF = struct.scalar<int, RInt>(.mipmaps);
  static final _formatF = struct.enumValue(.format, PixelFormat.fromValue);

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
  
  Uint8List? _initialData;
  late final LivePointerSync<RVoid> _data = _dataF.live(() => op?.ptr);
  /// Image raw data
  ///
  /// For single-frame images this is exactly `frameSize` bytes.
  /// 
  /// For multi-frame images (e.g. animated GIFs) this is `frameSize * frameCount` bytes.
  MemoryPointer<RVoid> get data => _data.derefPtr();
  Uint8List get dataView => data.asView(dataLength);

  int _width;
  /// Image base width
  int get width => _width = _widthF.readOr(op?.ptr, _width);
  set width(int value) => _width = _widthF.writeIf(op?.ptr, value);

  int _height;
  /// Image base height
  int get height => _height = _heightF.readOr(op?.ptr, _height);
  set height(int value) => _height = _heightF.writeIf(op?.ptr, value);

  int _mipmaps;
  /// Mipmap levels, 1 by default
  /// 
  /// 1 means no mipmaps (base image only).
  int get mipmaps => _mipmaps = _mipmapsF.readOr(op?.ptr, _mipmaps);
  set mipmaps(int value) => _mipmaps = _mipmapsF.writeIf(op?.ptr, value);

  PixelFormat _format;
  /// Data format (PixelFormat type)
  ///
  /// Must be set to a value other than [PixelFormat.PIXELFORMAT_NONE] before
  /// accessing [bytesPerPixel], [frameSize], or [dataLength].
  PixelFormat get format => _format = _formatF.readOr(op?.ptr, _format);
  set format(PixelFormat value) => _format = _formatF.writeIf(op?.ptr, value);

  /// Number of frames in the image.
  ///
  /// Always 1 for static images. Greater than 1 for animated formats such as GIF.
  ///
  /// Setting this value also updates the `data` according to [dataLength].
  int frameCount = 1;

  ImageD({
    super.op,
    Uint8List? data,
    int width = 0,
    int height = 0,
    int mipmaps = 0,
    PixelFormat format = .PIXELFORMAT_NONE,
  }) :
    _initialData = data,
    _width = width,
    _height = height,
    _mipmaps = mipmaps,
    _format = format;

  factory ImageD.zero() => .new();

  @override
  ImageD setDart(ImageD o) {
    width = o.width;
    height = o.height;
    mipmaps = o.mipmaps;
    format = o.format;
    data.copyBytesFrom(o.data, o.dataLength);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    _dataF.allocate(temp, p, '${key}_data', count: _initialData?.length ?? dataLength, raw: true);

    if (_initialData != null) {
      _data.derefPtr<RUint8>().writeArray(_initialData!);
      _initialData = null;
    }
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _data.writeInto(p);
    _widthF.write(p, _width);
    _heightF.write(p, _height);
    _mipmapsF.write(p, _mipmaps);
    _formatF.write(p, _format);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _data.readFrom(p);
    _width = _widthF.read(p);
    _height = _heightF.read(p);
    _mipmaps = _mipmapsF.read(p);
    _format = _formatF.read(p);
  }

  @override
  ImageD clone() => .new(
    op: op,
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: format,
    data: .fromList(dataView),
  );

  @override
  String signature() => '$structName(data: $dataLength, width: $width, height: $height, mipmaps: $mipmaps, format: ${format.name})';
}