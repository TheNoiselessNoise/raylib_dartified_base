part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Core module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full Core API surface across different backends.
abstract class RaylibCoreModuleBase<
  R extends RaylibBase,

  // pointers
  UnsignedCharPointerType,

  // types
  AutomationEventListStructType extends AutomationEventListBase<
    AutomationEventListStructType,
    AutomationEventStructType
  >,
  AutomationEventStructType extends AutomationEventBase<AutomationEventStructType>,
  BoneInfoStructType extends BoneInfoBase<BoneInfoStructType>,
  BoundingBoxStructType extends BoundingBoxBase<
    BoundingBoxStructType,
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  Camera2DStructType extends Camera2DBase<
    Camera2DStructType,
    Vector2StructType,
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,
  Camera3DStructType extends Camera3DBase<
    Camera3DStructType,
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  ColorStructType extends ColorBase<ColorStructType>,
  FilePathListStructType extends FilePathListBase<FilePathListStructType>,
  FontStructType extends FontBase<
    FontStructType,
    TextureStructType,
    RectangleStructType,
    GlyphInfoStructType,
    ImageStructType
  >,
  GlyphInfoStructType extends GlyphInfoBase<
    GlyphInfoStructType,
    ImageStructType
  >,
  ImageStructType extends ImageBase<ImageStructType>,
  MaterialStructType extends MaterialBase<
    MaterialStructType,
    ShaderStructType,
    MaterialMapStructType,
    TextureStructType,
    ColorStructType
  >,
  MaterialMapStructType extends MaterialMapBase<
    MaterialMapStructType,
    TextureStructType,
    ColorStructType
  >,
  MatrixStructType extends MatrixBase<
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,
  MeshStructType extends MeshBase<
    MeshStructType,
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,
  ModelStructType extends ModelBase<
    ModelStructType,
    MeshStructType,
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType,
    MaterialStructType,
    ShaderStructType,
    MaterialMapStructType,
    TextureStructType,
    ColorStructType,
    TransformStructType,
    BoneInfoStructType
  >,
  ModelAnimationStructType extends ModelAnimationBase<
    ModelAnimationStructType,
    BoneInfoStructType,
    TransformStructType,
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  NPatchInfoStructType extends NPatchInfoBase<
    NPatchInfoStructType,
    RectangleStructType
  >,
  QuaternionStructType extends QuaternionBase<
    QuaternionStructType,
    MatrixStructType,
    Vector3StructType,
    Vector4StructType
  >,
  RayStructType extends RayBase<
    RayStructType,
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  RayCollisionStructType extends RayCollisionBase<
    RayCollisionStructType,
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  RectangleStructType extends RectangleBase<RectangleStructType>,
  RenderTextureStructType extends RenderTextureBase<
    RenderTextureStructType,
    TextureStructType
  >,
  ShaderStructType extends ShaderBase<ShaderStructType>,
  TextureStructType extends TextureBase<TextureStructType>,
  TransformStructType extends TransformBase<
    TransformStructType,
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  Vector2StructType extends Vector2Base<
    Vector2StructType,
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,
  Vector3StructType extends Vector3Base<
    Vector3StructType,
    MatrixStructType,
    QuaternionStructType,
    Vector4StructType
  >,
  Vector4StructType extends Vector4Base<
    Vector4StructType,
    QuaternionStructType,
    MatrixStructType,
    Vector3StructType
  >,
  VrDeviceInfoStructType extends VrDeviceInfoBase<VrDeviceInfoStructType>,
  VrStereoConfigStructType extends VrStereoConfigBase<
    VrStereoConfigStructType,
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,

  // callbacks
  LoadFileDataCallbackType extends LoadFileDataCallbackBase,
  SaveFileDataCallbackType extends SaveFileDataCallbackBase,
  LoadFileTextCallbackType extends LoadFileTextCallbackBase,
  SaveFileTextCallbackType extends SaveFileTextCallbackBase
  
> extends RaylibModule<R> {

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibCoreModuleDebugLabels();

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = RaylibCoreModuleCaptureIds();

  RaylibCoreModuleBase(super.rl);

  // //////////// //
  // CUSTOM STUFF //
  // //////////// //

  MouseButtonInfo GetMouseButtonInfo(MouseButton button) => .new(
    up: IsMouseButtonUp(button),
    down: IsMouseButtonDown(button),
    pressed: IsMouseButtonPressed(button),
    released: IsMouseButtonReleased(button),
  );

  MouseInfo<Vector2StructType> GetMouseInfo() => .new(
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
    ImageStructType image,
  );

  /// Set icon for window (multiple images, RGBA 32bit)
  void SetWindowIcons(
    List<ImageStructType> images,
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
  Vector2StructType GetMonitorPosition(
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
  Vector2StructType GetWindowPosition();

  /// Get window scale DPI factor
  Vector2StructType GetWindowScaleDPI();

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
  ImageStructType GetClipboardImage();

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
    ColorStructType color,
  );

  /// Setup canvas (framebuffer) to start drawing
  void BeginDrawing();

  /// End canvas drawing and swap buffers (double buffering)
  void EndDrawing();

  /// Begin 2D mode with custom camera (2D)
  void BeginMode2D(
    Camera2DStructType camera,
  );

  /// Ends 2D mode with custom camera
  void EndMode2D();

  /// Begin 3D mode with custom camera (3D)
  void BeginMode3D(
    Camera3DStructType camera,
  );

  /// Ends 3D mode and returns to default 2D orthographic mode
  void EndMode3D();

  /// Begin drawing to render texture
  void BeginTextureMode(
    RenderTextureStructType target,
  );

  /// Ends drawing to render texture
  void EndTextureMode();

  /// Begin custom shader drawing
  void BeginShaderMode(
    ShaderStructType shader,
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
    VrStereoConfigStructType config,
  );

  /// End stereo rendering (requires VR simulator)
  void EndVrStereoMode();

  /// Load VR stereo config for VR simulator device parameters
  VrStereoConfigStructType LoadVrStereoConfig(
    VrDeviceInfoStructType device,
  );

  /// Unload VR stereo config
  void UnloadVrStereoConfig(
    VrStereoConfigStructType config,
  );

  /// Load shader from files and bind default locations
  ShaderStructType LoadShader(
    String? vsFileName,
    String? fsFileName,
  );

  /// Load shader from code strings and bind default locations
  ShaderStructType LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  );

  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(
    ShaderStructType shader,
  );

  /// Get shader uniform location
  int GetShaderLocation(
    ShaderStructType shader,
    String uniformName,
  );

  /// Get shader attribute location
  int GetShaderLocationAttrib(
    ShaderStructType shader,
    String attribName,
  );
  
  /// Set shader uniform value
  void SetShaderValue(
    ShaderStructType shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
  );

  /// Set shader uniform value vector
  void SetShaderValueV(
    ShaderStructType shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  );

  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(
    ShaderStructType shader,
    num locIndex,
    MatrixStructType mat,
  );

  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(
    ShaderStructType shader,
    num locIndex,
    TextureStructType texture,
  );

  /// Unload shader from GPU memory (VRAM)
  void UnloadShader(
    ShaderStructType shader,
  );

  /// Get a ray trace from screen position (i.e mouse)
  RayStructType GetScreenToWorldRay(
    Vector2StructType position,
    Camera3DStructType camera,
  );

  /// Get a ray trace from screen position (i.e mouse) in a viewport
  RayStructType GetScreenToWorldRayEx(
    Vector2StructType position,
    Camera3DStructType camera,
    num width,
    num height,
  );

  /// Get the screen space position for a 3d world space position
  Vector2StructType GetWorldToScreen(
    Vector3StructType position,
    Camera3DStructType camera,
  );

  /// Get size position for a 3d world space position
  Vector2StructType GetWorldToScreenEx(
    Vector3StructType position,
    Camera3DStructType camera,
    num width,
    num height,
  );

  /// Get the screen space position for a 2d camera world space position
  Vector2StructType GetWorldToScreen2D(
    Vector2StructType position,
    Camera2DStructType camera,
  );

  /// Get the world space position for a 2d camera screen space position
  Vector2StructType GetScreenToWorld2D(
    Vector2StructType position,
    Camera2DStructType camera,
  );

  /// Get camera transform matrix (view matrix)
  MatrixStructType GetCameraMatrix(
    Camera3DStructType camera,
  );

  /// Get camera 2d transform matrix
  MatrixStructType GetCameraMatrix2D(
    Camera2DStructType camera,
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
  
  /// Load random values sequence, no values repeated
  List<int> LoadRandomSequence(
    int count,
    int min,
    int max,
    [int? seed]
  ) => run(
    () => RaylibDebugLabels.LoadRandomSequence(count, min, max, seed),
    () {
      final List<int> pool = .generate(max - min + 1, (i) => min + i);
      pool.shuffle(math.Random(seed));
      return pool.take(count).toList();
    },
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
    String text,
  );

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  );

  /// Set custom file binary data loader
  void SetLoadFileDataCallback(
    LoadFileDataCallbackType? callback
  );

  /// Set custom file binary data saver
  void SetSaveFileDataCallback(
    SaveFileDataCallbackType? callback
  );

  /// Set custom file text data loader
  void SetLoadFileTextCallback(
    LoadFileTextCallbackType? callback
  );

  /// Set custom file text data saver
  void SetSaveFileTextCallback(
    SaveFileTextCallbackType? callback
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
  FilePathListStructType LoadDirectoryFiles(
    String dirPath,
  );

  /// Load directory filepaths with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result
  FilePathListStructType LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  );

  /// Unload filepaths
  void UnloadDirectoryFiles(
    FilePathListStructType files,
  );

  /// Check if a file has been dropped into window
  bool IsFileDropped();

  /// Load dropped filepaths
  FilePathListStructType LoadDroppedFiles();

  /// Unload dropped filepaths
  void UnloadDroppedFiles(
    FilePathListStructType files,
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

  /// Load automation events list from file, NULL for empty list
  AutomationEventListStructType LoadAutomationEventList(
    String? fileName,
  );

  /// Unload automation events list from file
  void UnloadAutomationEventList(
    AutomationEventListStructType list,
  );

  /// Export automation events list as text file
  bool ExportAutomationEventList(
    AutomationEventListStructType list,
    String fileName,
  );

  /// Set automation event list to record to
  void SetAutomationEventList(
    AutomationEventListStructType list,
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
    AutomationEventStructType event,
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
  Vector2StructType GetMousePosition();

  /// Get mouse delta between frames
  Vector2StructType GetMouseDelta();

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
  Vector2StructType GetMouseWheelMoveV();

  /// Set mouse cursor
  void SetMouseCursor(
    MouseCursor cursor,
  );

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX();

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY();

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2StructType GetTouchPosition(
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
  Vector2StructType GetGestureDragVector();

  /// Get gesture drag angle
  double GetGestureDragAngle();

  /// Get gesture pinch delta
  Vector2StructType GetGesturePinchVector();

  /// Get gesture pinch angle
  double GetGesturePinchAngle();

  /// Update camera position for selected mode
  void UpdateCamera(
    Camera3DStructType camera,
    CameraMode mode,
  );

  /// Update camera movement/rotation
  void UpdateCameraPro(
    Camera3DStructType camera,
    Vector3StructType movement,
    Vector3StructType rotation,
    num zoom,
  );

  /// Set texture and rectangle to be used on shapes drawing
  void SetShapesTexture(
    TextureStructType texture,
    RectangleStructType source,
  );

  /// Get texture that is used for shapes drawing
  TextureStructType GetShapesTexture();

  /// Get texture source rectangle that is used for shapes drawing
  RectangleStructType GetShapesTextureRectangle();

  /// Draw a pixel using geometry [Can be slow, use with care]
  void DrawPixel(
    num posX,
    num posY,
    ColorStructType color,
  );

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(
    Vector2StructType position,
    ColorStructType color,
  );

  /// Draw a line
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorStructType color,
  );

  /// Draw a line (using gl lines)
  void DrawLineV(
    Vector2StructType startPos,
    Vector2StructType endPos,
    ColorStructType color,
  );

  /// Draw a line (using triangles/quads)
  void DrawLineEx(
    Vector2StructType startPos,
    Vector2StructType endPos,
    num thick,
    ColorStructType color,
  );

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(
    List<Vector2StructType> points,
    ColorStructType color,
  );

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(
    Vector2StructType startPos,
    Vector2StructType endPos,
    num thick,
    ColorStructType color,
  );

  /// Draw a color-filled circle
  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorStructType color,
  );

  /// Draw a piece of a circle
  void DrawCircleSector(
    Vector2StructType center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorStructType color,
  );

  /// Draw circle sector outline
  void DrawCircleSectorLines(
    Vector2StructType center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorStructType color,
  );

  /// Draw a gradient-filled circle
  void DrawCircleGradient(
    num centerX,
    num centerY,
    num radius,
    ColorStructType inner,
    ColorStructType outer,
  );

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(
    Vector2StructType center,
    num radius,
    ColorStructType color,
  );

  /// Draw circle outline
  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorStructType color,
  );

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(
    Vector2StructType center,
    num radius,
    ColorStructType color,
  );

  /// Draw ellipse
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorStructType color,
  );

  /// Draw ellipse outline
  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorStructType color,
  );

  /// Draw ring
  void DrawRing(
    Vector2StructType center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorStructType color,
  );

  /// Draw ring outline
  void DrawRingLines(
    Vector2StructType center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorStructType color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType color,
  );

  /// Draw a color-filled rectangle (Vector version)
  void DrawRectangleV(
    Vector2StructType position,
    Vector2StructType size,
    ColorStructType color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangleRec(
    RectangleStructType rec,
    ColorStructType color,
  );

  /// Draw a color-filled rectangle with pro parameters
  void DrawRectanglePro(
    RectangleStructType rec,
    Vector2StructType origin,
    num rotation,
    ColorStructType color,
  );

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType top,
    ColorStructType bottom,
  );

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType left,
    ColorStructType right,
  );

  /// Draw a gradient-filled rectangle with custom vertex colors
  void DrawRectangleGradientEx(
    RectangleStructType rec,
    ColorStructType topLeft,
    ColorStructType bottomLeft,
    ColorStructType topRight,
    ColorStructType bottomRight,
  );

  /// Draw rectangle outline
  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType color,
  );

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(
    RectangleStructType rec,
    num lineThick,
    ColorStructType color,
  );

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(
    RectangleStructType rec,
    num roundness,
    num segments,
    ColorStructType color,
  );

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(
    RectangleStructType rec,
    num roundness,
    num segments,
    ColorStructType color,
  );

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(
    RectangleStructType rec,
    num roundness,
    num segments,
    num lineThick,
    ColorStructType color,
  );

  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle(
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType color,
  );

  /// Draw triangle outline (vertex in counter-clockwise order!)
  void DrawTriangleLines(
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType color,
  );

  /// Draw a triangle fan defined by points (first vertex is the center)
  void DrawTriangleFan(
    List<Vector2StructType> points,
    ColorStructType color,
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(
    List<Vector2StructType> points,
    ColorStructType color,
  );

  /// Draw a regular polygon (Vector version)
  void DrawPoly(
    Vector2StructType center,
    num sides,
    num radius,
    num rotation,
    ColorStructType color,
  );

  /// Draw a polygon outline of n sides
  void DrawPolyLines(
    Vector2StructType center,
    num sides,
    num radius,
    num rotation,
    ColorStructType color,
  );

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(
    Vector2StructType center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorStructType color,
  );

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(
    List<Vector2StructType> points,
    num thick,
    ColorStructType color,
  );

  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(
    Vector2StructType p1,
    Vector2StructType p2,
    num thick,
    ColorStructType color,
  );

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
    Vector2StructType p4,
    num thick,
    ColorStructType color,
  );

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
    Vector2StructType p4,
    num thick,
    ColorStructType color,
  );

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(
    Vector2StructType p1,
    Vector2StructType c2,
    Vector2StructType p3,
    num thick,
    ColorStructType color,
  );

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(
    Vector2StructType p1,
    Vector2StructType c2,
    Vector2StructType c3,
    Vector2StructType p4,
    num thick,
    ColorStructType color,
  );

  /// Get (evaluate) spline point: Linear
  Vector2StructType GetSplinePointLinear(
    Vector2StructType startPos,
    Vector2StructType endPos,
    num t,
  );

  /// Get (evaluate) spline point: B-Spline
  Vector2StructType GetSplinePointBasis(
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
    Vector2StructType p4,
    num t,
  );

  /// Get (evaluate) spline point: Catmull-Rom
  Vector2StructType GetSplinePointCatmullRom(
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
    Vector2StructType p4,
    num t,
  );

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2StructType GetSplinePointBezierQuad(
    Vector2StructType p1,
    Vector2StructType c2,
    Vector2StructType p3,
    num t,
  );

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2StructType GetSplinePointBezierCubic(
    Vector2StructType p1,
    Vector2StructType c2,
    Vector2StructType c3,
    Vector2StructType p4,
    num t,
  );

  /// Check collision between two rectangles
  bool CheckCollisionRecs(
    RectangleStructType rec1,
    RectangleStructType rec2,
  );

  /// Check collision between two circles
  bool CheckCollisionCircles(
    Vector2StructType center1,
    num radius1,
    Vector2StructType center2,
    num radius2,
  );

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(
    Vector2StructType center,
    num radius,
    RectangleStructType rec,
  );

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(
    Vector2StructType center,
    num radius,
    Vector2StructType p1,
    Vector2StructType p2,
  );

  /// Check if point is inside rectangle
  bool CheckCollisionPointRec(
    Vector2StructType point,
    RectangleStructType rec,
  );

  /// Check if point is inside circle
  bool CheckCollisionPointCircle(
    Vector2StructType point,
    Vector2StructType center,
    num radius,
  );

  /// Check if point is inside a triangle
  bool CheckCollisionPointTriangle(
    Vector2StructType point,
    Vector2StructType p1,
    Vector2StructType p2,
    Vector2StructType p3,
  );

  /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  bool CheckCollisionPointLine(
    Vector2StructType point,
    Vector2StructType p1,
    Vector2StructType p2,
    num threshold,
  );

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(
    Vector2StructType point,
    List<Vector2StructType> points,
  );

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  (bool result, Vector2StructType collisionPoint) CheckCollisionLines(
    Vector2StructType startPos1,
    Vector2StructType endPos1,
    Vector2StructType startPos2,
    Vector2StructType endPos2,
  );

  /// Get collision rectangle for two rectangles collision
  RectangleStructType GetCollisionRec(
    RectangleStructType rec1,
    RectangleStructType rec2,
  );

  /// Load image from file into CPU memory (RAM)
  ImageStructType LoadImage(
    String fileName,
  );

  /// Load image from RAW file data
  ImageStructType LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  );

  /// Load image sequence from file (frames appended to image.data)
  ImageStructType LoadImageAnim(
    String fileName,
  );

  /// Load image sequence from memory buffer
  ImageStructType LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  );

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  ImageStructType LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  );

  /// Load image from GPU texture data
  ImageStructType LoadImageFromTexture(
    TextureStructType texture,
  );

  /// Load image from screen buffer and (screenshot)
  ImageStructType LoadImageFromScreen();

  /// Check if an image is valid (data and parameters)
  bool IsImageValid(
    ImageStructType image,
  );

  /// Unload image from CPU memory (RAM)
  void UnloadImage(
    ImageStructType image,
  );

  /// Export image data to file, returns true on success
  bool ExportImage(
    ImageStructType image,
    String fileName,
  );

  /// Export image to memory buffer
  (UnsignedCharPointerType dataPtr, int dataSize) ExportImageToMemory(
    ImageStructType image,
    String fileType,
  );

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(
    ImageStructType image,
    String fileName,
  );

  /// Generate image: plain color
  ImageStructType GenImageColor(
    num width,
    num height,
    ColorStructType color,
  );

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  ImageStructType GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorStructType start,
    ColorStructType end,
  );

  /// Generate image: radial gradient
  ImageStructType GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorStructType inner,
    ColorStructType outer,
  );

  /// Generate image: square gradient
  ImageStructType GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorStructType inner,
    ColorStructType outer,
  );

  /// Generate image: checked
  ImageStructType GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorStructType col1,
    ColorStructType col2,
  );

  /// Generate image: white noise
  ImageStructType GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  );

  /// Generate image: perlin noise
  ImageStructType GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  );

  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  ImageStructType GenImageCellular(
    num width,
    num height,
    num tileSize,
  );

  /// Generate image: grayscale image from text data
  ImageStructType GenImageText(
    num width,
    num height,
    String text,
  );

  /// Create an image duplicate (useful for transformations)
  ImageStructType ImageCopy(
    ImageStructType image,
  );

  /// Create an image from another image piece
  ImageStructType ImageFromImage(
    ImageStructType image,
    RectangleStructType rec,
  );

  /// Create an image from a selected channel of another image (GRAYSCALE)
  ImageStructType ImageFromChannel(
    ImageStructType image,
    num selectedChannel,
  );

  /// Create an image from text (default font)
  ImageStructType ImageText(
    String text,
    num fontSize,
    ColorStructType color,
  );

  /// Create an image from text (custom sprite font)
  ImageStructType ImageTextEx(
    FontStructType font,
    String text,
    num fontSize,
    num spacing,
    ColorStructType tint,
  );

  /// Convert image data to desired format
  void ImageFormat(
    ImageStructType image,
    PixelFormat newFormat,
  );

  /// Convert image to POT (power-of-two)
  void ImageToPOT(
    ImageStructType image,
    ColorStructType fill,
  );

  /// Crop an image to a defined rectangle
  void ImageCrop(
    ImageStructType image,
    RectangleStructType crop,
  );

  /// Crop image depending on alpha value
  void ImageAlphaCrop(
    ImageStructType image,
    num threshold,
  );

  /// Clear alpha channel to desired color
  void ImageAlphaClear(
    ImageStructType image,
    ColorStructType color,
    num threshold,
  );

  /// Apply alpha mask to image
  void ImageAlphaMask(
    ImageStructType image,
    ImageStructType alphaMask,
  );

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(
    ImageStructType image,
  );

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(
    ImageStructType image,
    num blurSize,
  );

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(
    ImageStructType image,
    List<double> kernel,
  );

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(
    ImageStructType image,
    num newWidth,
    num newHeight,
  );

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(
    ImageStructType image,
    num newWidth,
    num newHeight,
  );

  /// Resize canvas and fill with color
  void ImageResizeCanvas(
    ImageStructType image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorStructType fill,
  );

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(
    ImageStructType image,
  );

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(
    ImageStructType image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  );

  /// Flip image vertically
  void ImageFlipVertical(
    ImageStructType image,
  );

  /// Flip image horizontally
  void ImageFlipHorizontal(
    ImageStructType image,
  );

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(
    ImageStructType image,
    num degrees,
  );

  /// Rotate image clockwise 90deg
  void ImageRotateCW(
    ImageStructType image,
  );

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(
    ImageStructType image,
  );

  /// Modify image color: tint
  void ImageColorTint(
    ImageStructType image,
    ColorStructType color,
  );

  /// Modify image color: invert
  void ImageColorInvert(
    ImageStructType image,
  );

  /// Modify image color: grayscale
  void ImageColorGrayscale(
    ImageStructType image,
  );

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(
    ImageStructType image,
    num contrast,
  );

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(
    ImageStructType image,
    num brightness,
  );

  /// Modify image color: replace color
  void ImageColorReplace(
    ImageStructType image,
    ColorStructType color,
    ColorStructType replace,
  );

  /// Load color data from image as a Color array (RGBA - 32bit)
  List<ColorStructType> LoadImageColors(
    ImageStructType image,
  );

  /// Load colors palette from image as a Color array (RGBA - 32bit)
  List<ColorStructType> LoadImagePalette(
    ImageStructType image,
    num maxPaletteSize,
  );

  /// Get image alpha border rectangle
  RectangleStructType GetImageAlphaBorder(
    ImageStructType image,
    num threshold,
  );

  /// Get image pixel color at (x, y) position
  ColorStructType GetImageColor(
    ImageStructType image,
    num x,
    num y,
  );

  /// Clear image background with given color
  void ImageClearBackground(
    ImageStructType dst,
    ColorStructType color,
  );

  /// Draw pixel within an image
  void ImageDrawPixel(
    ImageStructType dst,
    num posX,
    num posY,
    ColorStructType color,
  );

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(
    ImageStructType dst,
    Vector2StructType position,
    ColorStructType color,
  );

  /// Draw line within an image
  void ImageDrawLine(
    ImageStructType dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorStructType color,
  );

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(
    ImageStructType dst,
    Vector2StructType start,
    Vector2StructType end,
    ColorStructType color,
  );

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(
    ImageStructType dst,
    Vector2StructType start,
    Vector2StructType end,
    num thick,
    ColorStructType color,
  );

  /// Draw a filled circle within an image
  void ImageDrawCircle(
    ImageStructType dst,
    num centerX,
    num centerY,
    num radius,
    ColorStructType color,
  );

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(
    ImageStructType dst,
    Vector2StructType center,
    num radius,
    ColorStructType color,
  );

  /// Draw circle outline within an image
  void ImageDrawCircleLines(
    ImageStructType dst,
    num centerX,
    num centerY,
    num radius,
    ColorStructType color,
  );

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(
    ImageStructType dst,
    Vector2StructType center,
    num radius,
    ColorStructType color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangle(
    ImageStructType dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorStructType color,
  );

  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(
    ImageStructType dst,
    Vector2StructType position,
    Vector2StructType size,
    ColorStructType color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(
    ImageStructType dst,
    RectangleStructType rec,
    ColorStructType color,
  );

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(
    ImageStructType dst,
    RectangleStructType rec,
    num thick,
    ColorStructType color,
  );

  /// Draw triangle within an image
  void ImageDrawTriangle(
    ImageStructType dst,
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType color,
  );

  /// Draw triangle with interpolated colors within an image
  void ImageDrawTriangleEx(
    ImageStructType dst,
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType c1,
    ColorStructType c2,
    ColorStructType c3,
  );

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(
    ImageStructType dst,
    Vector2StructType v1,
    Vector2StructType v2,
    Vector2StructType v3,
    ColorStructType color,
  );

  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(
    ImageStructType dst,
    List<Vector2StructType> points,
    ColorStructType color,
  );

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(
    ImageStructType dst,
    List<Vector2StructType> points,
    ColorStructType color,
  );

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(
    ImageStructType dst,
    ImageStructType src,
    RectangleStructType srcRec,
    RectangleStructType dstRec,
    ColorStructType tint,
  );

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(
    ImageStructType dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorStructType color,
  );

  /// Draw text (custom sprite font) within an image (destination)
  void ImageDrawTextEx(
    ImageStructType dst,
    FontStructType font,
    String text,
    Vector2StructType position,
    num fontSize,
    num spacing,
    ColorStructType tint,
  );

  /// Load texture from file into GPU memory (VRAM)
  TextureStructType LoadTexture(
    String fileName,
  );

  /// Load texture from image data
  TextureStructType LoadTextureFromImage(
    ImageStructType image,
  );

  /// Load cubemap from image, multiple image cubemap layouts supported
  TextureStructType LoadTextureCubemap(
    ImageStructType image,
    CubemapLayout layout,
  );

  /// Load texture for rendering (framebuffer)
  RenderTextureStructType LoadRenderTexture(
    num width,
    num height,
  );

  /// Check if a texture is valid (loaded in GPU)
  bool IsTextureValid(
    TextureStructType texture,
  );

  /// Unload texture from GPU memory (VRAM)
  void UnloadTexture(
    TextureStructType texture,
  );

  /// Check if a render texture is valid (loaded in GPU)
  bool IsRenderTextureValid(
    RenderTextureStructType target,
  );

  /// Unload render texture from GPU memory (VRAM)
  void UnloadRenderTexture(
    RenderTextureStructType target,
  );

  /// Update GPU texture with new data
  void UpdateTexture(
    TextureStructType texture,
    Uint8List pixels,
  );

  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(
    TextureStructType texture,
    RectangleStructType rec,
    Uint8List pixels,
  );

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(
    TextureStructType texture,
  );

  /// Set texture scaling filter mode
  void SetTextureFilter(
    TextureStructType texture,
    TextureFilter filter,
  );

  /// Set texture wrapping mode
  void SetTextureWrap(
    TextureStructType texture,
    TextureWrap wrap,
  );

  /// Draw a Texture2D
  void DrawTexture(
    TextureStructType texture,
    num posX,
    num posY,
    ColorStructType tint,
  );

  /// Draw a Texture2D with position defined as Vector2
  void DrawTextureV(
    TextureStructType texture,
    Vector2StructType position,
    ColorStructType tint,
  );

  /// Draw a Texture2D with extended parameters
  void DrawTextureEx(
    TextureStructType texture,
    Vector2StructType position,
    num rotation,
    num scale,
    ColorStructType tint,
  );

  /// Draw a part of a texture defined by a rectangle
  void DrawTextureRec(
    TextureStructType texture,
    RectangleStructType source,
    Vector2StructType position,
    ColorStructType tint,
  );

  /// Draw a part of a texture defined by a rectangle with 'pro' parameters
  void DrawTexturePro(
    TextureStructType texture,
    RectangleStructType source,
    RectangleStructType dest,
    Vector2StructType origin,
    num rotation,
    ColorStructType tint,
  );

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(
    TextureStructType texture,
    NPatchInfoStructType nPatchInfo,
    RectangleStructType dest,
    Vector2StructType origin,
    num rotation,
    ColorStructType tint,
  );

  /// Check if two colors are equal
  bool ColorIsEqual(
    ColorStructType col1,
    ColorStructType col2,
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorStructType Fade(
    ColorStructType color,
    num alpha,
  );

  /// Get hexadecimal value for a Color (0xRRGGBBAA)
  int ColorToInt(
    ColorStructType color,
  );

  /// Get Color normalized as float [0..1]
  Vector4StructType ColorNormalize(
    ColorStructType color,
  );

  /// Get Color from normalized values [0..1]
  ColorStructType ColorFromNormalized(
    Vector4StructType normalized,
  );

  /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  Vector3StructType ColorToHSV(
    ColorStructType color,
  );

  /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  ColorStructType ColorFromHSV(
    num hue,
    num saturation,
    num value,
  );

  /// Get color multiplied with another color
  ColorStructType ColorTint(
    ColorStructType color,
    ColorStructType tint,
  );

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  ColorStructType ColorBrightness(
    ColorStructType color,
    num factor,
  );

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  ColorStructType ColorContrast(
    ColorStructType color,
    num contrast,
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorStructType ColorAlpha(
    ColorStructType color,
    num alpha,
  );

  /// Get src alpha-blended into dst color with tint
  ColorStructType ColorAlphaBlend(
    ColorStructType dst,
    ColorStructType src,
    ColorStructType tint,
  );

  /// Get color lerp interpolation between two colors, factor [0.0..1.0]
  ColorStructType ColorLerp(
    ColorStructType color1,
    ColorStructType color2,
    num factor,
  );

  /// Get Color structure from hexadecimal value
  ColorStructType GetColor(
    num hexValue,
  );

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  );

  /// Get the default Font
  FontStructType GetFontDefault();

  /// Load font from file into GPU memory (VRAM)
  FontStructType LoadFont(
    String fileName,
  );

  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  FontStructType LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codePointCount
    ]
  );

  /// Load font from Image (XNA style)
  FontStructType LoadFontFromImage(
    ImageStructType image,
    ColorStructType key,
    num firstChar,
  );

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  FontStructType LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  );

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(
    FontStructType font,
  );

  /// Load font data for further use
  List<GlyphInfoStructType> LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  );

  /// Generate image font atlas using chars info
  (ImageStructType image, List<RectangleStructType> glyphRecs) GenImageFontAtlas(
    List<GlyphInfoStructType> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  );

  /// Unload font chars info data (RAM)
  void UnloadFontData(
    List<GlyphInfoStructType> glyphs,
  );

  /// Unload font from GPU memory (VRAM)
  void UnloadFont(
    FontStructType font,
  );

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(
    FontStructType font,
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
    ColorStructType color,
  );

  /// Draw text using font and additional parameters
  void DrawTextEx(
    FontStructType font,
    String text,
    Vector2StructType position,
    num fontSize,
    num spacing,
    ColorStructType tint,
  );

  /// Draw text using Font and pro parameters (rotation)
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

  /// Draw one character (codepoint)
  void DrawTextCodepoint(
    FontStructType font,
    num codepoint,
    Vector2StructType position,
    num fontSize,
    ColorStructType tint,
  );

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(
    FontStructType font,
    Int32List codepoints,
    Vector2StructType position,
    num fontSize,
    num spacing,
    ColorStructType tint,
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
  Vector2StructType MeasureTextEx(
    FontStructType font,
    String text,
    num fontSize,
    num spacing,
  );

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(
    FontStructType font,
    num codepoint,
  );

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfoStructType GetGlyphInfo(
    FontStructType font,
    num codepoint,
  );

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  RectangleStructType GetGlyphAtlasRec(
    FontStructType font,
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

  /// Draw a line in 3D world space
  void DrawLine3D(
    Vector3StructType startPos,
    Vector3StructType endPos,
    ColorStructType color,
  );

  /// Draw a point in 3D space, actually a small line
  void DrawPoint3D(
    Vector3StructType position,
    ColorStructType color,
  );

  /// Draw a circle in 3D world space
  void DrawCircle3D(
    Vector3StructType center,
    num radius,
    Vector3StructType rotationAxis,
    num rotationAngle,
    ColorStructType color,
  );

  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle3D(
    Vector3StructType v1,
    Vector3StructType v2,
    Vector3StructType v3,
    ColorStructType color,
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip3D(
    List<Vector3StructType> points,
    ColorStructType color,
  );

  /// Draw cube
  void DrawCube(
    Vector3StructType position,
    num width,
    num height,
    num length,
    ColorStructType color,
  );

  /// Draw cube (Vector version)
  void DrawCubeV(
    Vector3StructType position,
    Vector3StructType size,
    ColorStructType color,
  );

  /// Draw cube wires
  void DrawCubeWires(
    Vector3StructType position,
    num width,
    num height,
    num length,
    ColorStructType color,
  );

  /// Draw cube wires (Vector version)
  void DrawCubeWiresV(
    Vector3StructType position,
    Vector3StructType size,
    ColorStructType color,
  );

  /// Draw sphere
  void DrawSphere(
    Vector3StructType centerPos,
    num radius,
    ColorStructType color,
  );

  /// Draw sphere with extended parameters
  void DrawSphereEx(
    Vector3StructType centerPos,
    num radius,
    num rings,
    num slices,
    ColorStructType color,
  );

  /// Draw sphere wires
  void DrawSphereWires(
    Vector3StructType centerPos,
    num radius,
    num rings,
    num slices,
    ColorStructType color,
  );

  /// Draw a cylinder/cone
  void DrawCylinder(
    Vector3StructType position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorStructType color,
  );

  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(
    Vector3StructType startPos,
    Vector3StructType endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorStructType color,
  );

  /// Draw a cylinder/cone wires
  void DrawCylinderWires(
    Vector3StructType position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorStructType color,
  );

  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(
    Vector3StructType startPos,
    Vector3StructType endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorStructType color,
  );

  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(
    Vector3StructType startPos,
    Vector3StructType endPos,
    num radius,
    num slices,
    num rings,
    ColorStructType color,
  );

  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(
    Vector3StructType startPos,
    Vector3StructType endPos,
    num radius,
    num slices,
    num rings,
    ColorStructType color,
  );

  /// Draw a plane XZ
  void DrawPlane(
    Vector3StructType centerPos,
    Vector2StructType size,
    ColorStructType color,
  );

  /// Draw a ray line
  void DrawRay(
    RayStructType ray,
    ColorStructType color,
  );

  /// Draw a grid (centered at (0, 0, 0))
  void DrawGrid(
    num slices,
    num spacing,
  );

  /// Load model from files (meshes and materials)
  ModelStructType LoadModel(
    String fileName,
  );

  /// Load model from generated mesh (default material)
  ModelStructType LoadModelFromMesh(
    MeshStructType mesh,
  );

  /// Check if a model is valid (loaded in GPU, VAO/VBOs)
  bool IsModelValid(
    ModelStructType model,
  );

  /// Unload model (including meshes) from memory (RAM and/or VRAM)
  void UnloadModel(
    ModelStructType model,
  );

  /// Compute model bounding box limits (considers all meshes)
  BoundingBoxStructType GetModelBoundingBox(
    ModelStructType model,
  );

  /// Draw a model (with texture if set)
  void DrawModel(
    ModelStructType model,
    Vector3StructType position,
    num scale,
    ColorStructType tint
  );

  /// Draw a model with extended parameters
  void DrawModelEx(
    ModelStructType model,
    Vector3StructType position,
    Vector3StructType rotationAxis,
    num rotationAngle,
    Vector3StructType scale,
    ColorStructType tint,
  );

  /// Draw a model wires (with texture if set)
  void DrawModelWires(
    ModelStructType model,
    Vector3StructType position,
    num scale,
    ColorStructType tint,
  );

  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(
    ModelStructType model,
    Vector3StructType position,
    Vector3StructType rotationAxis,
    num rotationAngle,
    Vector3StructType scale,
    ColorStructType tint,
  );

  /// Draw a model as points
  void DrawModelPoints(
    ModelStructType model,
    Vector3StructType position,
    num scale,
    ColorStructType tint,
  );

  /// Draw a model as points with extended parameters
  void DrawModelPointsEx(
    ModelStructType model,
    Vector3StructType position,
    Vector3StructType rotationAxis,
    num rotationAngle,
    Vector3StructType scale,
    ColorStructType tint,
  );

  /// Draw bounding box (wires)
  void DrawBoundingBox(
    BoundingBoxStructType box,
    ColorStructType color,
  );

  /// Draw a billboard texture
  void DrawBillboard(
    Camera3DStructType camera,
    TextureStructType texture,
    Vector3StructType position,
    num scale,
    ColorStructType tint,
  );

  /// Draw a billboard texture defined by source
  void DrawBillboardRec(
    Camera3DStructType camera,
    TextureStructType texture,
    RectangleStructType source,
    Vector3StructType position,
    Vector2StructType size,
    ColorStructType tint,
  );

  /// Draw a billboard texture defined by source and rotation
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
  
  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(
    MeshStructType mesh,
    bool dynamic,
  );

  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(
    MeshStructType mesh,
    num index,
    TypedDataList data,
    num offset,
  );

  /// Unload mesh data from CPU and GPU
  void UnloadMesh(
    MeshStructType mesh,
  );

  /// Draw a 3d mesh with material and transform
  void DrawMesh(
    MeshStructType mesh,
    MaterialStructType material,
    MatrixStructType transform,
  );

  /// Draw multiple mesh instances with material and different transforms
  void DrawMeshInstanced(
    MeshStructType mesh,
    MaterialStructType material,
    List<MatrixStructType> transforms,
  );

  /// Compute mesh bounding box limits
  BoundingBoxStructType GetMeshBoundingBox(
    MeshStructType mesh,
  );

  /// Compute mesh tangents
  void GenMeshTangents(
    MeshStructType mesh,
  );

  /// Export mesh data to file, returns true on success
  bool ExportMesh(
    MeshStructType mesh,
    String fileName,
  );

  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(
    MeshStructType mesh,
    String fileName,
  );

  /// Generate polygonal mesh
  MeshStructType GenMeshPoly(
    num sides,
    num radius,
  );

  /// Generate plane mesh (with subdivisions)
  MeshStructType GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  );

  /// Generate cuboid mesh
  MeshStructType GenMeshCube(
    num width,
    num height,
    num length,
  );

  /// Generate sphere mesh (standard sphere)
  MeshStructType GenMeshSphere(
    num radius,
    num rings,
    num slices,
  );

  /// Generate half-sphere mesh (no bottom cap)
  MeshStructType GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  );

  /// Generate cylinder mesh
  MeshStructType GenMeshCylinder(
    num radius,
    num height,
    num slices,
  );

  /// Generate cone/pyramid mesh
  MeshStructType GenMeshCone(
    num radius,
    num height,
    num slices,
  );

  /// Generate torus mesh
  MeshStructType GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  );

  /// Generate trefoil knot mesh
  MeshStructType GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  );

  /// Generate heightmap mesh from image data
  MeshStructType GenMeshHeightmap(
    ImageStructType heightmap,
    Vector3StructType size,
  );

  /// Generate cubes-based map mesh from image data
  MeshStructType GenMeshCubicmap(
    ImageStructType cubicmap,
    Vector3StructType cubeSize,
  );

  /// Load materials from model file
  List<MaterialStructType> LoadMaterials(
    String fileName,
  );

  /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  MaterialStructType LoadMaterialDefault();

  /// Check if a material is valid (shader assigned, map textures loaded in GPU)
  bool IsMaterialValid(
    MaterialStructType material,
  );

  /// Unload material from GPU memory (VRAM)
  void UnloadMaterial(
    MaterialStructType material,
  );

  /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  void SetMaterialTexture(
    MaterialStructType material,
    MaterialMapIndex mapType,
    TextureStructType texture,
  );

  /// Set material for a mesh
  void SetModelMeshMaterial(
    ModelStructType model,
    num meshId,
    num materialId,
  );

  /// Load model animations from file
  List<ModelAnimationStructType> LoadModelAnimations(
    String fileName,
  );

  /// Update model animation pose (CPU)
  void UpdateModelAnimation(
    ModelStructType model,
    ModelAnimationStructType anim,
    num frame,
  );

  /// Update model animation mesh bone matrices (GPU skinning)
  void UpdateModelAnimationBones(
    ModelStructType model,
    ModelAnimationStructType anim,
    num frame,
  );

  /// Unload animation data
  void UnloadModelAnimation(
    ModelAnimationStructType anim,
  );

  /// Unload animation array data
  void UnloadModelAnimations(
    List<ModelAnimationStructType> animations,
  );

  /// Check model animation skeleton match
  bool IsModelAnimationValid(
    ModelStructType model,
    ModelAnimationStructType anim,
  );

  /// Check collision between two spheres
  bool CheckCollisionSpheres(
    Vector3StructType center1,
    num radius1,
    Vector3StructType center2,
    num radius2,
  );

  /// Check collision between two bounding boxes
  bool CheckCollisionBoxes(
    BoundingBoxStructType box1,
    BoundingBoxStructType box2,
  );

  /// Check collision between box and sphere
  bool CheckCollisionBoxSphere(
    BoundingBoxStructType box,
    Vector3StructType center,
    num radius,
  );

  /// Get collision info between ray and sphere
  RayCollisionStructType GetRayCollisionSphere(
    RayStructType ray,
    Vector3StructType center,
    num radius,
  );

  /// Get collision info between ray and box
  RayCollisionStructType GetRayCollisionBox(
    RayStructType ray,
    BoundingBoxStructType box,
  );

  /// Get collision info between ray and mesh
  RayCollisionStructType GetRayCollisionMesh(
    RayStructType ray,
    MeshStructType mesh,
    MatrixStructType transform,
  );

  /// Get collision info between ray and triangle
  RayCollisionStructType GetRayCollisionTriangle(
    RayStructType ray,
    Vector3StructType p1,
    Vector3StructType p2,
    Vector3StructType p3,
  );

  /// Get collision info between ray and quad
  RayCollisionStructType GetRayCollisionQuad(
    RayStructType ray,
    Vector3StructType p1,
    Vector3StructType p2,
    Vector3StructType p3,
    Vector3StructType p4,
  );
}
