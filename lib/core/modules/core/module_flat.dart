part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Core module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibCoreFlatModule<R extends RaylibBase> extends RaylibModule<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibCoreDartCaptureIds();

  RaylibCoreFlatModule(super.rl);

  @override
  @nonVirtual
  @DoNotAbbreviate()
  void dispose() {
    super.dispose();
    TraceLogCallbackBase.disposeRegistry();
    LoadFileDataCallbackBase.disposeRegistry();
    SaveFileDataCallbackBase.disposeRegistry();
    LoadFileTextCallbackBase.disposeRegistry();
    SaveFileTextCallbackBase.disposeRegistry();
  }

  /// Initialize window and OpenGL context
  void InitWindow(
    int width,
    int height,
    MemoryPointer<RChar> title,
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
    int flag,
  );

  /// Set window configuration state using flags
  void SetWindowState(
    int flags,
  );

  /// Clear window configuration state flags
  void ClearWindowState(
    int flags,
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
    StructPointer<ImageD> images,
    int count,
  );

  /// Set title for window
  void SetWindowTitle(
    MemoryPointer<RChar> title,
  );

  /// Set window position on screen
  void SetWindowPosition(
    int x,
    int y,
  );

  /// Set monitor for the current window
  void SetWindowMonitor(
    int monitor,
  );

  /// Set window minimum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMinSize(
    int width,
    int height,
  );

  /// Set window maximum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMaxSize(
    int width,
    int height,
  );

  /// Set window dimensions
  void SetWindowSize(
    int width,
    int height,
  );

  /// Set window opacity [0.0..1.0]
  void SetWindowOpacity(
    double opacity,
  );

  /// Set window focused
  void SetWindowFocused();

  /// Get native window handle
  MemoryPointer<RVoid> GetWindowHandle();

  /// Get current screen width
  int GetScreenWidth();

  /// Get current screen height
  int GetScreenHeight();

  /// Get current render width (it considers HiDPI)
  int GetRenderWidth();

  /// Get current render height (it considers HiDPI)
  int GetRenderHeight();

  /// Get number of connected monitors
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorCount();

  /// Get current monitor where window is placed
  /// 
  /// **[!] Not implemented on WASM**
  int GetCurrentMonitor();

  /// Get specified monitor position
  /// 
  /// **[!] Not implemented on WASM**
  Vector2D GetMonitorPosition(
    int monitor,
  );

  /// Get specified monitor width (current video mode used by monitor)
  int GetMonitorWidth(
    int monitor,
  );

  /// Get specified monitor height (current video mode used by monitor)
  int GetMonitorHeight(
    int monitor,
  );

  /// Get specified monitor physical width in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalWidth(
    int monitor,
  );

  /// Get specified monitor physical height in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalHeight(
    int monitor,
  );

  /// Get specified monitor refresh rate
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorRefreshRate(
    int monitor,
  );

  /// Get window position XY on monitor
  Vector2D GetWindowPosition();

  /// Get window scale DPI factor
  Vector2D GetWindowScaleDPI();

  /// Get the human-readable, UTF-8 encoded name of the specified monitor
  /// 
  /// **[!] Not implemented on WASM**
  MemoryPointer<RChar> GetMonitorName(
    int monitor,
  );

  /// Set clipboard text content
  void SetClipboardText(
    MemoryPointer<RChar> text,
  );

  /// Get clipboard text content
  MemoryPointer<RChar> GetClipboardText();

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
    int mode,
  );

  /// End blending mode (reset to default: alpha blending)
  void EndBlendMode();

  /// Begin scissor mode (define screen area for following drawing)
  void BeginScissorMode(
    int x,
    int y,
    int width,
    int height,
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
    MemoryPointer<RChar> vsFileName,
    MemoryPointer<RChar> fsFileName,
  );

  /// Load shader from code strings and bind default locations
  ShaderD LoadShaderFromMemory(
    MemoryPointer<RChar> vsCode,
    MemoryPointer<RChar> fsCode,
  );

  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(
    ShaderD shader,
  );

  /// Get shader uniform location
  int GetShaderLocation(
    ShaderD shader,
    MemoryPointer<RChar> uniformName,
  );

  /// Get shader attribute location
  int GetShaderLocationAttrib(
    ShaderD shader,
    MemoryPointer<RChar> attribName,
  );

  /// Set shader uniform value
  @nonVirtual
  void SetShaderValue(
    ShaderD shader,
    int locIndex,
    MemoryPointer<RVoid> value,
    int uniformType,
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
    int locIndex,
    MemoryPointer<RVoid> value,
    int uniformType,
    int count,
  );

  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(
    ShaderD shader,
    int locIndex,
    MatrixD mat,
  );

  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(
    ShaderD shader,
    int locIndex,
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
    int width,
    int height,
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
    int width,
    int height,
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
    int fps,
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
    double seconds,
  );

  /// Set the seed for the random number generator
  void SetRandomSeed(
    int seed,
  );

  /// Get a random value between min and max (both included)
  int GetRandomValue(
    int min,
    int max,
  );

  /// Load random values sequence, no values repeated, min and max included
  MemoryPointer<RInt> LoadRandomSequence(
    int count,
    int min,
    int max,
  );

  /// Unload random values sequence
  void UnloadRandomSequence(
    MemoryPointer<RInt> sequence,
  );

  /// Takes a screenshot of current screen (filename extension defines format)
  void TakeScreenshot(
    MemoryPointer<RChar> fileName,
  );

  /// Setup init configuration flags (view [ConfigFlags])
  void SetConfigFlags(
    int flags,
  );

  /// Open URL with default system browser (if available)
  void OpenURL(
    MemoryPointer<RChar> url,
  );

  /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  void TraceLog(
    int logLevel,
    MemoryPointer<RChar> text,
    // NOTE: missing va_list argument
  );

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(
    int logLevel,
  );

  /// Set custom trace log
  void SetTraceLogCallback(
    MemoryPointer<RFunction<TraceLogCallbackBase>> callback,
  );

  /// Set custom file binary data loader
  void SetLoadFileDataCallback(
    MemoryPointer<RFunction<LoadFileDataCallbackBase>> callback,
  );

  /// Set custom file binary data saver
  void SetSaveFileDataCallback(
    MemoryPointer<RFunction<SaveFileDataCallbackBase>> callback,
  );

  /// Set custom file text data loader
  void SetLoadFileTextCallback(
    MemoryPointer<RFunction<LoadFileTextCallbackBase>> callback,
  );

  /// Set custom file text data saver
  void SetSaveFileTextCallback(
    MemoryPointer<RFunction<SaveFileTextCallbackBase>> callback,
  );

  /// Load file data as byte array (read)
  MemoryPointer<RUnsignedChar> LoadFileData(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> dataSize,
  );

  /// Unload file data allocated by LoadFileData()
  void UnloadFileData(
    MemoryPointer<RUnsignedChar> data,
  );

  /// Save data to file from byte array (write), returns true on success
  bool SaveFileData(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RVoid> data,
    int dataSize,
  );

  /// Export data to code (.h), returns true on success
  bool ExportDataAsCode(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RChar> fileName,
  );

  /// Load text data from file (read)
  MemoryPointer<RChar> LoadFileText(
    MemoryPointer<RChar> fileName,
  );

  /// Unload file text data allocated by LoadFileText()
  void UnloadFileText(
    MemoryPointer<RChar> text,
  );

  /// Save text data to file (write), returns true on success
  bool SaveFileText(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> text,
  );
    
  /// Rename file (if exists)
  int FileRename(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> fileRename,
  );

  /// Remove file (if exists)
  int FileRemove(
    MemoryPointer<RChar> fileName,
  );

  /// Copy file from one path to another, dstPath created if it doesn't exist
  int FileCopy(
    MemoryPointer<RChar> srcPath,
    MemoryPointer<RChar> dstPath,
  );

  /// Move file from one directory to another, dstPath created if it doesn't exist
  int FileMove(
    MemoryPointer<RChar> srcPath,
    MemoryPointer<RChar> dstPath,
  );

  /// Replace text in an existing file
  int FileTextReplace(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> search,
    MemoryPointer<RChar> replacement,
  );

  /// Find text in existing file
  int FileTextFindIndex(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> search,
  );

  /// Check if file exists
  bool FileExists(
    MemoryPointer<RChar> fileName,
  );

  /// Check if a directory path exists
  bool DirectoryExists(
    MemoryPointer<RChar> dirPath,
  );

  /// Check file extension (including point: .png, .wav)
  bool IsFileExtension(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> ext,
  );

  /// Get file length in bytes
  int GetFileLength(
    MemoryPointer<RChar> fileName,
  );

  /// Get extension for a filename (includes dot: '.png')
  MemoryPointer<RChar> GetFileExtension(
    MemoryPointer<RChar> fileName,
  );

  /// Get filename for a path string
  MemoryPointer<RChar> GetFileName(
    MemoryPointer<RChar> filePath,
  );

  /// Get filename without extension
  MemoryPointer<RChar> GetFileNameWithoutExt(
    MemoryPointer<RChar> filePath,
  );

  /// Get the file count in a directory
  int GetDirectoryFileCount(
    MemoryPointer<RChar> dirPath,
  );

  /// Get the file count in a directory with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  int GetDirectoryFileCountEx(
    MemoryPointer<RChar> basePath,
    MemoryPointer<RChar> filter,
    bool scanSubdirs,
  );

  /// Get full path for a given fileName with path
  MemoryPointer<RChar> GetDirectoryPath(
    MemoryPointer<RChar> filePath,
  );

  /// Get previous directory path for a given path
  MemoryPointer<RChar> GetPrevDirectoryPath(
    MemoryPointer<RChar> dirPath,
  );

  /// Get current working directory
  MemoryPointer<RChar> GetWorkingDirectory();

  /// Get the directory of the running application
  MemoryPointer<RChar> GetApplicationDirectory();

  /// Create directories (including full path requested), returns 0 on success
  int MakeDirectory(
    MemoryPointer<RChar> dirPath,
  );

  /// Change working directory, return true on success
  bool ChangeDirectory(
    MemoryPointer<RChar> dir,
  );

  /// Check if a given path is a file or a directory
  bool IsPathFile(
    MemoryPointer<RChar> path,
  );

  /// Check if fileName is valid for the platform/OS
  bool IsFileNameValid(
    MemoryPointer<RChar> fileName,
  );

  /// Load directory filepaths
  FilePathListD LoadDirectoryFiles(
    MemoryPointer<RChar> dirPath,
  );

  /// Load directory filepaths with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  FilePathListD LoadDirectoryFilesEx(
    MemoryPointer<RChar> basePath,
    MemoryPointer<RChar> filter,
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
    MemoryPointer<RChar> fileName,
  );

  /// Compress data (DEFLATE algorithm)
  MemoryPointer<RUnsignedChar> CompressData(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RInt> compDataSize,
  );

  /// Decompress data (DEFLATE algorithm)
  MemoryPointer<RUnsignedChar> DecompressData(
    MemoryPointer<RUnsignedChar> compData,
    int compDataSize,
    MemoryPointer<RInt> dataSize,
  );

  /// Encode data to Base64 string
  MemoryPointer<RChar> EncodeDataBase64(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RInt> outputSize,
  );

  /// Decode Base64 string data
  MemoryPointer<RUnsignedChar> DecodeDataBase64(
    MemoryPointer<RChar> data,
    MemoryPointer<RInt> outputSize,
  );

  /// Compute CRC32 hash code
  int ComputeCRC32(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  );

  /// Compute MD5 hash code
  MemoryPointer<RUnsignedInt> ComputeMD5(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  );

  /// Compute SHA1 hash code
  MemoryPointer<RUnsignedInt> ComputeSHA1(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  );

  /// Compute SHA256 hash code
  MemoryPointer<RUnsignedInt> ComputeSHA256(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  );

  /// Load automation events list from file, NULL for empty list
  AutomationEventListD LoadAutomationEventList(
    MemoryPointer<RChar> fileName,
  );

  /// Unload automation events list from file
  void UnloadAutomationEventList(
    AutomationEventListD list,
  );

  /// Export automation events list as text file
  bool ExportAutomationEventList(
    AutomationEventListD list,
    MemoryPointer<RChar> fileName,
  );

  /// Set automation event list to record to
  void SetAutomationEventList(
    StructPointer<AutomationEventListD> list,
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
    int key,
  );

  /// Check if a key has been pressed again
  bool IsKeyPressedRepeat(
    int key,
  );

  /// Check if a key is being pressed
  bool IsKeyDown(
    int key,
  );

  /// Check if a key has been released once
  bool IsKeyReleased(
    int key,
  );

  /// Check if a key is NOT being pressed
  bool IsKeyUp(
    int key,
  );

  /// Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
  /// 
  /// **[!] Not implemented on WASM**
  MemoryPointer<RChar> GetKeyName(
    int key,
  );

  /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  int GetKeyPressed();

  /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  int GetCharPressed();

  /// Set a custom key to exit program (default is ESC)
  void SetExitKey(
    int key,
  );

  /// Check if a gamepad is available
  bool IsGamepadAvailable(
    int gamepad,
  );

  /// Get gamepad internal name id
  MemoryPointer<RChar> GetGamepadName(
    int gamepad,
  );

  /// Check if a gamepad button has been pressed once
  bool IsGamepadButtonPressed(
    int gamepad,
    int button,
  );

  /// Check if a gamepad button is being pressed
  bool IsGamepadButtonDown(
    int gamepad,
    int button,
  );

  /// Check if a gamepad button has been released once
  bool IsGamepadButtonReleased(
    int gamepad,
    int button,
  );

  /// Check if a gamepad button is NOT being pressed
  bool IsGamepadButtonUp(
    int gamepad,
    int button,
  );

  /// Get the last gamepad button pressed
  int GetGamepadButtonPressed();

  /// Get gamepad axis count for a gamepad
  int GetGamepadAxisCount(
    int gamepad,
  );

  /// Get axis movement value for a gamepad axis
  double GetGamepadAxisMovement(
    int gamepad,
    int axis,
  );

  /// Set internal gamepad mappings (SDL_GameControllerDB)
  int SetGamepadMappings(
    MemoryPointer<RChar> mappings,
  );

  /// Set gamepad vibration for both motors (duration in seconds)
  void SetGamepadVibration(
    int gamepad,
    double leftMotor,
    double rightMotor,
    double duration,
  );

  /// Check if a mouse button has been pressed once
  bool IsMouseButtonPressed(
    int button,
  );

  /// Check if a mouse button is being pressed
  bool IsMouseButtonDown(
    int button,
  );

  /// Check if a mouse button has been released once
  bool IsMouseButtonReleased(
    int button,
  );

  /// Check if a mouse button is NOT being pressed
  bool IsMouseButtonUp(
    int button,
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
    int x,
    int y,
  );

  /// Set mouse offset
  void SetMouseOffset(
    int offsetX,
    int offsetY,
  );

  /// Set mouse scaling
  void SetMouseScale(
    double scaleX,
    double scaleY,
  );

  /// Get mouse wheel movement for X or Y, whichever is larger
  double GetMouseWheelMove();

  /// Get mouse wheel movement for both X and Y
  Vector2D GetMouseWheelMoveV();

  /// Set mouse cursor
  void SetMouseCursor(
    int cursor,
  );

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX();

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY();

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2D GetTouchPosition(
    int index,
  );

  /// Get touch point identifier for given index
  int GetTouchPointId(
    int index,
  );

  /// Get number of touch points
  int GetTouchPointCount();

  /// Enable a set of gestures using flags [Gesture]
  void SetGesturesEnabled(
    int flags,
  );

  /// Check if a gesture have been detected
  bool IsGestureDetected(
    int gesture,
  );

  /// Get latest detected gesture
  int GetGestureDetected();

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
    StructPointer<Camera3DD> camera,
    int mode,
  );

  /// Update camera movement/rotation
  void UpdateCameraPro(
    StructPointer<Camera3DD> camera,
    Vector3D movement,
    Vector3D rotation,
    double zoom,
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
    int posX,
    int posY,
    ColorD color,
  );

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(
    Vector2D position,
    ColorD color,
  );

  /// Draw a line
  void DrawLine(
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
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
    double thick,
    ColorD color,
  );

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  );

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    double thick,
    ColorD color,
  );

  /// Draw a dashed line
  void DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    int dashSize,
    int spaceSize,
    ColorD color,
  );

  /// Draw a color-filled circle
  void DrawCircle(
    int centerX,
    int centerY,
    double radius,
    ColorD color,
  );

  /// Draw a piece of a circle
  void DrawCircleSector(
    Vector2D center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  );

  /// Draw circle sector outline
  void DrawCircleSectorLines(
    Vector2D center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  );

  /// Draw a gradient-filled circle
  void DrawCircleGradient(
    Vector2D center,
    double radius,
    ColorD inner,
    ColorD outer,
  );

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(
    Vector2D center,
    double radius,
    ColorD color,
  );

  /// Draw circle outline
  void DrawCircleLines(
    int centerX,
    int centerY,
    double radius,
    ColorD color,
  );

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(
    Vector2D center,
    double radius,
    ColorD color,
  );

  /// Draw ellipse
  void DrawEllipse(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    ColorD color,
  );

  /// Draw ellipse (Vector version)
  void DrawEllipseV(
    Vector2D center,
    double radiusH,
    double radiusV,
    ColorD color,
  );

  /// Draw ellipse outline
  void DrawEllipseLines(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    ColorD color,
  );

  /// Draw ellipse outline (Vector version)
  void DrawEllipseLinesV(
    Vector2D center,
    double radiusH,
    double radiusV,
    ColorD color,
  );

  /// Draw ring
  void DrawRing(
    Vector2D center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  );

  /// Draw ring outline
  void DrawRingLines(
    Vector2D center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangle(
    int posX,
    int posY,
    int width,
    int height,
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
    double rotation,
    ColorD color,
  );

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(
    int posX,
    int posY,
    int width,
    int height,
    ColorD top,
    ColorD bottom,
  );

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(
    int posX,
    int posY,
    int width,
    int height,
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
    int posX,
    int posY,
    int width,
    int height,
    ColorD color,
  );

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(
    RectangleD rec,
    double lineThick,
    ColorD color,
  );

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(
    RectangleD rec,
    double roundness,
    int segments,
    ColorD color,
  );

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(
    RectangleD rec,
    double roundness,
    int segments,
    ColorD color,
  );

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(
    RectangleD rec,
    double roundness,
    int segments,
    double lineThick,
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
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  );

  /// Draw a regular polygon (Vector version)
  void DrawPoly(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    ColorD color,
  );

  /// Draw a polygon outline of n sides
  void DrawPolyLines(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    ColorD color,
  );

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    double lineThick,
    ColorD color,
  );

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  );

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  );

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  );

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  );

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  );

  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    double thick,
    ColorD color,
  );

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double thick,
    ColorD color,
  );

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double thick,
    ColorD color,
  );

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    double thick,
    ColorD color,
  );

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    double thick,
    ColorD color,
  );

  /// Get (evaluate) spline point: Linear
  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    double t,
  );

  /// Get (evaluate) spline point: B-Spline
  Vector2D GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double t,
  );

  /// Get (evaluate) spline point: Catmull-Rom
  Vector2D GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double t,
  );

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    double t,
  );

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2D GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    double t,
  );

  /// Check collision between two rectangles
  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  );

  /// Check collision between two circles
  bool CheckCollisionCircles(
    Vector2D center1,
    double radius1,
    Vector2D center2,
    double radius2,
  );

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(
    Vector2D center,
    double radius,
    RectangleD rec,
  );

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(
    Vector2D center,
    double radius,
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
    double radius,
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
    int threshold,
  );

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(
    Vector2D point,
    StructPointer<Vector2D> points,
    int pointCount,
  );

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  bool CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
    StructPointer<Vector2D> collisionPoint,
  );

  /// Get collision rectangle for two rectangles collision
  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  );

  /// Load image from file into CPU memory (RAM)
  ImageD LoadImage(
    MemoryPointer<RChar> fileName,
  );

  /// Load image from RAW file data
  ImageD LoadImageRaw(
    MemoryPointer<RChar> fileName,
    int width,
    int height,
    int format,
    int headerSize,
  );

  /// Load image sequence from file (frames appended to image.data)
  ImageD LoadImageAnim(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> frames,
  );

  /// Load image sequence from memory buffer
  ImageD LoadImageAnimFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
    MemoryPointer<RInt> frames,
  );

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  ImageD LoadImageFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
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
    MemoryPointer<RChar> fileName,
  );

  /// Export image to memory buffer
  MemoryPointer<RUint8> ExportImageToMemory(
    ImageD image,
    MemoryPointer<RChar> fileType,
    MemoryPointer<RInt> fileSize,
  );

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(
    ImageD image,
    MemoryPointer<RChar> fileName,
  );

  /// Generate image: plain color
  ImageD GenImageColor(
    int width,
    int height,
    ColorD color,
  );

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  ImageD GenImageGradientLinear(
    int width,
    int height,
    int direction,
    ColorD start,
    ColorD end,
  );

  /// Generate image: radial gradient
  ImageD GenImageGradientRadial(
    int width,
    int height,
    double density,
    ColorD inner,
    ColorD outer,
  );

  /// Generate image: square gradient
  ImageD GenImageGradientSquare(
    int width,
    int height,
    double density,
    ColorD inner,
    ColorD outer,
  );

  /// Generate image: checked
  ImageD GenImageChecked(
    int width,
    int height,
    int checksX,
    int checksY,
    ColorD col1,
    ColorD col2,
  );

  /// Generate image: white noise
  ImageD GenImageWhiteNoise(
    int width,
    int height,
    double factor,
  );

  /// Generate image: perlin noise
  ImageD GenImagePerlinNoise(
    int width,
    int height,
    int offsetX,
    int offsetY,
    double scale,
  );

  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  ImageD GenImageCellular(
    int width,
    int height,
    int tileSize,
  );

  /// Generate image: grayscale image from text data
  ImageD GenImageText(
    int width,
    int height,
    MemoryPointer<RChar> text,
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
    int selectedChannel,
  );

  /// Create an image from text (default font)
  ImageD ImageText(
    MemoryPointer<RChar> text,
    int fontSize,
    ColorD color,
  );

  /// Create an image from text (custom sprite font)
  ImageD ImageTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    double fontSize,
    double spacing,
    ColorD tint,
  );

  /// Convert image data to desired format
  void ImageFormat(
    StructPointer<ImageD> image,
    int newFormat,
  );

  /// Convert image to POT (power-of-two)
  void ImageToPOT(
    StructPointer<ImageD> image,
    ColorD fill,
  );

  /// Crop an image to a defined rectangle
  void ImageCrop(
    StructPointer<ImageD> image,
    RectangleD crop,
  );

  /// Crop image depending on alpha value
  void ImageAlphaCrop(
    StructPointer<ImageD> image,
    double threshold,
  );

  /// Clear alpha channel to desired color
  void ImageAlphaClear(
    StructPointer<ImageD> image,
    ColorD color,
    double threshold,
  );

  /// Apply alpha mask to image
  void ImageAlphaMask(
    StructPointer<ImageD> image,
    ImageD alphaMask,
  );

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(
    StructPointer<ImageD> image,
  );

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(
    StructPointer<ImageD> image,
    int blurSize,
  );

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(
    StructPointer<ImageD> image,
    MemoryPointer<RFloat> kernel,
    int kernelSize,
  );

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(
    StructPointer<ImageD> image,
    int newWidth,
    int newHeight,
  );

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(
    StructPointer<ImageD> image,
    int newWidth,
    int newHeight,
  );

  /// Resize canvas and fill with color
  void ImageResizeCanvas(
    StructPointer<ImageD> image,
    int newWidth,
    int newHeight,
    int offsetX,
    int offsetY,
    ColorD fill,
  );

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(
    StructPointer<ImageD> image,
  );

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(
    StructPointer<ImageD> image,
    int rBpp,
    int gBpp,
    int bBpp,
    int aBpp,
  );

  /// Flip image vertically
  void ImageFlipVertical(
    StructPointer<ImageD> image,
  );

  /// Flip image horizontally
  void ImageFlipHorizontal(
    StructPointer<ImageD> image,
  );

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(
    StructPointer<ImageD> image,
    int degrees,
  );

  /// Rotate image clockwise 90deg
  void ImageRotateCW(
    StructPointer<ImageD> image,
  );

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(
    StructPointer<ImageD> image,
  );

  /// Modify image color: tint
  void ImageColorTint(
    StructPointer<ImageD> image,
    ColorD color,
  );

  /// Modify image color: invert
  void ImageColorInvert(
    StructPointer<ImageD> image,
  );

  /// Modify image color: grayscale
  void ImageColorGrayscale(
    StructPointer<ImageD> image,
  );

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(
    StructPointer<ImageD> image,
    double contrast,
  );

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(
    StructPointer<ImageD> image,
    int brightness,
  );

  /// Modify image color: replace color
  void ImageColorReplace(
    StructPointer<ImageD> image,
    ColorD color,
    ColorD replace,
  );

  /// Load color data from image as a Color array (RGBA - 32bit)
  StructPointer<ColorD> LoadImageColors(
    ImageD image,
  );

  /// Load colors palette from image as a Color array (RGBA - 32bit)
  StructPointer<ColorD> LoadImagePalette(
    ImageD image,
    int maxPaletteSize,
    MemoryPointer<RInt> colorCount,
  );

  /// Unload color data loaded with LoadImageColors()
  void UnloadImageColors(
    StructPointer<ColorD> colors,
  );

  /// Unload colors palette loaded with LoadImagePalette()
  void UnloadImagePalette(
    StructPointer<ColorD> colors,
  );

  /// Get image alpha border rectangle
  RectangleD GetImageAlphaBorder(
    ImageD image,
    double threshold,
  );

  /// Get image pixel color at (x, y) position
  ColorD GetImageColor(
    ImageD image,
    int x,
    int y,
  );

  /// Clear image background with given color
  void ImageClearBackground(
    StructPointer<ImageD> dst,
    ColorD color,
  );

  /// Draw pixel within an image
  void ImageDrawPixel(
    StructPointer<ImageD> dst,
    int posX,
    int posY,
    ColorD color,
  );

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(
    StructPointer<ImageD> dst,
    Vector2D position,
    ColorD color,
  );

  /// Draw line within an image
  void ImageDrawLine(
    StructPointer<ImageD> dst,
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    ColorD color,
  );

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(
    StructPointer<ImageD> dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  );

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(
    StructPointer<ImageD> dst,
    Vector2D start,
    Vector2D end,
    int thick,
    ColorD color,
  );

  /// Draw a filled circle within an image
  void ImageDrawCircle(
    StructPointer<ImageD> dst,
    int centerX,
    int centerY,
    int radius,
    ColorD color,
  );

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(
    StructPointer<ImageD> dst,
    Vector2D center,
    int radius,
    ColorD color,
  );

  /// Draw circle outline within an image
  void ImageDrawCircleLines(
    StructPointer<ImageD> dst,
    int centerX,
    int centerY,
    int radius,
    ColorD color,
  );

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(
    StructPointer<ImageD> dst,
    Vector2D center,
    int radius,
    ColorD color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangle(
    StructPointer<ImageD> dst,
    int posX,
    int posY,
    int width,
    int height,
    ColorD color,
  );

  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(
    StructPointer<ImageD> dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(
    StructPointer<ImageD> dst,
    RectangleD rec,
    ColorD color,
  );

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(
    StructPointer<ImageD> dst,
    RectangleD rec,
    int thick,
    ColorD color,
  );

  /// Draw triangle within an image
  void ImageDrawTriangle(
    StructPointer<ImageD> dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  );

  /// Draw triangle with interpolated colors within an image
  void ImageDrawTriangleEx(
    StructPointer<ImageD> dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD c1,
    ColorD c2,
    ColorD c3,
  );

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(
    StructPointer<ImageD> dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  );

  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(
    StructPointer<ImageD> dst,
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  );

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(
    StructPointer<ImageD> dst,
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  );

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(
    StructPointer<ImageD> dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  );

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(
    StructPointer<ImageD> dst,
    MemoryPointer<RChar> text,
    int posX,
    int posY,
    int fontSize,
    ColorD color,
  );

  /// Draw text (custom sprite font) within an image (destination)
  void ImageDrawTextEx(
    StructPointer<ImageD> dst,
    FontD font,
    MemoryPointer<RChar> text,
    Vector2D position,
    double fontSize,
    double spacing,
    ColorD tint,
  );

  /// Load texture from file into GPU memory (VRAM)
  TextureD LoadTexture(
    MemoryPointer<RChar> fileName,
  );

  /// Load texture from image data
  TextureD LoadTextureFromImage(
    ImageD image,
  );

  /// Load cubemap from image, multiple image cubemap layouts supported
  TextureD LoadTextureCubemap(
    ImageD image,
    int layout,
  );

  /// Load texture for rendering (framebuffer)
  RenderTextureD LoadRenderTexture(
    int width,
    int height,
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
    MemoryPointer<RVoid> pixels,
  );

  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    MemoryPointer<RVoid> pixels,
  );

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(
    StructPointer<TextureD> texture,
  );

  /// Set texture scaling filter mode
  void SetTextureFilter(
    TextureD texture,
    int filter,
  );

  /// Set texture wrapping mode
  void SetTextureWrap(
    TextureD texture,
    int wrap,
  );

  /// Draw a Texture2D
  void DrawTexture(
    TextureD texture,
    int posX,
    int posY,
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
    double rotation,
    double scale,
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
    double rotation,
    ColorD tint,
  );

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    double rotation,
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
    double alpha,
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
    double hue,
    double saturation,
    double value,
  );

  /// Get color multiplied with another color
  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  );

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  ColorD ColorBrightness(
    ColorD color,
    double factor,
  );

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  ColorD ColorContrast(
    ColorD color,
    double contrast,
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorD ColorAlpha(
    ColorD color,
    double alpha,
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
    double factor,
  );

  /// Get Color structure from hexadecimal value
  ColorD GetColor(
    int hexValue,
  );

  /// Get Color from a source pixel pointer of certain format
  ColorD GetPixelColor(
    MemoryPointer<RVoid> srcPtr,
    int format,
  );

  /// Set color formatted into destination pixel pointer
  void SetPixelColor(
    MemoryPointer<RVoid> dstPtr,
    ColorD color,
    int format,
  );

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(
    int width,
    int height,
    int format,
  );

  /// Get the default Font
  FontD GetFontDefault();

  /// Load font from file into GPU memory (VRAM)
  FontD LoadFont(
    MemoryPointer<RChar> fileName,
  );

  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  FontD LoadFontEx(
    MemoryPointer<RChar> fileName,
    int fontSize,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
  );

  /// Load font from Image (XNA style)
  FontD LoadFontFromImage(
    ImageD image,
    ColorD key,
    int firstChar,
  );

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  FontD LoadFontFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
    int fontSize,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
  );

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(
    FontD font,
  );

  /// Load font data for further use
  StructPointer<GlyphInfoD> LoadFontData(
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
    int fontSize,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
    int type,
    MemoryPointer<RInt> glyphCount,
  );

  /// Generate image font atlas using chars info
  ImageD GenImageFontAtlas(
    StructPointer<GlyphInfoD> glyphs,
    MemoryPointer<RPointer<RStruct>> glyphRecs, // RectangleD
    int glyphCount,
    int fontSize,
    int padding,
    int packMethod,
  );

  /// Unload font chars info data (RAM)
  void UnloadFontData(
    StructPointer<GlyphInfoD> glyphs,
    int glyphCount,
  );

  /// Unload font from GPU memory (VRAM)
  void UnloadFont(
    FontD font,
  );

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(
    FontD font,
    MemoryPointer<RChar> fileName,
  );

  /// Draw current FPS
  void DrawFPS(
    int posX,
    int posY,
  );

  /// Draw text (using default font)
  void DrawText(
    MemoryPointer<RChar> text,
    int posX,
    int posY,
    int fontSize,
    ColorD color,
  );

  /// Draw text using font and additional parameters
  void DrawTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    Vector2D position,
    double fontSize,
    double spacing,
    ColorD tint,
  );

  /// Draw text using Font and pro parameters (rotation)
  void DrawTextPro(
    FontD font,
    MemoryPointer<RChar> text,
    Vector2D position,
    Vector2D origin,
    double rotation,
    double fontSize,
    double spacing,
    ColorD tint,
  );

  /// Draw one character (codepoint)
  void DrawTextCodepoint(
    FontD font,
    int codepoint,
    Vector2D position,
    double fontSize,
    ColorD tint,
  );

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(
    FontD font,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
    Vector2D position,
    double fontSize,
    double spacing,
    ColorD tint,
  );

  /// Set vertical line spacing when drawing with line-breaks
  void SetTextLineSpacing(
    int spacing,
  );

  /// Measure string width for default font
  int MeasureText(
    MemoryPointer<RChar> text,
    int fontSize,
  );

  /// Measure string size for Font
  Vector2D MeasureTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    double fontSize,
    double spacing,
  );

  /// Measure string size for an existing array of codepoints for Font
  Vector2D MeasureTextCodepoints(
    FontD font,
    MemoryPointer<RInt> codepoints,
    int length,
    double fontSize,
    double spacing,
  );

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(
    FontD font,
    int codepoint,
  );

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfoD GetGlyphInfo(
    FontD font,
    int codepoint,
  );

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  RectangleD GetGlyphAtlasRec(
    FontD font,
    int codepoint,
  );

  /// Load UTF-8 text encoded from codepoints array
  MemoryPointer<RChar> LoadUTF8(
    MemoryPointer<RInt> codepoints,
    int length,
  );

  /// Unload UTF-8 text encoded from codepoints array
  void UnloadUTF8(
    MemoryPointer<RChar> text,
  );

  /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  MemoryPointer<RInt> LoadCodepoints(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> count,
  );

  /// Unload codepoints data from memory
  void UnloadCodepoints(
    MemoryPointer<RInt> codepoints,
  );

  /// Get total number of codepoints in a UTF-8 encoded string
  int GetCodepointCount(
    MemoryPointer<RChar> text,
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepoint(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepointNext(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  );

  /// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepointPrevious(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  );

  /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  MemoryPointer<RChar> CodepointToUTF8(
    int codepoint,
    MemoryPointer<RInt> utf8Size,
  );

  /// Load text as separate lines ('\n')
  MemoryPointer<RPointer<RChar>> LoadTextLines(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> count,
  );

  /// Unload text lines
  void UnloadTextLines(
    MemoryPointer<RPointer<RChar>> text,
    int lineCount,
  );

  /// Copy one string to another, returns bytes copied
  int TextCopy(
    MemoryPointer<RChar> dst,
    MemoryPointer<RChar> src,
  );

  /// Check if two text string are equal
  bool TextIsEqual(
    MemoryPointer<RChar> text1,
    MemoryPointer<RChar> text2,
  );

  /// Get text length
  int TextLength(
    MemoryPointer<RChar> text,
  );

  /// Text formatting with variables (sprintf() style)
  @nonVirtual
  @Deprecated('va_list is not supported')
  MemoryPointer<RChar> TextFormat(
    MemoryPointer<RChar> text,
  ) => text;

  /// Get a piece of a text string
  MemoryPointer<RChar> TextSubtext(
    MemoryPointer<RChar> text,
    int position,
    int length,
  );

  /// Remove text spaces, concat words
  MemoryPointer<RChar> TextRemoveSpaces(
    MemoryPointer<RChar> text,
  );

  /// Get text between two strings
  MemoryPointer<RChar> GetTextBetween(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> begin,
    MemoryPointer<RChar> end,
  );

  /// Replace text string with new string
  MemoryPointer<RChar> TextReplace(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> replace,
    MemoryPointer<RChar> by,
  );

  /// Replace text string with new string, memory must be freed
  MemoryPointer<RChar> TextReplaceAlloc(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> replace,
    MemoryPointer<RChar> by,
  );

  /// Replace text between two specific strings
  MemoryPointer<RChar> TextReplaceBetween(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> begin,
    MemoryPointer<RChar> end,
    MemoryPointer<RChar> replacement,
  );

  /// Replace text between two specific strings, memory must be freed
  MemoryPointer<RChar> TextReplaceBetweenAlloc(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> begin,
    MemoryPointer<RChar> end,
    MemoryPointer<RChar> replacement,
  );

  /// Insert text in a defined byte position
  MemoryPointer<RChar> TextInsert(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> insert,
    int position,
  );

  /// Insert text in a defined byte position, memory must be freed
  MemoryPointer<RChar> TextInsertAlloc(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> insert,
    int position,
  );

  /// Join text strings with delimiter ([delimiter] is expected to be length of 1)
  MemoryPointer<RChar> TextJoin(
    MemoryPointer<RPointer<RChar>> textList,
    int count,
    MemoryPointer<RChar> delimiter,
  );

  /// Split text into multiple strings
  MemoryPointer<RPointer<RChar>> TextSplit(
    MemoryPointer<RChar> text,
    int delimiter,
    MemoryPointer<RInt> count,
  );

  /// Append text at specific position and move cursor
  void TextAppend(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> append,
    MemoryPointer<RInt> position,
  );

  /// Find first text occurrence within a string, -1 if not found
  int TextFindIndex(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> find,
  );

  /// Get upper case version of provided string
  MemoryPointer<RChar> TextToUpper(
    MemoryPointer<RChar> text,
  );

  /// Get lower case version of provided string
  MemoryPointer<RChar> TextToLower(
    MemoryPointer<RChar> text,
  );

  /// Get Pascal case notation version of provided string
  MemoryPointer<RChar> TextToPascal(
    MemoryPointer<RChar> text,
  );

  /// Get Snake case notation version of provided string
  MemoryPointer<RChar> TextToSnake(
    MemoryPointer<RChar> text,
  );

  /// Get Camel case notation version of provided string
  MemoryPointer<RChar> TextToCamel(
    MemoryPointer<RChar> text,
  );

  /// Get integer value from text
  int TextToInteger(
    MemoryPointer<RChar> text,
  );

  /// Get float value from text
  double TextToFloat(
    MemoryPointer<RChar> text,
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
    double radius,
    Vector3D rotationAxis,
    double rotationAngle,
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
    StructPointer<Vector3D> points,
    int pointCount,
    ColorD color,
  );

  /// Draw cube
  void DrawCube(
    Vector3D position,
    double width,
    double height,
    double length,
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
    double width,
    double height,
    double length,
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
    double radius,
    ColorD color,
  );

  /// Draw sphere with extended parameters
  void DrawSphereEx(
    Vector3D centerPos,
    double radius,
    int rings,
    int slices,
    ColorD color,
  );

  /// Draw sphere wires
  void DrawSphereWires(
    Vector3D centerPos,
    double radius,
    int rings,
    int slices,
    ColorD color,
  );

  /// Draw a cylinder/cone
  void DrawCylinder(
    Vector3D position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    ColorD color,
  );

  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    double startRadius,
    double endRadius,
    int sides,
    ColorD color,
  );

  /// Draw a cylinder/cone wires
  void DrawCylinderWires(
    Vector3D position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    ColorD color,
  );

  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    double startRadius,
    double endRadius,
    int sides,
    ColorD color,
  );

  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    double radius,
    int slices,
    int rings,
    ColorD color,
  );

  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    double radius,
    int slices,
    int rings,
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
    int slices,
    double spacing,
  );

  /// Load model from files (meshes and materials)
  ModelD LoadModel(
    MemoryPointer<RChar> fileName,
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
    double scale,
    ColorD tint,
  );

  /// Draw a model with extended parameters
  void DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    double rotationAngle,
    Vector3D scale,
    ColorD tint,
  );

  /// Draw a model wires (with texture if set)
  void DrawModelWires(
    ModelD model,
    Vector3D position,
    double scale,
    ColorD tint,
  );

  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    double rotationAngle,
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
    double scale,
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
    double rotation,
    ColorD tint,
  );

  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(
    StructPointer<MeshD> mesh,
    bool dynamic,
  );

  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(
    MeshD mesh,
    int index,
    MemoryPointer<RVoid> data,
    int dataSize,
    int offset,
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
    StructPointer<MatrixD> transforms,
    int instances,
  );

  /// Compute mesh bounding box limits
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  );

  /// Compute mesh tangents
  void GenMeshTangents(
    StructPointer<MeshD> mesh,
  );

  /// Export mesh data to file, returns true on success
  bool ExportMesh(
    MeshD mesh,
    MemoryPointer<RChar> fileName,
  );

  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(
    MeshD mesh,
    MemoryPointer<RChar> fileName,
  );

  /// Generate polygonal mesh
  MeshD GenMeshPoly(
    int sides,
    double radius,
  );

  /// Generate plane mesh (with subdivisions)
  MeshD GenMeshPlane(
    double width,
    double length,
    int resX,
    int resZ,
  );

  /// Generate cuboid mesh
  MeshD GenMeshCube(
    double width,
    double height,
    double length,
  );

  /// Generate sphere mesh (standard sphere)
  MeshD GenMeshSphere(
    double radius,
    int rings,
    int slices,
  );

  /// Generate half-sphere mesh (no bottom cap)
  MeshD GenMeshHemiSphere(
    double radius,
    int rings,
    int slices,
  );

  /// Generate cylinder mesh
  MeshD GenMeshCylinder(
    double radius,
    double height,
    int slices,
  );

  /// Generate cone/pyramid mesh
  MeshD GenMeshCone(
    double radius,
    double height,
    int slices,
  );

  /// Generate torus mesh
  MeshD GenMeshTorus(
    double radius,
    double size,
    int radSeg,
    int sides,
  );

  /// Generate trefoil knot mesh
  MeshD GenMeshKnot(
    double radius,
    double size,
    int radSeg,
    int sides,
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
  StructPointer<MaterialD> LoadMaterials(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> materialCount,
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
    StructPointer<MaterialD> material,
    int mapType,
    TextureD texture,
  );

  /// Set material for a mesh
  void SetModelMeshMaterial(
    StructPointer<ModelD> model,
    int meshId,
    int materialId,
  );

  /// Load model animations from file
  StructPointer<ModelAnimationD> LoadModelAnimations(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> animCount,
  );

  /// Update model animation pose (CPU)
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    double frame,
  );

  /// Update model animation data (vertex buffers / bone matrices) for a specific pose,
  /// defined by two different animations at specific frames blended together
  void UpdateModelAnimationEx(
    ModelD model,
    ModelAnimationD animA,
    double frameA,
    ModelAnimationD animB,
    double frameB,
    double blend,
  );

  /// Unload animation array data
  void UnloadModelAnimations(
    StructPointer<ModelAnimationD> animations,
    int animCount,
  );

  /// Check model animation skeleton match
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  );

  /// Check collision between two spheres
  bool CheckCollisionSpheres(
    Vector3D center1,
    double radius1,
    Vector3D center2,
    double radius2,
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
    double radius,
  );

  /// Get collision info between ray and sphere
  RayCollisionD GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    double radius,
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
