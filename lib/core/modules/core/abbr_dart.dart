import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibCoreDart get _module => RaylibBase.instance.module();

/// See [RaylibCoreDart.InitWindow].
void InitWindow(
  num width,
  num height,
  String title,
) => _module.InitWindow(width, height, title);

/// See [RaylibCoreDart.CloseWindow].
void CloseWindow() => _module.CloseWindow();

/// See [RaylibCoreDart.WindowShouldClose].
bool WindowShouldClose() => _module.WindowShouldClose();

/// See [RaylibCoreDart.IsWindowReady].
bool IsWindowReady() => _module.IsWindowReady();

/// See [RaylibCoreDart.IsWindowFullscreen].
bool IsWindowFullscreen() => _module.IsWindowFullscreen();

/// See [RaylibCoreDart.IsWindowHidden].
bool IsWindowHidden() => _module.IsWindowHidden();

/// See [RaylibCoreDart.IsWindowMinimized].
bool IsWindowMinimized() => _module.IsWindowMinimized();

/// See [RaylibCoreDart.IsWindowMaximized].
bool IsWindowMaximized() => _module.IsWindowMaximized();

/// See [RaylibCoreDart.IsWindowFocused].
bool IsWindowFocused() => _module.IsWindowFocused();

/// See [RaylibCoreDart.IsWindowResized].
bool IsWindowResized() => _module.IsWindowResized();

/// See [RaylibCoreDart.IsWindowState].
bool IsWindowState(
  ConfigFlags flag,
) => _module.IsWindowState(flag);

/// See [RaylibCoreDart.SetWindowState].
void SetWindowState(
  Iterable<ConfigFlags> flags,
) => _module.SetWindowState(flags);

/// See [RaylibCoreDart.ClearWindowState].
void ClearWindowState(
  Iterable<ConfigFlags> flags,
) => _module.ClearWindowState(flags);

/// See [RaylibCoreDart.ToggleFullscreen].
void ToggleFullscreen() => _module.ToggleFullscreen();

/// See [RaylibCoreDart.ToggleBorderlessWindowed].
void ToggleBorderlessWindowed() => _module.ToggleBorderlessWindowed();

/// See [RaylibCoreDart.MaximizeWindow].
void MaximizeWindow() => _module.MaximizeWindow();

/// See [RaylibCoreDart.MinimizeWindow].
void MinimizeWindow() => _module.MinimizeWindow();

/// See [RaylibCoreDart.RestoreWindow].
void RestoreWindow() => _module.RestoreWindow();

/// See [RaylibCoreDart.SetWindowIcon].
void SetWindowIcon(
  ImageD image,
) => _module.SetWindowIcon(image);

/// See [RaylibCoreDart.SetWindowIcons].
void SetWindowIcons(
  List<ImageD> images,
) => _module.SetWindowIcons(images);

/// See [RaylibCoreDart.SetWindowTitle].
void SetWindowTitle(
  String title,
) => _module.SetWindowTitle(title);

/// See [RaylibCoreDart.SetWindowPosition].
void SetWindowPosition(
  num x,
  num y,
) => _module.SetWindowPosition(x, y);

/// See [RaylibCoreDart.SetWindowMonitor].
void SetWindowMonitor(
  num monitor,
) => _module.SetWindowMonitor(monitor);

/// See [RaylibCoreDart.SetWindowMinSize].
void SetWindowMinSize(
  num width,
  num height,
) => _module.SetWindowMinSize(width, height);

/// See [RaylibCoreDart.SetWindowMaxSize].
void SetWindowMaxSize(
  num width,
  num height,
) => _module.SetWindowMaxSize(width, height);

/// See [RaylibCoreDart.SetWindowSize].
void SetWindowSize(
  num width,
  num height,
) => _module.SetWindowSize(width, height);

/// See [RaylibCoreDart.SetWindowOpacity].
void SetWindowOpacity(
  num opacity,
) => _module.SetWindowOpacity(opacity);

/// See [RaylibCoreDart.SetWindowFocused].
void SetWindowFocused() => _module.SetWindowFocused();

/// See [RaylibCoreDart.GetScreenWidth].
int GetScreenWidth() => _module.GetScreenWidth();

/// See [RaylibCoreDart.GetScreenHeight].
int GetScreenHeight() => _module.GetScreenHeight();

/// See [RaylibCoreDart.GetRenderWidth].
int GetRenderWidth() => _module.GetRenderWidth();

/// See [RaylibCoreDart.GetRenderHeight].
int GetRenderHeight() => _module.GetRenderHeight();

/// See [RaylibCoreDart.GetMonitorCount].
int GetMonitorCount() => _module.GetMonitorCount();

/// See [RaylibCoreDart.GetCurrentMonitor].
int GetCurrentMonitor() => _module.GetCurrentMonitor();

/// See [RaylibCoreDart.GetMonitorPosition].
Vector2D GetMonitorPosition(
  num monitor,
) => _module.GetMonitorPosition(monitor);

/// See [RaylibCoreDart.GetMonitorWidth].
int GetMonitorWidth(
  num monitor,
) => _module.GetMonitorWidth(monitor);

/// See [RaylibCoreDart.GetMonitorHeight].
int GetMonitorHeight(
  num monitor,
) => _module.GetMonitorHeight(monitor);

/// See [RaylibCoreDart.GetMonitorPhysicalWidth].
int GetMonitorPhysicalWidth(
  num monitor,
) => _module.GetMonitorPhysicalWidth(monitor);

/// See [RaylibCoreDart.GetMonitorPhysicalHeight].
int GetMonitorPhysicalHeight(
  num monitor,
) => _module.GetMonitorPhysicalHeight(monitor);

/// See [RaylibCoreDart.GetMonitorRefreshRate].
int GetMonitorRefreshRate(
  num monitor,
) => _module.GetMonitorRefreshRate(monitor);

/// See [RaylibCoreDart.GetWindowPosition].
Vector2D GetWindowPosition() => _module.GetWindowPosition();

/// See [RaylibCoreDart.GetWindowScaleDPI].
Vector2D GetWindowScaleDPI() => _module.GetWindowScaleDPI();

/// See [RaylibCoreDart.GetMonitorName].
String GetMonitorName(
  num monitor,
) => _module.GetMonitorName(monitor);

/// See [RaylibCoreDart.SetClipboardText].
void SetClipboardText(
  String text,
) => _module.SetClipboardText(text);

/// See [RaylibCoreDart.GetClipboardText].
String GetClipboardText() => _module.GetClipboardText();

/// See [RaylibCoreDart.GetClipboardImage].
ImageD GetClipboardImage() => _module.GetClipboardImage();

/// See [RaylibCoreDart.EnableEventWaiting].
void EnableEventWaiting() => _module.EnableEventWaiting();

/// See [RaylibCoreDart.DisableEventWaiting].
void DisableEventWaiting() => _module.DisableEventWaiting();

/// See [RaylibCoreDart.ShowCursor].
void ShowCursor() => _module.ShowCursor();

/// See [RaylibCoreDart.HideCursor].
void HideCursor() => _module.HideCursor();

/// See [RaylibCoreDart.IsCursorHidden].
bool IsCursorHidden() => _module.IsCursorHidden();

/// See [RaylibCoreDart.EnableCursor].
void EnableCursor() => _module.EnableCursor();

/// See [RaylibCoreDart.DisableCursor].
void DisableCursor() => _module.DisableCursor();

/// See [RaylibCoreDart.IsCursorOnScreen].
bool IsCursorOnScreen() => _module.IsCursorOnScreen();

/// See [RaylibCoreDart.ClearBackground].
void ClearBackground(
  ColorD color,
) => _module.ClearBackground(color);

/// See [RaylibCoreDart.BeginDrawing].
void BeginDrawing() => _module.BeginDrawing();

/// See [RaylibCoreDart.EndDrawing].
void EndDrawing() => _module.EndDrawing();

/// See [RaylibCoreDart.BeginMode2D].
void BeginMode2D(
  Camera2DD camera,
) => _module.BeginMode2D(camera);

/// See [RaylibCoreDart.EndMode2D].
void EndMode2D() => _module.EndMode2D();

/// See [RaylibCoreDart.BeginMode3D].
void BeginMode3D(
  Camera3DD camera,
) => _module.BeginMode3D(camera);

/// See [RaylibCoreDart.EndMode3D].
void EndMode3D() => _module.EndMode3D();

/// See [RaylibCoreDart.BeginTextureMode].
void BeginTextureMode(
  RenderTextureD target,
) => _module.BeginTextureMode(target);

/// See [RaylibCoreDart.EndTextureMode].
void EndTextureMode() => _module.EndTextureMode();

/// See [RaylibCoreDart.BeginShaderMode].
void BeginShaderMode(
  ShaderD shader,
) => _module.BeginShaderMode(shader);

/// See [RaylibCoreDart.EndShaderMode].
void EndShaderMode() => _module.EndShaderMode();

/// See [RaylibCoreDart.BeginBlendMode].
void BeginBlendMode(
  BlendMode mode,
) => _module.BeginBlendMode(mode);

/// See [RaylibCoreDart.EndBlendMode].
void EndBlendMode() => _module.EndBlendMode();

/// See [RaylibCoreDart.BeginScissorMode].
void BeginScissorMode(
  num x,
  num y,
  num width,
  num height,
) => _module.BeginScissorMode(x, y, width, height);

/// See [RaylibCoreDart.EndScissorMode].
void EndScissorMode() => _module.EndScissorMode();

/// See [RaylibCoreDart.BeginVrStereoMode].
void BeginVrStereoMode(
  VrStereoConfigD config,
) => _module.BeginVrStereoMode(config);

/// See [RaylibCoreDart.EndVrStereoMode].
void EndVrStereoMode() => _module.EndVrStereoMode();

/// See [RaylibCoreDart.LoadVrStereoConfig].
VrStereoConfigD LoadVrStereoConfig(
  VrDeviceInfoD device,
) => _module.LoadVrStereoConfig(device);

/// See [RaylibCoreDart.UnloadVrStereoConfig].
void UnloadVrStereoConfig(
  VrStereoConfigD config,
) => _module.UnloadVrStereoConfig(config);

/// See [RaylibCoreDart.LoadShader].
ShaderD LoadShader(
  String? vsFileName,
  String? fsFileName,
) => _module.LoadShader(vsFileName, fsFileName);

/// See [RaylibCoreDart.LoadShaderFromMemory].
ShaderD LoadShaderFromMemory(
  String? vsCode,
  String? fsCode,
) => _module.LoadShaderFromMemory(vsCode, fsCode);

/// See [RaylibCoreDart.IsShaderValid].
bool IsShaderValid(
  ShaderD shader,
) => _module.IsShaderValid(shader);

/// See [RaylibCoreDart.GetShaderLocation].
int GetShaderLocation(
  ShaderD shader,
  String uniformName,
) => _module.GetShaderLocation(shader, uniformName);

/// See [RaylibCoreDart.GetShaderLocationAttrib].
int GetShaderLocationAttrib(
  ShaderD shader,
  String attribName,
) => _module.GetShaderLocationAttrib(shader, attribName);

/// See [RaylibCoreDart.SetShaderValue].
void SetShaderValue(
  ShaderD shader,
  num locIndex,
  List<num> value,
  ShaderUniformDataType uniformType,
) => _module.SetShaderValue(shader, locIndex, value, uniformType);

/// See [RaylibCoreDart.SetShaderValueV].
void SetShaderValueV(
  ShaderD shader,
  num locIndex,
  List<num> value,
  ShaderUniformDataType uniformType,
  num count,
) => _module.SetShaderValueV(shader, locIndex, value, uniformType, count);

/// See [RaylibCoreDart.SetShaderValueMatrix].
void SetShaderValueMatrix(
  ShaderD shader,
  num locIndex,
  MatrixD mat,
) => _module.SetShaderValueMatrix(shader, locIndex, mat);

/// See [RaylibCoreDart.SetShaderValueTexture].
void SetShaderValueTexture(
  ShaderD shader,
  num locIndex,
  TextureD texture,
) => _module.SetShaderValueTexture(shader, locIndex, texture);

/// See [RaylibCoreDart.UnloadShader].
void UnloadShader(
  ShaderD shader,
) => _module.UnloadShader(shader);

/// See [RaylibCoreDart.GetScreenToWorldRay].
RayD GetScreenToWorldRay(
  Vector2D position,
  Camera3DD camera,
) => _module.GetScreenToWorldRay(position, camera);

/// See [RaylibCoreDart.GetScreenToWorldRayEx].
RayD GetScreenToWorldRayEx(
  Vector2D position,
  Camera3DD camera,
  num width,
  num height,
) => _module.GetScreenToWorldRayEx(position, camera, width, height);

/// See [RaylibCoreDart.GetWorldToScreen].
Vector2D GetWorldToScreen(
  Vector3D position,
  Camera3DD camera,
) => _module.GetWorldToScreen(position, camera);

/// See [RaylibCoreDart.GetWorldToScreenEx].
Vector2D GetWorldToScreenEx(
  Vector3D position,
  Camera3DD camera,
  num width,
  num height,
) => _module.GetWorldToScreenEx(position, camera, width, height);

/// See [RaylibCoreDart.GetWorldToScreen2D].
Vector2D GetWorldToScreen2D(
  Vector2D position,
  Camera2DD camera,
) => _module.GetWorldToScreen2D(position, camera);

/// See [RaylibCoreDart.GetScreenToWorld2D].
Vector2D GetScreenToWorld2D(
  Vector2D position,
  Camera2DD camera,
) => _module.GetScreenToWorld2D(position, camera);

/// See [RaylibCoreDart.GetCameraMatrix].
MatrixD GetCameraMatrix(
  Camera3DD camera,
) => _module.GetCameraMatrix(camera);

/// See [RaylibCoreDart.GetCameraMatrix2D].
MatrixD GetCameraMatrix2D(
  Camera2DD camera,
) => _module.GetCameraMatrix2D(camera);

/// See [RaylibCoreDart.SetTargetFPS].
void SetTargetFPS(
  num fps,
) => _module.SetTargetFPS(fps);

/// See [RaylibCoreDart.GetFrameTime].
double GetFrameTime() => _module.GetFrameTime();

/// See [RaylibCoreDart.GetTime].
double GetTime() => _module.GetTime();

/// See [RaylibCoreDart.GetFPS].
int GetFPS() => _module.GetFPS();

/// See [RaylibCoreDart.SwapScreenBuffer].
void SwapScreenBuffer() => _module.SwapScreenBuffer();

/// See [RaylibCoreDart.PollInputEvents].
void PollInputEvents() => _module.PollInputEvents();

/// See [RaylibCoreDart.WaitTime].
void WaitTime(
  num seconds,
) => _module.WaitTime(seconds);

/// See [RaylibCoreDart.SetRandomSeed].
void SetRandomSeed(
  num seed,
) => _module.SetRandomSeed(seed);

/// See [RaylibCoreDart.GetRandomValue].
int GetRandomValue(
  num min,
  num max,
) => _module.GetRandomValue(min, max);

/// See [RaylibCoreDart.LoadRandomSequence].
List<int> LoadRandomSequence(
  num count,
  num min,
  num max,
) => _module.LoadRandomSequence(count, min, max);

/// See [RaylibCoreDart.TakeScreenshot].
void TakeScreenshot(
  String fileName,
) => _module.TakeScreenshot(fileName);

/// See [RaylibCoreDart.SetConfigFlags].
void SetConfigFlags(
  Iterable<ConfigFlags> flags,
) => _module.SetConfigFlags(flags);

/// See [RaylibCoreDart.OpenURL].
void OpenURL(
  String url,
) => _module.OpenURL(url);

/// See [RaylibCoreDart.TraceLog].
void TraceLog(
  TraceLogLevel logLevel,
  String text,
) => _module.TraceLog(logLevel, text);

/// See [RaylibCoreDart.SetTraceLogLevel].
void SetTraceLogLevel(
  TraceLogLevel logLevel,
) => _module.SetTraceLogLevel(logLevel);

/// See [RaylibCoreDart.SetTraceLogCallback].
void SetTraceLogCallback(
  TraceLogCallbackBase callback,
) => _module.SetTraceLogCallback(callback);

/// See [RaylibCoreDart.SetLoadFileDataCallback].
void SetLoadFileDataCallback(
  LoadFileDataCallbackBase? callback
) => _module.SetLoadFileDataCallback(callback);

/// See [RaylibCoreDart.SetSaveFileDataCallback].
void SetSaveFileDataCallback(
  SaveFileDataCallbackBase? callback
) => _module.SetSaveFileDataCallback(callback);

/// See [RaylibCoreDart.SetLoadFileTextCallback].
void SetLoadFileTextCallback(
  LoadFileTextCallbackBase? callback
) => _module.SetLoadFileTextCallback(callback);

/// See [RaylibCoreDart.SetSaveFileTextCallback].
void SetSaveFileTextCallback(
  SaveFileTextCallbackBase? callback
) => _module.SetSaveFileTextCallback(callback);

/// See [RaylibCoreDart.LoadFileData].
Uint8List LoadFileData(
  String fileName,
) => _module.LoadFileData(fileName);

/// See [RaylibCoreDart.SaveFileData].
bool SaveFileData(
  String fileName,
  Uint8List data,
) => _module.SaveFileData(fileName, data);

/// See [RaylibCoreDart.ExportDataAsCode].
bool ExportDataAsCode(
  Uint8List data,
  String fileName,
) => _module.ExportDataAsCode(data, fileName);

/// See [RaylibCoreDart.LoadFileText].
String LoadFileText(
  String fileName,
) => _module.LoadFileText(fileName);

/// See [RaylibCoreDart.SaveFileText].
bool SaveFileText(
  String fileName,
  String text,
) => _module.SaveFileText(fileName, text);

/// See [RaylibCoreDart.FileRename].
int FileRename(
  String fileName,
  String fileRename,
) => _module.FileRename(fileName, fileRename);

/// See [RaylibCoreDart.FileRemove].
int FileRemove(
  String fileName,
) => _module.FileRemove(fileName);

/// See [RaylibCoreDart.FileCopy].
int FileCopy(
  String srcPath,
  String dstPath,
) => _module.FileCopy(srcPath, dstPath);

/// See [RaylibCoreDart.FileMove].
int FileMove(
  String srcPath,
  String dstPath,
) => _module.FileMove(srcPath, dstPath);

/// See [RaylibCoreDart.FileTextReplace].
int FileTextReplace(
  String fileName,
  String search,
  String replacement,
) => _module.FileTextReplace(fileName, search, replacement);

/// See [RaylibCoreDart.FileTextFindIndex].
int FileTextFindIndex(
  String fileName,
  String search,
) => _module.FileTextFindIndex(fileName, search);

/// See [RaylibCoreDart.FileExists].
bool FileExists(
  String fileName,
) => _module.FileExists(fileName);

/// See [RaylibCoreDart.DirectoryExists].
bool DirectoryExists(
  String dirPath,
) => _module.DirectoryExists(dirPath);

/// See [RaylibCoreDart.IsFileExtension].
bool IsFileExtension(
  String fileName,
  String ext,
) => _module.IsFileExtension(fileName, ext);

/// See [RaylibCoreDart.GetFileLength].
int GetFileLength(
  String fileName,
) => _module.GetFileLength(fileName);

/// See [RaylibCoreDart.GetFileExtension].
String GetFileExtension(
  String fileName,
) => _module.GetFileExtension(fileName);

/// See [RaylibCoreDart.GetFileName].
String GetFileName(
  String filePath,
) => _module.GetFileName(filePath);

/// See [RaylibCoreDart.GetFileNameWithoutExt].
String GetFileNameWithoutExt(
  String filePath,
) => _module.GetFileNameWithoutExt(filePath);

/// See [RaylibCoreDart.GetDirectoryFileCount].
int GetDirectoryFileCount(
  String dirPath, 
) => _module.GetDirectoryFileCount(dirPath);

/// See [RaylibCoreDart.GetDirectoryFileCountEx].
int GetDirectoryFileCountEx(
  String basePath,
  String filter,
  bool scanSubdirs,
) => _module.GetDirectoryFileCountEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreDart.GetDirectoryPath].
String GetDirectoryPath(
  String filePath,
) => _module.GetDirectoryPath(filePath);

/// See [RaylibCoreDart.GetPrevDirectoryPath].
String GetPrevDirectoryPath(
  String dirPath,
) => _module.GetPrevDirectoryPath(dirPath);

/// See [RaylibCoreDart.GetWorkingDirectory].
String GetWorkingDirectory() => _module.GetWorkingDirectory();

/// See [RaylibCoreDart.GetApplicationDirectory].
String GetApplicationDirectory() => _module.GetApplicationDirectory();

/// See [RaylibCoreDart.MakeDirectory].
int MakeDirectory(
  String dirPath,
) => _module.MakeDirectory(dirPath);

/// See [RaylibCoreDart.ChangeDirectory].
bool ChangeDirectory(
  String dir,
) => _module.ChangeDirectory(dir);

/// See [RaylibCoreDart.IsPathFile].
bool IsPathFile(
  String path,
) => _module.IsPathFile(path);

/// See [RaylibCoreDart.IsFileNameValid].
bool IsFileNameValid(
  String fileName,
) => _module.IsFileNameValid(fileName);

/// See [RaylibCoreDart.LoadDirectoryFiles].
FilePathListD LoadDirectoryFiles(
  String dirPath,
) => _module.LoadDirectoryFiles(dirPath);

/// See [RaylibCoreDart.LoadDirectoryFilesEx].
FilePathListD LoadDirectoryFilesEx(
  String basePath,
  String filter,
  bool scanSubdirs,
) => _module.LoadDirectoryFilesEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreDart.UnloadDirectoryFiles].
void UnloadDirectoryFiles(
  FilePathListD files,
) => _module.UnloadDirectoryFiles(files);

/// See [RaylibCoreDart.IsFileDropped].
bool IsFileDropped() => _module.IsFileDropped();

/// See [RaylibCoreDart.LoadDroppedFiles].
FilePathListD LoadDroppedFiles() => _module.LoadDroppedFiles();

/// See [RaylibCoreDart.UnloadDroppedFiles].
void UnloadDroppedFiles(
  FilePathListD files,
) => _module.UnloadDroppedFiles(files);

/// See [RaylibCoreDart.GetFileModTime].
int GetFileModTime(
  String fileName,
) => _module.GetFileModTime(fileName);

/// See [RaylibCoreDart.CompressData].
Uint8List CompressData(
  Uint8List data,
) => _module.CompressData(data);

/// See [RaylibCoreDart.DecompressData].
Uint8List DecompressData(
  Uint8List compData,
) => _module.DecompressData(compData);

/// See [RaylibCoreDart.EncodeDataBase64].
Uint8List EncodeDataBase64(
  Uint8List data,
) => _module.EncodeDataBase64(data);

/// See [RaylibCoreDart.DecodeDataBase64].
Uint8List DecodeDataBase64(
  Uint8List data,
) => _module.DecodeDataBase64(data);

/// See [RaylibCoreDart.ComputeCRC32].
int ComputeCRC32(
  Uint8List data,
) => _module.ComputeCRC32(data);

/// See [RaylibCoreDart.ComputeMD5].
Uint8List ComputeMD5(
  Uint8List data,
) => _module.ComputeMD5(data);

/// See [RaylibCoreDart.ComputeSHA1].
Uint8List ComputeSHA1(
  Uint8List data,
) => _module.ComputeSHA1(data);

/// See [RaylibCoreDart.ComputeSHA256].
Uint8List ComputeSHA256(
  Uint8List data,
) => _module.ComputeSHA256(data);

/// See [RaylibCoreDart.LoadAutomationEventList].
AutomationEventListD LoadAutomationEventList(
  String? fileName,
) => _module.LoadAutomationEventList(fileName);

/// See [RaylibCoreDart.UnloadAutomationEventList].
void UnloadAutomationEventList(
  AutomationEventListD list,
) => _module.UnloadAutomationEventList(list);

/// See [RaylibCoreDart.ExportAutomationEventList].
bool ExportAutomationEventList(
  AutomationEventListD list,
  String fileName,
) => _module.ExportAutomationEventList(list, fileName);

/// See [RaylibCoreDart.SetAutomationEventList].
void SetAutomationEventList(
  AutomationEventListD list,
) => _module.SetAutomationEventList(list);

/// See [RaylibCoreDart.SetAutomationEventBaseFrame].
void SetAutomationEventBaseFrame(
  int frame,
) => _module.SetAutomationEventBaseFrame(frame);

/// See [RaylibCoreDart.StartAutomationEventRecording].
void StartAutomationEventRecording() => _module.StartAutomationEventRecording();

/// See [RaylibCoreDart.StopAutomationEventRecording].
void StopAutomationEventRecording() => _module.StopAutomationEventRecording();

/// See [RaylibCoreDart.PlayAutomationEvent].
void PlayAutomationEvent(
  AutomationEventD event,
) => _module.PlayAutomationEvent(event);

/// See [RaylibCoreDart.IsKeyPressed].
bool IsKeyPressed(
  KeyboardKey key,
) => _module.IsKeyPressed(key);

/// See [RaylibCoreDart.IsKeyPressedRepeat].
bool IsKeyPressedRepeat(
  KeyboardKey key,
) => _module.IsKeyPressedRepeat(key);

/// See [RaylibCoreDart.IsKeyDown].
bool IsKeyDown(
  KeyboardKey key,
) => _module.IsKeyDown(key);

/// See [RaylibCoreDart.IsKeyReleased].
bool IsKeyReleased(
  KeyboardKey key,
) => _module.IsKeyReleased(key);

/// See [RaylibCoreDart.IsKeyUp].
bool IsKeyUp(
  KeyboardKey key,
) => _module.IsKeyUp(key);

/// See [RaylibCoreDart.GetKeyName].
String GetKeyName(
  KeyboardKey key,
) => _module.GetKeyName(key);

/// See [RaylibCoreDart.GetKeyPressed].
int GetKeyPressed() => _module.GetKeyPressed();

/// See [RaylibCoreDart.GetCharPressed].
int GetCharPressed() => _module.GetCharPressed();

/// See [RaylibCoreDart.SetExitKey].
void SetExitKey(
  KeyboardKey key,
) => _module.SetExitKey(key);

/// See [RaylibCoreDart.IsGamepadAvailable].
bool IsGamepadAvailable(
  num gamepad,
) => _module.IsGamepadAvailable(gamepad);

/// See [RaylibCoreDart.GetGamepadName].
String GetGamepadName(
  num gamepad,
) => _module.GetGamepadName(gamepad);

/// See [RaylibCoreDart.IsGamepadButtonPressed].
bool IsGamepadButtonPressed(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonPressed(gamepad, button);

/// See [RaylibCoreDart.IsGamepadButtonDown].
bool IsGamepadButtonDown(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonDown(gamepad, button);

/// See [RaylibCoreDart.IsGamepadButtonReleased].
bool IsGamepadButtonReleased(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonReleased(gamepad, button);

/// See [RaylibCoreDart.IsGamepadButtonUp].
bool IsGamepadButtonUp(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonUp(gamepad, button);

/// See [RaylibCoreDart.GetGamepadButtonPressed].
GamepadButton GetGamepadButtonPressed() => _module.GetGamepadButtonPressed();

/// See [RaylibCoreDart.GetGamepadAxisCount].
int GetGamepadAxisCount(
  num gamepad,
) => _module.GetGamepadAxisCount(gamepad);

/// See [RaylibCoreDart.GetGamepadAxisMovement].
double GetGamepadAxisMovement(
  num gamepad,
  GamepadAxis axis,
) => _module.GetGamepadAxisMovement(gamepad, axis);

/// See [RaylibCoreDart.SetGamepadMappings].
int SetGamepadMappings(
  String mappings,
) => _module.SetGamepadMappings(mappings);

/// See [RaylibCoreDart.SetGamepadVibration].
void SetGamepadVibration(
  num gamepad,
  num leftMotor,
  num rightMotor,
  num duration,
) => _module.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration);

/// See [RaylibCoreDart.IsMouseButtonPressed].
bool IsMouseButtonPressed(
  MouseButton button,
) => _module.IsMouseButtonPressed(button);

/// See [RaylibCoreDart.IsMouseButtonDown].
bool IsMouseButtonDown(
  MouseButton button,
) => _module.IsMouseButtonDown(button);

/// See [RaylibCoreDart.IsMouseButtonReleased].
bool IsMouseButtonReleased(
  MouseButton button,
) => _module.IsMouseButtonReleased(button);

/// See [RaylibCoreDart.IsMouseButtonUp].
bool IsMouseButtonUp(
  MouseButton button,
) => _module.IsMouseButtonUp(button);

/// See [RaylibCoreDart.GetMouseX].
int GetMouseX() => _module.GetMouseX();

/// See [RaylibCoreDart.GetMouseY].
int GetMouseY() => _module.GetMouseY();

/// See [RaylibCoreDart.GetMousePosition].
Vector2D GetMousePosition() => _module.GetMousePosition();

/// See [RaylibCoreDart.GetMouseDelta].
Vector2D GetMouseDelta() => _module.GetMouseDelta();

/// See [RaylibCoreDart.SetMousePosition].
void SetMousePosition(
  num x,
  num y,
) => _module.SetMousePosition(x, y);

/// See [RaylibCoreDart.SetMouseOffset].
void SetMouseOffset(
  num offsetX,
  num offsetY,
) => _module.SetMouseOffset(offsetX, offsetY);

/// See [RaylibCoreDart.SetMouseScale].
void SetMouseScale(
  num scaleX,
  num scaleY,
) => _module.SetMouseScale(scaleX, scaleY);

/// See [RaylibCoreDart.GetMouseWheelMove].
double GetMouseWheelMove() => _module.GetMouseWheelMove();

/// See [RaylibCoreDart.GetMouseWheelMoveV].
Vector2D GetMouseWheelMoveV() => _module.GetMouseWheelMoveV();

/// See [RaylibCoreDart.SetMouseCursor].
void SetMouseCursor(
  MouseCursor cursor,
) => _module.SetMouseCursor(cursor);

/// See [RaylibCoreDart.GetTouchX].
int GetTouchX() => _module.GetTouchX();

/// See [RaylibCoreDart.GetTouchY].
int GetTouchY() => _module.GetTouchY();

/// See [RaylibCoreDart.GetTouchPosition].
Vector2D GetTouchPosition(
  num index,
) => _module.GetTouchPosition(index);

/// See [RaylibCoreDart.GetTouchPointId].
int GetTouchPointId(
  num index,
) => _module.GetTouchPointId(index);

/// See [RaylibCoreDart.GetTouchPointCount].
int GetTouchPointCount() => _module.GetTouchPointCount();

/// See [RaylibCoreDart.SetGesturesEnabled].
void SetGesturesEnabled(
  Iterable<Gesture> flags,
) => _module.SetGesturesEnabled(flags);

/// See [RaylibCoreDart.IsGestureDetected].
bool IsGestureDetected(
  Gesture key,
) => _module.IsGestureDetected(key);

/// See [RaylibCoreDart.GetGestureDetected].
Gesture GetGestureDetected() => _module.GetGestureDetected();

/// See [RaylibCoreDart.GetGestureHoldDuration].
double GetGestureHoldDuration() => _module.GetGestureHoldDuration();

/// See [RaylibCoreDart.GetGestureDragVector].
Vector2D GetGestureDragVector() => _module.GetGestureDragVector();

/// See [RaylibCoreDart.GetGestureDragAngle].
double GetGestureDragAngle() => _module.GetGestureDragAngle();

/// See [RaylibCoreDart.GetGesturePinchVector].
Vector2D GetGesturePinchVector() => _module.GetGesturePinchVector();

/// See [RaylibCoreDart.GetGesturePinchAngle].
double GetGesturePinchAngle() => _module.GetGesturePinchAngle();

/// See [RaylibCoreDart.ProcessGestureEvent].
void ProcessGestureEvent(
  GestureEventD event,
) => _module.ProcessGestureEvent(event);

/// See [RaylibCoreDart.UpdateGestures].
void UpdateGestures() => _module.UpdateGestures();

/// See [RaylibCoreDart.UpdateCamera].
void UpdateCamera(
  Camera3DD camera,
  CameraMode mode,
) => _module.UpdateCamera(camera, mode);

/// See [RaylibCoreDart.UpdateCameraPro].
void UpdateCameraPro(
  Camera3DD camera,
  Vector3D movement,
  Vector3D rotation,
  num zoom,
) => _module.UpdateCameraPro(camera, movement, rotation, zoom);

/// See [RaylibCoreDart.SetShapesTexture].
void SetShapesTexture(
  TextureD texture,
  RectangleD source,
) => _module.SetShapesTexture(texture, source);

/// See [RaylibCoreDart.GetShapesTexture].
TextureD GetShapesTexture() => _module.GetShapesTexture();

/// See [RaylibCoreDart.GetShapesTextureRectangle].
RectangleD GetShapesTextureRectangle() => _module.GetShapesTextureRectangle();

/// See [RaylibCoreDart.DrawPixel].
void DrawPixel(
  num posX,
  num posY,
  ColorD color,
) => _module.DrawPixel(posX, posY, color);

/// See [RaylibCoreDart.DrawPixelV].
void DrawPixelV(
  Vector2D position,
  ColorD color,
) => _module.DrawPixelV(position, color);

/// See [RaylibCoreDart.DrawLine].
void DrawLine(
  num startPosX,
  num startPosY,
  num endPosX,
  num endPosY,
  ColorD color,
) => _module.DrawLine(startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreDart.DrawLineV].
void DrawLineV(
  Vector2D startPos,
  Vector2D endPos,
  ColorD color,
) => _module.DrawLineV(startPos, endPos, color);

/// See [RaylibCoreDart.DrawLineEx].
void DrawLineEx(
  Vector2D startPos,
  Vector2D endPos,
  num thick,
  ColorD color,
) => _module.DrawLineEx(startPos, endPos, thick, color);

/// See [RaylibCoreDart.DrawLineStrip].
void DrawLineStrip(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawLineStrip(points, color);

/// See [RaylibCoreDart.DrawLineBezier].
void DrawLineBezier(
  Vector2D startPos,
  Vector2D endPos,
  num thick,
  ColorD color,
) => _module.DrawLineBezier(startPos, endPos, thick, color);

/// See [RaylibCoreDart.DrawLineDashed].
void DrawLineDashed(
  Vector2D startPos,
  Vector2D endPos,
  num dashSize,
  num spaceSize,
  ColorD color,
) => _module.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color);

/// See [RaylibCoreDart.DrawCircle].
void DrawCircle(
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.DrawCircle(centerX, centerY, radius, color);

/// See [RaylibCoreDart.DrawCircleSector].
void DrawCircleSector(
  Vector2D center,
  num radius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawCircleSector(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreDart.DrawCircleSectorLines].
void DrawCircleSectorLines(
  Vector2D center,
  num radius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreDart.DrawCircleGradient].
void DrawCircleGradient(
  Vector2D center,
  num radius,
  ColorD inner,
  ColorD outer,
) => _module.DrawCircleGradient(center, radius, inner, outer);

/// See [RaylibCoreDart.DrawCircleV].
void DrawCircleV(
  Vector2D center,
  num radius,
  ColorD color,
) => _module.DrawCircleV(center, radius, color);

/// See [RaylibCoreDart.DrawCircleLines].
void DrawCircleLines(
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.DrawCircleLines(centerX, centerY, radius, color);

/// See [RaylibCoreDart.DrawCircleLinesV].
void DrawCircleLinesV(
  Vector2D center,
  num radius,
  ColorD color,
) => _module.DrawCircleLinesV(center, radius, color);

/// See [RaylibCoreDart.DrawEllipse].
void DrawEllipse(
  num centerX,
  num centerY,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipse(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreDart.DrawEllipseV].
void DrawEllipseV(
  Vector2D center,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseV(center, radiusH, radiusV, color);

/// See [RaylibCoreDart.DrawEllipseLines].
void DrawEllipseLines(
  num centerX,
  num centerY,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreDart.DrawEllipseLinesV].
void DrawEllipseLinesV(
  Vector2D center,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseLinesV(center, radiusH, radiusV, color);

/// See [RaylibCoreDart.DrawRing].
void DrawRing(
  Vector2D center,
  num innerRadius,
  num outerRadius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreDart.DrawRingLines].
void DrawRingLines(
  Vector2D center,
  num innerRadius,
  num outerRadius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreDart.DrawRectangle].
void DrawRectangle(
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.DrawRectangle(posX, posY, width, height, color);

/// See [RaylibCoreDart.DrawRectangleV].
void DrawRectangleV(
  Vector2D position,
  Vector2D size,
  ColorD color,
) => _module.DrawRectangleV(position, size, color);

/// See [RaylibCoreDart.DrawRectangleRec].
void DrawRectangleRec(
  RectangleD rec,
  ColorD color,
) => _module.DrawRectangleRec(rec, color);

/// See [RaylibCoreDart.DrawRectanglePro].
void DrawRectanglePro(
  RectangleD rec,
  Vector2D origin,
  num rotation,
  ColorD color,
) => _module.DrawRectanglePro(rec, origin, rotation, color);

/// See [RaylibCoreDart.DrawRectangleGradientV].
void DrawRectangleGradientV(
  num posX,
  num posY,
  num width,
  num height,
  ColorD top,
  ColorD bottom,
) => _module.DrawRectangleGradientV(posX, posY, width, height, top, bottom);

/// See [RaylibCoreDart.DrawRectangleGradientH].
void DrawRectangleGradientH(
  num posX,
  num posY,
  num width,
  num height,
  ColorD left,
  ColorD right,
) => _module.DrawRectangleGradientH(posX, posY, width, height, left, right);

/// See [RaylibCoreDart.DrawRectangleGradientEx].
void DrawRectangleGradientEx(
  RectangleD rec,
  ColorD topLeft,
  ColorD bottomLeft,
  ColorD topRight,
  ColorD bottomRight,
) => _module.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);

/// See [RaylibCoreDart.DrawRectangleLines].
void DrawRectangleLines(
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.DrawRectangleLines(posX, posY, width, height, color);

/// See [RaylibCoreDart.DrawRectangleLinesEx].
void DrawRectangleLinesEx(
  RectangleD rec,
  num lineThick,
  ColorD color,
) => _module.DrawRectangleLinesEx(rec, lineThick, color);

/// See [RaylibCoreDart.DrawRectangleRounded].
void DrawRectangleRounded(
  RectangleD rec,
  num roundness,
  num segments,
  ColorD color,
) => _module.DrawRectangleRounded(rec, roundness, segments, color);

/// See [RaylibCoreDart.DrawRectangleRoundedLines].
void DrawRectangleRoundedLines(
  RectangleD rec,
  num roundness,
  num segments,
  ColorD color,
) => _module.DrawRectangleRoundedLines(rec, roundness, segments, color);

/// See [RaylibCoreDart.DrawRectangleRoundedLinesEx].
void DrawRectangleRoundedLinesEx(
  RectangleD rec,
  num roundness,
  num segments,
  num lineThick,
  ColorD color,
) => _module.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);

/// See [RaylibCoreDart.DrawTriangle].
void DrawTriangle(
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.DrawTriangle(v1, v2, v3, color);

/// See [RaylibCoreDart.DrawTriangleLines].
void DrawTriangleLines(
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.DrawTriangleLines(v1, v2, v3, color);

/// See [RaylibCoreDart.DrawTriangleFan].
void DrawTriangleFan(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawTriangleFan(points, color);

/// See [RaylibCoreDart.DrawTriangleStrip].
void DrawTriangleStrip(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawTriangleStrip(points, color);

/// See [RaylibCoreDart.DrawPoly].
void DrawPoly(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  ColorD color,
) => _module.DrawPoly(center, sides, radius, rotation, color);

/// See [RaylibCoreDart.DrawPolyLines].
void DrawPolyLines(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  ColorD color,
) => _module.DrawPolyLines(center, sides, radius, rotation, color);

/// See [RaylibCoreDart.DrawPolyLinesEx].
void DrawPolyLinesEx(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  num lineThick,
  ColorD color,
) => _module.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color);

/// See [RaylibCoreDart.DrawSplineLinear].
void DrawSplineLinear(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineLinear(points, thick, color);

/// See [RaylibCoreDart.DrawSplineBasis].
void DrawSplineBasis(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBasis(points, thick, color);

/// See [RaylibCoreDart.DrawSplineCatmullRom].
void DrawSplineCatmullRom(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineCatmullRom(points, thick, color);

/// See [RaylibCoreDart.DrawSplineBezierQuadratic].
void DrawSplineBezierQuadratic(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBezierQuadratic(points, thick, color);

/// See [RaylibCoreDart.DrawSplineBezierCubic].
void DrawSplineBezierCubic(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBezierCubic(points, thick, color);

/// See [RaylibCoreDart.DrawSplineSegmentLinear].
void DrawSplineSegmentLinear(
  Vector2D p1,
  Vector2D p2,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentLinear(p1, p2, thick, color);

/// See [RaylibCoreDart.DrawSplineSegmentBasis].
void DrawSplineSegmentBasis(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreDart.DrawSplineSegmentCatmullRom].
void DrawSplineSegmentCatmullRom(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreDart.DrawSplineSegmentBezierQuadratic].
void DrawSplineSegmentBezierQuadratic(
  Vector2D p1,
  Vector2D c2,
  Vector2D p3,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);

/// See [RaylibCoreDart.DrawSplineSegmentBezierCubic].
void DrawSplineSegmentBezierCubic(
  Vector2D p1,
  Vector2D c2,
  Vector2D c3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);

/// See [RaylibCoreDart.GetSplinePointLinear].
Vector2D GetSplinePointLinear(
  Vector2D startPos,
  Vector2D endPos,
  num t,
) => _module.GetSplinePointLinear(startPos, endPos, t);

/// See [RaylibCoreDart.GetSplinePointBasis].
Vector2D GetSplinePointBasis(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointBasis(p1, p2, p3, p4, t);

/// See [RaylibCoreDart.GetSplinePointCatmullRom].
Vector2D GetSplinePointCatmullRom(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointCatmullRom(p1, p2, p3, p4, t);

/// See [RaylibCoreDart.GetSplinePointBezierQuad].
Vector2D GetSplinePointBezierQuad(
  Vector2D p1,
  Vector2D c2,
  Vector2D p3,
  num t,
) => _module.GetSplinePointBezierQuad(p1, c2, p3, t);

/// See [RaylibCoreDart.GetSplinePointBezierCubic].
Vector2D GetSplinePointBezierCubic(
  Vector2D p1,
  Vector2D c2,
  Vector2D c3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointBezierCubic(p1, c2, c3, p4, t);

/// See [RaylibCoreDart.CheckCollisionRecs].
bool CheckCollisionRecs(
  RectangleD rec1,
  RectangleD rec2,
) => _module.CheckCollisionRecs(rec1, rec2);

/// See [RaylibCoreDart.CheckCollisionCircles].
bool CheckCollisionCircles(
  Vector2D center1,
  num radius1,
  Vector2D center2,
  num radius2,
) => _module.CheckCollisionCircles(center1, radius1, center2, radius2);

/// See [RaylibCoreDart.CheckCollisionCircleRec].
bool CheckCollisionCircleRec(
  Vector2D center,
  num radius,
  RectangleD rec,
) => _module.CheckCollisionCircleRec(center, radius, rec);

/// See [RaylibCoreDart.CheckCollisionCircleLine].
bool CheckCollisionCircleLine(
  Vector2D center,
  num radius,
  Vector2D p1,
  Vector2D p2,
) => _module.CheckCollisionCircleLine(center, radius, p1, p2);

/// See [RaylibCoreDart.CheckCollisionPointRec].
bool CheckCollisionPointRec(
  Vector2D point,
  RectangleD rec,
) => _module.CheckCollisionPointRec(point, rec);

/// See [RaylibCoreDart.CheckCollisionPointCircle].
bool CheckCollisionPointCircle(
  Vector2D point,
  Vector2D center,
  num radius,
) => _module.CheckCollisionPointCircle(point, center, radius);

/// See [RaylibCoreDart.CheckCollisionPointTriangle].
bool CheckCollisionPointTriangle(
  Vector2D point,
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
) => _module.CheckCollisionPointTriangle(point, p1, p2, p3);

/// See [RaylibCoreDart.CheckCollisionPointLine].
bool CheckCollisionPointLine(
  Vector2D point,
  Vector2D p1,
  Vector2D p2,
  num threshold,
) => _module.CheckCollisionPointLine(point, p1, p2, threshold);

/// See [RaylibCoreDart.CheckCollisionPointPoly].
bool CheckCollisionPointPoly(
  Vector2D point,
  List<Vector2D> points,
) => _module.CheckCollisionPointPoly(point, points);

/// See [RaylibCoreDart.CheckCollisionLines].
(bool result, Vector2D collisionPoint) CheckCollisionLines(
  Vector2D startPos1,
  Vector2D endPos1,
  Vector2D startPos2,
  Vector2D endPos2,
) => _module.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2);

/// See [RaylibCoreDart.GetCollisionRec].
RectangleD GetCollisionRec(
  RectangleD rec1,
  RectangleD rec2,
) => _module.GetCollisionRec(rec1, rec2);

/// See [RaylibCoreDart.LoadImage].
ImageD LoadImage(
  String fileName,
) => _module.LoadImage(fileName);

/// See [RaylibCoreDart.LoadImageRaw].
ImageD LoadImageRaw(
  String fileName,
  num width,
  num height,
  PixelFormat format,
  num headerSize,
) => _module.LoadImageRaw(fileName, width, height, format, headerSize);

/// See [RaylibCoreDart.LoadImageAnim].
ImageD LoadImageAnim(
  String fileName,
) => _module.LoadImageAnim(fileName);

/// See [RaylibCoreDart.LoadImageAnimFromMemory].
ImageD LoadImageAnimFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadImageAnimFromMemory(fileType, fileData);

/// See [RaylibCoreDart.LoadImageFromMemory].
ImageD LoadImageFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadImageFromMemory(fileType, fileData);

/// See [RaylibCoreDart.LoadImageFromTexture].
ImageD LoadImageFromTexture(
  TextureD texture,
) => _module.LoadImageFromTexture(texture);

/// See [RaylibCoreDart.LoadImageFromScreen].
ImageD LoadImageFromScreen() => _module.LoadImageFromScreen();

/// See [RaylibCoreDart.IsImageValid].
bool IsImageValid(
  ImageD image,
) => _module.IsImageValid(image);

/// See [RaylibCoreDart.UnloadImage].
void UnloadImage(
  ImageD image,
) => _module.UnloadImage(image);

/// See [RaylibCoreDart.ExportImage].
bool ExportImage(
  ImageD image,
  String fileName,
) => _module.ExportImage(image, fileName);

/// See [RaylibCoreDart.ExportImageToMemory].
(MemoryPointer<RUint8> dataPtr, int dataSize) ExportImageToMemory(
  ImageD image,
  String fileType,
) => _module.ExportImageToMemory(image, fileType);

/// See [RaylibCoreDart.ExportImageAsCode].
bool ExportImageAsCode(
  ImageD image,
  String fileName,
) => _module.ExportImageAsCode(image, fileName);

/// See [RaylibCoreDart.GenImageColor].
ImageD GenImageColor(
  num width,
  num height,
  ColorD color,
) => _module.GenImageColor(width, height, color);

/// See [RaylibCoreDart.GenImageGradientLinear].
ImageD GenImageGradientLinear(
  num width,
  num height,
  num direction,
  ColorD start,
  ColorD end,
) => _module.GenImageGradientLinear(width, height, direction, start, end);

/// See [RaylibCoreDart.GenImageGradientRadial].
ImageD GenImageGradientRadial(
  num width,
  num height,
  num density,
  ColorD inner,
  ColorD outer,
) => _module.GenImageGradientRadial(width, height, density, inner, outer);

/// See [RaylibCoreDart.GenImageGradientSquare].
ImageD GenImageGradientSquare(
  num width,
  num height,
  num density,
  ColorD inner,
  ColorD outer,
) => _module.GenImageGradientSquare(width, height, density, inner, outer);

/// See [RaylibCoreDart.GenImageChecked].
ImageD GenImageChecked(
  num width,
  num height,
  num checksX,
  num checksY,
  ColorD col1,
  ColorD col2,
) => _module.GenImageChecked(width, height, checksX, checksY, col1, col2);

/// See [RaylibCoreDart.GenImageWhiteNoise].
ImageD GenImageWhiteNoise(
  num width,
  num height,
  num factor,
) => _module.GenImageWhiteNoise(width, height, factor);

/// See [RaylibCoreDart.GenImagePerlinNoise].
ImageD GenImagePerlinNoise(
  num width,
  num height,
  num offsetX,
  num offsetY,
  num scale,
) => _module.GenImagePerlinNoise(width, height, offsetX, offsetY, scale);

/// See [RaylibCoreDart.GenImageCellular].
ImageD GenImageCellular(
  num width,
  num height,
  num tileSize,
) => _module.GenImageCellular(width, height, tileSize);

/// See [RaylibCoreDart.GenImageText].
ImageD GenImageText(
  num width,
  num height,
  String text,
) => _module.GenImageText(width, height, text);

/// See [RaylibCoreDart.ImageCopy].
ImageD ImageCopy(
  ImageD image,
) => _module.ImageCopy(image);

/// See [RaylibCoreDart.ImageFromImage].
ImageD ImageFromImage(
  ImageD image,
  RectangleD rec,
) => _module.ImageFromImage(image, rec);

/// See [RaylibCoreDart.ImageFromChannel].
ImageD ImageFromChannel(
  ImageD image,
  num selectedChannel,
) => _module.ImageFromChannel(image, selectedChannel);

/// See [RaylibCoreDart.ImageText].
ImageD ImageText(
  String text,
  num fontSize,
  ColorD color,
) => _module.ImageText(text, fontSize, color);

/// See [RaylibCoreDart.ImageTextEx].
ImageD ImageTextEx(
  FontD font,
  String text,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.ImageTextEx(font, text, fontSize, spacing, tint);

/// See [RaylibCoreDart.ImageFormat].
void ImageFormat(
  ImageD image,
  PixelFormat newFormat,
) => _module.ImageFormat(image, newFormat);

/// See [RaylibCoreDart.ImageToPOT].
void ImageToPOT(
  ImageD image,
  ColorD fill,
) => _module.ImageToPOT(image, fill);

/// See [RaylibCoreDart.ImageCrop].
void ImageCrop(
  ImageD image,
  RectangleD crop,
) => _module.ImageCrop(image, crop);

/// See [RaylibCoreDart.ImageAlphaCrop].
void ImageAlphaCrop(
  ImageD image,
  num threshold,
) => _module.ImageAlphaCrop(image, threshold);

/// See [RaylibCoreDart.ImageAlphaClear].
void ImageAlphaClear(
  ImageD image,
  ColorD color,
  num threshold,
) => _module.ImageAlphaClear(image, color, threshold);

/// See [RaylibCoreDart.ImageAlphaMask].
void ImageAlphaMask(
  ImageD image,
  ImageD alphaMask,
) => _module.ImageAlphaMask(image, alphaMask);

/// See [RaylibCoreDart.ImageAlphaPremultiply].
void ImageAlphaPremultiply(
  ImageD image,
) => _module.ImageAlphaPremultiply(image);

/// See [RaylibCoreDart.ImageBlurGaussian].
void ImageBlurGaussian(
  ImageD image,
  num blurSize,
) => _module.ImageBlurGaussian(image, blurSize);

/// See [RaylibCoreDart.ImageKernelConvolution].
void ImageKernelConvolution(
  ImageD image,
  List<double> kernel,
) => _module.ImageKernelConvolution(image, kernel);

/// See [RaylibCoreDart.ImageResize].
void ImageResize(
  ImageD image,
  num newWidth,
  num newHeight,
) => _module.ImageResize(image, newWidth, newHeight);

/// See [RaylibCoreDart.ImageResizeNN].
void ImageResizeNN(
  ImageD image,
  num newWidth,
  num newHeight,
) => _module.ImageResizeNN(image, newWidth, newHeight);

/// See [RaylibCoreDart.ImageResizeCanvas].
void ImageResizeCanvas(
  ImageD image,
  num newWidth,
  num newHeight,
  num offsetX,
  num offsetY,
  ColorD fill,
) => _module.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill);

/// See [RaylibCoreDart.ImageMipmaps].
void ImageMipmaps(
  ImageD image,
) => _module.ImageMipmaps(image);

/// See [RaylibCoreDart.ImageDither].
void ImageDither(
  ImageD image,
  num rBpp,
  num gBpp,
  num bBpp,
  num aBpp,
) => _module.ImageDither(image, rBpp, gBpp, bBpp, aBpp);

/// See [RaylibCoreDart.ImageFlipVertical].
void ImageFlipVertical(
  ImageD image,
) => _module.ImageFlipVertical(image);

/// See [RaylibCoreDart.ImageFlipHorizontal].
void ImageFlipHorizontal(
  ImageD image,
) => _module.ImageFlipHorizontal(image);

/// See [RaylibCoreDart.ImageRotate].
void ImageRotate(
  ImageD image,
  num degrees,
) => _module.ImageRotate(image, degrees);

/// See [RaylibCoreDart.ImageRotateCW].
void ImageRotateCW(
  ImageD image,
) => _module.ImageRotateCW(image);

/// See [RaylibCoreDart.ImageRotateCCW].
void ImageRotateCCW(
  ImageD image,
) => _module.ImageRotateCCW(image);

/// See [RaylibCoreDart.ImageColorTint].
void ImageColorTint(
  ImageD image,
  ColorD color,
) => _module.ImageColorTint(image, color);

/// See [RaylibCoreDart.ImageColorInvert].
void ImageColorInvert(
  ImageD image,
) => _module.ImageColorInvert(image);

/// See [RaylibCoreDart.ImageColorGrayscale].
void ImageColorGrayscale(
  ImageD image,
) => _module.ImageColorGrayscale(image);

/// See [RaylibCoreDart.ImageColorContrast].
void ImageColorContrast(
  ImageD image,
  num contrast,
) => _module.ImageColorContrast(image, contrast);

/// See [RaylibCoreDart.ImageColorBrightness].
void ImageColorBrightness(
  ImageD image,
  num brightness,
) => _module.ImageColorBrightness(image, brightness);

/// See [RaylibCoreDart.ImageColorReplace].
void ImageColorReplace(
  ImageD image,
  ColorD color,
  ColorD replace,
) => _module.ImageColorReplace(image, color, replace);

/// See [RaylibCoreDart.LoadImageColors].
List<ColorD> LoadImageColors(
  ImageD image,
) => _module.LoadImageColors(image);

/// See [RaylibCoreDart.LoadImagePalette].
List<ColorD> LoadImagePalette(
  ImageD image,
  num maxPaletteSize,
) => _module.LoadImagePalette(image, maxPaletteSize);

/// See [RaylibCoreDart.GetImageAlphaBorder].
RectangleD GetImageAlphaBorder(
  ImageD image,
  num threshold,
) => _module.GetImageAlphaBorder(image, threshold);

/// See [RaylibCoreDart.GetImageColor].
ColorD GetImageColor(
  ImageD image,
  num x,
  num y,
) => _module.GetImageColor(image, x, y);

/// See [RaylibCoreDart.ImageClearBackground].
void ImageClearBackground(
  ImageD dst,
  ColorD color,
) => _module.ImageClearBackground(dst, color);

/// See [RaylibCoreDart.ImageDrawPixel].
void ImageDrawPixel(
  ImageD dst,
  num posX,
  num posY,
  ColorD color,
) => _module.ImageDrawPixel(dst, posX, posY, color);

/// See [RaylibCoreDart.ImageDrawPixelV].
void ImageDrawPixelV(
  ImageD dst,
  Vector2D position,
  ColorD color,
) => _module.ImageDrawPixelV(dst, position, color);

/// See [RaylibCoreDart.ImageDrawLine].
void ImageDrawLine(
  ImageD dst,
  num startPosX,
  num startPosY,
  num endPosX,
  num endPosY,
  ColorD color,
) => _module.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreDart.ImageDrawLineV].
void ImageDrawLineV(
  ImageD dst,
  Vector2D start,
  Vector2D end,
  ColorD color,
) => _module.ImageDrawLineV(dst, start, end, color);

/// See [RaylibCoreDart.ImageDrawLineEx].
void ImageDrawLineEx(
  ImageD dst,
  Vector2D start,
  Vector2D end,
  num thick,
  ColorD color,
) => _module.ImageDrawLineEx(dst, start, end, thick, color);

/// See [RaylibCoreDart.ImageDrawCircle].
void ImageDrawCircle(
  ImageD dst,
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.ImageDrawCircle(dst, centerX, centerY, radius, color);

/// See [RaylibCoreDart.ImageDrawCircleV].
void ImageDrawCircleV(
  ImageD dst,
  Vector2D center,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleV(dst, center, radius, color);

/// See [RaylibCoreDart.ImageDrawCircleLines].
void ImageDrawCircleLines(
  ImageD dst,
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleLines(dst, centerX, centerY, radius, color);

/// See [RaylibCoreDart.ImageDrawCircleLinesV].
void ImageDrawCircleLinesV(
  ImageD dst,
  Vector2D center,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleLinesV(dst, center, radius, color);

/// See [RaylibCoreDart.ImageDrawRectangle].
void ImageDrawRectangle(
  ImageD dst,
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.ImageDrawRectangle(dst, posX, posY, width, height, color);

/// See [RaylibCoreDart.ImageDrawRectangleV].
void ImageDrawRectangleV(
  ImageD dst,
  Vector2D position,
  Vector2D size,
  ColorD color,
) => _module.ImageDrawRectangleV(dst, position, size, color);

/// See [RaylibCoreDart.ImageDrawRectangleRec].
void ImageDrawRectangleRec(
  ImageD dst,
  RectangleD rec,
  ColorD color,
) => _module.ImageDrawRectangleRec(dst, rec, color);

/// See [RaylibCoreDart.ImageDrawRectangleLines].
void ImageDrawRectangleLines(
  ImageD dst,
  RectangleD rec,
  num thick,
  ColorD color,
) => _module.ImageDrawRectangleLines(dst, rec, thick, color);

/// See [RaylibCoreDart.ImageDrawTriangle].
void ImageDrawTriangle(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.ImageDrawTriangle(dst, v1, v2, v3, color);

/// See [RaylibCoreDart.ImageDrawTriangleEx].
void ImageDrawTriangleEx(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD c1,
  ColorD c2,
  ColorD c3,
) => _module.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3);

/// See [RaylibCoreDart.ImageDrawTriangleLines].
void ImageDrawTriangleLines(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.ImageDrawTriangleLines(dst, v1, v2, v3, color);

/// See [RaylibCoreDart.ImageDrawTriangleFan].
void ImageDrawTriangleFan(
  ImageD dst,
  List<Vector2D> points,
  ColorD color,
) => _module.ImageDrawTriangleFan(dst, points, color);

/// See [RaylibCoreDart.ImageDrawTriangleStrip].
void ImageDrawTriangleStrip(
  ImageD dst,
  List<Vector2D> points,
  ColorD color,
) => _module.ImageDrawTriangleStrip(dst, points, color);

/// See [RaylibCoreDart.ImageDraw].
void ImageDraw(
  ImageD dst,
  ImageD src,
  RectangleD srcRec,
  RectangleD dstRec,
  ColorD tint,
) => _module.ImageDraw(dst, src, srcRec, dstRec, tint);

/// See [RaylibCoreDart.ImageDrawText].
void ImageDrawText(
  ImageD dst,
  String text,
  num posX,
  num posY,
  num fontSize,
  ColorD color,
) => _module.ImageDrawText(dst, text, posX, posY, fontSize, color);

/// See [RaylibCoreDart.ImageDrawTextEx].
void ImageDrawTextEx(
  ImageD dst,
  FontD font,
  String text,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreDart.LoadTexture].
TextureD LoadTexture(
  String fileName,
) => _module.LoadTexture(fileName);

/// See [RaylibCoreDart.LoadTextureFromImage].
TextureD LoadTextureFromImage(
  ImageD image,
) => _module.LoadTextureFromImage(image);

/// See [RaylibCoreDart.LoadTextureCubemap].
TextureD LoadTextureCubemap(
  ImageD image,
  CubemapLayout layout,
) => _module.LoadTextureCubemap(image, layout);

/// See [RaylibCoreDart.LoadRenderTexture].
RenderTextureD LoadRenderTexture(
  num width,
  num height,
) => _module.LoadRenderTexture(width, height);

/// See [RaylibCoreDart.IsTextureValid].
bool IsTextureValid(
  TextureD texture,
) => _module.IsTextureValid(texture);

/// See [RaylibCoreDart.UnloadTexture].
void UnloadTexture(
  TextureD texture,
) => _module.UnloadTexture(texture);

/// See [RaylibCoreDart.IsRenderTextureValid].
bool IsRenderTextureValid(
  RenderTextureD target,
) => _module.IsRenderTextureValid(target);

/// See [RaylibCoreDart.UnloadRenderTexture].
void UnloadRenderTexture(
  RenderTextureD target,
) => _module.UnloadRenderTexture(target);

/// See [RaylibCoreDart.UpdateTexture].
void UpdateTexture(
  TextureD texture,
  Uint8List pixels,
) => _module.UpdateTexture(texture, pixels);

/// See [RaylibCoreDart.UpdateTextureRec].
void UpdateTextureRec(
  TextureD texture,
  RectangleD rec,
  Uint8List pixels,
) => _module.UpdateTextureRec(texture, rec, pixels);

/// See [RaylibCoreDart.GenTextureMipmaps].
void GenTextureMipmaps(
  TextureD texture,
) => _module.GenTextureMipmaps(texture);

/// See [RaylibCoreDart.SetTextureFilter].
void SetTextureFilter(
  TextureD texture,
  TextureFilter filter,
) => _module.SetTextureFilter(texture, filter);

/// See [RaylibCoreDart.SetTextureWrap].
void SetTextureWrap(
  TextureD texture,
  TextureWrap wrap,
) => _module.SetTextureWrap(texture, wrap);

/// See [RaylibCoreDart.DrawTexture].
void DrawTexture(
  TextureD texture,
  num posX,
  num posY,
  ColorD tint,
) => _module.DrawTexture(texture, posX, posY, tint);

/// See [RaylibCoreDart.DrawTextureV].
void DrawTextureV(
  TextureD texture,
  Vector2D position,
  ColorD tint,
) => _module.DrawTextureV(texture, position, tint);

/// See [RaylibCoreDart.DrawTextureEx].
void DrawTextureEx(
  TextureD texture,
  Vector2D position,
  num rotation,
  num scale,
  ColorD tint,
) => _module.DrawTextureEx(texture, position, rotation, scale, tint);

/// See [RaylibCoreDart.DrawTextureRec].
void DrawTextureRec(
  TextureD texture,
  RectangleD source,
  Vector2D position,
  ColorD tint,
) => _module.DrawTextureRec(texture, source, position, tint);

/// See [RaylibCoreDart.DrawTexturePro].
void DrawTexturePro(
  TextureD texture,
  RectangleD source,
  RectangleD dest,
  Vector2D origin,
  num rotation,
  ColorD tint,
) => _module.DrawTexturePro(texture, source, dest, origin, rotation, tint);

/// See [RaylibCoreDart.DrawTextureNPatch].
void DrawTextureNPatch(
  TextureD texture,
  NPatchInfoD nPatchInfo,
  RectangleD dest,
  Vector2D origin,
  num rotation,
  ColorD tint,
) => _module.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint);

/// See [RaylibCoreDart.ColorIsEqual].
bool ColorIsEqual(
  ColorD col1,
  ColorD col2,
) => _module.ColorIsEqual(col1, col2);

/// See [RaylibCoreDart.Fade].
ColorD Fade(
  ColorD color,
  num alpha,
) => _module.Fade(color, alpha);

/// See [RaylibCoreDart.ColorToInt].
int ColorToInt(
  ColorD color,
) => _module.ColorToInt(color);

/// See [RaylibCoreDart.ColorNormalize].
Vector4D ColorNormalize(
  ColorD color,
) => _module.ColorNormalize(color);

/// See [RaylibCoreDart.ColorFromNormalized].
ColorD ColorFromNormalized(
  Vector4D normalized,
) => _module.ColorFromNormalized(normalized);

/// See [RaylibCoreDart.ColorToHSV].
Vector3D ColorToHSV(
  ColorD color,
) => _module.ColorToHSV(color);

/// See [RaylibCoreDart.ColorFromHSV].
ColorD ColorFromHSV(
  num hue,
  num saturation,
  num value,
) => _module.ColorFromHSV(hue, saturation, value);

/// See [RaylibCoreDart.ColorTint].
ColorD ColorTint(
  ColorD color,
  ColorD tint,
) => _module.ColorTint(color, tint);

/// See [RaylibCoreDart.ColorBrightness].
ColorD ColorBrightness(
  ColorD color,
  num factor,
) => _module.ColorBrightness(color, factor);

/// See [RaylibCoreDart.ColorContrast].
ColorD ColorContrast(
  ColorD color,
  num contrast,
) => _module.ColorContrast(color, contrast);

/// See [RaylibCoreDart.ColorAlpha].
ColorD ColorAlpha(
  ColorD color,
  num alpha,
) => _module.ColorAlpha(color, alpha);

/// See [RaylibCoreDart.ColorAlphaBlend].
ColorD ColorAlphaBlend(
  ColorD dst,
  ColorD src,
  ColorD tint,
) => _module.ColorAlphaBlend(dst, src, tint);

/// See [RaylibCoreDart.ColorLerp].
ColorD ColorLerp(
  ColorD color1,
  ColorD color2,
  num factor,
) => _module.ColorLerp(color1, color2, factor);

/// See [RaylibCoreDart.GetColor].
ColorD GetColor(
  num hexValue,
) => _module.GetColor(hexValue);

/// See [RaylibCoreDart.GetPixelDataSize].
int GetPixelDataSize(
  num width,
  num height,
  PixelFormat format,
) => _module.GetPixelDataSize(width, height, format);

/// See [RaylibCoreDart.GetFontDefault].
FontD GetFontDefault() => _module.GetFontDefault();

/// See [RaylibCoreDart.LoadFont].
FontD LoadFont(
  String fileName,
) => _module.LoadFont(fileName);

/// See [RaylibCoreDart.LoadFontEx].
FontD LoadFontEx(
  String fileName,
  num fontSize, [
    Int32List? codepoints,
    num? codepointCount,
  ]
) => _module.LoadFontEx(fileName, fontSize, codepoints, codepointCount);

/// See [RaylibCoreDart.LoadFontFromImage].
FontD LoadFontFromImage(
  ImageD image,
  ColorD key,
  num firstChar,
) => _module.LoadFontFromImage(image, key, firstChar);

/// See [RaylibCoreDart.LoadFontFromMemory].
FontD LoadFontFromMemory(
  String fileType,
  Uint8List fileData,
  num fontSize,
  Int32List codepoints,
) => _module.LoadFontFromMemory(fileType, fileData, fontSize, codepoints);

/// See [RaylibCoreDart.IsFontValid].
bool IsFontValid(
  FontD font,
) => _module.IsFontValid(font);

/// See [RaylibCoreDart.LoadFontData].
List<GlyphInfoD> LoadFontData(
  Uint8List fileData,
  num fontSize,
  Int32List? codepoints,
  num? codepointCount,
  FontType type,
) => _module.LoadFontData(fileData, fontSize, codepoints, codepointCount, type);

/// See [RaylibCoreDart.GenImageFontAtlas].
(ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
  List<GlyphInfoD> glyphs,
  num fontSize,
  num padding,
  num packMethod,
) => _module.GenImageFontAtlas(glyphs, fontSize, padding, packMethod);

/// See [RaylibCoreDart.UnloadFontData].
void UnloadFontData(
  List<GlyphInfoD> glyphs,
) => _module.UnloadFontData(glyphs);

/// See [RaylibCoreDart.UnloadFont].
void UnloadFont(
  FontD font,
) => _module.UnloadFont(font);

/// See [RaylibCoreDart.ExportFontAsCode].
bool ExportFontAsCode(
  FontD font,
  String fileName,
) => _module.ExportFontAsCode(font, fileName);

/// See [RaylibCoreDart.DrawFPS].
void DrawFPS(
  num posX,
  num posY,
) => _module.DrawFPS(posX, posY);

/// See [RaylibCoreDart.DrawText].
void DrawText(
  String text,
  num posX,
  num posY,
  num fontSize,
  ColorD color,
) => _module.DrawText(text, posX, posY, fontSize, color);

/// See [RaylibCoreDart.DrawTextEx].
void DrawTextEx(
  FontD font,
  String text,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.DrawTextEx(font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreDart.DrawTextPro].
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

/// See [RaylibCoreDart.DrawTextCodepoint].
void DrawTextCodepoint(
  FontD font,
  num codepoint,
  Vector2D position,
  num fontSize,
  ColorD tint,
) => _module.DrawTextCodepoint(font, codepoint, position, fontSize, tint);

/// See [RaylibCoreDart.DrawTextCodepoints].
void DrawTextCodepoints(
  FontD font,
  Int32List codepoints,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.DrawTextCodepoints(font, codepoints, position, fontSize, spacing, tint);

/// See [RaylibCoreDart.SetTextLineSpacing].
void SetTextLineSpacing(
  num spacing,
) => _module.SetTextLineSpacing(spacing);

/// See [RaylibCoreDart.MeasureText].
int MeasureText(
  String text,
  num fontSize,
) => _module.MeasureText(text, fontSize);

/// See [RaylibCoreDart.MeasureTextEx].
Vector2D MeasureTextEx(
  FontD font,
  String text,
  num fontSize,
  num spacing,
) => _module.MeasureTextEx(font, text, fontSize, spacing);

/// See [RaylibCoreDart.MeasureTextCodepoints].
Vector2D MeasureTextCodepoints(
  FontD font,
  Int32List codepoints,
  num fontSize,
  num spacing,
) => _module.MeasureTextCodepoints(font, codepoints, fontSize, spacing);

/// See [RaylibCoreDart.GetGlyphIndex].
int GetGlyphIndex(
  FontD font,
  num codepoint,
) => _module.GetGlyphIndex(font, codepoint);

/// See [RaylibCoreDart.GetGlyphInfo].
GlyphInfoD GetGlyphInfo(
  FontD font,
  num codepoint,
) => _module.GetGlyphInfo(font, codepoint);

/// See [RaylibCoreDart.GetGlyphAtlasRec].
RectangleD GetGlyphAtlasRec(
  FontD font,
  num codepoint,
) => _module.GetGlyphAtlasRec(font, codepoint);

/// See [RaylibCoreDart.LoadUTF8].
String LoadUTF8(
  Int32List codepoints,
) => _module.LoadUTF8(codepoints);

/// See [RaylibCoreDart.LoadCodepoints].
Int32List LoadCodepoints(
  String text,
) => _module.LoadCodepoints(text);

/// See [RaylibCoreDart.GetCodepointCount].
int GetCodepointCount(
  String text,
) => _module.GetCodepointCount(text);

/// See [RaylibCoreDart.GetCodepoint].
(int codepoint, int codepointSize) GetCodepoint(
  String text,
) => _module.GetCodepoint(text);

/// See [RaylibCoreDart.GetCodepointNext].
(int codepoint, int codepointSize) GetCodepointNext(
  String text,
) => _module.GetCodepointNext(text);

/// See [RaylibCoreDart.GetCodepointPrevious].
(int codepoint, int codepointSize) GetCodepointPrevious(
  String text,
) => _module.GetCodepointPrevious(text);

/// See [RaylibCoreDart.CodepointToUTF8].
(String text, int size) CodepointToUTF8(
  num codepoint,
) => _module.CodepointToUTF8(codepoint);

/// See [RaylibCoreDart.LoadTextLines].
List<String> LoadTextLines(
  String text,
) => _module.LoadTextLines(text);

/// See [RaylibCoreDart.TextIsEqual].
bool TextIsEqual(
  String text1,
  String text2,
) => _module.TextIsEqual(text1, text2);

/// See [RaylibCoreDart.TextLength].
int TextLength(
  String text,
) => _module.TextLength(text);

/// See [RaylibCoreDart.TextFormat].
String TextFormat(
  String text, [
    List<Object?> args = const [],
  ]
) => _module.TextFormat(text, args);

/// See [RaylibCoreDart.TextSubtext].
String TextSubtext(
  String text,
  int position,
  int length,
) => _module.TextSubtext(text, position, length);

/// See [RaylibCoreDart.TextRemoveSpaces].
String TextRemoveSpaces(
  String text,
) => _module.TextRemoveSpaces(text);

/// See [RaylibCoreDart.GetTextBetween].
String GetTextBetween(
  String text,
  String begin,
  String end,
) => _module.GetTextBetween(text, begin, end);

/// See [RaylibCoreDart.TextReplace].
String TextReplace(
  String text,
  String search,
  String replacement,
) => _module.TextReplace(text, search, replacement);

/// See [RaylibCoreDart.TextReplaceBetween].
String TextReplaceBetween(
  String text,
  String begin,
  String end,
  String replacement,
) => _module.TextReplaceBetween(text, begin, end, replacement);

/// See [RaylibCoreDart.TextInsert].
String TextInsert(
  String text,
  String insert,
  int position,
) => _module.TextInsert(text, insert, position);

/// See [RaylibCoreDart.TextJoin].
String TextJoin(
  List<String> textList,
  String delimiter,
) => _module.TextJoin(textList, delimiter);

/// See [RaylibCoreDart.TextSplit].
List<String> TextSplit(
  String text,
  String delimiter,
) => _module.TextSplit(text, delimiter);

/// See [RaylibCoreDart.TextAppend].
String TextAppend(
  String text,
  String append,
) => _module.TextAppend(text, append);

/// See [RaylibCoreDart.TextFindIndex].
int TextFindIndex(
  String text,
  String search,
) => _module.TextFindIndex(text, search);

/// See [RaylibCoreDart.TextToUpper].
String TextToUpper(
  String text,
) => _module.TextToUpper(text);

/// See [RaylibCoreDart.TextToLower].
String TextToLower(
  String text,
) => _module.TextToLower(text);

/// See [RaylibCoreDart.TextToPascal].
String TextToPascal(
  String text,
) => _module.TextToPascal(text);

/// See [RaylibCoreDart.TextToSnake].
String TextToSnake(
  String text,
) => _module.TextToSnake(text);

/// See [RaylibCoreDart.TextToCamel].
String TextToCamel(
  String text,
) => _module.TextToCamel(text);

/// See [RaylibCoreDart.TextToInteger].
int TextToInteger(
  String text,
) => _module.TextToInteger(text);

/// See [RaylibCoreDart.TextToFloat].
double TextToFloat(
  String text,
) => _module.TextToFloat(text);

/// See [RaylibCoreDart.DrawLine3D].
void DrawLine3D(
  Vector3D startPos,
  Vector3D endPos,
  ColorD color,
) => _module.DrawLine3D(startPos, endPos, color);

/// See [RaylibCoreDart.DrawPoint3D].
void DrawPoint3D(
  Vector3D position,
  ColorD color,
) => _module.DrawPoint3D(position, color);

/// See [RaylibCoreDart.DrawCircle3D].
void DrawCircle3D(
  Vector3D center,
  num radius,
  Vector3D rotationAxis,
  num rotationAngle,
  ColorD color,
) => _module.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color);

/// See [RaylibCoreDart.DrawTriangle3D].
void DrawTriangle3D(
  Vector3D v1,
  Vector3D v2,
  Vector3D v3,
  ColorD color,
) => _module.DrawTriangle3D(v1, v2, v3, color);

/// See [RaylibCoreDart.DrawTriangleStrip3D].
void DrawTriangleStrip3D(
  List<Vector3D> points,
  ColorD color,
) => _module.DrawTriangleStrip3D(points, color);

/// See [RaylibCoreDart.DrawCube].
void DrawCube(
  Vector3D position,
  num width,
  num height,
  num length,
  ColorD color,
) => _module.DrawCube(position, width, height, length, color);

/// See [RaylibCoreDart.DrawCubeV].
void DrawCubeV(
  Vector3D position,
  Vector3D size,
  ColorD color,
) => _module.DrawCubeV(position, size, color);

/// See [RaylibCoreDart.DrawCubeWires].
void DrawCubeWires(
  Vector3D position,
  num width,
  num height,
  num length,
  ColorD color,
) => _module.DrawCubeWires(position, width, height, length, color);

/// See [RaylibCoreDart.DrawCubeWiresV].
void DrawCubeWiresV(
  Vector3D position,
  Vector3D size,
  ColorD color,
) => _module.DrawCubeWiresV(position, size, color);

/// See [RaylibCoreDart.DrawSphere].
void DrawSphere(
  Vector3D centerPos,
  num radius,
  ColorD color,
) => _module.DrawSphere(centerPos, radius, color);

/// See [RaylibCoreDart.DrawSphereEx].
void DrawSphereEx(
  Vector3D centerPos,
  num radius,
  num rings,
  num slices,
  ColorD color,
) => _module.DrawSphereEx(centerPos, radius, rings, slices, color);

/// See [RaylibCoreDart.DrawSphereWires].
void DrawSphereWires(
  Vector3D centerPos,
  num radius,
  num rings,
  num slices,
  ColorD color,
) => _module.DrawSphereWires(centerPos, radius, rings, slices, color);

/// See [RaylibCoreDart.DrawCylinder].
void DrawCylinder(
  Vector3D position,
  num radiusTop,
  num radiusBottom,
  num height,
  num slices,
  ColorD color,
) => _module.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreDart.DrawCylinderEx].
void DrawCylinderEx(
  Vector3D startPos,
  Vector3D endPos,
  num startRadius,
  num endRadius,
  num sides,
  ColorD color,
) => _module.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreDart.DrawCylinderWires].
void DrawCylinderWires(
  Vector3D position,
  num radiusTop,
  num radiusBottom,
  num height,
  num slices,
  ColorD color,
) => _module.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreDart.DrawCylinderWiresEx].
void DrawCylinderWiresEx(
  Vector3D startPos,
  Vector3D endPos,
  num startRadius,
  num endRadius,
  num sides,
  ColorD color,
) => _module.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreDart.DrawCapsule].
void DrawCapsule(
  Vector3D startPos,
  Vector3D endPos,
  num radius,
  num slices,
  num rings,
  ColorD color,
) => _module.DrawCapsule(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreDart.DrawCapsuleWires].
void DrawCapsuleWires(
  Vector3D startPos,
  Vector3D endPos,
  num radius,
  num slices,
  num rings,
  ColorD color,
) => _module.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreDart.DrawPlane].
void DrawPlane(
  Vector3D centerPos,
  Vector2D size,
  ColorD color,
) => _module.DrawPlane(centerPos, size, color);

/// See [RaylibCoreDart.DrawRay].
void DrawRay(
  RayD ray,
  ColorD color,
) => _module.DrawRay(ray, color);

/// See [RaylibCoreDart.DrawGrid].
void DrawGrid(
  num slices,
  num spacing,
) => _module.DrawGrid(slices, spacing);

/// See [RaylibCoreDart.LoadModel].
ModelD LoadModel(
  String fileName,
) => _module.LoadModel(fileName);

/// See [RaylibCoreDart.LoadModelFromMesh].
ModelD LoadModelFromMesh(
  MeshD mesh,
) => _module.LoadModelFromMesh(mesh);

/// See [RaylibCoreDart.IsModelValid].
bool IsModelValid(
  ModelD model,
) => _module.IsModelValid(model);

/// See [RaylibCoreDart.UnloadModel].
void UnloadModel(
  ModelD model,
) => _module.UnloadModel(model);

/// See [RaylibCoreDart.GetModelBoundingBox].
BoundingBoxD GetModelBoundingBox(
  ModelD model,
) => _module.GetModelBoundingBox(model);

/// See [RaylibCoreDart.DrawModel].
void DrawModel(
  ModelD model,
  Vector3D position,
  num scale,
  ColorD tint
) => _module.DrawModel(model, position, scale, tint);

/// See [RaylibCoreDart.DrawModelEx].
void DrawModelEx(
  ModelD model,
  Vector3D position,
  Vector3D rotationAxis,
  num rotationAngle,
  Vector3D scale,
  ColorD tint,
) => _module.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreDart.DrawModelWires].
void DrawModelWires(
  ModelD model,
  Vector3D position,
  num scale,
  ColorD tint,
) => _module.DrawModelWires(model, position, scale, tint);

/// See [RaylibCoreDart.DrawModelWiresEx].
void DrawModelWiresEx(
  ModelD model,
  Vector3D position,
  Vector3D rotationAxis,
  num rotationAngle,
  Vector3D scale,
  ColorD tint,
) => _module.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreDart.DrawBoundingBox].
void DrawBoundingBox(
  BoundingBoxD box,
  ColorD color,
) => _module.DrawBoundingBox(box, color);

/// See [RaylibCoreDart.DrawBillboard].
void DrawBillboard(
  Camera3DD camera,
  TextureD texture,
  Vector3D position,
  num scale,
  ColorD tint,
) => _module.DrawBillboard(camera, texture, position, scale, tint);

/// See [RaylibCoreDart.DrawBillboardRec].
void DrawBillboardRec(
  Camera3DD camera,
  TextureD texture,
  RectangleD source,
  Vector3D position,
  Vector2D size,
  ColorD tint,
) => _module.DrawBillboardRec(camera, texture, source, position, size, tint);

/// See [RaylibCoreDart.DrawBillboardPro].
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

/// See [RaylibCoreDart.UploadMesh].
void UploadMesh(
  MeshD mesh,
  bool dynamic,
) => _module.UploadMesh(mesh, dynamic);

/// See [RaylibCoreDart.UpdateMeshBuffer].
void UpdateMeshBuffer(
  MeshD mesh,
  num index,
  TypedDataList data,
  num offset,
) => _module.UpdateMeshBuffer(mesh, index, data, offset);

/// See [RaylibCoreDart.UnloadMesh].
void UnloadMesh(
  MeshD mesh,
) => _module.UnloadMesh(mesh);

/// See [RaylibCoreDart.DrawMesh].
void DrawMesh(
  MeshD mesh,
  MaterialD material,
  MatrixD transform,
) => _module.DrawMesh(mesh, material, transform);

/// See [RaylibCoreDart.DrawMeshInstanced].
void DrawMeshInstanced(
  MeshD mesh,
  MaterialD material,
  List<MatrixD> transforms,
) => _module.DrawMeshInstanced(mesh, material, transforms);

/// See [RaylibCoreDart.GetMeshBoundingBox].
BoundingBoxD GetMeshBoundingBox(
  MeshD mesh,
) => _module.GetMeshBoundingBox(mesh);

/// See [RaylibCoreDart.GenMeshTangents].
void GenMeshTangents(
  MeshD mesh,
) => _module.GenMeshTangents(mesh);

/// See [RaylibCoreDart.ExportMesh].
bool ExportMesh(
  MeshD mesh,
  String fileName,
) => _module.ExportMesh(mesh, fileName);

/// See [RaylibCoreDart.ExportMeshAsCode].
bool ExportMeshAsCode(
  MeshD mesh,
  String fileName,
) => _module.ExportMeshAsCode(mesh, fileName);

/// See [RaylibCoreDart.GenMeshPoly].
MeshD GenMeshPoly(
  num sides,
  num radius,
) => _module.GenMeshPoly(sides, radius);

/// See [RaylibCoreDart.GenMeshPlane].
MeshD GenMeshPlane(
  num width,
  num length,
  num resX,
  num resZ,
) => _module.GenMeshPlane(width, length, resX, resZ);

/// See [RaylibCoreDart.GenMeshCube].
MeshD GenMeshCube(
  num width,
  num height,
  num length,
) => _module.GenMeshCube(width, height, length);

/// See [RaylibCoreDart.GenMeshSphere].
MeshD GenMeshSphere(
  num radius,
  num rings,
  num slices,
) => _module.GenMeshSphere(radius, rings, slices);

/// See [RaylibCoreDart.GenMeshHemiSphere].
MeshD GenMeshHemiSphere(
  num radius,
  num rings,
  num slices,
) => _module.GenMeshHemiSphere(radius, rings, slices);

/// See [RaylibCoreDart.GenMeshCylinder].
MeshD GenMeshCylinder(
  num radius,
  num height,
  num slices,
) => _module.GenMeshCylinder(radius, height, slices);

/// See [RaylibCoreDart.GenMeshCone].
MeshD GenMeshCone(
  num radius,
  num height,
  num slices,
) => _module.GenMeshCone(radius, height, slices);

/// See [RaylibCoreDart.GenMeshTorus].
MeshD GenMeshTorus(
  num radius,
  num size,
  num radSeg,
  num sides,
) => _module.GenMeshTorus(radius, size, radSeg, sides);

/// See [RaylibCoreDart.GenMeshKnot].
MeshD GenMeshKnot(
  num radius,
  num size,
  num radSeg,
  num sides,
) => _module.GenMeshKnot(radius, size, radSeg, sides);

/// See [RaylibCoreDart.GenMeshHeightmap].
MeshD GenMeshHeightmap(
  ImageD heightmap,
  Vector3D size,
) => _module.GenMeshHeightmap(heightmap, size);

/// See [RaylibCoreDart.GenMeshCubicmap].
MeshD GenMeshCubicmap(
  ImageD cubicmap,
  Vector3D cubeSize,
) => _module.GenMeshCubicmap(cubicmap, cubeSize);

/// See [RaylibCoreDart.LoadMaterials].
List<MaterialD> LoadMaterials(
  String fileName,
) => _module.LoadMaterials(fileName);

/// See [RaylibCoreDart.LoadMaterialDefault].
MaterialD LoadMaterialDefault() => _module.LoadMaterialDefault();

/// See [RaylibCoreDart.IsMaterialValid].
bool IsMaterialValid(
  MaterialD material,
) => _module.IsMaterialValid(material);

/// See [RaylibCoreDart.UnloadMaterial].
void UnloadMaterial(
  MaterialD material,
) => _module.UnloadMaterial(material);

/// See [RaylibCoreDart.SetMaterialTexture].
void SetMaterialTexture(
  MaterialD material,
  MaterialMapIndex mapType,
  TextureD texture,
) => _module.SetMaterialTexture(material, mapType, texture);

/// See [RaylibCoreDart.SetModelMeshMaterial].
void SetModelMeshMaterial(
  ModelD model,
  num meshId,
  num materialId,
) => _module.SetModelMeshMaterial(model, meshId, materialId);

/// See [RaylibCoreDart.LoadModelAnimations].
List<ModelAnimationD> LoadModelAnimations(
  String fileName,
) => _module.LoadModelAnimations(fileName);

/// See [RaylibCoreDart.UpdateModelAnimation].
void UpdateModelAnimation(
  ModelD model,
  ModelAnimationD anim,
  num frame,
) => _module.UpdateModelAnimation(model, anim, frame);

/// See [RaylibCoreDart.UpdateModelAnimationEx].
void UpdateModelAnimationEx(
  ModelD model,
  ModelAnimationD animA,
  num frameA,
  ModelAnimationD animB,
  num frameB,
  num blend,
) => _module.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend);

/// See [RaylibCoreDart.UnloadModelAnimations].
void UnloadModelAnimations(
  List<ModelAnimationD> animations,
) => _module.UnloadModelAnimations(animations);

/// See [RaylibCoreDart.IsModelAnimationValid].
bool IsModelAnimationValid(
  ModelD model,
  ModelAnimationD anim,
) => _module.IsModelAnimationValid(model, anim);

/// See [RaylibCoreDart.CheckCollisionSpheres].
bool CheckCollisionSpheres(
  Vector3D center1,
  num radius1,
  Vector3D center2,
  num radius2,
) => _module.CheckCollisionSpheres(center1, radius1, center2, radius2);

/// See [RaylibCoreDart.CheckCollisionBoxes].
bool CheckCollisionBoxes(
  BoundingBoxD box1,
  BoundingBoxD box2,
) => _module.CheckCollisionBoxes(box1, box2);

/// See [RaylibCoreDart.CheckCollisionBoxSphere].
bool CheckCollisionBoxSphere(
  BoundingBoxD box,
  Vector3D center,
  num radius,
) => _module.CheckCollisionBoxSphere(box, center, radius);

/// See [RaylibCoreDart.GetRayCollisionSphere].
RayCollisionD GetRayCollisionSphere(
  RayD ray,
  Vector3D center,
  num radius,
) => _module.GetRayCollisionSphere(ray, center, radius);

/// See [RaylibCoreDart.GetRayCollisionBox].
RayCollisionD GetRayCollisionBox(
  RayD ray,
  BoundingBoxD box,
) => _module.GetRayCollisionBox(ray, box);

/// See [RaylibCoreDart.GetRayCollisionMesh].
RayCollisionD GetRayCollisionMesh(
  RayD ray,
  MeshD mesh,
  MatrixD transform,
) => _module.GetRayCollisionMesh(ray, mesh, transform);

/// See [RaylibCoreDart.GetRayCollisionTriangle].
RayCollisionD GetRayCollisionTriangle(
  RayD ray,
  Vector3D p1,
  Vector3D p2,
  Vector3D p3,
) => _module.GetRayCollisionTriangle(ray, p1, p2, p3);

/// See [RaylibCoreDart.GetRayCollisionQuad].
RayCollisionD GetRayCollisionQuad(
  RayD ray,
  Vector3D p1,
  Vector3D p2,
  Vector3D p3,
  Vector3D p4,
) => _module.GetRayCollisionQuad(ray, p1, p2, p3, p4);

