part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Core module function call,
/// logged to the console when debug output is enabled.
class RaylibCoreModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibCoreModuleBase.InitWindow].
  String InitWindow(
    num width,
    num height,
    String title,
  ) => 'InitWindow($width, $height, $title)';

  /// Label for [RaylibCoreModuleBase.CloseWindow].
  String CloseWindow() => 'CloseWindow()';

  /// Label for [RaylibCoreModuleBase.WindowShouldClose].
  String WindowShouldClose() => 'WindowShouldClose()';

  /// Label for [RaylibCoreModuleBase.IsWindowReady].
  String IsWindowReady() => 'IsWindowReady()';

  /// Label for [RaylibCoreModuleBase.IsWindowFullscreen].
  String IsWindowFullscreen() => 'IsWindowFullscreen()';

  /// Label for [RaylibCoreModuleBase.IsWindowHidden].
  String IsWindowHidden() => 'IsWindowHidden()';
    
  /// Label for [RaylibCoreModuleBase.IsWindowMinimized].
  String IsWindowMinimized() => 'IsWindowMinimized()';
    
  /// Label for [RaylibCoreModuleBase.IsWindowMaximized].
  String IsWindowMaximized() => 'IsWindowMaximized()';
    
  /// Label for [RaylibCoreModuleBase.IsWindowFocused].
  String IsWindowFocused() => 'IsWindowFocused()';
    
  /// Label for [RaylibCoreModuleBase.IsWindowResized].
  String IsWindowResized() => 'IsWindowResized()';
    
  /// Label for [RaylibCoreModuleBase.IsWindowState].
  String IsWindowState(
    ConfigFlags flag,
  ) => 'IsWindowState(${flag.name})';
    
  /// Label for [RaylibCoreModuleBase.SetWindowState].
  String SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'SetWindowState(${EnumsAsFlagsOr(flags)})';
    
  /// Label for [RaylibCoreModuleBase.ClearWindowState].
  String ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'ClearWindowState(${EnumsAsFlagsOr(flags)})';
    
  /// Label for [RaylibCoreModuleBase.ToggleFullscreen].
  String ToggleFullscreen() => 'ToggleFullscreen()';
    
  /// Label for [RaylibCoreModuleBase.ToggleBorderlessWindowed].
  String ToggleBorderlessWindowed() => 'ToggleBorderlessWindowed()';
    
  /// Label for [RaylibCoreModuleBase.MaximizeWindow].
  String MaximizeWindow() => 'MaximizeWindow()';
    
  /// Label for [RaylibCoreModuleBase.MinimizeWindow].
  String MinimizeWindow() => 'MinimizeWindow()';
    
  /// Label for [RaylibCoreModuleBase.RestoreWindow].
  String RestoreWindow() => 'RestoreWindow()';
    
  /// Label for [RaylibCoreModuleBase.SetWindowIcon].
  String SetWindowIcon(
    ImageBase image,
  ) => 'SetWindowIcon($image)';
    
  /// Label for [RaylibCoreModuleBase.SetWindowIcons].
  String SetWindowIcons(
    List<ImageBase> images,
  ) => 'SetWindowIcons(${images.map((i) => i.$state.internalId).join(', ')})';
    
  /// Label for [RaylibCoreModuleBase.SetWindowTitle].
  String SetWindowTitle(
    String title,
  ) => 'SetWindowTitle($title)';

  /// Label for [RaylibCoreModuleBase.SetWindowPosition].
  String SetWindowPosition(
    num x,
    num y,
  ) => 'SetWindowPosition($x, $y)';
    
  /// Label for [RaylibCoreModuleBase.SetWindowMonitor].
  String SetWindowMonitor(
    num monitor,
  ) => 'SetWindowMonitor($monitor)';
    
  /// Label for [RaylibCoreModuleBase.SetWindowMinSize].
  String SetWindowMinSize(
    num width,
    num height,
  ) => 'SetWindowMinSize($width, $height)';

  /// Label for [RaylibCoreModuleBase.SetWindowMaxSize].
  String SetWindowMaxSize(
    num width,
    num height,
  ) => 'SetWindowMaxSize($width, $height)';
    
  /// Label for [RaylibCoreModuleBase.SetWindowSize].
  String SetWindowSize(
    num width,
    num height,
  ) => 'SetWindowSize($width, $height)';

  /// Label for [RaylibCoreModuleBase.SetWindowOpacity].
  String SetWindowOpacity(
    num opacity,
  ) => 'SetWindowOpacity($opacity)';
    
  /// Label for [RaylibCoreModuleBase.SetWindowFocused].
  String SetWindowFocused() => 'SetWindowFocused()';

  /// Label for [RaylibCoreModuleBase.GetScreenWidth].
  String GetScreenWidth() => 'GetScreenWidth()';
    
  /// Label for [RaylibCoreModuleBase.GetScreenHeight].
  String GetScreenHeight() => 'GetScreenHeight()';
    
  /// Label for [RaylibCoreModuleBase.GetRenderWidth].
  String GetRenderWidth() => 'GetRenderWidth()';
    
  /// Label for [RaylibCoreModuleBase.GetRenderHeight].
  String GetRenderHeight() => 'GetRenderHeight()';
    
  /// Label for [RaylibCoreModuleBase.GetMonitorCount].
  String GetMonitorCount() => 'GetMonitorCount()';
    
  /// Label for [RaylibCoreModuleBase.GetCurrentMonitor].
  String GetCurrentMonitor() => 'GetCurrentMonitor()';
    
  /// Label for [RaylibCoreModuleBase.GetMonitorPosition].
  String GetMonitorPosition(
    num monitor,
  ) => 'GetMonitorPosition($monitor)';
    
  /// Label for [RaylibCoreModuleBase.GetMonitorWidth].
  String GetMonitorWidth(
    num monitor,
  ) => 'GetMonitorWidth($monitor)';
    
  /// Label for [RaylibCoreModuleBase.GetMonitorHeight].
  String GetMonitorHeight(
    num monitor,
  ) => 'GetMonitorHeight($monitor)';
    
  /// Label for [RaylibCoreModuleBase.GetMonitorPhysicalWidth].
  String GetMonitorPhysicalWidth(
    num monitor,
  ) => 'GetMonitorPhysicalWidth($monitor)';
    
  /// Label for [RaylibCoreModuleBase.GetMonitorPhysicalHeight].
  String GetMonitorPhysicalHeight(
    num monitor,
  ) => 'GetMonitorPhysicalHeight($monitor)';
    
  /// Label for [RaylibCoreModuleBase.GetMonitorRefreshRate].
  String GetMonitorRefreshRate(
    num monitor,
  ) => 'GetMonitorRefreshRate($monitor)';
    
  /// Label for [RaylibCoreModuleBase.GetWindowPosition].
  String GetWindowPosition() => 'GetWindowPosition()';
    
  /// Label for [RaylibCoreModuleBase.GetWindowScaleDPI].
  String GetWindowScaleDPI() => 'GetWindowScaleDPI()';
    
  /// Label for [RaylibCoreModuleBase.GetMonitorName].
  String GetMonitorName(
    num monitor,
  ) => 'GetMonitorName($monitor)';
    
  /// Label for [RaylibCoreModuleBase.SetClipboardText].
  String SetClipboardText(
    String text,
  ) => 'SetClipboardText($text)';
    
  /// Label for [RaylibCoreModuleBase.GetClipboardText].
  String GetClipboardText() => 'GetClipboardText()';

  /// Label for [RaylibCoreModuleBase.GetClipboardImage].
  String GetClipboardImage() => 'GetClipboardImage()';
    
  /// Label for [RaylibCoreModuleBase.EnableEventWaiting].
  String EnableEventWaiting() => 'EnableEventWaiting()';
    
  /// Label for [RaylibCoreModuleBase.DisableEventWaiting].
  String DisableEventWaiting() => 'DisableEventWaiting()';
    
  /// Label for [RaylibCoreModuleBase.ShowCursor].
  String ShowCursor() => 'ShowCursor()';
    
  /// Label for [RaylibCoreModuleBase.HideCursor].
  String HideCursor() => 'HideCursor()';
    
  /// Label for [RaylibCoreModuleBase.IsCursorHidden].
  String IsCursorHidden() => 'IsCursorHidden()';
    
  /// Label for [RaylibCoreModuleBase.EnableCursor].
  String EnableCursor() => 'EnableCursor()';
    
  /// Label for [RaylibCoreModuleBase.DisableCursor].
  String DisableCursor() => 'DisableCursor()';
    
  /// Label for [RaylibCoreModuleBase.IsCursorOnScreen].
  String IsCursorOnScreen() => 'IsCursorOnScreen()';
    
  /// Label for [RaylibCoreModuleBase.ClearBackground].
  String ClearBackground(
    ColorBase color,
  ) => 'ClearBackground($color)';
    
  /// Label for [RaylibCoreModuleBase.BeginDrawing].
  String BeginDrawing() => 'BeginDrawing()';
    
  /// Label for [RaylibCoreModuleBase.EndDrawing].
  String EndDrawing() => 'EndDrawing()';
    
  /// Label for [RaylibCoreModuleBase.BeginMode2D].
  String BeginMode2D(
    Camera2DBase camera,
  ) => 'BeginMode2D($camera)';

  /// Label for [RaylibCoreModuleBase.EndMode2D].
  String EndMode2D() => 'EndMode2D()';
    
  /// Label for [RaylibCoreModuleBase.BeginMode3D].
  String BeginMode3D(
    Camera3DBase camera,
  ) => 'BeginMode3D($camera)';

  /// Label for [RaylibCoreModuleBase.EndMode3D].
  String EndMode3D() => 'EndMode3D()';
    
  /// Label for [RaylibCoreModuleBase.BeginTextureMode].
  String BeginTextureMode(
    RenderTextureBase target,
  ) => 'BeginTextureMode($target)';
    
  /// Label for [RaylibCoreModuleBase.EndTextureMode].
  String EndTextureMode() => 'EndTextureMode()';
    
  /// Label for [RaylibCoreModuleBase.BeginShaderMode].
  String BeginShaderMode(
    ShaderBase shader,
  ) => 'BeginShaderMode($shader)';
    
  /// Label for [RaylibCoreModuleBase.EndShaderMode].
  String EndShaderMode() => 'EndShaderMode()';
    
  /// Label for [RaylibCoreModuleBase.BeginBlendMode].
  String BeginBlendMode(
    BlendMode mode,
  ) => 'BeginBlendMode($mode)';
    
  /// Label for [RaylibCoreModuleBase.EndBlendMode].
  String EndBlendMode() => 'EndBlendMode()';
    
  /// Label for [RaylibCoreModuleBase.BeginScissorMode].
  String BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => 'BeginScissorMode($x, $y, $width, $height)';
    
  /// Label for [RaylibCoreModuleBase.EndScissorMode].
  String EndScissorMode() => 'EndScissorMode()';
    
  /// Label for [RaylibCoreModuleBase.BeginVrStereoMode].
  String BeginVrStereoMode(
    VrStereoConfigBase config,
  ) => 'BeginVrStereoMode($config)';
    
  /// Label for [RaylibCoreModuleBase.EndVrStereoMode].
  String EndVrStereoMode() => 'EndVrStereoMode()';
    
  /// Label for [RaylibCoreModuleBase.LoadVrStereoConfig].
  String LoadVrStereoConfig(
    VrDeviceInfoBase device,
  ) => 'LoadVrStereoConfig($device)';
    
  /// Label for [RaylibCoreModuleBase.UnloadVrStereoConfig].
  String UnloadVrStereoConfig(
    VrStereoConfigBase config,
  ) => 'UnloadVrStereoConfig($config)';
    
  /// Label for [RaylibCoreModuleBase.LoadShader].
  String LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => 'LoadShader($vsFileName, $fsFileName)';
    
  /// Label for [RaylibCoreModuleBase.LoadShaderFromMemory].
  String LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => 'LoadShaderFromMemory($vsCode, $fsCode)';
    
  /// Label for [RaylibCoreModuleBase.IsShaderValid].
  String IsShaderValid(
    ShaderBase shader,
  ) => 'IsShaderValid($shader)';
    
  /// Label for [RaylibCoreModuleBase.GetShaderLocation].
  String GetShaderLocation(
    ShaderBase shader,
    String uniformName,
  ) => 'GetShaderLocation($shader, $uniformName)';
    
  /// Label for [RaylibCoreModuleBase.GetShaderLocationAttrib].
  String GetShaderLocationAttrib(
    ShaderBase shader,
    String attribName,
  ) => 'GetShaderLocationAttrib($shader, $attribName)';
  
  /// Label for [RaylibCoreModuleBase.SetShaderValue].
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

  /// Label for [RaylibCoreModuleBase.SetShaderValueV].
  String SetShaderValueV(
    ShaderBase shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => 'SetShaderValueV($shader, $locIndex, $value, ${uniformType.name}, $count)';
    
  /// Label for [RaylibCoreModuleBase.SetShaderValueMatrix].
  String SetShaderValueMatrix(
    ShaderBase shader,
    num locIndex,
    MatrixBase mat,
  ) => 'SetShaderValueMatrix($shader, $locIndex, $mat)';
    
  /// Label for [RaylibCoreModuleBase.SetShaderValueTexture].
  String SetShaderValueTexture(
    ShaderBase shader,
    num locIndex,
    TextureBase texture,
  ) => 'SetShaderValueTexture($shader, $locIndex, $texture)';
    
  /// Label for [RaylibCoreModuleBase.UnloadShader].
  String UnloadShader(
    ShaderBase shader,
  ) => 'UnloadShader($shader)';
    
  /// Label for [RaylibCoreModuleBase.GetScreenToWorldRay].
  String GetScreenToWorldRay(
    Vector2Base position,
    Camera3DBase camera,
  ) => 'GetScreenToWorldRay($position, $camera)';
    
  /// Label for [RaylibCoreModuleBase.GetScreenToWorldRayEx].
  String GetScreenToWorldRayEx(
    Vector2Base position,
    Camera3DBase camera,
    num width,
    num height,
  ) => 'GetScreenToWorldRayEx($position, $camera, $width, $height)';

  /// Label for [RaylibCoreModuleBase.GetWorldToScreen].
  String GetWorldToScreen(
    Vector3Base position,
    Camera3DBase camera,
  ) => 'GetWorldToScreen($position, $camera)';

  /// Label for [RaylibCoreModuleBase.GetWorldToScreenEx].
  String GetWorldToScreenEx(
    Vector3Base position,
    Camera3DBase camera,
    num width,
    num height,
  ) => 'GetWorldToScreenEx($position, $camera, $width, $height)';

  /// Label for [RaylibCoreModuleBase.GetWorldToScreen2D].
  String GetWorldToScreen2D(
    Vector2Base position,
    Camera2DBase camera,
  ) => 'GetWorldToScreen2D($position, $camera)';

  /// Label for [RaylibCoreModuleBase.GetScreenToWorld2D].
  String GetScreenToWorld2D(
    Vector2Base position,
    Camera2DBase camera,
  ) => 'GetScreenToWorld2D($position, $camera)';

  /// Label for [RaylibCoreModuleBase.GetCameraMatrix].
  String GetCameraMatrix(
    Camera3DBase camera,
  ) => 'GetCameraMatrix($camera)';

  /// Label for [RaylibCoreModuleBase.GetCameraMatrix2D].
  String GetCameraMatrix2D(
    Camera2DBase camera,
  ) => 'GetCameraMatrix2D($camera)';
    
  /// Label for [RaylibCoreModuleBase.SetTargetFPS].
  String SetTargetFPS(
    num fps,
  ) => 'SetTargetFPS($fps)';

  /// Label for [RaylibCoreModuleBase.GetFrameTime].
  String GetFrameTime() => 'GetFrameTime()';

  /// Label for [RaylibCoreModuleBase.GetTime].
  String GetTime() => 'GetTime()';

  /// Label for [RaylibCoreModuleBase.GetFPS].
  String GetFPS() => 'GetFPS()';

  /// Label for [RaylibCoreModuleBase.SwapScreenBuffer].
  String SwapScreenBuffer() => 'SwapScreenBuffer()';

  /// Label for [RaylibCoreModuleBase.PollInputEvents].
  String PollInputEvents() => 'PollInputEvents()';

  /// Label for [RaylibCoreModuleBase.WaitTime].
  String WaitTime(
    num seconds,
  ) => 'WaitTime($seconds)';

  /// Label for [RaylibCoreModuleBase.SetRandomSeed].
  String SetRandomSeed(
    num seed,
  ) => 'SetRandomSeed($seed)';

  /// Label for [RaylibCoreModuleBase.GetRandomValue].
  String GetRandomValue(
    num min,
    num max,
  ) => 'GetRandomValue($min, $max)';
  
  /// Label for [RaylibCoreModuleBase.LoadRandomSequence].
  String LoadRandomSequence(
    int count,
    int min,
    int max,
    [int? seed]
  ) => 'LoadRandomSequence($count, $min, $max, seed: $seed)';
    
  /// Label for [RaylibCoreModuleBase.TakeScreenshot].
  String TakeScreenshot(
    String fileName,
  ) => 'TakeScreenshot($fileName)';

  /// Label for [RaylibCoreModuleBase.SetConfigFlags].
  String SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => 'SetConfigFlags(${EnumsAsFlagsOr(flags)})';

  /// Label for [RaylibCoreModuleBase.OpenURL].
  String OpenURL(
    String url,
  ) => 'OpenURL($url)';

  /// Label for [RaylibCoreModuleBase.TraceLog].
  String TraceLog(
    TraceLogLevel logLevel,
    String text,
  ) => 'TraceLog(${logLevel.name}, $text)';

  /// Label for [RaylibCoreModuleBase.SetTraceLogLevel].
  String SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => 'SetTraceLogLevel(${logLevel.name})';
    
  /// Label for [RaylibCoreModuleBase.SetLoadFileDataCallback].
  String SetLoadFileDataCallback(
    LoadFileDataCallbackBase? callback
  ) => 'SetLoadFileDataCallback($callback)';
    
  /// Label for [RaylibCoreModuleBase.SetSaveFileDataCallback].
  String SetSaveFileDataCallback(
    SaveFileDataCallbackBase? callback
  ) => 'SetSaveFileDataCallback($callback)';
    
  /// Label for [RaylibCoreModuleBase.SetLoadFileTextCallback].
  String SetLoadFileTextCallback(
    LoadFileTextCallbackBase? callback
  ) => 'SetLoadFileTextCallback($callback)';
    
  /// Label for [RaylibCoreModuleBase.SetSaveFileTextCallback].
  String SetSaveFileTextCallback(
    SaveFileTextCallbackBase? callback
  ) => 'SetSaveFileTextCallback($callback)';
    
  /// Label for [RaylibCoreModuleBase.LoadFileData].
  String LoadFileData(
    String fileName,
  ) => 'LoadFileData($fileName)';

  /// Label for [RaylibCoreModuleBase.SaveFileData].
  String SaveFileData(
    String fileName,
    Uint8List data,
  ) => 'SaveFileData($fileName, data: ${data.length})';

  /// Label for [RaylibCoreModuleBase.ExportDataAsCode].
  String ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => 'ExportDataAsCode(data: ${data.length}, $fileName)';

  /// Label for [RaylibCoreModuleBase.LoadFileText].
  String LoadFileText(
    String fileName,
  ) => 'LoadFileText($fileName)';

  /// Label for [RaylibCoreModuleBase.SaveFileText].
  String SaveFileText(
    String fileName,
    String text,
  ) => 'SaveFileText($fileName, $text)';
    
  /// Label for [RaylibCoreModuleBase.FileExists].
  String FileExists(
    String fileName,
  ) => 'FileExists($fileName)';

  /// Label for [RaylibCoreModuleBase.DirectoryExists].
  String DirectoryExists(
    String dirPath,
  ) => 'DirectoryExists($dirPath)';

  /// Label for [RaylibCoreModuleBase.IsFileExtension].
  String IsFileExtension(
    String fileName,
    String ext,
  ) => 'IsFileExtension($fileName, $ext)';

  /// Label for [RaylibCoreModuleBase.GetFileLength].
  String GetFileLength(
    String fileName,
  ) => 'GetFileLength($fileName)';

  /// Label for [RaylibCoreModuleBase.GetFileExtension].
  String GetFileExtension(
    String fileName,
  ) => 'GetFileExtension($fileName)';

  /// Label for [RaylibCoreModuleBase.GetFileName].
  String GetFileName(
    String filePath,
  ) => 'GetFileName($filePath)';

  /// Label for [RaylibCoreModuleBase.GetFileNameWithoutExt].
  String GetFileNameWithoutExt(
    String filePath,
  ) => 'GetFileNameWithoutExt($filePath)';

  /// Label for [RaylibCoreModuleBase.GetDirectoryPath].
  String GetDirectoryPath(
    String filePath,
  ) => 'GetDirectoryPath($filePath)';

  /// Label for [RaylibCoreModuleBase.GetPrevDirectoryPath].
  String GetPrevDirectoryPath(
    String dirPath,
  ) => 'GetPrevDirectoryPath($dirPath)';

  /// Label for [RaylibCoreModuleBase.GetWorkingDirectory].
  String GetWorkingDirectory() => 'GetWorkingDirectory()';

  /// Label for [RaylibCoreModuleBase.GetApplicationDirectory].
  String GetApplicationDirectory() => 'GetApplicationDirectory()';

  /// Label for [RaylibCoreModuleBase.MakeDirectory].
  String MakeDirectory(
    String dirPath,
  ) => 'MakeDirectory($dirPath)';

  /// Label for [RaylibCoreModuleBase.ChangeDirectory].
  String ChangeDirectory(
    String dir,
  ) => 'ChangeDirectory($dir)';

  /// Label for [RaylibCoreModuleBase.IsPathFile].
  String IsPathFile(
    String path,
  ) => 'IsPathFile($path)';

  /// Label for [RaylibCoreModuleBase.IsFileNameValid].
  String IsFileNameValid(
    String fileName,
  ) => 'IsFileNameValid($fileName)';
    
  /// Label for [RaylibCoreModuleBase.LoadDirectoryFiles].
  String LoadDirectoryFiles(
    String dirPath,
  ) => 'LoadDirectoryFiles($dirPath)';
    
  /// Label for [RaylibCoreModuleBase.LoadDirectoryFilesEx].
  String LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'LoadDirectoryFilesEx($basePath, $filter, $scanSubdirs)';

  /// Label for [RaylibCoreModuleBase.UnloadDirectoryFiles].
  String UnloadDirectoryFiles(
    FilePathListBase files,
  ) => 'UnloadDirectoryFiles($files)';

  /// Label for [RaylibCoreModuleBase.IsFileDropped].
  String IsFileDropped() => 'IsFileDropped()';
    
  /// Label for [RaylibCoreModuleBase.LoadDroppedFiles].
  String LoadDroppedFiles() => 'LoadDroppedFiles()';

  /// Label for [RaylibCoreModuleBase.UnloadDroppedFiles].
  String UnloadDroppedFiles(
    FilePathListBase files,
  ) => 'UnloadDroppedFiles($files)';

  /// Label for [RaylibCoreModuleBase.GetFileModTime].
  String GetFileModTime(
    String fileName,
  ) => 'GetFileModTime($fileName)';

  /// Label for [RaylibCoreModuleBase.CompressData].
  String CompressData(
    Uint8List data,
  ) => 'CompressData(data: ${data.length})';

  /// Label for [RaylibCoreModuleBase.DecompressData].
  String DecompressData(
    Uint8List compData,
  ) => 'DecompressData(compData: ${compData.length})';

  /// Label for [RaylibCoreModuleBase.EncodeDataBase64].
  String EncodeDataBase64(
    Uint8List data,
  ) => 'EncodeDataBase64(data: ${data.length})';

  /// Label for [RaylibCoreModuleBase.DecodeDataBase64].
  String DecodeDataBase64(
    Uint8List data,
  ) => 'DecodeDataBase64(data: ${data.length})';

  /// Label for [RaylibCoreModuleBase.ComputeCRC32].
  String ComputeCRC32(
    Uint8List data,
  ) => 'ComputeCRC32(data: ${data.length})';

  /// Label for [RaylibCoreModuleBase.ComputeMD5].
  String ComputeMD5(
    Uint8List data,
  ) => 'ComputeMD5(data: ${data.length})';

  /// Label for [RaylibCoreModuleBase.ComputeSHA1].
  String ComputeSHA1(
    Uint8List data,
  ) => 'ComputeSHA1(data: ${data.length})';
    
  /// Label for [RaylibCoreModuleBase.LoadAutomationEventList].
  String LoadAutomationEventList(
    String? fileName,
  ) => 'LoadAutomationEventList($fileName)';
    
  /// Label for [RaylibCoreModuleBase.UnloadAutomationEventList].
  String UnloadAutomationEventList(
    AutomationEventListBase list,
  ) => 'UnloadAutomationEventList($list)';
    
  /// Label for [RaylibCoreModuleBase.ExportAutomationEventList].
  String ExportAutomationEventList(
    AutomationEventListBase list,
    String fileName,
  ) => 'ExportAutomationEventList($list, $fileName)';
    
  /// Label for [RaylibCoreModuleBase.SetAutomationEventList].
  String SetAutomationEventList(
    AutomationEventListBase list,
  ) => 'SetAutomationEventList($list)';
    
  /// Label for [RaylibCoreModuleBase.SetAutomationEventBaseFrame].
  String SetAutomationEventBaseFrame(
    int frame,
  ) => 'SetAutomationEventBaseFrame($frame)';
    
  /// Label for [RaylibCoreModuleBase.StartAutomationEventRecording].
  String StartAutomationEventRecording() => 'StartAutomationEventRecording()';

  /// Label for [RaylibCoreModuleBase.StopAutomationEventRecording].
  String StopAutomationEventRecording() => 'StopAutomationEventRecording()';
    
  /// Label for [RaylibCoreModuleBase.PlayAutomationEvent].
  String PlayAutomationEvent(
    AutomationEventBase event,
  ) => 'PlayAutomationEvent($event)';

  /// Label for [RaylibCoreModuleBase.IsKeyPressed].
  String IsKeyPressed(
    KeyboardKey key,
  ) => 'IsKeyPressed($key)';

  /// Label for [RaylibCoreModuleBase.IsKeyPressedRepeat].
  String IsKeyPressedRepeat(
    KeyboardKey key,
  ) => 'IsKeyPressedRepeat($key)';

  /// Label for [RaylibCoreModuleBase.IsKeyDown].
  String IsKeyDown(
    KeyboardKey key,
  ) => 'IsKeyDown($key)';
  
  /// Label for [RaylibCoreModuleBase.IsKeyReleased].
  String IsKeyReleased(
    KeyboardKey key,
  ) => 'IsKeyReleased($key)';
  
  /// Label for [RaylibCoreModuleBase.IsKeyUp].
  String IsKeyUp(
    KeyboardKey key,
  ) => 'IsKeyUp($key)';

  /// Label for [RaylibCoreModuleBase.GetKeyPressed].
  String GetKeyPressed() => 'GetKeyPressed()';

  /// Label for [RaylibCoreModuleBase.GetCharPressed].
  String GetCharPressed() => 'GetCharPressed()';

  /// Label for [RaylibCoreModuleBase.SetExitKey].
  String SetExitKey(
    KeyboardKey key,
  ) => 'SetExitKey(${key.name})';

  /// Label for [RaylibCoreModuleBase.IsGamepadAvailable].
  String IsGamepadAvailable(
    num gamepad,
  ) => 'IsGamepadAvailable($gamepad)';

  /// Label for [RaylibCoreModuleBase.GetGamepadName].
  String GetGamepadName(
    num gamepad,
  ) => 'GetGamepadName($gamepad)';

  /// Label for [RaylibCoreModuleBase.IsGamepadButtonPressed].
  String IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonPressed($gamepad, ${button.name})';

  /// Label for [RaylibCoreModuleBase.IsGamepadButtonDown].
  String IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonDown($gamepad, ${button.name})';

  /// Label for [RaylibCoreModuleBase.IsGamepadButtonReleased].
  String IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonReleased($gamepad, ${button.name})';

  /// Label for [RaylibCoreModuleBase.IsGamepadButtonUp].
  String IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonUp($gamepad, ${button.name})';

  /// Label for [RaylibCoreModuleBase.GetGamepadButtonPressed].
  String GetGamepadButtonPressed() => 'GetGamepadButtonPressed()';

  /// Label for [RaylibCoreModuleBase.GetGamepadAxisCount].
  String GetGamepadAxisCount(
    num gamepad,
  ) => 'GetGamepadAxisCount($gamepad)';

  /// Label for [RaylibCoreModuleBase.GetGamepadAxisMovement].
  String GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => 'GetGamepadAxisMovement($gamepad, $axis)';

  /// Label for [RaylibCoreModuleBase.SetGamepadMappings].
  String SetGamepadMappings(
    String mappings,
  ) => 'SetGamepadMappings($mappings)';
    
  /// Label for [RaylibCoreModuleBase.SetGamepadVibration].
  String SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => 'SetGamepadVibration($gamepad, $leftMotor, $rightMotor, $duration)';

  /// Label for [RaylibCoreModuleBase.IsMouseButtonPressed].
  String IsMouseButtonPressed(
    MouseButton button,
  ) => 'IsMouseButtonPressed(${button.name})';

  /// Label for [RaylibCoreModuleBase.IsMouseButtonDown].
  String IsMouseButtonDown(
    MouseButton button,
  ) => 'IsMouseButtonDown(${button.name})';

  /// Label for [RaylibCoreModuleBase.IsMouseButtonReleased].
  String IsMouseButtonReleased(
    MouseButton button,
  ) => 'IsMouseButtonReleased(${button.name})';

  /// Label for [RaylibCoreModuleBase.IsMouseButtonUp].
  String IsMouseButtonUp(
    MouseButton button,
  ) => 'IsMouseButtonUp(${button.name})';

  /// Label for [RaylibCoreModuleBase.GetMouseX].
  String GetMouseX() => 'GetMouseX()';

  /// Label for [RaylibCoreModuleBase.GetMouseY].
  String GetMouseY() => 'GetMouseY()';

  /// Label for [RaylibCoreModuleBase.GetMousePosition].
  String GetMousePosition() => 'GetMousePosition()';

  /// Label for [RaylibCoreModuleBase.GetMouseDelta].
  String GetMouseDelta() => 'GetMouseDelta()';

  /// Label for [RaylibCoreModuleBase.SetMousePosition].
  String SetMousePosition(
    num x,
    num y,
  ) => 'SetMousePosition($x, $y)';

  /// Label for [RaylibCoreModuleBase.SetMouseOffset].
  String SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => 'SetMouseOffset($offsetX, $offsetY)';

  /// Label for [RaylibCoreModuleBase.SetMouseScale].
  String SetMouseScale(
    num scaleX,
    num scaleY,
  ) => 'SetMouseScale($scaleX, $scaleY)';

  /// Label for [RaylibCoreModuleBase.GetMouseWheelMove].
  String GetMouseWheelMove() => 'GetMouseWheelMove()';

  /// Label for [RaylibCoreModuleBase.GetMouseWheelMoveV].
  String GetMouseWheelMoveV() => 'GetMouseWheelMoveV()';

  /// Label for [RaylibCoreModuleBase.SetMouseCursor].
  String SetMouseCursor(
    MouseCursor cursor,
  ) => 'SetMouseCursor(${cursor.name})';

  /// Label for [RaylibCoreModuleBase.GetTouchX].
  String GetTouchX() => 'GetTouchX()';

  /// Label for [RaylibCoreModuleBase.GetTouchY].
  String GetTouchY() => 'GetTouchY()';

  /// Label for [RaylibCoreModuleBase.GetTouchPosition].
  String GetTouchPosition(
    num index,
  ) => 'GetTouchPosition($index)';

  /// Label for [RaylibCoreModuleBase.GetTouchPointId].
  String GetTouchPointId(
    num index,
  ) => 'GetTouchPointId($index)';

  /// Label for [RaylibCoreModuleBase.GetTouchPointCount].
  String GetTouchPointCount() => 'GetTouchPointCount()';

  /// Label for [RaylibCoreModuleBase.SetGesturesEnabled].
  String SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => 'SetGesturesEnabled($flags)';

  /// Label for [RaylibCoreModuleBase.IsGestureDetected].
  String IsGestureDetected(
    Gesture key,
  ) => 'IsGestureDetected($key)';

  /// Label for [RaylibCoreModuleBase.GetGestureDetected].
  String GetGestureDetected() => 'GetGestureDetected()';

  /// Label for [RaylibCoreModuleBase.GetGestureHoldDuration].
  String GetGestureHoldDuration() => 'GetGestureHoldDuration()';

  /// Label for [RaylibCoreModuleBase.GetGestureDragVector].
  String GetGestureDragVector() => 'GetGestureDragVector()';

  /// Label for [RaylibCoreModuleBase.GetGestureDragAngle].
  String GetGestureDragAngle() => 'GetGestureDragAngle()';

  /// Label for [RaylibCoreModuleBase.GetGesturePinchVector].
  String GetGesturePinchVector() => 'GetGesturePinchVector()';

  /// Label for [RaylibCoreModuleBase.GetGesturePinchAngle].
  String GetGesturePinchAngle() => 'GetGesturePinchAngle()';
    
  /// Label for [RaylibCoreModuleBase.UpdateCamera].
  String UpdateCamera(
    Camera3DBase camera,
    CameraMode mode,
  ) => 'UpdateCamera($camera, $mode)';

  /// Label for [RaylibCoreModuleBase.UpdateCameraPro].
  String UpdateCameraPro(
    Camera3DBase camera,
    Vector3Base movement,
    Vector3Base rotation,
    num zoom,
  ) => 'UpdateCameraPro($camera, $movement, $rotation, $zoom)';

  /// Label for [RaylibCoreModuleBase.SetShapesTexture].
  String SetShapesTexture(
    TextureBase texture,
    RectangleBase source,
  ) => 'SetShapesTexture($texture, $source)';

  /// Label for [RaylibCoreModuleBase.GetShapesTexture].
  String GetShapesTexture() => 'GetShapesTexture()';

  /// Label for [RaylibCoreModuleBase.GetShapesTextureRectangle].
  String GetShapesTextureRectangle() => 'GetShapesTextureRectangle()';

  /// Label for [RaylibCoreModuleBase.DrawPixel].
  String DrawPixel(
    num posX,
    num posY,
    ColorBase color,
  ) => 'DrawPixel($posX, $posY, $color)';

  /// Label for [RaylibCoreModuleBase.DrawPixelV].
  String DrawPixelV(
    Vector2Base position,
    ColorBase color,
  ) => 'DrawPixelV($position, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawLine].
  String DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorBase color,
  ) => 'DrawLine($startPosX, $startPosY, $endPosX, $endPosY, $color)';

  /// Label for [RaylibCoreModuleBase.DrawLineV].
  String DrawLineV(
    Vector2Base startPos,
    Vector2Base endPos,
    ColorBase color,
  ) => 'DrawLineV($startPos, $endPos, $color)';

  /// Label for [RaylibCoreModuleBase.DrawLineEx].
  String DrawLineEx(
    Vector2Base startPos,
    Vector2Base endPos,
    num thick,
    ColorBase color,
  ) => 'DrawLineEx($startPos, $endPos, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawLineStrip].
  String DrawLineStrip(
    List<Vector2Base> points,
    ColorBase color,
  ) => 'DrawLineStrip(points: ${points.length}, $color)';

  /// Label for [RaylibCoreModuleBase.DrawLineBezier].
  String DrawLineBezier(
    Vector2Base startPos,
    Vector2Base endPos,
    num thick,
    ColorBase color,
  ) => 'DrawLineBezier($startPos, $endPos, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawCircle].
  String DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorBase color,
  ) => 'DrawCircle($centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreModuleBase.DrawCircleSector].
  String DrawCircleSector(
    Vector2Base center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorBase color,
  ) => 'DrawCircleSector($center, $radius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreModuleBase.DrawCircleSectorLines].
  String DrawCircleSectorLines(
    Vector2Base center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorBase color,
  ) => 'DrawCircleSectorLines($center, $radius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreModuleBase.DrawCircleGradient].
  String DrawCircleGradient(
    num centerX,
    num centerY,
    num radius,
    ColorBase inner,
    ColorBase outer,
  ) => 'DrawCircleGradient($centerX, $centerY, $radius, $inner, $outer)';

  /// Label for [RaylibCoreModuleBase.DrawCircleV].
  String DrawCircleV(
    Vector2Base center,
    num radius,
    ColorBase color,
  ) => 'DrawCircleV($center, $radius, $color)';

  /// Label for [RaylibCoreModuleBase.DrawCircleLines].
  String DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorBase color,
  ) => 'DrawCircleLines($centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreModuleBase.DrawCircleLinesV].
  String DrawCircleLinesV(
    Vector2Base center,
    num radius,
    ColorBase color,
  ) => 'DrawCircleLinesV($center, $radius, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawEllipse].
  String DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorBase color,
  ) => 'DrawEllipse($centerX, $centerY, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreModuleBase.DrawEllipseLines].
  String DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorBase color,
  ) => 'DrawEllipseLines($centerX, $centerY, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRing].
  String DrawRing(
    Vector2Base center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorBase color,
  ) => 'DrawRing($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRingLines].
  String DrawRingLines(
    Vector2Base center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorBase color,
  ) => 'DrawRingLines($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRectangle].
  String DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorBase color,
  ) => 'DrawRectangle($posX, $posY, $width, $height, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleV].
  String DrawRectangleV(
    Vector2Base position,
    Vector2Base size,
    ColorBase color,
  ) => 'DrawRectangleV($position, $size, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleRec].
  String DrawRectangleRec(
    RectangleBase rec,
    ColorBase color,
  ) => 'DrawRectangleRec($rec, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawRectanglePro].
  String DrawRectanglePro(
    RectangleBase rec,
    Vector2Base origin,
    num rotation,
    ColorBase color,
  ) => 'DrawRectanglePro($rec, $origin, $rotation, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleGradientV].
  String DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorBase top,
    ColorBase bottom,
  ) => 'DrawRectangleGradientV($posX, $posY, $width, $height, $top, $bottom)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleGradientH].
  String DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorBase left,
    ColorBase right,
  ) => 'DrawRectangleGradientH($posX, $posY, $width, $height, $left, $right)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleGradientEx].
  String DrawRectangleGradientEx(
    RectangleBase rec,
    ColorBase topLeft,
    ColorBase bottomLeft,
    ColorBase topRight,
    ColorBase bottomRight,
  ) => 'DrawRectangleGradientEx($rec, $topLeft, $bottomLeft, $topRight, $bottomRight)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleLines].
  String DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorBase color,
  ) => 'DrawRectangleLines($posX, $posY, $width, $height, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleLinesEx].
  String DrawRectangleLinesEx(
    RectangleBase rec,
    num lineThick,
    ColorBase color,
  ) => 'DrawRectangleLinesEx($rec, $lineThick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleRounded].
  String DrawRectangleRounded(
    RectangleBase rec,
    num roundness,
    num segments,
    ColorBase color,
  ) => 'DrawRectangleRounded($rec, $roundness, $segments, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleRoundedLines].
  String DrawRectangleRoundedLines(
    RectangleBase rec,
    num roundness,
    num segments,
    ColorBase color,
  ) => 'DrawRectangleRoundedLines($rec, $roundness, $segments, $color)';

  /// Label for [RaylibCoreModuleBase.DrawRectangleRoundedLinesEx].
  String DrawRectangleRoundedLinesEx(
    RectangleBase rec,
    num roundness,
    num segments,
    num lineThick,
    ColorBase color,
  ) => 'DrawRectangleRoundedLinesEx($rec, $roundness, $segments, $lineThick, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawTriangle].
  String DrawTriangle(
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase color,
  ) => 'DrawTriangle($v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreModuleBase.DrawTriangleLines].
  String DrawTriangleLines(
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase color,
  ) => 'DrawTriangleLines($v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreModuleBase.DrawTriangleFan].
  String DrawTriangleFan(
    List<Vector2Base> points,
    ColorBase color,
  ) => 'DrawTriangleFan(points: ${points.length}, $color)';

  /// Label for [RaylibCoreModuleBase.DrawTriangleStrip].
  String DrawTriangleStrip(
    List<Vector2Base> points,
    ColorBase color,
  ) => 'DrawTriangleStrip(points: ${points.length}, $color)';

  /// Label for [RaylibCoreModuleBase.DrawPoly].
  String DrawPoly(
    Vector2Base center,
    num sides,
    num radius,
    num rotation,
    ColorBase color,
  ) => 'DrawPoly($center, $sides, $radius, $rotation, $color)';

  /// Label for [RaylibCoreModuleBase.DrawPolyLines].
  String DrawPolyLines(
    Vector2Base center,
    num sides,
    num radius,
    num rotation,
    ColorBase color,
  ) => 'DrawPolyLines($center, $sides, $radius, $rotation, $color)';

  /// Label for [RaylibCoreModuleBase.DrawPolyLinesEx].
  String DrawPolyLinesEx(
    Vector2Base center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorBase color,
  ) => 'DrawPolyLinesEx($center, $sides, $radius, $rotation, $lineThick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineLinear].
  String DrawSplineLinear(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineLinear(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineBasis].
  String DrawSplineBasis(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineBasis(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineCatmullRom].
  String DrawSplineCatmullRom(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineCatmullRom(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineBezierQuadratic].
  String DrawSplineBezierQuadratic(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineBezierQuadratic(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineBezierCubic].
  String DrawSplineBezierCubic(
    List<Vector2Base> points,
    num thick,
    ColorBase color,
  ) => 'DrawSplineBezierCubic(points: ${points.length}, $thick, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawSplineSegmentLinear].
  String DrawSplineSegmentLinear(
    Vector2Base p1,
    Vector2Base p2,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentLinear($p1, $p2, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineSegmentBasis].
  String DrawSplineSegmentBasis(
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
    Vector2Base p4,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentBasis($p1, $p2, $p3, $p4, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineSegmentCatmullRom].
  String DrawSplineSegmentCatmullRom(
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
    Vector2Base p4,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentCatmullRom($p1, $p2, $p3, $p4, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineSegmentBezierQuadratic].
  String DrawSplineSegmentBezierQuadratic(
    Vector2Base p1,
    Vector2Base c2,
    Vector2Base p3,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentBezierQuadratic($p1, $c2, $p3, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.DrawSplineSegmentBezierCubic].
  String DrawSplineSegmentBezierCubic(
    Vector2Base p1,
    Vector2Base c2,
    Vector2Base c3,
    Vector2Base p4,
    num thick,
    ColorBase color,
  ) => 'DrawSplineSegmentBezierCubic($p1, $c2, $c3, $p4, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.GetSplinePointLinear].
  String GetSplinePointLinear(
    Vector2Base startPos,
    Vector2Base endPos,
    num t,
  ) => 'GetSplinePointLinear($startPos, $endPos, $t)';

  /// Label for [RaylibCoreModuleBase.GetSplinePointBasis].
  String GetSplinePointBasis(
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
    Vector2Base p4,
    num t,
  ) => 'GetSplinePointBasis($p1, $p2, $p3, $p4, $t)';
    
  /// Label for [RaylibCoreModuleBase.GetSplinePointCatmullRom].
  String GetSplinePointCatmullRom(
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
    Vector2Base p4,
    num t,
  ) => 'GetSplinePointCatmullRom($p1, $p2, $p3, $p4, $t)';

  /// Label for [RaylibCoreModuleBase.GetSplinePointBezierQuad].
  String GetSplinePointBezierQuad(
    Vector2Base p1,
    Vector2Base c2,
    Vector2Base p3,
    num t,
  ) => 'GetSplinePointBezierQuad($p1, $c2, $p3, $t)';

  /// Label for [RaylibCoreModuleBase.GetSplinePointBezierCubic].
  String GetSplinePointBezierCubic(
    Vector2Base p1,
    Vector2Base c2,
    Vector2Base c3,
    Vector2Base p4,
    num t,
  ) => 'GetSplinePointBezierCubic($p1, $c2, $c3, $p4, $t)';

  /// Label for [RaylibCoreModuleBase.CheckCollisionRecs].
  String CheckCollisionRecs(
    RectangleBase rec1,
    RectangleBase rec2,
  ) => 'CheckCollisionRecs($rec1, $rec2)';

  /// Label for [RaylibCoreModuleBase.CheckCollisionCircles].
  String CheckCollisionCircles(
    Vector2Base center1,
    num radius1,
    Vector2Base center2,
    num radius2,
  ) => 'CheckCollisionCircles($center1, $radius1, $center2, $radius2)';

  /// Label for [RaylibCoreModuleBase.CheckCollisionCircleRec].
  String CheckCollisionCircleRec(
    Vector2Base center,
    num radius,
    RectangleBase rec,
  ) => 'CheckCollisionCircleRec($center, $radius, $rec)';

  /// Label for [RaylibCoreModuleBase.CheckCollisionCircleLine].
  String CheckCollisionCircleLine(
    Vector2Base center,
    num radius,
    Vector2Base p1,
    Vector2Base p2,
  ) => 'CheckCollisionCircleLine($center, $radius, $p1, $p2)';

  /// Label for [RaylibCoreModuleBase.CheckCollisionPointRec].
  String CheckCollisionPointRec(
    Vector2Base point,
    RectangleBase rec,
  ) => 'CheckCollisionPointRec($point, $rec)';
    
  /// Label for [RaylibCoreModuleBase.CheckCollisionPointCircle].
  String CheckCollisionPointCircle(
    Vector2Base point,
    Vector2Base center,
    num radius,
  ) => 'CheckCollisionPointCircle($point, $center, $radius)';

  /// Label for [RaylibCoreModuleBase.CheckCollisionPointTriangle].
  String CheckCollisionPointTriangle(
    Vector2Base point,
    Vector2Base p1,
    Vector2Base p2,
    Vector2Base p3,
  ) => 'CheckCollisionPointTriangle($point, $p1, $p2, $p3)';

  /// Label for [RaylibCoreModuleBase.CheckCollisionPointLine].
  String CheckCollisionPointLine(
    Vector2Base point,
    Vector2Base p1,
    Vector2Base p2,
    num threshold,
  ) => 'CheckCollisionPointLine($point, $p1, $p2, $threshold)';

  /// Label for [RaylibCoreModuleBase.CheckCollisionPointPoly].
  String CheckCollisionPointPoly(
    Vector2Base point,
    List<Vector2Base> points,
  ) => 'CheckCollisionPointPoly($point, points: ${points.length})';

  /// Label for [RaylibCoreModuleBase.CheckCollisionLines].
  String CheckCollisionLines(
    Vector2Base startPos1,
    Vector2Base endPos1,
    Vector2Base startPos2,
    Vector2Base endPos2,
  ) => 'CheckCollisionLines($startPos1, $endPos1, $startPos2, $endPos2)';

  /// Label for [RaylibCoreModuleBase.GetCollisionRec].
  String GetCollisionRec(
    RectangleBase rec1,
    RectangleBase rec2,
  ) => 'GetCollisionRec($rec1, $rec2)';

  /// Label for [RaylibCoreModuleBase.LoadImage].
  String LoadImage(
    String fileName,
  ) => 'LoadImage($fileName)';
    
  /// Label for [RaylibCoreModuleBase.LoadImageRaw].
  String LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => 'LoadImageRaw($fileName, $width, $height, ${format.name}, $headerSize)';

  /// Label for [RaylibCoreModuleBase.LoadImageAnim].
  String LoadImageAnim(
    String fileName,
  ) => 'LoadImageAnim($fileName)';

  /// Label for [RaylibCoreModuleBase.LoadImageAnimFromMemory].
  String LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageAnimFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibCoreModuleBase.LoadImageFromMemory].
  String LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibCoreModuleBase.LoadImageFromTexture].
  String LoadImageFromTexture(
    TextureBase texture,
  ) => 'LoadImageFromTexture($texture)';

  /// Label for [RaylibCoreModuleBase.LoadImageFromScreen].
  String LoadImageFromScreen() => 'LoadImageFromScreen()';

  /// Label for [RaylibCoreModuleBase.IsImageValid].
  String IsImageValid(
    ImageBase image,
  ) => 'IsImageValid($image)';

  /// Label for [RaylibCoreModuleBase.UnloadImage].
  String UnloadImage(
    ImageBase image,
  ) => 'UnloadImage($image)';

  /// Label for [RaylibCoreModuleBase.ExportImage].
  String ExportImage(
    ImageBase image,
    String fileName,
  ) => 'ExportImage($image, $fileName)';
    
  /// Label for [RaylibCoreModuleBase.ExportImageToMemory].
  String ExportImageToMemory(
    ImageBase image,
    String fileType,
  ) => 'ExportImageToMemory($image, $fileType)';

  /// Label for [RaylibCoreModuleBase.ExportImageAsCode].
  String ExportImageAsCode(
    ImageBase image,
    String fileName,
  ) => 'ExportImageAsCode($image, $fileName)';

  /// Label for [RaylibCoreModuleBase.GenImageColor].
  String GenImageColor(
    num width,
    num height,
    ColorBase color,
  ) => 'GenImageColor($width, $height, $color)';

  /// Label for [RaylibCoreModuleBase.GenImageGradientLinear].
  String GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorBase start,
    ColorBase end,
  ) => 'GenImageGradientLinear($width, $height, $direction, $start, $end)';

  /// Label for [RaylibCoreModuleBase.GenImageGradientRadial].
  String GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorBase inner,
    ColorBase outer,
  ) => 'GenImageGradientRadial($width, $height, $density, $inner, $outer)';

  /// Label for [RaylibCoreModuleBase.GenImageGradientSquare].
  String GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorBase inner,
    ColorBase outer,
  ) => 'GenImageGradientSquare($width, $height, $density, $inner, $outer)';

  /// Label for [RaylibCoreModuleBase.GenImageChecked].
  String GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorBase col1,
    ColorBase col2,
  ) => 'GenImageChecked($width, $height, $checksX, $checksY, $col1, $col2)';

  /// Label for [RaylibCoreModuleBase.GenImageWhiteNoise].
  String GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => 'GenImageWhiteNoise($width, $height, $factor)';

  /// Label for [RaylibCoreModuleBase.GenImagePerlinNoise].
  String GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => 'GenImagePerlinNoise($width, $height, $offsetX, $offsetY, $scale)';
    
  /// Label for [RaylibCoreModuleBase.GenImageCellular].
  String GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => 'GenImageCellular($width, $height, $tileSize)';

  /// Label for [RaylibCoreModuleBase.GenImageText].
  String GenImageText(
    num width,
    num height,
    String text,
  ) => 'GenImageText($width, $height, $text)';

  /// Label for [RaylibCoreModuleBase.ImageCopy].
  String ImageCopy(
    ImageBase image,
  ) => 'ImageCopy($image)';

  /// Label for [RaylibCoreModuleBase.ImageFromImage].
  String ImageFromImage(
    ImageBase image,
    RectangleBase rec,
  ) => 'ImageFromImage($image, $rec)';

  /// Label for [RaylibCoreModuleBase.ImageFromChannel].
  String ImageFromChannel(
    ImageBase image,
    num selectedChannel,
  ) => 'ImageFromChannel($image, $selectedChannel)';

  /// Label for [RaylibCoreModuleBase.ImageText].
  String ImageText(
    String text,
    num fontSize,
    ColorBase color,
  ) => 'ImageText($text, $fontSize, $color)';

  /// Label for [RaylibCoreModuleBase.ImageTextEx].
  String ImageTextEx(
    FontBase font,
    String text,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'ImageTextEx($font, $text, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreModuleBase.ImageFormat].
  String ImageFormat(
    ImageBase image,
    PixelFormat newFormat,
  ) => 'ImageFormat($image, ${newFormat.name})';
    
  /// Label for [RaylibCoreModuleBase.ImageToPOT].
  String ImageToPOT(
    ImageBase image,
    ColorBase fill,
  ) => 'ImageToPOT($image, $fill)';

  /// Label for [RaylibCoreModuleBase.ImageCrop].
  String ImageCrop(
    ImageBase image,
    RectangleBase crop,
  ) => 'ImageCrop($image, $crop)';

  /// Label for [RaylibCoreModuleBase.ImageAlphaCrop].
  String ImageAlphaCrop(
    ImageBase image,
    num threshold,
  ) => 'ImageAlphaCrop($image, $threshold)';

  /// Label for [RaylibCoreModuleBase.ImageAlphaClear].
  String ImageAlphaClear(
    ImageBase image,
    ColorBase color,
    num threshold,
  ) => 'ImageAlphaClear($image, $color, $threshold)';

  /// Label for [RaylibCoreModuleBase.ImageAlphaMask].
  String ImageAlphaMask(
    ImageBase image,
    ImageBase alphaMask,
  ) => 'ImageAlphaMask($image, $alphaMask)';

  /// Label for [RaylibCoreModuleBase.ImageAlphaPremultiply].
  String ImageAlphaPremultiply(
    ImageBase image,
  ) => 'ImageAlphaPremultiply($image)';

  /// Label for [RaylibCoreModuleBase.ImageBlurGaussian].
  String ImageBlurGaussian(
    ImageBase image,
    num blurSize,
  ) => 'ImageBlurGaussian($image, $blurSize)';

  /// Label for [RaylibCoreModuleBase.ImageKernelConvolution].
  String ImageKernelConvolution(
    ImageBase image,
    List<double> kernel,
  ) => 'ImageKernelConvolution($image, kernel: ${kernel.length})';

  /// Label for [RaylibCoreModuleBase.ImageResize].
  String ImageResize(
    ImageBase image,
    num newWidth,
    num newHeight,
  ) => 'ImageResize($image, $newWidth, $newHeight)';

  /// Label for [RaylibCoreModuleBase.ImageResizeNN].
  String ImageResizeNN(
    ImageBase image,
    num newWidth,
    num newHeight,
  ) => 'ImageResizeNN($image, $newWidth, $newHeight)';
    
  /// Label for [RaylibCoreModuleBase.ImageResizeCanvas].
  String ImageResizeCanvas(
    ImageBase image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorBase fill,
  ) => 'ImageResizeCanvas($image, $newWidth, $newHeight, $offsetX, $offsetY, $fill)';

  /// Label for [RaylibCoreModuleBase.ImageMipmaps].
  String ImageMipmaps(
    ImageBase image,
  ) => 'ImageMipmaps($image)';

  /// Label for [RaylibCoreModuleBase.ImageDither].
  String ImageDither(
    ImageBase image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => 'ImageDither($image, $rBpp, $gBpp, $bBpp, $aBpp)';

  /// Label for [RaylibCoreModuleBase.ImageFlipVertical].
  String ImageFlipVertical(
    ImageBase image,
  ) => 'ImageFlipVertical($image)';

  /// Label for [RaylibCoreModuleBase.ImageFlipHorizontal].
  String ImageFlipHorizontal(
    ImageBase image,
  ) => 'ImageFlipHorizontal($image)';

  /// Label for [RaylibCoreModuleBase.ImageRotate].
  String ImageRotate(
    ImageBase image,
    num degrees,
  ) => 'ImageRotate($image, $degrees)';

  /// Label for [RaylibCoreModuleBase.ImageRotateCW].
  String ImageRotateCW(
    ImageBase image,
  ) => 'ImageRotateCW($image)';

  /// Label for [RaylibCoreModuleBase.ImageRotateCCW].
  String ImageRotateCCW(
    ImageBase image,
  ) => 'ImageRotateCCW($image)';
    
  /// Label for [RaylibCoreModuleBase.ImageColorTint].
  String ImageColorTint(
    ImageBase image,
    ColorBase color,
  ) => 'ImageColorTint($image, $color)';

  /// Label for [RaylibCoreModuleBase.ImageColorInvert].
  String ImageColorInvert(
    ImageBase image,
  ) => 'ImageColorInvert($image)';

  /// Label for [RaylibCoreModuleBase.ImageColorGrayscale].
  String ImageColorGrayscale(
    ImageBase image,
  ) => 'ImageColorGrayscale($image)';

  /// Label for [RaylibCoreModuleBase.ImageColorContrast].
  String ImageColorContrast(
    ImageBase image,
    num contrast,
  ) => 'ImageColorContrast($image, $contrast)';

  /// Label for [RaylibCoreModuleBase.ImageColorBrightness].
  String ImageColorBrightness(
    ImageBase image,
    num brightness,
  ) => 'ImageColorBrightness($image, $brightness)';

  /// Label for [RaylibCoreModuleBase.ImageColorReplace].
  String ImageColorReplace(
    ImageBase image,
    ColorBase color,
    ColorBase replace,
  ) => 'ImageColorReplace($image, $color, $replace)';

  /// Label for [RaylibCoreModuleBase.LoadImageColors].
  String LoadImageColors(
    ImageBase image,
  ) => 'LoadImageColors($image)';
  
  /// Label for [RaylibCoreModuleBase.LoadImagePalette].
  String LoadImagePalette(
    ImageBase image,
    num maxPaletteSize,
  ) => 'LoadImagePalette($image, $maxPaletteSize)';

  /// Label for [RaylibCoreModuleBase.GetImageAlphaBorder].
  String GetImageAlphaBorder(
    ImageBase image,
    num threshold,
  ) => 'GetImageAlphaBorder($image, $threshold)';

  /// Label for [RaylibCoreModuleBase.GetImageColor].
  String GetImageColor(
    ImageBase image,
    num x,
    num y,
  ) => 'GetImageColor($image, $x, $y)';

  /// Label for [RaylibCoreModuleBase.ImageClearBackground].
  String ImageClearBackground(
    ImageBase dst,
    ColorBase color,
  ) => 'ImageClearBackground($dst, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawPixel].
  String ImageDrawPixel(
    ImageBase dst,
    num posX,
    num posY,
    ColorBase color,
  ) => 'ImageDrawPixel($dst, $posX, $posY, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawPixelV].
  String ImageDrawPixelV(
    ImageBase dst,
    Vector2Base position,
    ColorBase color,
  ) => 'ImageDrawPixelV($dst, $position, $color)';
    
  /// Label for [RaylibCoreModuleBase.ImageDrawLine].
  String ImageDrawLine(
    ImageBase dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorBase color,
  ) => 'ImageDrawLine($dst, $startPosX, $startPosY, $endPosX, $endPosY, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawLineV].
  String ImageDrawLineV(
    ImageBase dst,
    Vector2Base start,
    Vector2Base end,
    ColorBase color,
  ) => 'ImageDrawLineV($dst, $start, $end, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawLineEx].
  String ImageDrawLineEx(
    ImageBase dst,
    Vector2Base start,
    Vector2Base end,
    num thick,
    ColorBase color,
  ) => 'ImageDrawLineEx($dst, $start, $end, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawCircle].
  String ImageDrawCircle(
    ImageBase dst,
    num centerX,
    num centerY,
    num radius,
    ColorBase color,
  ) => 'ImageDrawCircle($dst, $centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawCircleV].
  String ImageDrawCircleV(
    ImageBase dst,
    Vector2Base center,
    num radius,
    ColorBase color,
  ) => 'ImageDrawCircleV($dst, $center, $radius, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawCircleLines].
  String ImageDrawCircleLines(
    ImageBase dst,
    num centerX,
    num centerY,
    num radius,
    ColorBase color,
  ) => 'ImageDrawCircleLines($dst, $centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawCircleLinesV].
  String ImageDrawCircleLinesV(
    ImageBase dst,
    Vector2Base center,
    num radius,
    ColorBase color,
  ) => 'ImageDrawCircleLinesV($dst, $center, $radius, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawRectangle].
  String ImageDrawRectangle(
    ImageBase dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorBase color,
  ) => 'ImageDrawRectangle($dst, $posX, $posY, $width, $height, $color)';
    
  /// Label for [RaylibCoreModuleBase.ImageDrawRectangleV].
  String ImageDrawRectangleV(
    ImageBase dst,
    Vector2Base position,
    Vector2Base size,
    ColorBase color,
  ) => 'ImageDrawRectangleV($dst, $position, $size, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawRectangleRec].
  String ImageDrawRectangleRec(
    ImageBase dst,
    RectangleBase rec,
    ColorBase color,
  ) => 'ImageDrawRectangleRec($dst, $rec, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawRectangleLines].
  String ImageDrawRectangleLines(
    ImageBase dst,
    RectangleBase rec,
    num thick,
    ColorBase color,
  ) => 'ImageDrawRectangleLines($dst, $rec, $thick, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawTriangle].
  String ImageDrawTriangle(
    ImageBase dst,
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase color,
  ) => 'ImageDrawTriangle($dst, $v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawTriangleEx].
  String ImageDrawTriangleEx(
    ImageBase dst,
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase c1,
    ColorBase c2,
    ColorBase c3,
  ) => 'ImageDrawTriangleEx($dst, $v1, $v2, $v3, $c1, $c2, $c3)';

  /// Label for [RaylibCoreModuleBase.ImageDrawTriangleLines].
  String ImageDrawTriangleLines(
    ImageBase dst,
    Vector2Base v1,
    Vector2Base v2,
    Vector2Base v3,
    ColorBase color,
  ) => 'ImageDrawTriangleLines($dst, $v1, $v2, $v3, $color)';
    
  /// Label for [RaylibCoreModuleBase.ImageDrawTriangleFan].
  String ImageDrawTriangleFan(
    ImageBase dst,
    List<Vector2Base> points,
    ColorBase color,
  ) => 'ImageDrawTriangleFan($dst, points: ${points.length}, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawTriangleStrip].
  String ImageDrawTriangleStrip(
    ImageBase dst,
    List<Vector2Base> points,
    ColorBase color,
  ) => 'ImageDrawTriangleStrip($dst, points: ${points.length}, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDraw].
  String ImageDraw(
    ImageBase dst,
    ImageBase src,
    RectangleBase srcRec,
    RectangleBase dstRec,
    ColorBase tint,
  ) => 'ImageDraw($dst, $src, $srcRec, $dstRec, $tint)';

  /// Label for [RaylibCoreModuleBase.ImageDrawText].
  String ImageDrawText(
    ImageBase dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorBase color,
  ) => 'ImageDrawText($dst, $text, $posX, $posY, $fontSize, $color)';

  /// Label for [RaylibCoreModuleBase.ImageDrawTextEx].
  String ImageDrawTextEx(
    ImageBase dst,
    FontBase font,
    String text,
    Vector2Base position,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'ImageDrawTextEx($dst, $font, $text, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreModuleBase.LoadTexture].
  String LoadTexture(
    String fileName,
  ) => 'LoadTexture($fileName)';

  /// Label for [RaylibCoreModuleBase.LoadTextureFromImage].
  String LoadTextureFromImage(
    ImageBase image,
  ) => 'LoadTextureFromImage($image)';

  /// Label for [RaylibCoreModuleBase.LoadTextureCubemap].
  String LoadTextureCubemap(
    ImageBase image,
    CubemapLayout layout,
  ) => 'LoadTextureCubemap($image, $layout)';

  /// Label for [RaylibCoreModuleBase.LoadRenderTexture].
  String LoadRenderTexture(
    num width,
    num height,
  ) => 'LoadRenderTexture($width, $height)';

  /// Label for [RaylibCoreModuleBase.IsTextureValid].
  String IsTextureValid(
    TextureBase texture,
  ) => 'IsTextureValid($texture)';

  /// Label for [RaylibCoreModuleBase.UnloadTexture].
  String UnloadTexture(
    TextureBase texture,
  ) => 'UnloadTexture($texture)';

  /// Label for [RaylibCoreModuleBase.IsRenderTextureValid].
  String IsRenderTextureValid(
    RenderTextureBase target,
  ) => 'IsRenderTextureValid($target)';

  /// Label for [RaylibCoreModuleBase.UnloadRenderTexture].
  String UnloadRenderTexture(
    RenderTextureBase target,
  ) => 'UnloadRenderTexture($target)';

  /// Label for [RaylibCoreModuleBase.UpdateTexture].
  String UpdateTexture(
    TextureBase texture,
    Uint8List pixels,
  ) => 'UpdateTexture($texture, pixels: ${pixels.length})';
    
  /// Label for [RaylibCoreModuleBase.UpdateTextureRec].
  String UpdateTextureRec(
    TextureBase texture,
    RectangleBase rec,
    Uint8List pixels,
  ) => 'UpdateTextureRec($texture, $rec, pixels: ${pixels.length})';

  /// Label for [RaylibCoreModuleBase.GenTextureMipmaps].
  String GenTextureMipmaps(
    TextureBase texture,
  ) => 'GenTextureMipmaps($texture)';

  /// Label for [RaylibCoreModuleBase.SetTextureFilter].
  String SetTextureFilter(
    TextureBase texture,
    TextureFilter filter,
  ) => 'SetTextureFilter($texture, $filter)';

  /// Label for [RaylibCoreModuleBase.SetTextureWrap].
  String SetTextureWrap(
    TextureBase texture,
    TextureWrap wrap,
  ) => 'SetTextureWrap($texture, $wrap)';

  /// Label for [RaylibCoreModuleBase.DrawTexture].
  String DrawTexture(
    TextureBase texture,
    num posX,
    num posY,
    ColorBase tint,
  ) => 'DrawTexture($texture, $posX, $posY, $tint)';

  /// Label for [RaylibCoreModuleBase.DrawTextureV].
  String DrawTextureV(
    TextureBase texture,
    Vector2Base position,
    ColorBase tint,
  ) => 'DrawTextureV($texture, $position, $tint)';
    
  /// Label for [RaylibCoreModuleBase.DrawTextureEx].
  String DrawTextureEx(
    TextureBase texture,
    Vector2Base position,
    num rotation,
    num scale,
    ColorBase tint,
  ) => 'DrawTextureEx($texture, $position, $rotation, $scale, $tint)';

  /// Label for [RaylibCoreModuleBase.DrawTextureRec].
  String DrawTextureRec(
    TextureBase texture,
    RectangleBase source,
    Vector2Base position,
    ColorBase tint,
  ) => 'DrawTextureRec($texture, $source, $position, $tint)';

  /// Label for [RaylibCoreModuleBase.DrawTexturePro].
  String DrawTexturePro(
    TextureBase texture,
    RectangleBase source,
    RectangleBase dest,
    Vector2Base origin,
    num rotation,
    ColorBase tint,
  ) => 'DrawTexturePro($texture, $source, $dest, $origin, $rotation, $tint)';

  /// Label for [RaylibCoreModuleBase.DrawTextureNPatch].
  String DrawTextureNPatch(
    TextureBase texture,
    NPatchInfoBase nPatchInfo,
    RectangleBase dest,
    Vector2Base origin,
    num rotation,
    ColorBase tint,
  ) => 'DrawTextureNPatch($texture, $nPatchInfo, $dest, $origin, $rotation, $tint)';

  /// Label for [RaylibCoreModuleBase.ColorIsEqual].
  String ColorIsEqual(
    ColorBase col1,
    ColorBase col2,
  ) => 'ColorIsEqual($col1, $col2)';

  /// Label for [RaylibCoreModuleBase.Fade].
  String Fade(
    ColorBase color,
    num alpha,
  ) => 'Fade($color, $alpha)';

  /// Label for [RaylibCoreModuleBase.ColorToInt].
  String ColorToInt(
    ColorBase color,
  ) => 'ColorToInt($color)';

  /// Label for [RaylibCoreModuleBase.ColorNormalize].
  String ColorNormalize(
    ColorBase color,
  ) => 'ColorNormalize($color)';

  /// Label for [RaylibCoreModuleBase.ColorFromNormalized].
  String ColorFromNormalized(
    Vector4Base normalized,
  ) => 'ColorFromNormalized($normalized)';

  /// Label for [RaylibCoreModuleBase.ColorToHSV].
  String ColorToHSV(
    ColorBase color,
  ) => 'ColorToHSV($color)';

  /// Label for [RaylibCoreModuleBase.ColorFromHSV].
  String ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => 'ColorFromHSV($hue, $saturation, $value)';

  /// Label for [RaylibCoreModuleBase.ColorTint].
  String ColorTint(
    ColorBase color,
    ColorBase tint,
  ) => 'ColorTint($color, $tint)';

  /// Label for [RaylibCoreModuleBase.ColorBrightness].
  String ColorBrightness(
    ColorBase color,
    num factor,
  ) => 'ColorBrightness($color, $factor)';

  /// Label for [RaylibCoreModuleBase.ColorContrast].
  String ColorContrast(
    ColorBase color,
    num contrast,
  ) => 'ColorContrast($color, $contrast)';

  /// Label for [RaylibCoreModuleBase.ColorAlpha].
  String ColorAlpha(
    ColorBase color,
    num alpha,
  ) => 'ColorAlpha($color, $alpha)';

  /// Label for [RaylibCoreModuleBase.ColorAlphaBlend].
  String ColorAlphaBlend(
    ColorBase dst,
    ColorBase src,
    ColorBase tint,
  ) => 'ColorAlphaBlend($dst, $src, $tint)';

  /// Label for [RaylibCoreModuleBase.ColorLerp].
  String ColorLerp(
    ColorBase color1,
    ColorBase color2,
    num factor,
  ) => 'ColorLerp($color1, $color2, $factor)';

  /// Label for [RaylibCoreModuleBase.GetColor].
  String GetColor(
    num hexValue,
  ) => 'GetColor($hexValue)';

  /// Label for [RaylibCoreModuleBase.GetPixelDataSize].
  String GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => 'GetPixelDataSize($width, $height, $format)';

  /// Label for [RaylibCoreModuleBase.GetFontDefault].
  String GetFontDefault() => 'GetFontDefault()';

  /// Label for [RaylibCoreModuleBase.LoadFont].
  String LoadFont(
    String fileName,
  ) => 'LoadFont($fileName)';
    
  /// Label for [RaylibCoreModuleBase.LoadFontEx].
  String LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codePointCount
    ]
  ) => 'LoadFontEx($fileName, $fontSize, codepoints: ${codepoints?.length})';

  /// Label for [RaylibCoreModuleBase.LoadFontFromImage].
  String LoadFontFromImage(
    ImageBase image,
    ColorBase key,
    num firstChar,
  ) => 'LoadFontFromImage($image, $key, $firstChar)';

  /// Label for [RaylibCoreModuleBase.LoadFontFromMemory].
  String LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => 'LoadFontFromMemory($fileType, fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints.length})';

  /// Label for [RaylibCoreModuleBase.IsFontValid].
  String IsFontValid(
    FontBase font,
  ) => 'IsFontValid($font)';

  /// Label for [RaylibCoreModuleBase.LoadFontData].
  String LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => 'LoadFontData(fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints?.length}, $type)';

  /// Label for [RaylibCoreModuleBase.GenImageFontAtlas].
  String GenImageFontAtlas(
    List<GlyphInfoBase> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => 'GenImageFontAtlas(glyphs: ${glyphs.length}, $fontSize, $padding, $packMethod)';

  /// Label for [RaylibCoreModuleBase.UnloadFontData].
  String UnloadFontData(
    List<GlyphInfoBase> glyphs,
  ) => 'UnloadFontData(glyphs: ${glyphs.length})';
    
  /// Label for [RaylibCoreModuleBase.UnloadFont].
  String UnloadFont(
    FontBase font,
  ) => 'UnloadFont($font)';

  /// Label for [RaylibCoreModuleBase.ExportFontAsCode].
  String ExportFontAsCode(
    FontBase font,
    String fileName,
  ) => 'ExportFontAsCode($font, $fileName)';

  /// Label for [RaylibCoreModuleBase.DrawFPS].
  String DrawFPS(
    num posX,
    num posY,
  ) => 'DrawFPS($posX, $posY)';

  /// Label for [RaylibCoreModuleBase.DrawText].
  String DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorBase color,
  ) => 'DrawText($text, $posX, $posY, $fontSize, $color)';

  /// Label for [RaylibCoreModuleBase.DrawTextEx].
  String DrawTextEx(
    FontBase font,
    String text,
    Vector2Base position,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'DrawTextEx($font, $text, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreModuleBase.DrawTextPro].
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
    
  /// Label for [RaylibCoreModuleBase.DrawTextCodepoint].
  String DrawTextCodepoint(
    FontBase font,
    num codepoint,
    Vector2Base position,
    num fontSize,
    ColorBase tint,
  ) => 'DrawTextCodepoint($font, $codepoint, $position, $fontSize, $tint)';

  /// Label for [RaylibCoreModuleBase.DrawTextCodepoints].
  String DrawTextCodepoints(
    FontBase font,
    Int32List codepoints,
    Vector2Base position,
    num fontSize,
    num spacing,
    ColorBase tint,
  ) => 'DrawTextCodepoints($font, codepoints: ${codepoints.length}, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreModuleBase.SetTextLineSpacing].
  String SetTextLineSpacing(
    num spacing,
  ) => 'SetTextLineSpacing($spacing)';

  /// Label for [RaylibCoreModuleBase.MeasureText].
  String MeasureText(
    String text,
    num fontSize,
  ) => 'MeasureText($text, $fontSize)';
    
  /// Label for [RaylibCoreModuleBase.MeasureTextEx].
  String MeasureTextEx(
    FontBase font,
    String text,
    num fontSize,
    num spacing,
  ) => 'MeasureTextEx($font, $text, $fontSize, $spacing)';

  /// Label for [RaylibCoreModuleBase.GetGlyphIndex].
  String GetGlyphIndex(
    FontBase font,
    num codepoint,
  ) => 'GetGlyphIndex($font, $codepoint)';

  /// Label for [RaylibCoreModuleBase.GetGlyphInfo].
  String GetGlyphInfo(
    FontBase font,
    num codepoint,
  ) => 'GetGlyphInfo($font, $codepoint)';

  /// Label for [RaylibCoreModuleBase.GetGlyphAtlasRec].
  String GetGlyphAtlasRec(
    FontBase font,
    num codepoint,
  ) => 'GetGlyphAtlasRec($font, $codepoint)';
    
  /// Label for [RaylibCoreModuleBase.LoadUTF8].
  String LoadUTF8(
    Int32List codepoints,
  ) => 'LoadUTF8(codepoints: ${codepoints.length})';

  /// Label for [RaylibCoreModuleBase.LoadCodepoints].
  String LoadCodepoints(
    String text,
  ) => 'LoadCodepoints($text)';

  /// Label for [RaylibCoreModuleBase.GetCodepointCount].
  String GetCodepointCount(
    String text,
  ) => 'GetCodepointCount($text)';

  /// Label for [RaylibCoreModuleBase.GetCodepoint].
  String GetCodepoint(
    String text,
  ) => 'GetCodepoint($text)';

  /// Label for [RaylibCoreModuleBase.GetCodepointNext].
  String GetCodepointNext(
    String text,
  ) => 'GetCodepointNext($text)';

  /// Label for [RaylibCoreModuleBase.GetCodepointPrevious].
  String GetCodepointPrevious(
    String text,
  ) => 'GetCodepointPrevious($text)';

  /// Label for [RaylibCoreModuleBase.CodepointToUTF8].
  String CodepointToUTF8(
    num codepoint,
  ) => 'CodepointToUTF8($codepoint)';
    
  /// Label for [RaylibCoreModuleBase.DrawLine3D].
  String DrawLine3D(
    Vector3Base startPos,
    Vector3Base endPos,
    ColorBase color,
  ) => 'DrawLine3D($startPos, $endPos, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawPoint3D].
  String DrawPoint3D(
    Vector3Base position,
    ColorBase color,
  ) => 'DrawPoint3D($position, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCircle3D].
  String DrawCircle3D(
    Vector3Base center,
    num radius,
    Vector3Base rotationAxis,
    num rotationAngle,
    ColorBase color,
  ) => 'DrawCircle3D($center, $radius, $rotationAxis, $rotationAngle, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawTriangle3D].
  String DrawTriangle3D(
    Vector3Base v1,
    Vector3Base v2,
    Vector3Base v3,
    ColorBase color,
  ) => 'DrawTriangle3D($v1, $v2, $v3, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawTriangleStrip3D].
  String DrawTriangleStrip3D(
    List<Vector3Base> points,
    ColorBase color,
  ) => 'DrawTriangleStrip3D(points: ${points.length}, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCube].
  String DrawCube(
    Vector3Base position,
    num width,
    num height,
    num length,
    ColorBase color,
  ) => 'DrawCube($position, $width, $height, $length, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCubeV].
  String DrawCubeV(
    Vector3Base position,
    Vector3Base size,
    ColorBase color,
  ) => 'DrawCubeV($position, $size, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCubeWires].
  String DrawCubeWires(
    Vector3Base position,
    num width,
    num height,
    num length,
    ColorBase color,
  ) => 'DrawCubeWires($position, $width, $height, $length, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCubeWiresV].
  String DrawCubeWiresV(
    Vector3Base position,
    Vector3Base size,
    ColorBase color,
  ) => 'DrawCubeWiresV($position, $size, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawSphere].
  String DrawSphere(
    Vector3Base centerPos,
    num radius,
    ColorBase color,
  ) => 'DrawSphere($centerPos, $radius, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawSphereEx].
  String DrawSphereEx(
    Vector3Base centerPos,
    num radius,
    num rings,
    num slices,
    ColorBase color,
  ) => 'DrawSphereEx($centerPos, $radius, $rings, $slices, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawSphereWires].
  String DrawSphereWires(
    Vector3Base centerPos,
    num radius,
    num rings,
    num slices,
    ColorBase color,
  ) => 'DrawSphereWires($centerPos, $radius, $rings, $slices, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCylinder].
  String DrawCylinder(
    Vector3Base position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorBase color,
  ) => 'DrawCylinder($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCylinderEx].
  String DrawCylinderEx(
    Vector3Base startPos,
    Vector3Base endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorBase color,
  ) => 'DrawCylinderEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCylinderWires].
  String DrawCylinderWires(
    Vector3Base position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorBase color,
  ) => 'DrawCylinderWires($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCylinderWiresEx].
  String DrawCylinderWiresEx(
    Vector3Base startPos,
    Vector3Base endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorBase color,
  ) => 'DrawCylinderWiresEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCapsule].
  String DrawCapsule(
    Vector3Base startPos,
    Vector3Base endPos,
    num radius,
    num slices,
    num rings,
    ColorBase color,
  ) => 'DrawCapsule($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawCapsuleWires].
  String DrawCapsuleWires(
    Vector3Base startPos,
    Vector3Base endPos,
    num radius,
    num slices,
    num rings,
    ColorBase color,
  ) => 'DrawCapsuleWires($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawPlane].
  String DrawPlane(
    Vector3Base centerPos,
    Vector2Base size,
    ColorBase color,
  ) => 'DrawPlane($centerPos, $size, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawRay].
  String DrawRay(
    RayBase ray,
    ColorBase color,
  ) => 'DrawRay($ray, $color)';
    
  /// Label for [RaylibCoreModuleBase.DrawGrid].
  String DrawGrid(
    num slices,
    num spacing,
  ) => 'DrawGrid($slices, $spacing)';
    
  /// Label for [RaylibCoreModuleBase.LoadModel].
  String LoadModel(
    String fileName,
  ) => 'LoadModel($fileName)';
    
  /// Label for [RaylibCoreModuleBase.LoadModelFromMesh].
  String LoadModelFromMesh(
    MeshBase mesh,
  ) => 'LoadModelFromMesh($mesh)';
    
  /// Label for [RaylibCoreModuleBase.IsModelValid].
  String IsModelValid(
    ModelBase model,
  ) => 'IsModelValid($model)';
    
  /// Label for [RaylibCoreModuleBase.UnloadModel].
  String UnloadModel(
    ModelBase model,
  ) => 'UnloadModel($model)';
    
  /// Label for [RaylibCoreModuleBase.GetModelBoundingBox].
  String GetModelBoundingBox(
    ModelBase model,
  ) => 'GetModelBoundingBox($model)';
    
  /// Label for [RaylibCoreModuleBase.DrawModel].
  String DrawModel(
    ModelBase model,
    Vector3Base position,
    num scale,
    ColorBase tint
  ) => 'DrawModel($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreModuleBase.DrawModelEx].
  String DrawModelEx(
    ModelBase model,
    Vector3Base position,
    Vector3Base rotationAxis,
    num rotationAngle,
    Vector3Base scale,
    ColorBase tint,
  ) => 'DrawModelEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreModuleBase.DrawModelWires].
  String DrawModelWires(
    ModelBase model,
    Vector3Base position,
    num scale,
    ColorBase tint,
  ) => 'DrawModelWires($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreModuleBase.DrawModelWiresEx].
  String DrawModelWiresEx(
    ModelBase model,
    Vector3Base position,
    Vector3Base rotationAxis,
    num rotationAngle,
    Vector3Base scale,
    ColorBase tint,
  ) => 'DrawModelWiresEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreModuleBase.DrawModelPoints].
  String DrawModelPoints(
    ModelBase model,
    Vector3Base position,
    num scale,
    ColorBase tint,
  ) => 'DrawModelPoints($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreModuleBase.DrawModelPointsEx].
  String DrawModelPointsEx(
    ModelBase model,
    Vector3Base position,
    Vector3Base rotationAxis,
    num rotationAngle,
    Vector3Base scale,
    ColorBase tint,
  ) => 'DrawModelPointsEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreModuleBase.DrawBoundingBox].
  String DrawBoundingBox(
    BoundingBoxBase box,
    ColorBase color,
  ) => 'DrawBoundingBox($box, $color)';

  /// Label for [RaylibCoreModuleBase.DrawBillboard].
  String DrawBillboard(
    Camera3DBase camera,
    TextureBase texture,
    Vector3Base position,
    num scale,
    ColorBase tint,
  ) => 'DrawBillboard($camera, $texture, $position, $scale, $tint)';

  /// Label for [RaylibCoreModuleBase.DrawBillboardRec].
  String DrawBillboardRec(
    Camera3DBase camera,
    TextureBase texture,
    RectangleBase source,
    Vector3Base position,
    Vector2Base size,
    ColorBase tint,
  ) => 'DrawBillboardRec($camera, $texture, $source, $position, $size, $tint)';

  /// Label for [RaylibCoreModuleBase.DrawBillboardPro].
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
  
  /// Label for [RaylibCoreModuleBase.UploadMesh].
  String UploadMesh(
    MeshBase mesh,
    bool dynamic,
  ) => 'UploadMesh($mesh, $dynamic)';
    
  /// Label for [RaylibCoreModuleBase.UpdateMeshBuffer].
  String UpdateMeshBuffer(
    MeshBase mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => 'UpdateMeshBuffer($mesh, $index, data: ${data.length}, $offset)';
    
  /// Label for [RaylibCoreModuleBase.UnloadMesh].
  String UnloadMesh(
    MeshBase mesh,
  ) => 'UnloadMesh($mesh)';
    
  /// Label for [RaylibCoreModuleBase.DrawMesh].
  String DrawMesh(
    MeshBase mesh,
    MaterialBase material,
    MatrixBase transform,
  ) => 'DrawMesh($mesh, $material, transform: $transform)';
    
  /// Label for [RaylibCoreModuleBase.DrawMeshInstanced].
  String DrawMeshInstanced(
    MeshBase mesh,
    MaterialBase material,
    List<MatrixBase> transforms,
  ) => 'DrawMeshInstanced($mesh, $material, transforms: ${transforms.length})';
    
  /// Label for [RaylibCoreModuleBase.GetMeshBoundingBox].
  String GetMeshBoundingBox(
    MeshBase mesh,
  ) => 'GetMeshBoundingBox($mesh)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshTangents].
  String GenMeshTangents(
    MeshBase mesh,
  ) => 'GenMeshTangents($mesh)';
    
  /// Label for [RaylibCoreModuleBase.ExportMesh].
  String ExportMesh(
    MeshBase mesh,
    String fileName,
  ) => 'ExportMesh($mesh, $fileName)';
    
  /// Label for [RaylibCoreModuleBase.ExportMeshAsCode].
  String ExportMeshAsCode(
    MeshBase mesh,
    String fileName,
  ) => 'ExportMeshAsCode($mesh, $fileName)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshPoly].
  String GenMeshPoly(
    num sides,
    num radius,
  ) => 'GenMeshPoly($sides, $radius)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshPlane].
  String GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => 'GenMeshPlane($width, $length, $resX, $resZ)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshCube].
  String GenMeshCube(
    num width,
    num height,
    num length,
  ) => 'GenMeshCube($width, $height, $length)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshSphere].
  String GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshSphere($radius, $rings, $slices)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshHemiSphere].
  String GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshHemiSphere($radius, $rings, $slices)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshCylinder].
  String GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCylinder($radius, $height, $slices)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshCone].
  String GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCone($radius, $height, $slices)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshTorus].
  String GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshTorus($radius, $size, $radSeg, $sides)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshKnot].
  String GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshKnot($radius, $size, $radSeg, $sides)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshHeightmap].
  String GenMeshHeightmap(
    ImageBase heightmap,
    Vector3Base size,
  ) => 'GenMeshHeightmap($heightmap, $size)';
    
  /// Label for [RaylibCoreModuleBase.GenMeshCubicmap].
  String GenMeshCubicmap(
    ImageBase cubicmap,
    Vector3Base cubeSize,
  ) => 'GenMeshCubicmap($cubicmap, $cubeSize)';
    
  /// Label for [RaylibCoreModuleBase.LoadMaterials].
  String LoadMaterials(
    String fileName,
  ) => 'LoadMaterials($fileName)';
    
  /// Label for [RaylibCoreModuleBase.LoadMaterialDefault].
  String LoadMaterialDefault() => 'LoadMaterialDefault()';
    
  /// Label for [RaylibCoreModuleBase.IsMaterialValid].
  String IsMaterialValid(
    MaterialBase material,
  ) => 'IsMaterialValid($material)';
    
  /// Label for [RaylibCoreModuleBase.UnloadMaterial].
  String UnloadMaterial(
    MaterialBase material,
  ) => 'UnloadMaterial($material)';
    
  /// Label for [RaylibCoreModuleBase.SetMaterialTexture].
  String SetMaterialTexture(
    MaterialBase material,
    MaterialMapIndex mapType,
    TextureBase texture,
  ) => 'SetMaterialTexture($material, ${mapType.name}, $texture)';
    
  /// Label for [RaylibCoreModuleBase.SetModelMeshMaterial].
  String SetModelMeshMaterial(
    ModelBase model,
    num meshId,
    num materialId,
  ) => 'SetModelMeshMaterial($model, $meshId, $materialId)';
    
  /// Label for [RaylibCoreModuleBase.LoadModelAnimations].
  String LoadModelAnimations(
    String fileName,
  ) => 'LoadModelAnimations($fileName)';
    
  /// Label for [RaylibCoreModuleBase.UpdateModelAnimation].
  String UpdateModelAnimation(
    ModelBase model,
    ModelAnimationBase anim,
    num frame,
  ) => 'UpdateModelAnimation($model, $anim, $frame)';
    
  /// Label for [RaylibCoreModuleBase.UpdateModelAnimationBones].
  String UpdateModelAnimationBones(
    ModelBase model,
    ModelAnimationBase anim,
    num frame,
  ) => 'UpdateModelAnimationBones($model, $anim, $frame)';
    
  /// Label for [RaylibCoreModuleBase.UnloadModelAnimation].
  String UnloadModelAnimation(
    ModelAnimationBase anim,
  ) => 'UnloadModelAnimation($anim)';
    
  /// Label for [RaylibCoreModuleBase.UnloadModelAnimations].
  String UnloadModelAnimations(
    List<ModelAnimationBase> animations,
  ) => 'UnloadModelAnimations(animations: ${animations.length})';
    
  /// Label for [RaylibCoreModuleBase.IsModelAnimationValid].
  String IsModelAnimationValid(
    ModelBase model,
    ModelAnimationBase anim,
  ) => 'IsModelAnimationValid($model, $anim)';
    
  /// Label for [RaylibCoreModuleBase.CheckCollisionSpheres].
  String CheckCollisionSpheres(
    Vector3Base center1,
    num radius1,
    Vector3Base center2,
    num radius2,
  ) => 'CheckCollisionSpheres($center1, $radius1, $center2, $radius2)';
    
  /// Label for [RaylibCoreModuleBase.CheckCollisionBoxes].
  String CheckCollisionBoxes(
    BoundingBoxBase box1,
    BoundingBoxBase box2,
  ) => 'CheckCollisionBoxes($box1, $box2)';
    
  /// Label for [RaylibCoreModuleBase.CheckCollisionBoxSphere].
  String CheckCollisionBoxSphere(
    BoundingBoxBase box,
    Vector3Base center,
    num radius,
  ) => 'CheckCollisionBoxSphere($box, $center, $radius)';
    
  /// Label for [RaylibCoreModuleBase.GetRayCollisionSphere].
  String GetRayCollisionSphere(
    RayBase ray,
    Vector3Base center,
    num radius,
  ) => 'GetRayCollisionSphere($ray, $center, $radius)';
    
  /// Label for [RaylibCoreModuleBase.GetRayCollisionBox].
  String GetRayCollisionBox(
    RayBase ray,
    BoundingBoxBase box,
  ) => 'GetRayCollisionBox($ray, $box)';
    
  /// Label for [RaylibCoreModuleBase.GetRayCollisionMesh].
  String GetRayCollisionMesh(
    RayBase ray,
    MeshBase mesh,
    MatrixBase transform,
  ) => 'GetRayCollisionMesh($ray, $mesh, $transform)';
    
  /// Label for [RaylibCoreModuleBase.GetRayCollisionTriangle].
  String GetRayCollisionTriangle(
    RayBase ray,
    Vector3Base p1,
    Vector3Base p2,
    Vector3Base p3,
  ) => 'GetRayCollisionTriangle($ray, $p1, $p2, $p3)';
    
  /// Label for [RaylibCoreModuleBase.GetRayCollisionQuad].
  String GetRayCollisionQuad(
    RayBase ray,
    Vector3Base p1,
    Vector3Base p2,
    Vector3Base p3,
    Vector3Base p4,
  ) => 'GetRayCollisionQuad($ray, $p1, $p2, $p3, $p4)';
  
}
