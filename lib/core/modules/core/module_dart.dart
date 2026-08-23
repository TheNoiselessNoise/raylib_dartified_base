part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Core module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibCoreModule<R extends RaylibBase> extends RaylibModule<R> {

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibCoreModuleDebugLabels();

  RaylibCoreModule(super.rl);

  // //////////// //
  // CUSTOM STUFF //
  // //////////// //

  MouseButtonInfo GetMouseButtonInfo(MouseButton button) => .new(
    up: IsMouseButtonUp(button),
    down: IsMouseButtonDown(button),
    pressed: IsMouseButtonPressed(button),
    released: IsMouseButtonReleased(button),
  );

  MouseInfo GetMouseInfo() => .new(
    position: GetMousePosition(),
    delta: GetMouseDelta(),
    wheel: GetMouseWheelMoveV(),
    btnLeft: GetMouseButtonInfo(.MOUSE_BUTTON_LEFT),
    btnMiddle: GetMouseButtonInfo(.MOUSE_BUTTON_MIDDLE),
    btnRight: GetMouseButtonInfo(.MOUSE_BUTTON_RIGHT),
    btnSide: GetMouseButtonInfo(.MOUSE_BUTTON_SIDE),
    btnExtra: GetMouseButtonInfo(.MOUSE_BUTTON_EXTRA),
    btnForward: GetMouseButtonInfo(.MOUSE_BUTTON_FORWARD),
    btnBack: GetMouseButtonInfo(.MOUSE_BUTTON_BACK),
  );

  // ////// //
  // MODULE //
  // ////// //

  /// Initialize window and OpenGL context
  void InitWindow(
    num width,
    num height,
    String title,
  );

  /// Close window and unload OpenGL context
  void CloseWindow();

  /// Check if application should close ([KeyboardKey.KEY_ESCAPE] pressed or windows close icon clicked)
  bool WindowShouldClose();

  /// Check if window has been initialized successfully
  bool IsWindowReady();

  /// Check if window is currently fullscreen
  bool IsWindowFullscreen();

  /// Check if window is currently hidden
  bool IsWindowHidden();

  /// Check if window is currently minimized
  bool IsWindowMinimized();

  /// Check if window is currently maximized
  bool IsWindowMaximized();

  /// Check if window is currently focused
  bool IsWindowFocused();

  /// Check if window has been resized last frame
  bool IsWindowResized();

  /// Check if one specific window flag is enabled
  bool IsWindowState(
    ConfigFlags flag,
  );

  /// Set window configuration state using flags
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  );

  /// Clear window configuration state flags
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  );

  /// Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
  void ToggleFullscreen();

  /// Toggle window state: borderless windowed, resizes window to match monitor resolution
  void ToggleBorderlessWindowed();

  /// Set window state: maximized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MaximizeWindow();

  /// Set window state: minimized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MinimizeWindow();

  /// Set window state: not minimized/maximized
  void RestoreWindow();

  /// Set icon for window (single image, RGBA 32bit)
  void SetWindowIcon(
    ImageD image,
  );

  /// Set icon for window (multiple images, RGBA 32bit)
  void SetWindowIcons(
    List<ImageD> images,
  );

  /// Set title for window
  void SetWindowTitle(
    String title,
  );

  /// Set window position on screen
  void SetWindowPosition(
    num x,
    num y,
  );

  /// Set monitor for the current window
  void SetWindowMonitor(
    num monitor,
  );

  /// Set window minimum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMinSize(
    num width,
    num height,
  );

  /// Set window maximum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMaxSize(
    num width,
    num height,
  );

  /// Set window dimensions
  void SetWindowSize(
    num width,
    num height,
  );

  /// Set window opacity [0.0..1.0]
  void SetWindowOpacity(
    num opacity,
  );

  /// Set window focused
  void SetWindowFocused();

  /// Get current screen width
  int GetScreenWidth();

  /// Get current screen height
  int GetScreenHeight();

  /// Get current render width (it considers HiDPI)
  int GetRenderWidth();

  /// Get current render height (it considers HiDPI)
  int GetRenderHeight();

  /// Get number of connected monitors
  int GetMonitorCount();

  /// Get current monitor where window is placed
  int GetCurrentMonitor();

  /// Get specified monitor position
  Vector2D GetMonitorPosition(
    num monitor,
  );

  /// Get specified monitor width (current video mode used by monitor)
  int GetMonitorWidth(
    num monitor,
  );

  /// Get specified monitor height (current video mode used by monitor)
  int GetMonitorHeight(
    num monitor,
  );

  /// Get specified monitor physical width in millimetres
  int GetMonitorPhysicalWidth(
    num monitor,
  );

  /// Get specified monitor physical height in millimetres
  int GetMonitorPhysicalHeight(
    num monitor,
  );

  /// Get specified monitor refresh rate
  int GetMonitorRefreshRate(
    num monitor,
  );

  /// Get window position XY on monitor
  Vector2D GetWindowPosition();

  /// Get window scale DPI factor
  Vector2D GetWindowScaleDPI();

  /// Get the human-readable, UTF-8 encoded name of the specified monitor
  String GetMonitorName(
    num monitor,
  );

  /// Set clipboard text content
  void SetClipboardText(
    String text,
  );

  /// Get clipboard text content
  String GetClipboardText();

  /// Get clipboard image content
  ImageD GetClipboardImage();

  /// Enable waiting for events on EndDrawing(), no automatic event polling
  void EnableEventWaiting();

  /// Disable waiting for events on EndDrawing(), automatic events polling
  void DisableEventWaiting();

  /// Shows cursor
  void ShowCursor();

  /// Hides cursor
  void HideCursor();

  /// Check if cursor is not visible
  bool IsCursorHidden();

  /// Enables cursor (unlock cursor)
  void EnableCursor();

  /// Disables cursor (lock cursor)
  void DisableCursor();

  /// Check if cursor is on the screen
  bool IsCursorOnScreen();

  /// Set background color (framebuffer clear color)
  void ClearBackground(
    ColorD color,
  );

  /// Setup canvas (framebuffer) to start drawing
  void BeginDrawing();

  /// End canvas drawing and swap buffers (double buffering)
  void EndDrawing();

  /// Begin 2D mode with custom camera (2D)
  void BeginMode2D(
    Camera2DD camera,
  );

  /// Ends 2D mode with custom camera
  void EndMode2D();

  /// Begin 3D mode with custom camera (3D)
  void BeginMode3D(
    Camera3DD camera,
  );

  /// Ends 3D mode and returns to default 2D orthographic mode
  void EndMode3D();

  /// Begin drawing to render texture
  void BeginTextureMode(
    RenderTextureD target,
  );

  /// Ends drawing to render texture
  void EndTextureMode();

  /// Begin custom shader drawing
  void BeginShaderMode(
    ShaderD shader,
  );

  /// End custom shader drawing (use default shader)
  void EndShaderMode();

  /// Begin blending mode (alpha, additive, multiplied, subtract, custom)
  void BeginBlendMode(
    BlendMode mode,
  );

  /// End blending mode (reset to default: alpha blending)
  void EndBlendMode();

  /// Begin scissor mode (define screen area for following drawing)
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  );

  /// End scissor mode
  void EndScissorMode();

  /// Begin stereo rendering (requires VR simulator)
  void BeginVrStereoMode(
    VrStereoConfigD config,
  );

  /// End stereo rendering (requires VR simulator)
  void EndVrStereoMode();

  /// Load VR stereo config for VR simulator device parameters
  VrStereoConfigD LoadVrStereoConfig(
    VrDeviceInfoD device,
  );

  /// Unload VR stereo config
  void UnloadVrStereoConfig(
    VrStereoConfigD config,
  );

  /// Load shader from files and bind default locations
  ShaderD LoadShader(
    String? vsFileName,
    String? fsFileName,
  );

  /// Load shader from code strings and bind default locations
  ShaderD LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  );

  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(
    ShaderD shader,
  );

  /// Get shader uniform location
  int GetShaderLocation(
    ShaderD shader,
    String uniformName,
  );

  /// Get shader attribute location
  int GetShaderLocationAttrib(
    ShaderD shader,
    String attribName,
  );
  
  /// Set shader uniform value
  @nonVirtual
  void SetShaderValue(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
  ) => SetShaderValueV(
    shader,
    locIndex,
    value,
    uniformType,
    1
  );

  /// Set shader uniform value vector
  void SetShaderValueV(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  );

  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(
    ShaderD shader,
    num locIndex,
    MatrixD mat,
  );

  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(
    ShaderD shader,
    num locIndex,
    TextureD texture,
  );

  /// Unload shader from GPU memory (VRAM)
  void UnloadShader(
    ShaderD shader,
  );

  /// Get a ray trace from screen position (i.e mouse)
  RayD GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  );

  /// Get a ray trace from screen position (i.e mouse) in a viewport
  RayD GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    num width,
    num height,
  );

  /// Get the screen space position for a 3d world space position
  Vector2D GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  );

  /// Get size position for a 3d world space position
  Vector2D GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    num width,
    num height,
  );

  /// Get the screen space position for a 2d camera world space position
  Vector2D GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  );

  /// Get the world space position for a 2d camera screen space position
  Vector2D GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  );

  /// Get camera transform matrix (view matrix)
  MatrixD GetCameraMatrix(
    Camera3DD camera,
  );

  /// Get camera 2d transform matrix
  MatrixD GetCameraMatrix2D(
    Camera2DD camera,
  );

  /// Set target FPS (maximum)
  void SetTargetFPS(
    num fps,
  );

  /// Get time in seconds for last frame drawn (delta time)
  double GetFrameTime();

  /// Get elapsed time in seconds since InitWindow()
  double GetTime();

  /// Get current FPS
  int GetFPS();

  /// Swap back buffer with front buffer (screen drawing)
  void SwapScreenBuffer();

  /// Register all input events
  void PollInputEvents();

  /// Wait for some time (halt program execution)
  void WaitTime(
    num seconds,
  );

  /// Set the seed for the random number generator
  void SetRandomSeed(
    num seed,
  );

  /// Get a random value between min and max (both included)
  int GetRandomValue(
    num min,
    num max,
  );
  
  /// Load random values sequence, no values repeated, min and max included
  List<int> LoadRandomSequence(
    num count,
    num min,
    num max,
  );

  /// Takes a screenshot of current screen (filename extension defines format)
  void TakeScreenshot(
    String fileName,
  );

  /// Setup init configuration flags (view [ConfigFlags])
  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  );

  /// Open URL with default system browser (if available)
  void OpenURL(
    String url,
  );

  /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  void TraceLog(
    TraceLogLevel logLevel,
    String text, [
      List<Object?> args = const [],
    ]
  );

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  );

  /// Set custom trace log
  void SetTraceLogCallback(
    covariant TraceLogCallbackBase? callback,
  );

  /// Set custom file binary data loader
  void SetLoadFileDataCallback(
    covariant LoadFileDataCallbackBase? callback
  );

  /// Set custom file binary data saver
  void SetSaveFileDataCallback(
    covariant SaveFileDataCallbackBase? callback
  );

  /// Set custom file text data loader
  void SetLoadFileTextCallback(
    covariant LoadFileTextCallbackBase? callback
  );

  /// Set custom file text data saver
  void SetSaveFileTextCallback(
    covariant SaveFileTextCallbackBase? callback
  );

  /// Load file data as byte array (read)
  Uint8List LoadFileData(
    String fileName,
  );

  /// Save data to file from byte array (write), returns true on success
  bool SaveFileData(
    String fileName,
    Uint8List data,
  );

  /// Export data to code (.h), returns true on success
  bool ExportDataAsCode(
    Uint8List data,
    String fileName,
  );

  /// Load text data from file (read)
  String LoadFileText(
    String fileName,
  );

  /// Save text data to file (write), returns true on success
  bool SaveFileText(
    String fileName,
    String text,
  );

  /// Rename file (if exists)
  int FileRename(
    String fileName,
    String fileRename,
  );
  
  /// Remove file (if exists)
  int FileRemove(
    String fileName,
  );
  
  /// Copy file from one path to another, dstPath created if it doesn't exist
  int FileCopy(
    String srcPath,
    String dstPath,
  );
  
  /// Move file from one directory to another, dstPath created if it doesn't exist
  int FileMove(
    String srcPath,
    String dstPath,
  );
  
  /// Replace text in an existing file
  int FileTextReplace(
    String fileName,
    String search,
    String replacement,
  );
  
  /// Find text in existing file
  int FileTextFindIndex(
    String fileName,
    String search,
  );

  /// Check if file exists
  bool FileExists(
    String fileName,
  );

  /// Check if a directory path exists
  bool DirectoryExists(
    String dirPath,
  );

  /// Check file extension (including point: .png, .wav)
  bool IsFileExtension(
    String fileName,
    String ext,
  );

  /// Get file length in bytes
  int GetFileLength(
    String fileName,
  );

  /// Get extension for a filename (includes dot: '.png')
  String GetFileExtension(
    String fileName,
  );

  /// Get filename for a path string
  String GetFileName(
    String filePath,
  );

  /// Get filename without extension
  String GetFileNameWithoutExt(
    String filePath,
  );

  /// Get the file count in a directory
  int GetDirectoryFileCount(
    String dirPath, 
  );
  
  /// Get the file count in a directory with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  int GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  );

  /// Get full path for a given fileName with path
  String GetDirectoryPath(
    String filePath,
  );

  /// Get previous directory path for a given path
  String GetPrevDirectoryPath(
    String dirPath,
  );

  /// Get current working directory
  String GetWorkingDirectory();

  /// Get the directory of the running application
  String GetApplicationDirectory();

  /// Create directories (including full path requested), returns 0 on success
  int MakeDirectory(
    String dirPath,
  );

  /// Change working directory, return true on success
  bool ChangeDirectory(
    String dir,
  );

  /// Check if a given path is a file or a directory
  bool IsPathFile(
    String path,
  );

  /// Check if fileName is valid for the platform/OS
  bool IsFileNameValid(
    String fileName,
  );

  /// Load directory filepaths
  FilePathListD LoadDirectoryFiles(
    String dirPath,
  );

  /// Load directory filepaths with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result
  FilePathListD LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  );

  /// Unload filepaths
  void UnloadDirectoryFiles(
    FilePathListD files,
  );

  /// Check if a file has been dropped into window
  bool IsFileDropped();

  /// Load dropped filepaths
  FilePathListD LoadDroppedFiles();

  /// Unload dropped filepaths
  void UnloadDroppedFiles(
    FilePathListD files,
  );

  /// Get file modification time (last write time)
  int GetFileModTime(
    String fileName,
  );

  /// Compress data (DEFLATE algorithm)
  Uint8List CompressData(
    Uint8List data,
  );

  /// Decompress data (DEFLATE algorithm)
  Uint8List DecompressData(
    Uint8List compData,
  );

  /// Encode data to Base64 string
  Uint8List EncodeDataBase64(
    Uint8List data,
  );

  /// Decode Base64 string data
  Uint8List DecodeDataBase64(
    Uint8List data,
  );

  /// Compute CRC32 hash code
  int ComputeCRC32(
    Uint8List data,
  );

  /// Compute MD5 hash code
  Uint8List ComputeMD5(
    Uint8List data,
  );

  /// Compute SHA1 hash code
  Uint8List ComputeSHA1(
    Uint8List data,
  );

  /// Compute SHA256 hash code
  Uint8List ComputeSHA256(
    Uint8List data,
  );

  /// Load automation events list from file, NULL for empty list
  AutomationEventListD LoadAutomationEventList(
    String? fileName,
  );

  /// Unload automation events list from file
  void UnloadAutomationEventList(
    AutomationEventListD list,
  );

  /// Export automation events list as text file
  bool ExportAutomationEventList(
    AutomationEventListD list,
    String fileName,
  );

  /// Set automation event list to record to
  void SetAutomationEventList(
    AutomationEventListD list,
  );

  /// Set automation event internal base frame to start recording
  void SetAutomationEventBaseFrame(
    int frame,
  );

  /// Start recording automation events (AutomationEventList must be set)
  void StartAutomationEventRecording();

  /// Stop recording automation events
  void StopAutomationEventRecording();

  /// Play a recorded automation event
  void PlayAutomationEvent(
    AutomationEventD event,
  );

  /// Check if a key has been pressed once
  bool IsKeyPressed(
    KeyboardKey key,
  );

  /// Check if a key has been pressed again
  bool IsKeyPressedRepeat(
    KeyboardKey key,
  );

  /// Check if a key is being pressed
  bool IsKeyDown(
    KeyboardKey key,
  );

  /// Check if a key has been released once
  bool IsKeyReleased(
    KeyboardKey key,
  );

  /// Check if a key is NOT being pressed
  bool IsKeyUp(
    KeyboardKey key,
  );

  /// Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
  String GetKeyName(
    KeyboardKey key,
  );

  /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  int GetKeyPressed();

  /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  int GetCharPressed();

  /// Set a custom key to exit program (default is ESC)
  void SetExitKey(
    KeyboardKey key,
  );

  /// Check if a gamepad is available
  bool IsGamepadAvailable(
    num gamepad,
  );

  /// Get gamepad internal name id
  String GetGamepadName(
    num gamepad,
  );

  /// Check if a gamepad button has been pressed once
  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  );

  /// Check if a gamepad button is being pressed
  bool IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  );

  /// Check if a gamepad button has been released once
  bool IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  );

  /// Check if a gamepad button is NOT being pressed
  bool IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  );

  /// Get the last gamepad button pressed
  GamepadButton GetGamepadButtonPressed();

  /// Get gamepad axis count for a gamepad
  int GetGamepadAxisCount(
    num gamepad,
  );

  /// Get axis movement value for a gamepad axis
  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  );

  /// Set internal gamepad mappings (SDL_GameControllerDB)
  int SetGamepadMappings(
    String mappings,
  );

  /// Set gamepad vibration for both motors (duration in seconds)
  void SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  );

  /// Check if a mouse button has been pressed once
  bool IsMouseButtonPressed(
    MouseButton button,
  );

  /// Check if a mouse button is being pressed
  bool IsMouseButtonDown(
    MouseButton button,
  );

  /// Check if a mouse button has been released once
  bool IsMouseButtonReleased(
    MouseButton button,
  );

  /// Check if a mouse button is NOT being pressed
  bool IsMouseButtonUp(
    MouseButton button,
  );

  /// Get mouse position X
  int GetMouseX();

  /// Get mouse position Y
  int GetMouseY();

  /// Get mouse position XY
  Vector2D GetMousePosition();

  /// Get mouse delta between frames
  Vector2D GetMouseDelta();

  /// Set mouse position XY
  void SetMousePosition(
    num x,
    num y,
  );

  /// Set mouse offset
  void SetMouseOffset(
    num offsetX,
    num offsetY,
  );

  /// Set mouse scaling
  void SetMouseScale(
    num scaleX,
    num scaleY,
  );

  /// Get mouse wheel movement for X or Y, whichever is larger
  double GetMouseWheelMove();

  /// Get mouse wheel movement for both X and Y
  Vector2D GetMouseWheelMoveV();

  /// Set mouse cursor
  void SetMouseCursor(
    MouseCursor cursor,
  );

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX();

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY();

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2D GetTouchPosition(
    num index,
  );

  /// Get touch point identifier for given index
  int GetTouchPointId(
    num index,
  );

  /// Get number of touch points
  int GetTouchPointCount();

  /// Enable a set of gestures using flags [Gesture]
  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  );

  /// Check if a gesture have been detected
  bool IsGestureDetected(
    Gesture key,
  );

  /// Get latest detected gesture
  Gesture GetGestureDetected();

  /// Get gesture hold time in seconds
  double GetGestureHoldDuration();

  /// Get gesture drag vector
  Vector2D GetGestureDragVector();

  /// Get gesture drag angle
  double GetGestureDragAngle();

  /// Get gesture pinch delta
  Vector2D GetGesturePinchVector();

  /// Get gesture pinch angle
  double GetGesturePinchAngle();

  /// Process gesture event and translate it into gestures
  void ProcessGestureEvent(
    GestureEventD event,
  );
  
  /// Update gestures detected (must be called every frame)
  void UpdateGestures();

  /// Update camera position for selected mode
  void UpdateCamera(
    Camera3DD camera,
    CameraMode mode,
  );

  /// Update camera movement/rotation
  void UpdateCameraPro(
    Camera3DD camera,
    Vector3D movement,
    Vector3D rotation,
    num zoom,
  );

  /// Set texture and rectangle to be used on shapes drawing
  void SetShapesTexture(
    TextureD texture,
    RectangleD source,
  );

  /// Get texture that is used for shapes drawing
  TextureD GetShapesTexture();

  /// Get texture source rectangle that is used for shapes drawing
  RectangleD GetShapesTextureRectangle();

  /// Draw a pixel using geometry [Can be slow, use with care]
  void DrawPixel(
    num posX,
    num posY,
    ColorD color,
  );

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(
    Vector2D position,
    ColorD color,
  );

  /// Draw a line
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  );

  /// Draw a line (using gl lines)
  void DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  );

  /// Draw a line (using triangles/quads)
  void DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  );

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(
    List<Vector2D> points,
    ColorD color,
  );

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  );

  /// Draw a dashed line
  void DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    num dashSize,
    num spaceSize,
    ColorD color,
  );

  /// Draw a color-filled circle
  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  );

  /// Draw a piece of a circle
  void DrawCircleSector(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  );

  /// Draw circle sector outline
  void DrawCircleSectorLines(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  );

  /// Draw a gradient-filled circle
  void DrawCircleGradient(
    Vector2D center,
    num radius,
    ColorD inner,
    ColorD outer,
  );

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(
    Vector2D center,
    num radius,
    ColorD color,
  );

  /// Draw circle outline
  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  );

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(
    Vector2D center,
    num radius,
    ColorD color,
  );

  /// Draw ellipse
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  );

  /// Draw ellipse (Vector version)
  void DrawEllipseV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  );

  /// Draw ellipse outline
  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  );

  /// Draw ellipse outline (Vector version)
  void DrawEllipseLinesV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  );

  /// Draw ring
  void DrawRing(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  );

  /// Draw ring outline
  void DrawRingLines(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  );

  /// Draw a color-filled rectangle (Vector version)
  void DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  );

  /// Draw a color-filled rectangle with pro parameters
  void DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    num rotation,
    ColorD color,
  );

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorD top,
    ColorD bottom,
  );

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorD left,
    ColorD right,
  );

  /// Draw a gradient-filled rectangle with custom vertex colors
  void DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  );

  /// Draw rectangle outline
  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  );

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(
    RectangleD rec,
    num lineThick,
    ColorD color,
  );

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  );

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  );

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(
    RectangleD rec,
    num roundness,
    num segments,
    num lineThick,
    ColorD color,
  );

  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  );

  /// Draw triangle outline (vertex in counter-clockwise order!)
  void DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  );

  /// Draw a triangle fan defined by points (first vertex is the center)
  void DrawTriangleFan(
    List<Vector2D> points,
    ColorD color,
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(
    List<Vector2D> points,
    ColorD color,
  );

  /// Draw a regular polygon (Vector version)
  void DrawPoly(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  );

  /// Draw a polygon outline of n sides
  void DrawPolyLines(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  );

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorD color,
  );

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(
    List<Vector2D> points,
    num thick,
    ColorD color,
  );

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(
    List<Vector2D> points,
    num thick,
    ColorD color,
  );

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(
    List<Vector2D> points,
    num thick,
    ColorD color,
  );

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  );

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  );

  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    num thick,
    ColorD color,
  );

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  );

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  );

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num thick,
    ColorD color,
  );

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num thick,
    ColorD color,
  );

  /// Get (evaluate) spline point: Linear
  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    num t,
  );

  /// Get (evaluate) spline point: B-Spline
  Vector2D GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  );

  /// Get (evaluate) spline point: Catmull-Rom
  Vector2D GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  );

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num t,
  );

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2D GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num t,
  );

  /// Check collision between two rectangles
  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  );

  /// Check collision between two circles
  bool CheckCollisionCircles(
    Vector2D center1,
    num radius1,
    Vector2D center2,
    num radius2,
  );

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(
    Vector2D center,
    num radius,
    RectangleD rec,
  );

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(
    Vector2D center,
    num radius,
    Vector2D p1,
    Vector2D p2,
  );

  /// Check if point is inside rectangle
  bool CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  );

  /// Check if point is inside circle
  bool CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    num radius,
  );

  /// Check if point is inside a triangle
  bool CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  );

  /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  bool CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    num threshold,
  );

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(
    Vector2D point,
    List<Vector2D> points,
  );

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  (bool result, Vector2D collisionPoint) CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
  );

  /// Get collision rectangle for two rectangles collision
  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  );

  /// Load image from file into CPU memory (RAM)
  ImageD LoadImage(
    String fileName,
  );

  /// Load image from RAW file data
  ImageD LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  );

  /// Load image sequence from file (frames appended to image.data)
  ImageD LoadImageAnim(
    String fileName,
  );

  /// Load image sequence from memory buffer
  ImageD LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  );

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  ImageD LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  );

  /// Load image from GPU texture data
  ImageD LoadImageFromTexture(
    TextureD texture,
  );

  /// Load image from screen buffer and (screenshot)
  ImageD LoadImageFromScreen();

  /// Check if an image is valid (data and parameters)
  bool IsImageValid(
    ImageD image,
  );

  /// Unload image from CPU memory (RAM)
  void UnloadImage(
    ImageD image,
  );

  /// Export image data to file, returns true on success
  bool ExportImage(
    ImageD image,
    String fileName,
  );

  /// Export image to memory buffer
  (MemoryPointer<RUint8> dataPtr, int dataSize) ExportImageToMemory(
    ImageD image,
    String fileType,
  );

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(
    ImageD image,
    String fileName,
  );

  /// Generate image: plain color
  ImageD GenImageColor(
    num width,
    num height,
    ColorD color,
  );

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  ImageD GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorD start,
    ColorD end,
  );

  /// Generate image: radial gradient
  ImageD GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  );

  /// Generate image: square gradient
  ImageD GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  );

  /// Generate image: checked
  ImageD GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorD col1,
    ColorD col2,
  );

  /// Generate image: white noise
  ImageD GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  );

  /// Generate image: perlin noise
  ImageD GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  );

  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  ImageD GenImageCellular(
    num width,
    num height,
    num tileSize,
  );

  /// Generate image: grayscale image from text data
  ImageD GenImageText(
    num width,
    num height,
    String text,
  );

  /// Create an image duplicate (useful for transformations)
  ImageD ImageCopy(
    ImageD image,
  );

  /// Create an image from another image piece
  ImageD ImageFromImage(
    ImageD image,
    RectangleD rec,
  );

  /// Create an image from a selected channel of another image (GRAYSCALE)
  ImageD ImageFromChannel(
    ImageD image,
    num selectedChannel,
  );

  /// Create an image from text (default font)
  ImageD ImageText(
    String text,
    num fontSize,
    ColorD color,
  );

  /// Create an image from text (custom sprite font)
  ImageD ImageTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
    ColorD tint,
  );

  /// Convert image data to desired format
  void ImageFormat(
    ImageD image,
    PixelFormat newFormat,
  );

  /// Convert image to POT (power-of-two)
  void ImageToPOT(
    ImageD image,
    ColorD fill,
  );

  /// Crop an image to a defined rectangle
  void ImageCrop(
    ImageD image,
    RectangleD crop,
  );

  /// Crop image depending on alpha value
  void ImageAlphaCrop(
    ImageD image,
    num threshold,
  );

  /// Clear alpha channel to desired color
  void ImageAlphaClear(
    ImageD image,
    ColorD color,
    num threshold,
  );

  /// Apply alpha mask to image
  void ImageAlphaMask(
    ImageD image,
    ImageD alphaMask,
  );

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(
    ImageD image,
  );

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(
    ImageD image,
    num blurSize,
  );

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(
    ImageD image,
    List<double> kernel,
  );

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(
    ImageD image,
    num newWidth,
    num newHeight,
  );

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(
    ImageD image,
    num newWidth,
    num newHeight,
  );

  /// Resize canvas and fill with color
  void ImageResizeCanvas(
    ImageD image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorD fill,
  );

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(
    ImageD image,
  );

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(
    ImageD image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  );

  /// Flip image vertically
  void ImageFlipVertical(
    ImageD image,
  );

  /// Flip image horizontally
  void ImageFlipHorizontal(
    ImageD image,
  );

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(
    ImageD image,
    num degrees,
  );

  /// Rotate image clockwise 90deg
  void ImageRotateCW(
    ImageD image,
  );

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(
    ImageD image,
  );

  /// Modify image color: tint
  void ImageColorTint(
    ImageD image,
    ColorD color,
  );

  /// Modify image color: invert
  void ImageColorInvert(
    ImageD image,
  );

  /// Modify image color: grayscale
  void ImageColorGrayscale(
    ImageD image,
  );

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(
    ImageD image,
    num contrast,
  );

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(
    ImageD image,
    num brightness,
  );

  /// Modify image color: replace color
  void ImageColorReplace(
    ImageD image,
    ColorD color,
    ColorD replace,
  );

  /// Load color data from image as a Color array (RGBA - 32bit)
  List<ColorD> LoadImageColors(
    ImageD image,
  );

  /// Load colors palette from image as a Color array (RGBA - 32bit)
  List<ColorD> LoadImagePalette(
    ImageD image,
    num maxPaletteSize,
  );

  /// Get image alpha border rectangle
  RectangleD GetImageAlphaBorder(
    ImageD image,
    num threshold,
  );

  /// Get image pixel color at (x, y) position
  ColorD GetImageColor(
    ImageD image,
    num x,
    num y,
  );

  /// Clear image background with given color
  void ImageClearBackground(
    ImageD dst,
    ColorD color,
  );

  /// Draw pixel within an image
  void ImageDrawPixel(
    ImageD dst,
    num posX,
    num posY,
    ColorD color,
  );

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(
    ImageD dst,
    Vector2D position,
    ColorD color,
  );

  /// Draw line within an image
  void ImageDrawLine(
    ImageD dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  );

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  );

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    num thick,
    ColorD color,
  );

  /// Draw a filled circle within an image
  void ImageDrawCircle(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  );

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  );

  /// Draw circle outline within an image
  void ImageDrawCircleLines(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  );

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangle(
    ImageD dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  );

  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(
    ImageD dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(
    ImageD dst,
    RectangleD rec,
    ColorD color,
  );

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(
    ImageD dst,
    RectangleD rec,
    num thick,
    ColorD color,
  );

  /// Draw triangle within an image
  void ImageDrawTriangle(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  );

  /// Draw triangle with interpolated colors within an image
  void ImageDrawTriangleEx(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD c1,
    ColorD c2,
    ColorD c3,
  );

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  );

  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  );

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  );

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(
    ImageD dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  );

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(
    ImageD dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  );

  /// Draw text (custom sprite font) within an image (destination)
  void ImageDrawTextEx(
    ImageD dst,
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  );

  /// Load texture from file into GPU memory (VRAM)
  TextureD LoadTexture(
    String fileName,
  );

  /// Load texture from image data
  TextureD LoadTextureFromImage(
    ImageD image,
  );

  /// Load cubemap from image, multiple image cubemap layouts supported
  TextureD LoadTextureCubemap(
    ImageD image,
    CubemapLayout layout,
  );

  /// Load texture for rendering (framebuffer)
  RenderTextureD LoadRenderTexture(
    num width,
    num height,
  );

  /// Check if a texture is valid (loaded in GPU)
  bool IsTextureValid(
    TextureD texture,
  );

  /// Unload texture from GPU memory (VRAM)
  void UnloadTexture(
    TextureD texture,
  );

  /// Check if a render texture is valid (loaded in GPU)
  bool IsRenderTextureValid(
    RenderTextureD target,
  );

  /// Unload render texture from GPU memory (VRAM)
  void UnloadRenderTexture(
    RenderTextureD target,
  );

  /// Update GPU texture with new data
  void UpdateTexture(
    TextureD texture,
    Uint8List pixels,
  );

  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    Uint8List pixels,
  );

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(
    TextureD texture,
  );

  /// Set texture scaling filter mode
  void SetTextureFilter(
    TextureD texture,
    TextureFilter filter,
  );

  /// Set texture wrapping mode
  void SetTextureWrap(
    TextureD texture,
    TextureWrap wrap,
  );

  /// Draw a Texture2D
  void DrawTexture(
    TextureD texture,
    num posX,
    num posY,
    ColorD tint,
  );

  /// Draw a Texture2D with position defined as Vector2
  void DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  );

  /// Draw a Texture2D with extended parameters
  void DrawTextureEx(
    TextureD texture,
    Vector2D position,
    num rotation,
    num scale,
    ColorD tint,
  );

  /// Draw a part of a texture defined by a rectangle
  void DrawTextureRec(
    TextureD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  );

  /// Draw a part of a texture defined by a rectangle with 'pro' parameters
  void DrawTexturePro(
    TextureD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  );

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  );

  /// Check if two colors are equal
  bool ColorIsEqual(
    ColorD col1,
    ColorD col2,
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorD Fade(
    ColorD color,
    num alpha,
  );

  /// Get hexadecimal value for a Color (0xRRGGBBAA)
  int ColorToInt(
    ColorD color,
  );

  /// Get Color normalized as float [0..1]
  Vector4D ColorNormalize(
    ColorD color,
  );

  /// Get Color from normalized values [0..1]
  ColorD ColorFromNormalized(
    Vector4D normalized,
  );

  /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  Vector3D ColorToHSV(
    ColorD color,
  );

  /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  ColorD ColorFromHSV(
    num hue,
    num saturation,
    num value,
  );

  /// Get color multiplied with another color
  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  );

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  ColorD ColorBrightness(
    ColorD color,
    num factor,
  );

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  ColorD ColorContrast(
    ColorD color,
    num contrast,
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorD ColorAlpha(
    ColorD color,
    num alpha,
  );

  /// Get src alpha-blended into dst color with tint
  ColorD ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  );

  /// Get color lerp interpolation between two colors, factor [0.0..1.0]
  ColorD ColorLerp(
    ColorD color1,
    ColorD color2,
    num factor,
  );

  /// Get Color structure from hexadecimal value
  ColorD GetColor(
    num hexValue,
  );

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  );

  /// Get the default Font
  FontD GetFontDefault();

  /// Load font from file into GPU memory (VRAM)
  FontD LoadFont(
    String fileName,
  );

  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  FontD LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  );

  /// Load font from Image (XNA style)
  FontD LoadFontFromImage(
    ImageD image,
    ColorD key,
    num firstChar,
  );

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  FontD LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  );

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(
    FontD font,
  );

  /// Load font data for further use
  List<GlyphInfoD> LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  );

  /// Generate image font atlas using chars info
  (ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
    List<GlyphInfoD> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  );

  /// Unload font chars info data (RAM)
  void UnloadFontData(
    List<GlyphInfoD> glyphs,
  );

  /// Unload font from GPU memory (VRAM)
  void UnloadFont(
    FontD font,
  );

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(
    FontD font,
    String fileName,
  );

  /// Draw current FPS
  void DrawFPS(
    num posX,
    num posY,
  );

  /// Draw text (using default font)
  void DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  );

  /// Draw text using font and additional parameters
  void DrawTextEx(
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  );

  /// Draw text using Font and pro parameters (rotation)
  void DrawTextPro(
    FontD font,
    String text,
    Vector2D position,
    Vector2D origin,
    num rotation,
    num fontSize,
    num spacing,
    ColorD tint,
  );

  /// Draw one character (codepoint)
  void DrawTextCodepoint(
    FontD font,
    num codepoint,
    Vector2D position,
    num fontSize,
    ColorD tint,
  );

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(
    FontD font,
    Int32List codepoints,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  );

  /// Set vertical line spacing when drawing with line-breaks
  void SetTextLineSpacing(
    num spacing,
  );

  /// Measure string width for default font
  int MeasureText(
    String text,
    num fontSize,
  );

  /// Measure string size for Font
  Vector2D MeasureTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
  );

  /// Measure string size for an existing array of codepoints for Font
  Vector2D MeasureTextCodepoints(
    FontD font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  );

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(
    FontD font,
    num codepoint,
  );

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfoD GetGlyphInfo(
    FontD font,
    num codepoint,
  );

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  RectangleD GetGlyphAtlasRec(
    FontD font,
    num codepoint,
  );

  /// Load UTF-8 text encoded from codepoints array
  String LoadUTF8(
    Int32List codepoints,
  );

  /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  Int32List LoadCodepoints(
    String text,
  );

  /// Get total number of codepoints in a UTF-8 encoded string
  int GetCodepointCount(
    String text,
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepoint(
    String text,
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointNext(
    String text,
  );

  /// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointPrevious(
    String text,
  );

  /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  (String text, int size) CodepointToUTF8(
    num codepoint,
  );

  /// Load text as separate lines ('\n')
  List<String> LoadTextLines(
    String text,
  );
  
  /// Check if two text string are equal
  bool TextIsEqual(
    String text1,
    String text2,
  );

  /// Get text length
  int TextLength(
    String text,
  );

  /// Get a piece of a text string
  String TextSubtext(
    String text,
    int position,
    int length,
  );

  /// Remove text spaces, concat words
  String TextRemoveSpaces(
    String text,
  );

  /// Get text between two strings
  String GetTextBetween(
    String text,
    String begin,
    String end,
  );

  /// Replace text string with new string
  String TextReplace(
    String text,
    String search,
    String replacement,
  );

  /// Replace text between two specific strings
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  );

  /// Insert text in a defined byte position
  String TextInsert(
    String text,
    String insert,
    int position,
  );

  /// Join text strings with delimiter ([delimiter] is expected to be length of 1)
  String TextJoin(
    List<String> textList,
    String delimiter,
  );

  /// Split text into multiple strings
  List<String> TextSplit(
    String text,
    String delimiter,
  );

  /// Append text at specific position and move cursor
  String TextAppend(
    String text,
    String append,
  );

  /// Find first text occurrence within a string, -1 if not found
  int TextFindIndex(
    String text,
    String search,
  );

  /// Get upper case version of provided string
  String TextToUpper(
    String text,
  );
  
  /// Get lower case version of provided string
  String TextToLower(
    String text,
  );
  
  /// Get Pascal case notation version of provided string
  String TextToPascal(
    String text,
  );
  
  /// Get Snake case notation version of provided string
  String TextToSnake(
    String text,
  );
  
  /// Get Camel case notation version of provided string
  String TextToCamel(
    String text,
  );

  /// Get integer value from text
  int TextToInteger(
    String text,
  );
  
  /// Get float value from text
  double TextToFloat(
    String text,
  );

  /// Draw a line in 3D world space
  void DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  );

  /// Draw a point in 3D space, actually a small line
  void DrawPoint3D(
    Vector3D position,
    ColorD color,
  );

  /// Draw a circle in 3D world space
  void DrawCircle3D(
    Vector3D center,
    num radius,
    Vector3D rotationAxis,
    num rotationAngle,
    ColorD color,
  );

  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip3D(
    List<Vector3D> points,
    ColorD color,
  );

  /// Draw cube
  void DrawCube(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  );

  /// Draw cube (Vector version)
  void DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  );

  /// Draw cube wires
  void DrawCubeWires(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  );

  /// Draw cube wires (Vector version)
  void DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  );

  /// Draw sphere
  void DrawSphere(
    Vector3D centerPos,
    num radius,
    ColorD color,
  );

  /// Draw sphere with extended parameters
  void DrawSphereEx(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  );

  /// Draw sphere wires
  void DrawSphereWires(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  );

  /// Draw a cylinder/cone
  void DrawCylinder(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  );

  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  );

  /// Draw a cylinder/cone wires
  void DrawCylinderWires(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  );

  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  );

  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  );

  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  );

  /// Draw a plane XZ
  void DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  );

  /// Draw a ray line
  void DrawRay(
    RayD ray,
    ColorD color,
  );

  /// Draw a grid (centered at (0, 0, 0))
  void DrawGrid(
    num slices,
    num spacing,
  );

  /// Load model from files (meshes and materials)
  ModelD LoadModel(
    String fileName,
  );

  /// Load model from generated mesh (default material)
  ModelD LoadModelFromMesh(
    MeshD mesh,
  );

  /// Check if a model is valid (loaded in GPU, VAO/VBOs)
  bool IsModelValid(
    ModelD model,
  );

  /// Unload model (including meshes) from memory (RAM and/or VRAM)
  void UnloadModel(
    ModelD model,
  );

  /// Compute model bounding box limits (considers all meshes)
  BoundingBoxD GetModelBoundingBox(
    ModelD model,
  );

  /// Draw a model (with texture if set)
  void DrawModel(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint
  );

  /// Draw a model with extended parameters
  void DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  );

  /// Draw a model wires (with texture if set)
  void DrawModelWires(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  );

  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  );

  /// Draw bounding box (wires)
  void DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  );

  /// Draw a billboard texture
  void DrawBillboard(
    Camera3DD camera,
    TextureD texture,
    Vector3D position,
    num scale,
    ColorD tint,
  );

  /// Draw a billboard texture defined by source
  void DrawBillboardRec(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  );

  /// Draw a billboard texture defined by source and rotation
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
  );
  
  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(
    MeshD mesh,
    bool dynamic,
  );

  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(
    MeshD mesh,
    num index,
    TypedDataList data,
    num offset,
  );

  /// Unload mesh data from CPU and GPU
  void UnloadMesh(
    MeshD mesh,
  );

  /// Draw a 3d mesh with material and transform
  void DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  );

  /// Draw multiple mesh instances with material and different transforms
  void DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    List<MatrixD> transforms,
  );

  /// Compute mesh bounding box limits
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  );

  /// Compute mesh tangents
  void GenMeshTangents(
    MeshD mesh,
  );

  /// Export mesh data to file, returns true on success
  bool ExportMesh(
    MeshD mesh,
    String fileName,
  );

  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(
    MeshD mesh,
    String fileName,
  );

  /// Generate polygonal mesh
  MeshD GenMeshPoly(
    num sides,
    num radius,
  );

  /// Generate plane mesh (with subdivisions)
  MeshD GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  );

  /// Generate cuboid mesh
  MeshD GenMeshCube(
    num width,
    num height,
    num length,
  );

  /// Generate sphere mesh (standard sphere)
  MeshD GenMeshSphere(
    num radius,
    num rings,
    num slices,
  );

  /// Generate half-sphere mesh (no bottom cap)
  MeshD GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  );

  /// Generate cylinder mesh
  MeshD GenMeshCylinder(
    num radius,
    num height,
    num slices,
  );

  /// Generate cone/pyramid mesh
  MeshD GenMeshCone(
    num radius,
    num height,
    num slices,
  );

  /// Generate torus mesh
  MeshD GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  );

  /// Generate trefoil knot mesh
  MeshD GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  );

  /// Generate heightmap mesh from image data
  MeshD GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  );

  /// Generate cubes-based map mesh from image data
  MeshD GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  );

  /// Load materials from model file
  List<MaterialD> LoadMaterials(
    String fileName,
  );

  /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  MaterialD LoadMaterialDefault();

  /// Check if a material is valid (shader assigned, map textures loaded in GPU)
  bool IsMaterialValid(
    MaterialD material,
  );

  /// Unload material from GPU memory (VRAM)
  void UnloadMaterial(
    MaterialD material,
  );

  /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  void SetMaterialTexture(
    MaterialD material,
    MaterialMapIndex mapType,
    TextureD texture,
  );

  /// Set material for a mesh
  void SetModelMeshMaterial(
    ModelD model,
    num meshId,
    num materialId,
  );

  /// Load model animations from file
  LiveListPointerStruct<ModelAnimationD> LoadModelAnimations(
    String fileName,
  );

  /// Update model animation pose (CPU)
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  );

  /// Update model animation data (vertex buffers / bone matrices) for a specific pose,
  /// defined by two different animations at specific frames blended together
  void UpdateModelAnimationEx(
    ModelD model,
    ModelAnimationD animA,
    num frameA,
    ModelAnimationD animB,
    num frameB,
    num blend,
  );

  /// Unload animation array data
  void UnloadModelAnimations(
    LiveListPointerStruct<ModelAnimationD> animations,
  );

  /// Check model animation skeleton match
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  );

  /// Check collision between two spheres
  bool CheckCollisionSpheres(
    Vector3D center1,
    num radius1,
    Vector3D center2,
    num radius2,
  );

  /// Check collision between two bounding boxes
  bool CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  );

  /// Check collision between box and sphere
  bool CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    num radius,
  );

  /// Get collision info between ray and sphere
  RayCollisionD GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    num radius,
  );

  /// Get collision info between ray and box
  RayCollisionD GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  );

  /// Get collision info between ray and mesh
  RayCollisionD GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  );

  /// Get collision info between ray and triangle
  RayCollisionD GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  );

  /// Get collision info between ray and quad
  RayCollisionD GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  );
}
