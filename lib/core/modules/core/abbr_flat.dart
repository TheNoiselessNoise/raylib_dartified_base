import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibCoreFlat get _module => RaylibBase.instance.module();

/// See [RaylibCoreFlat.InitWindow].
void InitWindow(
  int width,
  int height,
  MemoryPointer<RChar> title,
) => _module.InitWindow(width, height, title);

/// See [RaylibCoreFlat.CloseWindow].
void CloseWindow() => _module.CloseWindow();

/// See [RaylibCoreFlat.WindowShouldClose].
bool WindowShouldClose() => _module.WindowShouldClose();

/// See [RaylibCoreFlat.IsWindowReady].
bool IsWindowReady() => _module.IsWindowReady();

/// See [RaylibCoreFlat.IsWindowFullscreen].
bool IsWindowFullscreen() => _module.IsWindowFullscreen();

/// See [RaylibCoreFlat.IsWindowHidden].
bool IsWindowHidden() => _module.IsWindowHidden();

/// See [RaylibCoreFlat.IsWindowMinimized].
bool IsWindowMinimized() => _module.IsWindowMinimized();

/// See [RaylibCoreFlat.IsWindowMaximized].
bool IsWindowMaximized() => _module.IsWindowMaximized();

/// See [RaylibCoreFlat.IsWindowFocused].
bool IsWindowFocused() => _module.IsWindowFocused();

/// See [RaylibCoreFlat.IsWindowResized].
bool IsWindowResized() => _module.IsWindowResized();

/// See [RaylibCoreFlat.IsWindowState].
bool IsWindowState(
  int flag,
) => _module.IsWindowState(flag);

/// See [RaylibCoreFlat.SetWindowState].
void SetWindowState(
  int flags,
) => _module.SetWindowState(flags);

/// See [RaylibCoreFlat.ClearWindowState].
void ClearWindowState(
  int flags,
) => _module.ClearWindowState(flags);

/// See [RaylibCoreFlat.ToggleFullscreen].
void ToggleFullscreen() => _module.ToggleFullscreen();

/// See [RaylibCoreFlat.ToggleBorderlessWindowed].
void ToggleBorderlessWindowed() => _module.ToggleBorderlessWindowed();

/// See [RaylibCoreFlat.MaximizeWindow].
void MaximizeWindow() => _module.MaximizeWindow();

/// See [RaylibCoreFlat.MinimizeWindow].
void MinimizeWindow() => _module.MinimizeWindow();

/// See [RaylibCoreFlat.RestoreWindow].
void RestoreWindow() => _module.RestoreWindow();

/// See [RaylibCoreFlat.SetWindowIcon].
void SetWindowIcon(
  Image image,
) => _module.SetWindowIcon(image);

/// See [RaylibCoreFlat.SetWindowIcons].
void SetWindowIcons(
  StructPointer<Image> images,
  int count,
) => _module.SetWindowIcons(images, count);

/// See [RaylibCoreFlat.SetWindowTitle].
void SetWindowTitle(
  MemoryPointer<RChar> title,
) => _module.SetWindowTitle(title);

/// See [RaylibCoreFlat.SetWindowPosition].
void SetWindowPosition(
  int x,
  int y,
) => _module.SetWindowPosition(x, y);

/// See [RaylibCoreFlat.SetWindowMonitor].
void SetWindowMonitor(
  int monitor,
) => _module.SetWindowMonitor(monitor);

/// See [RaylibCoreFlat.SetWindowMinSize].
void SetWindowMinSize(
  int width,
  int height,
) => _module.SetWindowMinSize(width, height);

/// See [RaylibCoreFlat.SetWindowMaxSize].
void SetWindowMaxSize(
  int width,
  int height,
) => _module.SetWindowMaxSize(width, height);

/// See [RaylibCoreFlat.SetWindowSize].
void SetWindowSize(
  int width,
  int height,
) => _module.SetWindowSize(width, height);

/// See [RaylibCoreFlat.SetWindowOpacity].
void SetWindowOpacity(
  double opacity,
) => _module.SetWindowOpacity(opacity);

/// See [RaylibCoreFlat.SetWindowFocused].
void SetWindowFocused() => _module.SetWindowFocused();

/// See [RaylibCoreFlat.GetWindowHandle].
MemoryPointer<RVoid> GetWindowHandle() => _module.GetWindowHandle();

/// See [RaylibCoreFlat.GetScreenWidth].
int GetScreenWidth() => _module.GetScreenWidth();

/// See [RaylibCoreFlat.GetScreenHeight].
int GetScreenHeight() => _module.GetScreenHeight();

/// See [RaylibCoreFlat.GetRenderWidth].
int GetRenderWidth() => _module.GetRenderWidth();

/// See [RaylibCoreFlat.GetRenderHeight].
int GetRenderHeight() => _module.GetRenderHeight();

/// See [RaylibCoreFlat.GetMonitorCount].
int GetMonitorCount() => _module.GetMonitorCount();

/// See [RaylibCoreFlat.GetCurrentMonitor].
int GetCurrentMonitor() => _module.GetCurrentMonitor();

/// See [RaylibCoreFlat.GetMonitorPosition].
Vector2 GetMonitorPosition(
  int monitor,
) => _module.GetMonitorPosition(monitor);

/// See [RaylibCoreFlat.GetMonitorWidth].
int GetMonitorWidth(
  int monitor,
) => _module.GetMonitorWidth(monitor);

/// See [RaylibCoreFlat.GetMonitorHeight].
int GetMonitorHeight(
  int monitor,
) => _module.GetMonitorHeight(monitor);

/// See [RaylibCoreFlat.GetMonitorPhysicalWidth].
int GetMonitorPhysicalWidth(
  int monitor,
) => _module.GetMonitorPhysicalWidth(monitor);

/// See [RaylibCoreFlat.GetMonitorPhysicalHeight].
int GetMonitorPhysicalHeight(
  int monitor,
) => _module.GetMonitorPhysicalHeight(monitor);

/// See [RaylibCoreFlat.GetMonitorRefreshRate].
int GetMonitorRefreshRate(
  int monitor,
) => _module.GetMonitorRefreshRate(monitor);

/// See [RaylibCoreFlat.GetWindowPosition].
Vector2 GetWindowPosition() => _module.GetWindowPosition();

/// See [RaylibCoreFlat.GetWindowScaleDPI].
Vector2 GetWindowScaleDPI() => _module.GetWindowScaleDPI();

/// See [RaylibCoreFlat.GetMonitorName].
MemoryPointer<RChar> GetMonitorName(
  int monitor,
) => _module.GetMonitorName(monitor);

/// See [RaylibCoreFlat.SetClipboardText].
void SetClipboardText(
  MemoryPointer<RChar> text,
) => _module.SetClipboardText(text);

/// See [RaylibCoreFlat.GetClipboardText].
MemoryPointer<RChar> GetClipboardText() => _module.GetClipboardText();

/// See [RaylibCoreFlat.GetClipboardImage].
Image GetClipboardImage() => _module.GetClipboardImage();

/// See [RaylibCoreFlat.EnableEventWaiting].
void EnableEventWaiting() => _module.EnableEventWaiting();

/// See [RaylibCoreFlat.DisableEventWaiting].
void DisableEventWaiting() => _module.DisableEventWaiting();

/// See [RaylibCoreFlat.ShowCursor].
void ShowCursor() => _module.ShowCursor();

/// See [RaylibCoreFlat.HideCursor].
void HideCursor() => _module.HideCursor();

/// See [RaylibCoreFlat.IsCursorHidden].
bool IsCursorHidden() => _module.IsCursorHidden();

/// See [RaylibCoreFlat.EnableCursor].
void EnableCursor() => _module.EnableCursor();

/// See [RaylibCoreFlat.DisableCursor].
void DisableCursor() => _module.DisableCursor();

/// See [RaylibCoreFlat.IsCursorOnScreen].
bool IsCursorOnScreen() => _module.IsCursorOnScreen();

/// See [RaylibCoreFlat.ClearBackground].
void ClearBackground(
  Color color,
) => _module.ClearBackground(color);

/// See [RaylibCoreFlat.BeginDrawing].
void BeginDrawing() => _module.BeginDrawing();

/// See [RaylibCoreFlat.EndDrawing].
void EndDrawing() => _module.EndDrawing();

/// See [RaylibCoreFlat.BeginMode2D].
void BeginMode2D(
  Camera2D camera,
) => _module.BeginMode2D(camera);

/// See [RaylibCoreFlat.EndMode2D].
void EndMode2D() => _module.EndMode2D();

/// See [RaylibCoreFlat.BeginMode3D].
void BeginMode3D(
  Camera3D camera,
) => _module.BeginMode3D(camera);

/// See [RaylibCoreFlat.EndMode3D].
void EndMode3D() => _module.EndMode3D();

/// See [RaylibCoreFlat.BeginTextureMode].
void BeginTextureMode(
  RenderTexture target,
) => _module.BeginTextureMode(target);

/// See [RaylibCoreFlat.EndTextureMode].
void EndTextureMode() => _module.EndTextureMode();

/// See [RaylibCoreFlat.BeginShaderMode].
void BeginShaderMode(
  Shader shader,
) => _module.BeginShaderMode(shader);

/// See [RaylibCoreFlat.EndShaderMode].
void EndShaderMode() => _module.EndShaderMode();

/// See [RaylibCoreFlat.BeginBlendMode].
void BeginBlendMode(
  int mode,
) => _module.BeginBlendMode(mode);

/// See [RaylibCoreFlat.EndBlendMode].
void EndBlendMode() => _module.EndBlendMode();

/// See [RaylibCoreFlat.BeginScissorMode].
void BeginScissorMode(
  int x,
  int y,
  int width,
  int height,
) => _module.BeginScissorMode(x, y, width, height);

/// See [RaylibCoreFlat.EndScissorMode].
void EndScissorMode() => _module.EndScissorMode();

/// See [RaylibCoreFlat.BeginVrStereoMode].
void BeginVrStereoMode(
  VrStereoConfig config,
) => _module.BeginVrStereoMode(config);

/// See [RaylibCoreFlat.EndVrStereoMode].
void EndVrStereoMode() => _module.EndVrStereoMode();

/// See [RaylibCoreFlat.LoadVrStereoConfig].
VrStereoConfig LoadVrStereoConfig(
  VrDeviceInfo device,
) => _module.LoadVrStereoConfig(device);

/// See [RaylibCoreFlat.UnloadVrStereoConfig].
void UnloadVrStereoConfig(
  VrStereoConfig config,
) => _module.UnloadVrStereoConfig(config);

/// See [RaylibCoreFlat.LoadShader].
Shader LoadShader(
  MemoryPointer<RChar> vsFileName,
  MemoryPointer<RChar> fsFileName,
) => _module.LoadShader(vsFileName, fsFileName);

/// See [RaylibCoreFlat.LoadShaderFromMemory].
Shader LoadShaderFromMemory(
  MemoryPointer<RChar> vsCode,
  MemoryPointer<RChar> fsCode,
) => _module.LoadShaderFromMemory(vsCode, fsCode);

/// See [RaylibCoreFlat.IsShaderValid].
bool IsShaderValid(
  Shader shader,
) => _module.IsShaderValid(shader);

/// See [RaylibCoreFlat.GetShaderLocation].
int GetShaderLocation(
  Shader shader,
  MemoryPointer<RChar> uniformName,
) => _module.GetShaderLocation(shader, uniformName);

/// See [RaylibCoreFlat.GetShaderLocationAttrib].
int GetShaderLocationAttrib(
  Shader shader,
  MemoryPointer<RChar> attribName,
) => _module.GetShaderLocationAttrib(shader, attribName);

/// See [RaylibCoreFlat.SetShaderValueV].
void SetShaderValueV(
  Shader shader,
  int locIndex,
  MemoryPointer<RVoid> value,
  int uniformType,
  int count,
) => _module.SetShaderValueV(shader, locIndex, value, uniformType, count);

/// See [RaylibCoreFlat.SetShaderValueMatrix].
void SetShaderValueMatrix(
  Shader shader,
  int locIndex,
  Matrix mat,
) => _module.SetShaderValueMatrix(shader, locIndex, mat);

/// See [RaylibCoreFlat.SetShaderValueTexture].
void SetShaderValueTexture(
  Shader shader,
  int locIndex,
  Texture texture,
) => _module.SetShaderValueTexture(shader, locIndex, texture);

/// See [RaylibCoreFlat.UnloadShader].
void UnloadShader(
  Shader shader,
) => _module.UnloadShader(shader);

/// See [RaylibCoreFlat.GetScreenToWorldRay].
Ray GetScreenToWorldRay(
  Vector2 position,
  Camera3D camera,
) => _module.GetScreenToWorldRay(position, camera);

/// See [RaylibCoreFlat.GetScreenToWorldRayEx].
Ray GetScreenToWorldRayEx(
  Vector2 position,
  Camera3D camera,
  int width,
  int height,
) => _module.GetScreenToWorldRayEx(position, camera, width, height);

/// See [RaylibCoreFlat.GetWorldToScreen].
Vector2 GetWorldToScreen(
  Vector3 position,
  Camera3D camera,
) => _module.GetWorldToScreen(position, camera);

/// See [RaylibCoreFlat.GetWorldToScreenEx].
Vector2 GetWorldToScreenEx(
  Vector3 position,
  Camera3D camera,
  int width,
  int height,
) => _module.GetWorldToScreenEx(position, camera, width, height);

/// See [RaylibCoreFlat.GetWorldToScreen2D].
Vector2 GetWorldToScreen2D(
  Vector2 position,
  Camera2D camera,
) => _module.GetWorldToScreen2D(position, camera);

/// See [RaylibCoreFlat.GetScreenToWorld2D].
Vector2 GetScreenToWorld2D(
  Vector2 position,
  Camera2D camera,
) => _module.GetScreenToWorld2D(position, camera);

/// See [RaylibCoreFlat.GetCameraMatrix].
Matrix GetCameraMatrix(
  Camera3D camera,
) => _module.GetCameraMatrix(camera);

/// See [RaylibCoreFlat.GetCameraMatrix2D].
Matrix GetCameraMatrix2D(
  Camera2D camera,
) => _module.GetCameraMatrix2D(camera);

/// See [RaylibCoreFlat.SetTargetFPS].
void SetTargetFPS(
  int fps,
) => _module.SetTargetFPS(fps);

/// See [RaylibCoreFlat.GetFrameTime].
double GetFrameTime() => _module.GetFrameTime();

/// See [RaylibCoreFlat.GetTime].
double GetTime() => _module.GetTime();

/// See [RaylibCoreFlat.GetFPS].
int GetFPS() => _module.GetFPS();

/// See [RaylibCoreFlat.SwapScreenBuffer].
void SwapScreenBuffer() => _module.SwapScreenBuffer();

/// See [RaylibCoreFlat.PollInputEvents].
void PollInputEvents() => _module.PollInputEvents();

/// See [RaylibCoreFlat.WaitTime].
void WaitTime(
  double seconds,
) => _module.WaitTime(seconds);

/// See [RaylibCoreFlat.SetRandomSeed].
void SetRandomSeed(
  int seed,
) => _module.SetRandomSeed(seed);

/// See [RaylibCoreFlat.GetRandomValue].
int GetRandomValue(
  int min,
  int max,
) => _module.GetRandomValue(min, max);

/// See [RaylibCoreFlat.LoadRandomSequence].
MemoryPointer<RInt> LoadRandomSequence(
  int count,
  int min,
  int max,
) => _module.LoadRandomSequence(count, min, max);

/// See [RaylibCoreFlat.UnloadRandomSequence].
void UnloadRandomSequence(
  MemoryPointer<RInt> sequence,
) => _module.UnloadRandomSequence(sequence);

/// See [RaylibCoreFlat.TakeScreenshot].
void TakeScreenshot(
  MemoryPointer<RChar> fileName,
) => _module.TakeScreenshot(fileName);

/// See [RaylibCoreFlat.SetConfigFlags].
void SetConfigFlags(
  int flags,
) => _module.SetConfigFlags(flags);

/// See [RaylibCoreFlat.OpenURL].
void OpenURL(
  MemoryPointer<RChar> url,
) => _module.OpenURL(url);

/// See [RaylibCoreFlat.TraceLog].
void TraceLog(
  int logLevel,
  MemoryPointer<RChar> text,
  // NOTE: missing va_list argument
) => _module.TraceLog(logLevel, text);

/// See [RaylibCoreFlat.SetTraceLogLevel].
void SetTraceLogLevel(
  int logLevel,
) => _module.SetTraceLogLevel(logLevel);

/// See [RaylibCoreFlat.SetTraceLogCallback].
void SetTraceLogCallback(
  MemoryPointer<RFunction<TraceLogCallbackBase>> callback,
) => _module.SetTraceLogCallback(callback);

/// See [RaylibCoreFlat.SetLoadFileDataCallback].
void SetLoadFileDataCallback(
  MemoryPointer<RFunction<LoadFileDataCallbackBase>> callback,
) => _module.SetLoadFileDataCallback(callback);

/// See [RaylibCoreFlat.SetSaveFileDataCallback].
void SetSaveFileDataCallback(
  MemoryPointer<RFunction<SaveFileDataCallbackBase>> callback,
) => _module.SetSaveFileDataCallback(callback);

/// See [RaylibCoreFlat.SetLoadFileTextCallback].
void SetLoadFileTextCallback(
  MemoryPointer<RFunction<LoadFileTextCallbackBase>> callback,
) => _module.SetLoadFileTextCallback(callback);

/// See [RaylibCoreFlat.SetSaveFileTextCallback].
void SetSaveFileTextCallback(
  MemoryPointer<RFunction<SaveFileTextCallbackBase>> callback,
) => _module.SetSaveFileTextCallback(callback);

/// See [RaylibCoreFlat.LoadFileData].
MemoryPointer<RUnsignedChar> LoadFileData(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RInt> dataSize,
) => _module.LoadFileData(fileName, dataSize);

/// See [RaylibCoreFlat.UnloadFileData].
void UnloadFileData(
  MemoryPointer<RUnsignedChar> data,
) => _module.UnloadFileData(data);

/// See [RaylibCoreFlat.SaveFileData].
bool SaveFileData(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RVoid> data,
  int dataSize,
) => _module.SaveFileData(fileName, data, dataSize);

/// See [RaylibCoreFlat.ExportDataAsCode].
bool ExportDataAsCode(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
  MemoryPointer<RChar> fileName,
) => _module.ExportDataAsCode(data, dataSize, fileName);

/// See [RaylibCoreFlat.LoadFileText].
MemoryPointer<RChar> LoadFileText(
  MemoryPointer<RChar> fileName,
) => _module.LoadFileText(fileName);

/// See [RaylibCoreFlat.UnloadFileText].
void UnloadFileText(
  MemoryPointer<RChar> text,
) => _module.UnloadFileText(text);

/// See [RaylibCoreFlat.SaveFileText].
bool SaveFileText(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> text,
) => _module.SaveFileText(fileName, text);

/// See [RaylibCoreFlat.FileRename].
int FileRename(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> fileRename,
) => _module.FileRename(fileName, fileRename);

/// See [RaylibCoreFlat.FileRemove].
int FileRemove(
  MemoryPointer<RChar> fileName,
) => _module.FileRemove(fileName);

/// See [RaylibCoreFlat.FileCopy].
int FileCopy(
  MemoryPointer<RChar> srcPath,
  MemoryPointer<RChar> dstPath,
) => _module.FileCopy(srcPath, dstPath);

/// See [RaylibCoreFlat.FileMove].
int FileMove(
  MemoryPointer<RChar> srcPath,
  MemoryPointer<RChar> dstPath,
) => _module.FileMove(srcPath, dstPath);

/// See [RaylibCoreFlat.FileTextReplace].
int FileTextReplace(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> search,
  MemoryPointer<RChar> replacement,
) => _module.FileTextReplace(fileName, search, replacement);

/// See [RaylibCoreFlat.FileTextFindIndex].
int FileTextFindIndex(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> search,
) => _module.FileTextFindIndex(fileName, search);

/// See [RaylibCoreFlat.FileExists].
bool FileExists(
  MemoryPointer<RChar> fileName,
) => _module.FileExists(fileName);

/// See [RaylibCoreFlat.DirectoryExists].
bool DirectoryExists(
  MemoryPointer<RChar> dirPath,
) => _module.DirectoryExists(dirPath);

/// See [RaylibCoreFlat.IsFileExtension].
bool IsFileExtension(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> ext,
) => _module.IsFileExtension(fileName, ext);

/// See [RaylibCoreFlat.GetFileLength].
int GetFileLength(
  MemoryPointer<RChar> fileName,
) => _module.GetFileLength(fileName);

/// See [RaylibCoreFlat.GetFileExtension].
MemoryPointer<RChar> GetFileExtension(
  MemoryPointer<RChar> fileName,
) => _module.GetFileExtension(fileName);

/// See [RaylibCoreFlat.GetFileName].
MemoryPointer<RChar> GetFileName(
  MemoryPointer<RChar> filePath,
) => _module.GetFileName(filePath);

/// See [RaylibCoreFlat.GetFileNameWithoutExt].
MemoryPointer<RChar> GetFileNameWithoutExt(
  MemoryPointer<RChar> filePath,
) => _module.GetFileNameWithoutExt(filePath);

/// See [RaylibCoreFlat.GetDirectoryFileCount].
int GetDirectoryFileCount(
  MemoryPointer<RChar> dirPath,
) => _module.GetDirectoryFileCount(dirPath);

/// See [RaylibCoreFlat.GetDirectoryFileCountEx].
int GetDirectoryFileCountEx(
  MemoryPointer<RChar> basePath,
  MemoryPointer<RChar> filter,
  bool scanSubdirs,
) => _module.GetDirectoryFileCountEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreFlat.GetDirectoryPath].
MemoryPointer<RChar> GetDirectoryPath(
  MemoryPointer<RChar> filePath,
) => _module.GetDirectoryPath(filePath);

/// See [RaylibCoreFlat.GetPrevDirectoryPath].
MemoryPointer<RChar> GetPrevDirectoryPath(
  MemoryPointer<RChar> dirPath,
) => _module.GetPrevDirectoryPath(dirPath);

/// See [RaylibCoreFlat.GetWorkingDirectory].
MemoryPointer<RChar> GetWorkingDirectory() => _module.GetWorkingDirectory();

/// See [RaylibCoreFlat.GetApplicationDirectory].
MemoryPointer<RChar> GetApplicationDirectory() => _module.GetApplicationDirectory();

/// See [RaylibCoreFlat.MakeDirectory].
int MakeDirectory(
  MemoryPointer<RChar> dirPath,
) => _module.MakeDirectory(dirPath);

/// See [RaylibCoreFlat.ChangeDirectory].
bool ChangeDirectory(
  MemoryPointer<RChar> dir,
) => _module.ChangeDirectory(dir);

/// See [RaylibCoreFlat.IsPathFile].
bool IsPathFile(
  MemoryPointer<RChar> path,
) => _module.IsPathFile(path);

/// See [RaylibCoreFlat.IsFileNameValid].
bool IsFileNameValid(
  MemoryPointer<RChar> fileName,
) => _module.IsFileNameValid(fileName);

/// See [RaylibCoreFlat.LoadDirectoryFiles].
FilePathList LoadDirectoryFiles(
  MemoryPointer<RChar> dirPath,
) => _module.LoadDirectoryFiles(dirPath);

/// See [RaylibCoreFlat.LoadDirectoryFilesEx].
FilePathList LoadDirectoryFilesEx(
  MemoryPointer<RChar> basePath,
  MemoryPointer<RChar> filter,
  bool scanSubdirs,
) => _module.LoadDirectoryFilesEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreFlat.UnloadDirectoryFiles].
void UnloadDirectoryFiles(
  FilePathList files,
) => _module.UnloadDirectoryFiles(files);

/// See [RaylibCoreFlat.IsFileDropped].
bool IsFileDropped() => _module.IsFileDropped();

/// See [RaylibCoreFlat.LoadDroppedFiles].
FilePathList LoadDroppedFiles() => _module.LoadDroppedFiles();

/// See [RaylibCoreFlat.UnloadDroppedFiles].
void UnloadDroppedFiles(
  FilePathList files,
) => _module.UnloadDroppedFiles(files);

/// See [RaylibCoreFlat.GetFileModTime].
int GetFileModTime(
  MemoryPointer<RChar> fileName,
) => _module.GetFileModTime(fileName);

/// See [RaylibCoreFlat.CompressData].
MemoryPointer<RUnsignedChar> CompressData(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
  MemoryPointer<RInt> compDataSize,
) => _module.CompressData(data, dataSize, compDataSize);

/// See [RaylibCoreFlat.DecompressData].
MemoryPointer<RUnsignedChar> DecompressData(
  MemoryPointer<RUnsignedChar> compData,
  int compDataSize,
  MemoryPointer<RInt> dataSize,
) => _module.DecompressData(compData, compDataSize, dataSize);

/// See [RaylibCoreFlat.EncodeDataBase64].
MemoryPointer<RChar> EncodeDataBase64(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
  MemoryPointer<RInt> outputSize,
) => _module.EncodeDataBase64(data, dataSize, outputSize);

/// See [RaylibCoreFlat.DecodeDataBase64].
MemoryPointer<RUnsignedChar> DecodeDataBase64(
  MemoryPointer<RChar> data,
  MemoryPointer<RInt> outputSize,
) => _module.DecodeDataBase64(data, outputSize);

/// See [RaylibCoreFlat.ComputeCRC32].
int ComputeCRC32(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.ComputeCRC32(data, dataSize);

/// See [RaylibCoreFlat.ComputeMD5].
MemoryPointer<RUnsignedInt> ComputeMD5(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.ComputeMD5(data, dataSize);

/// See [RaylibCoreFlat.ComputeSHA1].
MemoryPointer<RUnsignedInt> ComputeSHA1(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.ComputeSHA1(data, dataSize);

/// See [RaylibCoreFlat.ComputeSHA256].
MemoryPointer<RUnsignedInt> ComputeSHA256(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.ComputeSHA256(data, dataSize);

/// See [RaylibCoreFlat.LoadAutomationEventList].
AutomationEventList LoadAutomationEventList(
  MemoryPointer<RChar> fileName,
) => _module.LoadAutomationEventList(fileName);

/// See [RaylibCoreFlat.UnloadAutomationEventList].
void UnloadAutomationEventList(
  AutomationEventList list,
) => _module.UnloadAutomationEventList(list);

/// See [RaylibCoreFlat.ExportAutomationEventList].
bool ExportAutomationEventList(
  AutomationEventList list,
  MemoryPointer<RChar> fileName,
) => _module.ExportAutomationEventList(list, fileName);

/// See [RaylibCoreFlat.SetAutomationEventList].
void SetAutomationEventList(
  StructPointer<AutomationEventList> list,
) => _module.SetAutomationEventList(list);

/// See [RaylibCoreFlat.SetAutomationEventBaseFrame].
void SetAutomationEventBaseFrame(
  int frame,
) => _module.SetAutomationEventBaseFrame(frame);

/// See [RaylibCoreFlat.StartAutomationEventRecording].
void StartAutomationEventRecording() => _module.StartAutomationEventRecording();

/// See [RaylibCoreFlat.StopAutomationEventRecording].
void StopAutomationEventRecording() => _module.StopAutomationEventRecording();

/// See [RaylibCoreFlat.PlayAutomationEvent].
void PlayAutomationEvent(
  AutomationEvent event,
) => _module.PlayAutomationEvent(event);

/// See [RaylibCoreFlat.IsKeyPressed].
bool IsKeyPressed(
  int key,
) => _module.IsKeyPressed(key);

/// See [RaylibCoreFlat.IsKeyPressedRepeat].
bool IsKeyPressedRepeat(
  int key,
) => _module.IsKeyPressedRepeat(key);

/// See [RaylibCoreFlat.IsKeyDown].
bool IsKeyDown(
  int key,
) => _module.IsKeyDown(key);

/// See [RaylibCoreFlat.IsKeyReleased].
bool IsKeyReleased(
  int key,
) => _module.IsKeyReleased(key);

/// See [RaylibCoreFlat.IsKeyUp].
bool IsKeyUp(
  int key,
) => _module.IsKeyUp(key);

/// See [RaylibCoreFlat.GetKeyName].
MemoryPointer<RChar> GetKeyName(
  int key,
) => _module.GetKeyName(key);

/// See [RaylibCoreFlat.GetKeyPressed].
int GetKeyPressed() => _module.GetKeyPressed();

/// See [RaylibCoreFlat.GetCharPressed].
int GetCharPressed() => _module.GetCharPressed();

/// See [RaylibCoreFlat.SetExitKey].
void SetExitKey(
  int key,
) => _module.SetExitKey(key);

/// See [RaylibCoreFlat.IsGamepadAvailable].
bool IsGamepadAvailable(
  int gamepad,
) => _module.IsGamepadAvailable(gamepad);

/// See [RaylibCoreFlat.GetGamepadName].
MemoryPointer<RChar> GetGamepadName(
  int gamepad,
) => _module.GetGamepadName(gamepad);

/// See [RaylibCoreFlat.IsGamepadButtonPressed].
bool IsGamepadButtonPressed(
  int gamepad,
  int button,
) => _module.IsGamepadButtonPressed(gamepad, button);

/// See [RaylibCoreFlat.IsGamepadButtonDown].
bool IsGamepadButtonDown(
  int gamepad,
  int button,
) => _module.IsGamepadButtonDown(gamepad, button);

/// See [RaylibCoreFlat.IsGamepadButtonReleased].
bool IsGamepadButtonReleased(
  int gamepad,
  int button,
) => _module.IsGamepadButtonReleased(gamepad, button);

/// See [RaylibCoreFlat.IsGamepadButtonUp].
bool IsGamepadButtonUp(
  int gamepad,
  int button,
) => _module.IsGamepadButtonUp(gamepad, button);

/// See [RaylibCoreFlat.GetGamepadButtonPressed].
int GetGamepadButtonPressed() => _module.GetGamepadButtonPressed();

/// See [RaylibCoreFlat.GetGamepadAxisCount].
int GetGamepadAxisCount(
  int gamepad,
) => _module.GetGamepadAxisCount(gamepad);

/// See [RaylibCoreFlat.GetGamepadAxisMovement].
double GetGamepadAxisMovement(
  int gamepad,
  int axis,
) => _module.GetGamepadAxisMovement(gamepad, axis);

/// See [RaylibCoreFlat.SetGamepadMappings].
int SetGamepadMappings(
  MemoryPointer<RChar> mappings,
) => _module.SetGamepadMappings(mappings);

/// See [RaylibCoreFlat.SetGamepadVibration].
void SetGamepadVibration(
  int gamepad,
  double leftMotor,
  double rightMotor,
  double duration,
) => _module.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration);

/// See [RaylibCoreFlat.IsMouseButtonPressed].
bool IsMouseButtonPressed(
  int button,
) => _module.IsMouseButtonPressed(button);

/// See [RaylibCoreFlat.IsMouseButtonDown].
bool IsMouseButtonDown(
  int button,
) => _module.IsMouseButtonDown(button);

/// See [RaylibCoreFlat.IsMouseButtonReleased].
bool IsMouseButtonReleased(
  int button,
) => _module.IsMouseButtonReleased(button);

/// See [RaylibCoreFlat.IsMouseButtonUp].
bool IsMouseButtonUp(
  int button,
) => _module.IsMouseButtonUp(button);

/// See [RaylibCoreFlat.GetMouseX].
int GetMouseX() => _module.GetMouseX();

/// See [RaylibCoreFlat.GetMouseY].
int GetMouseY() => _module.GetMouseY();

/// See [RaylibCoreFlat.GetMousePosition].
Vector2 GetMousePosition() => _module.GetMousePosition();

/// See [RaylibCoreFlat.GetMouseDelta].
Vector2 GetMouseDelta() => _module.GetMouseDelta();

/// See [RaylibCoreFlat.SetMousePosition].
void SetMousePosition(
  int x,
  int y,
) => _module.SetMousePosition(x, y);

/// See [RaylibCoreFlat.SetMouseOffset].
void SetMouseOffset(
  int offsetX,
  int offsetY,
) => _module.SetMouseOffset(offsetX, offsetY);

/// See [RaylibCoreFlat.SetMouseScale].
void SetMouseScale(
  double scaleX,
  double scaleY,
) => _module.SetMouseScale(scaleX, scaleY);

/// See [RaylibCoreFlat.GetMouseWheelMove].
double GetMouseWheelMove() => _module.GetMouseWheelMove();

/// See [RaylibCoreFlat.GetMouseWheelMoveV].
Vector2 GetMouseWheelMoveV() => _module.GetMouseWheelMoveV();

/// See [RaylibCoreFlat.SetMouseCursor].
void SetMouseCursor(
  int cursor,
) => _module.SetMouseCursor(cursor);

/// See [RaylibCoreFlat.GetTouchX].
int GetTouchX() => _module.GetTouchX();

/// See [RaylibCoreFlat.GetTouchY].
int GetTouchY() => _module.GetTouchY();

/// See [RaylibCoreFlat.GetTouchPosition].
Vector2 GetTouchPosition(
  int index,
) => _module.GetTouchPosition(index);

/// See [RaylibCoreFlat.GetTouchPointId].
int GetTouchPointId(
  int index,
) => _module.GetTouchPointId(index);

/// See [RaylibCoreFlat.GetTouchPointCount].
int GetTouchPointCount() => _module.GetTouchPointCount();

/// See [RaylibCoreFlat.SetGesturesEnabled].
void SetGesturesEnabled(
  int flags,
) => _module.SetGesturesEnabled(flags);

/// See [RaylibCoreFlat.IsGestureDetected].
bool IsGestureDetected(
  int gesture,
) => _module.IsGestureDetected(gesture);

/// See [RaylibCoreFlat.GetGestureDetected].
int GetGestureDetected() => _module.GetGestureDetected();

/// See [RaylibCoreFlat.GetGestureHoldDuration].
double GetGestureHoldDuration() => _module.GetGestureHoldDuration();

/// See [RaylibCoreFlat.GetGestureDragVector].
Vector2 GetGestureDragVector() => _module.GetGestureDragVector();

/// See [RaylibCoreFlat.GetGestureDragAngle].
double GetGestureDragAngle() => _module.GetGestureDragAngle();

/// See [RaylibCoreFlat.GetGesturePinchVector].
Vector2 GetGesturePinchVector() => _module.GetGesturePinchVector();

/// See [RaylibCoreFlat.GetGesturePinchAngle].
double GetGesturePinchAngle() => _module.GetGesturePinchAngle();

/// See [RaylibCoreFlat.ProcessGestureEvent].
void ProcessGestureEvent(
  GestureEvent event,
) => _module.ProcessGestureEvent(event);

/// See [RaylibCoreFlat.UpdateGestures].
void UpdateGestures() => _module.UpdateGestures();

/// See [RaylibCoreFlat.UpdateCamera].
void UpdateCamera(
  StructPointer<Camera3D> camera,
  int mode,
) => _module.UpdateCamera(camera, mode);

/// See [RaylibCoreFlat.UpdateCameraPro].
void UpdateCameraPro(
  StructPointer<Camera3D> camera,
  Vector3 movement,
  Vector3 rotation,
  double zoom,
) => _module.UpdateCameraPro(camera, movement, rotation, zoom);

/// See [RaylibCoreFlat.SetShapesTexture].
void SetShapesTexture(
  Texture texture,
  Rectangle source,
) => _module.SetShapesTexture(texture, source);

/// See [RaylibCoreFlat.GetShapesTexture].
Texture GetShapesTexture() => _module.GetShapesTexture();

/// See [RaylibCoreFlat.GetShapesTextureRectangle].
Rectangle GetShapesTextureRectangle() => _module.GetShapesTextureRectangle();

/// See [RaylibCoreFlat.DrawPixel].
void DrawPixel(
  int posX,
  int posY,
  Color color,
) => _module.DrawPixel(posX, posY, color);

/// See [RaylibCoreFlat.DrawPixelV].
void DrawPixelV(
  Vector2 position,
  Color color,
) => _module.DrawPixelV(position, color);

/// See [RaylibCoreFlat.DrawLine].
void DrawLine(
  int startPosX,
  int startPosY,
  int endPosX,
  int endPosY,
  Color color,
) => _module.DrawLine(startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreFlat.DrawLineV].
void DrawLineV(
  Vector2 startPos,
  Vector2 endPos,
  Color color,
) => _module.DrawLineV(startPos, endPos, color);

/// See [RaylibCoreFlat.DrawLineEx].
void DrawLineEx(
  Vector2 startPos,
  Vector2 endPos,
  double thick,
  Color color,
) => _module.DrawLineEx(startPos, endPos, thick, color);

/// See [RaylibCoreFlat.DrawLineStrip].
void DrawLineStrip(
  StructPointer<Vector2> points,
  int pointCount,
  Color color,
) => _module.DrawLineStrip(points, pointCount, color);

/// See [RaylibCoreFlat.DrawLineBezier].
void DrawLineBezier(
  Vector2 startPos,
  Vector2 endPos,
  double thick,
  Color color,
) => _module.DrawLineBezier(startPos, endPos, thick, color);

/// See [RaylibCoreFlat.DrawLineDashed].
void DrawLineDashed(
  Vector2 startPos,
  Vector2 endPos,
  int dashSize,
  int spaceSize,
  Color color,
) => _module.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color);

/// See [RaylibCoreFlat.DrawCircle].
void DrawCircle(
  int centerX,
  int centerY,
  double radius,
  Color color,
) => _module.DrawCircle(centerX, centerY, radius, color);

/// See [RaylibCoreFlat.DrawCircleSector].
void DrawCircleSector(
  Vector2 center,
  double radius,
  double startAngle,
  double endAngle,
  int segments,
  Color color,
) => _module.DrawCircleSector(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreFlat.DrawCircleSectorLines].
void DrawCircleSectorLines(
  Vector2 center,
  double radius,
  double startAngle,
  double endAngle,
  int segments,
  Color color,
) => _module.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreFlat.DrawCircleGradient].
void DrawCircleGradient(
  Vector2 center,
  double radius,
  Color inner,
  Color outer,
) => _module.DrawCircleGradient(center, radius, inner, outer);

/// See [RaylibCoreFlat.DrawCircleV].
void DrawCircleV(
  Vector2 center,
  double radius,
  Color color,
) => _module.DrawCircleV(center, radius, color);

/// See [RaylibCoreFlat.DrawCircleLines].
void DrawCircleLines(
  int centerX,
  int centerY,
  double radius,
  Color color,
) => _module.DrawCircleLines(centerX, centerY, radius, color);

/// See [RaylibCoreFlat.DrawCircleLinesV].
void DrawCircleLinesV(
  Vector2 center,
  double radius,
  Color color,
) => _module.DrawCircleLinesV(center, radius, color);

/// See [RaylibCoreFlat.DrawEllipse].
void DrawEllipse(
  int centerX,
  int centerY,
  double radiusH,
  double radiusV,
  Color color,
) => _module.DrawEllipse(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreFlat.DrawEllipseV].
void DrawEllipseV(
  Vector2 center,
  double radiusH,
  double radiusV,
  Color color,
) => _module.DrawEllipseV(center, radiusH, radiusV, color);

/// See [RaylibCoreFlat.DrawEllipseLines].
void DrawEllipseLines(
  int centerX,
  int centerY,
  double radiusH,
  double radiusV,
  Color color,
) => _module.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreFlat.DrawEllipseLinesV].
void DrawEllipseLinesV(
  Vector2 center,
  double radiusH,
  double radiusV,
  Color color,
) => _module.DrawEllipseLinesV(center, radiusH, radiusV, color);

/// See [RaylibCoreFlat.DrawRing].
void DrawRing(
  Vector2 center,
  double innerRadius,
  double outerRadius,
  double startAngle,
  double endAngle,
  int segments,
  Color color,
) => _module.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreFlat.DrawRingLines].
void DrawRingLines(
  Vector2 center,
  double innerRadius,
  double outerRadius,
  double startAngle,
  double endAngle,
  int segments,
  Color color,
) => _module.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreFlat.DrawRectangle].
void DrawRectangle(
  int posX,
  int posY,
  int width,
  int height,
  Color color,
) => _module.DrawRectangle(posX, posY, width, height, color);

/// See [RaylibCoreFlat.DrawRectangleV].
void DrawRectangleV(
  Vector2 position,
  Vector2 size,
  Color color,
) => _module.DrawRectangleV(position, size, color);

/// See [RaylibCoreFlat.DrawRectangleRec].
void DrawRectangleRec(
  Rectangle rec,
  Color color,
) => _module.DrawRectangleRec(rec, color);

/// See [RaylibCoreFlat.DrawRectanglePro].
void DrawRectanglePro(
  Rectangle rec,
  Vector2 origin,
  double rotation,
  Color color,
) => _module.DrawRectanglePro(rec, origin, rotation, color);

/// See [RaylibCoreFlat.DrawRectangleGradientV].
void DrawRectangleGradientV(
  int posX,
  int posY,
  int width,
  int height,
  Color top,
  Color bottom,
) => _module.DrawRectangleGradientV(posX, posY, width, height, top, bottom);

/// See [RaylibCoreFlat.DrawRectangleGradientH].
void DrawRectangleGradientH(
  int posX,
  int posY,
  int width,
  int height,
  Color left,
  Color right,
) => _module.DrawRectangleGradientH(posX, posY, width, height, left, right);

/// See [RaylibCoreFlat.DrawRectangleGradientEx].
void DrawRectangleGradientEx(
  Rectangle rec,
  Color topLeft,
  Color bottomLeft,
  Color topRight,
  Color bottomRight,
) => _module.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);

/// See [RaylibCoreFlat.DrawRectangleLines].
void DrawRectangleLines(
  int posX,
  int posY,
  int width,
  int height,
  Color color,
) => _module.DrawRectangleLines(posX, posY, width, height, color);

/// See [RaylibCoreFlat.DrawRectangleLinesEx].
void DrawRectangleLinesEx(
  Rectangle rec,
  double lineThick,
  Color color,
) => _module.DrawRectangleLinesEx(rec, lineThick, color);

/// See [RaylibCoreFlat.DrawRectangleRounded].
void DrawRectangleRounded(
  Rectangle rec,
  double roundness,
  int segments,
  Color color,
) => _module.DrawRectangleRounded(rec, roundness, segments, color);

/// See [RaylibCoreFlat.DrawRectangleRoundedLines].
void DrawRectangleRoundedLines(
  Rectangle rec,
  double roundness,
  int segments,
  Color color,
) => _module.DrawRectangleRoundedLines(rec, roundness, segments, color);

/// See [RaylibCoreFlat.DrawRectangleRoundedLinesEx].
void DrawRectangleRoundedLinesEx(
  Rectangle rec,
  double roundness,
  int segments,
  double lineThick,
  Color color,
) => _module.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);

/// See [RaylibCoreFlat.DrawTriangle].
void DrawTriangle(
  Vector2 v1,
  Vector2 v2,
  Vector2 v3,
  Color color,
) => _module.DrawTriangle(v1, v2, v3, color);

/// See [RaylibCoreFlat.DrawTriangleLines].
void DrawTriangleLines(
  Vector2 v1,
  Vector2 v2,
  Vector2 v3,
  Color color,
) => _module.DrawTriangleLines(v1, v2, v3, color);

/// See [RaylibCoreFlat.DrawTriangleFan].
void DrawTriangleFan(
  StructPointer<Vector2> points,
  int pointCount,
  Color color,
) => _module.DrawTriangleFan(points, pointCount, color);

/// See [RaylibCoreFlat.DrawTriangleStrip].
void DrawTriangleStrip(
  StructPointer<Vector2> points,
  int pointCount,
  Color color,
) => _module.DrawTriangleStrip(points, pointCount, color);

/// See [RaylibCoreFlat.DrawPoly].
void DrawPoly(
  Vector2 center,
  int sides,
  double radius,
  double rotation,
  Color color,
) => _module.DrawPoly(center, sides, radius, rotation, color);

/// See [RaylibCoreFlat.DrawPolyLines].
void DrawPolyLines(
  Vector2 center,
  int sides,
  double radius,
  double rotation,
  Color color,
) => _module.DrawPolyLines(center, sides, radius, rotation, color);

/// See [RaylibCoreFlat.DrawPolyLinesEx].
void DrawPolyLinesEx(
  Vector2 center,
  int sides,
  double radius,
  double rotation,
  double lineThick,
  Color color,
) => _module.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color);

/// See [RaylibCoreFlat.DrawSplineLinear].
void DrawSplineLinear(
  StructPointer<Vector2> points,
  int pointCount,
  double thick,
  Color color,
) => _module.DrawSplineLinear(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineBasis].
void DrawSplineBasis(
  StructPointer<Vector2> points,
  int pointCount,
  double thick,
  Color color,
) => _module.DrawSplineBasis(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineCatmullRom].
void DrawSplineCatmullRom(
  StructPointer<Vector2> points,
  int pointCount,
  double thick,
  Color color,
) => _module.DrawSplineCatmullRom(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineBezierQuadratic].
void DrawSplineBezierQuadratic(
  StructPointer<Vector2> points,
  int pointCount,
  double thick,
  Color color,
) => _module.DrawSplineBezierQuadratic(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineBezierCubic].
void DrawSplineBezierCubic(
  StructPointer<Vector2> points,
  int pointCount,
  double thick,
  Color color,
) => _module.DrawSplineBezierCubic(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentLinear].
void DrawSplineSegmentLinear(
  Vector2 p1,
  Vector2 p2,
  double thick,
  Color color,
) => _module.DrawSplineSegmentLinear(p1, p2, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentBasis].
void DrawSplineSegmentBasis(
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
  Vector2 p4,
  double thick,
  Color color,
) => _module.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentCatmullRom].
void DrawSplineSegmentCatmullRom(
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
  Vector2 p4,
  double thick,
  Color color,
) => _module.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentBezierQuadratic].
void DrawSplineSegmentBezierQuadratic(
  Vector2 p1,
  Vector2 c2,
  Vector2 p3,
  double thick,
  Color color,
) => _module.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentBezierCubic].
void DrawSplineSegmentBezierCubic(
  Vector2 p1,
  Vector2 c2,
  Vector2 c3,
  Vector2 p4,
  double thick,
  Color color,
) => _module.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);

/// See [RaylibCoreFlat.GetSplinePointLinear].
Vector2 GetSplinePointLinear(
  Vector2 startPos,
  Vector2 endPos,
  double t,
) => _module.GetSplinePointLinear(startPos, endPos, t);

/// See [RaylibCoreFlat.GetSplinePointBasis].
Vector2 GetSplinePointBasis(
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
  Vector2 p4,
  double t,
) => _module.GetSplinePointBasis(p1, p2, p3, p4, t);

/// See [RaylibCoreFlat.GetSplinePointCatmullRom].
Vector2 GetSplinePointCatmullRom(
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
  Vector2 p4,
  double t,
) => _module.GetSplinePointCatmullRom(p1, p2, p3, p4, t);

/// See [RaylibCoreFlat.GetSplinePointBezierQuad].
Vector2 GetSplinePointBezierQuad(
  Vector2 p1,
  Vector2 c2,
  Vector2 p3,
  double t,
) => _module.GetSplinePointBezierQuad(p1, c2, p3, t);

/// See [RaylibCoreFlat.GetSplinePointBezierCubic].
Vector2 GetSplinePointBezierCubic(
  Vector2 p1,
  Vector2 c2,
  Vector2 c3,
  Vector2 p4,
  double t,
) => _module.GetSplinePointBezierCubic(p1, c2, c3, p4, t);

/// See [RaylibCoreFlat.CheckCollisionRecs].
bool CheckCollisionRecs(
  Rectangle rec1,
  Rectangle rec2,
) => _module.CheckCollisionRecs(rec1, rec2);

/// See [RaylibCoreFlat.CheckCollisionCircles].
bool CheckCollisionCircles(
  Vector2 center1,
  double radius1,
  Vector2 center2,
  double radius2,
) => _module.CheckCollisionCircles(center1, radius1, center2, radius2);

/// See [RaylibCoreFlat.CheckCollisionCircleRec].
bool CheckCollisionCircleRec(
  Vector2 center,
  double radius,
  Rectangle rec,
) => _module.CheckCollisionCircleRec(center, radius, rec);

/// See [RaylibCoreFlat.CheckCollisionCircleLine].
bool CheckCollisionCircleLine(
  Vector2 center,
  double radius,
  Vector2 p1,
  Vector2 p2,
) => _module.CheckCollisionCircleLine(center, radius, p1, p2);

/// See [RaylibCoreFlat.CheckCollisionPointRec].
bool CheckCollisionPointRec(
  Vector2 point,
  Rectangle rec,
) => _module.CheckCollisionPointRec(point, rec);

/// See [RaylibCoreFlat.CheckCollisionPointCircle].
bool CheckCollisionPointCircle(
  Vector2 point,
  Vector2 center,
  double radius,
) => _module.CheckCollisionPointCircle(point, center, radius);

/// See [RaylibCoreFlat.CheckCollisionPointTriangle].
bool CheckCollisionPointTriangle(
  Vector2 point,
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
) => _module.CheckCollisionPointTriangle(point, p1, p2, p3);

/// See [RaylibCoreFlat.CheckCollisionPointLine].
bool CheckCollisionPointLine(
  Vector2 point,
  Vector2 p1,
  Vector2 p2,
  int threshold,
) => _module.CheckCollisionPointLine(point, p1, p2, threshold);

/// See [RaylibCoreFlat.CheckCollisionPointPoly].
bool CheckCollisionPointPoly(
  Vector2 point,
  StructPointer<Vector2> points,
  int pointCount,
) => _module.CheckCollisionPointPoly(point, points, pointCount);

/// See [RaylibCoreFlat.CheckCollisionLines].
bool CheckCollisionLines(
  Vector2 startPos1,
  Vector2 endPos1,
  Vector2 startPos2,
  Vector2 endPos2,
  StructPointer<Vector2> collisionPoint,
) => _module.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint);

/// See [RaylibCoreFlat.GetCollisionRec].
Rectangle GetCollisionRec(
  Rectangle rec1,
  Rectangle rec2,
) => _module.GetCollisionRec(rec1, rec2);

/// See [RaylibCoreFlat.LoadImage].
Image LoadImage(
  MemoryPointer<RChar> fileName,
) => _module.LoadImage(fileName);

/// See [RaylibCoreFlat.LoadImageRaw].
Image LoadImageRaw(
  MemoryPointer<RChar> fileName,
  int width,
  int height,
  int format,
  int headerSize,
) => _module.LoadImageRaw(fileName, width, height, format, headerSize);

/// See [RaylibCoreFlat.LoadImageAnim].
Image LoadImageAnim(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RInt> frames,
) => _module.LoadImageAnim(fileName, frames);

/// See [RaylibCoreFlat.LoadImageAnimFromMemory].
Image LoadImageAnimFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
  MemoryPointer<RInt> frames,
) => _module.LoadImageAnimFromMemory(fileType, fileData, dataSize, frames);

/// See [RaylibCoreFlat.LoadImageFromMemory].
Image LoadImageFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
) => _module.LoadImageFromMemory(fileType, fileData, dataSize);

/// See [RaylibCoreFlat.LoadImageFromTexture].
Image LoadImageFromTexture(
  Texture texture,
) => _module.LoadImageFromTexture(texture);

/// See [RaylibCoreFlat.LoadImageFromScreen].
Image LoadImageFromScreen() => _module.LoadImageFromScreen();

/// See [RaylibCoreFlat.IsImageValid].
bool IsImageValid(
  Image image,
) => _module.IsImageValid(image);

/// See [RaylibCoreFlat.UnloadImage].
void UnloadImage(
  Image image,
) => _module.UnloadImage(image);

/// See [RaylibCoreFlat.ExportImage].
bool ExportImage(
  Image image,
  MemoryPointer<RChar> fileName,
) => _module.ExportImage(image, fileName);

/// See [RaylibCoreFlat.ExportImageToMemory].
MemoryPointer<RUnsignedChar> ExportImageToMemory(
  Image image,
  MemoryPointer<RChar> fileType,
  MemoryPointer<RInt> fileSize,
) => _module.ExportImageToMemory(image, fileType, fileSize);

/// See [RaylibCoreFlat.ExportImageAsCode].
bool ExportImageAsCode(
  Image image,
  MemoryPointer<RChar> fileName,
) => _module.ExportImageAsCode(image, fileName);

/// See [RaylibCoreFlat.GenImageColor].
Image GenImageColor(
  int width,
  int height,
  Color color,
) => _module.GenImageColor(width, height, color);

/// See [RaylibCoreFlat.GenImageGradientLinear].
Image GenImageGradientLinear(
  int width,
  int height,
  int direction,
  Color start,
  Color end,
) => _module.GenImageGradientLinear(width, height, direction, start, end);

/// See [RaylibCoreFlat.GenImageGradientRadial].
Image GenImageGradientRadial(
  int width,
  int height,
  double density,
  Color inner,
  Color outer,
) => _module.GenImageGradientRadial(width, height, density, inner, outer);

/// See [RaylibCoreFlat.GenImageGradientSquare].
Image GenImageGradientSquare(
  int width,
  int height,
  double density,
  Color inner,
  Color outer,
) => _module.GenImageGradientSquare(width, height, density, inner, outer);

/// See [RaylibCoreFlat.GenImageChecked].
Image GenImageChecked(
  int width,
  int height,
  int checksX,
  int checksY,
  Color col1,
  Color col2,
) => _module.GenImageChecked(width, height, checksX, checksY, col1, col2);

/// See [RaylibCoreFlat.GenImageWhiteNoise].
Image GenImageWhiteNoise(
  int width,
  int height,
  double factor,
) => _module.GenImageWhiteNoise(width, height, factor);

/// See [RaylibCoreFlat.GenImagePerlinNoise].
Image GenImagePerlinNoise(
  int width,
  int height,
  int offsetX,
  int offsetY,
  double scale,
) => _module.GenImagePerlinNoise(width, height, offsetX, offsetY, scale);

/// See [RaylibCoreFlat.GenImageCellular].
Image GenImageCellular(
  int width,
  int height,
  int tileSize,
) => _module.GenImageCellular(width, height, tileSize);

/// See [RaylibCoreFlat.GenImageText].
Image GenImageText(
  int width,
  int height,
  MemoryPointer<RChar> text,
) => _module.GenImageText(width, height, text);

/// See [RaylibCoreFlat.ImageCopy].
Image ImageCopy(
  Image image,
) => _module.ImageCopy(image);

/// See [RaylibCoreFlat.ImageFromImage].
Image ImageFromImage(
  Image image,
  Rectangle rec,
) => _module.ImageFromImage(image, rec);

/// See [RaylibCoreFlat.ImageFromChannel].
Image ImageFromChannel(
  Image image,
  int selectedChannel,
) => _module.ImageFromChannel(image, selectedChannel);

/// See [RaylibCoreFlat.ImageText].
Image ImageText(
  MemoryPointer<RChar> text,
  int fontSize,
  Color color,
) => _module.ImageText(text, fontSize, color);

/// See [RaylibCoreFlat.ImageTextEx].
Image ImageTextEx(
  Font font,
  MemoryPointer<RChar> text,
  double fontSize,
  double spacing,
  Color tint,
) => _module.ImageTextEx(font, text, fontSize, spacing, tint);

/// See [RaylibCoreFlat.ImageFormat].
void ImageFormat(
  StructPointer<Image> image,
  int newFormat,
) => _module.ImageFormat(image, newFormat);

/// See [RaylibCoreFlat.ImageToPOT].
void ImageToPOT(
  StructPointer<Image> image,
  Color fill,
) => _module.ImageToPOT(image, fill);

/// See [RaylibCoreFlat.ImageCrop].
void ImageCrop(
  StructPointer<Image> image,
  Rectangle crop,
) => _module.ImageCrop(image, crop);

/// See [RaylibCoreFlat.ImageAlphaCrop].
void ImageAlphaCrop(
  StructPointer<Image> image,
  double threshold,
) => _module.ImageAlphaCrop(image, threshold);

/// See [RaylibCoreFlat.ImageAlphaClear].
void ImageAlphaClear(
  StructPointer<Image> image,
  Color color,
  double threshold,
) => _module.ImageAlphaClear(image, color, threshold);

/// See [RaylibCoreFlat.ImageAlphaMask].
void ImageAlphaMask(
  StructPointer<Image> image,
  Image alphaMask,
) => _module.ImageAlphaMask(image, alphaMask);

/// See [RaylibCoreFlat.ImageAlphaPremultiply].
void ImageAlphaPremultiply(
  StructPointer<Image> image,
) => _module.ImageAlphaPremultiply(image);

/// See [RaylibCoreFlat.ImageBlurGaussian].
void ImageBlurGaussian(
  StructPointer<Image> image,
  int blurSize,
) => _module.ImageBlurGaussian(image, blurSize);

/// See [RaylibCoreFlat.ImageKernelConvolution].
void ImageKernelConvolution(
  StructPointer<Image> image,
  MemoryPointer<RFloat> kernel,
  int kernelSize,
) => _module.ImageKernelConvolution(image, kernel, kernelSize);

/// See [RaylibCoreFlat.ImageResize].
void ImageResize(
  StructPointer<Image> image,
  int newWidth,
  int newHeight,
) => _module.ImageResize(image, newWidth, newHeight);

/// See [RaylibCoreFlat.ImageResizeNN].
void ImageResizeNN(
  StructPointer<Image> image,
  int newWidth,
  int newHeight,
) => _module.ImageResizeNN(image, newWidth, newHeight);

/// See [RaylibCoreFlat.ImageResizeCanvas].
void ImageResizeCanvas(
  StructPointer<Image> image,
  int newWidth,
  int newHeight,
  int offsetX,
  int offsetY,
  Color fill,
) => _module.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill);

/// See [RaylibCoreFlat.ImageMipmaps].
void ImageMipmaps(
  StructPointer<Image> image,
) => _module.ImageMipmaps(image);

/// See [RaylibCoreFlat.ImageDither].
void ImageDither(
  StructPointer<Image> image,
  int rBpp,
  int gBpp,
  int bBpp,
  int aBpp,
) => _module.ImageDither(image, rBpp, gBpp, bBpp, aBpp);

/// See [RaylibCoreFlat.ImageFlipVertical].
void ImageFlipVertical(
  StructPointer<Image> image,
) => _module.ImageFlipVertical(image);

/// See [RaylibCoreFlat.ImageFlipHorizontal].
void ImageFlipHorizontal(
  StructPointer<Image> image,
) => _module.ImageFlipHorizontal(image);

/// See [RaylibCoreFlat.ImageRotate].
void ImageRotate(
  StructPointer<Image> image,
  int degrees,
) => _module.ImageRotate(image, degrees);

/// See [RaylibCoreFlat.ImageRotateCW].
void ImageRotateCW(
  StructPointer<Image> image,
) => _module.ImageRotateCW(image);

/// See [RaylibCoreFlat.ImageRotateCCW].
void ImageRotateCCW(
  StructPointer<Image> image,
) => _module.ImageRotateCCW(image);

/// See [RaylibCoreFlat.ImageColorTint].
void ImageColorTint(
  StructPointer<Image> image,
  Color color,
) => _module.ImageColorTint(image, color);

/// See [RaylibCoreFlat.ImageColorInvert].
void ImageColorInvert(
  StructPointer<Image> image,
) => _module.ImageColorInvert(image);

/// See [RaylibCoreFlat.ImageColorGrayscale].
void ImageColorGrayscale(
  StructPointer<Image> image,
) => _module.ImageColorGrayscale(image);

/// See [RaylibCoreFlat.ImageColorContrast].
void ImageColorContrast(
  StructPointer<Image> image,
  double contrast,
) => _module.ImageColorContrast(image, contrast);

/// See [RaylibCoreFlat.ImageColorBrightness].
void ImageColorBrightness(
  StructPointer<Image> image,
  int brightness,
) => _module.ImageColorBrightness(image, brightness);

/// See [RaylibCoreFlat.ImageColorReplace].
void ImageColorReplace(
  StructPointer<Image> image,
  Color color,
  Color replace,
) => _module.ImageColorReplace(image, color, replace);

/// See [RaylibCoreFlat.LoadImageColors].
StructPointer<Color> LoadImageColors(
  Image image,
) => _module.LoadImageColors(image);

/// See [RaylibCoreFlat.LoadImagePalette].
StructPointer<Color> LoadImagePalette(
  Image image,
  int maxPaletteSize,
  MemoryPointer<RInt> colorCount,
) => _module.LoadImagePalette(image, maxPaletteSize, colorCount);

/// See [RaylibCoreFlat.UnloadImageColors].
void UnloadImageColors(
  StructPointer<Color> colors,
) => _module.UnloadImageColors(colors);

/// See [RaylibCoreFlat.UnloadImagePalette].
void UnloadImagePalette(
  StructPointer<Color> colors,
) => _module.UnloadImagePalette(colors);

/// See [RaylibCoreFlat.GetImageAlphaBorder].
Rectangle GetImageAlphaBorder(
  Image image,
  double threshold,
) => _module.GetImageAlphaBorder(image, threshold);

/// See [RaylibCoreFlat.GetImageColor].
Color GetImageColor(
  Image image,
  int x,
  int y,
) => _module.GetImageColor(image, x, y);

/// See [RaylibCoreFlat.ImageClearBackground].
void ImageClearBackground(
  StructPointer<Image> dst,
  Color color,
) => _module.ImageClearBackground(dst, color);

/// See [RaylibCoreFlat.ImageDrawPixel].
void ImageDrawPixel(
  StructPointer<Image> dst,
  int posX,
  int posY,
  Color color,
) => _module.ImageDrawPixel(dst, posX, posY, color);

/// See [RaylibCoreFlat.ImageDrawPixelV].
void ImageDrawPixelV(
  StructPointer<Image> dst,
  Vector2 position,
  Color color,
) => _module.ImageDrawPixelV(dst, position, color);

/// See [RaylibCoreFlat.ImageDrawLine].
void ImageDrawLine(
  StructPointer<Image> dst,
  int startPosX,
  int startPosY,
  int endPosX,
  int endPosY,
  Color color,
) => _module.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreFlat.ImageDrawLineV].
void ImageDrawLineV(
  StructPointer<Image> dst,
  Vector2 start,
  Vector2 end,
  Color color,
) => _module.ImageDrawLineV(dst, start, end, color);

/// See [RaylibCoreFlat.ImageDrawLineEx].
void ImageDrawLineEx(
  StructPointer<Image> dst,
  Vector2 start,
  Vector2 end,
  int thick,
  Color color,
) => _module.ImageDrawLineEx(dst, start, end, thick, color);

/// See [RaylibCoreFlat.ImageDrawCircle].
void ImageDrawCircle(
  StructPointer<Image> dst,
  int centerX,
  int centerY,
  int radius,
  Color color,
) => _module.ImageDrawCircle(dst, centerX, centerY, radius, color);

/// See [RaylibCoreFlat.ImageDrawCircleV].
void ImageDrawCircleV(
  StructPointer<Image> dst,
  Vector2 center,
  int radius,
  Color color,
) => _module.ImageDrawCircleV(dst, center, radius, color);

/// See [RaylibCoreFlat.ImageDrawCircleLines].
void ImageDrawCircleLines(
  StructPointer<Image> dst,
  int centerX,
  int centerY,
  int radius,
  Color color,
) => _module.ImageDrawCircleLines(dst, centerX, centerY, radius, color);

/// See [RaylibCoreFlat.ImageDrawCircleLinesV].
void ImageDrawCircleLinesV(
  StructPointer<Image> dst,
  Vector2 center,
  int radius,
  Color color,
) => _module.ImageDrawCircleLinesV(dst, center, radius, color);

/// See [RaylibCoreFlat.ImageDrawRectangle].
void ImageDrawRectangle(
  StructPointer<Image> dst,
  int posX,
  int posY,
  int width,
  int height,
  Color color,
) => _module.ImageDrawRectangle(dst, posX, posY, width, height, color);

/// See [RaylibCoreFlat.ImageDrawRectangleV].
void ImageDrawRectangleV(
  StructPointer<Image> dst,
  Vector2 position,
  Vector2 size,
  Color color,
) => _module.ImageDrawRectangleV(dst, position, size, color);

/// See [RaylibCoreFlat.ImageDrawRectangleRec].
void ImageDrawRectangleRec(
  StructPointer<Image> dst,
  Rectangle rec,
  Color color,
) => _module.ImageDrawRectangleRec(dst, rec, color);

/// See [RaylibCoreFlat.ImageDrawRectangleLines].
void ImageDrawRectangleLines(
  StructPointer<Image> dst,
  Rectangle rec,
  int thick,
  Color color,
) => _module.ImageDrawRectangleLines(dst, rec, thick, color);

/// See [RaylibCoreFlat.ImageDrawTriangle].
void ImageDrawTriangle(
  StructPointer<Image> dst,
  Vector2 v1,
  Vector2 v2,
  Vector2 v3,
  Color color,
) => _module.ImageDrawTriangle(dst, v1, v2, v3, color);

/// See [RaylibCoreFlat.ImageDrawTriangleEx].
void ImageDrawTriangleEx(
  StructPointer<Image> dst,
  Vector2 v1,
  Vector2 v2,
  Vector2 v3,
  Color c1,
  Color c2,
  Color c3,
) => _module.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3);

/// See [RaylibCoreFlat.ImageDrawTriangleLines].
void ImageDrawTriangleLines(
  StructPointer<Image> dst,
  Vector2 v1,
  Vector2 v2,
  Vector2 v3,
  Color color,
) => _module.ImageDrawTriangleLines(dst, v1, v2, v3, color);

/// See [RaylibCoreFlat.ImageDrawTriangleFan].
void ImageDrawTriangleFan(
  StructPointer<Image> dst,
  StructPointer<Vector2> points,
  int pointCount,
  Color color,
) => _module.ImageDrawTriangleFan(dst, points, pointCount, color);

/// See [RaylibCoreFlat.ImageDrawTriangleStrip].
void ImageDrawTriangleStrip(
  StructPointer<Image> dst,
  StructPointer<Vector2> points,
  int pointCount,
  Color color,
) => _module.ImageDrawTriangleStrip(dst, points, pointCount, color);

/// See [RaylibCoreFlat.ImageDraw].
void ImageDraw(
  StructPointer<Image> dst,
  Image src,
  Rectangle srcRec,
  Rectangle dstRec,
  Color tint,
) => _module.ImageDraw(dst, src, srcRec, dstRec, tint);

/// See [RaylibCoreFlat.ImageDrawText].
void ImageDrawText(
  StructPointer<Image> dst,
  MemoryPointer<RChar> text,
  int posX,
  int posY,
  int fontSize,
  Color color,
) => _module.ImageDrawText(dst, text, posX, posY, fontSize, color);

/// See [RaylibCoreFlat.ImageDrawTextEx].
void ImageDrawTextEx(
  StructPointer<Image> dst,
  Font font,
  MemoryPointer<RChar> text,
  Vector2 position,
  double fontSize,
  double spacing,
  Color tint,
) => _module.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreFlat.LoadTexture].
Texture LoadTexture(
  MemoryPointer<RChar> fileName,
) => _module.LoadTexture(fileName);

/// See [RaylibCoreFlat.LoadTextureFromImage].
Texture LoadTextureFromImage(
  Image image,
) => _module.LoadTextureFromImage(image);

/// See [RaylibCoreFlat.LoadTextureCubemap].
Texture LoadTextureCubemap(
  Image image,
  int layout,
) => _module.LoadTextureCubemap(image, layout);

/// See [RaylibCoreFlat.LoadRenderTexture].
RenderTexture LoadRenderTexture(
  int width,
  int height,
) => _module.LoadRenderTexture(width, height);

/// See [RaylibCoreFlat.IsTextureValid].
bool IsTextureValid(
  Texture texture,
) => _module.IsTextureValid(texture);

/// See [RaylibCoreFlat.UnloadTexture].
void UnloadTexture(
  Texture texture,
) => _module.UnloadTexture(texture);

/// See [RaylibCoreFlat.IsRenderTextureValid].
bool IsRenderTextureValid(
  RenderTexture target,
) => _module.IsRenderTextureValid(target);

/// See [RaylibCoreFlat.UnloadRenderTexture].
void UnloadRenderTexture(
  RenderTexture target,
) => _module.UnloadRenderTexture(target);

/// See [RaylibCoreFlat.UpdateTexture].
void UpdateTexture(
  Texture texture,
  MemoryPointer<RVoid> pixels,
) => _module.UpdateTexture(texture, pixels);

/// See [RaylibCoreFlat.UpdateTextureRec].
void UpdateTextureRec(
  Texture texture,
  Rectangle rec,
  MemoryPointer<RVoid> pixels,
) => _module.UpdateTextureRec(texture, rec, pixels);

/// See [RaylibCoreFlat.GenTextureMipmaps].
void GenTextureMipmaps(
  StructPointer<Texture> texture,
) => _module.GenTextureMipmaps(texture);

/// See [RaylibCoreFlat.SetTextureFilter].
void SetTextureFilter(
  Texture texture,
  int filter,
) => _module.SetTextureFilter(texture, filter);

/// See [RaylibCoreFlat.SetTextureWrap].
void SetTextureWrap(
  Texture texture,
  int wrap,
) => _module.SetTextureWrap(texture, wrap);

/// See [RaylibCoreFlat.DrawTexture].
void DrawTexture(
  Texture texture,
  int posX,
  int posY,
  Color tint,
) => _module.DrawTexture(texture, posX, posY, tint);

/// See [RaylibCoreFlat.DrawTextureV].
void DrawTextureV(
  Texture texture,
  Vector2 position,
  Color tint,
) => _module.DrawTextureV(texture, position, tint);

/// See [RaylibCoreFlat.DrawTextureEx].
void DrawTextureEx(
  Texture texture,
  Vector2 position,
  double rotation,
  double scale,
  Color tint,
) => _module.DrawTextureEx(texture, position, rotation, scale, tint);

/// See [RaylibCoreFlat.DrawTextureRec].
void DrawTextureRec(
  Texture texture,
  Rectangle source,
  Vector2 position,
  Color tint,
) => _module.DrawTextureRec(texture, source, position, tint);

/// See [RaylibCoreFlat.DrawTexturePro].
void DrawTexturePro(
  Texture texture,
  Rectangle source,
  Rectangle dest,
  Vector2 origin,
  double rotation,
  Color tint,
) => _module.DrawTexturePro(texture, source, dest, origin, rotation, tint);

/// See [RaylibCoreFlat.DrawTextureNPatch].
void DrawTextureNPatch(
  Texture texture,
  NPatchInfo nPatchInfo,
  Rectangle dest,
  Vector2 origin,
  double rotation,
  Color tint,
) => _module.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint);

/// See [RaylibCoreFlat.ColorIsEqual].
bool ColorIsEqual(
  Color col1,
  Color col2,
) => _module.ColorIsEqual(col1, col2);

/// See [RaylibCoreFlat.Fade].
Color Fade(
  Color color,
  double alpha,
) => _module.Fade(color, alpha);

/// See [RaylibCoreFlat.ColorToInt].
int ColorToInt(
  Color color,
) => _module.ColorToInt(color);

/// See [RaylibCoreFlat.ColorNormalize].
Vector4 ColorNormalize(
  Color color,
) => _module.ColorNormalize(color);

/// See [RaylibCoreFlat.ColorFromNormalized].
Color ColorFromNormalized(
  Vector4 normalized,
) => _module.ColorFromNormalized(normalized);

/// See [RaylibCoreFlat.ColorToHSV].
Vector3 ColorToHSV(
  Color color,
) => _module.ColorToHSV(color);

/// See [RaylibCoreFlat.ColorFromHSV].
Color ColorFromHSV(
  double hue,
  double saturation,
  double value,
) => _module.ColorFromHSV(hue, saturation, value);

/// See [RaylibCoreFlat.ColorTint].
Color ColorTint(
  Color color,
  Color tint,
) => _module.ColorTint(color, tint);

/// See [RaylibCoreFlat.ColorBrightness].
Color ColorBrightness(
  Color color,
  double factor,
) => _module.ColorBrightness(color, factor);

/// See [RaylibCoreFlat.ColorContrast].
Color ColorContrast(
  Color color,
  double contrast,
) => _module.ColorContrast(color, contrast);

/// See [RaylibCoreFlat.ColorAlpha].
Color ColorAlpha(
  Color color,
  double alpha,
) => _module.ColorAlpha(color, alpha);

/// See [RaylibCoreFlat.ColorAlphaBlend].
Color ColorAlphaBlend(
  Color dst,
  Color src,
  Color tint,
) => _module.ColorAlphaBlend(dst, src, tint);

/// See [RaylibCoreFlat.ColorLerp].
Color ColorLerp(
  Color color1,
  Color color2,
  double factor,
) => _module.ColorLerp(color1, color2, factor);

/// See [RaylibCoreFlat.GetColor].
Color GetColor(
  int hexValue,
) => _module.GetColor(hexValue);

/// See [RaylibCoreFlat.GetPixelColor].
Color GetPixelColor(
  MemoryPointer<RVoid> srcPtr,
  int format,
) => _module.GetPixelColor(srcPtr, format);

/// See [RaylibCoreFlat.SetPixelColor].
void SetPixelColor(
  MemoryPointer<RVoid> dstPtr,
  Color color,
  int format,
) => _module.SetPixelColor(dstPtr, color, format);

/// See [RaylibCoreFlat.GetPixelDataSize].
int GetPixelDataSize(
  int width,
  int height,
  int format,
) => _module.GetPixelDataSize(width, height, format);

/// See [RaylibCoreFlat.GetFontDefault].
Font GetFontDefault() => _module.GetFontDefault();

/// See [RaylibCoreFlat.LoadFont].
Font LoadFont(
  MemoryPointer<RChar> fileName,
) => _module.LoadFont(fileName);

/// See [RaylibCoreFlat.LoadFontEx].
Font LoadFontEx(
  MemoryPointer<RChar> fileName,
  int fontSize,
  MemoryPointer<RInt> codepoints,
  int codepointCount,
) => _module.LoadFontEx(fileName, fontSize, codepoints, codepointCount);

/// See [RaylibCoreFlat.LoadFontFromImage].
Font LoadFontFromImage(
  Image image,
  Color key,
  int firstChar,
) => _module.LoadFontFromImage(image, key, firstChar);

/// See [RaylibCoreFlat.LoadFontFromMemory].
Font LoadFontFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
  int fontSize,
  MemoryPointer<RInt> codepoints,
  int codepointCount,
) => _module.LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount);

/// See [RaylibCoreFlat.IsFontValid].
bool IsFontValid(
  Font font,
) => _module.IsFontValid(font);

/// See [RaylibCoreFlat.LoadFontData].
StructPointer<GlyphInfo> LoadFontData(
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
  int fontSize,
  MemoryPointer<RInt> codepoints,
  int codepointCount,
  int type,
  MemoryPointer<RInt> glyphCount,
) => _module.LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type, glyphCount);

/// See [RaylibCoreFlat.GenImageFontAtlas].
Image GenImageFontAtlas(
  StructPointer<GlyphInfo> glyphs,
  MemoryPointer<RPointer<RStruct>> glyphRecs, // RectangleD
  int glyphCount,
  int fontSize,
  int padding,
  int packMethod,
) => _module.GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod);

/// See [RaylibCoreFlat.UnloadFontData].
void UnloadFontData(
  StructPointer<GlyphInfo> glyphs,
  int glyphCount,
) => _module.UnloadFontData(glyphs, glyphCount);

/// See [RaylibCoreFlat.UnloadFont].
void UnloadFont(
  Font font,
) => _module.UnloadFont(font);

/// See [RaylibCoreFlat.ExportFontAsCode].
bool ExportFontAsCode(
  Font font,
  MemoryPointer<RChar> fileName,
) => _module.ExportFontAsCode(font, fileName);

/// See [RaylibCoreFlat.DrawFPS].
void DrawFPS(
  int posX,
  int posY,
) => _module.DrawFPS(posX, posY);

/// See [RaylibCoreFlat.DrawText].
void DrawText(
  MemoryPointer<RChar> text,
  int posX,
  int posY,
  int fontSize,
  Color color,
) => _module.DrawText(text, posX, posY, fontSize, color);

/// See [RaylibCoreFlat.DrawTextEx].
void DrawTextEx(
  Font font,
  MemoryPointer<RChar> text,
  Vector2 position,
  double fontSize,
  double spacing,
  Color tint,
) => _module.DrawTextEx(font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreFlat.DrawTextPro].
void DrawTextPro(
  Font font,
  MemoryPointer<RChar> text,
  Vector2 position,
  Vector2 origin,
  double rotation,
  double fontSize,
  double spacing,
  Color tint,
) => _module.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint);

/// See [RaylibCoreFlat.DrawTextCodepoint].
void DrawTextCodepoint(
  Font font,
  int codepoint,
  Vector2 position,
  double fontSize,
  Color tint,
) => _module.DrawTextCodepoint(font, codepoint, position, fontSize, tint);

/// See [RaylibCoreFlat.DrawTextCodepoints].
void DrawTextCodepoints(
  Font font,
  MemoryPointer<RInt> codepoints,
  int codepointCount,
  Vector2 position,
  double fontSize,
  double spacing,
  Color tint,
) => _module.DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint);

/// See [RaylibCoreFlat.SetTextLineSpacing].
void SetTextLineSpacing(
  int spacing,
) => _module.SetTextLineSpacing(spacing);

/// See [RaylibCoreFlat.MeasureText].
int MeasureText(
  MemoryPointer<RChar> text,
  int fontSize,
) => _module.MeasureText(text, fontSize);

/// See [RaylibCoreFlat.MeasureTextEx].
Vector2 MeasureTextEx(
  Font font,
  MemoryPointer<RChar> text,
  double fontSize,
  double spacing,
) => _module.MeasureTextEx(font, text, fontSize, spacing);

/// See [RaylibCoreFlat.MeasureTextCodepoints].
Vector2 MeasureTextCodepoints(
  Font font,
  MemoryPointer<RInt> codepoints,
  int length,
  double fontSize,
  double spacing,
) => _module.MeasureTextCodepoints(font, codepoints, length, fontSize, spacing);

/// See [RaylibCoreFlat.GetGlyphIndex].
int GetGlyphIndex(
  Font font,
  int codepoint,
) => _module.GetGlyphIndex(font, codepoint);

/// See [RaylibCoreFlat.GetGlyphInfo].
GlyphInfo GetGlyphInfo(
  Font font,
  int codepoint,
) => _module.GetGlyphInfo(font, codepoint);

/// See [RaylibCoreFlat.GetGlyphAtlasRec].
Rectangle GetGlyphAtlasRec(
  Font font,
  int codepoint,
) => _module.GetGlyphAtlasRec(font, codepoint);

/// See [RaylibCoreFlat.LoadUTF8].
MemoryPointer<RChar> LoadUTF8(
  MemoryPointer<RInt> codepoints,
  int length,
) => _module.LoadUTF8(codepoints, length);

/// See [RaylibCoreFlat.UnloadUTF8].
void UnloadUTF8(
  MemoryPointer<RChar> text,
) => _module.UnloadUTF8(text);

/// See [RaylibCoreFlat.LoadCodepoints].
MemoryPointer<RInt> LoadCodepoints(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> count,
) => _module.LoadCodepoints(text, count);

/// See [RaylibCoreFlat.UnloadCodepoints].
void UnloadCodepoints(
  MemoryPointer<RInt> codepoints,
) => _module.UnloadCodepoints(codepoints);

/// See [RaylibCoreFlat.GetCodepointCount].
int GetCodepointCount(
  MemoryPointer<RChar> text,
) => _module.GetCodepointCount(text);

/// See [RaylibCoreFlat.GetCodepoint].
int GetCodepoint(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> codepointSize,
) => _module.GetCodepoint(text, codepointSize);

/// See [RaylibCoreFlat.GetCodepointNext].
int GetCodepointNext(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> codepointSize,
) => _module.GetCodepointNext(text, codepointSize);

/// See [RaylibCoreFlat.GetCodepointPrevious].
int GetCodepointPrevious(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> codepointSize,
) => _module.GetCodepointPrevious(text, codepointSize);

/// See [RaylibCoreFlat.CodepointToUTF8].
MemoryPointer<RChar> CodepointToUTF8(
  int codepoint,
  MemoryPointer<RInt> utf8Size,
) => _module.CodepointToUTF8(codepoint, utf8Size);

/// See [RaylibCoreFlat.LoadTextLines].
MemoryPointer<RPointer<RChar>> LoadTextLines(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> count,
) => _module.LoadTextLines(text, count);

/// See [RaylibCoreFlat.UnloadTextLines].
void UnloadTextLines(
  MemoryPointer<RPointer<RChar>> text,
  int lineCount,
) => _module.UnloadTextLines(text, lineCount);

/// See [RaylibCoreFlat.TextCopy].
int TextCopy(
  MemoryPointer<RChar> dst,
  MemoryPointer<RChar> src,
) => _module.TextCopy(dst, src);

/// See [RaylibCoreFlat.TextIsEqual].
bool TextIsEqual(
  MemoryPointer<RChar> text1,
  MemoryPointer<RChar> text2,
) => _module.TextIsEqual(text1, text2);

/// See [RaylibCoreFlat.TextLength].
int TextLength(
  MemoryPointer<RChar> text,
) => _module.TextLength(text);

/// See [RaylibCoreFlat.TextFormat].
@Deprecated('va_list is not supported')
MemoryPointer<RChar> TextFormat(
  MemoryPointer<RChar> text,
) => _module.TextFormat(text);

/// See [RaylibCoreFlat.TextSubtext].
MemoryPointer<RChar> TextSubtext(
  MemoryPointer<RChar> text,
  int position,
  int length,
) => _module.TextSubtext(text, position, length);

/// See [RaylibCoreFlat.TextRemoveSpaces].
MemoryPointer<RChar> TextRemoveSpaces(
  MemoryPointer<RChar> text,
) => _module.TextRemoveSpaces(text);

/// See [RaylibCoreFlat.GetTextBetween].
MemoryPointer<RChar> GetTextBetween(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> begin,
  MemoryPointer<RChar> end,
) => _module.GetTextBetween(text, begin, end);

/// See [RaylibCoreFlat.TextReplace].
MemoryPointer<RChar> TextReplace(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> replace,
  MemoryPointer<RChar> by,
) => _module.TextReplace(text, replace, by);

/// See [RaylibCoreFlat.TextReplaceAlloc].
MemoryPointer<RChar> TextReplaceAlloc(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> replace,
  MemoryPointer<RChar> by,
) => _module.TextReplaceAlloc(text, replace, by);

/// See [RaylibCoreFlat.TextReplaceBetween].
MemoryPointer<RChar> TextReplaceBetween(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> begin,
  MemoryPointer<RChar> end,
  MemoryPointer<RChar> replacement,
) => _module.TextReplaceBetween(text, begin, end, replacement);

/// See [RaylibCoreFlat.TextReplaceBetweenAlloc].
MemoryPointer<RChar> TextReplaceBetweenAlloc(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> begin,
  MemoryPointer<RChar> end,
  MemoryPointer<RChar> replacement,
) => _module.TextReplaceBetweenAlloc(text, begin, end, replacement);

/// See [RaylibCoreFlat.TextInsert].
MemoryPointer<RChar> TextInsert(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> insert,
  int position,
) => _module.TextInsert(text, insert, position);

/// See [RaylibCoreFlat.TextInsertAlloc].
MemoryPointer<RChar> TextInsertAlloc(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> insert,
  int position,
) => _module.TextInsertAlloc(text, insert, position);

/// See [RaylibCoreFlat.TextJoin].
MemoryPointer<RChar> TextJoin(
  MemoryPointer<RPointer<RChar>> textList,
  int count,
  MemoryPointer<RChar> delimiter,
) => _module.TextJoin(textList, count, delimiter);

/// See [RaylibCoreFlat.TextSplit].
MemoryPointer<RPointer<RChar>> TextSplit(
  MemoryPointer<RChar> text,
  int delimiter,
  MemoryPointer<RInt> count,
) => _module.TextSplit(text, delimiter, count);

/// See [RaylibCoreFlat.TextAppend].
void TextAppend(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> append,
  MemoryPointer<RInt> position,
) => _module.TextAppend(text, append, position);

/// See [RaylibCoreFlat.TextFindIndex].
int TextFindIndex(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> find,
) => _module.TextFindIndex(text, find);

/// See [RaylibCoreFlat.TextToUpper].
MemoryPointer<RChar> TextToUpper(
  MemoryPointer<RChar> text,
) => _module.TextToUpper(text);

/// See [RaylibCoreFlat.TextToLower].
MemoryPointer<RChar> TextToLower(
  MemoryPointer<RChar> text,
) => _module.TextToLower(text);

/// See [RaylibCoreFlat.TextToPascal].
MemoryPointer<RChar> TextToPascal(
  MemoryPointer<RChar> text,
) => _module.TextToPascal(text);

/// See [RaylibCoreFlat.TextToSnake].
MemoryPointer<RChar> TextToSnake(
  MemoryPointer<RChar> text,
) => _module.TextToSnake(text);

/// See [RaylibCoreFlat.TextToCamel].
MemoryPointer<RChar> TextToCamel(
  MemoryPointer<RChar> text,
) => _module.TextToCamel(text);

/// See [RaylibCoreFlat.TextToInteger].
int TextToInteger(
  MemoryPointer<RChar> text,
) => _module.TextToInteger(text);

/// See [RaylibCoreFlat.TextToFloat].
double TextToFloat(
  MemoryPointer<RChar> text,
) => _module.TextToFloat(text);

/// See [RaylibCoreFlat.DrawLine3D].
void DrawLine3D(
  Vector3 startPos,
  Vector3 endPos,
  Color color,
) => _module.DrawLine3D(startPos, endPos, color);

/// See [RaylibCoreFlat.DrawPoint3D].
void DrawPoint3D(
  Vector3 position,
  Color color,
) => _module.DrawPoint3D(position, color);

/// See [RaylibCoreFlat.DrawCircle3D].
void DrawCircle3D(
  Vector3 center,
  double radius,
  Vector3 rotationAxis,
  double rotationAngle,
  Color color,
) => _module.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color);

/// See [RaylibCoreFlat.DrawTriangle3D].
void DrawTriangle3D(
  Vector3 v1,
  Vector3 v2,
  Vector3 v3,
  Color color,
) => _module.DrawTriangle3D(v1, v2, v3, color);

/// See [RaylibCoreFlat.DrawTriangleStrip3D].
void DrawTriangleStrip3D(
  StructPointer<Vector3> points,
  int pointCount,
  Color color,
) => _module.DrawTriangleStrip3D(points, pointCount, color);

/// See [RaylibCoreFlat.DrawCube].
void DrawCube(
  Vector3 position,
  double width,
  double height,
  double length,
  Color color,
) => _module.DrawCube(position, width, height, length, color);

/// See [RaylibCoreFlat.DrawCubeV].
void DrawCubeV(
  Vector3 position,
  Vector3 size,
  Color color,
) => _module.DrawCubeV(position, size, color);

/// See [RaylibCoreFlat.DrawCubeWires].
void DrawCubeWires(
  Vector3 position,
  double width,
  double height,
  double length,
  Color color,
) => _module.DrawCubeWires(position, width, height, length, color);

/// See [RaylibCoreFlat.DrawCubeWiresV].
void DrawCubeWiresV(
  Vector3 position,
  Vector3 size,
  Color color,
) => _module.DrawCubeWiresV(position, size, color);

/// See [RaylibCoreFlat.DrawSphere].
void DrawSphere(
  Vector3 centerPos,
  double radius,
  Color color,
) => _module.DrawSphere(centerPos, radius, color);

/// See [RaylibCoreFlat.DrawSphereEx].
void DrawSphereEx(
  Vector3 centerPos,
  double radius,
  int rings,
  int slices,
  Color color,
) => _module.DrawSphereEx(centerPos, radius, rings, slices, color);

/// See [RaylibCoreFlat.DrawSphereWires].
void DrawSphereWires(
  Vector3 centerPos,
  double radius,
  int rings,
  int slices,
  Color color,
) => _module.DrawSphereWires(centerPos, radius, rings, slices, color);

/// See [RaylibCoreFlat.DrawCylinder].
void DrawCylinder(
  Vector3 position,
  double radiusTop,
  double radiusBottom,
  double height,
  int slices,
  Color color,
) => _module.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreFlat.DrawCylinderEx].
void DrawCylinderEx(
  Vector3 startPos,
  Vector3 endPos,
  double startRadius,
  double endRadius,
  int sides,
  Color color,
) => _module.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreFlat.DrawCylinderWires].
void DrawCylinderWires(
  Vector3 position,
  double radiusTop,
  double radiusBottom,
  double height,
  int slices,
  Color color,
) => _module.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreFlat.DrawCylinderWiresEx].
void DrawCylinderWiresEx(
  Vector3 startPos,
  Vector3 endPos,
  double startRadius,
  double endRadius,
  int sides,
  Color color,
) => _module.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreFlat.DrawCapsule].
void DrawCapsule(
  Vector3 startPos,
  Vector3 endPos,
  double radius,
  int slices,
  int rings,
  Color color,
) => _module.DrawCapsule(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreFlat.DrawCapsuleWires].
void DrawCapsuleWires(
  Vector3 startPos,
  Vector3 endPos,
  double radius,
  int slices,
  int rings,
  Color color,
) => _module.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreFlat.DrawPlane].
void DrawPlane(
  Vector3 centerPos,
  Vector2 size,
  Color color,
) => _module.DrawPlane(centerPos, size, color);

/// See [RaylibCoreFlat.DrawRay].
void DrawRay(
  Ray ray,
  Color color,
) => _module.DrawRay(ray, color);

/// See [RaylibCoreFlat.DrawGrid].
void DrawGrid(
  int slices,
  double spacing,
) => _module.DrawGrid(slices, spacing);

/// See [RaylibCoreFlat.LoadModel].
Model LoadModel(
  MemoryPointer<RChar> fileName,
) => _module.LoadModel(fileName);

/// See [RaylibCoreFlat.LoadModelFromMesh].
Model LoadModelFromMesh(
  Mesh mesh,
) => _module.LoadModelFromMesh(mesh);

/// See [RaylibCoreFlat.IsModelValid].
bool IsModelValid(
  Model model,
) => _module.IsModelValid(model);

/// See [RaylibCoreFlat.UnloadModel].
void UnloadModel(
  Model model,
) => _module.UnloadModel(model);

/// See [RaylibCoreFlat.GetModelBoundingBox].
BoundingBox GetModelBoundingBox(
  Model model,
) => _module.GetModelBoundingBox(model);

/// See [RaylibCoreFlat.DrawModel].
void DrawModel(
  Model model,
  Vector3 position,
  double scale,
  Color tint,
) => _module.DrawModel(model, position, scale, tint);

/// See [RaylibCoreFlat.DrawModelEx].
void DrawModelEx(
  Model model,
  Vector3 position,
  Vector3 rotationAxis,
  double rotationAngle,
  Vector3 scale,
  Color tint,
) => _module.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreFlat.DrawModelWires].
void DrawModelWires(
  Model model,
  Vector3 position,
  double scale,
  Color tint,
) => _module.DrawModelWires(model, position, scale, tint);

/// See [RaylibCoreFlat.DrawModelWiresEx].
void DrawModelWiresEx(
  Model model,
  Vector3 position,
  Vector3 rotationAxis,
  double rotationAngle,
  Vector3 scale,
  Color tint,
) => _module.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreFlat.DrawBoundingBox].
void DrawBoundingBox(
  BoundingBox box,
  Color color,
) => _module.DrawBoundingBox(box, color);

/// See [RaylibCoreFlat.DrawBillboard].
void DrawBillboard(
  Camera3D camera,
  Texture texture,
  Vector3 position,
  double scale,
  Color tint,
) => _module.DrawBillboard(camera, texture, position, scale, tint);

/// See [RaylibCoreFlat.DrawBillboardRec].
void DrawBillboardRec(
  Camera3D camera,
  Texture texture,
  Rectangle source,
  Vector3 position,
  Vector2 size,
  Color tint,
) => _module.DrawBillboardRec(camera, texture, source, position, size, tint);

/// See [RaylibCoreFlat.DrawBillboardPro].
@Deprecated(
  "Broken by a dart:ffi bug: the trailing Color argument gets corrupted "
  "(or crashes) once the preceding float-only args exceed the CPU's 8 "
  "float registers. Use DrawBillboard/DrawBillboardRec, or wait for the fix. "
  "See dart-lang/sdk#63976."
)
void DrawBillboardPro(
  Camera3D camera,
  Texture texture,
  Rectangle source,
  Vector3 position,
  Vector3 up,
  Vector2 size,
  Vector2 origin,
  double rotation,
  Color tint,
) => _module.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint);

/// See [RaylibCoreFlat.UploadMesh].
void UploadMesh(
  StructPointer<Mesh> mesh,
  bool dynamic,
) => _module.UploadMesh(mesh, dynamic);

/// See [RaylibCoreFlat.UpdateMeshBuffer].
void UpdateMeshBuffer(
  Mesh mesh,
  int index,
  MemoryPointer<RVoid> data,
  int dataSize,
  int offset,
) => _module.UpdateMeshBuffer(mesh, index, data, dataSize, offset);

/// See [RaylibCoreFlat.UnloadMesh].
void UnloadMesh(
  Mesh mesh,
) => _module.UnloadMesh(mesh);

/// See [RaylibCoreFlat.DrawMesh].
void DrawMesh(
  Mesh mesh,
  Material material,
  Matrix transform,
) => _module.DrawMesh(mesh, material, transform);

/// See [RaylibCoreFlat.DrawMeshInstanced].
void DrawMeshInstanced(
  Mesh mesh,
  Material material,
  StructPointer<Matrix> transforms,
  int instances,
) => _module.DrawMeshInstanced(mesh, material, transforms, instances);

/// See [RaylibCoreFlat.GetMeshBoundingBox].
BoundingBox GetMeshBoundingBox(
  Mesh mesh,
) => _module.GetMeshBoundingBox(mesh);

/// See [RaylibCoreFlat.GenMeshTangents].
void GenMeshTangents(
  StructPointer<Mesh> mesh,
) => _module.GenMeshTangents(mesh);

/// See [RaylibCoreFlat.ExportMesh].
bool ExportMesh(
  Mesh mesh,
  MemoryPointer<RChar> fileName,
) => _module.ExportMesh(mesh, fileName);

/// See [RaylibCoreFlat.ExportMeshAsCode].
bool ExportMeshAsCode(
  Mesh mesh,
  MemoryPointer<RChar> fileName,
) => _module.ExportMeshAsCode(mesh, fileName);

/// See [RaylibCoreFlat.GenMeshPoly].
Mesh GenMeshPoly(
  int sides,
  double radius,
) => _module.GenMeshPoly(sides, radius);

/// See [RaylibCoreFlat.GenMeshPlane].
Mesh GenMeshPlane(
  double width,
  double length,
  int resX,
  int resZ,
) => _module.GenMeshPlane(width, length, resX, resZ);

/// See [RaylibCoreFlat.GenMeshCube].
Mesh GenMeshCube(
  double width,
  double height,
  double length,
) => _module.GenMeshCube(width, height, length);

/// See [RaylibCoreFlat.GenMeshSphere].
Mesh GenMeshSphere(
  double radius,
  int rings,
  int slices,
) => _module.GenMeshSphere(radius, rings, slices);

/// See [RaylibCoreFlat.GenMeshHemiSphere].
Mesh GenMeshHemiSphere(
  double radius,
  int rings,
  int slices,
) => _module.GenMeshHemiSphere(radius, rings, slices);

/// See [RaylibCoreFlat.GenMeshCylinder].
Mesh GenMeshCylinder(
  double radius,
  double height,
  int slices,
) => _module.GenMeshCylinder(radius, height, slices);

/// See [RaylibCoreFlat.GenMeshCone].
Mesh GenMeshCone(
  double radius,
  double height,
  int slices,
) => _module.GenMeshCone(radius, height, slices);

/// See [RaylibCoreFlat.GenMeshTorus].
Mesh GenMeshTorus(
  double radius,
  double size,
  int radSeg,
  int sides,
) => _module.GenMeshTorus(radius, size, radSeg, sides);

/// See [RaylibCoreFlat.GenMeshKnot].
Mesh GenMeshKnot(
  double radius,
  double size,
  int radSeg,
  int sides,
) => _module.GenMeshKnot(radius, size, radSeg, sides);

/// See [RaylibCoreFlat.GenMeshHeightmap].
Mesh GenMeshHeightmap(
  Image heightmap,
  Vector3 size,
) => _module.GenMeshHeightmap(heightmap, size);

/// See [RaylibCoreFlat.GenMeshCubicmap].
Mesh GenMeshCubicmap(
  Image cubicmap,
  Vector3 cubeSize,
) => _module.GenMeshCubicmap(cubicmap, cubeSize);

/// See [RaylibCoreFlat.LoadMaterials].
StructPointer<Material> LoadMaterials(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RInt> materialCount,
) => _module.LoadMaterials(fileName, materialCount);

/// See [RaylibCoreFlat.LoadMaterialDefault].
Material LoadMaterialDefault() => _module.LoadMaterialDefault();

/// See [RaylibCoreFlat.IsMaterialValid].
bool IsMaterialValid(
  Material material,
) => _module.IsMaterialValid(material);

/// See [RaylibCoreFlat.UnloadMaterial].
void UnloadMaterial(
  Material material,
) => _module.UnloadMaterial(material);

/// See [RaylibCoreFlat.SetMaterialTexture].
void SetMaterialTexture(
  StructPointer<Material> material,
  int mapType,
  Texture texture,
) => _module.SetMaterialTexture(material, mapType, texture);

/// See [RaylibCoreFlat.SetModelMeshMaterial].
void SetModelMeshMaterial(
  StructPointer<Model> model,
  int meshId,
  int materialId,
) => _module.SetModelMeshMaterial(model, meshId, materialId);

/// See [RaylibCoreFlat.LoadModelAnimations].
StructPointer<ModelAnimation> LoadModelAnimations(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RInt> animCount,
) => _module.LoadModelAnimations(fileName, animCount);

/// See [RaylibCoreFlat.UpdateModelAnimation].
void UpdateModelAnimation(
  Model model,
  ModelAnimation anim,
  double frame,
) => _module.UpdateModelAnimation(model, anim, frame);

/// See [RaylibCoreFlat.UpdateModelAnimationEx].
void UpdateModelAnimationEx(
  Model model,
  ModelAnimation animA,
  double frameA,
  ModelAnimation animB,
  double frameB,
  double blend,
) => _module.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend);

/// See [RaylibCoreFlat.UnloadModelAnimations].
void UnloadModelAnimations(
  StructPointer<ModelAnimation> animations,
  int animCount,
) => _module.UnloadModelAnimations(animations, animCount);

/// See [RaylibCoreFlat.IsModelAnimationValid].
bool IsModelAnimationValid(
  Model model,
  ModelAnimation anim,
) => _module.IsModelAnimationValid(model, anim);

/// See [RaylibCoreFlat.CheckCollisionSpheres].
bool CheckCollisionSpheres(
  Vector3 center1,
  double radius1,
  Vector3 center2,
  double radius2,
) => _module.CheckCollisionSpheres(center1, radius1, center2, radius2);

/// See [RaylibCoreFlat.CheckCollisionBoxes].
bool CheckCollisionBoxes(
  BoundingBox box1,
  BoundingBox box2,
) => _module.CheckCollisionBoxes(box1, box2);

/// See [RaylibCoreFlat.CheckCollisionBoxSphere].
bool CheckCollisionBoxSphere(
  BoundingBox box,
  Vector3 center,
  double radius,
) => _module.CheckCollisionBoxSphere(box, center, radius);

/// See [RaylibCoreFlat.GetRayCollisionSphere].
RayCollision GetRayCollisionSphere(
  Ray ray,
  Vector3 center,
  double radius,
) => _module.GetRayCollisionSphere(ray, center, radius);

/// See [RaylibCoreFlat.GetRayCollisionBox].
RayCollision GetRayCollisionBox(
  Ray ray,
  BoundingBox box,
) => _module.GetRayCollisionBox(ray, box);

/// See [RaylibCoreFlat.GetRayCollisionMesh].
RayCollision GetRayCollisionMesh(
  Ray ray,
  Mesh mesh,
  Matrix transform,
) => _module.GetRayCollisionMesh(ray, mesh, transform);

/// See [RaylibCoreFlat.GetRayCollisionTriangle].
RayCollision GetRayCollisionTriangle(
  Ray ray,
  Vector3 p1,
  Vector3 p2,
  Vector3 p3,
) => _module.GetRayCollisionTriangle(ray, p1, p2, p3);

/// See [RaylibCoreFlat.GetRayCollisionQuad].
RayCollision GetRayCollisionQuad(
  Ray ray,
  Vector3 p1,
  Vector3 p2,
  Vector3 p3,
  Vector3 p4,
) => _module.GetRayCollisionQuad(ray, p1, p2, p3, p4);
