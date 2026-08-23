part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Core module function call,
/// logged to the console when debug output is enabled.
class RaylibCoreModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibCoreModule.InitWindow].
  String InitWindow(
    num width,
    num height,
    String title,
  ) => 'InitWindow($width, $height, $title)';

  /// Label for [RaylibCoreModule.CloseWindow].
  String CloseWindow() => 'CloseWindow()';

  /// Label for [RaylibCoreModule.WindowShouldClose].
  String WindowShouldClose() => 'WindowShouldClose()';

  /// Label for [RaylibCoreModule.IsWindowReady].
  String IsWindowReady() => 'IsWindowReady()';

  /// Label for [RaylibCoreModule.IsWindowFullscreen].
  String IsWindowFullscreen() => 'IsWindowFullscreen()';

  /// Label for [RaylibCoreModule.IsWindowHidden].
  String IsWindowHidden() => 'IsWindowHidden()';
    
  /// Label for [RaylibCoreModule.IsWindowMinimized].
  String IsWindowMinimized() => 'IsWindowMinimized()';
    
  /// Label for [RaylibCoreModule.IsWindowMaximized].
  String IsWindowMaximized() => 'IsWindowMaximized()';
    
  /// Label for [RaylibCoreModule.IsWindowFocused].
  String IsWindowFocused() => 'IsWindowFocused()';
    
  /// Label for [RaylibCoreModule.IsWindowResized].
  String IsWindowResized() => 'IsWindowResized()';
    
  /// Label for [RaylibCoreModule.IsWindowState].
  String IsWindowState(
    ConfigFlags flag,
  ) => 'IsWindowState(${flag.name})';
    
  /// Label for [RaylibCoreModule.SetWindowState].
  String SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'SetWindowState(${EnumsAsFlagsOr(flags)})';
    
  /// Label for [RaylibCoreModule.ClearWindowState].
  String ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'ClearWindowState(${EnumsAsFlagsOr(flags)})';
    
  /// Label for [RaylibCoreModule.ToggleFullscreen].
  String ToggleFullscreen() => 'ToggleFullscreen()';
    
  /// Label for [RaylibCoreModule.ToggleBorderlessWindowed].
  String ToggleBorderlessWindowed() => 'ToggleBorderlessWindowed()';
    
  /// Label for [RaylibCoreModule.MaximizeWindow].
  String MaximizeWindow() => 'MaximizeWindow()';
    
  /// Label for [RaylibCoreModule.MinimizeWindow].
  String MinimizeWindow() => 'MinimizeWindow()';
    
  /// Label for [RaylibCoreModule.RestoreWindow].
  String RestoreWindow() => 'RestoreWindow()';
    
  /// Label for [RaylibCoreModule.SetWindowIcon].
  String SetWindowIcon(
    ImageD image,
  ) => 'SetWindowIcon($image)';
    
  /// Label for [RaylibCoreModule.SetWindowIcons].
  String SetWindowIcons(
    List<ImageD> images,
  ) => 'SetWindowIcons(${images.map((i) => i.$state.internalId).join(', ')})';
    
  /// Label for [RaylibCoreModule.SetWindowTitle].
  String SetWindowTitle(
    String title,
  ) => 'SetWindowTitle($title)';

  /// Label for [RaylibCoreModule.SetWindowPosition].
  String SetWindowPosition(
    num x,
    num y,
  ) => 'SetWindowPosition($x, $y)';
    
  /// Label for [RaylibCoreModule.SetWindowMonitor].
  String SetWindowMonitor(
    num monitor,
  ) => 'SetWindowMonitor($monitor)';
    
  /// Label for [RaylibCoreModule.SetWindowMinSize].
  String SetWindowMinSize(
    num width,
    num height,
  ) => 'SetWindowMinSize($width, $height)';

  /// Label for [RaylibCoreModule.SetWindowMaxSize].
  String SetWindowMaxSize(
    num width,
    num height,
  ) => 'SetWindowMaxSize($width, $height)';
    
  /// Label for [RaylibCoreModule.SetWindowSize].
  String SetWindowSize(
    num width,
    num height,
  ) => 'SetWindowSize($width, $height)';

  /// Label for [RaylibCoreModule.SetWindowOpacity].
  String SetWindowOpacity(
    num opacity,
  ) => 'SetWindowOpacity($opacity)';
    
  /// Label for [RaylibCoreModule.SetWindowFocused].
  String SetWindowFocused() => 'SetWindowFocused()';

  /// Label for [RaylibCoreModule.GetScreenWidth].
  String GetScreenWidth() => 'GetScreenWidth()';
    
  /// Label for [RaylibCoreModule.GetScreenHeight].
  String GetScreenHeight() => 'GetScreenHeight()';
    
  /// Label for [RaylibCoreModule.GetRenderWidth].
  String GetRenderWidth() => 'GetRenderWidth()';
    
  /// Label for [RaylibCoreModule.GetRenderHeight].
  String GetRenderHeight() => 'GetRenderHeight()';
    
  /// Label for [RaylibCoreModule.GetMonitorCount].
  String GetMonitorCount() => 'GetMonitorCount()';
    
  /// Label for [RaylibCoreModule.GetCurrentMonitor].
  String GetCurrentMonitor() => 'GetCurrentMonitor()';
    
  /// Label for [RaylibCoreModule.GetMonitorPosition].
  String GetMonitorPosition(
    num monitor,
  ) => 'GetMonitorPosition($monitor)';
    
  /// Label for [RaylibCoreModule.GetMonitorWidth].
  String GetMonitorWidth(
    num monitor,
  ) => 'GetMonitorWidth($monitor)';
    
  /// Label for [RaylibCoreModule.GetMonitorHeight].
  String GetMonitorHeight(
    num monitor,
  ) => 'GetMonitorHeight($monitor)';
    
  /// Label for [RaylibCoreModule.GetMonitorPhysicalWidth].
  String GetMonitorPhysicalWidth(
    num monitor,
  ) => 'GetMonitorPhysicalWidth($monitor)';
    
  /// Label for [RaylibCoreModule.GetMonitorPhysicalHeight].
  String GetMonitorPhysicalHeight(
    num monitor,
  ) => 'GetMonitorPhysicalHeight($monitor)';
    
  /// Label for [RaylibCoreModule.GetMonitorRefreshRate].
  String GetMonitorRefreshRate(
    num monitor,
  ) => 'GetMonitorRefreshRate($monitor)';
    
  /// Label for [RaylibCoreModule.GetWindowPosition].
  String GetWindowPosition() => 'GetWindowPosition()';
    
  /// Label for [RaylibCoreModule.GetWindowScaleDPI].
  String GetWindowScaleDPI() => 'GetWindowScaleDPI()';
    
  /// Label for [RaylibCoreModule.GetMonitorName].
  String GetMonitorName(
    num monitor,
  ) => 'GetMonitorName($monitor)';
    
  /// Label for [RaylibCoreModule.SetClipboardText].
  String SetClipboardText(
    String text,
  ) => 'SetClipboardText($text)';
    
  /// Label for [RaylibCoreModule.GetClipboardText].
  String GetClipboardText() => 'GetClipboardText()';

  /// Label for [RaylibCoreModule.GetClipboardImage].
  String GetClipboardImage() => 'GetClipboardImage()';
    
  /// Label for [RaylibCoreModule.EnableEventWaiting].
  String EnableEventWaiting() => 'EnableEventWaiting()';
    
  /// Label for [RaylibCoreModule.DisableEventWaiting].
  String DisableEventWaiting() => 'DisableEventWaiting()';
    
  /// Label for [RaylibCoreModule.ShowCursor].
  String ShowCursor() => 'ShowCursor()';
    
  /// Label for [RaylibCoreModule.HideCursor].
  String HideCursor() => 'HideCursor()';
    
  /// Label for [RaylibCoreModule.IsCursorHidden].
  String IsCursorHidden() => 'IsCursorHidden()';
    
  /// Label for [RaylibCoreModule.EnableCursor].
  String EnableCursor() => 'EnableCursor()';
    
  /// Label for [RaylibCoreModule.DisableCursor].
  String DisableCursor() => 'DisableCursor()';
    
  /// Label for [RaylibCoreModule.IsCursorOnScreen].
  String IsCursorOnScreen() => 'IsCursorOnScreen()';
    
  /// Label for [RaylibCoreModule.ClearBackground].
  String ClearBackground(
    ColorD color,
  ) => 'ClearBackground($color)';
    
  /// Label for [RaylibCoreModule.BeginDrawing].
  String BeginDrawing() => 'BeginDrawing()';
    
  /// Label for [RaylibCoreModule.EndDrawing].
  String EndDrawing() => 'EndDrawing()';
    
  /// Label for [RaylibCoreModule.BeginMode2D].
  String BeginMode2D(
    Camera2DD camera,
  ) => 'BeginMode2D($camera)';

  /// Label for [RaylibCoreModule.EndMode2D].
  String EndMode2D() => 'EndMode2D()';
    
  /// Label for [RaylibCoreModule.BeginMode3D].
  String BeginMode3D(
    Camera3DD camera,
  ) => 'BeginMode3D($camera)';

  /// Label for [RaylibCoreModule.EndMode3D].
  String EndMode3D() => 'EndMode3D()';
    
  /// Label for [RaylibCoreModule.BeginTextureMode].
  String BeginTextureMode(
    RenderTextureD target,
  ) => 'BeginTextureMode($target)';
    
  /// Label for [RaylibCoreModule.EndTextureMode].
  String EndTextureMode() => 'EndTextureMode()';
    
  /// Label for [RaylibCoreModule.BeginShaderMode].
  String BeginShaderMode(
    ShaderD shader,
  ) => 'BeginShaderMode($shader)';
    
  /// Label for [RaylibCoreModule.EndShaderMode].
  String EndShaderMode() => 'EndShaderMode()';
    
  /// Label for [RaylibCoreModule.BeginBlendMode].
  String BeginBlendMode(
    BlendMode mode,
  ) => 'BeginBlendMode($mode)';
    
  /// Label for [RaylibCoreModule.EndBlendMode].
  String EndBlendMode() => 'EndBlendMode()';
    
  /// Label for [RaylibCoreModule.BeginScissorMode].
  String BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => 'BeginScissorMode($x, $y, $width, $height)';
    
  /// Label for [RaylibCoreModule.EndScissorMode].
  String EndScissorMode() => 'EndScissorMode()';
    
  /// Label for [RaylibCoreModule.BeginVrStereoMode].
  String BeginVrStereoMode(
    VrStereoConfigD config,
  ) => 'BeginVrStereoMode($config)';
    
  /// Label for [RaylibCoreModule.EndVrStereoMode].
  String EndVrStereoMode() => 'EndVrStereoMode()';
    
  /// Label for [RaylibCoreModule.LoadVrStereoConfig].
  String LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => 'LoadVrStereoConfig($device)';
    
  /// Label for [RaylibCoreModule.UnloadVrStereoConfig].
  String UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => 'UnloadVrStereoConfig($config)';
    
  /// Label for [RaylibCoreModule.LoadShader].
  String LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => 'LoadShader($vsFileName, $fsFileName)';
    
  /// Label for [RaylibCoreModule.LoadShaderFromMemory].
  String LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => 'LoadShaderFromMemory($vsCode, $fsCode)';
    
  /// Label for [RaylibCoreModule.IsShaderValid].
  String IsShaderValid(
    ShaderD shader,
  ) => 'IsShaderValid($shader)';
    
  /// Label for [RaylibCoreModule.GetShaderLocation].
  String GetShaderLocation(
    ShaderD shader,
    String uniformName,
  ) => 'GetShaderLocation($shader, $uniformName)';
    
  /// Label for [RaylibCoreModule.GetShaderLocationAttrib].
  String GetShaderLocationAttrib(
    ShaderD shader,
    String attribName,
  ) => 'GetShaderLocationAttrib($shader, $attribName)';
  
  /// Label for [RaylibCoreModule.SetShaderValue].
  String SetShaderValue(
    ShaderD shader,
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

  /// Label for [RaylibCoreModule.SetShaderValueV].
  String SetShaderValueV(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => 'SetShaderValueV($shader, $locIndex, $value, ${uniformType.name}, $count)';
    
  /// Label for [RaylibCoreModule.SetShaderValueMatrix].
  String SetShaderValueMatrix(
    ShaderD shader,
    num locIndex,
    MatrixD mat,
  ) => 'SetShaderValueMatrix($shader, $locIndex, $mat)';
    
  /// Label for [RaylibCoreModule.SetShaderValueTexture].
  String SetShaderValueTexture(
    ShaderD shader,
    num locIndex,
    TextureD texture,
  ) => 'SetShaderValueTexture($shader, $locIndex, $texture)';
    
  /// Label for [RaylibCoreModule.UnloadShader].
  String UnloadShader(
    ShaderD shader,
  ) => 'UnloadShader($shader)';
    
  /// Label for [RaylibCoreModule.GetScreenToWorldRay].
  String GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  ) => 'GetScreenToWorldRay($position, $camera)';
    
  /// Label for [RaylibCoreModule.GetScreenToWorldRayEx].
  String GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    num width,
    num height,
  ) => 'GetScreenToWorldRayEx($position, $camera, $width, $height)';

  /// Label for [RaylibCoreModule.GetWorldToScreen].
  String GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  ) => 'GetWorldToScreen($position, $camera)';

  /// Label for [RaylibCoreModule.GetWorldToScreenEx].
  String GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    num width,
    num height,
  ) => 'GetWorldToScreenEx($position, $camera, $width, $height)';

  /// Label for [RaylibCoreModule.GetWorldToScreen2D].
  String GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => 'GetWorldToScreen2D($position, $camera)';

  /// Label for [RaylibCoreModule.GetScreenToWorld2D].
  String GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => 'GetScreenToWorld2D($position, $camera)';

  /// Label for [RaylibCoreModule.GetCameraMatrix].
  String GetCameraMatrix(
    Camera3DD camera,
  ) => 'GetCameraMatrix($camera)';

  /// Label for [RaylibCoreModule.GetCameraMatrix2D].
  String GetCameraMatrix2D(
    Camera2DD camera,
  ) => 'GetCameraMatrix2D($camera)';
    
  /// Label for [RaylibCoreModule.SetTargetFPS].
  String SetTargetFPS(
    num fps,
  ) => 'SetTargetFPS($fps)';

  /// Label for [RaylibCoreModule.GetFrameTime].
  String GetFrameTime() => 'GetFrameTime()';

  /// Label for [RaylibCoreModule.GetTime].
  String GetTime() => 'GetTime()';

  /// Label for [RaylibCoreModule.GetFPS].
  String GetFPS() => 'GetFPS()';

  /// Label for [RaylibCoreModule.SwapScreenBuffer].
  String SwapScreenBuffer() => 'SwapScreenBuffer()';

  /// Label for [RaylibCoreModule.PollInputEvents].
  String PollInputEvents() => 'PollInputEvents()';

  /// Label for [RaylibCoreModule.WaitTime].
  String WaitTime(
    num seconds,
  ) => 'WaitTime($seconds)';

  /// Label for [RaylibCoreModule.SetRandomSeed].
  String SetRandomSeed(
    num seed,
  ) => 'SetRandomSeed($seed)';

  /// Label for [RaylibCoreModule.GetRandomValue].
  String GetRandomValue(
    num min,
    num max,
  ) => 'GetRandomValue($min, $max)';
  
  /// Label for [RaylibCoreModule.LoadRandomSequence].
  String LoadRandomSequence(
    num count,
    num min,
    num max,
  ) => 'LoadRandomSequence($count, $min, $max)';
    
  /// Label for [RaylibCoreModule.TakeScreenshot].
  String TakeScreenshot(
    String fileName,
  ) => 'TakeScreenshot($fileName)';

  /// Label for [RaylibCoreModule.SetConfigFlags].
  String SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => 'SetConfigFlags(${EnumsAsFlagsOr(flags)})';

  /// Label for [RaylibCoreModule.OpenURL].
  String OpenURL(
    String url,
  ) => 'OpenURL($url)';

  /// Label for [RaylibCoreModule.TraceLog].
  String TraceLog(
    TraceLogLevel logLevel,
    String text,
  ) => 'TraceLog(${logLevel.name}, $text)';

  /// Label for [RaylibCoreModule.SetTraceLogLevel].
  String SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => 'SetTraceLogLevel(${logLevel.name})';

  /// Label for [RaylibCoreModule.SetTraceLogCallback].
  String SetTraceLogCallback(
    TraceLogCallbackBase? callback,
  ) => 'SetTraceLogCallback($callback)';
    
  /// Label for [RaylibCoreModule.SetLoadFileDataCallback].
  String SetLoadFileDataCallback(
    LoadFileDataCallbackBase? callback
  ) => 'SetLoadFileDataCallback($callback)';
    
  /// Label for [RaylibCoreModule.SetSaveFileDataCallback].
  String SetSaveFileDataCallback(
    SaveFileDataCallbackBase? callback
  ) => 'SetSaveFileDataCallback($callback)';
    
  /// Label for [RaylibCoreModule.SetLoadFileTextCallback].
  String SetLoadFileTextCallback(
    LoadFileTextCallbackBase? callback
  ) => 'SetLoadFileTextCallback($callback)';
    
  /// Label for [RaylibCoreModule.SetSaveFileTextCallback].
  String SetSaveFileTextCallback(
    SaveFileTextCallbackBase? callback
  ) => 'SetSaveFileTextCallback($callback)';
    
  /// Label for [RaylibCoreModule.LoadFileData].
  String LoadFileData(
    String fileName,
  ) => 'LoadFileData($fileName)';

  /// Label for [RaylibCoreModule.SaveFileData].
  String SaveFileData(
    String fileName,
    Uint8List data,
  ) => 'SaveFileData($fileName, data: ${data.length})';

  /// Label for [RaylibCoreModule.ExportDataAsCode].
  String ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => 'ExportDataAsCode(data: ${data.length}, $fileName)';

  /// Label for [RaylibCoreModule.LoadFileText].
  String LoadFileText(
    String fileName,
  ) => 'LoadFileText($fileName)';

  /// Label for [RaylibCoreModule.SaveFileText].
  String SaveFileText(
    String fileName,
    String text,
  ) => 'SaveFileText($fileName, $text)';

  /// Label for [RaylibCoreModule.FileRename].
  String FileRename(
    String fileName,
    String fileRename,
  ) => 'FileRename($fileName, $fileRename)';
  
  /// Label for [RaylibCoreModule.FileRemove].
  String FileRemove(
    String fileName,
  ) => 'FileRemove($fileName)';
  
  /// Label for [RaylibCoreModule.FileCopy].
  String FileCopy(
    String srcPath,
    String dstPath,
  ) => 'FileCopy($srcPath, $dstPath)';
  
  /// Label for [RaylibCoreModule.FileMove].
  String FileMove(
    String srcPath,
    String dstPath,
  ) => 'FileMove($srcPath, $dstPath)';
  
  /// Label for [RaylibCoreModule.FileTextReplace].
  String FileTextReplace(
    String fileName,
    String search,
    String replacement,
  ) => 'FileTextReplace($fileName, $search, $replacement)';
  
  /// Label for [RaylibCoreModule.FileTextFindIndex].
  String FileTextFindIndex(
    String fileName,
    String search,
  ) => 'FileTextFindIndex($fileName, $search)';

  /// Label for [RaylibCoreModule.FileExists].
  String FileExists(
    String fileName,
  ) => 'FileExists($fileName)';

  /// Label for [RaylibCoreModule.DirectoryExists].
  String DirectoryExists(
    String dirPath,
  ) => 'DirectoryExists($dirPath)';

  /// Label for [RaylibCoreModule.IsFileExtension].
  String IsFileExtension(
    String fileName,
    String ext,
  ) => 'IsFileExtension($fileName, $ext)';

  /// Label for [RaylibCoreModule.GetFileLength].
  String GetFileLength(
    String fileName,
  ) => 'GetFileLength($fileName)';

  /// Label for [RaylibCoreModule.GetFileExtension].
  String GetFileExtension(
    String fileName,
  ) => 'GetFileExtension($fileName)';

  /// Label for [RaylibCoreModule.GetFileName].
  String GetFileName(
    String filePath,
  ) => 'GetFileName($filePath)';

  /// Label for [RaylibCoreModule.GetFileNameWithoutExt].
  String GetFileNameWithoutExt(
    String filePath,
  ) => 'GetFileNameWithoutExt($filePath)';

  /// Label for [RaylibCoreModule.GetDirectoryFileCount].
  String GetDirectoryFileCount(
    String dirPath, 
  ) => 'GetDirectoryFileCount($dirPath)';
  
  /// Label for [RaylibCoreModule.GetDirectoryFileCountEx].
  String GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'GetDirectoryFileCountEx($basePath, $filter, $scanSubdirs)';

  /// Label for [RaylibCoreModule.GetDirectoryPath].
  String GetDirectoryPath(
    String filePath,
  ) => 'GetDirectoryPath($filePath)';

  /// Label for [RaylibCoreModule.GetPrevDirectoryPath].
  String GetPrevDirectoryPath(
    String dirPath,
  ) => 'GetPrevDirectoryPath($dirPath)';

  /// Label for [RaylibCoreModule.GetWorkingDirectory].
  String GetWorkingDirectory() => 'GetWorkingDirectory()';

  /// Label for [RaylibCoreModule.GetApplicationDirectory].
  String GetApplicationDirectory() => 'GetApplicationDirectory()';

  /// Label for [RaylibCoreModule.MakeDirectory].
  String MakeDirectory(
    String dirPath,
  ) => 'MakeDirectory($dirPath)';

  /// Label for [RaylibCoreModule.ChangeDirectory].
  String ChangeDirectory(
    String dir,
  ) => 'ChangeDirectory($dir)';

  /// Label for [RaylibCoreModule.IsPathFile].
  String IsPathFile(
    String path,
  ) => 'IsPathFile($path)';

  /// Label for [RaylibCoreModule.IsFileNameValid].
  String IsFileNameValid(
    String fileName,
  ) => 'IsFileNameValid($fileName)';
    
  /// Label for [RaylibCoreModule.LoadDirectoryFiles].
  String LoadDirectoryFiles(
    String dirPath,
  ) => 'LoadDirectoryFiles($dirPath)';
    
  /// Label for [RaylibCoreModule.LoadDirectoryFilesEx].
  String LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'LoadDirectoryFilesEx($basePath, $filter, $scanSubdirs)';

  /// Label for [RaylibCoreModule.UnloadDirectoryFiles].
  String UnloadDirectoryFiles(
    FilePathListD files,
  ) => 'UnloadDirectoryFiles($files)';

  /// Label for [RaylibCoreModule.IsFileDropped].
  String IsFileDropped() => 'IsFileDropped()';
    
  /// Label for [RaylibCoreModule.LoadDroppedFiles].
  String LoadDroppedFiles() => 'LoadDroppedFiles()';

  /// Label for [RaylibCoreModule.UnloadDroppedFiles].
  String UnloadDroppedFiles(
    FilePathListD files,
  ) => 'UnloadDroppedFiles($files)';

  /// Label for [RaylibCoreModule.GetFileModTime].
  String GetFileModTime(
    String fileName,
  ) => 'GetFileModTime($fileName)';

  /// Label for [RaylibCoreModule.CompressData].
  String CompressData(
    Uint8List data,
  ) => 'CompressData(data: ${data.length})';

  /// Label for [RaylibCoreModule.DecompressData].
  String DecompressData(
    Uint8List compData,
  ) => 'DecompressData(compData: ${compData.length})';

  /// Label for [RaylibCoreModule.EncodeDataBase64].
  String EncodeDataBase64(
    Uint8List data,
  ) => 'EncodeDataBase64(data: ${data.length})';

  /// Label for [RaylibCoreModule.DecodeDataBase64].
  String DecodeDataBase64(
    Uint8List data,
  ) => 'DecodeDataBase64(data: ${data.length})';

  /// Label for [RaylibCoreModule.ComputeCRC32].
  String ComputeCRC32(
    Uint8List data,
  ) => 'ComputeCRC32(data: ${data.length})';

  /// Label for [RaylibCoreModule.ComputeMD5].
  String ComputeMD5(
    Uint8List data,
  ) => 'ComputeMD5(data: ${data.length})';

  /// Label for [RaylibCoreModule.ComputeSHA1].
  String ComputeSHA1(
    Uint8List data,
  ) => 'ComputeSHA1(data: ${data.length})';

  /// Label for [RaylibCoreModule.ComputeSHA256].
  String ComputeSHA256(
    Uint8List data,
  ) => 'ComputeSHA256(data: ${data.length})';
    
  /// Label for [RaylibCoreModule.LoadAutomationEventList].
  String LoadAutomationEventList(
    String? fileName,
  ) => 'LoadAutomationEventList($fileName)';
    
  /// Label for [RaylibCoreModule.UnloadAutomationEventList].
  String UnloadAutomationEventList(
    AutomationEventListD list,
  ) => 'UnloadAutomationEventList($list)';
    
  /// Label for [RaylibCoreModule.ExportAutomationEventList].
  String ExportAutomationEventList(
    AutomationEventListD list,
    String fileName,
  ) => 'ExportAutomationEventList($list, $fileName)';
    
  /// Label for [RaylibCoreModule.SetAutomationEventList].
  String SetAutomationEventList(
    AutomationEventListD list,
  ) => 'SetAutomationEventList($list)';
    
  /// Label for [RaylibCoreModule.SetAutomationEventBaseFrame].
  String SetAutomationEventBaseFrame(
    int frame,
  ) => 'SetAutomationEventBaseFrame($frame)';
    
  /// Label for [RaylibCoreModule.StartAutomationEventRecording].
  String StartAutomationEventRecording() => 'StartAutomationEventRecording()';

  /// Label for [RaylibCoreModule.StopAutomationEventRecording].
  String StopAutomationEventRecording() => 'StopAutomationEventRecording()';
    
  /// Label for [RaylibCoreModule.PlayAutomationEvent].
  String PlayAutomationEvent(
    AutomationEventD event,
  ) => 'PlayAutomationEvent($event)';

  /// Label for [RaylibCoreModule.IsKeyPressed].
  String IsKeyPressed(
    KeyboardKey key,
  ) => 'IsKeyPressed($key)';

  /// Label for [RaylibCoreModule.IsKeyPressedRepeat].
  String IsKeyPressedRepeat(
    KeyboardKey key,
  ) => 'IsKeyPressedRepeat($key)';

  /// Label for [RaylibCoreModule.IsKeyDown].
  String IsKeyDown(
    KeyboardKey key,
  ) => 'IsKeyDown($key)';
  
  /// Label for [RaylibCoreModule.IsKeyReleased].
  String IsKeyReleased(
    KeyboardKey key,
  ) => 'IsKeyReleased($key)';
  
  /// Label for [RaylibCoreModule.IsKeyUp].
  String IsKeyUp(
    KeyboardKey key,
  ) => 'IsKeyUp($key)';

  /// Label for [RaylibCoreModule.GetKeyName].
  String GetKeyName(
    KeyboardKey key,
  ) => 'GetKeyName($key)';

  /// Label for [RaylibCoreModule.GetKeyPressed].
  String GetKeyPressed() => 'GetKeyPressed()';

  /// Label for [RaylibCoreModule.GetCharPressed].
  String GetCharPressed() => 'GetCharPressed()';

  /// Label for [RaylibCoreModule.SetExitKey].
  String SetExitKey(
    KeyboardKey key,
  ) => 'SetExitKey(${key.name})';

  /// Label for [RaylibCoreModule.IsGamepadAvailable].
  String IsGamepadAvailable(
    num gamepad,
  ) => 'IsGamepadAvailable($gamepad)';

  /// Label for [RaylibCoreModule.GetGamepadName].
  String GetGamepadName(
    num gamepad,
  ) => 'GetGamepadName($gamepad)';

  /// Label for [RaylibCoreModule.IsGamepadButtonPressed].
  String IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonPressed($gamepad, ${button.name})';

  /// Label for [RaylibCoreModule.IsGamepadButtonDown].
  String IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonDown($gamepad, ${button.name})';

  /// Label for [RaylibCoreModule.IsGamepadButtonReleased].
  String IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonReleased($gamepad, ${button.name})';

  /// Label for [RaylibCoreModule.IsGamepadButtonUp].
  String IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonUp($gamepad, ${button.name})';

  /// Label for [RaylibCoreModule.GetGamepadButtonPressed].
  String GetGamepadButtonPressed() => 'GetGamepadButtonPressed()';

  /// Label for [RaylibCoreModule.GetGamepadAxisCount].
  String GetGamepadAxisCount(
    num gamepad,
  ) => 'GetGamepadAxisCount($gamepad)';

  /// Label for [RaylibCoreModule.GetGamepadAxisMovement].
  String GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => 'GetGamepadAxisMovement($gamepad, $axis)';

  /// Label for [RaylibCoreModule.SetGamepadMappings].
  String SetGamepadMappings(
    String mappings,
  ) => 'SetGamepadMappings($mappings)';
    
  /// Label for [RaylibCoreModule.SetGamepadVibration].
  String SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => 'SetGamepadVibration($gamepad, $leftMotor, $rightMotor, $duration)';

  /// Label for [RaylibCoreModule.IsMouseButtonPressed].
  String IsMouseButtonPressed(
    MouseButton button,
  ) => 'IsMouseButtonPressed(${button.name})';

  /// Label for [RaylibCoreModule.IsMouseButtonDown].
  String IsMouseButtonDown(
    MouseButton button,
  ) => 'IsMouseButtonDown(${button.name})';

  /// Label for [RaylibCoreModule.IsMouseButtonReleased].
  String IsMouseButtonReleased(
    MouseButton button,
  ) => 'IsMouseButtonReleased(${button.name})';

  /// Label for [RaylibCoreModule.IsMouseButtonUp].
  String IsMouseButtonUp(
    MouseButton button,
  ) => 'IsMouseButtonUp(${button.name})';

  /// Label for [RaylibCoreModule.GetMouseX].
  String GetMouseX() => 'GetMouseX()';

  /// Label for [RaylibCoreModule.GetMouseY].
  String GetMouseY() => 'GetMouseY()';

  /// Label for [RaylibCoreModule.GetMousePosition].
  String GetMousePosition() => 'GetMousePosition()';

  /// Label for [RaylibCoreModule.GetMouseDelta].
  String GetMouseDelta() => 'GetMouseDelta()';

  /// Label for [RaylibCoreModule.SetMousePosition].
  String SetMousePosition(
    num x,
    num y,
  ) => 'SetMousePosition($x, $y)';

  /// Label for [RaylibCoreModule.SetMouseOffset].
  String SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => 'SetMouseOffset($offsetX, $offsetY)';

  /// Label for [RaylibCoreModule.SetMouseScale].
  String SetMouseScale(
    num scaleX,
    num scaleY,
  ) => 'SetMouseScale($scaleX, $scaleY)';

  /// Label for [RaylibCoreModule.GetMouseWheelMove].
  String GetMouseWheelMove() => 'GetMouseWheelMove()';

  /// Label for [RaylibCoreModule.GetMouseWheelMoveV].
  String GetMouseWheelMoveV() => 'GetMouseWheelMoveV()';

  /// Label for [RaylibCoreModule.SetMouseCursor].
  String SetMouseCursor(
    MouseCursor cursor,
  ) => 'SetMouseCursor(${cursor.name})';

  /// Label for [RaylibCoreModule.GetTouchX].
  String GetTouchX() => 'GetTouchX()';

  /// Label for [RaylibCoreModule.GetTouchY].
  String GetTouchY() => 'GetTouchY()';

  /// Label for [RaylibCoreModule.GetTouchPosition].
  String GetTouchPosition(
    num index,
  ) => 'GetTouchPosition($index)';

  /// Label for [RaylibCoreModule.GetTouchPointId].
  String GetTouchPointId(
    num index,
  ) => 'GetTouchPointId($index)';

  /// Label for [RaylibCoreModule.GetTouchPointCount].
  String GetTouchPointCount() => 'GetTouchPointCount()';

  /// Label for [RaylibCoreModule.SetGesturesEnabled].
  String SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => 'SetGesturesEnabled($flags)';

  /// Label for [RaylibCoreModule.IsGestureDetected].
  String IsGestureDetected(
    Gesture key,
  ) => 'IsGestureDetected($key)';

  /// Label for [RaylibCoreModule.GetGestureDetected].
  String GetGestureDetected() => 'GetGestureDetected()';

  /// Label for [RaylibCoreModule.GetGestureHoldDuration].
  String GetGestureHoldDuration() => 'GetGestureHoldDuration()';

  /// Label for [RaylibCoreModule.GetGestureDragVector].
  String GetGestureDragVector() => 'GetGestureDragVector()';

  /// Label for [RaylibCoreModule.GetGestureDragAngle].
  String GetGestureDragAngle() => 'GetGestureDragAngle()';

  /// Label for [RaylibCoreModule.GetGesturePinchVector].
  String GetGesturePinchVector() => 'GetGesturePinchVector()';

  /// Label for [RaylibCoreModule.GetGesturePinchAngle].
  String GetGesturePinchAngle() => 'GetGesturePinchAngle()';

  /// Label for [RaylibCoreModule.ProcessGestureEvent].
  String ProcessGestureEvent(
    GestureEventD event,
  ) => 'ProcessGestureEvent($event)';
  
  /// Label for [RaylibCoreModule.UpdateGestures].
  String UpdateGestures() => 'UpdateGestures()';
    
  /// Label for [RaylibCoreModule.UpdateCamera].
  String UpdateCamera(
    Camera3DD camera,
    CameraMode mode,
  ) => 'UpdateCamera($camera, $mode)';

  /// Label for [RaylibCoreModule.UpdateCameraPro].
  String UpdateCameraPro(
    Camera3DD camera,
    Vector3D movement,
    Vector3D rotation,
    num zoom,
  ) => 'UpdateCameraPro($camera, $movement, $rotation, $zoom)';

  /// Label for [RaylibCoreModule.SetShapesTexture].
  String SetShapesTexture(
    TextureD texture,
    RectangleD source,
  ) => 'SetShapesTexture($texture, $source)';

  /// Label for [RaylibCoreModule.GetShapesTexture].
  String GetShapesTexture() => 'GetShapesTexture()';

  /// Label for [RaylibCoreModule.GetShapesTextureRectangle].
  String GetShapesTextureRectangle() => 'GetShapesTextureRectangle()';

  /// Label for [RaylibCoreModule.DrawPixel].
  String DrawPixel(
    num posX,
    num posY,
    ColorD color,
  ) => 'DrawPixel($posX, $posY, $color)';

  /// Label for [RaylibCoreModule.DrawPixelV].
  String DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => 'DrawPixelV($position, $color)';
    
  /// Label for [RaylibCoreModule.DrawLine].
  String DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => 'DrawLine($startPosX, $startPosY, $endPosX, $endPosY, $color)';

  /// Label for [RaylibCoreModule.DrawLineV].
  String DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => 'DrawLineV($startPos, $endPos, $color)';

  /// Label for [RaylibCoreModule.DrawLineEx].
  String DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => 'DrawLineEx($startPos, $endPos, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawLineStrip].
  String DrawLineStrip(
    List<Vector2D> points,
    ColorD color,
  ) => 'DrawLineStrip(points: ${points.length}, $color)';

  /// Label for [RaylibCoreModule.DrawLineBezier].
  String DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => 'DrawLineBezier($startPos, $endPos, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawLineDashed].
  String DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    num dashSize,
    num spaceSize,
    ColorD color,
  ) => 'DrawLineDashed($startPos, $endPos, $dashSize, $spaceSize, $color)';

  /// Label for [RaylibCoreModule.DrawCircle].
  String DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => 'DrawCircle($centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreModule.DrawCircleSector].
  String DrawCircleSector(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => 'DrawCircleSector($center, $radius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreModule.DrawCircleSectorLines].
  String DrawCircleSectorLines(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => 'DrawCircleSectorLines($center, $radius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreModule.DrawCircleGradient].
  String DrawCircleGradient(
    Vector2D center,
    num radius,
    ColorD inner,
    ColorD outer,
  ) => 'DrawCircleGradient($center, $radius, $inner, $outer)';

  /// Label for [RaylibCoreModule.DrawCircleV].
  String DrawCircleV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => 'DrawCircleV($center, $radius, $color)';

  /// Label for [RaylibCoreModule.DrawCircleLines].
  String DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => 'DrawCircleLines($centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreModule.DrawCircleLinesV].
  String DrawCircleLinesV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => 'DrawCircleLinesV($center, $radius, $color)';
    
  /// Label for [RaylibCoreModule.DrawEllipse].
  String DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => 'DrawEllipse($centerX, $centerY, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreModule.DrawEllipseV].
  String DrawEllipseV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => 'DrawEllipse($center, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreModule.DrawEllipseLines].
  String DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => 'DrawEllipseLines($centerX, $centerY, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreModule.DrawEllipseLinesV].
  String DrawEllipseLinesV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => 'DrawEllipseLinesV($center, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreModule.DrawRing].
  String DrawRing(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => 'DrawRing($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreModule.DrawRingLines].
  String DrawRingLines(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => 'DrawRingLines($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreModule.DrawRectangle].
  String DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => 'DrawRectangle($posX, $posY, $width, $height, $color)';

  /// Label for [RaylibCoreModule.DrawRectangleV].
  String DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => 'DrawRectangleV($position, $size, $color)';

  /// Label for [RaylibCoreModule.DrawRectangleRec].
  String DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => 'DrawRectangleRec($rec, $color)';
    
  /// Label for [RaylibCoreModule.DrawRectanglePro].
  String DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    num rotation,
    ColorD color,
  ) => 'DrawRectanglePro($rec, $origin, $rotation, $color)';

  /// Label for [RaylibCoreModule.DrawRectangleGradientV].
  String DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorD top,
    ColorD bottom,
  ) => 'DrawRectangleGradientV($posX, $posY, $width, $height, $top, $bottom)';

  /// Label for [RaylibCoreModule.DrawRectangleGradientH].
  String DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorD left,
    ColorD right,
  ) => 'DrawRectangleGradientH($posX, $posY, $width, $height, $left, $right)';

  /// Label for [RaylibCoreModule.DrawRectangleGradientEx].
  String DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  ) => 'DrawRectangleGradientEx($rec, $topLeft, $bottomLeft, $topRight, $bottomRight)';

  /// Label for [RaylibCoreModule.DrawRectangleLines].
  String DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => 'DrawRectangleLines($posX, $posY, $width, $height, $color)';

  /// Label for [RaylibCoreModule.DrawRectangleLinesEx].
  String DrawRectangleLinesEx(
    RectangleD rec,
    num lineThick,
    ColorD color,
  ) => 'DrawRectangleLinesEx($rec, $lineThick, $color)';

  /// Label for [RaylibCoreModule.DrawRectangleRounded].
  String DrawRectangleRounded(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => 'DrawRectangleRounded($rec, $roundness, $segments, $color)';

  /// Label for [RaylibCoreModule.DrawRectangleRoundedLines].
  String DrawRectangleRoundedLines(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => 'DrawRectangleRoundedLines($rec, $roundness, $segments, $color)';

  /// Label for [RaylibCoreModule.DrawRectangleRoundedLinesEx].
  String DrawRectangleRoundedLinesEx(
    RectangleD rec,
    num roundness,
    num segments,
    num lineThick,
    ColorD color,
  ) => 'DrawRectangleRoundedLinesEx($rec, $roundness, $segments, $lineThick, $color)';
    
  /// Label for [RaylibCoreModule.DrawTriangle].
  String DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => 'DrawTriangle($v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreModule.DrawTriangleLines].
  String DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => 'DrawTriangleLines($v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreModule.DrawTriangleFan].
  String DrawTriangleFan(
    List<Vector2D> points,
    ColorD color,
  ) => 'DrawTriangleFan(points: ${points.length}, $color)';

  /// Label for [RaylibCoreModule.DrawTriangleStrip].
  String DrawTriangleStrip(
    List<Vector2D> points,
    ColorD color,
  ) => 'DrawTriangleStrip(points: ${points.length}, $color)';

  /// Label for [RaylibCoreModule.DrawPoly].
  String DrawPoly(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => 'DrawPoly($center, $sides, $radius, $rotation, $color)';

  /// Label for [RaylibCoreModule.DrawPolyLines].
  String DrawPolyLines(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => 'DrawPolyLines($center, $sides, $radius, $rotation, $color)';

  /// Label for [RaylibCoreModule.DrawPolyLinesEx].
  String DrawPolyLinesEx(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorD color,
  ) => 'DrawPolyLinesEx($center, $sides, $radius, $rotation, $lineThick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineLinear].
  String DrawSplineLinear(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineLinear(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineBasis].
  String DrawSplineBasis(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineBasis(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineCatmullRom].
  String DrawSplineCatmullRom(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineCatmullRom(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineBezierQuadratic].
  String DrawSplineBezierQuadratic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineBezierQuadratic(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineBezierCubic].
  String DrawSplineBezierCubic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineBezierCubic(points: ${points.length}, $thick, $color)';
    
  /// Label for [RaylibCoreModule.DrawSplineSegmentLinear].
  String DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentLinear($p1, $p2, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineSegmentBasis].
  String DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentBasis($p1, $p2, $p3, $p4, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineSegmentCatmullRom].
  String DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentCatmullRom($p1, $p2, $p3, $p4, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineSegmentBezierQuadratic].
  String DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentBezierQuadratic($p1, $c2, $p3, $thick, $color)';

  /// Label for [RaylibCoreModule.DrawSplineSegmentBezierCubic].
  String DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentBezierCubic($p1, $c2, $c3, $p4, $thick, $color)';

  /// Label for [RaylibCoreModule.GetSplinePointLinear].
  String GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    num t,
  ) => 'GetSplinePointLinear($startPos, $endPos, $t)';

  /// Label for [RaylibCoreModule.GetSplinePointBasis].
  String GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => 'GetSplinePointBasis($p1, $p2, $p3, $p4, $t)';
    
  /// Label for [RaylibCoreModule.GetSplinePointCatmullRom].
  String GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => 'GetSplinePointCatmullRom($p1, $p2, $p3, $p4, $t)';

  /// Label for [RaylibCoreModule.GetSplinePointBezierQuad].
  String GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num t,
  ) => 'GetSplinePointBezierQuad($p1, $c2, $p3, $t)';

  /// Label for [RaylibCoreModule.GetSplinePointBezierCubic].
  String GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num t,
  ) => 'GetSplinePointBezierCubic($p1, $c2, $c3, $p4, $t)';

  /// Label for [RaylibCoreModule.CheckCollisionRecs].
  String CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => 'CheckCollisionRecs($rec1, $rec2)';

  /// Label for [RaylibCoreModule.CheckCollisionCircles].
  String CheckCollisionCircles(
    Vector2D center1,
    num radius1,
    Vector2D center2,
    num radius2,
  ) => 'CheckCollisionCircles($center1, $radius1, $center2, $radius2)';

  /// Label for [RaylibCoreModule.CheckCollisionCircleRec].
  String CheckCollisionCircleRec(
    Vector2D center,
    num radius,
    RectangleD rec,
  ) => 'CheckCollisionCircleRec($center, $radius, $rec)';

  /// Label for [RaylibCoreModule.CheckCollisionCircleLine].
  String CheckCollisionCircleLine(
    Vector2D center,
    num radius,
    Vector2D p1,
    Vector2D p2,
  ) => 'CheckCollisionCircleLine($center, $radius, $p1, $p2)';

  /// Label for [RaylibCoreModule.CheckCollisionPointRec].
  String CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => 'CheckCollisionPointRec($point, $rec)';
    
  /// Label for [RaylibCoreModule.CheckCollisionPointCircle].
  String CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    num radius,
  ) => 'CheckCollisionPointCircle($point, $center, $radius)';

  /// Label for [RaylibCoreModule.CheckCollisionPointTriangle].
  String CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  ) => 'CheckCollisionPointTriangle($point, $p1, $p2, $p3)';

  /// Label for [RaylibCoreModule.CheckCollisionPointLine].
  String CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    num threshold,
  ) => 'CheckCollisionPointLine($point, $p1, $p2, $threshold)';

  /// Label for [RaylibCoreModule.CheckCollisionPointPoly].
  String CheckCollisionPointPoly(
    Vector2D point,
    List<Vector2D> points,
  ) => 'CheckCollisionPointPoly($point, points: ${points.length})';

  /// Label for [RaylibCoreModule.CheckCollisionLines].
  String CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
  ) => 'CheckCollisionLines($startPos1, $endPos1, $startPos2, $endPos2)';

  /// Label for [RaylibCoreModule.GetCollisionRec].
  String GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => 'GetCollisionRec($rec1, $rec2)';

  /// Label for [RaylibCoreModule.LoadImage].
  String LoadImage(
    String fileName,
  ) => 'LoadImage($fileName)';
    
  /// Label for [RaylibCoreModule.LoadImageRaw].
  String LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => 'LoadImageRaw($fileName, $width, $height, ${format.name}, $headerSize)';

  /// Label for [RaylibCoreModule.LoadImageAnim].
  String LoadImageAnim(
    String fileName,
  ) => 'LoadImageAnim($fileName)';

  /// Label for [RaylibCoreModule.LoadImageAnimFromMemory].
  String LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageAnimFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibCoreModule.LoadImageFromMemory].
  String LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibCoreModule.LoadImageFromTexture].
  String LoadImageFromTexture(
    TextureD texture,
  ) => 'LoadImageFromTexture($texture)';

  /// Label for [RaylibCoreModule.LoadImageFromScreen].
  String LoadImageFromScreen() => 'LoadImageFromScreen()';

  /// Label for [RaylibCoreModule.IsImageValid].
  String IsImageValid(
    ImageD image,
  ) => 'IsImageValid($image)';

  /// Label for [RaylibCoreModule.UnloadImage].
  String UnloadImage(
    ImageD image,
  ) => 'UnloadImage($image)';

  /// Label for [RaylibCoreModule.ExportImage].
  String ExportImage(
    ImageD image,
    String fileName,
  ) => 'ExportImage($image, $fileName)';
    
  /// Label for [RaylibCoreModule.ExportImageToMemory].
  String ExportImageToMemory(
    ImageD image,
    String fileType,
  ) => 'ExportImageToMemory($image, $fileType)';

  /// Label for [RaylibCoreModule.ExportImageAsCode].
  String ExportImageAsCode(
    ImageD image,
    String fileName,
  ) => 'ExportImageAsCode($image, $fileName)';

  /// Label for [RaylibCoreModule.GenImageColor].
  String GenImageColor(
    num width,
    num height,
    ColorD color,
  ) => 'GenImageColor($width, $height, $color)';

  /// Label for [RaylibCoreModule.GenImageGradientLinear].
  String GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorD start,
    ColorD end,
  ) => 'GenImageGradientLinear($width, $height, $direction, $start, $end)';

  /// Label for [RaylibCoreModule.GenImageGradientRadial].
  String GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => 'GenImageGradientRadial($width, $height, $density, $inner, $outer)';

  /// Label for [RaylibCoreModule.GenImageGradientSquare].
  String GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => 'GenImageGradientSquare($width, $height, $density, $inner, $outer)';

  /// Label for [RaylibCoreModule.GenImageChecked].
  String GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorD col1,
    ColorD col2,
  ) => 'GenImageChecked($width, $height, $checksX, $checksY, $col1, $col2)';

  /// Label for [RaylibCoreModule.GenImageWhiteNoise].
  String GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => 'GenImageWhiteNoise($width, $height, $factor)';

  /// Label for [RaylibCoreModule.GenImagePerlinNoise].
  String GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => 'GenImagePerlinNoise($width, $height, $offsetX, $offsetY, $scale)';
    
  /// Label for [RaylibCoreModule.GenImageCellular].
  String GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => 'GenImageCellular($width, $height, $tileSize)';

  /// Label for [RaylibCoreModule.GenImageText].
  String GenImageText(
    num width,
    num height,
    String text,
  ) => 'GenImageText($width, $height, $text)';

  /// Label for [RaylibCoreModule.ImageCopy].
  String ImageCopy(
    ImageD image,
  ) => 'ImageCopy($image)';

  /// Label for [RaylibCoreModule.ImageFromImage].
  String ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => 'ImageFromImage($image, $rec)';

  /// Label for [RaylibCoreModule.ImageFromChannel].
  String ImageFromChannel(
    ImageD image,
    num selectedChannel,
  ) => 'ImageFromChannel($image, $selectedChannel)';

  /// Label for [RaylibCoreModule.ImageText].
  String ImageText(
    String text,
    num fontSize,
    ColorD color,
  ) => 'ImageText($text, $fontSize, $color)';

  /// Label for [RaylibCoreModule.ImageTextEx].
  String ImageTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'ImageTextEx($font, $text, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreModule.ImageFormat].
  String ImageFormat(
    ImageD image,
    PixelFormat newFormat,
  ) => 'ImageFormat($image, ${newFormat.name})';
    
  /// Label for [RaylibCoreModule.ImageToPOT].
  String ImageToPOT(
    ImageD image,
    ColorD fill,
  ) => 'ImageToPOT($image, $fill)';

  /// Label for [RaylibCoreModule.ImageCrop].
  String ImageCrop(
    ImageD image,
    RectangleD crop,
  ) => 'ImageCrop($image, $crop)';

  /// Label for [RaylibCoreModule.ImageAlphaCrop].
  String ImageAlphaCrop(
    ImageD image,
    num threshold,
  ) => 'ImageAlphaCrop($image, $threshold)';

  /// Label for [RaylibCoreModule.ImageAlphaClear].
  String ImageAlphaClear(
    ImageD image,
    ColorD color,
    num threshold,
  ) => 'ImageAlphaClear($image, $color, $threshold)';

  /// Label for [RaylibCoreModule.ImageAlphaMask].
  String ImageAlphaMask(
    ImageD image,
    ImageD alphaMask,
  ) => 'ImageAlphaMask($image, $alphaMask)';

  /// Label for [RaylibCoreModule.ImageAlphaPremultiply].
  String ImageAlphaPremultiply(
    ImageD image,
  ) => 'ImageAlphaPremultiply($image)';

  /// Label for [RaylibCoreModule.ImageBlurGaussian].
  String ImageBlurGaussian(
    ImageD image,
    num blurSize,
  ) => 'ImageBlurGaussian($image, $blurSize)';

  /// Label for [RaylibCoreModule.ImageKernelConvolution].
  String ImageKernelConvolution(
    ImageD image,
    List<double> kernel,
  ) => 'ImageKernelConvolution($image, kernel: ${kernel.length})';

  /// Label for [RaylibCoreModule.ImageResize].
  String ImageResize(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => 'ImageResize($image, $newWidth, $newHeight)';

  /// Label for [RaylibCoreModule.ImageResizeNN].
  String ImageResizeNN(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => 'ImageResizeNN($image, $newWidth, $newHeight)';
    
  /// Label for [RaylibCoreModule.ImageResizeCanvas].
  String ImageResizeCanvas(
    ImageD image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorD fill,
  ) => 'ImageResizeCanvas($image, $newWidth, $newHeight, $offsetX, $offsetY, $fill)';

  /// Label for [RaylibCoreModule.ImageMipmaps].
  String ImageMipmaps(
    ImageD image,
  ) => 'ImageMipmaps($image)';

  /// Label for [RaylibCoreModule.ImageDither].
  String ImageDither(
    ImageD image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => 'ImageDither($image, $rBpp, $gBpp, $bBpp, $aBpp)';

  /// Label for [RaylibCoreModule.ImageFlipVertical].
  String ImageFlipVertical(
    ImageD image,
  ) => 'ImageFlipVertical($image)';

  /// Label for [RaylibCoreModule.ImageFlipHorizontal].
  String ImageFlipHorizontal(
    ImageD image,
  ) => 'ImageFlipHorizontal($image)';

  /// Label for [RaylibCoreModule.ImageRotate].
  String ImageRotate(
    ImageD image,
    num degrees,
  ) => 'ImageRotate($image, $degrees)';

  /// Label for [RaylibCoreModule.ImageRotateCW].
  String ImageRotateCW(
    ImageD image,
  ) => 'ImageRotateCW($image)';

  /// Label for [RaylibCoreModule.ImageRotateCCW].
  String ImageRotateCCW(
    ImageD image,
  ) => 'ImageRotateCCW($image)';
    
  /// Label for [RaylibCoreModule.ImageColorTint].
  String ImageColorTint(
    ImageD image,
    ColorD color,
  ) => 'ImageColorTint($image, $color)';

  /// Label for [RaylibCoreModule.ImageColorInvert].
  String ImageColorInvert(
    ImageD image,
  ) => 'ImageColorInvert($image)';

  /// Label for [RaylibCoreModule.ImageColorGrayscale].
  String ImageColorGrayscale(
    ImageD image,
  ) => 'ImageColorGrayscale($image)';

  /// Label for [RaylibCoreModule.ImageColorContrast].
  String ImageColorContrast(
    ImageD image,
    num contrast,
  ) => 'ImageColorContrast($image, $contrast)';

  /// Label for [RaylibCoreModule.ImageColorBrightness].
  String ImageColorBrightness(
    ImageD image,
    num brightness,
  ) => 'ImageColorBrightness($image, $brightness)';

  /// Label for [RaylibCoreModule.ImageColorReplace].
  String ImageColorReplace(
    ImageD image,
    ColorD color,
    ColorD replace,
  ) => 'ImageColorReplace($image, $color, $replace)';

  /// Label for [RaylibCoreModule.LoadImageColors].
  String LoadImageColors(
    ImageD image,
  ) => 'LoadImageColors($image)';
  
  /// Label for [RaylibCoreModule.LoadImagePalette].
  String LoadImagePalette(
    ImageD image,
    num maxPaletteSize,
  ) => 'LoadImagePalette($image, $maxPaletteSize)';

  /// Label for [RaylibCoreModule.GetImageAlphaBorder].
  String GetImageAlphaBorder(
    ImageD image,
    num threshold,
  ) => 'GetImageAlphaBorder($image, $threshold)';

  /// Label for [RaylibCoreModule.GetImageColor].
  String GetImageColor(
    ImageD image,
    num x,
    num y,
  ) => 'GetImageColor($image, $x, $y)';

  /// Label for [RaylibCoreModule.ImageClearBackground].
  String ImageClearBackground(
    ImageD dst,
    ColorD color,
  ) => 'ImageClearBackground($dst, $color)';

  /// Label for [RaylibCoreModule.ImageDrawPixel].
  String ImageDrawPixel(
    ImageD dst,
    num posX,
    num posY,
    ColorD color,
  ) => 'ImageDrawPixel($dst, $posX, $posY, $color)';

  /// Label for [RaylibCoreModule.ImageDrawPixelV].
  String ImageDrawPixelV(
    ImageD dst,
    Vector2D position,
    ColorD color,
  ) => 'ImageDrawPixelV($dst, $position, $color)';
    
  /// Label for [RaylibCoreModule.ImageDrawLine].
  String ImageDrawLine(
    ImageD dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => 'ImageDrawLine($dst, $startPosX, $startPosY, $endPosX, $endPosY, $color)';

  /// Label for [RaylibCoreModule.ImageDrawLineV].
  String ImageDrawLineV(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  ) => 'ImageDrawLineV($dst, $start, $end, $color)';

  /// Label for [RaylibCoreModule.ImageDrawLineEx].
  String ImageDrawLineEx(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    num thick,
    ColorD color,
  ) => 'ImageDrawLineEx($dst, $start, $end, $thick, $color)';

  /// Label for [RaylibCoreModule.ImageDrawCircle].
  String ImageDrawCircle(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => 'ImageDrawCircle($dst, $centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreModule.ImageDrawCircleV].
  String ImageDrawCircleV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => 'ImageDrawCircleV($dst, $center, $radius, $color)';

  /// Label for [RaylibCoreModule.ImageDrawCircleLines].
  String ImageDrawCircleLines(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => 'ImageDrawCircleLines($dst, $centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreModule.ImageDrawCircleLinesV].
  String ImageDrawCircleLinesV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => 'ImageDrawCircleLinesV($dst, $center, $radius, $color)';

  /// Label for [RaylibCoreModule.ImageDrawRectangle].
  String ImageDrawRectangle(
    ImageD dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => 'ImageDrawRectangle($dst, $posX, $posY, $width, $height, $color)';
    
  /// Label for [RaylibCoreModule.ImageDrawRectangleV].
  String ImageDrawRectangleV(
    ImageD dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => 'ImageDrawRectangleV($dst, $position, $size, $color)';

  /// Label for [RaylibCoreModule.ImageDrawRectangleRec].
  String ImageDrawRectangleRec(
    ImageD dst,
    RectangleD rec,
    ColorD color,
  ) => 'ImageDrawRectangleRec($dst, $rec, $color)';

  /// Label for [RaylibCoreModule.ImageDrawRectangleLines].
  String ImageDrawRectangleLines(
    ImageD dst,
    RectangleD rec,
    num thick,
    ColorD color,
  ) => 'ImageDrawRectangleLines($dst, $rec, $thick, $color)';

  /// Label for [RaylibCoreModule.ImageDrawTriangle].
  String ImageDrawTriangle(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => 'ImageDrawTriangle($dst, $v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreModule.ImageDrawTriangleEx].
  String ImageDrawTriangleEx(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD c1,
    ColorD c2,
    ColorD c3,
  ) => 'ImageDrawTriangleEx($dst, $v1, $v2, $v3, $c1, $c2, $c3)';

  /// Label for [RaylibCoreModule.ImageDrawTriangleLines].
  String ImageDrawTriangleLines(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => 'ImageDrawTriangleLines($dst, $v1, $v2, $v3, $color)';
    
  /// Label for [RaylibCoreModule.ImageDrawTriangleFan].
  String ImageDrawTriangleFan(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => 'ImageDrawTriangleFan($dst, points: ${points.length}, $color)';

  /// Label for [RaylibCoreModule.ImageDrawTriangleStrip].
  String ImageDrawTriangleStrip(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => 'ImageDrawTriangleStrip($dst, points: ${points.length}, $color)';

  /// Label for [RaylibCoreModule.ImageDraw].
  String ImageDraw(
    ImageD dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  ) => 'ImageDraw($dst, $src, $srcRec, $dstRec, $tint)';

  /// Label for [RaylibCoreModule.ImageDrawText].
  String ImageDrawText(
    ImageD dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => 'ImageDrawText($dst, $text, $posX, $posY, $fontSize, $color)';

  /// Label for [RaylibCoreModule.ImageDrawTextEx].
  String ImageDrawTextEx(
    ImageD dst,
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'ImageDrawTextEx($dst, $font, $text, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreModule.LoadTexture].
  String LoadTexture(
    String fileName,
  ) => 'LoadTexture($fileName)';

  /// Label for [RaylibCoreModule.LoadTextureFromImage].
  String LoadTextureFromImage(
    ImageD image,
  ) => 'LoadTextureFromImage($image)';

  /// Label for [RaylibCoreModule.LoadTextureCubemap].
  String LoadTextureCubemap(
    ImageD image,
    CubemapLayout layout,
  ) => 'LoadTextureCubemap($image, $layout)';

  /// Label for [RaylibCoreModule.LoadRenderTexture].
  String LoadRenderTexture(
    num width,
    num height,
  ) => 'LoadRenderTexture($width, $height)';

  /// Label for [RaylibCoreModule.IsTextureValid].
  String IsTextureValid(
    TextureD texture,
  ) => 'IsTextureValid($texture)';

  /// Label for [RaylibCoreModule.UnloadTexture].
  String UnloadTexture(
    TextureD texture,
  ) => 'UnloadTexture($texture)';

  /// Label for [RaylibCoreModule.IsRenderTextureValid].
  String IsRenderTextureValid(
    RenderTextureD target,
  ) => 'IsRenderTextureValid($target)';

  /// Label for [RaylibCoreModule.UnloadRenderTexture].
  String UnloadRenderTexture(
    RenderTextureD target,
  ) => 'UnloadRenderTexture($target)';

  /// Label for [RaylibCoreModule.UpdateTexture].
  String UpdateTexture(
    TextureD texture,
    Uint8List pixels,
  ) => 'UpdateTexture($texture, pixels: ${pixels.length})';
    
  /// Label for [RaylibCoreModule.UpdateTextureRec].
  String UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    Uint8List pixels,
  ) => 'UpdateTextureRec($texture, $rec, pixels: ${pixels.length})';

  /// Label for [RaylibCoreModule.GenTextureMipmaps].
  String GenTextureMipmaps(
    TextureD texture,
  ) => 'GenTextureMipmaps($texture)';

  /// Label for [RaylibCoreModule.SetTextureFilter].
  String SetTextureFilter(
    TextureD texture,
    TextureFilter filter,
  ) => 'SetTextureFilter($texture, $filter)';

  /// Label for [RaylibCoreModule.SetTextureWrap].
  String SetTextureWrap(
    TextureD texture,
    TextureWrap wrap,
  ) => 'SetTextureWrap($texture, $wrap)';

  /// Label for [RaylibCoreModule.DrawTexture].
  String DrawTexture(
    TextureD texture,
    num posX,
    num posY,
    ColorD tint,
  ) => 'DrawTexture($texture, $posX, $posY, $tint)';

  /// Label for [RaylibCoreModule.DrawTextureV].
  String DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  ) => 'DrawTextureV($texture, $position, $tint)';
    
  /// Label for [RaylibCoreModule.DrawTextureEx].
  String DrawTextureEx(
    TextureD texture,
    Vector2D position,
    num rotation,
    num scale,
    ColorD tint,
  ) => 'DrawTextureEx($texture, $position, $rotation, $scale, $tint)';

  /// Label for [RaylibCoreModule.DrawTextureRec].
  String DrawTextureRec(
    TextureD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  ) => 'DrawTextureRec($texture, $source, $position, $tint)';

  /// Label for [RaylibCoreModule.DrawTexturePro].
  String DrawTexturePro(
    TextureD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => 'DrawTexturePro($texture, $source, $dest, $origin, $rotation, $tint)';

  /// Label for [RaylibCoreModule.DrawTextureNPatch].
  String DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => 'DrawTextureNPatch($texture, $nPatchInfo, $dest, $origin, $rotation, $tint)';

  /// Label for [RaylibCoreModule.ColorIsEqual].
  String ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => 'ColorIsEqual($col1, $col2)';

  /// Label for [RaylibCoreModule.Fade].
  String Fade(
    ColorD color,
    num alpha,
  ) => 'Fade($color, $alpha)';

  /// Label for [RaylibCoreModule.ColorToInt].
  String ColorToInt(
    ColorD color,
  ) => 'ColorToInt($color)';

  /// Label for [RaylibCoreModule.ColorNormalize].
  String ColorNormalize(
    ColorD color,
  ) => 'ColorNormalize($color)';

  /// Label for [RaylibCoreModule.ColorFromNormalized].
  String ColorFromNormalized(
    Vector4D normalized,
  ) => 'ColorFromNormalized($normalized)';

  /// Label for [RaylibCoreModule.ColorToHSV].
  String ColorToHSV(
    ColorD color,
  ) => 'ColorToHSV($color)';

  /// Label for [RaylibCoreModule.ColorFromHSV].
  String ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => 'ColorFromHSV($hue, $saturation, $value)';

  /// Label for [RaylibCoreModule.ColorTint].
  String ColorTint(
    ColorD color,
    ColorD tint,
  ) => 'ColorTint($color, $tint)';

  /// Label for [RaylibCoreModule.ColorBrightness].
  String ColorBrightness(
    ColorD color,
    num factor,
  ) => 'ColorBrightness($color, $factor)';

  /// Label for [RaylibCoreModule.ColorContrast].
  String ColorContrast(
    ColorD color,
    num contrast,
  ) => 'ColorContrast($color, $contrast)';

  /// Label for [RaylibCoreModule.ColorAlpha].
  String ColorAlpha(
    ColorD color,
    num alpha,
  ) => 'ColorAlpha($color, $alpha)';

  /// Label for [RaylibCoreModule.ColorAlphaBlend].
  String ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => 'ColorAlphaBlend($dst, $src, $tint)';

  /// Label for [RaylibCoreModule.ColorLerp].
  String ColorLerp(
    ColorD color1,
    ColorD color2,
    num factor,
  ) => 'ColorLerp($color1, $color2, $factor)';

  /// Label for [RaylibCoreModule.GetColor].
  String GetColor(
    num hexValue,
  ) => 'GetColor($hexValue)';

  /// Label for [RaylibCoreModule.GetPixelDataSize].
  String GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => 'GetPixelDataSize($width, $height, $format)';

  /// Label for [RaylibCoreModule.GetFontDefault].
  String GetFontDefault() => 'GetFontDefault()';

  /// Label for [RaylibCoreModule.LoadFont].
  String LoadFont(
    String fileName,
  ) => 'LoadFont($fileName)';
    
  /// Label for [RaylibCoreModule.LoadFontEx].
  String LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  ) => 'LoadFontEx($fileName, $fontSize, codepoints: ${codepointCount ?? codepoints?.length})';

  /// Label for [RaylibCoreModule.LoadFontFromImage].
  String LoadFontFromImage(
    ImageD image,
    ColorD key,
    num firstChar,
  ) => 'LoadFontFromImage($image, $key, $firstChar)';

  /// Label for [RaylibCoreModule.LoadFontFromMemory].
  String LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => 'LoadFontFromMemory($fileType, fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints.length})';

  /// Label for [RaylibCoreModule.IsFontValid].
  String IsFontValid(
    FontD font,
  ) => 'IsFontValid($font)';

  /// Label for [RaylibCoreModule.LoadFontData].
  String LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => 'LoadFontData(fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints?.length}, $type)';

  /// Label for [RaylibCoreModule.GenImageFontAtlas].
  String GenImageFontAtlas(
    List<GlyphInfoD> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => 'GenImageFontAtlas(glyphs: ${glyphs.length}, $fontSize, $padding, $packMethod)';

  /// Label for [RaylibCoreModule.UnloadFontData].
  String UnloadFontData(
    List<GlyphInfoD> glyphs,
  ) => 'UnloadFontData(glyphs: ${glyphs.length})';
    
  /// Label for [RaylibCoreModule.UnloadFont].
  String UnloadFont(
    FontD font,
  ) => 'UnloadFont($font)';

  /// Label for [RaylibCoreModule.ExportFontAsCode].
  String ExportFontAsCode(
    FontD font,
    String fileName,
  ) => 'ExportFontAsCode($font, $fileName)';

  /// Label for [RaylibCoreModule.DrawFPS].
  String DrawFPS(
    num posX,
    num posY,
  ) => 'DrawFPS($posX, $posY)';

  /// Label for [RaylibCoreModule.DrawText].
  String DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => 'DrawText($text, $posX, $posY, $fontSize, $color)';

  /// Label for [RaylibCoreModule.DrawTextEx].
  String DrawTextEx(
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'DrawTextEx($font, $text, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreModule.DrawTextPro].
  String DrawTextPro(
    FontD font,
    String text,
    Vector2D position,
    Vector2D origin,
    num rotation,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'DrawTextPro($font, $text, $position, $origin, $rotation, $fontSize, $spacing, $tint)';
    
  /// Label for [RaylibCoreModule.DrawTextCodepoint].
  String DrawTextCodepoint(
    FontD font,
    num codepoint,
    Vector2D position,
    num fontSize,
    ColorD tint,
  ) => 'DrawTextCodepoint($font, $codepoint, $position, $fontSize, $tint)';

  /// Label for [RaylibCoreModule.DrawTextCodepoints].
  String DrawTextCodepoints(
    FontD font,
    Int32List codepoints,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'DrawTextCodepoints($font, codepoints: ${codepoints.length}, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreModule.SetTextLineSpacing].
  String SetTextLineSpacing(
    num spacing,
  ) => 'SetTextLineSpacing($spacing)';

  /// Label for [RaylibCoreModule.MeasureText].
  String MeasureText(
    String text,
    num fontSize,
  ) => 'MeasureText($text, $fontSize)';
    
  /// Label for [RaylibCoreModule.MeasureTextEx].
  String MeasureTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
  ) => 'MeasureTextEx($font, $text, $fontSize, $spacing)';

  /// Label for [RaylibCoreModule.MeasureTextCodepoints].
  String MeasureTextCodepoints(
    FontD font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  ) => 'MeasureTextCodepoints($font, ${codepoints.length}, $fontSize, $spacing)';

  /// Label for [RaylibCoreModule.GetGlyphIndex].
  String GetGlyphIndex(
    FontD font,
    num codepoint,
  ) => 'GetGlyphIndex($font, $codepoint)';

  /// Label for [RaylibCoreModule.GetGlyphInfo].
  String GetGlyphInfo(
    FontD font,
    num codepoint,
  ) => 'GetGlyphInfo($font, $codepoint)';

  /// Label for [RaylibCoreModule.GetGlyphAtlasRec].
  String GetGlyphAtlasRec(
    FontD font,
    num codepoint,
  ) => 'GetGlyphAtlasRec($font, $codepoint)';
    
  /// Label for [RaylibCoreModule.LoadUTF8].
  String LoadUTF8(
    Int32List codepoints,
  ) => 'LoadUTF8(codepoints: ${codepoints.length})';

  /// Label for [RaylibCoreModule.LoadCodepoints].
  String LoadCodepoints(
    String text,
  ) => 'LoadCodepoints($text)';

  /// Label for [RaylibCoreModule.GetCodepointCount].
  String GetCodepointCount(
    String text,
  ) => 'GetCodepointCount($text)';

  /// Label for [RaylibCoreModule.GetCodepoint].
  String GetCodepoint(
    String text,
  ) => 'GetCodepoint($text)';

  /// Label for [RaylibCoreModule.GetCodepointNext].
  String GetCodepointNext(
    String text,
  ) => 'GetCodepointNext($text)';

  /// Label for [RaylibCoreModule.GetCodepointPrevious].
  String GetCodepointPrevious(
    String text,
  ) => 'GetCodepointPrevious($text)';

  /// Label for [RaylibCoreModule.CodepointToUTF8].
  String CodepointToUTF8(
    num codepoint,
  ) => 'CodepointToUTF8($codepoint)';

  /// Label for [RaylibCoreModule.LoadTextLines].
  String LoadTextLines(
    String text,
  ) => 'LoadTextLines($text)';
  
  /// Label for [RaylibCoreModule.TextIsEqual].
  String TextIsEqual(
    String text1,
    String text2,
  ) => 'TextIsEqual($text1, $text2)';

  /// Label for [RaylibCoreModule.TextLength].
  String TextLength(
    String text,
  ) => 'TextLength($text)';

  /// Label for [RaylibCoreModule.TextSubtext].
  String TextSubtext(
    String text,
    int position,
    int length,
  ) => 'TextSubtext($text, $position, $length)';

  /// Label for [RaylibCoreModule.TextRemoveSpaces].
  String TextRemoveSpaces(
    String text,
  ) => 'TextRemoveSpaces($text)';

  /// Label for [RaylibCoreModule.GetTextBetween].
  String GetTextBetween(
    String text,
    String begin,
    String end,
  ) => 'GetTextBetween($text, $begin, $end)';

  /// Label for [RaylibCoreModule.TextReplace].
  String TextReplace(
    String text,
    String search,
    String replacement,
  ) => 'TextReplace($text, $search, $replacement)';

  /// Label for [RaylibCoreModule.TextReplaceBetween].
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  ) => 'TextReplaceBetween($text, $begin, $end, $replacement)';

  /// Label for [RaylibCoreModule.TextInsert].
  String TextInsert(
    String text,
    String insert,
    int position,
  ) => 'TextInsert($text, $insert, $position)';

  /// Label for [RaylibCoreModule.TextJoin].
  String TextJoin(
    List<String> textList,
    String delimiter,
  ) => 'TextJoin(textList: ${textList.length}, $delimiter)';

  /// Label for [RaylibCoreModule.TextSplit].
  String TextSplit(
    String text,
    String delimiter,
  ) => 'TextSplit($text, $delimiter)';

  /// Label for [RaylibCoreModule.TextAppend].
  String TextAppend(
    String text,
    String append,
  ) => 'TextAppend($text, $append)';

  /// Label for [RaylibCoreModule.TextFindIndex].
  String TextFindIndex(
    String text,
    String search,
  ) => 'TextFindIndex($text, $search)';

  /// Label for [RaylibCoreModule.TextToUpper].
  String TextToUpper(
    String text,
  ) => 'TextToUpper($text)';
  
  /// Label for [RaylibCoreModule.TextToLower].
  String TextToLower(
    String text,
  ) => 'TextToLower($text)';
  
  /// Label for [RaylibCoreModule.TextToPascal].
  String TextToPascal(
    String text,
  ) => 'TextToPascal($text)';
  
  /// Label for [RaylibCoreModule.TextToSnake].
  String TextToSnake(
    String text,
  ) => 'TextToSnake($text)';
  
  /// Label for [RaylibCoreModule.TextToCamel].
  String TextToCamel(
    String text,
  ) => 'TextToCamel($text)';

  /// Label for [RaylibCoreModule.TextToInteger].
  String TextToInteger(
    String text,
  ) => 'TextToInteger($text)';
  
  /// Label for [RaylibCoreModule.TextToFloat].
  String TextToFloat(
    String text,
  ) => 'TextToFloat($text)';
    
  /// Label for [RaylibCoreModule.DrawLine3D].
  String DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => 'DrawLine3D($startPos, $endPos, $color)';
    
  /// Label for [RaylibCoreModule.DrawPoint3D].
  String DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => 'DrawPoint3D($position, $color)';
    
  /// Label for [RaylibCoreModule.DrawCircle3D].
  String DrawCircle3D(
    Vector3D center,
    num radius,
    Vector3D rotationAxis,
    num rotationAngle,
    ColorD color,
  ) => 'DrawCircle3D($center, $radius, $rotationAxis, $rotationAngle, $color)';
    
  /// Label for [RaylibCoreModule.DrawTriangle3D].
  String DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  ) => 'DrawTriangle3D($v1, $v2, $v3, $color)';
    
  /// Label for [RaylibCoreModule.DrawTriangleStrip3D].
  String DrawTriangleStrip3D(
    List<Vector3D> points,
    ColorD color,
  ) => 'DrawTriangleStrip3D(points: ${points.length}, $color)';
    
  /// Label for [RaylibCoreModule.DrawCube].
  String DrawCube(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => 'DrawCube($position, $width, $height, $length, $color)';
    
  /// Label for [RaylibCoreModule.DrawCubeV].
  String DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => 'DrawCubeV($position, $size, $color)';
    
  /// Label for [RaylibCoreModule.DrawCubeWires].
  String DrawCubeWires(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => 'DrawCubeWires($position, $width, $height, $length, $color)';
    
  /// Label for [RaylibCoreModule.DrawCubeWiresV].
  String DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => 'DrawCubeWiresV($position, $size, $color)';
    
  /// Label for [RaylibCoreModule.DrawSphere].
  String DrawSphere(
    Vector3D centerPos,
    num radius,
    ColorD color,
  ) => 'DrawSphere($centerPos, $radius, $color)';
    
  /// Label for [RaylibCoreModule.DrawSphereEx].
  String DrawSphereEx(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => 'DrawSphereEx($centerPos, $radius, $rings, $slices, $color)';
    
  /// Label for [RaylibCoreModule.DrawSphereWires].
  String DrawSphereWires(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => 'DrawSphereWires($centerPos, $radius, $rings, $slices, $color)';
    
  /// Label for [RaylibCoreModule.DrawCylinder].
  String DrawCylinder(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => 'DrawCylinder($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  /// Label for [RaylibCoreModule.DrawCylinderEx].
  String DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => 'DrawCylinderEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  /// Label for [RaylibCoreModule.DrawCylinderWires].
  String DrawCylinderWires(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => 'DrawCylinderWires($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  /// Label for [RaylibCoreModule.DrawCylinderWiresEx].
  String DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => 'DrawCylinderWiresEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  /// Label for [RaylibCoreModule.DrawCapsule].
  String DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => 'DrawCapsule($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  /// Label for [RaylibCoreModule.DrawCapsuleWires].
  String DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => 'DrawCapsuleWires($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  /// Label for [RaylibCoreModule.DrawPlane].
  String DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => 'DrawPlane($centerPos, $size, $color)';
    
  /// Label for [RaylibCoreModule.DrawRay].
  String DrawRay(
    RayD ray,
    ColorD color,
  ) => 'DrawRay($ray, $color)';
    
  /// Label for [RaylibCoreModule.DrawGrid].
  String DrawGrid(
    num slices,
    num spacing,
  ) => 'DrawGrid($slices, $spacing)';
    
  /// Label for [RaylibCoreModule.LoadModel].
  String LoadModel(
    String fileName,
  ) => 'LoadModel($fileName)';
    
  /// Label for [RaylibCoreModule.LoadModelFromMesh].
  String LoadModelFromMesh(
    MeshD mesh,
  ) => 'LoadModelFromMesh($mesh)';
    
  /// Label for [RaylibCoreModule.IsModelValid].
  String IsModelValid(
    ModelD model,
  ) => 'IsModelValid($model)';
    
  /// Label for [RaylibCoreModule.UnloadModel].
  String UnloadModel(
    ModelD model,
  ) => 'UnloadModel($model)';
    
  /// Label for [RaylibCoreModule.GetModelBoundingBox].
  String GetModelBoundingBox(
    ModelD model,
  ) => 'GetModelBoundingBox($model)';
    
  /// Label for [RaylibCoreModule.DrawModel].
  String DrawModel(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint
  ) => 'DrawModel($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreModule.DrawModelEx].
  String DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => 'DrawModelEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreModule.DrawModelWires].
  String DrawModelWires(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => 'DrawModelWires($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreModule.DrawModelWiresEx].
  String DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => 'DrawModelWiresEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreModule.DrawBoundingBox].
  String DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => 'DrawBoundingBox($box, $color)';

  /// Label for [RaylibCoreModule.DrawBillboard].
  String DrawBillboard(
    Camera3DD camera,
    TextureD texture,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => 'DrawBillboard($camera, $texture, $position, $scale, $tint)';

  /// Label for [RaylibCoreModule.DrawBillboardRec].
  String DrawBillboardRec(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  ) => 'DrawBillboardRec($camera, $texture, $source, $position, $size, $tint)';

  /// Label for [RaylibCoreModule.DrawBillboardPro].
  String DrawBillboardPro(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector3D up,
    Vector2D size,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => 'DrawBillboardPro($camera, $texture, $source, $position, $up, $size, $origin, $rotation, $tint)';
  
  /// Label for [RaylibCoreModule.UploadMesh].
  String UploadMesh(
    MeshD mesh,
    bool dynamic,
  ) => 'UploadMesh($mesh, $dynamic)';
    
  /// Label for [RaylibCoreModule.UpdateMeshBuffer].
  String UpdateMeshBuffer(
    MeshD mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => 'UpdateMeshBuffer($mesh, $index, data: ${data.length}, $offset)';
    
  /// Label for [RaylibCoreModule.UnloadMesh].
  String UnloadMesh(
    MeshD mesh,
  ) => 'UnloadMesh($mesh)';
    
  /// Label for [RaylibCoreModule.DrawMesh].
  String DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => 'DrawMesh($mesh, $material, transform: $transform)';
    
  /// Label for [RaylibCoreModule.DrawMeshInstanced].
  String DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    List<MatrixD> transforms,
  ) => 'DrawMeshInstanced($mesh, $material, transforms: ${transforms.length})';
    
  /// Label for [RaylibCoreModule.GetMeshBoundingBox].
  String GetMeshBoundingBox(
    MeshD mesh,
  ) => 'GetMeshBoundingBox($mesh)';
    
  /// Label for [RaylibCoreModule.GenMeshTangents].
  String GenMeshTangents(
    MeshD mesh,
  ) => 'GenMeshTangents($mesh)';
    
  /// Label for [RaylibCoreModule.ExportMesh].
  String ExportMesh(
    MeshD mesh,
    String fileName,
  ) => 'ExportMesh($mesh, $fileName)';
    
  /// Label for [RaylibCoreModule.ExportMeshAsCode].
  String ExportMeshAsCode(
    MeshD mesh,
    String fileName,
  ) => 'ExportMeshAsCode($mesh, $fileName)';
    
  /// Label for [RaylibCoreModule.GenMeshPoly].
  String GenMeshPoly(
    num sides,
    num radius,
  ) => 'GenMeshPoly($sides, $radius)';
    
  /// Label for [RaylibCoreModule.GenMeshPlane].
  String GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => 'GenMeshPlane($width, $length, $resX, $resZ)';
    
  /// Label for [RaylibCoreModule.GenMeshCube].
  String GenMeshCube(
    num width,
    num height,
    num length,
  ) => 'GenMeshCube($width, $height, $length)';
    
  /// Label for [RaylibCoreModule.GenMeshSphere].
  String GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshSphere($radius, $rings, $slices)';
    
  /// Label for [RaylibCoreModule.GenMeshHemiSphere].
  String GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshHemiSphere($radius, $rings, $slices)';
    
  /// Label for [RaylibCoreModule.GenMeshCylinder].
  String GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCylinder($radius, $height, $slices)';
    
  /// Label for [RaylibCoreModule.GenMeshCone].
  String GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCone($radius, $height, $slices)';
    
  /// Label for [RaylibCoreModule.GenMeshTorus].
  String GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshTorus($radius, $size, $radSeg, $sides)';
    
  /// Label for [RaylibCoreModule.GenMeshKnot].
  String GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshKnot($radius, $size, $radSeg, $sides)';
    
  /// Label for [RaylibCoreModule.GenMeshHeightmap].
  String GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  ) => 'GenMeshHeightmap($heightmap, $size)';
    
  /// Label for [RaylibCoreModule.GenMeshCubicmap].
  String GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => 'GenMeshCubicmap($cubicmap, $cubeSize)';
    
  /// Label for [RaylibCoreModule.LoadMaterials].
  String LoadMaterials(
    String fileName,
  ) => 'LoadMaterials($fileName)';
    
  /// Label for [RaylibCoreModule.LoadMaterialDefault].
  String LoadMaterialDefault() => 'LoadMaterialDefault()';
    
  /// Label for [RaylibCoreModule.IsMaterialValid].
  String IsMaterialValid(
    MaterialD material,
  ) => 'IsMaterialValid($material)';
    
  /// Label for [RaylibCoreModule.UnloadMaterial].
  String UnloadMaterial(
    MaterialD material,
  ) => 'UnloadMaterial($material)';
    
  /// Label for [RaylibCoreModule.SetMaterialTexture].
  String SetMaterialTexture(
    MaterialD material,
    MaterialMapIndex mapType,
    TextureD texture,
  ) => 'SetMaterialTexture($material, ${mapType.name}, $texture)';
    
  /// Label for [RaylibCoreModule.SetModelMeshMaterial].
  String SetModelMeshMaterial(
    ModelD model,
    num meshId,
    num materialId,
  ) => 'SetModelMeshMaterial($model, $meshId, $materialId)';
    
  /// Label for [RaylibCoreModule.LoadModelAnimations].
  String LoadModelAnimations(
    String fileName,
  ) => 'LoadModelAnimations($fileName)';
    
  /// Label for [RaylibCoreModule.UpdateModelAnimation].
  String UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => 'UpdateModelAnimation($model, $anim, $frame)';

  /// Label for [RaylibCoreModule.UpdateModelAnimationEx].
  String UpdateModelAnimationEx(
    ModelD model,
    ModelAnimationD animA,
    num frameA,
    ModelAnimationD animB,
    num frameB,
    num blend,
  ) => 'UpdateModelAnimationEx($model, $animA, $frameA, $animB, $frameB, $blend)';
    
  /// Label for [RaylibCoreModule.UnloadModelAnimations].
  String UnloadModelAnimations(
    List<ModelAnimationD> animations,
  ) => 'UnloadModelAnimations(animations: ${animations.length})';
    
  /// Label for [RaylibCoreModule.IsModelAnimationValid].
  String IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => 'IsModelAnimationValid($model, $anim)';
    
  /// Label for [RaylibCoreModule.CheckCollisionSpheres].
  String CheckCollisionSpheres(
    Vector3D center1,
    num radius1,
    Vector3D center2,
    num radius2,
  ) => 'CheckCollisionSpheres($center1, $radius1, $center2, $radius2)';
    
  /// Label for [RaylibCoreModule.CheckCollisionBoxes].
  String CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => 'CheckCollisionBoxes($box1, $box2)';
    
  /// Label for [RaylibCoreModule.CheckCollisionBoxSphere].
  String CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    num radius,
  ) => 'CheckCollisionBoxSphere($box, $center, $radius)';
    
  /// Label for [RaylibCoreModule.GetRayCollisionSphere].
  String GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    num radius,
  ) => 'GetRayCollisionSphere($ray, $center, $radius)';
    
  /// Label for [RaylibCoreModule.GetRayCollisionBox].
  String GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => 'GetRayCollisionBox($ray, $box)';
    
  /// Label for [RaylibCoreModule.GetRayCollisionMesh].
  String GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => 'GetRayCollisionMesh($ray, $mesh, $transform)';
    
  /// Label for [RaylibCoreModule.GetRayCollisionTriangle].
  String GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => 'GetRayCollisionTriangle($ray, $p1, $p2, $p3)';
    
  /// Label for [RaylibCoreModule.GetRayCollisionQuad].
  String GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  ) => 'GetRayCollisionQuad($ray, $p1, $p2, $p3, $p4)';
  
}
