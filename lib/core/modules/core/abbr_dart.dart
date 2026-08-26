import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibCoreModule get _module => RaylibBase.instance.CoreDart;

/// See [RaylibCoreModule.InitWindow].
void InitWindow(
  num width,
  num height,
  String title,
) => _module.InitWindow(width, height, title);

/// See [RaylibCoreModule.CloseWindow].
void CloseWindow() => _module.CloseWindow();

/// See [RaylibCoreModule.WindowShouldClose].
bool WindowShouldClose() => _module.WindowShouldClose();

/// See [RaylibCoreModule.IsWindowReady].
bool IsWindowReady() => _module.IsWindowReady();

/// See [RaylibCoreModule.IsWindowFullscreen].
bool IsWindowFullscreen() => _module.IsWindowFullscreen();

/// See [RaylibCoreModule.IsWindowHidden].
bool IsWindowHidden() => _module.IsWindowHidden();

/// See [RaylibCoreModule.IsWindowMinimized].
bool IsWindowMinimized() => _module.IsWindowMinimized();

/// See [RaylibCoreModule.IsWindowMaximized].
bool IsWindowMaximized() => _module.IsWindowMaximized();

/// See [RaylibCoreModule.IsWindowFocused].
bool IsWindowFocused() => _module.IsWindowFocused();

/// See [RaylibCoreModule.IsWindowResized].
bool IsWindowResized() => _module.IsWindowResized();

/// See [RaylibCoreModule.IsWindowState].
bool IsWindowState(
  ConfigFlags flag,
) => _module.IsWindowState(flag);

/// See [RaylibCoreModule.SetWindowState].
void SetWindowState(
  Iterable<ConfigFlags> flags,
) => _module.SetWindowState(flags);

/// See [RaylibCoreModule.ClearWindowState].
void ClearWindowState(
  Iterable<ConfigFlags> flags,
) => _module.ClearWindowState(flags);

/// See [RaylibCoreModule.ToggleFullscreen].
void ToggleFullscreen() => _module.ToggleFullscreen();

/// See [RaylibCoreModule.ToggleBorderlessWindowed].
void ToggleBorderlessWindowed() => _module.ToggleBorderlessWindowed();

/// See [RaylibCoreModule.MaximizeWindow].
void MaximizeWindow() => _module.MaximizeWindow();

/// See [RaylibCoreModule.MinimizeWindow].
void MinimizeWindow() => _module.MinimizeWindow();

/// See [RaylibCoreModule.RestoreWindow].
void RestoreWindow() => _module.RestoreWindow();

/// See [RaylibCoreModule.SetWindowIcon].
void SetWindowIcon(
  ImageD image,
) => _module.SetWindowIcon(image);

/// See [RaylibCoreModule.SetWindowIcons].
void SetWindowIcons(
  List<ImageD> images,
) => _module.SetWindowIcons(images);

/// See [RaylibCoreModule.SetWindowTitle].
void SetWindowTitle(
  String title,
) => _module.SetWindowTitle(title);

/// See [RaylibCoreModule.SetWindowPosition].
void SetWindowPosition(
  num x,
  num y,
) => _module.SetWindowPosition(x, y);

/// See [RaylibCoreModule.SetWindowMonitor].
void SetWindowMonitor(
  num monitor,
) => _module.SetWindowMonitor(monitor);

/// See [RaylibCoreModule.SetWindowMinSize].
void SetWindowMinSize(
  num width,
  num height,
) => _module.SetWindowMinSize(width, height);

/// See [RaylibCoreModule.SetWindowMaxSize].
void SetWindowMaxSize(
  num width,
  num height,
) => _module.SetWindowMaxSize(width, height);

/// See [RaylibCoreModule.SetWindowSize].
void SetWindowSize(
  num width,
  num height,
) => _module.SetWindowSize(width, height);

/// See [RaylibCoreModule.SetWindowOpacity].
void SetWindowOpacity(
  num opacity,
) => _module.SetWindowOpacity(opacity);

/// See [RaylibCoreModule.SetWindowFocused].
void SetWindowFocused() => _module.SetWindowFocused();

/// See [RaylibCoreModule.GetScreenWidth].
int GetScreenWidth() => _module.GetScreenWidth();

/// See [RaylibCoreModule.GetScreenHeight].
int GetScreenHeight() => _module.GetScreenHeight();

/// See [RaylibCoreModule.GetRenderWidth].
int GetRenderWidth() => _module.GetRenderWidth();

/// See [RaylibCoreModule.GetRenderHeight].
int GetRenderHeight() => _module.GetRenderHeight();

/// See [RaylibCoreModule.GetMonitorCount].
int GetMonitorCount() => _module.GetMonitorCount();

/// See [RaylibCoreModule.GetCurrentMonitor].
int GetCurrentMonitor() => _module.GetCurrentMonitor();

/// See [RaylibCoreModule.GetMonitorPosition].
Vector2D GetMonitorPosition(
  num monitor,
) => _module.GetMonitorPosition(monitor);

/// See [RaylibCoreModule.GetMonitorWidth].
int GetMonitorWidth(
  num monitor,
) => _module.GetMonitorWidth(monitor);

/// See [RaylibCoreModule.GetMonitorHeight].
int GetMonitorHeight(
  num monitor,
) => _module.GetMonitorHeight(monitor);

/// See [RaylibCoreModule.GetMonitorPhysicalWidth].
int GetMonitorPhysicalWidth(
  num monitor,
) => _module.GetMonitorPhysicalWidth(monitor);

/// See [RaylibCoreModule.GetMonitorPhysicalHeight].
int GetMonitorPhysicalHeight(
  num monitor,
) => _module.GetMonitorPhysicalHeight(monitor);

/// See [RaylibCoreModule.GetMonitorRefreshRate].
int GetMonitorRefreshRate(
  num monitor,
) => _module.GetMonitorRefreshRate(monitor);

/// See [RaylibCoreModule.GetWindowPosition].
Vector2D GetWindowPosition() => _module.GetWindowPosition();

/// See [RaylibCoreModule.GetWindowScaleDPI].
Vector2D GetWindowScaleDPI() => _module.GetWindowScaleDPI();

/// See [RaylibCoreModule.GetMonitorName].
String GetMonitorName(
  num monitor,
) => _module.GetMonitorName(monitor);

/// See [RaylibCoreModule.SetClipboardText].
void SetClipboardText(
  String text,
) => _module.SetClipboardText(text);

/// See [RaylibCoreModule.GetClipboardText].
String GetClipboardText() => _module.GetClipboardText();

/// See [RaylibCoreModule.GetClipboardImage].
ImageD GetClipboardImage() => _module.GetClipboardImage();

/// See [RaylibCoreModule.EnableEventWaiting].
void EnableEventWaiting() => _module.EnableEventWaiting();

/// See [RaylibCoreModule.DisableEventWaiting].
void DisableEventWaiting() => _module.DisableEventWaiting();

/// See [RaylibCoreModule.ShowCursor].
void ShowCursor() => _module.ShowCursor();

/// See [RaylibCoreModule.HideCursor].
void HideCursor() => _module.HideCursor();

/// See [RaylibCoreModule.IsCursorHidden].
bool IsCursorHidden() => _module.IsCursorHidden();

/// See [RaylibCoreModule.EnableCursor].
void EnableCursor() => _module.EnableCursor();

/// See [RaylibCoreModule.DisableCursor].
void DisableCursor() => _module.DisableCursor();

/// See [RaylibCoreModule.IsCursorOnScreen].
bool IsCursorOnScreen() => _module.IsCursorOnScreen();

/// See [RaylibCoreModule.ClearBackground].
void ClearBackground(
  ColorD color,
) => _module.ClearBackground(color);

/// See [RaylibCoreModule.BeginDrawing].
void BeginDrawing() => _module.BeginDrawing();

/// See [RaylibCoreModule.EndDrawing].
void EndDrawing() => _module.EndDrawing();

/// See [RaylibCoreModule.BeginMode2D].
void BeginMode2D(
  Camera2DD camera,
) => _module.BeginMode2D(camera);

/// See [RaylibCoreModule.EndMode2D].
void EndMode2D() => _module.EndMode2D();

/// See [RaylibCoreModule.BeginMode3D].
void BeginMode3D(
  Camera3DD camera,
) => _module.BeginMode3D(camera);

/// See [RaylibCoreModule.EndMode3D].
void EndMode3D() => _module.EndMode3D();

/// See [RaylibCoreModule.BeginTextureMode].
void BeginTextureMode(
  RenderTextureD target,
) => _module.BeginTextureMode(target);

/// See [RaylibCoreModule.EndTextureMode].
void EndTextureMode() => _module.EndTextureMode();

/// See [RaylibCoreModule.BeginShaderMode].
void BeginShaderMode(
  ShaderD shader,
) => _module.BeginShaderMode(shader);

/// See [RaylibCoreModule.EndShaderMode].
void EndShaderMode() => _module.EndShaderMode();

/// See [RaylibCoreModule.BeginBlendMode].
void BeginBlendMode(
  BlendMode mode,
) => _module.BeginBlendMode(mode);

/// See [RaylibCoreModule.EndBlendMode].
void EndBlendMode() => _module.EndBlendMode();

/// See [RaylibCoreModule.BeginScissorMode].
void BeginScissorMode(
  num x,
  num y,
  num width,
  num height,
) => _module.BeginScissorMode(x, y, width, height);

/// See [RaylibCoreModule.EndScissorMode].
void EndScissorMode() => _module.EndScissorMode();

/// See [RaylibCoreModule.BeginVrStereoMode].
void BeginVrStereoMode(
  VrStereoConfigD config,
) => _module.BeginVrStereoMode(config);

/// See [RaylibCoreModule.EndVrStereoMode].
void EndVrStereoMode() => _module.EndVrStereoMode();

/// See [RaylibCoreModule.LoadVrStereoConfig].
VrStereoConfigD LoadVrStereoConfig(
  VrDeviceInfoD device,
) => _module.LoadVrStereoConfig(device);

/// See [RaylibCoreModule.UnloadVrStereoConfig].
void UnloadVrStereoConfig(
  VrStereoConfigD config,
) => _module.UnloadVrStereoConfig(config);

/// See [RaylibCoreModule.LoadShader].
ShaderD LoadShader(
  String? vsFileName,
  String? fsFileName,
) => _module.LoadShader(vsFileName, fsFileName);

/// See [RaylibCoreModule.LoadShaderFromMemory].
ShaderD LoadShaderFromMemory(
  String? vsCode,
  String? fsCode,
) => _module.LoadShaderFromMemory(vsCode, fsCode);

/// See [RaylibCoreModule.IsShaderValid].
bool IsShaderValid(
  ShaderD shader,
) => _module.IsShaderValid(shader);

/// See [RaylibCoreModule.GetShaderLocation].
int GetShaderLocation(
  ShaderD shader,
  String uniformName,
) => _module.GetShaderLocation(shader, uniformName);

/// See [RaylibCoreModule.GetShaderLocationAttrib].
int GetShaderLocationAttrib(
  ShaderD shader,
  String attribName,
) => _module.GetShaderLocationAttrib(shader, attribName);

/// See [RaylibCoreModule.SetShaderValue].
void SetShaderValue(
  ShaderD shader,
  num locIndex,
  List<num> value,
  ShaderUniformDataType uniformType,
) => _module.SetShaderValue(shader, locIndex, value, uniformType);

/// See [RaylibCoreModule.SetShaderValueV].
void SetShaderValueV(
  ShaderD shader,
  num locIndex,
  List<num> value,
  ShaderUniformDataType uniformType,
  num count,
) => _module.SetShaderValueV(shader, locIndex, value, uniformType, count);

/// See [RaylibCoreModule.SetShaderValueMatrix].
void SetShaderValueMatrix(
  ShaderD shader,
  num locIndex,
  MatrixD mat,
) => _module.SetShaderValueMatrix(shader, locIndex, mat);

/// See [RaylibCoreModule.SetShaderValueTexture].
void SetShaderValueTexture(
  ShaderD shader,
  num locIndex,
  TextureD texture,
) => _module.SetShaderValueTexture(shader, locIndex, texture);

/// See [RaylibCoreModule.UnloadShader].
void UnloadShader(
  ShaderD shader,
) => _module.UnloadShader(shader);

/// See [RaylibCoreModule.GetScreenToWorldRay].
RayD GetScreenToWorldRay(
  Vector2D position,
  Camera3DD camera,
) => _module.GetScreenToWorldRay(position, camera);

/// See [RaylibCoreModule.GetScreenToWorldRayEx].
RayD GetScreenToWorldRayEx(
  Vector2D position,
  Camera3DD camera,
  num width,
  num height,
) => _module.GetScreenToWorldRayEx(position, camera, width, height);

/// See [RaylibCoreModule.GetWorldToScreen].
Vector2D GetWorldToScreen(
  Vector3D position,
  Camera3DD camera,
) => _module.GetWorldToScreen(position, camera);

/// See [RaylibCoreModule.GetWorldToScreenEx].
Vector2D GetWorldToScreenEx(
  Vector3D position,
  Camera3DD camera,
  num width,
  num height,
) => _module.GetWorldToScreenEx(position, camera, width, height);

/// See [RaylibCoreModule.GetWorldToScreen2D].
Vector2D GetWorldToScreen2D(
  Vector2D position,
  Camera2DD camera,
) => _module.GetWorldToScreen2D(position, camera);

/// See [RaylibCoreModule.GetScreenToWorld2D].
Vector2D GetScreenToWorld2D(
  Vector2D position,
  Camera2DD camera,
) => _module.GetScreenToWorld2D(position, camera);

/// See [RaylibCoreModule.GetCameraMatrix].
MatrixD GetCameraMatrix(
  Camera3DD camera,
) => _module.GetCameraMatrix(camera);

/// See [RaylibCoreModule.GetCameraMatrix2D].
MatrixD GetCameraMatrix2D(
  Camera2DD camera,
) => _module.GetCameraMatrix2D(camera);

/// See [RaylibCoreModule.SetTargetFPS].
void SetTargetFPS(
  num fps,
) => _module.SetTargetFPS(fps);

/// See [RaylibCoreModule.GetFrameTime].
double GetFrameTime() => _module.GetFrameTime();

/// See [RaylibCoreModule.GetTime].
double GetTime() => _module.GetTime();

/// See [RaylibCoreModule.GetFPS].
int GetFPS() => _module.GetFPS();

/// See [RaylibCoreModule.SwapScreenBuffer].
void SwapScreenBuffer() => _module.SwapScreenBuffer();

/// See [RaylibCoreModule.PollInputEvents].
void PollInputEvents() => _module.PollInputEvents();

/// See [RaylibCoreModule.WaitTime].
void WaitTime(
  num seconds,
) => _module.WaitTime(seconds);

/// See [RaylibCoreModule.SetRandomSeed].
void SetRandomSeed(
  num seed,
) => _module.SetRandomSeed(seed);

/// See [RaylibCoreModule.GetRandomValue].
int GetRandomValue(
  num min,
  num max,
) => _module.GetRandomValue(min, max);

/// See [RaylibCoreModule.LoadRandomSequence].
List<int> LoadRandomSequence(
  num count,
  num min,
  num max,
) => _module.LoadRandomSequence(count, min, max);

/// See [RaylibCoreModule.TakeScreenshot].
void TakeScreenshot(
  String fileName,
) => _module.TakeScreenshot(fileName);

/// See [RaylibCoreModule.SetConfigFlags].
void SetConfigFlags(
  Iterable<ConfigFlags> flags,
) => _module.SetConfigFlags(flags);

/// See [RaylibCoreModule.OpenURL].
void OpenURL(
  String url,
) => _module.OpenURL(url);

/// See [RaylibCoreModule.TraceLog].
void TraceLog(
  TraceLogLevel logLevel,
  String text,
) => _module.TraceLog(logLevel, text);

/// See [RaylibCoreModule.SetTraceLogLevel].
void SetTraceLogLevel(
  TraceLogLevel logLevel,
) => _module.SetTraceLogLevel(logLevel);

/// See [RaylibCoreModule.SetTraceLogCallback].
void SetTraceLogCallback(
  TraceLogCallbackBase callback,
) => _module.SetTraceLogCallback(callback);

/// See [RaylibCoreModule.SetLoadFileDataCallback].
void SetLoadFileDataCallback(
  LoadFileDataCallbackBase? callback
) => _module.SetLoadFileDataCallback(callback);

/// See [RaylibCoreModule.SetSaveFileDataCallback].
void SetSaveFileDataCallback(
  SaveFileDataCallbackBase? callback
) => _module.SetSaveFileDataCallback(callback);

/// See [RaylibCoreModule.SetLoadFileTextCallback].
void SetLoadFileTextCallback(
  LoadFileTextCallbackBase? callback
) => _module.SetLoadFileTextCallback(callback);

/// See [RaylibCoreModule.SetSaveFileTextCallback].
void SetSaveFileTextCallback(
  SaveFileTextCallbackBase? callback
) => _module.SetSaveFileTextCallback(callback);

/// See [RaylibCoreModule.LoadFileData].
Uint8List LoadFileData(
  String fileName,
) => _module.LoadFileData(fileName);

/// See [RaylibCoreModule.SaveFileData].
bool SaveFileData(
  String fileName,
  Uint8List data,
) => _module.SaveFileData(fileName, data);

/// See [RaylibCoreModule.ExportDataAsCode].
bool ExportDataAsCode(
  Uint8List data,
  String fileName,
) => _module.ExportDataAsCode(data, fileName);

/// See [RaylibCoreModule.LoadFileText].
String LoadFileText(
  String fileName,
) => _module.LoadFileText(fileName);

/// See [RaylibCoreModule.SaveFileText].
bool SaveFileText(
  String fileName,
  String text,
) => _module.SaveFileText(fileName, text);

/// See [RaylibCoreModule.FileRename].
int FileRename(
  String fileName,
  String fileRename,
) => _module.FileRename(fileName, fileRename);

/// See [RaylibCoreModule.FileRemove].
int FileRemove(
  String fileName,
) => _module.FileRemove(fileName);

/// See [RaylibCoreModule.FileCopy].
int FileCopy(
  String srcPath,
  String dstPath,
) => _module.FileCopy(srcPath, dstPath);

/// See [RaylibCoreModule.FileMove].
int FileMove(
  String srcPath,
  String dstPath,
) => _module.FileMove(srcPath, dstPath);

/// See [RaylibCoreModule.FileTextReplace].
int FileTextReplace(
  String fileName,
  String search,
  String replacement,
) => _module.FileTextReplace(fileName, search, replacement);

/// See [RaylibCoreModule.FileTextFindIndex].
int FileTextFindIndex(
  String fileName,
  String search,
) => _module.FileTextFindIndex(fileName, search);

/// See [RaylibCoreModule.FileExists].
bool FileExists(
  String fileName,
) => _module.FileExists(fileName);

/// See [RaylibCoreModule.DirectoryExists].
bool DirectoryExists(
  String dirPath,
) => _module.DirectoryExists(dirPath);

/// See [RaylibCoreModule.IsFileExtension].
bool IsFileExtension(
  String fileName,
  String ext,
) => _module.IsFileExtension(fileName, ext);

/// See [RaylibCoreModule.GetFileLength].
int GetFileLength(
  String fileName,
) => _module.GetFileLength(fileName);

/// See [RaylibCoreModule.GetFileExtension].
String GetFileExtension(
  String fileName,
) => _module.GetFileExtension(fileName);

/// See [RaylibCoreModule.GetFileName].
String GetFileName(
  String filePath,
) => _module.GetFileName(filePath);

/// See [RaylibCoreModule.GetFileNameWithoutExt].
String GetFileNameWithoutExt(
  String filePath,
) => _module.GetFileNameWithoutExt(filePath);

/// See [RaylibCoreModule.GetDirectoryFileCount].
int GetDirectoryFileCount(
  String dirPath, 
) => _module.GetDirectoryFileCount(dirPath);

/// See [RaylibCoreModule.GetDirectoryFileCountEx].
int GetDirectoryFileCountEx(
  String basePath,
  String filter,
  bool scanSubdirs,
) => _module.GetDirectoryFileCountEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreModule.GetDirectoryPath].
String GetDirectoryPath(
  String filePath,
) => _module.GetDirectoryPath(filePath);

/// See [RaylibCoreModule.GetPrevDirectoryPath].
String GetPrevDirectoryPath(
  String dirPath,
) => _module.GetPrevDirectoryPath(dirPath);

/// See [RaylibCoreModule.GetWorkingDirectory].
String GetWorkingDirectory() => _module.GetWorkingDirectory();

/// See [RaylibCoreModule.GetApplicationDirectory].
String GetApplicationDirectory() => _module.GetApplicationDirectory();

/// See [RaylibCoreModule.MakeDirectory].
int MakeDirectory(
  String dirPath,
) => _module.MakeDirectory(dirPath);

/// See [RaylibCoreModule.ChangeDirectory].
bool ChangeDirectory(
  String dir,
) => _module.ChangeDirectory(dir);

/// See [RaylibCoreModule.IsPathFile].
bool IsPathFile(
  String path,
) => _module.IsPathFile(path);

/// See [RaylibCoreModule.IsFileNameValid].
bool IsFileNameValid(
  String fileName,
) => _module.IsFileNameValid(fileName);

/// See [RaylibCoreModule.LoadDirectoryFiles].
FilePathListD LoadDirectoryFiles(
  String dirPath,
) => _module.LoadDirectoryFiles(dirPath);

/// See [RaylibCoreModule.LoadDirectoryFilesEx].
FilePathListD LoadDirectoryFilesEx(
  String basePath,
  String filter,
  bool scanSubdirs,
) => _module.LoadDirectoryFilesEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreModule.UnloadDirectoryFiles].
void UnloadDirectoryFiles(
  FilePathListD files,
) => _module.UnloadDirectoryFiles(files);

/// See [RaylibCoreModule.IsFileDropped].
bool IsFileDropped() => _module.IsFileDropped();

/// See [RaylibCoreModule.LoadDroppedFiles].
FilePathListD LoadDroppedFiles() => _module.LoadDroppedFiles();

/// See [RaylibCoreModule.UnloadDroppedFiles].
void UnloadDroppedFiles(
  FilePathListD files,
) => _module.UnloadDroppedFiles(files);

/// See [RaylibCoreModule.GetFileModTime].
int GetFileModTime(
  String fileName,
) => _module.GetFileModTime(fileName);

/// See [RaylibCoreModule.CompressData].
Uint8List CompressData(
  Uint8List data,
) => _module.CompressData(data);

/// See [RaylibCoreModule.DecompressData].
Uint8List DecompressData(
  Uint8List compData,
) => _module.DecompressData(compData);

/// See [RaylibCoreModule.EncodeDataBase64].
Uint8List EncodeDataBase64(
  Uint8List data,
) => _module.EncodeDataBase64(data);

/// See [RaylibCoreModule.DecodeDataBase64].
Uint8List DecodeDataBase64(
  Uint8List data,
) => _module.DecodeDataBase64(data);

/// See [RaylibCoreModule.ComputeCRC32].
int ComputeCRC32(
  Uint8List data,
) => _module.ComputeCRC32(data);

/// See [RaylibCoreModule.ComputeMD5].
Uint8List ComputeMD5(
  Uint8List data,
) => _module.ComputeMD5(data);

/// See [RaylibCoreModule.ComputeSHA1].
Uint8List ComputeSHA1(
  Uint8List data,
) => _module.ComputeSHA1(data);

/// See [RaylibCoreModule.ComputeSHA256].
Uint8List ComputeSHA256(
  Uint8List data,
) => _module.ComputeSHA256(data);

/// See [RaylibCoreModule.LoadAutomationEventList].
AutomationEventListD LoadAutomationEventList(
  String? fileName,
) => _module.LoadAutomationEventList(fileName);

/// See [RaylibCoreModule.UnloadAutomationEventList].
void UnloadAutomationEventList(
  AutomationEventListD list,
) => _module.UnloadAutomationEventList(list);

/// See [RaylibCoreModule.ExportAutomationEventList].
bool ExportAutomationEventList(
  AutomationEventListD list,
  String fileName,
) => _module.ExportAutomationEventList(list, fileName);

/// See [RaylibCoreModule.SetAutomationEventList].
void SetAutomationEventList(
  AutomationEventListD list,
) => _module.SetAutomationEventList(list);

/// See [RaylibCoreModule.SetAutomationEventBaseFrame].
void SetAutomationEventBaseFrame(
  int frame,
) => _module.SetAutomationEventBaseFrame(frame);

/// See [RaylibCoreModule.StartAutomationEventRecording].
void StartAutomationEventRecording() => _module.StartAutomationEventRecording();

/// See [RaylibCoreModule.StopAutomationEventRecording].
void StopAutomationEventRecording() => _module.StopAutomationEventRecording();

/// See [RaylibCoreModule.PlayAutomationEvent].
void PlayAutomationEvent(
  AutomationEventD event,
) => _module.PlayAutomationEvent(event);

/// See [RaylibCoreModule.IsKeyPressed].
bool IsKeyPressed(
  KeyboardKey key,
) => _module.IsKeyPressed(key);

/// See [RaylibCoreModule.IsKeyPressedRepeat].
bool IsKeyPressedRepeat(
  KeyboardKey key,
) => _module.IsKeyPressedRepeat(key);

/// See [RaylibCoreModule.IsKeyDown].
bool IsKeyDown(
  KeyboardKey key,
) => _module.IsKeyDown(key);

/// See [RaylibCoreModule.IsKeyReleased].
bool IsKeyReleased(
  KeyboardKey key,
) => _module.IsKeyReleased(key);

/// See [RaylibCoreModule.IsKeyUp].
bool IsKeyUp(
  KeyboardKey key,
) => _module.IsKeyUp(key);

/// See [RaylibCoreModule.GetKeyName].
String GetKeyName(
  KeyboardKey key,
) => _module.GetKeyName(key);

/// See [RaylibCoreModule.GetKeyPressed].
int GetKeyPressed() => _module.GetKeyPressed();

/// See [RaylibCoreModule.GetCharPressed].
int GetCharPressed() => _module.GetCharPressed();

/// See [RaylibCoreModule.SetExitKey].
void SetExitKey(
  KeyboardKey key,
) => _module.SetExitKey(key);

/// See [RaylibCoreModule.IsGamepadAvailable].
bool IsGamepadAvailable(
  num gamepad,
) => _module.IsGamepadAvailable(gamepad);

/// See [RaylibCoreModule.GetGamepadName].
String GetGamepadName(
  num gamepad,
) => _module.GetGamepadName(gamepad);

/// See [RaylibCoreModule.IsGamepadButtonPressed].
bool IsGamepadButtonPressed(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonPressed(gamepad, button);

/// See [RaylibCoreModule.IsGamepadButtonDown].
bool IsGamepadButtonDown(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonDown(gamepad, button);

/// See [RaylibCoreModule.IsGamepadButtonReleased].
bool IsGamepadButtonReleased(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonReleased(gamepad, button);

/// See [RaylibCoreModule.IsGamepadButtonUp].
bool IsGamepadButtonUp(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonUp(gamepad, button);

/// See [RaylibCoreModule.GetGamepadButtonPressed].
GamepadButton GetGamepadButtonPressed() => _module.GetGamepadButtonPressed();

/// See [RaylibCoreModule.GetGamepadAxisCount].
int GetGamepadAxisCount(
  num gamepad,
) => _module.GetGamepadAxisCount(gamepad);

/// See [RaylibCoreModule.GetGamepadAxisMovement].
double GetGamepadAxisMovement(
  num gamepad,
  GamepadAxis axis,
) => _module.GetGamepadAxisMovement(gamepad, axis);

/// See [RaylibCoreModule.SetGamepadMappings].
int SetGamepadMappings(
  String mappings,
) => _module.SetGamepadMappings(mappings);

/// See [RaylibCoreModule.SetGamepadVibration].
void SetGamepadVibration(
  num gamepad,
  num leftMotor,
  num rightMotor,
  num duration,
) => _module.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration);

/// See [RaylibCoreModule.IsMouseButtonPressed].
bool IsMouseButtonPressed(
  MouseButton button,
) => _module.IsMouseButtonPressed(button);

/// See [RaylibCoreModule.IsMouseButtonDown].
bool IsMouseButtonDown(
  MouseButton button,
) => _module.IsMouseButtonDown(button);

/// See [RaylibCoreModule.IsMouseButtonReleased].
bool IsMouseButtonReleased(
  MouseButton button,
) => _module.IsMouseButtonReleased(button);

/// See [RaylibCoreModule.IsMouseButtonUp].
bool IsMouseButtonUp(
  MouseButton button,
) => _module.IsMouseButtonUp(button);

/// See [RaylibCoreModule.GetMouseX].
int GetMouseX() => _module.GetMouseX();

/// See [RaylibCoreModule.GetMouseY].
int GetMouseY() => _module.GetMouseY();

/// See [RaylibCoreModule.GetMousePosition].
Vector2D GetMousePosition() => _module.GetMousePosition();

/// See [RaylibCoreModule.GetMouseDelta].
Vector2D GetMouseDelta() => _module.GetMouseDelta();

/// See [RaylibCoreModule.SetMousePosition].
void SetMousePosition(
  num x,
  num y,
) => _module.SetMousePosition(x, y);

/// See [RaylibCoreModule.SetMouseOffset].
void SetMouseOffset(
  num offsetX,
  num offsetY,
) => _module.SetMouseOffset(offsetX, offsetY);

/// See [RaylibCoreModule.SetMouseScale].
void SetMouseScale(
  num scaleX,
  num scaleY,
) => _module.SetMouseScale(scaleX, scaleY);

/// See [RaylibCoreModule.GetMouseWheelMove].
double GetMouseWheelMove() => _module.GetMouseWheelMove();

/// See [RaylibCoreModule.GetMouseWheelMoveV].
Vector2D GetMouseWheelMoveV() => _module.GetMouseWheelMoveV();

/// See [RaylibCoreModule.SetMouseCursor].
void SetMouseCursor(
  MouseCursor cursor,
) => _module.SetMouseCursor(cursor);

/// See [RaylibCoreModule.GetTouchX].
int GetTouchX() => _module.GetTouchX();

/// See [RaylibCoreModule.GetTouchY].
int GetTouchY() => _module.GetTouchY();

/// See [RaylibCoreModule.GetTouchPosition].
Vector2D GetTouchPosition(
  num index,
) => _module.GetTouchPosition(index);

/// See [RaylibCoreModule.GetTouchPointId].
int GetTouchPointId(
  num index,
) => _module.GetTouchPointId(index);

/// See [RaylibCoreModule.GetTouchPointCount].
int GetTouchPointCount() => _module.GetTouchPointCount();

/// See [RaylibCoreModule.SetGesturesEnabled].
void SetGesturesEnabled(
  Iterable<Gesture> flags,
) => _module.SetGesturesEnabled(flags);

/// See [RaylibCoreModule.IsGestureDetected].
bool IsGestureDetected(
  Gesture key,
) => _module.IsGestureDetected(key);

/// See [RaylibCoreModule.GetGestureDetected].
Gesture GetGestureDetected() => _module.GetGestureDetected();

/// See [RaylibCoreModule.GetGestureHoldDuration].
double GetGestureHoldDuration() => _module.GetGestureHoldDuration();

/// See [RaylibCoreModule.GetGestureDragVector].
Vector2D GetGestureDragVector() => _module.GetGestureDragVector();

/// See [RaylibCoreModule.GetGestureDragAngle].
double GetGestureDragAngle() => _module.GetGestureDragAngle();

/// See [RaylibCoreModule.GetGesturePinchVector].
Vector2D GetGesturePinchVector() => _module.GetGesturePinchVector();

/// See [RaylibCoreModule.GetGesturePinchAngle].
double GetGesturePinchAngle() => _module.GetGesturePinchAngle();

/// See [RaylibCoreModule.ProcessGestureEvent].
void ProcessGestureEvent(
  GestureEventD event,
) => _module.ProcessGestureEvent(event);

/// See [RaylibCoreModule.UpdateGestures].
void UpdateGestures() => _module.UpdateGestures();

/// See [RaylibCoreModule.UpdateCamera].
void UpdateCamera(
  Camera3DD camera,
  CameraMode mode,
) => _module.UpdateCamera(camera, mode);

/// See [RaylibCoreModule.UpdateCameraPro].
void UpdateCameraPro(
  Camera3DD camera,
  Vector3D movement,
  Vector3D rotation,
  num zoom,
) => _module.UpdateCameraPro(camera, movement, rotation, zoom);

/// See [RaylibCoreModule.SetShapesTexture].
void SetShapesTexture(
  TextureD texture,
  RectangleD source,
) => _module.SetShapesTexture(texture, source);

/// See [RaylibCoreModule.GetShapesTexture].
TextureD GetShapesTexture() => _module.GetShapesTexture();

/// See [RaylibCoreModule.GetShapesTextureRectangle].
RectangleD GetShapesTextureRectangle() => _module.GetShapesTextureRectangle();

/// See [RaylibCoreModule.DrawPixel].
void DrawPixel(
  num posX,
  num posY,
  ColorD color,
) => _module.DrawPixel(posX, posY, color);

/// See [RaylibCoreModule.DrawPixelV].
void DrawPixelV(
  Vector2D position,
  ColorD color,
) => _module.DrawPixelV(position, color);

/// See [RaylibCoreModule.DrawLine].
void DrawLine(
  num startPosX,
  num startPosY,
  num endPosX,
  num endPosY,
  ColorD color,
) => _module.DrawLine(startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreModule.DrawLineV].
void DrawLineV(
  Vector2D startPos,
  Vector2D endPos,
  ColorD color,
) => _module.DrawLineV(startPos, endPos, color);

/// See [RaylibCoreModule.DrawLineEx].
void DrawLineEx(
  Vector2D startPos,
  Vector2D endPos,
  num thick,
  ColorD color,
) => _module.DrawLineEx(startPos, endPos, thick, color);

/// See [RaylibCoreModule.DrawLineStrip].
void DrawLineStrip(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawLineStrip(points, color);

/// See [RaylibCoreModule.DrawLineBezier].
void DrawLineBezier(
  Vector2D startPos,
  Vector2D endPos,
  num thick,
  ColorD color,
) => _module.DrawLineBezier(startPos, endPos, thick, color);

/// See [RaylibCoreModule.DrawLineDashed].
void DrawLineDashed(
  Vector2D startPos,
  Vector2D endPos,
  num dashSize,
  num spaceSize,
  ColorD color,
) => _module.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color);

/// See [RaylibCoreModule.DrawCircle].
void DrawCircle(
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.DrawCircle(centerX, centerY, radius, color);

/// See [RaylibCoreModule.DrawCircleSector].
void DrawCircleSector(
  Vector2D center,
  num radius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawCircleSector(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreModule.DrawCircleSectorLines].
void DrawCircleSectorLines(
  Vector2D center,
  num radius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreModule.DrawCircleGradient].
void DrawCircleGradient(
  Vector2D center,
  num radius,
  ColorD inner,
  ColorD outer,
) => _module.DrawCircleGradient(center, radius, inner, outer);

/// See [RaylibCoreModule.DrawCircleV].
void DrawCircleV(
  Vector2D center,
  num radius,
  ColorD color,
) => _module.DrawCircleV(center, radius, color);

/// See [RaylibCoreModule.DrawCircleLines].
void DrawCircleLines(
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.DrawCircleLines(centerX, centerY, radius, color);

/// See [RaylibCoreModule.DrawCircleLinesV].
void DrawCircleLinesV(
  Vector2D center,
  num radius,
  ColorD color,
) => _module.DrawCircleLinesV(center, radius, color);

/// See [RaylibCoreModule.DrawEllipse].
void DrawEllipse(
  num centerX,
  num centerY,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipse(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreModule.DrawEllipseV].
void DrawEllipseV(
  Vector2D center,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseV(center, radiusH, radiusV, color);

/// See [RaylibCoreModule.DrawEllipseLines].
void DrawEllipseLines(
  num centerX,
  num centerY,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreModule.DrawEllipseLinesV].
void DrawEllipseLinesV(
  Vector2D center,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseLinesV(center, radiusH, radiusV, color);

/// See [RaylibCoreModule.DrawRing].
void DrawRing(
  Vector2D center,
  num innerRadius,
  num outerRadius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreModule.DrawRingLines].
void DrawRingLines(
  Vector2D center,
  num innerRadius,
  num outerRadius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreModule.DrawRectangle].
void DrawRectangle(
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.DrawRectangle(posX, posY, width, height, color);

/// See [RaylibCoreModule.DrawRectangleV].
void DrawRectangleV(
  Vector2D position,
  Vector2D size,
  ColorD color,
) => _module.DrawRectangleV(position, size, color);

/// See [RaylibCoreModule.DrawRectangleRec].
void DrawRectangleRec(
  RectangleD rec,
  ColorD color,
) => _module.DrawRectangleRec(rec, color);

/// See [RaylibCoreModule.DrawRectanglePro].
void DrawRectanglePro(
  RectangleD rec,
  Vector2D origin,
  num rotation,
  ColorD color,
) => _module.DrawRectanglePro(rec, origin, rotation, color);

/// See [RaylibCoreModule.DrawRectangleGradientV].
void DrawRectangleGradientV(
  num posX,
  num posY,
  num width,
  num height,
  ColorD top,
  ColorD bottom,
) => _module.DrawRectangleGradientV(posX, posY, width, height, top, bottom);

/// See [RaylibCoreModule.DrawRectangleGradientH].
void DrawRectangleGradientH(
  num posX,
  num posY,
  num width,
  num height,
  ColorD left,
  ColorD right,
) => _module.DrawRectangleGradientH(posX, posY, width, height, left, right);

/// See [RaylibCoreModule.DrawRectangleGradientEx].
void DrawRectangleGradientEx(
  RectangleD rec,
  ColorD topLeft,
  ColorD bottomLeft,
  ColorD topRight,
  ColorD bottomRight,
) => _module.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);

/// See [RaylibCoreModule.DrawRectangleLines].
void DrawRectangleLines(
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.DrawRectangleLines(posX, posY, width, height, color);

/// See [RaylibCoreModule.DrawRectangleLinesEx].
void DrawRectangleLinesEx(
  RectangleD rec,
  num lineThick,
  ColorD color,
) => _module.DrawRectangleLinesEx(rec, lineThick, color);

/// See [RaylibCoreModule.DrawRectangleRounded].
void DrawRectangleRounded(
  RectangleD rec,
  num roundness,
  num segments,
  ColorD color,
) => _module.DrawRectangleRounded(rec, roundness, segments, color);

/// See [RaylibCoreModule.DrawRectangleRoundedLines].
void DrawRectangleRoundedLines(
  RectangleD rec,
  num roundness,
  num segments,
  ColorD color,
) => _module.DrawRectangleRoundedLines(rec, roundness, segments, color);

/// See [RaylibCoreModule.DrawRectangleRoundedLinesEx].
void DrawRectangleRoundedLinesEx(
  RectangleD rec,
  num roundness,
  num segments,
  num lineThick,
  ColorD color,
) => _module.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);

/// See [RaylibCoreModule.DrawTriangle].
void DrawTriangle(
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.DrawTriangle(v1, v2, v3, color);

/// See [RaylibCoreModule.DrawTriangleLines].
void DrawTriangleLines(
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.DrawTriangleLines(v1, v2, v3, color);

/// See [RaylibCoreModule.DrawTriangleFan].
void DrawTriangleFan(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawTriangleFan(points, color);

/// See [RaylibCoreModule.DrawTriangleStrip].
void DrawTriangleStrip(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawTriangleStrip(points, color);

/// See [RaylibCoreModule.DrawPoly].
void DrawPoly(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  ColorD color,
) => _module.DrawPoly(center, sides, radius, rotation, color);

/// See [RaylibCoreModule.DrawPolyLines].
void DrawPolyLines(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  ColorD color,
) => _module.DrawPolyLines(center, sides, radius, rotation, color);

/// See [RaylibCoreModule.DrawPolyLinesEx].
void DrawPolyLinesEx(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  num lineThick,
  ColorD color,
) => _module.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color);

/// See [RaylibCoreModule.DrawSplineLinear].
void DrawSplineLinear(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineLinear(points, thick, color);

/// See [RaylibCoreModule.DrawSplineBasis].
void DrawSplineBasis(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBasis(points, thick, color);

/// See [RaylibCoreModule.DrawSplineCatmullRom].
void DrawSplineCatmullRom(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineCatmullRom(points, thick, color);

/// See [RaylibCoreModule.DrawSplineBezierQuadratic].
void DrawSplineBezierQuadratic(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBezierQuadratic(points, thick, color);

/// See [RaylibCoreModule.DrawSplineBezierCubic].
void DrawSplineBezierCubic(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBezierCubic(points, thick, color);

/// See [RaylibCoreModule.DrawSplineSegmentLinear].
void DrawSplineSegmentLinear(
  Vector2D p1,
  Vector2D p2,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentLinear(p1, p2, thick, color);

/// See [RaylibCoreModule.DrawSplineSegmentBasis].
void DrawSplineSegmentBasis(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreModule.DrawSplineSegmentCatmullRom].
void DrawSplineSegmentCatmullRom(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreModule.DrawSplineSegmentBezierQuadratic].
void DrawSplineSegmentBezierQuadratic(
  Vector2D p1,
  Vector2D c2,
  Vector2D p3,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);

/// See [RaylibCoreModule.DrawSplineSegmentBezierCubic].
void DrawSplineSegmentBezierCubic(
  Vector2D p1,
  Vector2D c2,
  Vector2D c3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);

/// See [RaylibCoreModule.GetSplinePointLinear].
Vector2D GetSplinePointLinear(
  Vector2D startPos,
  Vector2D endPos,
  num t,
) => _module.GetSplinePointLinear(startPos, endPos, t);

/// See [RaylibCoreModule.GetSplinePointBasis].
Vector2D GetSplinePointBasis(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointBasis(p1, p2, p3, p4, t);

/// See [RaylibCoreModule.GetSplinePointCatmullRom].
Vector2D GetSplinePointCatmullRom(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointCatmullRom(p1, p2, p3, p4, t);

/// See [RaylibCoreModule.GetSplinePointBezierQuad].
Vector2D GetSplinePointBezierQuad(
  Vector2D p1,
  Vector2D c2,
  Vector2D p3,
  num t,
) => _module.GetSplinePointBezierQuad(p1, c2, p3, t);

/// See [RaylibCoreModule.GetSplinePointBezierCubic].
Vector2D GetSplinePointBezierCubic(
  Vector2D p1,
  Vector2D c2,
  Vector2D c3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointBezierCubic(p1, c2, c3, p4, t);

/// See [RaylibCoreModule.CheckCollisionRecs].
bool CheckCollisionRecs(
  RectangleD rec1,
  RectangleD rec2,
) => _module.CheckCollisionRecs(rec1, rec2);

/// See [RaylibCoreModule.CheckCollisionCircles].
bool CheckCollisionCircles(
  Vector2D center1,
  num radius1,
  Vector2D center2,
  num radius2,
) => _module.CheckCollisionCircles(center1, radius1, center2, radius2);

/// See [RaylibCoreModule.CheckCollisionCircleRec].
bool CheckCollisionCircleRec(
  Vector2D center,
  num radius,
  RectangleD rec,
) => _module.CheckCollisionCircleRec(center, radius, rec);

/// See [RaylibCoreModule.CheckCollisionCircleLine].
bool CheckCollisionCircleLine(
  Vector2D center,
  num radius,
  Vector2D p1,
  Vector2D p2,
) => _module.CheckCollisionCircleLine(center, radius, p1, p2);

/// See [RaylibCoreModule.CheckCollisionPointRec].
bool CheckCollisionPointRec(
  Vector2D point,
  RectangleD rec,
) => _module.CheckCollisionPointRec(point, rec);

/// See [RaylibCoreModule.CheckCollisionPointCircle].
bool CheckCollisionPointCircle(
  Vector2D point,
  Vector2D center,
  num radius,
) => _module.CheckCollisionPointCircle(point, center, radius);

/// See [RaylibCoreModule.CheckCollisionPointTriangle].
bool CheckCollisionPointTriangle(
  Vector2D point,
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
) => _module.CheckCollisionPointTriangle(point, p1, p2, p3);

/// See [RaylibCoreModule.CheckCollisionPointLine].
bool CheckCollisionPointLine(
  Vector2D point,
  Vector2D p1,
  Vector2D p2,
  num threshold,
) => _module.CheckCollisionPointLine(point, p1, p2, threshold);

/// See [RaylibCoreModule.CheckCollisionPointPoly].
bool CheckCollisionPointPoly(
  Vector2D point,
  List<Vector2D> points,
) => _module.CheckCollisionPointPoly(point, points);

/// See [RaylibCoreModule.CheckCollisionLines].
(bool result, Vector2D collisionPoint) CheckCollisionLines(
  Vector2D startPos1,
  Vector2D endPos1,
  Vector2D startPos2,
  Vector2D endPos2,
) => _module.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2);

/// See [RaylibCoreModule.GetCollisionRec].
RectangleD GetCollisionRec(
  RectangleD rec1,
  RectangleD rec2,
) => _module.GetCollisionRec(rec1, rec2);

/// See [RaylibCoreModule.LoadImage].
ImageD LoadImage(
  String fileName,
) => _module.LoadImage(fileName);

/// See [RaylibCoreModule.LoadImageRaw].
ImageD LoadImageRaw(
  String fileName,
  num width,
  num height,
  PixelFormat format,
  num headerSize,
) => _module.LoadImageRaw(fileName, width, height, format, headerSize);

/// See [RaylibCoreModule.LoadImageAnim].
ImageD LoadImageAnim(
  String fileName,
) => _module.LoadImageAnim(fileName);

/// See [RaylibCoreModule.LoadImageAnimFromMemory].
ImageD LoadImageAnimFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadImageAnimFromMemory(fileType, fileData);

/// See [RaylibCoreModule.LoadImageFromMemory].
ImageD LoadImageFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadImageFromMemory(fileType, fileData);

/// See [RaylibCoreModule.LoadImageFromTexture].
ImageD LoadImageFromTexture(
  TextureD texture,
) => _module.LoadImageFromTexture(texture);

/// See [RaylibCoreModule.LoadImageFromScreen].
ImageD LoadImageFromScreen() => _module.LoadImageFromScreen();

/// See [RaylibCoreModule.IsImageValid].
bool IsImageValid(
  ImageD image,
) => _module.IsImageValid(image);

/// See [RaylibCoreModule.UnloadImage].
void UnloadImage(
  ImageD image,
) => _module.UnloadImage(image);

/// See [RaylibCoreModule.ExportImage].
bool ExportImage(
  ImageD image,
  String fileName,
) => _module.ExportImage(image, fileName);

/// See [RaylibCoreModule.ExportImageToMemory].
(MemoryPointer<RUint8> dataPtr, int dataSize) ExportImageToMemory(
  ImageD image,
  String fileType,
) => _module.ExportImageToMemory(image, fileType);

/// See [RaylibCoreModule.ExportImageAsCode].
bool ExportImageAsCode(
  ImageD image,
  String fileName,
) => _module.ExportImageAsCode(image, fileName);

/// See [RaylibCoreModule.GenImageColor].
ImageD GenImageColor(
  num width,
  num height,
  ColorD color,
) => _module.GenImageColor(width, height, color);

/// See [RaylibCoreModule.GenImageGradientLinear].
ImageD GenImageGradientLinear(
  num width,
  num height,
  num direction,
  ColorD start,
  ColorD end,
) => _module.GenImageGradientLinear(width, height, direction, start, end);

/// See [RaylibCoreModule.GenImageGradientRadial].
ImageD GenImageGradientRadial(
  num width,
  num height,
  num density,
  ColorD inner,
  ColorD outer,
) => _module.GenImageGradientRadial(width, height, density, inner, outer);

/// See [RaylibCoreModule.GenImageGradientSquare].
ImageD GenImageGradientSquare(
  num width,
  num height,
  num density,
  ColorD inner,
  ColorD outer,
) => _module.GenImageGradientSquare(width, height, density, inner, outer);

/// See [RaylibCoreModule.GenImageChecked].
ImageD GenImageChecked(
  num width,
  num height,
  num checksX,
  num checksY,
  ColorD col1,
  ColorD col2,
) => _module.GenImageChecked(width, height, checksX, checksY, col1, col2);

/// See [RaylibCoreModule.GenImageWhiteNoise].
ImageD GenImageWhiteNoise(
  num width,
  num height,
  num factor,
) => _module.GenImageWhiteNoise(width, height, factor);

/// See [RaylibCoreModule.GenImagePerlinNoise].
ImageD GenImagePerlinNoise(
  num width,
  num height,
  num offsetX,
  num offsetY,
  num scale,
) => _module.GenImagePerlinNoise(width, height, offsetX, offsetY, scale);

/// See [RaylibCoreModule.GenImageCellular].
ImageD GenImageCellular(
  num width,
  num height,
  num tileSize,
) => _module.GenImageCellular(width, height, tileSize);

/// See [RaylibCoreModule.GenImageText].
ImageD GenImageText(
  num width,
  num height,
  String text,
) => _module.GenImageText(width, height, text);

/// See [RaylibCoreModule.ImageCopy].
ImageD ImageCopy(
  ImageD image,
) => _module.ImageCopy(image);

/// See [RaylibCoreModule.ImageFromImage].
ImageD ImageFromImage(
  ImageD image,
  RectangleD rec,
) => _module.ImageFromImage(image, rec);

/// See [RaylibCoreModule.ImageFromChannel].
ImageD ImageFromChannel(
  ImageD image,
  num selectedChannel,
) => _module.ImageFromChannel(image, selectedChannel);

/// See [RaylibCoreModule.ImageText].
ImageD ImageText(
  String text,
  num fontSize,
  ColorD color,
) => _module.ImageText(text, fontSize, color);

/// See [RaylibCoreModule.ImageTextEx].
ImageD ImageTextEx(
  FontD font,
  String text,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.ImageTextEx(font, text, fontSize, spacing, tint);

/// See [RaylibCoreModule.ImageFormat].
void ImageFormat(
  ImageD image,
  PixelFormat newFormat,
) => _module.ImageFormat(image, newFormat);

/// See [RaylibCoreModule.ImageToPOT].
void ImageToPOT(
  ImageD image,
  ColorD fill,
) => _module.ImageToPOT(image, fill);

/// See [RaylibCoreModule.ImageCrop].
void ImageCrop(
  ImageD image,
  RectangleD crop,
) => _module.ImageCrop(image, crop);

/// See [RaylibCoreModule.ImageAlphaCrop].
void ImageAlphaCrop(
  ImageD image,
  num threshold,
) => _module.ImageAlphaCrop(image, threshold);

/// See [RaylibCoreModule.ImageAlphaClear].
void ImageAlphaClear(
  ImageD image,
  ColorD color,
  num threshold,
) => _module.ImageAlphaClear(image, color, threshold);

/// See [RaylibCoreModule.ImageAlphaMask].
void ImageAlphaMask(
  ImageD image,
  ImageD alphaMask,
) => _module.ImageAlphaMask(image, alphaMask);

/// See [RaylibCoreModule.ImageAlphaPremultiply].
void ImageAlphaPremultiply(
  ImageD image,
) => _module.ImageAlphaPremultiply(image);

/// See [RaylibCoreModule.ImageBlurGaussian].
void ImageBlurGaussian(
  ImageD image,
  num blurSize,
) => _module.ImageBlurGaussian(image, blurSize);

/// See [RaylibCoreModule.ImageKernelConvolution].
void ImageKernelConvolution(
  ImageD image,
  List<double> kernel,
) => _module.ImageKernelConvolution(image, kernel);

/// See [RaylibCoreModule.ImageResize].
void ImageResize(
  ImageD image,
  num newWidth,
  num newHeight,
) => _module.ImageResize(image, newWidth, newHeight);

/// See [RaylibCoreModule.ImageResizeNN].
void ImageResizeNN(
  ImageD image,
  num newWidth,
  num newHeight,
) => _module.ImageResizeNN(image, newWidth, newHeight);

/// See [RaylibCoreModule.ImageResizeCanvas].
void ImageResizeCanvas(
  ImageD image,
  num newWidth,
  num newHeight,
  num offsetX,
  num offsetY,
  ColorD fill,
) => _module.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill);

/// See [RaylibCoreModule.ImageMipmaps].
void ImageMipmaps(
  ImageD image,
) => _module.ImageMipmaps(image);

/// See [RaylibCoreModule.ImageDither].
void ImageDither(
  ImageD image,
  num rBpp,
  num gBpp,
  num bBpp,
  num aBpp,
) => _module.ImageDither(image, rBpp, gBpp, bBpp, aBpp);

/// See [RaylibCoreModule.ImageFlipVertical].
void ImageFlipVertical(
  ImageD image,
) => _module.ImageFlipVertical(image);

/// See [RaylibCoreModule.ImageFlipHorizontal].
void ImageFlipHorizontal(
  ImageD image,
) => _module.ImageFlipHorizontal(image);

/// See [RaylibCoreModule.ImageRotate].
void ImageRotate(
  ImageD image,
  num degrees,
) => _module.ImageRotate(image, degrees);

/// See [RaylibCoreModule.ImageRotateCW].
void ImageRotateCW(
  ImageD image,
) => _module.ImageRotateCW(image);

/// See [RaylibCoreModule.ImageRotateCCW].
void ImageRotateCCW(
  ImageD image,
) => _module.ImageRotateCCW(image);

/// See [RaylibCoreModule.ImageColorTint].
void ImageColorTint(
  ImageD image,
  ColorD color,
) => _module.ImageColorTint(image, color);

/// See [RaylibCoreModule.ImageColorInvert].
void ImageColorInvert(
  ImageD image,
) => _module.ImageColorInvert(image);

/// See [RaylibCoreModule.ImageColorGrayscale].
void ImageColorGrayscale(
  ImageD image,
) => _module.ImageColorGrayscale(image);

/// See [RaylibCoreModule.ImageColorContrast].
void ImageColorContrast(
  ImageD image,
  num contrast,
) => _module.ImageColorContrast(image, contrast);

/// See [RaylibCoreModule.ImageColorBrightness].
void ImageColorBrightness(
  ImageD image,
  num brightness,
) => _module.ImageColorBrightness(image, brightness);

/// See [RaylibCoreModule.ImageColorReplace].
void ImageColorReplace(
  ImageD image,
  ColorD color,
  ColorD replace,
) => _module.ImageColorReplace(image, color, replace);

/// See [RaylibCoreModule.LoadImageColors].
List<ColorD> LoadImageColors(
  ImageD image,
) => _module.LoadImageColors(image);

/// See [RaylibCoreModule.LoadImagePalette].
List<ColorD> LoadImagePalette(
  ImageD image,
  num maxPaletteSize,
) => _module.LoadImagePalette(image, maxPaletteSize);

/// See [RaylibCoreModule.GetImageAlphaBorder].
RectangleD GetImageAlphaBorder(
  ImageD image,
  num threshold,
) => _module.GetImageAlphaBorder(image, threshold);

/// See [RaylibCoreModule.GetImageColor].
ColorD GetImageColor(
  ImageD image,
  num x,
  num y,
) => _module.GetImageColor(image, x, y);

/// See [RaylibCoreModule.ImageClearBackground].
void ImageClearBackground(
  ImageD dst,
  ColorD color,
) => _module.ImageClearBackground(dst, color);

/// See [RaylibCoreModule.ImageDrawPixel].
void ImageDrawPixel(
  ImageD dst,
  num posX,
  num posY,
  ColorD color,
) => _module.ImageDrawPixel(dst, posX, posY, color);

/// See [RaylibCoreModule.ImageDrawPixelV].
void ImageDrawPixelV(
  ImageD dst,
  Vector2D position,
  ColorD color,
) => _module.ImageDrawPixelV(dst, position, color);

/// See [RaylibCoreModule.ImageDrawLine].
void ImageDrawLine(
  ImageD dst,
  num startPosX,
  num startPosY,
  num endPosX,
  num endPosY,
  ColorD color,
) => _module.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreModule.ImageDrawLineV].
void ImageDrawLineV(
  ImageD dst,
  Vector2D start,
  Vector2D end,
  ColorD color,
) => _module.ImageDrawLineV(dst, start, end, color);

/// See [RaylibCoreModule.ImageDrawLineEx].
void ImageDrawLineEx(
  ImageD dst,
  Vector2D start,
  Vector2D end,
  num thick,
  ColorD color,
) => _module.ImageDrawLineEx(dst, start, end, thick, color);

/// See [RaylibCoreModule.ImageDrawCircle].
void ImageDrawCircle(
  ImageD dst,
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.ImageDrawCircle(dst, centerX, centerY, radius, color);

/// See [RaylibCoreModule.ImageDrawCircleV].
void ImageDrawCircleV(
  ImageD dst,
  Vector2D center,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleV(dst, center, radius, color);

/// See [RaylibCoreModule.ImageDrawCircleLines].
void ImageDrawCircleLines(
  ImageD dst,
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleLines(dst, centerX, centerY, radius, color);

/// See [RaylibCoreModule.ImageDrawCircleLinesV].
void ImageDrawCircleLinesV(
  ImageD dst,
  Vector2D center,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleLinesV(dst, center, radius, color);

/// See [RaylibCoreModule.ImageDrawRectangle].
void ImageDrawRectangle(
  ImageD dst,
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.ImageDrawRectangle(dst, posX, posY, width, height, color);

/// See [RaylibCoreModule.ImageDrawRectangleV].
void ImageDrawRectangleV(
  ImageD dst,
  Vector2D position,
  Vector2D size,
  ColorD color,
) => _module.ImageDrawRectangleV(dst, position, size, color);

/// See [RaylibCoreModule.ImageDrawRectangleRec].
void ImageDrawRectangleRec(
  ImageD dst,
  RectangleD rec,
  ColorD color,
) => _module.ImageDrawRectangleRec(dst, rec, color);

/// See [RaylibCoreModule.ImageDrawRectangleLines].
void ImageDrawRectangleLines(
  ImageD dst,
  RectangleD rec,
  num thick,
  ColorD color,
) => _module.ImageDrawRectangleLines(dst, rec, thick, color);

/// See [RaylibCoreModule.ImageDrawTriangle].
void ImageDrawTriangle(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.ImageDrawTriangle(dst, v1, v2, v3, color);

/// See [RaylibCoreModule.ImageDrawTriangleEx].
void ImageDrawTriangleEx(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD c1,
  ColorD c2,
  ColorD c3,
) => _module.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3);

/// See [RaylibCoreModule.ImageDrawTriangleLines].
void ImageDrawTriangleLines(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.ImageDrawTriangleLines(dst, v1, v2, v3, color);

/// See [RaylibCoreModule.ImageDrawTriangleFan].
void ImageDrawTriangleFan(
  ImageD dst,
  List<Vector2D> points,
  ColorD color,
) => _module.ImageDrawTriangleFan(dst, points, color);

/// See [RaylibCoreModule.ImageDrawTriangleStrip].
void ImageDrawTriangleStrip(
  ImageD dst,
  List<Vector2D> points,
  ColorD color,
) => _module.ImageDrawTriangleStrip(dst, points, color);

/// See [RaylibCoreModule.ImageDraw].
void ImageDraw(
  ImageD dst,
  ImageD src,
  RectangleD srcRec,
  RectangleD dstRec,
  ColorD tint,
) => _module.ImageDraw(dst, src, srcRec, dstRec, tint);

/// See [RaylibCoreModule.ImageDrawText].
void ImageDrawText(
  ImageD dst,
  String text,
  num posX,
  num posY,
  num fontSize,
  ColorD color,
) => _module.ImageDrawText(dst, text, posX, posY, fontSize, color);

/// See [RaylibCoreModule.ImageDrawTextEx].
void ImageDrawTextEx(
  ImageD dst,
  FontD font,
  String text,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreModule.LoadTexture].
TextureD LoadTexture(
  String fileName,
) => _module.LoadTexture(fileName);

/// See [RaylibCoreModule.LoadTextureFromImage].
TextureD LoadTextureFromImage(
  ImageD image,
) => _module.LoadTextureFromImage(image);

/// See [RaylibCoreModule.LoadTextureCubemap].
TextureD LoadTextureCubemap(
  ImageD image,
  CubemapLayout layout,
) => _module.LoadTextureCubemap(image, layout);

/// See [RaylibCoreModule.LoadRenderTexture].
RenderTextureD LoadRenderTexture(
  num width,
  num height,
) => _module.LoadRenderTexture(width, height);

/// See [RaylibCoreModule.IsTextureValid].
bool IsTextureValid(
  TextureD texture,
) => _module.IsTextureValid(texture);

/// See [RaylibCoreModule.UnloadTexture].
void UnloadTexture(
  TextureD texture,
) => _module.UnloadTexture(texture);

/// See [RaylibCoreModule.IsRenderTextureValid].
bool IsRenderTextureValid(
  RenderTextureD target,
) => _module.IsRenderTextureValid(target);

/// See [RaylibCoreModule.UnloadRenderTexture].
void UnloadRenderTexture(
  RenderTextureD target,
) => _module.UnloadRenderTexture(target);

/// See [RaylibCoreModule.UpdateTexture].
void UpdateTexture(
  TextureD texture,
  Uint8List pixels,
) => _module.UpdateTexture(texture, pixels);

/// See [RaylibCoreModule.UpdateTextureRec].
void UpdateTextureRec(
  TextureD texture,
  RectangleD rec,
  Uint8List pixels,
) => _module.UpdateTextureRec(texture, rec, pixels);

/// See [RaylibCoreModule.GenTextureMipmaps].
void GenTextureMipmaps(
  TextureD texture,
) => _module.GenTextureMipmaps(texture);

/// See [RaylibCoreModule.SetTextureFilter].
void SetTextureFilter(
  TextureD texture,
  TextureFilter filter,
) => _module.SetTextureFilter(texture, filter);

/// See [RaylibCoreModule.SetTextureWrap].
void SetTextureWrap(
  TextureD texture,
  TextureWrap wrap,
) => _module.SetTextureWrap(texture, wrap);

/// See [RaylibCoreModule.DrawTexture].
void DrawTexture(
  TextureD texture,
  num posX,
  num posY,
  ColorD tint,
) => _module.DrawTexture(texture, posX, posY, tint);

/// See [RaylibCoreModule.DrawTextureV].
void DrawTextureV(
  TextureD texture,
  Vector2D position,
  ColorD tint,
) => _module.DrawTextureV(texture, position, tint);

/// See [RaylibCoreModule.DrawTextureEx].
void DrawTextureEx(
  TextureD texture,
  Vector2D position,
  num rotation,
  num scale,
  ColorD tint,
) => _module.DrawTextureEx(texture, position, rotation, scale, tint);

/// See [RaylibCoreModule.DrawTextureRec].
void DrawTextureRec(
  TextureD texture,
  RectangleD source,
  Vector2D position,
  ColorD tint,
) => _module.DrawTextureRec(texture, source, position, tint);

/// See [RaylibCoreModule.DrawTexturePro].
void DrawTexturePro(
  TextureD texture,
  RectangleD source,
  RectangleD dest,
  Vector2D origin,
  num rotation,
  ColorD tint,
) => _module.DrawTexturePro(texture, source, dest, origin, rotation, tint);

/// See [RaylibCoreModule.DrawTextureNPatch].
void DrawTextureNPatch(
  TextureD texture,
  NPatchInfoD nPatchInfo,
  RectangleD dest,
  Vector2D origin,
  num rotation,
  ColorD tint,
) => _module.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint);

/// See [RaylibCoreModule.ColorIsEqual].
bool ColorIsEqual(
  ColorD col1,
  ColorD col2,
) => _module.ColorIsEqual(col1, col2);

/// See [RaylibCoreModule.Fade].
ColorD Fade(
  ColorD color,
  num alpha,
) => _module.Fade(color, alpha);

/// See [RaylibCoreModule.ColorToInt].
int ColorToInt(
  ColorD color,
) => _module.ColorToInt(color);

/// See [RaylibCoreModule.ColorNormalize].
Vector4D ColorNormalize(
  ColorD color,
) => _module.ColorNormalize(color);

/// See [RaylibCoreModule.ColorFromNormalized].
ColorD ColorFromNormalized(
  Vector4D normalized,
) => _module.ColorFromNormalized(normalized);

/// See [RaylibCoreModule.ColorToHSV].
Vector3D ColorToHSV(
  ColorD color,
) => _module.ColorToHSV(color);

/// See [RaylibCoreModule.ColorFromHSV].
ColorD ColorFromHSV(
  num hue,
  num saturation,
  num value,
) => _module.ColorFromHSV(hue, saturation, value);

/// See [RaylibCoreModule.ColorTint].
ColorD ColorTint(
  ColorD color,
  ColorD tint,
) => _module.ColorTint(color, tint);

/// See [RaylibCoreModule.ColorBrightness].
ColorD ColorBrightness(
  ColorD color,
  num factor,
) => _module.ColorBrightness(color, factor);

/// See [RaylibCoreModule.ColorContrast].
ColorD ColorContrast(
  ColorD color,
  num contrast,
) => _module.ColorContrast(color, contrast);

/// See [RaylibCoreModule.ColorAlpha].
ColorD ColorAlpha(
  ColorD color,
  num alpha,
) => _module.ColorAlpha(color, alpha);

/// See [RaylibCoreModule.ColorAlphaBlend].
ColorD ColorAlphaBlend(
  ColorD dst,
  ColorD src,
  ColorD tint,
) => _module.ColorAlphaBlend(dst, src, tint);

/// See [RaylibCoreModule.ColorLerp].
ColorD ColorLerp(
  ColorD color1,
  ColorD color2,
  num factor,
) => _module.ColorLerp(color1, color2, factor);

/// See [RaylibCoreModule.GetColor].
ColorD GetColor(
  num hexValue,
) => _module.GetColor(hexValue);

/// See [RaylibCoreModule.GetPixelDataSize].
int GetPixelDataSize(
  num width,
  num height,
  PixelFormat format,
) => _module.GetPixelDataSize(width, height, format);

/// See [RaylibCoreModule.GetFontDefault].
FontD GetFontDefault() => _module.GetFontDefault();

/// See [RaylibCoreModule.LoadFont].
FontD LoadFont(
  String fileName,
) => _module.LoadFont(fileName);

/// See [RaylibCoreModule.LoadFontEx].
FontD LoadFontEx(
  String fileName,
  num fontSize, [
    Int32List? codepoints,
    num? codepointCount,
  ]
) => _module.LoadFontEx(fileName, fontSize, codepoints, codepointCount);

/// See [RaylibCoreModule.LoadFontFromImage].
FontD LoadFontFromImage(
  ImageD image,
  ColorD key,
  num firstChar,
) => _module.LoadFontFromImage(image, key, firstChar);

/// See [RaylibCoreModule.LoadFontFromMemory].
FontD LoadFontFromMemory(
  String fileType,
  Uint8List fileData,
  num fontSize,
  Int32List codepoints,
) => _module.LoadFontFromMemory(fileType, fileData, fontSize, codepoints);

/// See [RaylibCoreModule.IsFontValid].
bool IsFontValid(
  FontD font,
) => _module.IsFontValid(font);

/// See [RaylibCoreModule.LoadFontData].
List<GlyphInfoD> LoadFontData(
  Uint8List fileData,
  num fontSize,
  Int32List? codepoints,
  num? codepointCount,
  FontType type,
) => _module.LoadFontData(fileData, fontSize, codepoints, codepointCount, type);

/// See [RaylibCoreModule.GenImageFontAtlas].
(ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
  List<GlyphInfoD> glyphs,
  num fontSize,
  num padding,
  num packMethod,
) => _module.GenImageFontAtlas(glyphs, fontSize, padding, packMethod);

/// See [RaylibCoreModule.UnloadFontData].
void UnloadFontData(
  List<GlyphInfoD> glyphs,
) => _module.UnloadFontData(glyphs);

/// See [RaylibCoreModule.UnloadFont].
void UnloadFont(
  FontD font,
) => _module.UnloadFont(font);

/// See [RaylibCoreModule.ExportFontAsCode].
bool ExportFontAsCode(
  FontD font,
  String fileName,
) => _module.ExportFontAsCode(font, fileName);

/// See [RaylibCoreModule.DrawFPS].
void DrawFPS(
  num posX,
  num posY,
) => _module.DrawFPS(posX, posY);

/// See [RaylibCoreModule.DrawText].
void DrawText(
  String text,
  num posX,
  num posY,
  num fontSize,
  ColorD color,
) => _module.DrawText(text, posX, posY, fontSize, color);

/// See [RaylibCoreModule.DrawTextEx].
void DrawTextEx(
  FontD font,
  String text,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.DrawTextEx(font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreModule.DrawTextPro].
void DrawTextPro(
  FontD font,
  String text,
  Vector2D position,
  Vector2D origin,
  num rotation,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint);

/// See [RaylibCoreModule.DrawTextCodepoint].
void DrawTextCodepoint(
  FontD font,
  num codepoint,
  Vector2D position,
  num fontSize,
  ColorD tint,
) => _module.DrawTextCodepoint(font, codepoint, position, fontSize, tint);

/// See [RaylibCoreModule.DrawTextCodepoints].
void DrawTextCodepoints(
  FontD font,
  Int32List codepoints,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.DrawTextCodepoints(font, codepoints, position, fontSize, spacing, tint);

/// See [RaylibCoreModule.SetTextLineSpacing].
void SetTextLineSpacing(
  num spacing,
) => _module.SetTextLineSpacing(spacing);

/// See [RaylibCoreModule.MeasureText].
int MeasureText(
  String text,
  num fontSize,
) => _module.MeasureText(text, fontSize);

/// See [RaylibCoreModule.MeasureTextEx].
Vector2D MeasureTextEx(
  FontD font,
  String text,
  num fontSize,
  num spacing,
) => _module.MeasureTextEx(font, text, fontSize, spacing);

/// See [RaylibCoreModule.MeasureTextCodepoints].
Vector2D MeasureTextCodepoints(
  FontD font,
  Int32List codepoints,
  num fontSize,
  num spacing,
) => _module.MeasureTextCodepoints(font, codepoints, fontSize, spacing);

/// See [RaylibCoreModule.GetGlyphIndex].
int GetGlyphIndex(
  FontD font,
  num codepoint,
) => _module.GetGlyphIndex(font, codepoint);

/// See [RaylibCoreModule.GetGlyphInfo].
GlyphInfoD GetGlyphInfo(
  FontD font,
  num codepoint,
) => _module.GetGlyphInfo(font, codepoint);

/// See [RaylibCoreModule.GetGlyphAtlasRec].
RectangleD GetGlyphAtlasRec(
  FontD font,
  num codepoint,
) => _module.GetGlyphAtlasRec(font, codepoint);

/// See [RaylibCoreModule.LoadUTF8].
String LoadUTF8(
  Int32List codepoints,
) => _module.LoadUTF8(codepoints);

/// See [RaylibCoreModule.LoadCodepoints].
Int32List LoadCodepoints(
  String text,
) => _module.LoadCodepoints(text);

/// See [RaylibCoreModule.GetCodepointCount].
int GetCodepointCount(
  String text,
) => _module.GetCodepointCount(text);

/// See [RaylibCoreModule.GetCodepoint].
(int codepoint, int codepointSize) GetCodepoint(
  String text,
) => _module.GetCodepoint(text);

/// See [RaylibCoreModule.GetCodepointNext].
(int codepoint, int codepointSize) GetCodepointNext(
  String text,
) => _module.GetCodepointNext(text);

/// See [RaylibCoreModule.GetCodepointPrevious].
(int codepoint, int codepointSize) GetCodepointPrevious(
  String text,
) => _module.GetCodepointPrevious(text);

/// See [RaylibCoreModule.CodepointToUTF8].
(String text, int size) CodepointToUTF8(
  num codepoint,
) => _module.CodepointToUTF8(codepoint);

/// See [RaylibCoreModule.LoadTextLines].
List<String> LoadTextLines(
  String text,
) => _module.LoadTextLines(text);

/// See [RaylibCoreModule.TextIsEqual].
bool TextIsEqual(
  String text1,
  String text2,
) => _module.TextIsEqual(text1, text2);

/// See [RaylibCoreModule.TextLength].
int TextLength(
  String text,
) => _module.TextLength(text);

/// See [RaylibCoreModule.TextSubtext].
String TextSubtext(
  String text,
  int position,
  int length,
) => _module.TextSubtext(text, position, length);

/// See [RaylibCoreModule.TextRemoveSpaces].
String TextRemoveSpaces(
  String text,
) => _module.TextRemoveSpaces(text);

/// See [RaylibCoreModule.GetTextBetween].
String GetTextBetween(
  String text,
  String begin,
  String end,
) => _module.GetTextBetween(text, begin, end);

/// See [RaylibCoreModule.TextReplace].
String TextReplace(
  String text,
  String search,
  String replacement,
) => _module.TextReplace(text, search, replacement);

/// See [RaylibCoreModule.TextReplaceBetween].
String TextReplaceBetween(
  String text,
  String begin,
  String end,
  String replacement,
) => _module.TextReplaceBetween(text, begin, end, replacement);

/// See [RaylibCoreModule.TextInsert].
String TextInsert(
  String text,
  String insert,
  int position,
) => _module.TextInsert(text, insert, position);

/// See [RaylibCoreModule.TextJoin].
String TextJoin(
  List<String> textList,
  String delimiter,
) => _module.TextJoin(textList, delimiter);

/// See [RaylibCoreModule.TextSplit].
List<String> TextSplit(
  String text,
  String delimiter,
) => _module.TextSplit(text, delimiter);

/// See [RaylibCoreModule.TextAppend].
String TextAppend(
  String text,
  String append,
) => _module.TextAppend(text, append);

/// See [RaylibCoreModule.TextFindIndex].
int TextFindIndex(
  String text,
  String search,
) => _module.TextFindIndex(text, search);

/// See [RaylibCoreModule.TextToUpper].
String TextToUpper(
  String text,
) => _module.TextToUpper(text);

/// See [RaylibCoreModule.TextToLower].
String TextToLower(
  String text,
) => _module.TextToLower(text);

/// See [RaylibCoreModule.TextToPascal].
String TextToPascal(
  String text,
) => _module.TextToPascal(text);

/// See [RaylibCoreModule.TextToSnake].
String TextToSnake(
  String text,
) => _module.TextToSnake(text);

/// See [RaylibCoreModule.TextToCamel].
String TextToCamel(
  String text,
) => _module.TextToCamel(text);

/// See [RaylibCoreModule.TextToInteger].
int TextToInteger(
  String text,
) => _module.TextToInteger(text);

/// See [RaylibCoreModule.TextToFloat].
double TextToFloat(
  String text,
) => _module.TextToFloat(text);

/// See [RaylibCoreModule.DrawLine3D].
void DrawLine3D(
  Vector3D startPos,
  Vector3D endPos,
  ColorD color,
) => _module.DrawLine3D(startPos, endPos, color);

/// See [RaylibCoreModule.DrawPoint3D].
void DrawPoint3D(
  Vector3D position,
  ColorD color,
) => _module.DrawPoint3D(position, color);

/// See [RaylibCoreModule.DrawCircle3D].
void DrawCircle3D(
  Vector3D center,
  num radius,
  Vector3D rotationAxis,
  num rotationAngle,
  ColorD color,
) => _module.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color);

/// See [RaylibCoreModule.DrawTriangle3D].
void DrawTriangle3D(
  Vector3D v1,
  Vector3D v2,
  Vector3D v3,
  ColorD color,
) => _module.DrawTriangle3D(v1, v2, v3, color);

/// See [RaylibCoreModule.DrawTriangleStrip3D].
void DrawTriangleStrip3D(
  List<Vector3D> points,
  ColorD color,
) => _module.DrawTriangleStrip3D(points, color);

/// See [RaylibCoreModule.DrawCube].
void DrawCube(
  Vector3D position,
  num width,
  num height,
  num length,
  ColorD color,
) => _module.DrawCube(position, width, height, length, color);

/// See [RaylibCoreModule.DrawCubeV].
void DrawCubeV(
  Vector3D position,
  Vector3D size,
  ColorD color,
) => _module.DrawCubeV(position, size, color);

/// See [RaylibCoreModule.DrawCubeWires].
void DrawCubeWires(
  Vector3D position,
  num width,
  num height,
  num length,
  ColorD color,
) => _module.DrawCubeWires(position, width, height, length, color);

/// See [RaylibCoreModule.DrawCubeWiresV].
void DrawCubeWiresV(
  Vector3D position,
  Vector3D size,
  ColorD color,
) => _module.DrawCubeWiresV(position, size, color);

/// See [RaylibCoreModule.DrawSphere].
void DrawSphere(
  Vector3D centerPos,
  num radius,
  ColorD color,
) => _module.DrawSphere(centerPos, radius, color);

/// See [RaylibCoreModule.DrawSphereEx].
void DrawSphereEx(
  Vector3D centerPos,
  num radius,
  num rings,
  num slices,
  ColorD color,
) => _module.DrawSphereEx(centerPos, radius, rings, slices, color);

/// See [RaylibCoreModule.DrawSphereWires].
void DrawSphereWires(
  Vector3D centerPos,
  num radius,
  num rings,
  num slices,
  ColorD color,
) => _module.DrawSphereWires(centerPos, radius, rings, slices, color);

/// See [RaylibCoreModule.DrawCylinder].
void DrawCylinder(
  Vector3D position,
  num radiusTop,
  num radiusBottom,
  num height,
  num slices,
  ColorD color,
) => _module.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreModule.DrawCylinderEx].
void DrawCylinderEx(
  Vector3D startPos,
  Vector3D endPos,
  num startRadius,
  num endRadius,
  num sides,
  ColorD color,
) => _module.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreModule.DrawCylinderWires].
void DrawCylinderWires(
  Vector3D position,
  num radiusTop,
  num radiusBottom,
  num height,
  num slices,
  ColorD color,
) => _module.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreModule.DrawCylinderWiresEx].
void DrawCylinderWiresEx(
  Vector3D startPos,
  Vector3D endPos,
  num startRadius,
  num endRadius,
  num sides,
  ColorD color,
) => _module.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreModule.DrawCapsule].
void DrawCapsule(
  Vector3D startPos,
  Vector3D endPos,
  num radius,
  num slices,
  num rings,
  ColorD color,
) => _module.DrawCapsule(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreModule.DrawCapsuleWires].
void DrawCapsuleWires(
  Vector3D startPos,
  Vector3D endPos,
  num radius,
  num slices,
  num rings,
  ColorD color,
) => _module.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreModule.DrawPlane].
void DrawPlane(
  Vector3D centerPos,
  Vector2D size,
  ColorD color,
) => _module.DrawPlane(centerPos, size, color);

/// See [RaylibCoreModule.DrawRay].
void DrawRay(
  RayD ray,
  ColorD color,
) => _module.DrawRay(ray, color);

/// See [RaylibCoreModule.DrawGrid].
void DrawGrid(
  num slices,
  num spacing,
) => _module.DrawGrid(slices, spacing);

/// See [RaylibCoreModule.LoadModel].
ModelD LoadModel(
  String fileName,
) => _module.LoadModel(fileName);

/// See [RaylibCoreModule.LoadModelFromMesh].
ModelD LoadModelFromMesh(
  MeshD mesh,
) => _module.LoadModelFromMesh(mesh);

/// See [RaylibCoreModule.IsModelValid].
bool IsModelValid(
  ModelD model,
) => _module.IsModelValid(model);

/// See [RaylibCoreModule.UnloadModel].
void UnloadModel(
  ModelD model,
) => _module.UnloadModel(model);

/// See [RaylibCoreModule.GetModelBoundingBox].
BoundingBoxD GetModelBoundingBox(
  ModelD model,
) => _module.GetModelBoundingBox(model);

/// See [RaylibCoreModule.DrawModel].
void DrawModel(
  ModelD model,
  Vector3D position,
  num scale,
  ColorD tint
) => _module.DrawModel(model, position, scale, tint);

/// See [RaylibCoreModule.DrawModelEx].
void DrawModelEx(
  ModelD model,
  Vector3D position,
  Vector3D rotationAxis,
  num rotationAngle,
  Vector3D scale,
  ColorD tint,
) => _module.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreModule.DrawModelWires].
void DrawModelWires(
  ModelD model,
  Vector3D position,
  num scale,
  ColorD tint,
) => _module.DrawModelWires(model, position, scale, tint);

/// See [RaylibCoreModule.DrawModelWiresEx].
void DrawModelWiresEx(
  ModelD model,
  Vector3D position,
  Vector3D rotationAxis,
  num rotationAngle,
  Vector3D scale,
  ColorD tint,
) => _module.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreModule.DrawBoundingBox].
void DrawBoundingBox(
  BoundingBoxD box,
  ColorD color,
) => _module.DrawBoundingBox(box, color);

/// See [RaylibCoreModule.DrawBillboard].
void DrawBillboard(
  Camera3DD camera,
  TextureD texture,
  Vector3D position,
  num scale,
  ColorD tint,
) => _module.DrawBillboard(camera, texture, position, scale, tint);

/// See [RaylibCoreModule.DrawBillboardRec].
void DrawBillboardRec(
  Camera3DD camera,
  TextureD texture,
  RectangleD source,
  Vector3D position,
  Vector2D size,
  ColorD tint,
) => _module.DrawBillboardRec(camera, texture, source, position, size, tint);

/// See [RaylibCoreModule.DrawBillboardPro].
@Deprecated(
  "Broken by a dart:ffi bug: the trailing Color argument gets corrupted "
  "(or crashes) once the preceding float-only args exceed the CPU's 8 "
  "float registers. Use DrawBillboard/DrawBillboardRec, or wait for the fix. "
  "See dart-lang/sdk#63976."
)
void DrawBillboardPro(
  Camera3DD camera,
  TextureD texture,
  RectangleD source,
  Vector3D position,
  Vector3D up,
  Vector2D size,
  Vector2D origin,
  num rotation,
  ColorD tint,
) => _module.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint);

/// See [RaylibCoreModule.UploadMesh].
void UploadMesh(
  MeshD mesh,
  bool dynamic,
) => _module.UploadMesh(mesh, dynamic);

/// See [RaylibCoreModule.UpdateMeshBuffer].
void UpdateMeshBuffer(
  MeshD mesh,
  num index,
  TypedDataList data,
  num offset,
) => _module.UpdateMeshBuffer(mesh, index, data, offset);

/// See [RaylibCoreModule.UnloadMesh].
void UnloadMesh(
  MeshD mesh,
) => _module.UnloadMesh(mesh);

/// See [RaylibCoreModule.DrawMesh].
void DrawMesh(
  MeshD mesh,
  MaterialD material,
  MatrixD transform,
) => _module.DrawMesh(mesh, material, transform);

/// See [RaylibCoreModule.DrawMeshInstanced].
void DrawMeshInstanced(
  MeshD mesh,
  MaterialD material,
  List<MatrixD> transforms,
) => _module.DrawMeshInstanced(mesh, material, transforms);

/// See [RaylibCoreModule.GetMeshBoundingBox].
BoundingBoxD GetMeshBoundingBox(
  MeshD mesh,
) => _module.GetMeshBoundingBox(mesh);

/// See [RaylibCoreModule.GenMeshTangents].
void GenMeshTangents(
  MeshD mesh,
) => _module.GenMeshTangents(mesh);

/// See [RaylibCoreModule.ExportMesh].
bool ExportMesh(
  MeshD mesh,
  String fileName,
) => _module.ExportMesh(mesh, fileName);

/// See [RaylibCoreModule.ExportMeshAsCode].
bool ExportMeshAsCode(
  MeshD mesh,
  String fileName,
) => _module.ExportMeshAsCode(mesh, fileName);

/// See [RaylibCoreModule.GenMeshPoly].
MeshD GenMeshPoly(
  num sides,
  num radius,
) => _module.GenMeshPoly(sides, radius);

/// See [RaylibCoreModule.GenMeshPlane].
MeshD GenMeshPlane(
  num width,
  num length,
  num resX,
  num resZ,
) => _module.GenMeshPlane(width, length, resX, resZ);

/// See [RaylibCoreModule.GenMeshCube].
MeshD GenMeshCube(
  num width,
  num height,
  num length,
) => _module.GenMeshCube(width, height, length);

/// See [RaylibCoreModule.GenMeshSphere].
MeshD GenMeshSphere(
  num radius,
  num rings,
  num slices,
) => _module.GenMeshSphere(radius, rings, slices);

/// See [RaylibCoreModule.GenMeshHemiSphere].
MeshD GenMeshHemiSphere(
  num radius,
  num rings,
  num slices,
) => _module.GenMeshHemiSphere(radius, rings, slices);

/// See [RaylibCoreModule.GenMeshCylinder].
MeshD GenMeshCylinder(
  num radius,
  num height,
  num slices,
) => _module.GenMeshCylinder(radius, height, slices);

/// See [RaylibCoreModule.GenMeshCone].
MeshD GenMeshCone(
  num radius,
  num height,
  num slices,
) => _module.GenMeshCone(radius, height, slices);

/// See [RaylibCoreModule.GenMeshTorus].
MeshD GenMeshTorus(
  num radius,
  num size,
  num radSeg,
  num sides,
) => _module.GenMeshTorus(radius, size, radSeg, sides);

/// See [RaylibCoreModule.GenMeshKnot].
MeshD GenMeshKnot(
  num radius,
  num size,
  num radSeg,
  num sides,
) => _module.GenMeshKnot(radius, size, radSeg, sides);

/// See [RaylibCoreModule.GenMeshHeightmap].
MeshD GenMeshHeightmap(
  ImageD heightmap,
  Vector3D size,
) => _module.GenMeshHeightmap(heightmap, size);

/// See [RaylibCoreModule.GenMeshCubicmap].
MeshD GenMeshCubicmap(
  ImageD cubicmap,
  Vector3D cubeSize,
) => _module.GenMeshCubicmap(cubicmap, cubeSize);

/// See [RaylibCoreModule.LoadMaterials].
List<MaterialD> LoadMaterials(
  String fileName,
) => _module.LoadMaterials(fileName);

/// See [RaylibCoreModule.LoadMaterialDefault].
MaterialD LoadMaterialDefault() => _module.LoadMaterialDefault();

/// See [RaylibCoreModule.IsMaterialValid].
bool IsMaterialValid(
  MaterialD material,
) => _module.IsMaterialValid(material);

/// See [RaylibCoreModule.UnloadMaterial].
void UnloadMaterial(
  MaterialD material,
) => _module.UnloadMaterial(material);

/// See [RaylibCoreModule.SetMaterialTexture].
void SetMaterialTexture(
  MaterialD material,
  MaterialMapIndex mapType,
  TextureD texture,
) => _module.SetMaterialTexture(material, mapType, texture);

/// See [RaylibCoreModule.SetModelMeshMaterial].
void SetModelMeshMaterial(
  ModelD model,
  num meshId,
  num materialId,
) => _module.SetModelMeshMaterial(model, meshId, materialId);

/// See [RaylibCoreModule.LoadModelAnimations].
LiveListPointerStruct<ModelAnimationD> LoadModelAnimations(
  String fileName,
) => _module.LoadModelAnimations(fileName);

/// See [RaylibCoreModule.UpdateModelAnimation].
void UpdateModelAnimation(
  ModelD model,
  ModelAnimationD anim,
  num frame,
) => _module.UpdateModelAnimation(model, anim, frame);

/// See [RaylibCoreModule.UpdateModelAnimationEx].
void UpdateModelAnimationEx(
  ModelD model,
  ModelAnimationD animA,
  num frameA,
  ModelAnimationD animB,
  num frameB,
  num blend,
) => _module.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend);

/// See [RaylibCoreModule.UnloadModelAnimations].
void UnloadModelAnimations(
  LiveListPointerStruct<ModelAnimationD> animations,
) => _module.UnloadModelAnimations(animations);

/// See [RaylibCoreModule.IsModelAnimationValid].
bool IsModelAnimationValid(
  ModelD model,
  ModelAnimationD anim,
) => _module.IsModelAnimationValid(model, anim);

/// See [RaylibCoreModule.CheckCollisionSpheres].
bool CheckCollisionSpheres(
  Vector3D center1,
  num radius1,
  Vector3D center2,
  num radius2,
) => _module.CheckCollisionSpheres(center1, radius1, center2, radius2);

/// See [RaylibCoreModule.CheckCollisionBoxes].
bool CheckCollisionBoxes(
  BoundingBoxD box1,
  BoundingBoxD box2,
) => _module.CheckCollisionBoxes(box1, box2);

/// See [RaylibCoreModule.CheckCollisionBoxSphere].
bool CheckCollisionBoxSphere(
  BoundingBoxD box,
  Vector3D center,
  num radius,
) => _module.CheckCollisionBoxSphere(box, center, radius);

/// See [RaylibCoreModule.GetRayCollisionSphere].
RayCollisionD GetRayCollisionSphere(
  RayD ray,
  Vector3D center,
  num radius,
) => _module.GetRayCollisionSphere(ray, center, radius);

/// See [RaylibCoreModule.GetRayCollisionBox].
RayCollisionD GetRayCollisionBox(
  RayD ray,
  BoundingBoxD box,
) => _module.GetRayCollisionBox(ray, box);

/// See [RaylibCoreModule.GetRayCollisionMesh].
RayCollisionD GetRayCollisionMesh(
  RayD ray,
  MeshD mesh,
  MatrixD transform,
) => _module.GetRayCollisionMesh(ray, mesh, transform);

/// See [RaylibCoreModule.GetRayCollisionTriangle].
RayCollisionD GetRayCollisionTriangle(
  RayD ray,
  Vector3D p1,
  Vector3D p2,
  Vector3D p3,
) => _module.GetRayCollisionTriangle(ray, p1, p2, p3);

/// See [RaylibCoreModule.GetRayCollisionQuad].
RayCollisionD GetRayCollisionQuad(
  RayD ray,
  Vector3D p1,
  Vector3D p2,
  Vector3D p3,
  Vector3D p4,
) => _module.GetRayCollisionQuad(ray, p1, p2, p3, p4);

