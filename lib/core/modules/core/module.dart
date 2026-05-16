part of '../../raylib_dartified_base.dart';

abstract interface class RaylibCoreModuleBase<
  // pointers
  UnsignedCharPointerType,

  // types
  AutomationEventListStructType extends AutomationEventListBase,
  AutomationEventStructType extends AutomationEventBase,
  BoundingBoxStructType extends BoundingBoxBase,
  Camera2DStructType extends Camera2DBase,
  Camera3DStructType extends Camera3DBase,
  ColorStructType extends ColorBase,
  FilePathListStructType extends FilePathListBase,
  FontStructType extends FontBase,
  GlyphInfoStructType extends GlyphInfoBase,
  ImageStructType extends ImageBase,
  MaterialStructType extends MaterialBase,
  MatrixStructType extends MatrixBase,
  MeshStructType extends MeshBase,
  ModelStructType extends ModelBase,
  ModelAnimationStructType extends ModelAnimationBase,
  NPatchInfoStructType extends NPatchInfoBase,
  RayStructType extends RayBase,
  RayCollisionStructType extends RayCollisionBase,
  RectangleStructType extends RectangleBase,
  RenderTextureStructType extends RenderTextureBase,
  ShaderStructType extends ShaderBase,
  TextureStructType extends TextureBase,
  Vector2StructType extends Vector2Base,
  Vector3StructType extends Vector3Base,
  Vector4StructType extends Vector4Base,
  VrDeviceInfoStructType extends VrDeviceInfoBase,
  VrStereoConfigStructType extends VrStereoConfigBase,

  // callbacks
  LoadFileDataCallbackType extends LoadFileDataCallbackBase,
  SaveFileDataCallbackType extends SaveFileDataCallbackBase,
  LoadFileTextCallbackType extends LoadFileTextCallbackBase,
  SaveFileTextCallbackType extends SaveFileTextCallbackBase
  
> with RaylibModuleBase {

  void InitWindow(
    num width,
    num height,
    String title,
  );

  void CloseWindow();

  bool WindowShouldClose();

  bool IsWindowReady();

  bool IsWindowFullscreen();

  bool IsWindowHidden();
    
  bool IsWindowMinimized();
    
  bool IsWindowMaximized();
    
  bool IsWindowFocused();
    
  bool IsWindowResized();
    
  bool IsWindowState(
    ConfigFlags flag,
  );
    
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  );
    
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  );
    
  void ToggleFullscreen();
    
  void ToggleBorderlessWindowed();
    
  void MaximizeWindow();
    
  void MinimizeWindow();
    
  void RestoreWindow();
    
  void SetWindowIcon(
    ImageStructType image,
  );
    
  void SetWindowIcons(
    List<ImageStructType> images,
  );
    
  void SetWindowTitle(
    String title,
  );

  void SetWindowPosition(
    num x,
    num y,
  );
    
  void SetWindowMonitor(
    num monitor,
  );
    
  void SetWindowMinSize(
    num width,
    num height,
  );

  void SetWindowMaxSize(
    num width,
    num height,
  );
    
  void SetWindowSize(
    num width,
    num height,
  );

  void SetWindowOpacity(
    num opacity,
  );
    
  void SetWindowFocused();

  int GetScreenWidth();
    
  int GetScreenHeight();
    
  int GetRenderWidth();
    
  int GetRenderHeight();
    
  int GetMonitorCount();
    
  int GetCurrentMonitor();
    
  Vector2StructType GetMonitorPosition(
    num monitor,
  );
    
  int GetMonitorWidth(
    num monitor,
  );
    
  int GetMonitorHeight(
    num monitor,
  );
    
  int GetMonitorPhysicalWidth(
    num monitor,
  );
    
  int GetMonitorPhysicalHeight(
    num monitor,
  );
    
  int GetMonitorRefreshRate(
    num monitor,
  );
    
  Vector2StructType GetWindowPosition();
    
  Vector2StructType GetWindowScaleDPI();
    
  String GetMonitorName(
    num monitor,
  );
    
  void SetClipboardText(
    String text,
  );
    
  String GetClipboardText();
    
  ImageStructType GetClipboardImage();
    
  void EnableEventWaiting();
    
  void DisableEventWaiting();
    
  void ShowCursor();
    
  void HideCursor();
    
  bool IsCursorHidden();
    
  void EnableCursor();
    
  void DisableCursor();
    
  bool IsCursorOnScreen();
    
  void ClearBackground(
    ColorStructType color,
  );
    
  void BeginDrawing();
    
  void EndDrawing();
    
  void BeginMode2D(
    Camera2DStructType camera,
  );
    
  void EndMode2D();
    
  void BeginMode3D(
    Camera3DStructType camera,
  );
    
  void EndMode3D();
    
  void BeginTextureMode(
    RenderTextureStructType target,
  );
    
  void EndTextureMode();
    
  void BeginShaderMode(
    ShaderStructType shader,
  );
    
  void EndShaderMode();
    
  void BeginBlendMode(
    BlendMode mode,
  );
    
  void EndBlendMode();
    
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  );
    
  void EndScissorMode();
    
  void BeginVrStereoMode(
    VrStereoConfigStructType config,
  );
    
  void EndVrStereoMode();
    
  VrStereoConfigStructType LoadVrStereoConfig(
    VrDeviceInfoStructType device,
  );
    
  void UnloadVrStereoConfig(
    VrStereoConfigStructType config,
  );
    
  ShaderStructType LoadShader(
    String? vsFileName,
    String? fsFileName,
  );
    
  ShaderStructType LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  );
    
  bool IsShaderValid(
    ShaderStructType shader,
  );
    
  int GetShaderLocation(
    ShaderStructType shader,
    String uniformName,
  );
    
  int GetShaderLocationAttrib(
    ShaderStructType shader,
    String attribName,
  );
  
  void SetShaderValue(
    ShaderStructType shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
  );

  void SetShaderValueV(
    ShaderStructType shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  );
    
  void SetShaderValueMatrix(
    ShaderStructType shader,
    num locIndex,
    MatrixStructType mat,
  );
    
  void SetShaderValueTexture(
    ShaderStructType shader,
    num locIndex,
    TextureStructType texture,
  );
    
  void UnloadShader(
    ShaderStructType shader,
  );
    
  RayStructType GetScreenToWorldRay(
    Vector2StructType position,
    Camera3DStructType camera,
  );
    
  RayStructType GetScreenToWorldRayEx(
    Vector2StructType position,
    Camera3DStructType camera,
    num width,
    num height,
  );

  Vector2StructType GetWorldToScreen(
    Vector3StructType position,
    Camera3DStructType camera,
  );

  Vector2StructType GetWorldToScreenEx(
    Vector3StructType position,
    Camera3DStructType camera,
    num width,
    num height,
  );

  Vector2StructType GetWorldToScreen2D(
    Vector2StructType position,
    Camera2DStructType camera,
  );

  Vector2StructType GetScreenToWorld2D(
    Vector2StructType position,
    Camera2DStructType camera,
  );

  MatrixStructType GetCameraMatrix(
    Camera3DStructType camera,
  );

  MatrixStructType GetCameraMatrix2D(
    Camera2DStructType camera,
  );
    
  void SetTargetFPS(
    num fps,
  );

  double GetFrameTime();

  double GetTime();

  int GetFPS();

  void SwapScreenBuffer();

  void PollInputEvents();

  void WaitTime(
    num seconds,
  );

  void SetRandomSeed(
    num seed,
  );

  int GetRandomValue(
    num min,
    num max,
  );
  
  List<int> LoadRandomSequence(
    int count,
    int min,
    int max,
    [int? seed]
  );
    
  void TakeScreenshot(
    String fileName,
  );

  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  );

  void OpenURL(
    String url,
  );

  void TraceLog(
    TraceLogLevel logLevel,
    String text,
  );

  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  );
    
  void SetLoadFileDataCallback(
    LoadFileDataCallbackType? callback
  );
    
  void SetSaveFileDataCallback(
    SaveFileDataCallbackType? callback
  );
    
  void SetLoadFileTextCallback(
    LoadFileTextCallbackType? callback
  );
    
  void SetSaveFileTextCallback(
    SaveFileTextCallbackType? callback
  );
    
  List<int> LoadFileData(
    String fileName,
  );

  bool SaveFileData(
    String fileName,
    List<int> data,
  );

  bool ExportDataAsCode(
    List<int> data,
    String fileName,
  );

  String LoadFileText(
    String fileName,
  );

  bool SaveFileText(
    String fileName,
    String text,
  );
    
  bool FileExists(
    String fileName,
  );

  bool DirectoryExists(
    String dirPath,
  );

  bool IsFileExtension(
    String fileName,
    String ext,
  );

  int GetFileLength(
    String fileName,
  );

  String GetFileExtension(
    String fileName,
  );

  String GetFileName(
    String filePath,
  );

  String GetFileNameWithoutExt(
    String filePath,
  );

  String GetDirectoryPath(
    String filePath,
  );

  String GetPrevDirectoryPath(
    String dirPath,
  );

  String GetWorkingDirectory();

  String GetApplicationDirectory();

  int MakeDirectory(
    String dirPath,
  );

  bool ChangeDirectory(
    String dir,
  );

  bool IsPathFile(
    String path,
  );

  bool IsFileNameValid(
    String fileName,
  );
    
  FilePathListStructType LoadDirectoryFiles(
    String dirPath,
  );
    
  FilePathListStructType LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  );
    
  bool IsFileDropped();
    
  FilePathListStructType LoadDroppedFiles();

  void UnloadDroppedFiles(
    FilePathListStructType files,
  );

  int GetFileModTime(
    String fileName,
  );

  List<int> CompressData(
    List<int> data,
  );

  List<int> DecompressData(
    List<int> compData,
  );

  List<int> EncodeDataBase64(
    List<int> data,
  );

  List<int> DecodeDataBase64(
    List<int> data,
  );

  int ComputeCRC32(
    List<int> data,
  );

  List<int> ComputeMD5(
    List<int> data,
  );

  List<int> ComputeSHA1(
    List<int> data,
  );
    
  AutomationEventListStructType LoadAutomationEventList(
    String? fileName,
  );
    
  void UnloadAutomationEventList(
    AutomationEventListStructType list,
  );
    
  bool ExportAutomationEventList(
    AutomationEventListStructType list,
    String fileName,
  );
    
  void SetAutomationEventList(
    AutomationEventListStructType list,
  );
    
  void SetAutomationEventBaseFrame(
    int frame,
  );
    
  void StartAutomationEventRecording();

  void StopAutomationEventRecording();
    
  void PlayAutomationEvent(
    AutomationEventStructType event,
  );

  bool IsKeyPressed(
    KeyboardKey key,
  );

  bool IsKeyPressedRepeat(
    KeyboardKey key,
  );

  bool IsKeyDown(
    KeyboardKey key,
  );

  bool IsKeyReleased(
    KeyboardKey key,
  );

  bool IsKeyUp(
    KeyboardKey key,
  );

  int GetKeyPressed();

  int GetCharPressed();

  void SetExitKey(
    KeyboardKey key,
  );

  bool IsGamepadAvailable(
    num gamepad,
  );

  String GetGamepadName(
    num gamepad,
  );

  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  );

  bool IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  );

  bool IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  );

  bool IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  );

  GamepadButton GetGamepadButtonPressed();

  int GetGamepadAxisCount(
    num gamepad,
  );

  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  );

  int SetGamepadMappings(
    String mappings,
  );
    
  void SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  );

  bool IsMouseButtonPressed(
    MouseButton button,
  );

  bool IsMouseButtonDown(
    MouseButton button,
  );

  bool IsMouseButtonReleased(
    MouseButton button,
  );

  bool IsMouseButtonUp(
    MouseButton button,
  );

  int GetMouseX();

  int GetMouseY();

  Vector2StructType GetMousePosition();

  Vector2StructType GetMouseDelta();

  void SetMousePosition(
    num x,
    num y,
  );

  void SetMouseOffset(
    num offsetX,
    num offsetY,
  );

  void SetMouseScale(
    num scaleX,
    num scaleY,
  );

  double GetMouseWheelMove();

  Vector2StructType GetMouseWheelMoveV();

  void SetMouseCursor(
    MouseCursor cursor,
  );

  int GetTouchX();

  int GetTouchY();

  Vector2StructType GetTouchPosition(
    num index,
  );

  int GetTouchPointId(
    num index,
  );

  int GetTouchPointCount();

  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  );

  bool IsGestureDetected(
    Gesture gesture,
  );

  Gesture GetGestureDetected();

  double GetGestureHoldDuration();

  Vector2StructType GetGestureDragVector();

  double GetGestureDragAngle();

  Vector2StructType GetGesturePinchVector();

  double GetGesturePinchAngle();
    
  void UpdateCamera(
    Camera3DStructType camera,
    CameraMode mode,
  );

  void UpdateCameraPro(
    Camera3DStructType camera,
    Vector3StructType movement,
    Vector3StructType rotation,
    num zoom,
  );

  void SetShapesTexture(
    TextureStructType texture,
    RectangleStructType source,
  );

  TextureStructType GetShapesTexture();

  RectangleStructType GetShapesTextureRectangle();

  void DrawPixel(
    num posX,
    num posY,
    ColorStructType color,
  );

  void DrawPixelV(
    Vector2StructType position,
    ColorStructType color,
  );
    
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorStructType color,
  );

  void DrawLineV(
    Vector2StructType startPos,
    Vector2StructType endPos,
    ColorStructType color,
  );

  void DrawLineEx(
    Vector2StructType startPos,
    Vector2StructType endPos,
    num thick,
    ColorStructType color,
  );

  void DrawLineStrip(
    List<Vector2StructType> points,
    ColorStructType color,
  );

  void DrawLineBezier(
    Vector2StructType startPos,
    Vector2StructType endPos,
    num thick,
    ColorStructType color,
  );

  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorStructType color,
  );

  void DrawCircleSector(
    Vector2StructType center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorStructType color,
  );

  void DrawCircleSectorLines(
    Vector2StructType center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorStructType color,
  );

  void DrawCircleGradient(
    num centerX,
    num centerY,
    num radius,
    ColorStructType inner,
    ColorStructType outer,
  );

  void DrawCircleV(
    Vector2StructType center,
    num radius,
    ColorStructType color,
  );

  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorStructType color,
  );

  void DrawCircleLinesV(
    Vector2StructType center,
    num radius,
    ColorStructType color,
  );
    
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorStructType color,
  );

  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorStructType color,
  );

  void DrawRing(
    Vector2StructType center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorStructType color,
  );

  void DrawRingLines(
    Vector2StructType center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorStructType color,
  );

  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType color,
  );

  void DrawRectangleV(
    Vector2StructType position,
    Vector2StructType size,
    ColorStructType color,
  );

  void DrawRectangleRec(
    RectangleStructType rec,
    ColorStructType color,
  );
    
  void DrawRectanglePro(
    RectangleStructType rec,
    Vector2StructType origin,
    num rotation,
    ColorStructType color,
  );

  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType top,
    ColorStructType bottom,
  );

  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType left,
    ColorStructType right,
  );

  void DrawRectangleGradientEx(
    RectangleStructType rec,
    ColorStructType topLeft,
    ColorStructType bottomLeft,
    ColorStructType topRight,
    ColorStructType bottomRight,
  );

  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType color,
  );

  void DrawRectangleLinesEx(
    RectangleStructType rec,
    num lineThick,
    ColorStructType color,
  );

  void DrawRectangleRounded(
    RectangleStructType rec,
    num roundness,
    num segments,
    ColorStructType color,
  );

  void DrawRectangleRoundedLines(
    RectangleStructType rec,
    num roundness,
    num segments,
    ColorStructType color,
  );

  void DrawRectangleRoundedLinesEx(
    RectangleStructType rec,
    num roundness,
    num segments,
    num lineThick,
    ColorStructType color,
  );
    
  void DrawTriangle(
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType color,
  );

  void DrawTriangleLines(
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType color,
  );

  void DrawTriangleFan(
    List<Vector2StructType> points,
    ColorStructType color,
  );

  void DrawTriangleStrip(
    List<Vector2StructType> points,
    ColorStructType color,
  );

  void DrawPoly(
    Vector2StructType center,
    num sides,
    num radius,
    num rotation,
    ColorStructType color,
  );

  void DrawPolyLines(
    Vector2StructType center,
    num sides,
    num radius,
    num rotation,
    ColorStructType color,
  );

  void DrawPolyLinesEx(
    Vector2StructType center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorStructType color,
  );

  void DrawSplineLinear(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  void DrawSplineBasis(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  void DrawSplineCatmullRom(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  void DrawSplineBezierQuadratic(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  void DrawSplineBezierCubic(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );
    
  void DrawSplineSegmentLinear(
    Vector2StructType p1,
    Vector2StructType p2,
    num thick,
    ColorStructType color,
  );

  void DrawSplineSegmentBasis(
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
    Vector2StructType p4,
    num thick,
    ColorStructType color,
  );

  void DrawSplineSegmentCatmullRom(
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
    Vector2StructType p4,
    num thick,
    ColorStructType color,
  );

  void DrawSplineSegmentBezierQuadratic(
    Vector2StructType p1,
    Vector2StructType c2,
    Vector2StructType p3,
    num thick,
    ColorStructType color,
  );

  void DrawSplineSegmentBezierCubic(
    Vector2StructType p1,
    Vector2StructType c2,
    Vector2StructType c3,
    Vector2StructType p4,
    num thick,
    ColorStructType color,
  );

  Vector2StructType GetSplinePointLinear(
    Vector2StructType startPos,
    Vector2StructType endPos,
    num t,
  );

  Vector2StructType GetSplinePointBasis(
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
    Vector2StructType p4,
    num t,
  );
    
  Vector2StructType GetSplinePointCatmullRom(
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
    Vector2StructType p4,
    num t,
  );

  Vector2StructType GetSplinePointBezierQuad(
    Vector2StructType p1,
    Vector2StructType c2,
    Vector2StructType p3,
    num t,
  );

  Vector2StructType GetSplinePointBezierCubic(
    Vector2StructType p1,
    Vector2StructType c2,
    Vector2StructType c3,
    Vector2StructType p4,
    num t,
  );

  bool CheckCollisionRecs(
    RectangleStructType rec1,
    RectangleStructType rec2,
  );

  bool CheckCollisionCircles(
    Vector2StructType center1,
    num radius1,
    Vector2StructType center2,
    num radius2,
  );

  bool CheckCollisionCircleRec(
    Vector2StructType center,
    num radius,
    RectangleStructType rec,
  );

  bool CheckCollisionCircleLine(
    Vector2StructType center,
    num radius,
    Vector2StructType p1,
    Vector2StructType p2,
  );

  bool CheckCollisionPointRec(
    Vector2StructType point,
    RectangleStructType rec,
  );
    
  bool CheckCollisionPointCircle(
    Vector2StructType point,
    Vector2StructType center,
    num radius,
  );

  bool CheckCollisionPointTriangle(
    Vector2StructType point,
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
  );

  bool CheckCollisionPointLine(
    Vector2StructType point,
    Vector2StructType p1,
    Vector2StructType p2,
    num threshold,
  );

  bool CheckCollisionPointPoly(
    Vector2StructType point,
    List<Vector2StructType> points,
  );

  (bool result, Vector2StructType collisionPoint) CheckCollisionLines(
    Vector2StructType startPos1,
    Vector2StructType endPos1,
    Vector2StructType startPos2,
    Vector2StructType endPos2,
  );

  RectangleStructType GetCollisionRec(
    RectangleStructType rec1,
    RectangleStructType rec2,
  );

  ImageStructType LoadImage(
    String fileName,
  );
    
  ImageStructType LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  );

  ImageStructType LoadImageAnim(
    String fileName,
  );

  ImageStructType LoadImageAnimFromMemory(
    String fileType,
    List<int> fileData,
  );

  ImageStructType LoadImageFromMemory(
    String fileType,
    List<int> fileData,
  );

  ImageStructType LoadImageFromTexture(
    TextureStructType texture,
  );

  ImageStructType LoadImageFromScreen();

  bool IsImageValid(
    ImageStructType image,
  );

  void UnloadImage(
    ImageStructType image,
  );

  bool ExportImage(
    ImageStructType image,
    String fileName,
  );
    
  (UnsignedCharPointerType dataPtr, int dataSize) ExportImageToMemory(
    ImageStructType image,
    String fileType,
  );

  bool ExportImageAsCode(
    ImageStructType image,
    String fileName,
  );

  ImageStructType GenImageColor(
    num width,
    num height,
    ColorStructType color,
  );

  ImageStructType GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorStructType start,
    ColorStructType end,
  );

  ImageStructType GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorStructType inner,
    ColorStructType outer,
  );

  ImageStructType GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorStructType inner,
    ColorStructType outer,
  );

  ImageStructType GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorStructType col1,
    ColorStructType col2,
  );

  ImageStructType GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  );

  ImageStructType GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  );
    
  ImageStructType GenImageCellular(
    num width,
    num height,
    num tileSize,
  );

  ImageStructType GenImageText(
    num width,
    num height,
    String text,
  );

  ImageStructType ImageCopy(
    ImageStructType image,
  );

  ImageStructType ImageFromImage(
    ImageStructType image,
    RectangleStructType rec,
  );

  ImageStructType ImageFromChannel(
    ImageStructType image,
    num selectedChannel,
  );

  ImageStructType ImageText(
    String text,
    num fontSize,
    ColorStructType color,
  );

  ImageStructType ImageTextEx(
    FontStructType font,
    String text,
    num fontSize,
    num spacing,
    ColorStructType tint,
  );

  void ImageFormat(
    ImageStructType image,
    PixelFormat newFormat,
  );
    
  void ImageToPOT(
    ImageStructType image,
    ColorStructType fill,
  );

  void ImageCrop(
    ImageStructType image,
    RectangleStructType crop,
  );

  void ImageAlphaCrop(
    ImageStructType image,
    num threshold,
  );

  void ImageAlphaClear(
    ImageStructType image,
    ColorStructType color,
    num threshold,
  );

  void ImageAlphaMask(
    ImageStructType image,
    ImageStructType alphaMask,
  );

  void ImageAlphaPremultiply(
    ImageStructType image,
  );

  void ImageBlurGaussian(
    ImageStructType image,
    num blurSize,
  );

  void ImageKernelConvolution(
    ImageStructType image,
    List<double> kernel,
  );

  void ImageResize(
    ImageStructType image,
    num newWidth,
    num newHeight,
  );

  void ImageResizeNN(
    ImageStructType image,
    num newWidth,
    num newHeight,
  );
    
  void ImageResizeCanvas(
    ImageStructType image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorStructType fill,
  );

  void ImageMipmaps(
    ImageStructType image,
  );

  void ImageDither(
    ImageStructType image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  );

  void ImageFlipVertical(
    ImageStructType image,
  );

  void ImageFlipHorizontal(
    ImageStructType image,
  );

  void ImageRotate(
    ImageStructType image,
    num degrees,
  );

  void ImageRotateCW(
    ImageStructType image,
  );

  void ImageRotateCCW(
    ImageStructType image,
  );
    
  void ImageColorTint(
    ImageStructType image,
    ColorStructType color,
  );

  void ImageColorInvert(
    ImageStructType image,
  );

  void ImageColorGrayscale(
    ImageStructType image,
  );

  void ImageColorContrast(
    ImageStructType image,
    num contrast,
  );

  void ImageColorBrightness(
    ImageStructType image,
    num brightness,
  );

  void ImageColorReplace(
    ImageStructType image,
    ColorStructType color,
    ColorStructType replace,
  );

  List<ColorStructType> LoadImageColors(
    ImageStructType image,
  );
    
  List<ColorStructType> LoadImagePalette(
    ImageStructType image,
    num maxPaletteSize,
  );

  RectangleStructType GetImageAlphaBorder(
    ImageStructType image,
    num threshold,
  );

  ColorStructType GetImageColor(
    ImageStructType image,
    num x,
    num y,
  );

  void ImageClearBackground(
    ImageStructType dst,
    ColorStructType color,
  );

  void ImageDrawPixel(
    ImageStructType dst,
    num posX,
    num posY,
    ColorStructType color,
  );

  void ImageDrawPixelV(
    ImageStructType dst,
    Vector2StructType position,
    ColorStructType color,
  );
    
  void ImageDrawLine(
    ImageStructType dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorStructType color,
  );

  void ImageDrawLineV(
    ImageStructType dst,
    Vector2StructType start,
    Vector2StructType end,
    ColorStructType color,
  );

  void ImageDrawLineEx(
    ImageStructType dst,
    Vector2StructType start,
    Vector2StructType end,
    num thick,
    ColorStructType color,
  );

  void ImageDrawCircle(
    ImageStructType dst,
    num centerX,
    num centerY,
    num radius,
    ColorStructType color,
  );

  void ImageDrawCircleV(
    ImageStructType dst,
    Vector2StructType center,
    num radius,
    ColorStructType color,
  );

  void ImageDrawCircleLines(
    ImageStructType dst,
    num centerX,
    num centerY,
    num radius,
    ColorStructType color,
  );

  void ImageDrawCircleLinesV(
    ImageStructType dst,
    Vector2StructType center,
    num radius,
    ColorStructType color,
  );

  void ImageDrawRectangle(
    ImageStructType dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType color,
  );
    
  void ImageDrawRectangleV(
    ImageStructType dst,
    Vector2StructType position,
    Vector2StructType size,
    ColorStructType color,
  );

  void ImageDrawRectangleRec(
    ImageStructType dst,
    RectangleStructType rec,
    ColorStructType color,
  );

  void ImageDrawRectangleLines(
    ImageStructType dst,
    RectangleStructType rec,
    num thick,
    ColorStructType color,
  );

  void ImageDrawTriangle(
    ImageStructType dst,
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType color,
  );

  void ImageDrawTriangleEx(
    ImageStructType dst,
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType c1,
    ColorStructType c2,
    ColorStructType c3,
  );

  void ImageDrawTriangleLines(
    ImageStructType dst,
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType color,
  );
    
  void ImageDrawTriangleFan(
    ImageStructType dst,
    List<Vector2StructType> points,
    ColorStructType color,
  );

  void ImageDrawTriangleStrip(
    ImageStructType dst,
    List<Vector2StructType> points,
    ColorStructType color,
  );

  void ImageDraw(
    ImageStructType dst,
    ImageStructType src,
    RectangleStructType srcRec,
    RectangleStructType dstRec,
    ColorStructType tint,
  );

  void ImageDrawText(
    ImageStructType dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorStructType color,
  );

  void ImageDrawTextEx(
    ImageStructType dst,
    FontStructType font,
    String text,
    Vector2StructType position,
    num fontSize,
    num spacing,
    ColorStructType tint,
  );

  TextureStructType LoadTexture(
    String fileName,
  );

  TextureStructType LoadTextureFromImage(
    ImageStructType image,
  );

  TextureStructType LoadTextureCubemap(
    ImageStructType image,
    CubemapLayout layout,
  );

  RenderTextureStructType LoadRenderTexture(
    num width,
    num height,
  );

  bool IsTextureValid(
    TextureStructType texture,
  );

  void UnloadTexture(
    TextureStructType texture,
  );

  bool IsRenderTextureValid(
    RenderTextureStructType target,
  );

  void UnloadRenderTexture(
    RenderTextureStructType target,
  );

  void UpdateTexture(
    TextureStructType texture,
    List<int> pixels,
  );
    
  void UpdateTextureRec(
    TextureStructType texture,
    RectangleStructType rec,
    List<int> pixels,
  );

  void GenTextureMipmaps(
    TextureStructType texture,
  );

  void SetTextureFilter(
    TextureStructType texture,
    TextureFilter filter,
  );

  void SetTextureWrap(
    TextureStructType texture,
    TextureWrap wrap,
  );

  void DrawTexture(
    TextureStructType texture,
    num posX,
    num posY,
    ColorStructType tint,
  );

  void DrawTextureV(
    TextureStructType texture,
    Vector2StructType position,
    ColorStructType tint,
  );
    
  void DrawTextureEx(
    TextureStructType texture,
    Vector2StructType position,
    num rotation,
    num scale,
    ColorStructType tint,
  );

  void DrawTextureRec(
    TextureStructType texture,
    RectangleStructType source,
    Vector2StructType position,
    ColorStructType tint,
  );

  void DrawTexturePro(
    TextureStructType texture,
    RectangleStructType source,
    RectangleStructType dest,
    Vector2StructType origin,
    num rotation,
    ColorStructType tint,
  );

  void DrawTextureNPatch(
    TextureStructType texture,
    NPatchInfoStructType nPatchInfo,
    RectangleStructType dest,
    Vector2StructType origin,
    num rotation,
    ColorStructType tint,
  );

  bool ColorIsEqual(
    ColorStructType col1,
    ColorStructType col2,
  );

  ColorStructType Fade(
    ColorStructType color,
    num alpha,
  );

  int ColorToInt(
    ColorStructType color,
  );

  Vector4StructType ColorNormalize(
    ColorStructType color,
  );

  ColorStructType ColorFromNormalized(
    Vector4StructType normalized,
  );

  Vector3StructType ColorToHSV(
    ColorStructType color,
  );

  ColorStructType ColorFromHSV(
    num hue,
    num saturation,
    num value,
  );

  ColorStructType ColorTint(
    ColorStructType color,
    ColorStructType tint,
  );

  ColorStructType ColorBrightness(
    ColorStructType color,
    num factor,
  );

  ColorStructType ColorContrast(
    ColorStructType color,
    num contrast,
  );

  ColorStructType ColorAlpha(
    ColorStructType color,
    num alpha,
  );

  ColorStructType ColorAlphaBlend(
    ColorStructType dst,
    ColorStructType src,
    ColorStructType tint,
  );

  ColorStructType ColorLerp(
    ColorStructType color1,
    ColorStructType color2,
    num factor,
  );

  ColorStructType GetColor(
    num hexValue,
  );

  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  );

  FontStructType GetFontDefault();

  FontStructType LoadFont(
    String fileName,
  );
    
  FontStructType LoadFontEx(
    String fileName,
    num fontSize, [
      List<int>? codepoints,
      num? codePointCount
    ]
  );

  FontStructType LoadFontFromImage(
    ImageStructType image,
    ColorStructType key,
    num firstChar,
  );

  FontStructType LoadFontFromMemory(
    String fileType,
    List<int> fileData,
    num fontSize,
    List<int> codepoints,
  );

  bool IsFontValid(
    FontStructType font,
  );

  List<GlyphInfoStructType> LoadFontData(
    List<int> fileData,
    num fontSize,
    List<int>? codepoints,
    num? codepointCount,
    FontType type,
  );

  (ImageStructType image, List<RectangleStructType> glyphRecs) GenImageFontAtlas(
    List<GlyphInfoStructType> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  );

  void UnloadFontData(
    List<GlyphInfoStructType> glyphs,
  );
    
  void UnloadFont(
    FontStructType font,
  );

  bool ExportFontAsCode(
    FontStructType font,
    String fileName,
  );

  void DrawFPS(
    num posX,
    num posY,
  );

  void DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorStructType color,
  );

  void DrawTextEx(
    FontStructType font,
    String text,
    Vector2StructType position,
    num fontSize,
    num spacing,
    ColorStructType tint,
  );

  void DrawTextPro(
    FontStructType font,
    String text,
    Vector2StructType position,
    Vector2StructType origin,
    num rotation,
    num fontSize,
    num spacing,
    ColorStructType tint,
  );
    
  void DrawTextCodepoint(
    FontStructType font,
    num codepoint,
    Vector2StructType position,
    num fontSize,
    ColorStructType tint,
  );

  void DrawTextCodepoints(
    FontStructType font,
    List<int> codepoints,
    Vector2StructType position,
    num fontSize,
    num spacing,
    ColorStructType tint,
  );

  void SetTextLineSpacing(
    num spacing,
  );

  int MeasureText(
    String text,
    num fontSize,
  );
    
  Vector2StructType MeasureTextEx(
    FontStructType font,
    String text,
    num fontSize,
    num spacing,
  );

  int GetGlyphIndex(
    FontStructType font,
    num codepoint,
  );

  GlyphInfoStructType GetGlyphInfo(
    FontStructType font,
    num codepoint,
  );

  RectangleStructType GetGlyphAtlasRec(
    FontStructType font,
    num codepoint,
  );
    
  String LoadUTF8(
    List<int> codepoints,
  );

  List<int> LoadCodepoints(
    String text,
  );

  int GetCodepointCount(
    String text,
  );

  (int codepoint, int codepointSize) GetCodepoint(
    String text,
  );

  (int codepoint, int codepointSize) GetCodepointNext(
    String text,
  );

  (int codepoint, int codepointSize) GetCodepointPrevious(
    String text,
  );

  (String text, int size) CodepointToUTF8(
    num codepoint,
  );
    
  void DrawLine3D(
    Vector3StructType startPos,
    Vector3StructType endPos,
    ColorStructType color,
  );
    
  void DrawPoint3D(
    Vector3StructType position,
    ColorStructType color,
  );
    
  void DrawCircle3D(
    Vector3StructType center,
    num radius,
    Vector3StructType rotationAxis,
    num rotationAngle,
    ColorStructType color,
  );
    
  void DrawTriangle3D(
    Vector3StructType v1,
    Vector3StructType v2,
    Vector3StructType v3,
    ColorStructType color,
  );
    
  void DrawTriangleStrip3D(
    List<Vector3StructType> points,
    ColorStructType color,
  );
    
  void DrawCube(
    Vector3StructType position,
    num width,
    num height,
    num length,
    ColorStructType color,
  );
    
  void DrawCubeV(
    Vector3StructType position,
    Vector3StructType size,
    ColorStructType color,
  );
    
  void DrawCubeWires(
    Vector3StructType position,
    num width,
    num height,
    num length,
    ColorStructType color,
  );
    
  void DrawCubeWiresV(
    Vector3StructType position,
    Vector3StructType size,
    ColorStructType color,
  );
    
  void DrawSphere(
    Vector3StructType centerPos,
    num radius,
    ColorStructType color,
  );
    
  void DrawSphereEx(
    Vector3StructType centerPos,
    num radius,
    num rings,
    num slices,
    ColorStructType color,
  );
    
  void DrawSphereWires(
    Vector3StructType centerPos,
    num radius,
    num rings,
    num slices,
    ColorStructType color,
  );
    
  void DrawCylinder(
    Vector3StructType position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorStructType color,
  );
    
  void DrawCylinderEx(
    Vector3StructType startPos,
    Vector3StructType endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorStructType color,
  );
    
  void DrawCylinderWires(
    Vector3StructType position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorStructType color,
  );
    
  void DrawCylinderWiresEx(
    Vector3StructType startPos,
    Vector3StructType endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorStructType color,
  );
    
  void DrawCapsule(
    Vector3StructType startPos,
    Vector3StructType endPos,
    num radius,
    num slices,
    num rings,
    ColorStructType color,
  );
    
  void DrawCapsuleWires(
    Vector3StructType startPos,
    Vector3StructType endPos,
    num radius,
    num slices,
    num rings,
    ColorStructType color,
  );
    
  void DrawPlane(
    Vector3StructType centerPos,
    Vector2StructType size,
    ColorStructType color,
  );
    
  void DrawRay(
    RayStructType ray,
    ColorStructType color,
  );
    
  void DrawGrid(
    num slices,
    num spacing,
  );
    
  ModelStructType LoadModel(
    String fileName,
  );
    
  ModelStructType LoadModelFromMesh(
    MeshStructType mesh,
  );
    
  bool IsModelValid(
    ModelStructType model,
  );
    
  void UnloadModel(
    ModelStructType model,
  );
    
  BoundingBoxStructType GetModelBoundingBox(
    ModelStructType model,
  );
    
  void DrawModel(
    ModelStructType model,
    Vector3StructType position,
    num scale,
    ColorStructType tint
  );
    
  void DrawModelEx(
    ModelStructType model,
    Vector3StructType position,
    Vector3StructType rotationAxis,
    num rotationAngle,
    Vector3StructType scale,
    ColorStructType tint,
  );
    
  void DrawModelWires(
    ModelStructType model,
    Vector3StructType position,
    num scale,
    ColorStructType tint,
  );
    
  void DrawModelWiresEx(
    ModelStructType model,
    Vector3StructType position,
    Vector3StructType rotationAxis,
    num rotationAngle,
    Vector3StructType scale,
    ColorStructType tint,
  );
    
  void DrawModelPoints(
    ModelStructType model,
    Vector3StructType position,
    num scale,
    ColorStructType tint,
  );
    
  void DrawModelPointsEx(
    ModelStructType model,
    Vector3StructType position,
    Vector3StructType rotationAxis,
    num rotationAngle,
    Vector3StructType scale,
    ColorStructType tint,
  );
    
  void DrawBoundingBox(
    BoundingBoxStructType box,
    ColorStructType color,
  );

  void DrawBillboard(
    Camera3DStructType camera,
    TextureStructType texture,
    Vector3StructType position,
    num scale,
    ColorStructType tint,
  );

  void DrawBillboardRec(
    Camera3DStructType camera,
    TextureStructType texture,
    RectangleStructType source,
    Vector3StructType position,
    Vector2StructType size,
    ColorStructType tint,
  );

  void DrawBillboardPro(
    Camera3DStructType camera,
    TextureStructType texture,
    RectangleStructType source,
    Vector3StructType position,
    Vector3StructType up,
    Vector2StructType size,
    Vector2StructType origin,
    num rotation,
    ColorStructType tint,
  );
  
  void UploadMesh(
    MeshStructType mesh,
    bool dynamic,
  );
    
  void UpdateMeshBuffer(
    MeshStructType mesh,
    num index,
    List<int> data,
    num offset,
  );
    
  void UnloadMesh(
    MeshStructType mesh,
  );
    
  void DrawMesh(
    MeshStructType mesh,
    MaterialStructType material,
    MatrixStructType transform,
  );
    
  void DrawMeshInstanced(
    MeshStructType mesh,
    MaterialStructType material,
    List<MatrixStructType> transforms,
  );
    
  BoundingBoxStructType GetMeshBoundingBox(
    MeshStructType mesh,
  );

  void GenMeshTangents(
    MeshStructType mesh,
  );
    
  bool ExportMesh(
    MeshStructType mesh,
    String fileName,
  );
    
  bool ExportMeshAsCode(
    MeshStructType mesh,
    String fileName,
  );
    
  MeshStructType GenMeshPoly(
    num sides,
    num radius,
  );
    
  MeshStructType GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  );
    
  MeshStructType GenMeshCube(
    num width,
    num height,
    num length,
  );
    
  MeshStructType GenMeshSphere(
    num radius,
    num rings,
    num slices,
  );
    
  MeshStructType GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  );
    
  MeshStructType GenMeshCylinder(
    num radius,
    num height,
    num slices,
  );
    
  MeshStructType GenMeshCone(
    num radius,
    num height,
    num slices,
  );
    
  MeshStructType GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  );
    
  MeshStructType GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  );
    
  MeshStructType GenMeshHeightmap(
    ImageStructType heightmap,
    Vector3StructType size,
  );
    
  MeshStructType GenMeshCubicmap(
    ImageStructType cubicmap,
    Vector3StructType cubeSize,
  );
    
  List<MaterialStructType> LoadMaterials(
    String fileName,
  );
    
  MaterialStructType LoadMaterialDefault();
    
  bool IsMaterialValid(
    MaterialStructType material,
  );
    
  void UnloadMaterial(
    MaterialStructType material,
  );
    
  void SetMaterialTexture(
    MaterialStructType material,
    MaterialMapIndex mapType,
    TextureStructType texture,
  );
    
  void SetModelMeshMaterial(
    ModelStructType model,
    num meshId,
    num materialId,
  );
    
  List<ModelAnimationStructType> LoadModelAnimations(
    String fileName,
  );
    
  void UpdateModelAnimation(
    ModelStructType model,
    ModelAnimationStructType anim,
    num frame,
  );
    
  void UpdateModelAnimationBones(
    ModelStructType model,
    ModelAnimationStructType anim,
    num frame,
  );
    
  void UnloadModelAnimation(
    ModelAnimationStructType anim,
  );
    
  void UnloadModelAnimations(
    List<ModelAnimationStructType> animations,
  );
    
  bool IsModelAnimationValid(
    ModelStructType model,
    ModelAnimationStructType anim,
  );
    
  bool CheckCollisionSpheres(
    Vector3StructType center1,
    num radius1,
    Vector3StructType center2,
    num radius2,
  );
    
  bool CheckCollisionBoxes(
    BoundingBoxStructType box1,
    BoundingBoxStructType box2,
  );
    
  bool CheckCollisionBoxSphere(
    BoundingBoxStructType box,
    Vector3StructType center,
    num radius,
  );
    
  RayCollisionStructType GetRayCollisionSphere(
    RayStructType ray,
    Vector3StructType center,
    num radius,
  );
    
  RayCollisionStructType GetRayCollisionBox(
    RayStructType ray,
    BoundingBoxStructType box,
  );
    
  RayCollisionStructType GetRayCollisionMesh(
    RayStructType ray,
    MeshStructType mesh,
    MatrixStructType transform,
  );
    
  RayCollisionStructType GetRayCollisionTriangle(
    RayStructType ray,
    Vector3StructType p1,
    Vector3StructType p2,
    Vector3StructType p3,
  );
    
  RayCollisionStructType GetRayCollisionQuad(
    RayStructType ray,
    Vector3StructType p1,
    Vector3StructType p2,
    Vector3StructType p3,
    Vector3StructType p4,
  );
}
