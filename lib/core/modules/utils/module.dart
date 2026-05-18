part of '../../raylib_dartified_base.dart';

abstract class RaylibUtilsModuleBase<R extends RaylibBase> extends RaylibModule<R> {

  RaylibUtilsModuleBase(super.rl);

  int get md5Uint32HashLength => 4; 
  int get sha1Uint32HashLength => 5; 
  int get sha256Uint32HashLength => 8;

  int EnumsAsFlagsOr(Iterable<RaylibEnum> values) {
    return values
      .map((e) => e.value)
      .fold(0, (acc, e) => acc | e);
  }

  int GetPixelDataSize(int width, int height, PixelFormat format)
  {
    int sizeInBytes = 0;
    int bpp = 0;

    switch (format)
    {
      case .PIXELFORMAT_NONE: return 0;
      case .PIXELFORMAT_UNCOMPRESSED_GRAYSCALE: bpp = 8; break;
      case .PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA:
      case .PIXELFORMAT_UNCOMPRESSED_R5G6B5:
      case .PIXELFORMAT_UNCOMPRESSED_R5G5B5A1:
      case .PIXELFORMAT_UNCOMPRESSED_R4G4B4A4: bpp = 16; break;
      case .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8: bpp = 32; break;
      case .PIXELFORMAT_UNCOMPRESSED_R8G8B8: bpp = 24; break;
      case .PIXELFORMAT_UNCOMPRESSED_R32: bpp = 32; break;
      case .PIXELFORMAT_UNCOMPRESSED_R32G32B32: bpp = 32*3; break;
      case .PIXELFORMAT_UNCOMPRESSED_R32G32B32A32: bpp = 32*4; break;
      case .PIXELFORMAT_UNCOMPRESSED_R16: bpp = 16; break;
      case .PIXELFORMAT_UNCOMPRESSED_R16G16B16: bpp = 16*3; break;
      case .PIXELFORMAT_UNCOMPRESSED_R16G16B16A16: bpp = 16*4; break;
      case .PIXELFORMAT_COMPRESSED_DXT1_RGB:
      case .PIXELFORMAT_COMPRESSED_DXT1_RGBA:
      case .PIXELFORMAT_COMPRESSED_ETC1_RGB:
      case .PIXELFORMAT_COMPRESSED_ETC2_RGB:
      case .PIXELFORMAT_COMPRESSED_PVRT_RGB:
      case .PIXELFORMAT_COMPRESSED_PVRT_RGBA: bpp = 4; break;
      case .PIXELFORMAT_COMPRESSED_DXT3_RGBA:
      case .PIXELFORMAT_COMPRESSED_DXT5_RGBA:
      case .PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA:
      case .PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA: bpp = 8; break;
      case .PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA: bpp = 2; break;
    }

    num bytesPerPixel = bpp/8.0;
    sizeInBytes = (bytesPerPixel*width*height).toInt();

    if ((width < 4) && (height < 4))
    {
      if (
        format >= PixelFormat.PIXELFORMAT_COMPRESSED_DXT1_RGB &&
        format < PixelFormat.PIXELFORMAT_COMPRESSED_DXT3_RGBA
      ) sizeInBytes = 8;
      else if (
        format >= PixelFormat.PIXELFORMAT_COMPRESSED_DXT3_RGBA &&
        format < PixelFormat.PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA
      ) sizeInBytes = 16;
    }

    return sizeInBytes;
  }

}
