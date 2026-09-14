part of '../../raylib_dartified_base.dart';

class _RaylibCoreDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibCoreDart.InitWindow].
  String InitWindow(
    num width,
    num height,
    String title,
  ) => 'InitWindow($width, $height, $title)';

  /// Label for [RaylibCoreDart.CloseWindow].
  String CloseWindow() => 'CloseWindow()';

  /// Label for [RaylibCoreDart.WindowShouldClose].
  String WindowShouldClose() => 'WindowShouldClose()';

  /// Label for [RaylibCoreDart.IsWindowReady].
  String IsWindowReady() => 'IsWindowReady()';

  /// Label for [RaylibCoreDart.IsWindowFullscreen].
  String IsWindowFullscreen() => 'IsWindowFullscreen()';

  /// Label for [RaylibCoreDart.IsWindowHidden].
  String IsWindowHidden() => 'IsWindowHidden()';
    
  /// Label for [RaylibCoreDart.IsWindowMinimized].
  String IsWindowMinimized() => 'IsWindowMinimized()';
    
  /// Label for [RaylibCoreDart.IsWindowMaximized].
  String IsWindowMaximized() => 'IsWindowMaximized()';
    
  /// Label for [RaylibCoreDart.IsWindowFocused].
  String IsWindowFocused() => 'IsWindowFocused()';
    
  /// Label for [RaylibCoreDart.IsWindowResized].
  String IsWindowResized() => 'IsWindowResized()';
    
  /// Label for [RaylibCoreDart.IsWindowState].
  String IsWindowState(
    ConfigFlags flag,
  ) => 'IsWindowState(${flag.name})';
    
  /// Label for [RaylibCoreDart.SetWindowState].
  String SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'SetWindowState(${EnumsAsFlagsOr(flags)})';
    
  /// Label for [RaylibCoreDart.ClearWindowState].
  String ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'ClearWindowState(${EnumsAsFlagsOr(flags)})';
    
  /// Label for [RaylibCoreDart.ToggleFullscreen].
  String ToggleFullscreen() => 'ToggleFullscreen()';
    
  /// Label for [RaylibCoreDart.ToggleBorderlessWindowed].
  String ToggleBorderlessWindowed() => 'ToggleBorderlessWindowed()';
    
  /// Label for [RaylibCoreDart.MaximizeWindow].
  String MaximizeWindow() => 'MaximizeWindow()';
    
  /// Label for [RaylibCoreDart.MinimizeWindow].
  String MinimizeWindow() => 'MinimizeWindow()';
    
  /// Label for [RaylibCoreDart.RestoreWindow].
  String RestoreWindow() => 'RestoreWindow()';
    
  /// Label for [RaylibCoreDart.SetWindowIcon].
  String SetWindowIcon(
    ImageD image,
  ) => 'SetWindowIcon($image)';
    
  /// Label for [RaylibCoreDart.SetWindowIcons].
  String SetWindowIcons(
    List<ImageD> images,
  ) => 'SetWindowIcons(${images.map((i) => i.$state.internalId).join(', ')})';
    
  /// Label for [RaylibCoreDart.SetWindowTitle].
  String SetWindowTitle(
    String title,
  ) => 'SetWindowTitle($title)';

  /// Label for [RaylibCoreDart.SetWindowPosition].
  String SetWindowPosition(
    num x,
    num y,
  ) => 'SetWindowPosition($x, $y)';
    
  /// Label for [RaylibCoreDart.SetWindowMonitor].
  String SetWindowMonitor(
    num monitor,
  ) => 'SetWindowMonitor($monitor)';
    
  /// Label for [RaylibCoreDart.SetWindowMinSize].
  String SetWindowMinSize(
    num width,
    num height,
  ) => 'SetWindowMinSize($width, $height)';

  /// Label for [RaylibCoreDart.SetWindowMaxSize].
  String SetWindowMaxSize(
    num width,
    num height,
  ) => 'SetWindowMaxSize($width, $height)';
    
  /// Label for [RaylibCoreDart.SetWindowSize].
  String SetWindowSize(
    num width,
    num height,
  ) => 'SetWindowSize($width, $height)';

  /// Label for [RaylibCoreDart.SetWindowOpacity].
  String SetWindowOpacity(
    num opacity,
  ) => 'SetWindowOpacity($opacity)';
    
  /// Label for [RaylibCoreDart.SetWindowFocused].
  String SetWindowFocused() => 'SetWindowFocused()';

  /// Label for [RaylibCoreDart.GetScreenWidth].
  String GetScreenWidth() => 'GetScreenWidth()';
    
  /// Label for [RaylibCoreDart.GetScreenHeight].
  String GetScreenHeight() => 'GetScreenHeight()';
    
  /// Label for [RaylibCoreDart.GetRenderWidth].
  String GetRenderWidth() => 'GetRenderWidth()';
    
  /// Label for [RaylibCoreDart.GetRenderHeight].
  String GetRenderHeight() => 'GetRenderHeight()';
    
  /// Label for [RaylibCoreDart.GetMonitorCount].
  String GetMonitorCount() => 'GetMonitorCount()';
    
  /// Label for [RaylibCoreDart.GetCurrentMonitor].
  String GetCurrentMonitor() => 'GetCurrentMonitor()';
    
  /// Label for [RaylibCoreDart.GetMonitorPosition].
  String GetMonitorPosition(
    num monitor,
  ) => 'GetMonitorPosition($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorWidth].
  String GetMonitorWidth(
    num monitor,
  ) => 'GetMonitorWidth($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorHeight].
  String GetMonitorHeight(
    num monitor,
  ) => 'GetMonitorHeight($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorPhysicalWidth].
  String GetMonitorPhysicalWidth(
    num monitor,
  ) => 'GetMonitorPhysicalWidth($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorPhysicalHeight].
  String GetMonitorPhysicalHeight(
    num monitor,
  ) => 'GetMonitorPhysicalHeight($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorRefreshRate].
  String GetMonitorRefreshRate(
    num monitor,
  ) => 'GetMonitorRefreshRate($monitor)';
    
  /// Label for [RaylibCoreDart.GetWindowPosition].
  String GetWindowPosition() => 'GetWindowPosition()';
    
  /// Label for [RaylibCoreDart.GetWindowScaleDPI].
  String GetWindowScaleDPI() => 'GetWindowScaleDPI()';
    
  /// Label for [RaylibCoreDart.GetMonitorName].
  String GetMonitorName(
    num monitor,
  ) => 'GetMonitorName($monitor)';
    
  /// Label for [RaylibCoreDart.SetClipboardText].
  String SetClipboardText(
    String text,
  ) => 'SetClipboardText($text)';
    
  /// Label for [RaylibCoreDart.GetClipboardText].
  String GetClipboardText() => 'GetClipboardText()';

  /// Label for [RaylibCoreDart.GetClipboardImage].
  String GetClipboardImage() => 'GetClipboardImage()';
    
  /// Label for [RaylibCoreDart.EnableEventWaiting].
  String EnableEventWaiting() => 'EnableEventWaiting()';
    
  /// Label for [RaylibCoreDart.DisableEventWaiting].
  String DisableEventWaiting() => 'DisableEventWaiting()';
    
  /// Label for [RaylibCoreDart.ShowCursor].
  String ShowCursor() => 'ShowCursor()';
    
  /// Label for [RaylibCoreDart.HideCursor].
  String HideCursor() => 'HideCursor()';
    
  /// Label for [RaylibCoreDart.IsCursorHidden].
  String IsCursorHidden() => 'IsCursorHidden()';
    
  /// Label for [RaylibCoreDart.EnableCursor].
  String EnableCursor() => 'EnableCursor()';
    
  /// Label for [RaylibCoreDart.DisableCursor].
  String DisableCursor() => 'DisableCursor()';
    
  /// Label for [RaylibCoreDart.IsCursorOnScreen].
  String IsCursorOnScreen() => 'IsCursorOnScreen()';
    
  /// Label for [RaylibCoreDart.ClearBackground].
  String ClearBackground(
    ColorD color,
  ) => 'ClearBackground($color)';
    
  /// Label for [RaylibCoreDart.BeginDrawing].
  String BeginDrawing() => 'BeginDrawing()';
    
  /// Label for [RaylibCoreDart.EndDrawing].
  String EndDrawing() => 'EndDrawing()';
    
  /// Label for [RaylibCoreDart.BeginMode2D].
  String BeginMode2D(
    Camera2DD camera,
  ) => 'BeginMode2D($camera)';

  /// Label for [RaylibCoreDart.EndMode2D].
  String EndMode2D() => 'EndMode2D()';
    
  /// Label for [RaylibCoreDart.BeginMode3D].
  String BeginMode3D(
    Camera3DD camera,
  ) => 'BeginMode3D($camera)';

  /// Label for [RaylibCoreDart.EndMode3D].
  String EndMode3D() => 'EndMode3D()';
    
  /// Label for [RaylibCoreDart.BeginTextureMode].
  String BeginTextureMode(
    RenderTextureD target,
  ) => 'BeginTextureMode($target)';
    
  /// Label for [RaylibCoreDart.EndTextureMode].
  String EndTextureMode() => 'EndTextureMode()';
    
  /// Label for [RaylibCoreDart.BeginShaderMode].
  String BeginShaderMode(
    ShaderD shader,
  ) => 'BeginShaderMode($shader)';
    
  /// Label for [RaylibCoreDart.EndShaderMode].
  String EndShaderMode() => 'EndShaderMode()';
    
  /// Label for [RaylibCoreDart.BeginBlendMode].
  String BeginBlendMode(
    BlendMode mode,
  ) => 'BeginBlendMode($mode)';
    
  /// Label for [RaylibCoreDart.EndBlendMode].
  String EndBlendMode() => 'EndBlendMode()';
    
  /// Label for [RaylibCoreDart.BeginScissorMode].
  String BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => 'BeginScissorMode($x, $y, $width, $height)';
    
  /// Label for [RaylibCoreDart.EndScissorMode].
  String EndScissorMode() => 'EndScissorMode()';
    
  /// Label for [RaylibCoreDart.BeginVrStereoMode].
  String BeginVrStereoMode(
    VrStereoConfigD config,
  ) => 'BeginVrStereoMode($config)';
    
  /// Label for [RaylibCoreDart.EndVrStereoMode].
  String EndVrStereoMode() => 'EndVrStereoMode()';
    
  /// Label for [RaylibCoreDart.LoadVrStereoConfig].
  String LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => 'LoadVrStereoConfig($device)';
    
  /// Label for [RaylibCoreDart.UnloadVrStereoConfig].
  String UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => 'UnloadVrStereoConfig($config)';
    
  /// Label for [RaylibCoreDart.LoadShader].
  String LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => 'LoadShader($vsFileName, $fsFileName)';
    
  /// Label for [RaylibCoreDart.LoadShaderFromMemory].
  String LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => 'LoadShaderFromMemory($vsCode, $fsCode)';
    
  /// Label for [RaylibCoreDart.IsShaderValid].
  String IsShaderValid(
    ShaderD shader,
  ) => 'IsShaderValid($shader)';
    
  /// Label for [RaylibCoreDart.GetShaderLocation].
  String GetShaderLocation(
    ShaderD shader,
    String uniformName,
  ) => 'GetShaderLocation($shader, $uniformName)';
    
  /// Label for [RaylibCoreDart.GetShaderLocationAttrib].
  String GetShaderLocationAttrib(
    ShaderD shader,
    String attribName,
  ) => 'GetShaderLocationAttrib($shader, $attribName)';
  
  /// Label for [RaylibCoreDart.SetShaderValue].
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

  /// Label for [RaylibCoreDart.SetShaderValueV].
  String SetShaderValueV(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => 'SetShaderValueV($shader, $locIndex, $value, ${uniformType.name}, $count)';
    
  /// Label for [RaylibCoreDart.SetShaderValueMatrix].
  String SetShaderValueMatrix(
    ShaderD shader,
    num locIndex,
    MatrixD mat,
  ) => 'SetShaderValueMatrix($shader, $locIndex, $mat)';
    
  /// Label for [RaylibCoreDart.SetShaderValueTexture].
  String SetShaderValueTexture(
    ShaderD shader,
    num locIndex,
    TextureD texture,
  ) => 'SetShaderValueTexture($shader, $locIndex, $texture)';
    
  /// Label for [RaylibCoreDart.UnloadShader].
  String UnloadShader(
    ShaderD shader,
  ) => 'UnloadShader($shader)';
    
  /// Label for [RaylibCoreDart.GetScreenToWorldRay].
  String GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  ) => 'GetScreenToWorldRay($position, $camera)';
    
  /// Label for [RaylibCoreDart.GetScreenToWorldRayEx].
  String GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    num width,
    num height,
  ) => 'GetScreenToWorldRayEx($position, $camera, $width, $height)';

  /// Label for [RaylibCoreDart.GetWorldToScreen].
  String GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  ) => 'GetWorldToScreen($position, $camera)';

  /// Label for [RaylibCoreDart.GetWorldToScreenEx].
  String GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    num width,
    num height,
  ) => 'GetWorldToScreenEx($position, $camera, $width, $height)';

  /// Label for [RaylibCoreDart.GetWorldToScreen2D].
  String GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => 'GetWorldToScreen2D($position, $camera)';

  /// Label for [RaylibCoreDart.GetScreenToWorld2D].
  String GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => 'GetScreenToWorld2D($position, $camera)';

  /// Label for [RaylibCoreDart.GetCameraMatrix].
  String GetCameraMatrix(
    Camera3DD camera,
  ) => 'GetCameraMatrix($camera)';

  /// Label for [RaylibCoreDart.GetCameraMatrix2D].
  String GetCameraMatrix2D(
    Camera2DD camera,
  ) => 'GetCameraMatrix2D($camera)';
    
  /// Label for [RaylibCoreDart.SetTargetFPS].
  String SetTargetFPS(
    num fps,
  ) => 'SetTargetFPS($fps)';

  /// Label for [RaylibCoreDart.GetFrameTime].
  String GetFrameTime() => 'GetFrameTime()';

  /// Label for [RaylibCoreDart.GetTime].
  String GetTime() => 'GetTime()';

  /// Label for [RaylibCoreDart.GetFPS].
  String GetFPS() => 'GetFPS()';

  /// Label for [RaylibCoreDart.SwapScreenBuffer].
  String SwapScreenBuffer() => 'SwapScreenBuffer()';

  /// Label for [RaylibCoreDart.PollInputEvents].
  String PollInputEvents() => 'PollInputEvents()';

  /// Label for [RaylibCoreDart.WaitTime].
  String WaitTime(
    num seconds,
  ) => 'WaitTime($seconds)';

  /// Label for [RaylibCoreDart.SetRandomSeed].
  String SetRandomSeed(
    num seed,
  ) => 'SetRandomSeed($seed)';

  /// Label for [RaylibCoreDart.GetRandomValue].
  String GetRandomValue(
    num min,
    num max,
  ) => 'GetRandomValue($min, $max)';
  
  /// Label for [RaylibCoreDart.LoadRandomSequence].
  String LoadRandomSequence(
    num count,
    num min,
    num max,
  ) => 'LoadRandomSequence($count, $min, $max)';
    
  /// Label for [RaylibCoreDart.TakeScreenshot].
  String TakeScreenshot(
    String fileName,
  ) => 'TakeScreenshot($fileName)';

  /// Label for [RaylibCoreDart.SetConfigFlags].
  String SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => 'SetConfigFlags(${EnumsAsFlagsOr(flags)})';

  /// Label for [RaylibCoreDart.OpenURL].
  String OpenURL(
    String url,
  ) => 'OpenURL($url)';

  /// Label for [RaylibCoreDart.TraceLog].
  String TraceLog(
    TraceLogLevel logLevel,
    String text,
  ) => 'TraceLog(${logLevel.name}, $text)';

  /// Label for [RaylibCoreDart.SetTraceLogLevel].
  String SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => 'SetTraceLogLevel(${logLevel.name})';

  /// Label for [RaylibCoreDart.SetTraceLogCallback].
  String SetTraceLogCallback(
    TraceLogCallbackBase? callback,
  ) => 'SetTraceLogCallback($callback)';
    
  /// Label for [RaylibCoreDart.SetLoadFileDataCallback].
  String SetLoadFileDataCallback(
    LoadFileDataCallbackBase? callback
  ) => 'SetLoadFileDataCallback($callback)';
    
  /// Label for [RaylibCoreDart.SetSaveFileDataCallback].
  String SetSaveFileDataCallback(
    SaveFileDataCallbackBase? callback
  ) => 'SetSaveFileDataCallback($callback)';
    
  /// Label for [RaylibCoreDart.SetLoadFileTextCallback].
  String SetLoadFileTextCallback(
    LoadFileTextCallbackBase? callback
  ) => 'SetLoadFileTextCallback($callback)';
    
  /// Label for [RaylibCoreDart.SetSaveFileTextCallback].
  String SetSaveFileTextCallback(
    SaveFileTextCallbackBase? callback
  ) => 'SetSaveFileTextCallback($callback)';
    
  /// Label for [RaylibCoreDart.LoadFileData].
  String LoadFileData(
    String fileName,
  ) => 'LoadFileData($fileName)';

  /// Label for [RaylibCoreDart.SaveFileData].
  String SaveFileData(
    String fileName,
    Uint8List data,
  ) => 'SaveFileData($fileName, data: ${data.length})';

  /// Label for [RaylibCoreDart.ExportDataAsCode].
  String ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => 'ExportDataAsCode(data: ${data.length}, $fileName)';

  /// Label for [RaylibCoreDart.LoadFileText].
  String LoadFileText(
    String fileName,
  ) => 'LoadFileText($fileName)';

  /// Label for [RaylibCoreDart.SaveFileText].
  String SaveFileText(
    String fileName,
    String text,
  ) => 'SaveFileText($fileName, $text)';

  /// Label for [RaylibCoreDart.FileRename].
  String FileRename(
    String fileName,
    String fileRename,
  ) => 'FileRename($fileName, $fileRename)';
  
  /// Label for [RaylibCoreDart.FileRemove].
  String FileRemove(
    String fileName,
  ) => 'FileRemove($fileName)';
  
  /// Label for [RaylibCoreDart.FileCopy].
  String FileCopy(
    String srcPath,
    String dstPath,
  ) => 'FileCopy($srcPath, $dstPath)';
  
  /// Label for [RaylibCoreDart.FileMove].
  String FileMove(
    String srcPath,
    String dstPath,
  ) => 'FileMove($srcPath, $dstPath)';
  
  /// Label for [RaylibCoreDart.FileTextReplace].
  String FileTextReplace(
    String fileName,
    String search,
    String replacement,
  ) => 'FileTextReplace($fileName, $search, $replacement)';
  
  /// Label for [RaylibCoreDart.FileTextFindIndex].
  String FileTextFindIndex(
    String fileName,
    String search,
  ) => 'FileTextFindIndex($fileName, $search)';

  /// Label for [RaylibCoreDart.FileExists].
  String FileExists(
    String fileName,
  ) => 'FileExists($fileName)';

  /// Label for [RaylibCoreDart.DirectoryExists].
  String DirectoryExists(
    String dirPath,
  ) => 'DirectoryExists($dirPath)';

  /// Label for [RaylibCoreDart.IsFileExtension].
  String IsFileExtension(
    String fileName,
    String ext,
  ) => 'IsFileExtension($fileName, $ext)';

  /// Label for [RaylibCoreDart.GetFileLength].
  String GetFileLength(
    String fileName,
  ) => 'GetFileLength($fileName)';

  /// Label for [RaylibCoreDart.GetFileExtension].
  String GetFileExtension(
    String fileName,
  ) => 'GetFileExtension($fileName)';

  /// Label for [RaylibCoreDart.GetFileName].
  String GetFileName(
    String filePath,
  ) => 'GetFileName($filePath)';

  /// Label for [RaylibCoreDart.GetFileNameWithoutExt].
  String GetFileNameWithoutExt(
    String filePath,
  ) => 'GetFileNameWithoutExt($filePath)';

  /// Label for [RaylibCoreDart.GetDirectoryFileCount].
  String GetDirectoryFileCount(
    String dirPath, 
  ) => 'GetDirectoryFileCount($dirPath)';
  
  /// Label for [RaylibCoreDart.GetDirectoryFileCountEx].
  String GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'GetDirectoryFileCountEx($basePath, $filter, $scanSubdirs)';

  /// Label for [RaylibCoreDart.GetDirectoryPath].
  String GetDirectoryPath(
    String filePath,
  ) => 'GetDirectoryPath($filePath)';

  /// Label for [RaylibCoreDart.GetPrevDirectoryPath].
  String GetPrevDirectoryPath(
    String dirPath,
  ) => 'GetPrevDirectoryPath($dirPath)';

  /// Label for [RaylibCoreDart.GetWorkingDirectory].
  String GetWorkingDirectory() => 'GetWorkingDirectory()';

  /// Label for [RaylibCoreDart.GetApplicationDirectory].
  String GetApplicationDirectory() => 'GetApplicationDirectory()';

  /// Label for [RaylibCoreDart.MakeDirectory].
  String MakeDirectory(
    String dirPath,
  ) => 'MakeDirectory($dirPath)';

  /// Label for [RaylibCoreDart.ChangeDirectory].
  String ChangeDirectory(
    String dir,
  ) => 'ChangeDirectory($dir)';

  /// Label for [RaylibCoreDart.IsPathFile].
  String IsPathFile(
    String path,
  ) => 'IsPathFile($path)';

  /// Label for [RaylibCoreDart.IsFileNameValid].
  String IsFileNameValid(
    String fileName,
  ) => 'IsFileNameValid($fileName)';
    
  /// Label for [RaylibCoreDart.LoadDirectoryFiles].
  String LoadDirectoryFiles(
    String dirPath,
  ) => 'LoadDirectoryFiles($dirPath)';
    
  /// Label for [RaylibCoreDart.LoadDirectoryFilesEx].
  String LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'LoadDirectoryFilesEx($basePath, $filter, $scanSubdirs)';

  /// Label for [RaylibCoreDart.UnloadDirectoryFiles].
  String UnloadDirectoryFiles(
    FilePathListD files,
  ) => 'UnloadDirectoryFiles($files)';

  /// Label for [RaylibCoreDart.IsFileDropped].
  String IsFileDropped() => 'IsFileDropped()';
    
  /// Label for [RaylibCoreDart.LoadDroppedFiles].
  String LoadDroppedFiles() => 'LoadDroppedFiles()';

  /// Label for [RaylibCoreDart.UnloadDroppedFiles].
  String UnloadDroppedFiles(
    FilePathListD files,
  ) => 'UnloadDroppedFiles($files)';

  /// Label for [RaylibCoreDart.GetFileModTime].
  String GetFileModTime(
    String fileName,
  ) => 'GetFileModTime($fileName)';

  /// Label for [RaylibCoreDart.CompressData].
  String CompressData(
    Uint8List data,
  ) => 'CompressData(data: ${data.length})';

  /// Label for [RaylibCoreDart.DecompressData].
  String DecompressData(
    Uint8List compData,
  ) => 'DecompressData(compData: ${compData.length})';

  /// Label for [RaylibCoreDart.EncodeDataBase64].
  String EncodeDataBase64(
    Uint8List data,
  ) => 'EncodeDataBase64(data: ${data.length})';

  /// Label for [RaylibCoreDart.DecodeDataBase64].
  String DecodeDataBase64(
    Uint8List data,
  ) => 'DecodeDataBase64(data: ${data.length})';

  /// Label for [RaylibCoreDart.ComputeCRC32].
  String ComputeCRC32(
    Uint8List data,
  ) => 'ComputeCRC32(data: ${data.length})';

  /// Label for [RaylibCoreDart.ComputeMD5].
  String ComputeMD5(
    Uint8List data,
  ) => 'ComputeMD5(data: ${data.length})';

  /// Label for [RaylibCoreDart.ComputeSHA1].
  String ComputeSHA1(
    Uint8List data,
  ) => 'ComputeSHA1(data: ${data.length})';

  /// Label for [RaylibCoreDart.ComputeSHA256].
  String ComputeSHA256(
    Uint8List data,
  ) => 'ComputeSHA256(data: ${data.length})';
    
  /// Label for [RaylibCoreDart.LoadAutomationEventList].
  String LoadAutomationEventList(
    String? fileName,
  ) => 'LoadAutomationEventList($fileName)';
    
  /// Label for [RaylibCoreDart.UnloadAutomationEventList].
  String UnloadAutomationEventList(
    AutomationEventListD list,
  ) => 'UnloadAutomationEventList($list)';
    
  /// Label for [RaylibCoreDart.ExportAutomationEventList].
  String ExportAutomationEventList(
    AutomationEventListD list,
    String fileName,
  ) => 'ExportAutomationEventList($list, $fileName)';
    
  /// Label for [RaylibCoreDart.SetAutomationEventList].
  String SetAutomationEventList(
    AutomationEventListD list,
  ) => 'SetAutomationEventList($list)';
    
  /// Label for [RaylibCoreDart.SetAutomationEventBaseFrame].
  String SetAutomationEventBaseFrame(
    int frame,
  ) => 'SetAutomationEventBaseFrame($frame)';
    
  /// Label for [RaylibCoreDart.StartAutomationEventRecording].
  String StartAutomationEventRecording() => 'StartAutomationEventRecording()';

  /// Label for [RaylibCoreDart.StopAutomationEventRecording].
  String StopAutomationEventRecording() => 'StopAutomationEventRecording()';
    
  /// Label for [RaylibCoreDart.PlayAutomationEvent].
  String PlayAutomationEvent(
    AutomationEventD event,
  ) => 'PlayAutomationEvent($event)';

  /// Label for [RaylibCoreDart.IsKeyPressed].
  String IsKeyPressed(
    KeyboardKey key,
  ) => 'IsKeyPressed($key)';

  /// Label for [RaylibCoreDart.IsKeyPressedRepeat].
  String IsKeyPressedRepeat(
    KeyboardKey key,
  ) => 'IsKeyPressedRepeat($key)';

  /// Label for [RaylibCoreDart.IsKeyDown].
  String IsKeyDown(
    KeyboardKey key,
  ) => 'IsKeyDown($key)';
  
  /// Label for [RaylibCoreDart.IsKeyReleased].
  String IsKeyReleased(
    KeyboardKey key,
  ) => 'IsKeyReleased($key)';
  
  /// Label for [RaylibCoreDart.IsKeyUp].
  String IsKeyUp(
    KeyboardKey key,
  ) => 'IsKeyUp($key)';

  /// Label for [RaylibCoreDart.GetKeyName].
  String GetKeyName(
    KeyboardKey key,
  ) => 'GetKeyName($key)';

  /// Label for [RaylibCoreDart.GetKeyPressed].
  String GetKeyPressed() => 'GetKeyPressed()';

  /// Label for [RaylibCoreDart.GetCharPressed].
  String GetCharPressed() => 'GetCharPressed()';

  /// Label for [RaylibCoreDart.SetExitKey].
  String SetExitKey(
    KeyboardKey key,
  ) => 'SetExitKey(${key.name})';

  /// Label for [RaylibCoreDart.IsGamepadAvailable].
  String IsGamepadAvailable(
    num gamepad,
  ) => 'IsGamepadAvailable($gamepad)';

  /// Label for [RaylibCoreDart.GetGamepadName].
  String GetGamepadName(
    num gamepad,
  ) => 'GetGamepadName($gamepad)';

  /// Label for [RaylibCoreDart.IsGamepadButtonPressed].
  String IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonPressed($gamepad, ${button.name})';

  /// Label for [RaylibCoreDart.IsGamepadButtonDown].
  String IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonDown($gamepad, ${button.name})';

  /// Label for [RaylibCoreDart.IsGamepadButtonReleased].
  String IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonReleased($gamepad, ${button.name})';

  /// Label for [RaylibCoreDart.IsGamepadButtonUp].
  String IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonUp($gamepad, ${button.name})';

  /// Label for [RaylibCoreDart.GetGamepadButtonPressed].
  String GetGamepadButtonPressed() => 'GetGamepadButtonPressed()';

  /// Label for [RaylibCoreDart.GetGamepadAxisCount].
  String GetGamepadAxisCount(
    num gamepad,
  ) => 'GetGamepadAxisCount($gamepad)';

  /// Label for [RaylibCoreDart.GetGamepadAxisMovement].
  String GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => 'GetGamepadAxisMovement($gamepad, $axis)';

  /// Label for [RaylibCoreDart.SetGamepadMappings].
  String SetGamepadMappings(
    String mappings,
  ) => 'SetGamepadMappings($mappings)';
    
  /// Label for [RaylibCoreDart.SetGamepadVibration].
  String SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => 'SetGamepadVibration($gamepad, $leftMotor, $rightMotor, $duration)';

  /// Label for [RaylibCoreDart.IsMouseButtonPressed].
  String IsMouseButtonPressed(
    MouseButton button,
  ) => 'IsMouseButtonPressed(${button.name})';

  /// Label for [RaylibCoreDart.IsMouseButtonDown].
  String IsMouseButtonDown(
    MouseButton button,
  ) => 'IsMouseButtonDown(${button.name})';

  /// Label for [RaylibCoreDart.IsMouseButtonReleased].
  String IsMouseButtonReleased(
    MouseButton button,
  ) => 'IsMouseButtonReleased(${button.name})';

  /// Label for [RaylibCoreDart.IsMouseButtonUp].
  String IsMouseButtonUp(
    MouseButton button,
  ) => 'IsMouseButtonUp(${button.name})';

  /// Label for [RaylibCoreDart.GetMouseX].
  String GetMouseX() => 'GetMouseX()';

  /// Label for [RaylibCoreDart.GetMouseY].
  String GetMouseY() => 'GetMouseY()';

  /// Label for [RaylibCoreDart.GetMousePosition].
  String GetMousePosition() => 'GetMousePosition()';

  /// Label for [RaylibCoreDart.GetMouseDelta].
  String GetMouseDelta() => 'GetMouseDelta()';

  /// Label for [RaylibCoreDart.SetMousePosition].
  String SetMousePosition(
    num x,
    num y,
  ) => 'SetMousePosition($x, $y)';

  /// Label for [RaylibCoreDart.SetMouseOffset].
  String SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => 'SetMouseOffset($offsetX, $offsetY)';

  /// Label for [RaylibCoreDart.SetMouseScale].
  String SetMouseScale(
    num scaleX,
    num scaleY,
  ) => 'SetMouseScale($scaleX, $scaleY)';

  /// Label for [RaylibCoreDart.GetMouseWheelMove].
  String GetMouseWheelMove() => 'GetMouseWheelMove()';

  /// Label for [RaylibCoreDart.GetMouseWheelMoveV].
  String GetMouseWheelMoveV() => 'GetMouseWheelMoveV()';

  /// Label for [RaylibCoreDart.SetMouseCursor].
  String SetMouseCursor(
    MouseCursor cursor,
  ) => 'SetMouseCursor(${cursor.name})';

  /// Label for [RaylibCoreDart.GetTouchX].
  String GetTouchX() => 'GetTouchX()';

  /// Label for [RaylibCoreDart.GetTouchY].
  String GetTouchY() => 'GetTouchY()';

  /// Label for [RaylibCoreDart.GetTouchPosition].
  String GetTouchPosition(
    num index,
  ) => 'GetTouchPosition($index)';

  /// Label for [RaylibCoreDart.GetTouchPointId].
  String GetTouchPointId(
    num index,
  ) => 'GetTouchPointId($index)';

  /// Label for [RaylibCoreDart.GetTouchPointCount].
  String GetTouchPointCount() => 'GetTouchPointCount()';

  /// Label for [RaylibCoreDart.SetGesturesEnabled].
  String SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => 'SetGesturesEnabled($flags)';

  /// Label for [RaylibCoreDart.IsGestureDetected].
  String IsGestureDetected(
    Gesture key,
  ) => 'IsGestureDetected($key)';

  /// Label for [RaylibCoreDart.GetGestureDetected].
  String GetGestureDetected() => 'GetGestureDetected()';

  /// Label for [RaylibCoreDart.GetGestureHoldDuration].
  String GetGestureHoldDuration() => 'GetGestureHoldDuration()';

  /// Label for [RaylibCoreDart.GetGestureDragVector].
  String GetGestureDragVector() => 'GetGestureDragVector()';

  /// Label for [RaylibCoreDart.GetGestureDragAngle].
  String GetGestureDragAngle() => 'GetGestureDragAngle()';

  /// Label for [RaylibCoreDart.GetGesturePinchVector].
  String GetGesturePinchVector() => 'GetGesturePinchVector()';

  /// Label for [RaylibCoreDart.GetGesturePinchAngle].
  String GetGesturePinchAngle() => 'GetGesturePinchAngle()';

  /// Label for [RaylibCoreDart.ProcessGestureEvent].
  String ProcessGestureEvent(
    GestureEventD event,
  ) => 'ProcessGestureEvent($event)';
  
  /// Label for [RaylibCoreDart.UpdateGestures].
  String UpdateGestures() => 'UpdateGestures()';
    
  /// Label for [RaylibCoreDart.UpdateCamera].
  String UpdateCamera(
    Camera3DD camera,
    CameraMode mode,
  ) => 'UpdateCamera($camera, $mode)';

  /// Label for [RaylibCoreDart.UpdateCameraPro].
  String UpdateCameraPro(
    Camera3DD camera,
    Vector3D movement,
    Vector3D rotation,
    num zoom,
  ) => 'UpdateCameraPro($camera, $movement, $rotation, $zoom)';

  /// Label for [RaylibCoreDart.SetShapesTexture].
  String SetShapesTexture(
    TextureD texture,
    RectangleD source,
  ) => 'SetShapesTexture($texture, $source)';

  /// Label for [RaylibCoreDart.GetShapesTexture].
  String GetShapesTexture() => 'GetShapesTexture()';

  /// Label for [RaylibCoreDart.GetShapesTextureRectangle].
  String GetShapesTextureRectangle() => 'GetShapesTextureRectangle()';

  /// Label for [RaylibCoreDart.DrawPixel].
  String DrawPixel(
    num posX,
    num posY,
    ColorD color,
  ) => 'DrawPixel($posX, $posY, $color)';

  /// Label for [RaylibCoreDart.DrawPixelV].
  String DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => 'DrawPixelV($position, $color)';
    
  /// Label for [RaylibCoreDart.DrawLine].
  String DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => 'DrawLine($startPosX, $startPosY, $endPosX, $endPosY, $color)';

  /// Label for [RaylibCoreDart.DrawLineV].
  String DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => 'DrawLineV($startPos, $endPos, $color)';

  /// Label for [RaylibCoreDart.DrawLineEx].
  String DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => 'DrawLineEx($startPos, $endPos, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawLineStrip].
  String DrawLineStrip(
    List<Vector2D> points,
    ColorD color,
  ) => 'DrawLineStrip(points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.DrawLineBezier].
  String DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => 'DrawLineBezier($startPos, $endPos, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawLineDashed].
  String DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    num dashSize,
    num spaceSize,
    ColorD color,
  ) => 'DrawLineDashed($startPos, $endPos, $dashSize, $spaceSize, $color)';

  /// Label for [RaylibCoreDart.DrawCircle].
  String DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => 'DrawCircle($centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreDart.DrawCircleSector].
  String DrawCircleSector(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => 'DrawCircleSector($center, $radius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawCircleSectorLines].
  String DrawCircleSectorLines(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => 'DrawCircleSectorLines($center, $radius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawCircleGradient].
  String DrawCircleGradient(
    Vector2D center,
    num radius,
    ColorD inner,
    ColorD outer,
  ) => 'DrawCircleGradient($center, $radius, $inner, $outer)';

  /// Label for [RaylibCoreDart.DrawCircleV].
  String DrawCircleV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => 'DrawCircleV($center, $radius, $color)';

  /// Label for [RaylibCoreDart.DrawCircleLines].
  String DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => 'DrawCircleLines($centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreDart.DrawCircleLinesV].
  String DrawCircleLinesV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => 'DrawCircleLinesV($center, $radius, $color)';
    
  /// Label for [RaylibCoreDart.DrawEllipse].
  String DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => 'DrawEllipse($centerX, $centerY, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreDart.DrawEllipseV].
  String DrawEllipseV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => 'DrawEllipse($center, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreDart.DrawEllipseLines].
  String DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => 'DrawEllipseLines($centerX, $centerY, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreDart.DrawEllipseLinesV].
  String DrawEllipseLinesV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => 'DrawEllipseLinesV($center, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreDart.DrawRing].
  String DrawRing(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => 'DrawRing($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawRingLines].
  String DrawRingLines(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => 'DrawRingLines($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawRectangle].
  String DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => 'DrawRectangle($posX, $posY, $width, $height, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleV].
  String DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => 'DrawRectangleV($position, $size, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleRec].
  String DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => 'DrawRectangleRec($rec, $color)';
    
  /// Label for [RaylibCoreDart.DrawRectanglePro].
  String DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    num rotation,
    ColorD color,
  ) => 'DrawRectanglePro($rec, $origin, $rotation, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleGradientV].
  String DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorD top,
    ColorD bottom,
  ) => 'DrawRectangleGradientV($posX, $posY, $width, $height, $top, $bottom)';

  /// Label for [RaylibCoreDart.DrawRectangleGradientH].
  String DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorD left,
    ColorD right,
  ) => 'DrawRectangleGradientH($posX, $posY, $width, $height, $left, $right)';

  /// Label for [RaylibCoreDart.DrawRectangleGradientEx].
  String DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  ) => 'DrawRectangleGradientEx($rec, $topLeft, $bottomLeft, $topRight, $bottomRight)';

  /// Label for [RaylibCoreDart.DrawRectangleLines].
  String DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => 'DrawRectangleLines($posX, $posY, $width, $height, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleLinesEx].
  String DrawRectangleLinesEx(
    RectangleD rec,
    num lineThick,
    ColorD color,
  ) => 'DrawRectangleLinesEx($rec, $lineThick, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleRounded].
  String DrawRectangleRounded(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => 'DrawRectangleRounded($rec, $roundness, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleRoundedLines].
  String DrawRectangleRoundedLines(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => 'DrawRectangleRoundedLines($rec, $roundness, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleRoundedLinesEx].
  String DrawRectangleRoundedLinesEx(
    RectangleD rec,
    num roundness,
    num segments,
    num lineThick,
    ColorD color,
  ) => 'DrawRectangleRoundedLinesEx($rec, $roundness, $segments, $lineThick, $color)';
    
  /// Label for [RaylibCoreDart.DrawTriangle].
  String DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => 'DrawTriangle($v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreDart.DrawTriangleLines].
  String DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => 'DrawTriangleLines($v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreDart.DrawTriangleFan].
  String DrawTriangleFan(
    List<Vector2D> points,
    ColorD color,
  ) => 'DrawTriangleFan(points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.DrawTriangleStrip].
  String DrawTriangleStrip(
    List<Vector2D> points,
    ColorD color,
  ) => 'DrawTriangleStrip(points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.DrawPoly].
  String DrawPoly(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => 'DrawPoly($center, $sides, $radius, $rotation, $color)';

  /// Label for [RaylibCoreDart.DrawPolyLines].
  String DrawPolyLines(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => 'DrawPolyLines($center, $sides, $radius, $rotation, $color)';

  /// Label for [RaylibCoreDart.DrawPolyLinesEx].
  String DrawPolyLinesEx(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorD color,
  ) => 'DrawPolyLinesEx($center, $sides, $radius, $rotation, $lineThick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineLinear].
  String DrawSplineLinear(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineLinear(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineBasis].
  String DrawSplineBasis(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineBasis(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineCatmullRom].
  String DrawSplineCatmullRom(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineCatmullRom(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineBezierQuadratic].
  String DrawSplineBezierQuadratic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineBezierQuadratic(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineBezierCubic].
  String DrawSplineBezierCubic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => 'DrawSplineBezierCubic(points: ${points.length}, $thick, $color)';
    
  /// Label for [RaylibCoreDart.DrawSplineSegmentLinear].
  String DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentLinear($p1, $p2, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineSegmentBasis].
  String DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentBasis($p1, $p2, $p3, $p4, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineSegmentCatmullRom].
  String DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentCatmullRom($p1, $p2, $p3, $p4, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineSegmentBezierQuadratic].
  String DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentBezierQuadratic($p1, $c2, $p3, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineSegmentBezierCubic].
  String DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => 'DrawSplineSegmentBezierCubic($p1, $c2, $c3, $p4, $thick, $color)';

  /// Label for [RaylibCoreDart.GetSplinePointLinear].
  String GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    num t,
  ) => 'GetSplinePointLinear($startPos, $endPos, $t)';

  /// Label for [RaylibCoreDart.GetSplinePointBasis].
  String GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => 'GetSplinePointBasis($p1, $p2, $p3, $p4, $t)';
    
  /// Label for [RaylibCoreDart.GetSplinePointCatmullRom].
  String GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => 'GetSplinePointCatmullRom($p1, $p2, $p3, $p4, $t)';

  /// Label for [RaylibCoreDart.GetSplinePointBezierQuad].
  String GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num t,
  ) => 'GetSplinePointBezierQuad($p1, $c2, $p3, $t)';

  /// Label for [RaylibCoreDart.GetSplinePointBezierCubic].
  String GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num t,
  ) => 'GetSplinePointBezierCubic($p1, $c2, $c3, $p4, $t)';

  /// Label for [RaylibCoreDart.CheckCollisionRecs].
  String CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => 'CheckCollisionRecs($rec1, $rec2)';

  /// Label for [RaylibCoreDart.CheckCollisionCircles].
  String CheckCollisionCircles(
    Vector2D center1,
    num radius1,
    Vector2D center2,
    num radius2,
  ) => 'CheckCollisionCircles($center1, $radius1, $center2, $radius2)';

  /// Label for [RaylibCoreDart.CheckCollisionCircleRec].
  String CheckCollisionCircleRec(
    Vector2D center,
    num radius,
    RectangleD rec,
  ) => 'CheckCollisionCircleRec($center, $radius, $rec)';

  /// Label for [RaylibCoreDart.CheckCollisionCircleLine].
  String CheckCollisionCircleLine(
    Vector2D center,
    num radius,
    Vector2D p1,
    Vector2D p2,
  ) => 'CheckCollisionCircleLine($center, $radius, $p1, $p2)';

  /// Label for [RaylibCoreDart.CheckCollisionPointRec].
  String CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => 'CheckCollisionPointRec($point, $rec)';
    
  /// Label for [RaylibCoreDart.CheckCollisionPointCircle].
  String CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    num radius,
  ) => 'CheckCollisionPointCircle($point, $center, $radius)';

  /// Label for [RaylibCoreDart.CheckCollisionPointTriangle].
  String CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  ) => 'CheckCollisionPointTriangle($point, $p1, $p2, $p3)';

  /// Label for [RaylibCoreDart.CheckCollisionPointLine].
  String CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    num threshold,
  ) => 'CheckCollisionPointLine($point, $p1, $p2, $threshold)';

  /// Label for [RaylibCoreDart.CheckCollisionPointPoly].
  String CheckCollisionPointPoly(
    Vector2D point,
    List<Vector2D> points,
  ) => 'CheckCollisionPointPoly($point, points: ${points.length})';

  /// Label for [RaylibCoreDart.CheckCollisionLines].
  String CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
  ) => 'CheckCollisionLines($startPos1, $endPos1, $startPos2, $endPos2)';

  /// Label for [RaylibCoreDart.GetCollisionRec].
  String GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => 'GetCollisionRec($rec1, $rec2)';

  /// Label for [RaylibCoreDart.LoadImage].
  String LoadImage(
    String fileName,
  ) => 'LoadImage($fileName)';
    
  /// Label for [RaylibCoreDart.LoadImageRaw].
  String LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => 'LoadImageRaw($fileName, $width, $height, ${format.name}, $headerSize)';

  /// Label for [RaylibCoreDart.LoadImageAnim].
  String LoadImageAnim(
    String fileName,
  ) => 'LoadImageAnim($fileName)';

  /// Label for [RaylibCoreDart.LoadImageAnimFromMemory].
  String LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageAnimFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibCoreDart.LoadImageFromMemory].
  String LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibCoreDart.LoadImageFromTexture].
  String LoadImageFromTexture(
    TextureD texture,
  ) => 'LoadImageFromTexture($texture)';

  /// Label for [RaylibCoreDart.LoadImageFromScreen].
  String LoadImageFromScreen() => 'LoadImageFromScreen()';

  /// Label for [RaylibCoreDart.IsImageValid].
  String IsImageValid(
    ImageD image,
  ) => 'IsImageValid($image)';

  /// Label for [RaylibCoreDart.UnloadImage].
  String UnloadImage(
    ImageD image,
  ) => 'UnloadImage($image)';

  /// Label for [RaylibCoreDart.ExportImage].
  String ExportImage(
    ImageD image,
    String fileName,
  ) => 'ExportImage($image, $fileName)';
    
  /// Label for [RaylibCoreDart.ExportImageToMemory].
  String ExportImageToMemory(
    ImageD image,
    String fileType,
  ) => 'ExportImageToMemory($image, $fileType)';

  /// Label for [RaylibCoreDart.ExportImageAsCode].
  String ExportImageAsCode(
    ImageD image,
    String fileName,
  ) => 'ExportImageAsCode($image, $fileName)';

  /// Label for [RaylibCoreDart.GenImageColor].
  String GenImageColor(
    num width,
    num height,
    ColorD color,
  ) => 'GenImageColor($width, $height, $color)';

  /// Label for [RaylibCoreDart.GenImageGradientLinear].
  String GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorD start,
    ColorD end,
  ) => 'GenImageGradientLinear($width, $height, $direction, $start, $end)';

  /// Label for [RaylibCoreDart.GenImageGradientRadial].
  String GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => 'GenImageGradientRadial($width, $height, $density, $inner, $outer)';

  /// Label for [RaylibCoreDart.GenImageGradientSquare].
  String GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => 'GenImageGradientSquare($width, $height, $density, $inner, $outer)';

  /// Label for [RaylibCoreDart.GenImageChecked].
  String GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorD col1,
    ColorD col2,
  ) => 'GenImageChecked($width, $height, $checksX, $checksY, $col1, $col2)';

  /// Label for [RaylibCoreDart.GenImageWhiteNoise].
  String GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => 'GenImageWhiteNoise($width, $height, $factor)';

  /// Label for [RaylibCoreDart.GenImagePerlinNoise].
  String GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => 'GenImagePerlinNoise($width, $height, $offsetX, $offsetY, $scale)';
    
  /// Label for [RaylibCoreDart.GenImageCellular].
  String GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => 'GenImageCellular($width, $height, $tileSize)';

  /// Label for [RaylibCoreDart.GenImageText].
  String GenImageText(
    num width,
    num height,
    String text,
  ) => 'GenImageText($width, $height, $text)';

  /// Label for [RaylibCoreDart.ImageCopy].
  String ImageCopy(
    ImageD image,
  ) => 'ImageCopy($image)';

  /// Label for [RaylibCoreDart.ImageFromImage].
  String ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => 'ImageFromImage($image, $rec)';

  /// Label for [RaylibCoreDart.ImageFromChannel].
  String ImageFromChannel(
    ImageD image,
    num selectedChannel,
  ) => 'ImageFromChannel($image, $selectedChannel)';

  /// Label for [RaylibCoreDart.ImageText].
  String ImageText(
    String text,
    num fontSize,
    ColorD color,
  ) => 'ImageText($text, $fontSize, $color)';

  /// Label for [RaylibCoreDart.ImageTextEx].
  String ImageTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'ImageTextEx($font, $text, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreDart.ImageFormat].
  String ImageFormat(
    ImageD image,
    PixelFormat newFormat,
  ) => 'ImageFormat($image, ${newFormat.name})';
    
  /// Label for [RaylibCoreDart.ImageToPOT].
  String ImageToPOT(
    ImageD image,
    ColorD fill,
  ) => 'ImageToPOT($image, $fill)';

  /// Label for [RaylibCoreDart.ImageCrop].
  String ImageCrop(
    ImageD image,
    RectangleD crop,
  ) => 'ImageCrop($image, $crop)';

  /// Label for [RaylibCoreDart.ImageAlphaCrop].
  String ImageAlphaCrop(
    ImageD image,
    num threshold,
  ) => 'ImageAlphaCrop($image, $threshold)';

  /// Label for [RaylibCoreDart.ImageAlphaClear].
  String ImageAlphaClear(
    ImageD image,
    ColorD color,
    num threshold,
  ) => 'ImageAlphaClear($image, $color, $threshold)';

  /// Label for [RaylibCoreDart.ImageAlphaMask].
  String ImageAlphaMask(
    ImageD image,
    ImageD alphaMask,
  ) => 'ImageAlphaMask($image, $alphaMask)';

  /// Label for [RaylibCoreDart.ImageAlphaPremultiply].
  String ImageAlphaPremultiply(
    ImageD image,
  ) => 'ImageAlphaPremultiply($image)';

  /// Label for [RaylibCoreDart.ImageBlurGaussian].
  String ImageBlurGaussian(
    ImageD image,
    num blurSize,
  ) => 'ImageBlurGaussian($image, $blurSize)';

  /// Label for [RaylibCoreDart.ImageKernelConvolution].
  String ImageKernelConvolution(
    ImageD image,
    List<double> kernel,
  ) => 'ImageKernelConvolution($image, kernel: ${kernel.length})';

  /// Label for [RaylibCoreDart.ImageResize].
  String ImageResize(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => 'ImageResize($image, $newWidth, $newHeight)';

  /// Label for [RaylibCoreDart.ImageResizeNN].
  String ImageResizeNN(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => 'ImageResizeNN($image, $newWidth, $newHeight)';
    
  /// Label for [RaylibCoreDart.ImageResizeCanvas].
  String ImageResizeCanvas(
    ImageD image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorD fill,
  ) => 'ImageResizeCanvas($image, $newWidth, $newHeight, $offsetX, $offsetY, $fill)';

  /// Label for [RaylibCoreDart.ImageMipmaps].
  String ImageMipmaps(
    ImageD image,
  ) => 'ImageMipmaps($image)';

  /// Label for [RaylibCoreDart.ImageDither].
  String ImageDither(
    ImageD image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => 'ImageDither($image, $rBpp, $gBpp, $bBpp, $aBpp)';

  /// Label for [RaylibCoreDart.ImageFlipVertical].
  String ImageFlipVertical(
    ImageD image,
  ) => 'ImageFlipVertical($image)';

  /// Label for [RaylibCoreDart.ImageFlipHorizontal].
  String ImageFlipHorizontal(
    ImageD image,
  ) => 'ImageFlipHorizontal($image)';

  /// Label for [RaylibCoreDart.ImageRotate].
  String ImageRotate(
    ImageD image,
    num degrees,
  ) => 'ImageRotate($image, $degrees)';

  /// Label for [RaylibCoreDart.ImageRotateCW].
  String ImageRotateCW(
    ImageD image,
  ) => 'ImageRotateCW($image)';

  /// Label for [RaylibCoreDart.ImageRotateCCW].
  String ImageRotateCCW(
    ImageD image,
  ) => 'ImageRotateCCW($image)';
    
  /// Label for [RaylibCoreDart.ImageColorTint].
  String ImageColorTint(
    ImageD image,
    ColorD color,
  ) => 'ImageColorTint($image, $color)';

  /// Label for [RaylibCoreDart.ImageColorInvert].
  String ImageColorInvert(
    ImageD image,
  ) => 'ImageColorInvert($image)';

  /// Label for [RaylibCoreDart.ImageColorGrayscale].
  String ImageColorGrayscale(
    ImageD image,
  ) => 'ImageColorGrayscale($image)';

  /// Label for [RaylibCoreDart.ImageColorContrast].
  String ImageColorContrast(
    ImageD image,
    num contrast,
  ) => 'ImageColorContrast($image, $contrast)';

  /// Label for [RaylibCoreDart.ImageColorBrightness].
  String ImageColorBrightness(
    ImageD image,
    num brightness,
  ) => 'ImageColorBrightness($image, $brightness)';

  /// Label for [RaylibCoreDart.ImageColorReplace].
  String ImageColorReplace(
    ImageD image,
    ColorD color,
    ColorD replace,
  ) => 'ImageColorReplace($image, $color, $replace)';

  /// Label for [RaylibCoreDart.LoadImageColors].
  String LoadImageColors(
    ImageD image,
  ) => 'LoadImageColors($image)';
  
  /// Label for [RaylibCoreDart.LoadImagePalette].
  String LoadImagePalette(
    ImageD image,
    num maxPaletteSize,
  ) => 'LoadImagePalette($image, $maxPaletteSize)';

  /// Label for [RaylibCoreDart.GetImageAlphaBorder].
  String GetImageAlphaBorder(
    ImageD image,
    num threshold,
  ) => 'GetImageAlphaBorder($image, $threshold)';

  /// Label for [RaylibCoreDart.GetImageColor].
  String GetImageColor(
    ImageD image,
    num x,
    num y,
  ) => 'GetImageColor($image, $x, $y)';

  /// Label for [RaylibCoreDart.ImageClearBackground].
  String ImageClearBackground(
    ImageD dst,
    ColorD color,
  ) => 'ImageClearBackground($dst, $color)';

  /// Label for [RaylibCoreDart.ImageDrawPixel].
  String ImageDrawPixel(
    ImageD dst,
    num posX,
    num posY,
    ColorD color,
  ) => 'ImageDrawPixel($dst, $posX, $posY, $color)';

  /// Label for [RaylibCoreDart.ImageDrawPixelV].
  String ImageDrawPixelV(
    ImageD dst,
    Vector2D position,
    ColorD color,
  ) => 'ImageDrawPixelV($dst, $position, $color)';
    
  /// Label for [RaylibCoreDart.ImageDrawLine].
  String ImageDrawLine(
    ImageD dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => 'ImageDrawLine($dst, $startPosX, $startPosY, $endPosX, $endPosY, $color)';

  /// Label for [RaylibCoreDart.ImageDrawLineV].
  String ImageDrawLineV(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  ) => 'ImageDrawLineV($dst, $start, $end, $color)';

  /// Label for [RaylibCoreDart.ImageDrawLineEx].
  String ImageDrawLineEx(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    num thick,
    ColorD color,
  ) => 'ImageDrawLineEx($dst, $start, $end, $thick, $color)';

  /// Label for [RaylibCoreDart.ImageDrawCircle].
  String ImageDrawCircle(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => 'ImageDrawCircle($dst, $centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreDart.ImageDrawCircleV].
  String ImageDrawCircleV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => 'ImageDrawCircleV($dst, $center, $radius, $color)';

  /// Label for [RaylibCoreDart.ImageDrawCircleLines].
  String ImageDrawCircleLines(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => 'ImageDrawCircleLines($dst, $centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreDart.ImageDrawCircleLinesV].
  String ImageDrawCircleLinesV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => 'ImageDrawCircleLinesV($dst, $center, $radius, $color)';

  /// Label for [RaylibCoreDart.ImageDrawRectangle].
  String ImageDrawRectangle(
    ImageD dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => 'ImageDrawRectangle($dst, $posX, $posY, $width, $height, $color)';
    
  /// Label for [RaylibCoreDart.ImageDrawRectangleV].
  String ImageDrawRectangleV(
    ImageD dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => 'ImageDrawRectangleV($dst, $position, $size, $color)';

  /// Label for [RaylibCoreDart.ImageDrawRectangleRec].
  String ImageDrawRectangleRec(
    ImageD dst,
    RectangleD rec,
    ColorD color,
  ) => 'ImageDrawRectangleRec($dst, $rec, $color)';

  /// Label for [RaylibCoreDart.ImageDrawRectangleLines].
  String ImageDrawRectangleLines(
    ImageD dst,
    RectangleD rec,
    num thick,
    ColorD color,
  ) => 'ImageDrawRectangleLines($dst, $rec, $thick, $color)';

  /// Label for [RaylibCoreDart.ImageDrawTriangle].
  String ImageDrawTriangle(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => 'ImageDrawTriangle($dst, $v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreDart.ImageDrawTriangleEx].
  String ImageDrawTriangleEx(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD c1,
    ColorD c2,
    ColorD c3,
  ) => 'ImageDrawTriangleEx($dst, $v1, $v2, $v3, $c1, $c2, $c3)';

  /// Label for [RaylibCoreDart.ImageDrawTriangleLines].
  String ImageDrawTriangleLines(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => 'ImageDrawTriangleLines($dst, $v1, $v2, $v3, $color)';
    
  /// Label for [RaylibCoreDart.ImageDrawTriangleFan].
  String ImageDrawTriangleFan(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => 'ImageDrawTriangleFan($dst, points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.ImageDrawTriangleStrip].
  String ImageDrawTriangleStrip(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => 'ImageDrawTriangleStrip($dst, points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.ImageDraw].
  String ImageDraw(
    ImageD dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  ) => 'ImageDraw($dst, $src, $srcRec, $dstRec, $tint)';

  /// Label for [RaylibCoreDart.ImageDrawText].
  String ImageDrawText(
    ImageD dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => 'ImageDrawText($dst, $text, $posX, $posY, $fontSize, $color)';

  /// Label for [RaylibCoreDart.ImageDrawTextEx].
  String ImageDrawTextEx(
    ImageD dst,
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'ImageDrawTextEx($dst, $font, $text, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreDart.LoadTexture].
  String LoadTexture(
    String fileName,
  ) => 'LoadTexture($fileName)';

  /// Label for [RaylibCoreDart.LoadTextureFromImage].
  String LoadTextureFromImage(
    ImageD image,
  ) => 'LoadTextureFromImage($image)';

  /// Label for [RaylibCoreDart.LoadTextureCubemap].
  String LoadTextureCubemap(
    ImageD image,
    CubemapLayout layout,
  ) => 'LoadTextureCubemap($image, $layout)';

  /// Label for [RaylibCoreDart.LoadRenderTexture].
  String LoadRenderTexture(
    num width,
    num height,
  ) => 'LoadRenderTexture($width, $height)';

  /// Label for [RaylibCoreDart.IsTextureValid].
  String IsTextureValid(
    TextureD texture,
  ) => 'IsTextureValid($texture)';

  /// Label for [RaylibCoreDart.UnloadTexture].
  String UnloadTexture(
    TextureD texture,
  ) => 'UnloadTexture($texture)';

  /// Label for [RaylibCoreDart.IsRenderTextureValid].
  String IsRenderTextureValid(
    RenderTextureD target,
  ) => 'IsRenderTextureValid($target)';

  /// Label for [RaylibCoreDart.UnloadRenderTexture].
  String UnloadRenderTexture(
    RenderTextureD target,
  ) => 'UnloadRenderTexture($target)';

  /// Label for [RaylibCoreDart.UpdateTexture].
  String UpdateTexture(
    TextureD texture,
    Uint8List pixels,
  ) => 'UpdateTexture($texture, pixels: ${pixels.length})';
    
  /// Label for [RaylibCoreDart.UpdateTextureRec].
  String UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    Uint8List pixels,
  ) => 'UpdateTextureRec($texture, $rec, pixels: ${pixels.length})';

  /// Label for [RaylibCoreDart.GenTextureMipmaps].
  String GenTextureMipmaps(
    TextureD texture,
  ) => 'GenTextureMipmaps($texture)';

  /// Label for [RaylibCoreDart.SetTextureFilter].
  String SetTextureFilter(
    TextureD texture,
    TextureFilter filter,
  ) => 'SetTextureFilter($texture, $filter)';

  /// Label for [RaylibCoreDart.SetTextureWrap].
  String SetTextureWrap(
    TextureD texture,
    TextureWrap wrap,
  ) => 'SetTextureWrap($texture, $wrap)';

  /// Label for [RaylibCoreDart.DrawTexture].
  String DrawTexture(
    TextureD texture,
    num posX,
    num posY,
    ColorD tint,
  ) => 'DrawTexture($texture, $posX, $posY, $tint)';

  /// Label for [RaylibCoreDart.DrawTextureV].
  String DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  ) => 'DrawTextureV($texture, $position, $tint)';
    
  /// Label for [RaylibCoreDart.DrawTextureEx].
  String DrawTextureEx(
    TextureD texture,
    Vector2D position,
    num rotation,
    num scale,
    ColorD tint,
  ) => 'DrawTextureEx($texture, $position, $rotation, $scale, $tint)';

  /// Label for [RaylibCoreDart.DrawTextureRec].
  String DrawTextureRec(
    TextureD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  ) => 'DrawTextureRec($texture, $source, $position, $tint)';

  /// Label for [RaylibCoreDart.DrawTexturePro].
  String DrawTexturePro(
    TextureD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => 'DrawTexturePro($texture, $source, $dest, $origin, $rotation, $tint)';

  /// Label for [RaylibCoreDart.DrawTextureNPatch].
  String DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => 'DrawTextureNPatch($texture, $nPatchInfo, $dest, $origin, $rotation, $tint)';

  /// Label for [RaylibCoreDart.ColorIsEqual].
  String ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => 'ColorIsEqual($col1, $col2)';

  /// Label for [RaylibCoreDart.Fade].
  String Fade(
    ColorD color,
    num alpha,
  ) => 'Fade($color, $alpha)';

  /// Label for [RaylibCoreDart.ColorToInt].
  String ColorToInt(
    ColorD color,
  ) => 'ColorToInt($color)';

  /// Label for [RaylibCoreDart.ColorNormalize].
  String ColorNormalize(
    ColorD color,
  ) => 'ColorNormalize($color)';

  /// Label for [RaylibCoreDart.ColorFromNormalized].
  String ColorFromNormalized(
    Vector4D normalized,
  ) => 'ColorFromNormalized($normalized)';

  /// Label for [RaylibCoreDart.ColorToHSV].
  String ColorToHSV(
    ColorD color,
  ) => 'ColorToHSV($color)';

  /// Label for [RaylibCoreDart.ColorFromHSV].
  String ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => 'ColorFromHSV($hue, $saturation, $value)';

  /// Label for [RaylibCoreDart.ColorTint].
  String ColorTint(
    ColorD color,
    ColorD tint,
  ) => 'ColorTint($color, $tint)';

  /// Label for [RaylibCoreDart.ColorBrightness].
  String ColorBrightness(
    ColorD color,
    num factor,
  ) => 'ColorBrightness($color, $factor)';

  /// Label for [RaylibCoreDart.ColorContrast].
  String ColorContrast(
    ColorD color,
    num contrast,
  ) => 'ColorContrast($color, $contrast)';

  /// Label for [RaylibCoreDart.ColorAlpha].
  String ColorAlpha(
    ColorD color,
    num alpha,
  ) => 'ColorAlpha($color, $alpha)';

  /// Label for [RaylibCoreDart.ColorAlphaBlend].
  String ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => 'ColorAlphaBlend($dst, $src, $tint)';

  /// Label for [RaylibCoreDart.ColorLerp].
  String ColorLerp(
    ColorD color1,
    ColorD color2,
    num factor,
  ) => 'ColorLerp($color1, $color2, $factor)';

  /// Label for [RaylibCoreDart.GetColor].
  String GetColor(
    num hexValue,
  ) => 'GetColor($hexValue)';

  /// Label for [RaylibCoreDart.GetPixelDataSize].
  String GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => 'GetPixelDataSize($width, $height, $format)';

  /// Label for [RaylibCoreDart.GetFontDefault].
  String GetFontDefault() => 'GetFontDefault()';

  /// Label for [RaylibCoreDart.LoadFont].
  String LoadFont(
    String fileName,
  ) => 'LoadFont($fileName)';
    
  /// Label for [RaylibCoreDart.LoadFontEx].
  String LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  ) => 'LoadFontEx($fileName, $fontSize, codepoints: ${codepointCount ?? codepoints?.length})';

  /// Label for [RaylibCoreDart.LoadFontFromImage].
  String LoadFontFromImage(
    ImageD image,
    ColorD key,
    num firstChar,
  ) => 'LoadFontFromImage($image, $key, $firstChar)';

  /// Label for [RaylibCoreDart.LoadFontFromMemory].
  String LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => 'LoadFontFromMemory($fileType, fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints.length})';

  /// Label for [RaylibCoreDart.IsFontValid].
  String IsFontValid(
    FontD font,
  ) => 'IsFontValid($font)';

  /// Label for [RaylibCoreDart.LoadFontData].
  String LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => 'LoadFontData(fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints?.length}, $type)';

  /// Label for [RaylibCoreDart.GenImageFontAtlas].
  String GenImageFontAtlas(
    List<GlyphInfoD> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => 'GenImageFontAtlas(glyphs: ${glyphs.length}, $fontSize, $padding, $packMethod)';

  /// Label for [RaylibCoreDart.UnloadFontData].
  String UnloadFontData(
    List<GlyphInfoD> glyphs,
  ) => 'UnloadFontData(glyphs: ${glyphs.length})';
    
  /// Label for [RaylibCoreDart.UnloadFont].
  String UnloadFont(
    FontD font,
  ) => 'UnloadFont($font)';

  /// Label for [RaylibCoreDart.ExportFontAsCode].
  String ExportFontAsCode(
    FontD font,
    String fileName,
  ) => 'ExportFontAsCode($font, $fileName)';

  /// Label for [RaylibCoreDart.DrawFPS].
  String DrawFPS(
    num posX,
    num posY,
  ) => 'DrawFPS($posX, $posY)';

  /// Label for [RaylibCoreDart.DrawText].
  String DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => 'DrawText($text, $posX, $posY, $fontSize, $color)';

  /// Label for [RaylibCoreDart.DrawTextEx].
  String DrawTextEx(
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'DrawTextEx($font, $text, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreDart.DrawTextPro].
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
    
  /// Label for [RaylibCoreDart.DrawTextCodepoint].
  String DrawTextCodepoint(
    FontD font,
    num codepoint,
    Vector2D position,
    num fontSize,
    ColorD tint,
  ) => 'DrawTextCodepoint($font, $codepoint, $position, $fontSize, $tint)';

  /// Label for [RaylibCoreDart.DrawTextCodepoints].
  String DrawTextCodepoints(
    FontD font,
    Int32List codepoints,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => 'DrawTextCodepoints($font, codepoints: ${codepoints.length}, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreDart.SetTextLineSpacing].
  String SetTextLineSpacing(
    num spacing,
  ) => 'SetTextLineSpacing($spacing)';

  /// Label for [RaylibCoreDart.MeasureText].
  String MeasureText(
    String text,
    num fontSize,
  ) => 'MeasureText($text, $fontSize)';
    
  /// Label for [RaylibCoreDart.MeasureTextEx].
  String MeasureTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
  ) => 'MeasureTextEx($font, $text, $fontSize, $spacing)';

  /// Label for [RaylibCoreDart.MeasureTextCodepoints].
  String MeasureTextCodepoints(
    FontD font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  ) => 'MeasureTextCodepoints($font, ${codepoints.length}, $fontSize, $spacing)';

  /// Label for [RaylibCoreDart.GetGlyphIndex].
  String GetGlyphIndex(
    FontD font,
    num codepoint,
  ) => 'GetGlyphIndex($font, $codepoint)';

  /// Label for [RaylibCoreDart.GetGlyphInfo].
  String GetGlyphInfo(
    FontD font,
    num codepoint,
  ) => 'GetGlyphInfo($font, $codepoint)';

  /// Label for [RaylibCoreDart.GetGlyphAtlasRec].
  String GetGlyphAtlasRec(
    FontD font,
    num codepoint,
  ) => 'GetGlyphAtlasRec($font, $codepoint)';
    
  /// Label for [RaylibCoreDart.LoadUTF8].
  String LoadUTF8(
    Int32List codepoints,
  ) => 'LoadUTF8(codepoints: ${codepoints.length})';

  /// Label for [RaylibCoreDart.LoadCodepoints].
  String LoadCodepoints(
    String text,
  ) => 'LoadCodepoints($text)';

  /// Label for [RaylibCoreDart.GetCodepointCount].
  String GetCodepointCount(
    String text,
  ) => 'GetCodepointCount($text)';

  /// Label for [RaylibCoreDart.GetCodepoint].
  String GetCodepoint(
    String text,
  ) => 'GetCodepoint($text)';

  /// Label for [RaylibCoreDart.GetCodepointNext].
  String GetCodepointNext(
    String text,
  ) => 'GetCodepointNext($text)';

  /// Label for [RaylibCoreDart.GetCodepointPrevious].
  String GetCodepointPrevious(
    String text,
  ) => 'GetCodepointPrevious($text)';

  /// Label for [RaylibCoreDart.CodepointToUTF8].
  String CodepointToUTF8(
    num codepoint,
  ) => 'CodepointToUTF8($codepoint)';

  /// Label for [RaylibCoreDart.LoadTextLines].
  String LoadTextLines(
    String text,
  ) => 'LoadTextLines($text)';
  
  /// Label for [RaylibCoreDart.TextIsEqual].
  String TextIsEqual(
    String text1,
    String text2,
  ) => 'TextIsEqual($text1, $text2)';

  /// Label for [RaylibCoreDart.TextLength].
  String TextLength(
    String text,
  ) => 'TextLength($text)';

  /// Label for [RaylibCoreDart.TextFormat].
  String TextFormat(
    String text, [
      List<Object?> args = const [],
    ]
  ) => 'TextFormat($text, $args)';

  /// Label for [RaylibCoreDart.TextSubtext].
  String TextSubtext(
    String text,
    int position,
    int length,
  ) => 'TextSubtext($text, $position, $length)';

  /// Label for [RaylibCoreDart.TextRemoveSpaces].
  String TextRemoveSpaces(
    String text,
  ) => 'TextRemoveSpaces($text)';

  /// Label for [RaylibCoreDart.GetTextBetween].
  String GetTextBetween(
    String text,
    String begin,
    String end,
  ) => 'GetTextBetween($text, $begin, $end)';

  /// Label for [RaylibCoreDart.TextReplace].
  String TextReplace(
    String text,
    String search,
    String replacement,
  ) => 'TextReplace($text, $search, $replacement)';

  /// Label for [RaylibCoreDart.TextReplaceBetween].
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  ) => 'TextReplaceBetween($text, $begin, $end, $replacement)';

  /// Label for [RaylibCoreDart.TextInsert].
  String TextInsert(
    String text,
    String insert,
    int position,
  ) => 'TextInsert($text, $insert, $position)';

  /// Label for [RaylibCoreDart.TextJoin].
  String TextJoin(
    List<String> textList,
    String delimiter,
  ) => 'TextJoin(textList: ${textList.length}, $delimiter)';

  /// Label for [RaylibCoreDart.TextSplit].
  String TextSplit(
    String text,
    String delimiter,
  ) => 'TextSplit($text, $delimiter)';

  /// Label for [RaylibCoreDart.TextAppend].
  String TextAppend(
    String text,
    String append,
  ) => 'TextAppend($text, $append)';

  /// Label for [RaylibCoreDart.TextFindIndex].
  String TextFindIndex(
    String text,
    String search,
  ) => 'TextFindIndex($text, $search)';

  /// Label for [RaylibCoreDart.TextToUpper].
  String TextToUpper(
    String text,
  ) => 'TextToUpper($text)';
  
  /// Label for [RaylibCoreDart.TextToLower].
  String TextToLower(
    String text,
  ) => 'TextToLower($text)';
  
  /// Label for [RaylibCoreDart.TextToPascal].
  String TextToPascal(
    String text,
  ) => 'TextToPascal($text)';
  
  /// Label for [RaylibCoreDart.TextToSnake].
  String TextToSnake(
    String text,
  ) => 'TextToSnake($text)';
  
  /// Label for [RaylibCoreDart.TextToCamel].
  String TextToCamel(
    String text,
  ) => 'TextToCamel($text)';

  /// Label for [RaylibCoreDart.TextToInteger].
  String TextToInteger(
    String text,
  ) => 'TextToInteger($text)';
  
  /// Label for [RaylibCoreDart.TextToFloat].
  String TextToFloat(
    String text,
  ) => 'TextToFloat($text)';
    
  /// Label for [RaylibCoreDart.DrawLine3D].
  String DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => 'DrawLine3D($startPos, $endPos, $color)';
    
  /// Label for [RaylibCoreDart.DrawPoint3D].
  String DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => 'DrawPoint3D($position, $color)';
    
  /// Label for [RaylibCoreDart.DrawCircle3D].
  String DrawCircle3D(
    Vector3D center,
    num radius,
    Vector3D rotationAxis,
    num rotationAngle,
    ColorD color,
  ) => 'DrawCircle3D($center, $radius, $rotationAxis, $rotationAngle, $color)';
    
  /// Label for [RaylibCoreDart.DrawTriangle3D].
  String DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  ) => 'DrawTriangle3D($v1, $v2, $v3, $color)';
    
  /// Label for [RaylibCoreDart.DrawTriangleStrip3D].
  String DrawTriangleStrip3D(
    List<Vector3D> points,
    ColorD color,
  ) => 'DrawTriangleStrip3D(points: ${points.length}, $color)';
    
  /// Label for [RaylibCoreDart.DrawCube].
  String DrawCube(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => 'DrawCube($position, $width, $height, $length, $color)';
    
  /// Label for [RaylibCoreDart.DrawCubeV].
  String DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => 'DrawCubeV($position, $size, $color)';
    
  /// Label for [RaylibCoreDart.DrawCubeWires].
  String DrawCubeWires(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => 'DrawCubeWires($position, $width, $height, $length, $color)';
    
  /// Label for [RaylibCoreDart.DrawCubeWiresV].
  String DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => 'DrawCubeWiresV($position, $size, $color)';
    
  /// Label for [RaylibCoreDart.DrawSphere].
  String DrawSphere(
    Vector3D centerPos,
    num radius,
    ColorD color,
  ) => 'DrawSphere($centerPos, $radius, $color)';
    
  /// Label for [RaylibCoreDart.DrawSphereEx].
  String DrawSphereEx(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => 'DrawSphereEx($centerPos, $radius, $rings, $slices, $color)';
    
  /// Label for [RaylibCoreDart.DrawSphereWires].
  String DrawSphereWires(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => 'DrawSphereWires($centerPos, $radius, $rings, $slices, $color)';
    
  /// Label for [RaylibCoreDart.DrawCylinder].
  String DrawCylinder(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => 'DrawCylinder($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  /// Label for [RaylibCoreDart.DrawCylinderEx].
  String DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => 'DrawCylinderEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  /// Label for [RaylibCoreDart.DrawCylinderWires].
  String DrawCylinderWires(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => 'DrawCylinderWires($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  /// Label for [RaylibCoreDart.DrawCylinderWiresEx].
  String DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => 'DrawCylinderWiresEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  /// Label for [RaylibCoreDart.DrawCapsule].
  String DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => 'DrawCapsule($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  /// Label for [RaylibCoreDart.DrawCapsuleWires].
  String DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => 'DrawCapsuleWires($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  /// Label for [RaylibCoreDart.DrawPlane].
  String DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => 'DrawPlane($centerPos, $size, $color)';
    
  /// Label for [RaylibCoreDart.DrawRay].
  String DrawRay(
    RayD ray,
    ColorD color,
  ) => 'DrawRay($ray, $color)';
    
  /// Label for [RaylibCoreDart.DrawGrid].
  String DrawGrid(
    num slices,
    num spacing,
  ) => 'DrawGrid($slices, $spacing)';
    
  /// Label for [RaylibCoreDart.LoadModel].
  String LoadModel(
    String fileName,
  ) => 'LoadModel($fileName)';
    
  /// Label for [RaylibCoreDart.LoadModelFromMesh].
  String LoadModelFromMesh(
    MeshD mesh,
  ) => 'LoadModelFromMesh($mesh)';
    
  /// Label for [RaylibCoreDart.IsModelValid].
  String IsModelValid(
    ModelD model,
  ) => 'IsModelValid($model)';
    
  /// Label for [RaylibCoreDart.UnloadModel].
  String UnloadModel(
    ModelD model,
  ) => 'UnloadModel($model)';
    
  /// Label for [RaylibCoreDart.GetModelBoundingBox].
  String GetModelBoundingBox(
    ModelD model,
  ) => 'GetModelBoundingBox($model)';
    
  /// Label for [RaylibCoreDart.DrawModel].
  String DrawModel(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint
  ) => 'DrawModel($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreDart.DrawModelEx].
  String DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => 'DrawModelEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreDart.DrawModelWires].
  String DrawModelWires(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => 'DrawModelWires($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreDart.DrawModelWiresEx].
  String DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => 'DrawModelWiresEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreDart.DrawBoundingBox].
  String DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => 'DrawBoundingBox($box, $color)';

  /// Label for [RaylibCoreDart.DrawBillboard].
  String DrawBillboard(
    Camera3DD camera,
    TextureD texture,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => 'DrawBillboard($camera, $texture, $position, $scale, $tint)';

  /// Label for [RaylibCoreDart.DrawBillboardRec].
  String DrawBillboardRec(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  ) => 'DrawBillboardRec($camera, $texture, $source, $position, $size, $tint)';

  /// Label for [RaylibCoreDart.DrawBillboardPro].
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
  
  /// Label for [RaylibCoreDart.UploadMesh].
  String UploadMesh(
    MeshD mesh,
    bool dynamic,
  ) => 'UploadMesh($mesh, $dynamic)';
    
  /// Label for [RaylibCoreDart.UpdateMeshBuffer].
  String UpdateMeshBuffer(
    MeshD mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => 'UpdateMeshBuffer($mesh, $index, data: ${data.length}, $offset)';
    
  /// Label for [RaylibCoreDart.UnloadMesh].
  String UnloadMesh(
    MeshD mesh,
  ) => 'UnloadMesh($mesh)';
    
  /// Label for [RaylibCoreDart.DrawMesh].
  String DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => 'DrawMesh($mesh, $material, transform: $transform)';
    
  /// Label for [RaylibCoreDart.DrawMeshInstanced].
  String DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    List<MatrixD> transforms,
  ) => 'DrawMeshInstanced($mesh, $material, transforms: ${transforms.length})';
    
  /// Label for [RaylibCoreDart.GetMeshBoundingBox].
  String GetMeshBoundingBox(
    MeshD mesh,
  ) => 'GetMeshBoundingBox($mesh)';
    
  /// Label for [RaylibCoreDart.GenMeshTangents].
  String GenMeshTangents(
    MeshD mesh,
  ) => 'GenMeshTangents($mesh)';
    
  /// Label for [RaylibCoreDart.ExportMesh].
  String ExportMesh(
    MeshD mesh,
    String fileName,
  ) => 'ExportMesh($mesh, $fileName)';
    
  /// Label for [RaylibCoreDart.ExportMeshAsCode].
  String ExportMeshAsCode(
    MeshD mesh,
    String fileName,
  ) => 'ExportMeshAsCode($mesh, $fileName)';
    
  /// Label for [RaylibCoreDart.GenMeshPoly].
  String GenMeshPoly(
    num sides,
    num radius,
  ) => 'GenMeshPoly($sides, $radius)';
    
  /// Label for [RaylibCoreDart.GenMeshPlane].
  String GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => 'GenMeshPlane($width, $length, $resX, $resZ)';
    
  /// Label for [RaylibCoreDart.GenMeshCube].
  String GenMeshCube(
    num width,
    num height,
    num length,
  ) => 'GenMeshCube($width, $height, $length)';
    
  /// Label for [RaylibCoreDart.GenMeshSphere].
  String GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshSphere($radius, $rings, $slices)';
    
  /// Label for [RaylibCoreDart.GenMeshHemiSphere].
  String GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshHemiSphere($radius, $rings, $slices)';
    
  /// Label for [RaylibCoreDart.GenMeshCylinder].
  String GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCylinder($radius, $height, $slices)';
    
  /// Label for [RaylibCoreDart.GenMeshCone].
  String GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCone($radius, $height, $slices)';
    
  /// Label for [RaylibCoreDart.GenMeshTorus].
  String GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshTorus($radius, $size, $radSeg, $sides)';
    
  /// Label for [RaylibCoreDart.GenMeshKnot].
  String GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshKnot($radius, $size, $radSeg, $sides)';
    
  /// Label for [RaylibCoreDart.GenMeshHeightmap].
  String GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  ) => 'GenMeshHeightmap($heightmap, $size)';
    
  /// Label for [RaylibCoreDart.GenMeshCubicmap].
  String GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => 'GenMeshCubicmap($cubicmap, $cubeSize)';
    
  /// Label for [RaylibCoreDart.LoadMaterials].
  String LoadMaterials(
    String fileName,
  ) => 'LoadMaterials($fileName)';
    
  /// Label for [RaylibCoreDart.LoadMaterialDefault].
  String LoadMaterialDefault() => 'LoadMaterialDefault()';
    
  /// Label for [RaylibCoreDart.IsMaterialValid].
  String IsMaterialValid(
    MaterialD material,
  ) => 'IsMaterialValid($material)';
    
  /// Label for [RaylibCoreDart.UnloadMaterial].
  String UnloadMaterial(
    MaterialD material,
  ) => 'UnloadMaterial($material)';
    
  /// Label for [RaylibCoreDart.SetMaterialTexture].
  String SetMaterialTexture(
    MaterialD material,
    MaterialMapIndex mapType,
    TextureD texture,
  ) => 'SetMaterialTexture($material, ${mapType.name}, $texture)';
    
  /// Label for [RaylibCoreDart.SetModelMeshMaterial].
  String SetModelMeshMaterial(
    ModelD model,
    num meshId,
    num materialId,
  ) => 'SetModelMeshMaterial($model, $meshId, $materialId)';
    
  /// Label for [RaylibCoreDart.LoadModelAnimations].
  String LoadModelAnimations(
    String fileName,
  ) => 'LoadModelAnimations($fileName)';
    
  /// Label for [RaylibCoreDart.UpdateModelAnimation].
  String UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => 'UpdateModelAnimation($model, $anim, $frame)';

  /// Label for [RaylibCoreDart.UpdateModelAnimationEx].
  String UpdateModelAnimationEx(
    ModelD model,
    ModelAnimationD animA,
    num frameA,
    ModelAnimationD animB,
    num frameB,
    num blend,
  ) => 'UpdateModelAnimationEx($model, $animA, $frameA, $animB, $frameB, $blend)';
    
  /// Label for [RaylibCoreDart.UnloadModelAnimations].
  String UnloadModelAnimations(
    List<ModelAnimationD> animations,
  ) => 'UnloadModelAnimations(animations: ${animations.length})';
    
  /// Label for [RaylibCoreDart.IsModelAnimationValid].
  String IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => 'IsModelAnimationValid($model, $anim)';
    
  /// Label for [RaylibCoreDart.CheckCollisionSpheres].
  String CheckCollisionSpheres(
    Vector3D center1,
    num radius1,
    Vector3D center2,
    num radius2,
  ) => 'CheckCollisionSpheres($center1, $radius1, $center2, $radius2)';
    
  /// Label for [RaylibCoreDart.CheckCollisionBoxes].
  String CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => 'CheckCollisionBoxes($box1, $box2)';
    
  /// Label for [RaylibCoreDart.CheckCollisionBoxSphere].
  String CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    num radius,
  ) => 'CheckCollisionBoxSphere($box, $center, $radius)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionSphere].
  String GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    num radius,
  ) => 'GetRayCollisionSphere($ray, $center, $radius)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionBox].
  String GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => 'GetRayCollisionBox($ray, $box)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionMesh].
  String GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => 'GetRayCollisionMesh($ray, $mesh, $transform)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionTriangle].
  String GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => 'GetRayCollisionTriangle($ray, $p1, $p2, $p3)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionQuad].
  String GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  ) => 'GetRayCollisionQuad($ray, $p1, $p2, $p3, $p4)';
  
}
