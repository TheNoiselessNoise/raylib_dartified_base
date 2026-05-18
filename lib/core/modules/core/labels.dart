part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Core module function call,
/// logged to the console when debug output is enabled.
class RaylibCoreModuleDebugLabels extends RaylibDebugLabelsBase {
  
  String InitWindow(
    num width,
    num height,
    String title,
  ) => 'InitWindow($width, $height, $title)';

  String CloseWindow() => 'CloseWindow()';

  String WindowShouldClose() => 'WindowShouldClose()';

  String IsWindowReady() => 'IsWindowReady()';

  String IsWindowFullscreen() => 'IsWindowFullscreen()';

  String IsWindowHidden() => 'IsWindowHidden()';
    
  String IsWindowMinimized() => 'IsWindowMinimized()';
    
  String IsWindowMaximized() => 'IsWindowMaximized()';
    
  String IsWindowFocused() => 'IsWindowFocused()';
    
  String IsWindowResized() => 'IsWindowResized()';
    
  String IsWindowState(
    ConfigFlags flag,
  ) => 'IsWindowState(${flag.name})';
    
  String SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'SetWindowState(${EnumsAsFlagsOr(flags)})';
    
  String ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'ClearWindowState(${EnumsAsFlagsOr(flags)})';
    
  String ToggleFullscreen() => 'ToggleFullscreen()';
    
  String ToggleBorderlessWindowed() => 'ToggleBorderlessWindowed()';
    
  String MaximizeWindow() => 'MaximizeWindow()';
    
  String MinimizeWindow() => 'MinimizeWindow()';
    
  String RestoreWindow() => 'RestoreWindow()';
    
  String SetWindowIcon(
    ImageBase image,
  ) => 'SetWindowIcon($image)';
    
  String SetWindowIcons(
    List<ImageBase> images,
  ) => 'SetWindowIcons(${images.map((i) => i.$state.internalId).join(', ')})';
    
  String SetWindowTitle(
    String title,
  ) => 'SetWindowTitle($title)';

  String SetWindowPosition(
    num x,
    num y,
  ) => 'SetWindowPosition($x, $y)';
    
  String SetWindowMonitor(
    num monitor,
  ) => 'SetWindowMonitor($monitor)';
    
  String SetWindowMinSize(
    num width,
    num height,
  ) => 'SetWindowMinSize($width, $height)';

  String SetWindowMaxSize(
    num width,
    num height,
  ) => 'SetWindowMaxSize($width, $height)';
    
  String SetWindowSize(
    num width,
    num height,
  ) => 'SetWindowSize($width, $height)';

  String SetWindowOpacity(
    num opacity,
  ) => 'SetWindowOpacity($opacity)';
    
  String SetWindowFocused() => 'SetWindowFocused()';

  String GetScreenWidth() => 'GetScreenWidth()';
    
  String GetScreenHeight() => 'GetScreenHeight()';
    
  String GetRenderWidth() => 'GetRenderWidth()';
    
  String GetRenderHeight() => 'GetRenderHeight()';
    
  String GetMonitorCount() => 'GetMonitorCount()';
    
  String GetCurrentMonitor() => 'GetCurrentMonitor()';
    
  String GetMonitorPosition(
    num monitor,
  ) => 'GetMonitorPosition($monitor)';
    
  String GetMonitorWidth(
    num monitor,
  ) => 'GetMonitorWidth($monitor)';
    
  String GetMonitorHeight(
    num monitor,
  ) => 'GetMonitorHeight($monitor)';
    
  String GetMonitorPhysicalWidth(
    num monitor,
  ) => 'GetMonitorPhysicalWidth($monitor)';
    
  String GetMonitorPhysicalHeight(
    num monitor,
  ) => 'GetMonitorPhysicalHeight($monitor)';
    
  String GetMonitorRefreshRate(
    num monitor,
  ) => 'GetMonitorRefreshRate($monitor)';
    
  String GetWindowPosition() => 'GetWindowPosition()';
    
  String GetWindowScaleDPI() => 'GetWindowScaleDPI()';
    
  String GetMonitorName(
    num monitor,
  ) => 'GetMonitorName($monitor)';
    
  String SetClipboardText(
    String text,
  ) => 'SetClipboardText($text)';
    
  String GetClipboardText() => 'GetClipboardText()';

  String GetClipboardImage() => 'GetClipboardImage()';
    
  String EnableEventWaiting() => 'EnableEventWaiting()';
    
  String DisableEventWaiting() => 'DisableEventWaiting()';
    
  String ShowCursor() => 'ShowCursor()';
    
  String HideCursor() => 'HideCursor()';
    
  String IsCursorHidden() => 'IsCursorHidden()';
    
  String EnableCursor() => 'EnableCursor()';
    
  String DisableCursor() => 'DisableCursor()';
    
  String IsCursorOnScreen() => 'IsCursorOnScreen()';
    
  String ClearBackground(
    ColorBase color,
  ) => 'ClearBackground($color)';
    
  String BeginDrawing() => 'BeginDrawing()';
    
  String EndDrawing() => 'EndDrawing()';
    
  String BeginMode2D(
    Camera2DBase camera,
  ) => 'BeginMode2D($camera)';

  String EndMode2D() => 'EndMode2D()';
    
  String BeginMode3D(
    Camera3DBase camera,
  ) => 'BeginMode3D($camera)';

  String EndMode3D() => 'EndMode3D()';
    
  String BeginTextureMode(
    RenderTextureBase target,
  ) => 'BeginTextureMode($target)';
    
  String EndTextureMode() => 'EndTextureMode()';
    
  String BeginShaderMode(
    ShaderBase shader,
  ) => 'BeginShaderMode($shader)';
    
  String EndShaderMode() => 'EndShaderMode()';
    
  String BeginBlendMode(
    BlendMode mode,
  ) => 'BeginBlendMode($mode)';
    
  String EndBlendMode() => 'EndBlendMode()';
    
  String BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => 'BeginScissorMode($x, $y, $width, $height)';
    
  String EndScissorMode() => 'EndScissorMode()';
    
  String BeginVrStereoMode(
    VrStereoConfigBase config,
  ) => 'BeginVrStereoMode($config)';
    
  String EndVrStereoMode() => 'EndVrStereoMode()';
    
  String LoadVrStereoConfig(
    VrDeviceInfoBase device,
  ) => 'LoadVrStereoConfig($device)';
    
  String UnloadVrStereoConfig(
    VrStereoConfigBase config,
  ) => 'UnloadVrStereoConfig($config)';
    
  String LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => 'LoadShader($vsFileName, $fsFileName)';
    
  String LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => 'LoadShaderFromMemory($vsCode, $fsCode)';
    
  String IsShaderValid(
    ShaderBase shader,
  ) => 'IsShaderValid($shader)';
    
  String GetShaderLocation(
    ShaderBase shader,
    String uniformName,
  ) => 'GetShaderLocation($shader, $uniformName)';
    
  String GetShaderLocationAttrib(
    ShaderBase shader,
    String attribName,
  ) => 'GetShaderLocationAttrib($shader, $attribName)';
  
  String SetShaderValue(
    ShaderBase shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
  ) => SetShaderValueV(
    shader,
    locIndex,
    value,
    uniformType,
    1,
  );

  String SetShaderValueV(
    ShaderBase shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => 'SetShaderValueV($shader, $locIndex, $value, ${uniformType.name}, $count)';
    
  String SetShaderValueMatrix(
    ShaderBase shader,
    num locIndex,
    MatrixBase mat,
  ) => 'SetShaderValueMatrix($shader, $locIndex, $mat)';
    
  String SetShaderValueTexture(
    ShaderBase shader,
    num locIndex,
    TextureBase texture,
  ) => 'SetShaderValueTexture($shader, $locIndex, $texture)';
    
  String UnloadShader(
    ShaderBase shader,
  ) => 'UnloadShader($shader)';
    
  String GetScreenToWorldRay(
    Vector2Base position,
    Camera3DBase camera,
  ) => 'GetScreenToWorldRay($position, $camera)';
    
  String GetScreenToWorldRayEx(
    Vector2Base position,
    Camera3DBase camera,
    num width,
    num height,
  ) => 'GetScreenToWorldRayEx($position, $camera, $width, $height)';

  String GetWorldToScreen(
    Vector3Base position,
    Camera3DBase camera,
  ) => 'GetWorldToScreen($position, $camera)';

  String GetWorldToScreenEx(
    Vector3Base position,
    Camera3DBase camera,
    num width,
    num height,
  ) => 'GetWorldToScreenEx($position, $camera, $width, $height)';

  String GetWorldToScreen2D(
    Vector2Base position,
    Camera2DBase camera,
  ) => 'GetWorldToScreen2D($position, $camera)';

  String GetScreenToWorld2D(
    Vector2Base position,
    Camera2DBase camera,
  ) => 'GetScreenToWorld2D($position, $camera)';

  String GetCameraMatrix(
    Camera3DBase camera,
  ) => 'GetCameraMatrix($camera)';

  String GetCameraMatrix2D(
    Camera2DBase camera,
  ) => 'GetCameraMatrix2D($camera)';
    
  String SetTargetFPS(
    num fps,
  ) => 'SetTargetFPS($fps)';

  String GetFrameTime() => 'GetFrameTime()';

  String GetTime() => 'GetTime()';

  String GetFPS() => 'GetFPS()';

  String SwapScreenBuffer() => 'SwapScreenBuffer()';

  String PollInputEvents() => 'PollInputEvents()';

  String WaitTime(
    num seconds,
  ) => 'WaitTime($seconds)';

  String SetRandomSeed(
    num seed,
  ) => 'SetRandomSeed($seed)';

  String GetRandomValue(
    num min,
    num max,
  ) => 'GetRandomValue($min, $max)';
  
  String LoadRandomSequence(
    int count,
    int min,
    int max,
    [int? seed]
  ) => 'LoadRandomSequence($count, $min, $max, seed: $seed)';
    
  String TakeScreenshot(
    String fileName,
  ) => 'TakeScreenshot($fileName)';

  String SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => 'SetConfigFlags(${EnumsAsFlagsOr(flags)})';

  String OpenURL(
    String url,
  ) => 'OpenURL($url)';

  String TraceLog(
    TraceLogLevel logLevel,
    String text,
  ) => 'TraceLog(${logLevel.name}, $text)';

  String SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => 'SetTraceLogLevel(${logLevel.name})';
    
  String SetLoadFileDataCallback(
    LoadFileDataCallbackBase? callback
  ) => 'SetLoadFileDataCallback($callback)';
    
  String SetSaveFileDataCallback(
    SaveFileDataCallbackBase? callback
  ) => 'SetSaveFileDataCallback($callback)';
    
  String SetLoadFileTextCallback(
    LoadFileTextCallbackBase? callback
  ) => 'SetLoadFileTextCallback($callback)';
    
  String SetSaveFileTextCallback(
    SaveFileTextCallbackBase? callback
  ) => 'SetSaveFileTextCallback($callback)';
    
  String LoadFileData(
    String fileName,
  ) => 'LoadFileData($fileName)';

  String SaveFileData(
    String fileName,
    Uint8List data,
  ) => 'SaveFileData($fileName, data: ${data.length})';

  String ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => 'ExportDataAsCode(data: ${data.length}, $fileName)';

  String LoadFileText(
    String fileName,
  ) => 'LoadFileText($fileName)';

  String SaveFileText(
    String fileName,
    String text,
  ) => 'SaveFileText($fileName, $text)';
    
  String FileExists(
    String fileName,
  ) => 'FileExists($fileName)';

  String DirectoryExists(
    String dirPath,
  ) => 'DirectoryExists($dirPath)';

  String IsFileExtension(
    String fileName,
    String ext,
  ) => 'IsFileExtension($fileName, $ext)';

  String GetFileLength(
    String fileName,
  ) => 'GetFileLength($fileName)';

  String GetFileExtension(
    String fileName,
  ) => 'GetFileExtension($fileName)';

  String GetFileName(
    String filePath,
  ) => 'GetFileName($filePath)';

  String GetFileNameWithoutExt(
    String filePath,
  ) => 'GetFileNameWithoutExt($filePath)';

  String GetDirectoryPath(
    String filePath,
  ) => 'GetDirectoryPath($filePath)';

  String GetPrevDirectoryPath(
    String dirPath,
  ) => 'GetPrevDirectoryPath($dirPath)';

  String GetWorkingDirectory() => 'GetWorkingDirectory()';

  String GetApplicationDirectory() => 'GetApplicationDirectory()';

  String MakeDirectory(
    String dirPath,
  ) => 'MakeDirectory($dirPath)';

  String ChangeDirectory(
    String dir,
  ) => 'ChangeDirectory($dir)';

  String IsPathFile(
    String path,
  ) => 'IsPathFile($path)';

  String IsFileNameValid(
    String fileName,
  ) => 'IsFileNameValid($fileName)';
    
  String LoadDirectoryFiles(
    String dirPath,
  ) => 'LoadDirectoryFiles($dirPath)';
    
  String LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'LoadDirectoryFilesEx($basePath, $filter, $scanSubdirs)';

  String IsFileDropped() => 'IsFileDropped()';
    
  String LoadDroppedFiles() => 'LoadDroppedFiles()';

  String UnloadDroppedFiles(
    FilePathListBase files,
  ) => 'UnloadDroppedFiles($files)';

  String GetFileModTime(
    String fileName,
  ) => 'GetFileModTime($fileName)';

  String CompressData(
    Uint8List data,
  ) => 'CompressData(data: ${data.length})';

  String DecompressData(
    Uint8List compData,
  ) => 'DecompressData(compData: ${compData.length})';

  String EncodeDataBase64(
    Uint8List data,
  ) => 'EncodeDataBase64(data: ${data.length})';

  String DecodeDataBase64(
    Uint8List data,
  ) => 'DecodeDataBase64(data: ${data.length})';

  String ComputeCRC32(
    Uint8List data,
  ) => 'ComputeCRC32(data: ${data.length})';

  String ComputeMD5(
    Uint8List data,
  ) => 'ComputeMD5(data: ${data.length})';

  String ComputeSHA1(
    Uint8List data,
  ) => 'ComputeSHA1(data: ${data.length})';
    
  String LoadAutomationEventList(
    String? fileName,
  ) => 'LoadAutomationEventList($fileName)';
    
  String UnloadAutomationEventList(
    AutomationEventListBase list,
  ) => 'UnloadAutomationEventList($list)';
    
  String ExportAutomationEventList(
    AutomationEventListBase list,
    String fileName,
  ) => 'ExportAutomationEventList($list, $fileName)';
    
  String SetAutomationEventList(
    AutomationEventListBase list,
  ) => 'SetAutomationEventList($list)';
    
  String SetAutomationEventBaseFrame(
    int frame,
  ) => 'SetAutomationEventBaseFrame($frame)';
    
  String StartAutomationEventRecording() => 'StartAutomationEventRecording()';

  String StopAutomationEventRecording() => 'StopAutomationEventRecording()';
    
  String PlayAutomationEvent(
    AutomationEventBase event,
  ) => 'PlayAutomationEvent($event)';

  String IsKeyPressed(
    KeyboardKey key,
  ) => 'IsKeyPressed($key)';

  String IsKeyPressedRepeat(
    KeyboardKey key,
  ) => 'IsKeyPressedRepeat($key)';

  String IsKeyDown(
    KeyboardKey key,
  ) => 'IsKeyDown($key)';
  
  String IsKeyReleased(
    KeyboardKey key,
  ) => 'IsKeyReleased($key)';
  
  String IsKeyUp(
    KeyboardKey key,
  ) => 'IsKeyUp($key)';

  String GetKeyPressed() => 'GetKeyPressed()';

  String GetCharPressed() => 'GetCharPressed()';

  String SetExitKey(
    KeyboardKey key,
  ) => 'SetExitKey(${key.name})';

  String IsGamepadAvailable(
    num gamepad,
  ) => 'IsGamepadAvailable($gamepad)';

  String GetGamepadName(
    num gamepad,
  ) => 'GetGamepadName($gamepad)';

  String IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonPressed($gamepad, ${button.name})';

  String IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonDown($gamepad, ${button.name})';

  String IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonReleased($gamepad, ${button.name})';

  String IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonUp($gamepad, ${button.name})';

  String GetGamepadButtonPressed() => 'GetGamepadButtonPressed()';

  String GetGamepadAxisCount(
    num gamepad,
  ) => 'GetGamepadAxisCount($gamepad)';

  String GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => 'GetGamepadAxisMovement($gamepad, $axis)';

  String SetGamepadMappings(
    String mappings,
  ) => 'SetGamepadMappings($mappings)';
    
  String SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => 'SetGamepadVibration($gamepad, $leftMotor, $rightMotor, $duration)';

  String IsMouseButtonPressed(
    MouseButton button,
  ) => 'IsMouseButtonPressed(${button.name})';

  String IsMouseButtonDown(
    MouseButton button,
  ) => 'IsMouseButtonDown(${button.name})';

  String IsMouseButtonReleased(
    MouseButton button,
  ) => 'IsMouseButtonReleased(${button.name})';

  String IsMouseButtonUp(
    MouseButton button,
  ) => 'IsMouseButtonUp(${button.name})';

  String GetMouseX() => 'GetMouseX()';

  String GetMouseY() => 'GetMouseY()';

  String GetMousePosition() => 'GetMousePosition()';

  String GetMouseDelta() => 'GetMouseDelta()';

  String SetMousePosition(
    num x,
    num y,
  ) => 'SetMousePosition($x, $y)';

  String SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => 'SetMouseOffset($offsetX, $offsetY)';

  String SetMouseScale(
    num scaleX,
    num scaleY,
  ) => 'SetMouseScale($scaleX, $scaleY)';

  String GetMouseWheelMove() => 'GetMouseWheelMove()';

  String GetMouseWheelMoveV() => 'GetMouseWheelMoveV()';

  String SetMouseCursor(
    MouseCursor cursor,
  ) => 'SetMouseCursor(${cursor.name})';

  String GetTouchX() => 'GetTouchX()';

  String GetTouchY() => 'GetTouchY()';

  String GetTouchPosition(
    num index,
  ) => 'GetTouchPosition($index)';

  String GetTouchPointId(
    num index,
  ) => 'GetTouchPointId($index)';

  String GetTouchPointCount() => 'GetTouchPointCount()';

  String SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => 'SetGesturesEnabled($flags)';

  String IsGestureDetected(
    Gesture key,
  ) => 'IsGestureDetected($key)';

  String GetGestureDetected() => 'GetGestureDetected()';

  String GetGestureHoldDuration() => 'GetGestureHoldDuration()';

  String GetGestureDragVector() => 'GetGestureDragVector()';

  String GetGestureDragAngle() => 'GetGestureDragAngle()';

  String GetGesturePinchVector() => 'GetGesturePinchVector()';

  String GetGesturePinchAngle() => 'GetGesturePinchAngle()';
    
  String UpdateCamera(
    Camera3DBase camera,
    CameraMode mode,
  ) => 'UpdateCamera($camera, $mode)';

  String UpdateCameraPro(
    Camera3DBase camera,
    Vector3Base movement,
    Vector3Base rotation,
    num zoom,
  ) => 'UpdateCameraPro($camera, $movement, $rotation, $zoom)';

  String SetShapesTexture(
    TextureBase texture,
    RectangleBase source,
  ) => 'SetShapesTexture($texture, $source)';

  String GetShapesTexture() => 'GetShapesTexture()';

  String GetShapesTextureRectangle() => 'GetShapesTextureRectangle()';

  String DrawPixel(
    num posX,
    num posY,
    ColorBase color,
  ) => 'DrawPixel($posX, $posY, $color)';

  String DrawPixelV(
    Vector2Base position,
    ColorBase color,
  ) => 'DrawPixelV($position, $color)';
    
  String DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorBase color,
  ) => 'DrawLine($startPosX, $startPosY, $endPosX, $endPosY, $color)';

  String DrawLineV(
    Vector2Base startPos,
    Vector2Base endPos,
    ColorBase color,
  ) => 'DrawLineV($startPos, $endPos, $color)';

  String DrawLineEx(
    Vector2Base startPos,
    Vector2Base endPos,
    num thick,
    ColorBase color,
  ) => 'DrawLineEx($startPos, $endPos, $thick, $color)';

  String DrawLineStrip(
    List<Vector2Base> points,
    ColorBase color,
  ) => 'DrawLineStrip(points: ${points.length}, $color)';

  String DrawLineBezier(
    Vector2Base startPos,
    Vector2Base endPos,
    num thick,
    ColorBase color,
  ) => 'DrawLineBezier($startPos, $endPos, $thick, $color)';

  String DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorBase color,
  ) => 'DrawCircle($centerX, $centerY, $radius, $color)';

  String DrawCircleSector(
    Vector2Base center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorBase color,
  ) => 'DrawCircleSector($center, $radius, $startAngle, $endAngle, $segments, $color)';

  String DrawCircleSectorLines(
    Vector2Base center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorBase color,
  ) => 'DrawCircleSectorLines($center, $radius, $startAngle, $endAngle, $segments, $color)';

  String DrawCircleGradient(
    num centerX,
    num centerY,
    num radius,
    ColorBase inner,
    ColorBase outer,
  ) => 'DrawCircleGradient($centerX, $centerY, $radius, $inner, $outer)';

  String DrawCircleV(
    Vector2Base center,
    num radius,
    ColorBase color,
  ) => 'DrawCircleV($center, $radius, $color)';

  String DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorBase color,
  ) => 'DrawCircleLines($centerX, $centerY, $radius, $color)';

  String DrawCircleLinesV(
    Vector2Base center,
    num radius,
    ColorBase color,
  ) => 'DrawCircleLinesV($center, $radius, $color)';
    
  String DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorBase color,
  ) => 'DrawEllipse($centerX, $centerY, $radiusH, $radiusV, $color)';

  String DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorBase color,
  ) => 'DrawEllipseLines($centerX, $centerY, $radiusH, $radiusV, $color)';

  String DrawRing(
    Vector2Base center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorBase color,
  ) => 'DrawRing($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  String DrawRingLines(
    Vector2Base center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorBase color,
  ) => 'DrawRingLines($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  String DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorBase color,
  ) => 'DrawRectangle($posX, $posY, $width, $height, $color)';

  String DrawRectangleV(
    Vector2Base position,
    Vector2Base size,
    ColorBase color,
  ) => 'DrawRectangleV($position, $size, $color)';

  String DrawRectangleRec(
    RectangleBase rec,
    ColorBase color,
  ) => 'DrawRectangleRec($rec, $color)';
    
  String DrawRectanglePro(
    RectangleBase rec,
    Vector2Base origin,
    num rotation,
    ColorBase color,
  ) => 'DrawRectanglePro($rec, $origin, $rotation, $color)';

  String DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorBase top,
    ColorBase bottom,
  ) => 'DrawRectangleGradientV($posX, $posY, $width, $height, $top, $bottom)';

  String DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorBase left,
    ColorBase right,
  ) => 'DrawRectangleGradientH($posX, $posY, $width, $height, $left, $right)';

  String DrawRectangleGradientEx(
    RectangleBase rec,
    ColorBase topLeft,
    ColorBase bottomLeft,
    ColorBase topRight,
    ColorBase bottomRight,
  ) => 'DrawRectangleGradientEx($rec, $topLeft, $bottomLeft, $topRight, $bottomRight)';

  String DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorBase color,
  ) => 'DrawRectangleLines($posX, $posY, $width, $height, $color)';

  String DrawRectangleLinesEx(
    RectangleBase rec,
    num lineThick,
    ColorBase color,
  ) => 'DrawRectangleLinesEx($rec, $lineThick, $color)';

  String DrawRectangleRounded(
    RectangleBase rec,
    num roundness,
    num segments,
    ColorBase color,
  ) => 'DrawRectangleRounded($rec, $roundness, $segments, $color)';

  String DrawRectangleRoundedLines(
    RectangleBase rec,
    num roundness,
    num segments,
    ColorBase color,
  ) => 'DrawRectangleRoundedLines($rec, $roundness, $segments, $color)';

  String DrawRectangleRoundedLinesEx(
    RectangleBase rec,
    num roundness,
    num segments,
    num lineThick,
    ColorBase color,
  ) => 'DrawRectangleRoundedLinesEx($rec, $roundness, $segments, $lineThick, $color)';
    
  String DrawTriangle(
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase color,
  ) => 'DrawTriangle($v1, $v2, $v3, $color)';

  String DrawTriangleLines(
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase color,
  ) => 'DrawTriangleLines($v1, $v2, $v3, $color)';

  String DrawTriangleFan(
    List<Vector2Base> points,
    ColorBase color,
  ) => 'DrawTriangleFan(points: ${points.length}, $color)';

  String DrawTriangleStrip(
    List<Vector2Base> points,
    ColorBase color,
  ) => 'DrawTriangleStrip(points: ${points.length}, $color)';

  String DrawPoly(
    Vector2Base center,
    num sides,
    num radius,
    num rotation,
    ColorBase color,
  ) => 'DrawPoly($center, $sides, $radius, $rotation, $color)';

  String DrawPolyLines(
    Vector2Base center,
    num sides,
    num radius,
    num rotation,
    ColorBase color,
  ) => 'DrawPolyLines($center, $sides, $radius, $rotation, $color)';

  String DrawPolyLinesEx(
    Vector2Base center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorBase color,
  ) => 'DrawPolyLinesEx($center, $sides, $radius, $rotation, $lineThick, $color)';

  String DrawSplineLinear(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineLinear(points: ${points.length}, $thick, $color)';

  String DrawSplineBasis(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineBasis(points: ${points.length}, $thick, $color)';

  String DrawSplineCatmullRom(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineCatmullRom(points: ${points.length}, $thick, $color)';

  String DrawSplineBezierQuadratic(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineBezierQuadratic(points: ${points.length}, $thick, $color)';

  String DrawSplineBezierCubic(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineBezierCubic(points: ${points.length}, $thick, $color)';
    
  String DrawSplineSegmentLinear(
    Vector2Base p1,
    Vector2Base p2,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentLinear($p1, $p2, $thick, $color)';

  String DrawSplineSegmentBasis(
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
    Vector2Base p4,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentBasis($p1, $p2, $p3, $p4, $thick, $color)';

  String DrawSplineSegmentCatmullRom(
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
    Vector2Base p4,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentCatmullRom($p1, $p2, $p3, $p4, $thick, $color)';

  String DrawSplineSegmentBezierQuadratic(
    Vector2Base p1,
    Vector2Base c2,
    Vector2Base p3,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentBezierQuadratic($p1, $c2, $p3, $thick, $color)';

  String DrawSplineSegmentBezierCubic(
    Vector2Base p1,
    Vector2Base c2,
    Vector2Base c3,
    Vector2Base p4,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentBezierCubic($p1, $c2, $c3, $p4, $thick, $color)';

  String GetSplinePointLinear(
    Vector2Base startPos,
    Vector2Base endPos,
    num t,
  ) => 'GetSplinePointLinear($startPos, $endPos, $t)';

  String GetSplinePointBasis(
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
    Vector2Base p4,
    num t,
  ) => 'GetSplinePointBasis($p1, $p2, $p3, $p4, $t)';
    
  String GetSplinePointCatmullRom(
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
    Vector2Base p4,
    num t,
  ) => 'GetSplinePointCatmullRom($p1, $p2, $p3, $p4, $t)';

  String GetSplinePointBezierQuad(
    Vector2Base p1,
    Vector2Base c2,
    Vector2Base p3,
    num t,
  ) => 'GetSplinePointBezierQuad($p1, $c2, $p3, $t)';

  String GetSplinePointBezierCubic(
    Vector2Base p1,
    Vector2Base c2,
    Vector2Base c3,
    Vector2Base p4,
    num t,
  ) => 'GetSplinePointBezierCubic($p1, $c2, $c3, $p4, $t)';

  String CheckCollisionRecs(
    RectangleBase rec1,
    RectangleBase rec2,
  ) => 'CheckCollisionRecs($rec1, $rec2)';

  String CheckCollisionCircles(
    Vector2Base center1,
    num radius1,
    Vector2Base center2,
    num radius2,
  ) => 'CheckCollisionCircles($center1, $radius1, $center2, $radius2)';

  String CheckCollisionCircleRec(
    Vector2Base center,
    num radius,
    RectangleBase rec,
  ) => 'CheckCollisionCircleRec($center, $radius, $rec)';

  String CheckCollisionCircleLine(
    Vector2Base center,
    num radius,
    Vector2Base p1,
    Vector2Base p2,
  ) => 'CheckCollisionCircleLine($center, $radius, $p1, $p2)';

  String CheckCollisionPointRec(
    Vector2Base point,
    RectangleBase rec,
  ) => 'CheckCollisionPointRec($point, $rec)';
    
  String CheckCollisionPointCircle(
    Vector2Base point,
    Vector2Base center,
    num radius,
  ) => 'CheckCollisionPointCircle($point, $center, $radius)';

  String CheckCollisionPointTriangle(
    Vector2Base point,
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
  ) => 'CheckCollisionPointTriangle($point, $p1, $p2, $p3)';

  String CheckCollisionPointLine(
    Vector2Base point,
    Vector2Base p1,
    Vector2Base p2,
    num threshold,
  ) => 'CheckCollisionPointLine($point, $p1, $p2, $threshold)';

  String CheckCollisionPointPoly(
    Vector2Base point,
    List<Vector2Base> points,
  ) => 'CheckCollisionPointPoly($point, points: ${points.length})';

  String CheckCollisionLines(
    Vector2Base startPos1,
    Vector2Base endPos1,
    Vector2Base startPos2,
    Vector2Base endPos2,
  ) => 'CheckCollisionLines($startPos1, $endPos1, $startPos2, $endPos2)';

  String GetCollisionRec(
    RectangleBase rec1,
    RectangleBase rec2,
  ) => 'GetCollisionRec($rec1, $rec2)';

  String LoadImage(
    String fileName,
  ) => 'LoadImage($fileName)';
    
  String LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => 'LoadImageRaw($fileName, $width, $height, ${format.name}, $headerSize)';

  String LoadImageAnim(
    String fileName,
  ) => 'LoadImageAnim($fileName)';

  String LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageAnimFromMemory($fileType, fileData: ${fileData.length})';

  String LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageFromMemory($fileType, fileData: ${fileData.length})';

  String LoadImageFromTexture(
    TextureBase texture,
  ) => 'LoadImageFromTexture($texture)';

  String LoadImageFromScreen() => 'LoadImageFromScreen()';

  String IsImageValid(
    ImageBase image,
  ) => 'IsImageValid($image)';

  String UnloadImage(
    ImageBase image,
  ) => 'UnloadImage($image)';

  String ExportImage(
    ImageBase image,
    String fileName,
  ) => 'ExportImage($image, $fileName)';
    
  String ExportImageToMemory(
    ImageBase image,
    String fileType,
  ) => 'ExportImageToMemory($image, $fileType)';

  String ExportImageAsCode(
    ImageBase image,
    String fileName,
  ) => 'ExportImageAsCode($image, $fileName)';

  String GenImageColor(
    num width,
    num height,
    ColorBase color,
  ) => 'GenImageColor($width, $height, $color)';

  String GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorBase start,
    ColorBase end,
  ) => 'GenImageGradientLinear($width, $height, $direction, $start, $end)';

  String GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorBase inner,
    ColorBase outer,
  ) => 'GenImageGradientRadial($width, $height, $density, $inner, $outer)';

  String GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorBase inner,
    ColorBase outer,
  ) => 'GenImageGradientSquare($width, $height, $density, $inner, $outer)';

  String GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorBase col1,
    ColorBase col2,
  ) => 'GenImageChecked($width, $height, $checksX, $checksY, $col1, $col2)';

  String GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => 'GenImageWhiteNoise($width, $height, $factor)';

  String GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => 'GenImagePerlinNoise($width, $height, $offsetX, $offsetY, $scale)';
    
  String GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => 'GenImageCellular($width, $height, $tileSize)';

  String GenImageText(
    num width,
    num height,
    String text,
  ) => 'GenImageText($width, $height, $text)';

  String ImageCopy(
    ImageBase image,
  ) => 'ImageCopy($image)';

  String ImageFromImage(
    ImageBase image,
    RectangleBase rec,
  ) => 'ImageFromImage($image, $rec)';

  String ImageFromChannel(
    ImageBase image,
    num selectedChannel,
  ) => 'ImageFromChannel($image, $selectedChannel)';

  String ImageText(
    String text,
    num fontSize,
    ColorBase color,
  ) => 'ImageText($text, $fontSize, $color)';

  String ImageTextEx(
    FontBase font,
    String text,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'ImageTextEx($font, $text, $fontSize, $spacing, $tint)';

  String ImageFormat(
    ImageBase image,
    PixelFormat newFormat,
  ) => 'ImageFormat($image, ${newFormat.name})';
    
  String ImageToPOT(
    ImageBase image,
    ColorBase fill,
  ) => 'ImageToPOT($image, $fill)';

  String ImageCrop(
    ImageBase image,
    RectangleBase crop,
  ) => 'ImageCrop($image, $crop)';

  String ImageAlphaCrop(
    ImageBase image,
    num threshold,
  ) => 'ImageAlphaCrop($image, $threshold)';

  String ImageAlphaClear(
    ImageBase image,
    ColorBase color,
    num threshold,
  ) => 'ImageAlphaClear($image, $color, $threshold)';

  String ImageAlphaMask(
    ImageBase image,
    ImageBase alphaMask,
  ) => 'ImageAlphaMask($image, $alphaMask)';

  String ImageAlphaPremultiply(
    ImageBase image,
  ) => 'ImageAlphaPremultiply($image)';

  String ImageBlurGaussian(
    ImageBase image,
    num blurSize,
  ) => 'ImageBlurGaussian($image, $blurSize)';

  String ImageKernelConvolution(
    ImageBase image,
    List<double> kernel,
  ) => 'ImageKernelConvolution($image, kernel: ${kernel.length})';

  String ImageResize(
    ImageBase image,
    num newWidth,
    num newHeight,
  ) => 'ImageResize($image, $newWidth, $newHeight)';

  String ImageResizeNN(
    ImageBase image,
    num newWidth,
    num newHeight,
  ) => 'ImageResizeNN($image, $newWidth, $newHeight)';
    
  String ImageResizeCanvas(
    ImageBase image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorBase fill,
  ) => 'ImageResizeCanvas($image, $newWidth, $newHeight, $offsetX, $offsetY, $fill)';

  String ImageMipmaps(
    ImageBase image,
  ) => 'ImageMipmaps($image)';

  String ImageDither(
    ImageBase image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => 'ImageDither($image, $rBpp, $gBpp, $bBpp, $aBpp)';

  String ImageFlipVertical(
    ImageBase image,
  ) => 'ImageFlipVertical($image)';

  String ImageFlipHorizontal(
    ImageBase image,
  ) => 'ImageFlipHorizontal($image)';

  String ImageRotate(
    ImageBase image,
    num degrees,
  ) => 'ImageRotate($image, $degrees)';

  String ImageRotateCW(
    ImageBase image,
  ) => 'ImageRotateCW($image)';

  String ImageRotateCCW(
    ImageBase image,
  ) => 'ImageRotateCCW($image)';
    
  String ImageColorTint(
    ImageBase image,
    ColorBase color,
  ) => 'ImageColorTint($image, $color)';

  String ImageColorInvert(
    ImageBase image,
  ) => 'ImageColorInvert($image)';

  String ImageColorGrayscale(
    ImageBase image,
  ) => 'ImageColorGrayscale($image)';

  String ImageColorContrast(
    ImageBase image,
    num contrast,
  ) => 'ImageColorContrast($image, $contrast)';

  String ImageColorBrightness(
    ImageBase image,
    num brightness,
  ) => 'ImageColorBrightness($image, $brightness)';

  String ImageColorReplace(
    ImageBase image,
    ColorBase color,
    ColorBase replace,
  ) => 'ImageColorReplace($image, $color, $replace)';

  String LoadImageColors(
    ImageBase image,
  ) => 'LoadImageColors($image)';
  
  String LoadImagePalette(
    ImageBase image,
    num maxPaletteSize,
  ) => 'LoadImagePalette($image, $maxPaletteSize)';

  String GetImageAlphaBorder(
    ImageBase image,
    num threshold,
  ) => 'GetImageAlphaBorder($image, $threshold)';

  String GetImageColor(
    ImageBase image,
    num x,
    num y,
  ) => 'GetImageColor($image, $x, $y)';

  String ImageClearBackground(
    ImageBase dst,
    ColorBase color,
  ) => 'ImageClearBackground($dst, $color)';

  String ImageDrawPixel(
    ImageBase dst,
    num posX,
    num posY,
    ColorBase color,
  ) => 'ImageDrawPixel($dst, $posX, $posY, $color)';

  String ImageDrawPixelV(
    ImageBase dst,
    Vector2Base position,
    ColorBase color,
  ) => 'ImageDrawPixelV($dst, $position, $color)';
    
  String ImageDrawLine(
    ImageBase dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorBase color,
  ) => 'ImageDrawLine($dst, $startPosX, $startPosY, $endPosX, $endPosY, $color)';

  String ImageDrawLineV(
    ImageBase dst,
    Vector2Base start,
    Vector2Base end,
    ColorBase color,
  ) => 'ImageDrawLineV($dst, $start, $end, $color)';

  String ImageDrawLineEx(
    ImageBase dst,
    Vector2Base start,
    Vector2Base end,
    num thick,
    ColorBase color,
  ) => 'ImageDrawLineEx($dst, $start, $end, $thick, $color)';

  String ImageDrawCircle(
    ImageBase dst,
    num centerX,
    num centerY,
    num radius,
    ColorBase color,
  ) => 'ImageDrawCircle($dst, $centerX, $centerY, $radius, $color)';

  String ImageDrawCircleV(
    ImageBase dst,
    Vector2Base center,
    num radius,
    ColorBase color,
  ) => 'ImageDrawCircleV($dst, $center, $radius, $color)';

  String ImageDrawCircleLines(
    ImageBase dst,
    num centerX,
    num centerY,
    num radius,
    ColorBase color,
  ) => 'ImageDrawCircleLines($dst, $centerX, $centerY, $radius, $color)';

  String ImageDrawCircleLinesV(
    ImageBase dst,
    Vector2Base center,
    num radius,
    ColorBase color,
  ) => 'ImageDrawCircleLinesV($dst, $center, $radius, $color)';

  String ImageDrawRectangle(
    ImageBase dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorBase color,
  ) => 'ImageDrawRectangle($dst, $posX, $posY, $width, $height, $color)';
    
  String ImageDrawRectangleV(
    ImageBase dst,
    Vector2Base position,
    Vector2Base size,
    ColorBase color,
  ) => 'ImageDrawRectangleV($dst, $position, $size, $color)';

  String ImageDrawRectangleRec(
    ImageBase dst,
    RectangleBase rec,
    ColorBase color,
  ) => 'ImageDrawRectangleRec($dst, $rec, $color)';

  String ImageDrawRectangleLines(
    ImageBase dst,
    RectangleBase rec,
    num thick,
    ColorBase color,
  ) => 'ImageDrawRectangleLines($dst, $rec, $thick, $color)';

  String ImageDrawTriangle(
    ImageBase dst,
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase color,
  ) => 'ImageDrawTriangle($dst, $v1, $v2, $v3, $color)';

  String ImageDrawTriangleEx(
    ImageBase dst,
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase c1,
    ColorBase c2,
    ColorBase c3,
  ) => 'ImageDrawTriangleEx($dst, $v1, $v2, $v3, $c1, $c2, $c3)';

  String ImageDrawTriangleLines(
    ImageBase dst,
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase color,
  ) => 'ImageDrawTriangleLines($dst, $v1, $v2, $v3, $color)';
    
  String ImageDrawTriangleFan(
    ImageBase dst,
    List<Vector2Base> points,
    ColorBase color,
  ) => 'ImageDrawTriangleFan($dst, points: ${points.length}, $color)';

  String ImageDrawTriangleStrip(
    ImageBase dst,
    List<Vector2Base> points,
    ColorBase color,
  ) => 'ImageDrawTriangleStrip($dst, points: ${points.length}, $color)';

  String ImageDraw(
    ImageBase dst,
    ImageBase src,
    RectangleBase srcRec,
    RectangleBase dstRec,
    ColorBase tint,
  ) => 'ImageDraw($dst, $src, $srcRec, $dstRec, $tint)';

  String ImageDrawText(
    ImageBase dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorBase color,
  ) => 'ImageDrawText($dst, $text, $posX, $posY, $fontSize, $color)';

  String ImageDrawTextEx(
    ImageBase dst,
    FontBase font,
    String text,
    Vector2Base position,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'ImageDrawTextEx($dst, $font, $text, $position, $fontSize, $spacing, $tint)';

  String LoadTexture(
    String fileName,
  ) => 'LoadTexture($fileName)';

  String LoadTextureFromImage(
    ImageBase image,
  ) => 'LoadTextureFromImage($image)';

  String LoadTextureCubemap(
    ImageBase image,
    CubemapLayout layout,
  ) => 'LoadTextureCubemap($image, $layout)';

  String LoadRenderTexture(
    num width,
    num height,
  ) => 'LoadRenderTexture($width, $height)';

  String IsTextureValid(
    TextureBase texture,
  ) => 'IsTextureValid($texture)';

  String UnloadTexture(
    TextureBase texture,
  ) => 'UnloadTexture($texture)';

  String IsRenderTextureValid(
    RenderTextureBase target,
  ) => 'IsRenderTextureValid($target)';

  String UnloadRenderTexture(
    RenderTextureBase target,
  ) => 'UnloadRenderTexture($target)';

  String UpdateTexture(
    TextureBase texture,
    Uint8List pixels,
  ) => 'UpdateTexture($texture, pixels: ${pixels.length})';
    
  String UpdateTextureRec(
    TextureBase texture,
    RectangleBase rec,
    Uint8List pixels,
  ) => 'UpdateTextureRec($texture, $rec, pixels: ${pixels.length})';

  String GenTextureMipmaps(
    TextureBase texture,
  ) => 'GenTextureMipmaps($texture)';

  String SetTextureFilter(
    TextureBase texture,
    TextureFilter filter,
  ) => 'SetTextureFilter($texture, $filter)';

  String SetTextureWrap(
    TextureBase texture,
    TextureWrap wrap,
  ) => 'SetTextureWrap($texture, $wrap)';

  String DrawTexture(
    TextureBase texture,
    num posX,
    num posY,
    ColorBase tint,
  ) => 'DrawTexture($texture, $posX, $posY, $tint)';

  String DrawTextureV(
    TextureBase texture,
    Vector2Base position,
    ColorBase tint,
  ) => 'DrawTextureV($texture, $position, $tint)';
    
  String DrawTextureEx(
    TextureBase texture,
    Vector2Base position,
    num rotation,
    num scale,
    ColorBase tint,
  ) => 'DrawTextureEx($texture, $position, $rotation, $scale, $tint)';

  String DrawTextureRec(
    TextureBase texture,
    RectangleBase source,
    Vector2Base position,
    ColorBase tint,
  ) => 'DrawTextureRec($texture, $source, $position, $tint)';

  String DrawTexturePro(
    TextureBase texture,
    RectangleBase source,
    RectangleBase dest,
    Vector2Base origin,
    num rotation,
    ColorBase tint,
  ) => 'DrawTexturePro($texture, $source, $dest, $origin, $rotation, $tint)';

  String DrawTextureNPatch(
    TextureBase texture,
    NPatchInfoBase nPatchInfo,
    RectangleBase dest,
    Vector2Base origin,
    num rotation,
    ColorBase tint,
  ) => 'DrawTextureNPatch($texture, $nPatchInfo, $dest, $origin, $rotation, $tint)';

  String ColorIsEqual(
    ColorBase col1,
    ColorBase col2,
  ) => 'ColorIsEqual($col1, $col2)';

  String Fade(
    ColorBase color,
    num alpha,
  ) => 'Fade($color, $alpha)';

  String ColorToInt(
    ColorBase color,
  ) => 'ColorToInt($color)';

  String ColorNormalize(
    ColorBase color,
  ) => 'ColorNormalize($color)';

  String ColorFromNormalized(
    Vector4Base normalized,
  ) => 'ColorFromNormalized($normalized)';

  String ColorToHSV(
    ColorBase color,
  ) => 'ColorToHSV($color)';

  String ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => 'ColorFromHSV($hue, $saturation, $value)';

  String ColorTint(
    ColorBase color,
    ColorBase tint,
  ) => 'ColorTint($color, $tint)';

  String ColorBrightness(
    ColorBase color,
    num factor,
  ) => 'ColorBrightness($color, $factor)';

  String ColorContrast(
    ColorBase color,
    num contrast,
  ) => 'ColorContrast($color, $contrast)';

  String ColorAlpha(
    ColorBase color,
    num alpha,
  ) => 'ColorAlpha($color, $alpha)';

  String ColorAlphaBlend(
    ColorBase dst,
    ColorBase src,
    ColorBase tint,
  ) => 'ColorAlphaBlend($dst, $src, $tint)';

  String ColorLerp(
    ColorBase color1,
    ColorBase color2,
    num factor,
  ) => 'ColorLerp($color1, $color2, $factor)';

  String GetColor(
    num hexValue,
  ) => 'GetColor($hexValue)';

  String GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => 'GetPixelDataSize($width, $height, $format)';

  String GetFontDefault() => 'GetFontDefault()';

  String LoadFont(
    String fileName,
  ) => 'LoadFont($fileName)';
    
  String LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codePointCount
    ]
  ) => 'LoadFontEx($fileName, $fontSize, codepoints: ${codepoints?.length})';

  String LoadFontFromImage(
    ImageBase image,
    ColorBase key,
    num firstChar,
  ) => 'LoadFontFromImage($image, $key, $firstChar)';

  String LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => 'LoadFontFromMemory($fileType, fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints.length})';

  String IsFontValid(
    FontBase font,
  ) => 'IsFontValid($font)';

  String LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => 'LoadFontData(fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints?.length}, $type)';

  String GenImageFontAtlas(
    List<GlyphInfoBase> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => 'GenImageFontAtlas(glyphs: ${glyphs.length}, $fontSize, $padding, $packMethod)';

  String UnloadFontData(
    List<GlyphInfoBase> glyphs,
  ) => 'UnloadFontData(glyphs: ${glyphs.length})';
    
  String UnloadFont(
    FontBase font,
  ) => 'UnloadFont($font)';

  String ExportFontAsCode(
    FontBase font,
    String fileName,
  ) => 'ExportFontAsCode($font, $fileName)';

  String DrawFPS(
    num posX,
    num posY,
  ) => 'DrawFPS($posX, $posY)';

  String DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorBase color,
  ) => 'DrawText($text, $posX, $posY, $fontSize, $color)';

  String DrawTextEx(
    FontBase font,
    String text,
    Vector2Base position,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'DrawTextEx($font, $text, $position, $fontSize, $spacing, $tint)';

  String DrawTextPro(
    FontBase font,
    String text,
    Vector2Base position,
    Vector2Base origin,
    num rotation,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'DrawTextPro($font, $text, $position, $origin, $rotation, $fontSize, $spacing, $tint)';
    
  String DrawTextCodepoint(
    FontBase font,
    num codepoint,
    Vector2Base position,
    num fontSize,
    ColorBase tint,
  ) => 'DrawTextCodepoint($font, $codepoint, $position, $fontSize, $tint)';

  String DrawTextCodepoints(
    FontBase font,
    Int32List codepoints,
    Vector2Base position,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'DrawTextCodepoints($font, codepoints: ${codepoints.length}, $position, $fontSize, $spacing, $tint)';

  String SetTextLineSpacing(
    num spacing,
  ) => 'SetTextLineSpacing($spacing)';

  String MeasureText(
    String text,
    num fontSize,
  ) => 'MeasureText($text, $fontSize)';
    
  String MeasureTextEx(
    FontBase font,
    String text,
    num fontSize,
    num spacing,
  ) => 'MeasureTextEx($font, $text, $fontSize, $spacing)';

  String GetGlyphIndex(
    FontBase font,
    num codepoint,
  ) => 'GetGlyphIndex($font, $codepoint)';

  String GetGlyphInfo(
    FontBase font,
    num codepoint,
  ) => 'GetGlyphInfo($font, $codepoint)';

  String GetGlyphAtlasRec(
    FontBase font,
    num codepoint,
  ) => 'GetGlyphAtlasRec($font, $codepoint)';
    
  String LoadUTF8(
    Int32List codepoints,
  ) => 'LoadUTF8(codepoints: ${codepoints.length})';

  String LoadCodepoints(
    String text,
  ) => 'LoadCodepoints($text)';

  String GetCodepointCount(
    String text,
  ) => 'GetCodepointCount($text)';

  String GetCodepoint(
    String text,
  ) => 'GetCodepoint($text)';

  String GetCodepointNext(
    String text,
  ) => 'GetCodepointNext($text)';

  String GetCodepointPrevious(
    String text,
  ) => 'GetCodepointPrevious($text)';

  String CodepointToUTF8(
    num codepoint,
  ) => 'CodepointToUTF8($codepoint)';
    
  String DrawLine3D(
    Vector3Base startPos,
    Vector3Base endPos,
    ColorBase color,
  ) => 'DrawLine3D($startPos, $endPos, $color)';
    
  String DrawPoint3D(
    Vector3Base position,
    ColorBase color,
  ) => 'DrawPoint3D($position, $color)';
    
  String DrawCircle3D(
    Vector3Base center,
    num radius,
    Vector3Base rotationAxis,
    num rotationAngle,
    ColorBase color,
  ) => 'DrawCircle3D($center, $radius, $rotationAxis, $rotationAngle, $color)';
    
  String DrawTriangle3D(
    Vector3Base v1,
    Vector3Base v2,
    Vector3Base v3,
    ColorBase color,
  ) => 'DrawTriangle3D($v1, $v2, $v3, $color)';
    
  String DrawTriangleStrip3D(
    List<Vector3Base> points,
    ColorBase color,
  ) => 'DrawTriangleStrip3D(points: ${points.length}, $color)';
    
  String DrawCube(
    Vector3Base position,
    num width,
    num height,
    num length,
    ColorBase color,
  ) => 'DrawCube($position, $width, $height, $length, $color)';
    
  String DrawCubeV(
    Vector3Base position,
    Vector3Base size,
    ColorBase color,
  ) => 'DrawCubeV($position, $size, $color)';
    
  String DrawCubeWires(
    Vector3Base position,
    num width,
    num height,
    num length,
    ColorBase color,
  ) => 'DrawCubeWires($position, $width, $height, $length, $color)';
    
  String DrawCubeWiresV(
    Vector3Base position,
    Vector3Base size,
    ColorBase color,
  ) => 'DrawCubeWiresV($position, $size, $color)';
    
  String DrawSphere(
    Vector3Base centerPos,
    num radius,
    ColorBase color,
  ) => 'DrawSphere($centerPos, $radius, $color)';
    
  String DrawSphereEx(
    Vector3Base centerPos,
    num radius,
    num rings,
    num slices,
    ColorBase color,
  ) => 'DrawSphereEx($centerPos, $radius, $rings, $slices, $color)';
    
  String DrawSphereWires(
    Vector3Base centerPos,
    num radius,
    num rings,
    num slices,
    ColorBase color,
  ) => 'DrawSphereWires($centerPos, $radius, $rings, $slices, $color)';
    
  String DrawCylinder(
    Vector3Base position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorBase color,
  ) => 'DrawCylinder($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  String DrawCylinderEx(
    Vector3Base startPos,
    Vector3Base endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorBase color,
  ) => 'DrawCylinderEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  String DrawCylinderWires(
    Vector3Base position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorBase color,
  ) => 'DrawCylinderWires($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  String DrawCylinderWiresEx(
    Vector3Base startPos,
    Vector3Base endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorBase color,
  ) => 'DrawCylinderWiresEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  String DrawCapsule(
    Vector3Base startPos,
    Vector3Base endPos,
    num radius,
    num slices,
    num rings,
    ColorBase color,
  ) => 'DrawCapsule($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  String DrawCapsuleWires(
    Vector3Base startPos,
    Vector3Base endPos,
    num radius,
    num slices,
    num rings,
    ColorBase color,
  ) => 'DrawCapsuleWires($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  String DrawPlane(
    Vector3Base centerPos,
    Vector2Base size,
    ColorBase color,
  ) => 'DrawPlane($centerPos, $size, $color)';
    
  String DrawRay(
    RayBase ray,
    ColorBase color,
  ) => 'DrawRay($ray, $color)';
    
  String DrawGrid(
    num slices,
    num spacing,
  ) => 'DrawGrid($slices, $spacing)';
    
  String LoadModel(
    String fileName,
  ) => 'LoadModel($fileName)';
    
  String LoadModelFromMesh(
    MeshBase mesh,
  ) => 'LoadModelFromMesh($mesh)';
    
  String IsModelValid(
    ModelBase model,
  ) => 'IsModelValid($model)';
    
  String UnloadModel(
    ModelBase model,
  ) => 'UnloadModel($model)';
    
  String GetModelBoundingBox(
    ModelBase model,
  ) => 'GetModelBoundingBox($model)';
    
  String DrawModel(
    ModelBase model,
    Vector3Base position,
    num scale,
    ColorBase tint
  ) => 'DrawModel($model, $position, $scale, $tint)';
    
  String DrawModelEx(
    ModelBase model,
    Vector3Base position,
    Vector3Base rotationAxis,
    num rotationAngle,
    Vector3Base scale,
    ColorBase tint,
  ) => 'DrawModelEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  String DrawModelWires(
    ModelBase model,
    Vector3Base position,
    num scale,
    ColorBase tint,
  ) => 'DrawModelWires($model, $position, $scale, $tint)';
    
  String DrawModelWiresEx(
    ModelBase model,
    Vector3Base position,
    Vector3Base rotationAxis,
    num rotationAngle,
    Vector3Base scale,
    ColorBase tint,
  ) => 'DrawModelWiresEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  String DrawModelPoints(
    ModelBase model,
    Vector3Base position,
    num scale,
    ColorBase tint,
  ) => 'DrawModelPoints($model, $position, $scale, $tint)';
    
  String DrawModelPointsEx(
    ModelBase model,
    Vector3Base position,
    Vector3Base rotationAxis,
    num rotationAngle,
    Vector3Base scale,
    ColorBase tint,
  ) => 'DrawModelPointsEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  String DrawBoundingBox(
    BoundingBoxBase box,
    ColorBase color,
  ) => 'DrawBoundingBox($box, $color)';

  String DrawBillboard(
    Camera3DBase camera,
    TextureBase texture,
    Vector3Base position,
    num scale,
    ColorBase tint,
  ) => 'DrawBillboard($camera, $texture, $position, $scale, $tint)';

  String DrawBillboardRec(
    Camera3DBase camera,
    TextureBase texture,
    RectangleBase source,
    Vector3Base position,
    Vector2Base size,
    ColorBase tint,
  ) => 'DrawBillboardRec($camera, $texture, $source, $position, $size, $tint)';

  String DrawBillboardPro(
    Camera3DBase camera,
    TextureBase texture,
    RectangleBase source,
    Vector3Base position,
    Vector3Base up,
    Vector2Base size,
    Vector2Base origin,
    num rotation,
    ColorBase tint,
  ) => 'DrawBillboardPro($camera, $texture, $source, $position, $up, $size, $origin, $rotation, $tint)';
  
  String UploadMesh(
    MeshBase mesh,
    bool dynamic,
  ) => 'UploadMesh($mesh, $dynamic)';
    
  String UpdateMeshBuffer(
    MeshBase mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => 'UpdateMeshBuffer($mesh, $index, data: ${data.length}, $offset)';
    
  String UnloadMesh(
    MeshBase mesh,
  ) => 'UnloadMesh($mesh)';
    
  String DrawMesh(
    MeshBase mesh,
    MaterialBase material,
    MatrixBase transform,
  ) => 'DrawMesh($mesh, $material, transform: $transform)';
    
  String DrawMeshInstanced(
    MeshBase mesh,
    MaterialBase material,
    List<MatrixBase> transforms,
  ) => 'DrawMeshInstanced($mesh, $material, transforms: ${transforms.length})';
    
  String GetMeshBoundingBox(
    MeshBase mesh,
  ) => 'GetMeshBoundingBox($mesh)';
    
  String GenMeshTangents(
    MeshBase mesh,
  ) => 'GenMeshTangents($mesh)';
    
  String ExportMesh(
    MeshBase mesh,
    String fileName,
  ) => 'ExportMesh($mesh, $fileName)';
    
  String ExportMeshAsCode(
    MeshBase mesh,
    String fileName,
  ) => 'ExportMeshAsCode($mesh, $fileName)';
    
  String GenMeshPoly(
    num sides,
    num radius,
  ) => 'GenMeshPoly($sides, $radius)';
    
  String GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => 'GenMeshPlane($width, $length, $resX, $resZ)';
    
  String GenMeshCube(
    num width,
    num height,
    num length,
  ) => 'GenMeshCube($width, $height, $length)';
    
  String GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshSphere($radius, $rings, $slices)';
    
  String GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshHemiSphere($radius, $rings, $slices)';
    
  String GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCylinder($radius, $height, $slices)';
    
  String GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCone($radius, $height, $slices)';
    
  String GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshTorus($radius, $size, $radSeg, $sides)';
    
  String GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshKnot($radius, $size, $radSeg, $sides)';
    
  String GenMeshHeightmap(
    ImageBase heightmap,
    Vector3Base size,
  ) => 'GenMeshHeightmap($heightmap, $size)';
    
  String GenMeshCubicmap(
    ImageBase cubicmap,
    Vector3Base cubeSize,
  ) => 'GenMeshCubicmap($cubicmap, $cubeSize)';
    
  String LoadMaterials(
    String fileName,
  ) => 'LoadMaterials($fileName)';
    
  String LoadMaterialDefault() => 'LoadMaterialDefault()';
    
  String IsMaterialValid(
    MaterialBase material,
  ) => 'IsMaterialValid($material)';
    
  String UnloadMaterial(
    MaterialBase material,
  ) => 'UnloadMaterial($material)';
    
  String SetMaterialTexture(
    MaterialBase material,
    MaterialMapIndex mapType,
    TextureBase texture,
  ) => 'SetMaterialTexture($material, ${mapType.name}, $texture)';
    
  String SetModelMeshMaterial(
    ModelBase model,
    num meshId,
    num materialId,
  ) => 'SetModelMeshMaterial($model, $meshId, $materialId)';
    
  String LoadModelAnimations(
    String fileName,
  ) => 'LoadModelAnimations($fileName)';
    
  String UpdateModelAnimation(
    ModelBase model,
    ModelAnimationBase anim,
    num frame,
  ) => 'UpdateModelAnimation($model, $anim, $frame)';
    
  String UpdateModelAnimationBones(
    ModelBase model,
    ModelAnimationBase anim,
    num frame,
  ) => 'UpdateModelAnimationBones($model, $anim, $frame)';
    
  String UnloadModelAnimation(
    ModelAnimationBase anim,
  ) => 'UnloadModelAnimation($anim)';
    
  String UnloadModelAnimations(
    List<ModelAnimationBase> animations,
  ) => 'UnloadModelAnimations(animations: ${animations.length})';
    
  String IsModelAnimationValid(
    ModelBase model,
    ModelAnimationBase anim,
  ) => 'IsModelAnimationValid($model, $anim)';
    
  String CheckCollisionSpheres(
    Vector3Base center1,
    num radius1,
    Vector3Base center2,
    num radius2,
  ) => 'CheckCollisionSpheres($center1, $radius1, $center2, $radius2)';
    
  String CheckCollisionBoxes(
    BoundingBoxBase box1,
    BoundingBoxBase box2,
  ) => 'CheckCollisionBoxes($box1, $box2)';
    
  String CheckCollisionBoxSphere(
    BoundingBoxBase box,
    Vector3Base center,
    num radius,
  ) => 'CheckCollisionBoxSphere($box, $center, $radius)';
    
  String GetRayCollisionSphere(
    RayBase ray,
    Vector3Base center,
    num radius,
  ) => 'GetRayCollisionSphere($ray, $center, $radius)';
    
  String GetRayCollisionBox(
    RayBase ray,
    BoundingBoxBase box,
  ) => 'GetRayCollisionBox($ray, $box)';
    
  String GetRayCollisionMesh(
    RayBase ray,
    MeshBase mesh,
    MatrixBase transform,
  ) => 'GetRayCollisionMesh($ray, $mesh, $transform)';
    
  String GetRayCollisionTriangle(
    RayBase ray,
    Vector3Base p1,
    Vector3Base p2,
    Vector3Base p3,
  ) => 'GetRayCollisionTriangle($ray, $p1, $p2, $p3)';
    
  String GetRayCollisionQuad(
    RayBase ray,
    Vector3Base p1,
    Vector3Base p2,
    Vector3Base p3,
    Vector3Base p4,
  ) => 'GetRayCollisionQuad($ray, $p1, $p2, $p3, $p4)';
  
}
