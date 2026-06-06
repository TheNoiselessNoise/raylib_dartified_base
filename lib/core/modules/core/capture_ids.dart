part of '../../raylib_dartified_base.dart';

/// Produces stable slot key strings identifying the allocation origin of each
/// Core module function's captured Struct.
class RaylibCoreModuleCaptureIds {
    
  /// Capture ID for [RaylibCoreModuleBase.GetClipboardImage].
  String GetClipboardImage() => 'GetClipboardImage';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadVrStereoConfig].
  String LoadVrStereoConfig(
    VrDeviceInfoBase device,
  ) => 'LoadVrStereoConfig_${device.$state.internalId}';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadShader].
  String LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => 'LoadShader_${vsFileName ?? 'default'}_${fsFileName ?? 'default'}';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadShaderFromMemory].
  String LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => 'LoadShaderFromMemory';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadDirectoryFiles].
  String LoadDirectoryFiles(
    String dirPath,
  ) => 'LoadDirectoryFiles_$dirPath';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadDirectoryFilesEx].
  String LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'LoadDirectoryFilesEx_$basePath';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadDroppedFiles].
  String LoadDroppedFiles() => 'LoadDroppedFiles';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadAutomationEventList].
  String LoadAutomationEventList(
    String? fileName,
  ) => 'LoadAutomationEventList_$fileName';

  /// Capture ID for [RaylibCoreModuleBase.LoadImage].
  String LoadImage(
    String fileName,
  ) => 'LoadImage_$fileName';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadImageRaw].
  String LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => 'LoadImageRaw_${fileName}_${width}_${height}_$format';

  /// Capture ID for [RaylibCoreModuleBase.LoadImageAnim].
  String LoadImageAnim(
    String fileName,
  ) => 'LoadImageAnim_$fileName';

  /// Capture ID for [RaylibCoreModuleBase.LoadImageAnimFromMemory].
  String LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageAnimFromMemory_$fileType';

  /// Capture ID for [RaylibCoreModuleBase.LoadImageFromMemory].
  String LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageFromMemory_$fileType';

  /// Capture ID for [RaylibCoreModuleBase.LoadImageFromTexture].
  String LoadImageFromTexture(
    TextureBase texture,
  ) => 'LoadImageFromTexture_${texture.id}_${texture.width}_${texture.height}';

  /// Capture ID for [RaylibCoreModuleBase.LoadImageFromScreen].
  String LoadImageFromScreen() => 'LoadImageFromScreen';

  /// Capture ID for [RaylibCoreModuleBase.GenImageColor].
  String GenImageColor(
    num width,
    num height,
    ColorBase color,
  ) => 'GenImageColor_${width}_$height';

  /// Capture ID for [RaylibCoreModuleBase.GenImageGradientLinear].
  String GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorBase start,
    ColorBase end,
  ) => 'GenImageGradientLinear_${width}_$height';

  /// Capture ID for [RaylibCoreModuleBase.GenImageGradientRadial].
  String GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorBase inner,
    ColorBase outer,
  ) => 'GenImageGradientRadial_${width}_$height';

  /// Capture ID for [RaylibCoreModuleBase.GenImageGradientSquare].
  String GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorBase inner,
    ColorBase outer,
  ) => 'GenImageGradientSquare_${width}_$height';

  /// Capture ID for [RaylibCoreModuleBase.GenImageChecked].
  String GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorBase col1,
    ColorBase col2,
  ) => 'GenImageChecked_${width}_$height';

  /// Capture ID for [RaylibCoreModuleBase.GenImageWhiteNoise].
  String GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => 'GenImageWhiteNoise_${width}_$height';

  /// Capture ID for [RaylibCoreModuleBase.GenImagePerlinNoise].
  String GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => 'GenImagePerlinNoise_${width}_$height';
    
  /// Capture ID for [RaylibCoreModuleBase.GenImageCellular].
  String GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => 'GenImageCellular_${width}_$height';

  /// Capture ID for [RaylibCoreModuleBase.GenImageText].
  String GenImageText(
    num width,
    num height,
    String text,
  ) => 'GenImageText_${width}_$height';

  /// Capture ID for [RaylibCoreModuleBase.ImageCopy].
  String ImageCopy(
    ImageBase image,
  ) => 'ImageCopy_${image.$state.internalId}';

  /// Capture ID for [RaylibCoreModuleBase.ImageFromImage].
  String ImageFromImage(
    ImageBase image,
    RectangleBase rec,
  ) => 'ImageFromImage_${image.$state.internalId}';

  /// Capture ID for [RaylibCoreModuleBase.ImageFromChannel].
  String ImageFromChannel(
    ImageBase image,
    num selectedChannel,
  ) => 'ImageFromChannel_${image.$state.internalId}';

  /// Capture ID for [RaylibCoreModuleBase.ImageText].
  String ImageText(
    String text,
    num fontSize,
    ColorBase color,
  ) => 'ImageText';

  /// Capture ID for [RaylibCoreModuleBase.ImageTextEx].
  String ImageTextEx(
    FontBase font,
    String text,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'ImageTextEx_${font.$state.internalId}';

  /// Capture ID for [RaylibCoreModuleBase.LoadTexture].
  String LoadTexture(
    String fileName,
  ) => 'LoadTexture_$fileName';

  /// Capture ID for [RaylibCoreModuleBase.LoadTextureFromImage].
  String LoadTextureFromImage(
    ImageBase image,
  ) => 'LoadTextureFromImage_${image.$state.internalId}';

  /// Capture ID for [RaylibCoreModuleBase.LoadTextureCubemap].
  String LoadTextureCubemap(
    ImageBase image,
    CubemapLayout layout,
  ) => 'LoadTextureCubemap_${image.$state.internalId}';

  /// Capture ID for [RaylibCoreModuleBase.LoadRenderTexture].
  String LoadRenderTexture(
    num width,
    num height,
  ) => 'LoadRenderTexture';

  /// Capture ID for [RaylibCoreModuleBase.GetFontDefault].
  String GetFontDefault() => 'GetFontDefault';

  /// Capture ID for [RaylibCoreModuleBase.LoadFont].
  String LoadFont(
    String fileName,
  ) => 'LoadFont_$fileName';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadFontEx].
  String LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codePointCount
    ]
  ) => 'LoadFontEx_$fileName';

  /// Capture ID for [RaylibCoreModuleBase.LoadFontFromImage].
  String LoadFontFromImage(
    ImageBase image,
    ColorBase key,
    num firstChar,
  ) => 'LoadFontFromImage_${image.$state.internalId}';

  /// Capture ID for [RaylibCoreModuleBase.LoadFontFromMemory].
  String LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => 'LoadFontFromMemory_$fileType';

  /// Capture ID for [RaylibCoreModuleBase.GenImageFontAtlas].
  String GenImageFontAtlas(
    List<GlyphInfoBase> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => 'GenImageFontAtlas';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadModel].
  String LoadModel(
    String fileName,
  ) => 'LoadModel_$fileName';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadModelFromMesh].
  String LoadModelFromMesh(
    MeshBase mesh,
  ) => 'LoadModelFromMesh_${mesh.$state.internalId}';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshPoly].
  String GenMeshPoly(
    num sides,
    num radius,
  ) => 'GenMeshPoly';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshPlane].
  String GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => 'GenMeshPlane';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshCube].
  String GenMeshCube(
    num width,
    num height,
    num length,
  ) => 'GenMeshCube';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshSphere].
  String GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshSphere';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshHemiSphere].
  String GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshHemiSphere';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshCylinder].
  String GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCylinder';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshCone].
  String GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCone';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshTorus].
  String GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshTorus';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshKnot].
  String GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshKnot';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshHeightmap].
  String GenMeshHeightmap(
    ImageBase heightmap,
    Vector3Base size,
  ) => 'GenMeshHeightmap_${heightmap.$state.internalId}';
    
  /// Capture ID for [RaylibCoreModuleBase.GenMeshCubicmap].
  String GenMeshCubicmap(
    ImageBase cubicmap,
    Vector3Base cubeSize,
  ) => 'GenMeshCubicmap_${cubicmap.$state.internalId}';
    
  /// Capture ID for [RaylibCoreModuleBase.LoadMaterialDefault].
  String LoadMaterialDefault() => 'LoadMaterialDefault';
  
}
