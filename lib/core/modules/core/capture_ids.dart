part of '../../raylib_dartified_base.dart';

/// Produces stable slot key strings identifying the allocation origin of each
/// Core module function's captured Struct.
class RaylibCoreModuleCaptureIds {
    
  String GetClipboardImage() => 'GetClipboardImage';
    
  String LoadVrStereoConfig(
    VrDeviceInfoBase device,
  ) => 'LoadVrStereoConfig_${device.$state.internalId}';
    
  String LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => 'LoadShader_${vsFileName ?? 'default'}_${fsFileName ?? 'default'}';
    
  String LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => 'LoadShaderFromMemory';
    
  String LoadDirectoryFiles(
    String dirPath,
  ) => 'LoadDirectoryFiles_$dirPath';
    
  String LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'LoadDirectoryFilesEx_$basePath';
    
  String LoadDroppedFiles() => 'LoadDroppedFiles';
    
  String LoadAutomationEventList(
    String? fileName,
  ) => 'LoadAutomationEventList_$fileName';

  String LoadImage(
    String fileName,
  ) => 'LoadImage_$fileName';
    
  String LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => 'LoadImageRaw_${fileName}_${width}_${height}_$format';

  String LoadImageAnim(
    String fileName,
  ) => 'LoadImageAnim_$fileName';

  String LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageAnimFromMemory_$fileType';

  String LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageFromMemory_$fileType';

  String LoadImageFromTexture(
    TextureBase texture,
  ) => 'LoadImageFromTexture_${texture.id}_${texture.width}_${texture.height}';

  String LoadImageFromScreen() => 'LoadImageFromScreen';

  String GenImageColor(
    num width,
    num height,
    ColorBase color,
  ) => 'GenImageColor_${width}_$height';

  String GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorBase start,
    ColorBase end,
  ) => 'GenImageGradientLinear_${width}_$height';

  String GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorBase inner,
    ColorBase outer,
  ) => 'GenImageGradientRadial_${width}_$height';

  String GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorBase inner,
    ColorBase outer,
  ) => 'GenImageGradientSquare_${width}_$height';

  String GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorBase col1,
    ColorBase col2,
  ) => 'GenImageChecked_${width}_$height';

  String GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => 'GenImageWhiteNoise_${width}_$height';

  String GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => 'GenImagePerlinNoise_${width}_$height';
    
  String GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => 'GenImageCellular_${width}_$height';

  String GenImageText(
    num width,
    num height,
    String text,
  ) => 'GenImageText_${width}_$height';

  String ImageCopy(
    ImageBase image,
  ) => 'ImageCopy_${image.$state.internalId}';

  String ImageFromImage(
    ImageBase image,
    RectangleBase rec,
  ) => 'ImageFromImage_${image.$state.internalId}';

  String ImageFromChannel(
    ImageBase image,
    num selectedChannel,
  ) => 'ImageFromChannel_${image.$state.internalId}';

  String ImageText(
    String text,
    num fontSize,
    ColorBase color,
  ) => 'ImageText';

  String ImageTextEx(
    FontBase font,
    String text,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'ImageTextEx_${font.$state.internalId}';

  String LoadTexture(
    String fileName,
  ) => 'LoadTexture_$fileName';

  String LoadTextureFromImage(
    ImageBase image,
  ) => 'LoadTextureFromImage_${image.$state.internalId}';

  String LoadTextureCubemap(
    ImageBase image,
    CubemapLayout layout,
  ) => 'LoadTextureCubemap_${image.$state.internalId}';

  String LoadRenderTexture(
    num width,
    num height,
  ) => 'LoadRenderTexture';

  String GetFontDefault() => 'GetFontDefault';

  String LoadFont(
    String fileName,
  ) => 'LoadFont_$fileName';
    
  String LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codePointCount
    ]
  ) => 'LoadFontEx_$fileName';

  String LoadFontFromImage(
    ImageBase image,
    ColorBase key,
    num firstChar,
  ) => 'LoadFontFromImage_${image.$state.internalId}';

  String LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => 'LoadFontFromMemory_$fileType';

  String GenImageFontAtlas(
    List<GlyphInfoBase> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => 'GenImageFontAtlas';
    
  String LoadModel(
    String fileName,
  ) => 'LoadModel_$fileName';
    
  String LoadModelFromMesh(
    MeshBase mesh,
  ) => 'LoadModelFromMesh_${mesh.$state.internalId}';
    
  String GenMeshPoly(
    num sides,
    num radius,
  ) => 'GenMeshPoly';
    
  String GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => 'GenMeshPlane';
    
  String GenMeshCube(
    num width,
    num height,
    num length,
  ) => 'GenMeshCube';
    
  String GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshSphere';
    
  String GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshHemiSphere';
    
  String GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCylinder';
    
  String GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCone';
    
  String GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshTorus';
    
  String GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshKnot';
    
  String GenMeshHeightmap(
    ImageBase heightmap,
    Vector3Base size,
  ) => 'GenMeshHeightmap_${heightmap.$state.internalId}';
    
  String GenMeshCubicmap(
    ImageBase cubicmap,
    Vector3Base cubeSize,
  ) => 'GenMeshCubicmap_${cubicmap.$state.internalId}';
    
  String LoadMaterialDefault() => 'LoadMaterialDefault';
  
}
