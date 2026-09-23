part of '../../raylib_dartified_base.dart';

/// Backend-agnostic Raylib Core module.
final class RaylibCoreDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibCoreDartDebugLabels();

  RaylibCoreDart(super.rl);

  RaylibCoreFlat get _flat => rl.module();

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
  ) => run(
    () => _debugLabels.InitWindow(width, height, title),
    () => _flat.InitWindow(
      width.toInt(),
      height.toInt(),
      $.String$.ValueOrNull(title),
    ),
  );

  /// Close window and unload OpenGL context
  void CloseWindow() => run(
    () => _debugLabels.CloseWindow(),
    () => _flat.CloseWindow(),
  );

  /// Check if application should close ([KeyboardKey.KEY_ESCAPE] pressed or windows close icon clicked)
  bool WindowShouldClose() => run(
    () => _debugLabels.WindowShouldClose(),
    () => _flat.WindowShouldClose(),
  );

  /// Check if window has been initialized successfully
  bool IsWindowReady() => run(
    () => _debugLabels.IsWindowReady(),
    () => _flat.IsWindowReady(),
  );

  /// Check if window is currently fullscreen
  bool IsWindowFullscreen() => run(
    () => _debugLabels.IsWindowFullscreen(),
    () => _flat.IsWindowFullscreen(),
  );

  /// Check if window is currently hidden
  bool IsWindowHidden() => run(
    () => _debugLabels.IsWindowHidden(),
    () => _flat.IsWindowHidden(),
  );
    
  /// Check if window is currently minimized
  bool IsWindowMinimized() => run(
    () => _debugLabels.IsWindowMinimized(),
    () => _flat.IsWindowMinimized(),
  );
    
  /// Check if window is currently maximized
  bool IsWindowMaximized() => run(
    () => _debugLabels.IsWindowMaximized(),
    () => _flat.IsWindowMaximized(),
  );
    
  /// Check if window is currently focused
  bool IsWindowFocused() => run(
    () => _debugLabels.IsWindowFocused(),
    () => _flat.IsWindowFocused(),
  );
    
  /// Check if window has been resized last frame
  bool IsWindowResized() => run(
    () => _debugLabels.IsWindowResized(),
    () => _flat.IsWindowResized(),
  );
    
  /// Check if one specific window flag is enabled
  bool IsWindowState(
    ConfigFlags flag,
  ) => run(
    () => _debugLabels.IsWindowState(flag),
    () => _flat.IsWindowState(
      flag.value,
    ),
  );
    
  /// Set window configuration state using flags
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => _debugLabels.SetWindowState(flags),
    () => _flat.SetWindowState(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );
    
  /// Clear window configuration state flags
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => _debugLabels.ClearWindowState(flags),
    () => _flat.ClearWindowState(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );
    
  /// Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
  void ToggleFullscreen() => run(
    () => _debugLabels.ToggleFullscreen(),
    () => _flat.ToggleFullscreen(),
  );
    
  /// Toggle window state: borderless windowed, resizes window to match monitor resolution
  void ToggleBorderlessWindowed() => run(
    () => _debugLabels.ToggleBorderlessWindowed(),
    () => _flat.ToggleBorderlessWindowed(),
  );
    
  /// Set window state: maximized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MaximizeWindow() => run(
    () => _debugLabels.MaximizeWindow(),
    () => _flat.MaximizeWindow(),
  );
    
  /// Set window state: minimized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MinimizeWindow() => run(
    () => _debugLabels.MinimizeWindow(),
    () => _flat.MinimizeWindow(),
  );
    
  /// Set window state: not minimized/maximized
  void RestoreWindow() => run(
    () => _debugLabels.RestoreWindow(),
    () => _flat.RestoreWindow(),
  );
    
  /// Set icon for window (single image, RGBA 32bit)
  void SetWindowIcon(
    ImageD image,
  ) => run(
    () => _debugLabels.SetWindowIcon(image),
    () => _flat.SetWindowIcon(
      image,
    ),
  );
    
  /// Set icon for window (multiple images, RGBA 32bit)
  void SetWindowIcons(
    List<ImageD> images,
  ) => run(
    () => _debugLabels.SetWindowIcons(images),
    () => _flat.SetWindowIcons(
      $.Image$.ArrayStruct(images),
      images.length,
    ),
  );
    
  /// Set title for window
  void SetWindowTitle(
    String title,
  ) => run(
    () => _debugLabels.SetWindowTitle(title),
    () => _flat.SetWindowTitle(
      $.String$.ValueOrNull(title),
    ),
  );

  /// Set window position on screen
  void SetWindowPosition(
    num x,
    num y,
  ) => run(
    () => _debugLabels.SetWindowPosition(x, y),
    () => _flat.SetWindowPosition(
      x.toInt(),
      y.toInt(),
    ),
  );
    
  /// Set monitor for the current window
  void SetWindowMonitor(
    num monitor,
  ) => run(
    () => _debugLabels.SetWindowMonitor(monitor),
    () => _flat.SetWindowMonitor(
      monitor.toInt(),
    ),
  );
    
  /// Set window minimum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMinSize(
    num width,
    num height,
  ) => run(
    () => _debugLabels.SetWindowMinSize(width, height),
    () => _flat.SetWindowMinSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Set window maximum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMaxSize(
    num width,
    num height,
  ) => run(
    () => _debugLabels.SetWindowMaxSize(width, height),
    () => _flat.SetWindowMaxSize(
      width.toInt(),
      height.toInt(),
    ),
  );
    
  /// Set window dimensions
  void SetWindowSize(
    num width,
    num height,
  ) => run(
    () => _debugLabels.SetWindowSize(width, height),
    () => _flat.SetWindowSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Set window opacity [0.0..1.0]
  void SetWindowOpacity(
    num opacity,
  ) => run(
    () => _debugLabels.SetWindowOpacity(opacity),
    () => _flat.SetWindowOpacity(
      opacity.toDouble(),
    ),
  );
    
  /// Set window focused
  void SetWindowFocused() => run(
    () => _debugLabels.SetWindowFocused(),
    () => _flat.SetWindowFocused(),
  );

  /// Get current screen width
  int GetScreenWidth() => run(
    () => _debugLabels.GetScreenWidth(),
    () => _flat.GetScreenWidth(),
  );
    
  /// Get current screen height
  int GetScreenHeight() => run(
    () => _debugLabels.GetScreenHeight(),
    () => _flat.GetScreenHeight(),
  );
    
  /// Get current render width (it considers HiDPI)
  int GetRenderWidth() => run(
    () => _debugLabels.GetRenderWidth(),
    () => _flat.GetRenderWidth(),
  );
    
  /// Get current render height (it considers HiDPI)
  int GetRenderHeight() => run(
    () => _debugLabels.GetRenderHeight(),
    () => _flat.GetRenderHeight(),
  );
    
  /// Get number of connected monitors
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorCount() => run(
    () => _debugLabels.GetMonitorCount(),
    () => _flat.GetMonitorCount(),
  );
    
  /// Get current monitor where window is placed
  /// 
  /// **[!] Not implemented on WASM**
  int GetCurrentMonitor() => run(
    () => _debugLabels.GetCurrentMonitor(),
    () => _flat.GetCurrentMonitor(),
  );
    
  /// Get specified monitor position
  /// 
  /// **[!] Not implemented on WASM**
  Vector2D GetMonitorPosition(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorPosition(monitor),
    () => _flat.GetMonitorPosition(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor width (current video mode used by monitor)
  int GetMonitorWidth(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorWidth(monitor),
    () => _flat.GetMonitorWidth(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor height (current video mode used by monitor)
  int GetMonitorHeight(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorHeight(monitor),
    () => _flat.GetMonitorHeight(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor physical width in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalWidth(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorPhysicalWidth(monitor),
    () => _flat.GetMonitorPhysicalWidth(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor physical height in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalHeight(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorPhysicalHeight(monitor),
    () => _flat.GetMonitorPhysicalHeight(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor refresh rate
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorRefreshRate(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorRefreshRate(monitor),
    () => _flat.GetMonitorRefreshRate(
      monitor.toInt(),
    ),
  );
    
  /// Get window position XY on monitor
  Vector2D GetWindowPosition() => run(
    () => _debugLabels.GetWindowPosition(),
    () => _flat.GetWindowPosition(),
  );
    
  /// Get window scale DPI factor
  Vector2D GetWindowScaleDPI() => run(
    () => _debugLabels.GetWindowScaleDPI(),
    () => _flat.GetWindowScaleDPI(),
  );
    
  /// Get the human-readable, UTF-8 encoded name of the specified monitor
  /// 
  /// **[!] Not implemented on WASM**
  String GetMonitorName(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorName(monitor),
    () => _flat.GetMonitorName(
      monitor.toInt(),
    ).toDartString(),
  );
    
  /// Set clipboard text content
  void SetClipboardText(
    String text,
  ) => run(
    () => _debugLabels.SetClipboardText(text),
    () => _flat.SetClipboardText(
      $.String$.ValueOrNull(text),
    ),
  );
    
  /// Get clipboard text content
  String GetClipboardText() => run(
    () => _debugLabels.GetClipboardText(),
    () => _flat.GetClipboardText().toDartString(),
  );
    
  /// Get clipboard image content
  ImageD GetClipboardImage() => run(
    () => _debugLabels.GetClipboardImage(),
    () => _flat.GetClipboardImage(),
  );
    
  /// Enable waiting for events on EndDrawing(), no automatic event polling
  void EnableEventWaiting() => run(
    () => _debugLabels.EnableEventWaiting(),
    () => _flat.EnableEventWaiting(),
  );
    
  /// Disable waiting for events on EndDrawing(), automatic events polling
  void DisableEventWaiting() => run(
    () => _debugLabels.DisableEventWaiting(),
    () => _flat.DisableEventWaiting(),
  );
    
  /// Shows cursor
  void ShowCursor() => run(
    () => _debugLabels.ShowCursor(),
    () => _flat.ShowCursor(),
  );
    
  /// Hides cursor
  void HideCursor() => run(
    () => _debugLabels.HideCursor(),
    () => _flat.HideCursor(),
  );
    
  /// Check if cursor is not visible
  bool IsCursorHidden() => run(
    () => _debugLabels.IsCursorHidden(),
    () => _flat.IsCursorHidden(),
  );
    
  /// Enables cursor (unlock cursor)
  void EnableCursor() => run(
    () => _debugLabels.EnableCursor(),
    () => _flat.EnableCursor(),
  );
    
  /// Disables cursor (lock cursor)
  void DisableCursor() => run(
    () => _debugLabels.DisableCursor(),
    () => _flat.DisableCursor(),
  );
    
  /// Check if cursor is on the screen
  bool IsCursorOnScreen() => run(
    () => _debugLabels.IsCursorOnScreen(),
    () => _flat.IsCursorOnScreen(),
  );
    
  /// Set background color (framebuffer clear color)
  void ClearBackground(
    ColorD color,
  ) => run(
    () => _debugLabels.ClearBackground(color),
    () => _flat.ClearBackground(
      color,
    ),
  );
    
  /// Setup canvas (framebuffer) to start drawing
  void BeginDrawing() => run(
    () => _debugLabels.BeginDrawing(),
    () => _flat.BeginDrawing(),
  );
    
  /// End canvas drawing and swap buffers (double buffering)
  void EndDrawing() => run(
    () => _debugLabels.EndDrawing(),
    () => _flat.EndDrawing(),
  );
    
  /// Begin 2D mode with custom camera (2D)
  void BeginMode2D(
    Camera2DD camera,
  ) => run(
    () => _debugLabels.BeginMode2D(camera),
    () => _flat.BeginMode2D(
      camera,
    ),
  );
    
  /// Ends 2D mode with custom camera
  void EndMode2D() => run(
    () => _debugLabels.EndMode2D(),
    () => _flat.EndMode2D(),
  );
    
  /// Begin 3D mode with custom camera (3D)
  void BeginMode3D(
    Camera3DD camera,
  ) => run(
    () => _debugLabels.BeginMode3D(camera),
    () => _flat.BeginMode3D(
      camera,
    ),
  );
    
  /// Ends 3D mode and returns to default 2D orthographic mode
  void EndMode3D() => run(
    () => _debugLabels.EndMode3D(),
    () => _flat.EndMode3D(),
  );
    
  /// Begin drawing to render texture
  void BeginTextureMode(
    RenderTextureD target,
  ) => run(
    () => _debugLabels.BeginTextureMode(target),
    () => _flat.BeginTextureMode(
      target,
    ),
  );
    
  /// Ends drawing to render texture
  void EndTextureMode() => run(
    () => _debugLabels.EndTextureMode(),
    () => _flat.EndTextureMode(),
  );
    
  /// Begin custom shader drawing
  void BeginShaderMode(
    ShaderD shader,
  ) => run(
    () => _debugLabels.BeginShaderMode(shader),
    () => _flat.BeginShaderMode(
      shader,
    ),
  );
    
  /// End custom shader drawing (use default shader)
  void EndShaderMode() => run(
    () => _debugLabels.EndShaderMode(),
    () => _flat.EndShaderMode(),
  );
    
  /// Begin blending mode (alpha, additive, multiplied, subtract, custom)
  void BeginBlendMode(
    BlendMode mode,
  ) => run(
    () => _debugLabels.BeginBlendMode(mode),
    () => _flat.BeginBlendMode(
      mode.value,
    ),
  );
    
  /// End blending mode (reset to default: alpha blending)
  void EndBlendMode() => run(
    () => _debugLabels.EndBlendMode(),
    () => _flat.EndBlendMode(),
  );
    
  /// Begin scissor mode (define screen area for following drawing)
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => run(
    () => _debugLabels.BeginScissorMode(x, y, width, height),
    () => _flat.BeginScissorMode(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );
    
  /// End scissor mode
  void EndScissorMode() => run(
    () => _debugLabels.EndScissorMode(),
    () => _flat.EndScissorMode(),
  );
    
  /// Begin stereo rendering (requires VR simulator)
  void BeginVrStereoMode(
    VrStereoConfigD config,
  ) => run(
    () => _debugLabels.BeginVrStereoMode(config),
    () => _flat.BeginVrStereoMode(
      config,
    ),
  );
    
  /// End stereo rendering (requires VR simulator)
  void EndVrStereoMode() => run(
    () => _debugLabels.EndVrStereoMode(),
    () => _flat.EndVrStereoMode(),
  );
    
  /// Load VR stereo config for VR simulator device parameters
  VrStereoConfigD LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => run(
    () => _debugLabels.LoadVrStereoConfig(device),
    () => _flat.LoadVrStereoConfig(
      device,
    ),
  );
    
  /// Unload VR stereo config
  void UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => run(
    () => _debugLabels.UnloadVrStereoConfig(config),
    () => _flat.UnloadVrStereoConfig(
      config,
    ),
  );
    
  /// Load shader from files and bind default locations
  ShaderD LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => run(
    () => _debugLabels.LoadShader(vsFileName, fsFileName),
    () => _flat.LoadShader(
      $.String$.ValueOrNull(vsFileName),
      $.String$.ValueOrNull(fsFileName),
    ),
  );
    
  /// Load shader from code strings and bind default locations
  ShaderD LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => run(
    () => _debugLabels.LoadShaderFromMemory(vsCode, fsCode),
    () => _flat.LoadShaderFromMemory(
      $.String$.ValueOrNull(vsCode),
      $.String$.ValueOrNull(fsCode),
    ),
  );
    
  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(
    ShaderD shader,
  ) => run(
    () => _debugLabels.IsShaderValid(shader),
    () => _flat.IsShaderValid(
      shader,
    ),
  );
    
  /// Get shader uniform location
  int GetShaderLocation(
    ShaderD shader,
    String uniformName,
  ) => run(
    () => _debugLabels.GetShaderLocation(shader, uniformName),
    () => _flat.GetShaderLocation(
      shader,
      $.String$.ValueOrNull(uniformName),
    ),
  );
    
  /// Get shader attribute location
  int GetShaderLocationAttrib(
    ShaderD shader,
    String attribName,
  ) => run(
    () => _debugLabels.GetShaderLocationAttrib(shader, attribName),
    () => _flat.GetShaderLocationAttrib(
      shader,
      $.String$.ValueOrNull(attribName),
    ),
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
  ) => run(
    () => _debugLabels.SetShaderValueV(shader, locIndex, value, uniformType, count),
    () {
      final ptr = switch (uniformType) {
        .SHADER_UNIFORM_FLOAT ||
        .SHADER_UNIFORM_VEC2  ||
        .SHADER_UNIFORM_VEC3  ||
        .SHADER_UNIFORM_VEC4  => $.Float32$.Array(value),
        
        .SHADER_UNIFORM_INT   ||
        .SHADER_UNIFORM_IVEC2 ||
        .SHADER_UNIFORM_IVEC3 ||
        .SHADER_UNIFORM_IVEC4 => $.Int$.Array(value),

        .SHADER_UNIFORM_UINT   ||
        .SHADER_UNIFORM_UIVEC2 ||
        .SHADER_UNIFORM_UIVEC3 ||
        .SHADER_UNIFORM_UIVEC4 => $.UnsignedInt$.Array(value),
        
        .SHADER_UNIFORM_SAMPLER2D => $.Int$.Array(value),
      };

      _flat.SetShaderValueV(
        shader,
        locIndex.toInt(),
        ptr.cast(),
        uniformType.value,
        count.toInt(),
      );
    },
  );
    
  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(
    ShaderD shader,
    num locIndex,
    MatrixD mat,
  ) => run(
    () => _debugLabels.SetShaderValueMatrix(shader, locIndex, mat),
    () => _flat.SetShaderValueMatrix(
      shader,
      locIndex.toInt(),
      mat,
    ),
  );
    
  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(
    ShaderD shader,
    num locIndex,
    TextureD texture,
  ) => run(
    () => _debugLabels.SetShaderValueTexture(shader, locIndex, texture),
    () => _flat.SetShaderValueTexture(
      shader,
      locIndex.toInt(),
      texture,
    ),
  );
    
  /// Unload shader from GPU memory (VRAM)
  void UnloadShader(
    ShaderD shader,
  ) => run(
    () => _debugLabels.UnloadShader(shader),
    () => _flat.UnloadShader(
      shader,
    ),
  );
    
  /// Get a ray trace from screen position (i.e mouse)
  RayD GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetScreenToWorldRay(position, camera),
    () => _flat.GetScreenToWorldRay(
      position,
      camera,
    ),
  );
    
  /// Get a ray trace from screen position (i.e mouse) in a viewport
  RayD GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    num width,
    num height,
  ) => run(
    () => _debugLabels.GetScreenToWorldRayEx(position, camera, width, height),
    () => _flat.GetScreenToWorldRayEx(
      position,
      camera,
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Get the screen space position for a 3d world space position
  Vector2D GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetWorldToScreen(position, camera),
    () => _flat.GetWorldToScreen(
      position,
      camera,
    ),
  );

  /// Get size position for a 3d world space position
  Vector2D GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    num width,
    num height,
  ) => run(
    () => _debugLabels.GetWorldToScreenEx(position, camera, width, height),
    () => _flat.GetWorldToScreenEx(
      position,
      camera,
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Get the screen space position for a 2d camera world space position
  Vector2D GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => _debugLabels.GetWorldToScreen2D(position, camera),
    () => _flat.GetWorldToScreen2D(
      position,
      camera,
    ),
  );

  /// Get the world space position for a 2d camera screen space position
  Vector2D GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => _debugLabels.GetScreenToWorld2D(position, camera),
    () => _flat.GetScreenToWorld2D(
      position,
      camera,
    ),
  );

  /// Get camera transform matrix (view matrix)
  MatrixD GetCameraMatrix(
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetCameraMatrix(camera),
    () => _flat.GetCameraMatrix(
      camera,
    ),
  );

  /// Get camera 2d transform matrix
  MatrixD GetCameraMatrix2D(
    Camera2DD camera,
  ) => run(
    () => _debugLabels.GetCameraMatrix2D(camera),
    () => _flat.GetCameraMatrix2D(
      camera,
    ),
  );
    
  /// Set target FPS (maximum)
  void SetTargetFPS(
    num fps,
  ) => run(
    () => _debugLabels.SetTargetFPS(fps),
    () => _flat.SetTargetFPS(
      fps.toInt(),
    ),
  );

  /// Get time in seconds for last frame drawn (delta time)
  double GetFrameTime() => run(
    () => _debugLabels.GetFrameTime(),
    () => _flat.GetFrameTime(),
  );

  /// Get elapsed time in seconds since InitWindow()
  double GetTime() => run(
    () => _debugLabels.GetTime(),
    () => _flat.GetTime(),
  );

  /// Get current FPS
  int GetFPS() => run(
    () => _debugLabels.GetFPS(),
    () => _flat.GetFPS(),
  );

  /// Swap back buffer with front buffer (screen drawing)
  void SwapScreenBuffer() => run(
    () => _debugLabels.SwapScreenBuffer(),
    () => _flat.SwapScreenBuffer(),
  );

  /// Register all input events
  void PollInputEvents() => run(
    () => _debugLabels.PollInputEvents(),
    () => _flat.PollInputEvents(),
  );

  /// Wait for some time (halt program execution)
  void WaitTime(
    num seconds,
  ) => run(
    () => _debugLabels.WaitTime(seconds),
    () => _flat.WaitTime(
      seconds.toDouble(),
    ),
  );

  /// Set the seed for the random number generator
  void SetRandomSeed(
    num seed,
  ) => run(
    () => _debugLabels.SetRandomSeed(seed),
    () => _flat.SetRandomSeed(
      seed.toInt(),
    ),
  );

  /// Get a random value between min and max (both included)
  int GetRandomValue(
    num min,
    num max,
  ) => run(
    () => _debugLabels.GetRandomValue(min, max),
    () => _flat.GetRandomValue(
      min.toInt(),
      max.toInt(),
    ),
  );

  /// Load random values sequence, no values repeated, min and max included
  List<int> LoadRandomSequence(
    num count,
    num min,
    num max,
  ) => run(
    () => _debugLabels.LoadRandomSequence(count, min, max),
    () {
      final seq = _flat.LoadRandomSequence(
        count.toInt(),
        min.toInt(),
        max.toInt(),
      );
      final List<int> values = .generate(count.toInt(), (i) => seq[i]);
      _flat.UnloadRandomSequence(seq);
      return values;
    },
  );
  
  /// Takes a screenshot of current screen (filename extension defines format)
  void TakeScreenshot(
    String fileName,
  ) => run(
    () => _debugLabels.TakeScreenshot(fileName),
    () => _flat.TakeScreenshot(
      $.String$.ValueOrNull(fileName),
    ),
  );

  /// Setup init configuration flags (view [ConfigFlags])
  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => _debugLabels.SetConfigFlags(flags),
    () => _flat.SetConfigFlags(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );

  /// Open URL with default system browser (if available)
  void OpenURL(
    String url,
  ) => run(
    () => _debugLabels.OpenURL(url),
    () => _flat.OpenURL(
      $.String$.ValueOrNull(url),
    ),
  );

  /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  void TraceLog(
    TraceLogLevel logLevel,
    String text, [
      List<Object?> args = const [],
    ]
  ) => run(
    () => _debugLabels.TraceLog(logLevel, text),
    () => _flat.TraceLog(
      logLevel.value,
      $.String$.ValueOrNull(
        rl.Utils.Format(text, args)
      ),
    ),
  );

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => run(
    () => _debugLabels.SetTraceLogLevel(logLevel),
    () => _flat.SetTraceLogLevel(
      logLevel.value,
    ),
  );

  /// Set custom trace log
  void SetTraceLogCallback(
    covariant TraceLogCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetTraceLogCallback(callback),
    () => _flat.SetTraceLogCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Set custom file binary data loader
  void SetLoadFileDataCallback(
    covariant LoadFileDataCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetLoadFileDataCallback(callback),
    () => _flat.SetLoadFileDataCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Set custom file binary data saver
  void SetSaveFileDataCallback(
    covariant SaveFileDataCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetSaveFileDataCallback(callback),
    () => _flat.SetSaveFileDataCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Set custom file text data loader
  void SetLoadFileTextCallback(
    covariant LoadFileTextCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetLoadFileTextCallback(callback),
    () => _flat.SetLoadFileTextCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Set custom file text data saver
  void SetSaveFileTextCallback(
    covariant SaveFileTextCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetSaveFileTextCallback(callback),
    () => _flat.SetSaveFileTextCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Load file data as byte array (read)
  Uint8List LoadFileData(
    String fileName,
  ) => run(
    () => _debugLabels.LoadFileData(fileName),
    () {
      final fileSize = $.Int$.Ref1();
      final data = _flat.LoadFileData(
        $.String$.ValueOrNull(fileName),
        fileSize,
      );
      try {
        return $.UnsignedChar$.asTypedList(data, fileSize.value);
      } finally {
        _flat.UnloadFileData(data);
      }
    },
  );

  /// Save data to file from byte array (write), returns true on success
  bool SaveFileData(
    String fileName,
    Uint8List data,
  ) => run(
    () => _debugLabels.SaveFileData(fileName, data),
    () => _flat.SaveFileData(
      $.String$.ValueOrNull(fileName),
      $.Uint8$.Array(data).cast(),
      data.length,
    ),
  );

  /// Export data to code (.h), returns true on success
  bool ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => run(
    () => _debugLabels.ExportDataAsCode(data, fileName),
    () => _flat.ExportDataAsCode(
      $.Uint8$.Array(data),
      data.length,
      $.String$.ValueOrNull(fileName),
    ),
  );

  /// Load text data from file (read)
  String LoadFileText(
    String fileName,
  ) => run(
    () => _debugLabels.LoadFileText(fileName),
    () {
      final text = _flat.LoadFileText(
        $.String$.ValueOrNull(fileName),
      );
      final fileText = text.toDartString();
      _flat.UnloadFileText(text);
      return fileText;
    },
  );

  /// Save text data to file (write), returns true on success
  bool SaveFileText(
    String fileName,
    String text,
  ) => run(
    () => _debugLabels.SaveFileText(fileName, text),
    () => _flat.SaveFileText(
      $.String$.ValueOrNull(fileName),
      $.String$.ValueOrNull(text),
    ),
  );

  /// Rename file (if exists)
  int FileRename(
    String fileName,
    String fileRename,
  ) => run(
    () => _debugLabels.FileRename(fileName, fileRename),
    () => _flat.FileRename(
      $.String$.ValueOrNull(fileName),
      $.String$.ValueOrNull(fileRename),
    ),
  );
  
  /// Remove file (if exists)
  int FileRemove(
    String fileName,
  ) => run(
    () => _debugLabels.FileRemove(fileName),
    () => _flat.FileRemove(
      $.String$.ValueOrNull(fileName),
    ),
  );
  
  /// Copy file from one path to another, dstPath created if it doesn't exist
  int FileCopy(
    String srcPath,
    String dstPath,
  ) => run(
    () => _debugLabels.FileCopy(srcPath, dstPath),
    () => _flat.FileCopy(
      $.String$.ValueOrNull(srcPath),
      $.String$.ValueOrNull(dstPath),
    ),
  );
  
  /// Move file from one directory to another, dstPath created if it doesn't exist
  int FileMove(
    String srcPath,
    String dstPath,
  ) => run(
    () => _debugLabels.FileMove(srcPath, dstPath),
    () => _flat.FileMove(
      $.String$.ValueOrNull(srcPath),
      $.String$.ValueOrNull(dstPath),
    ),
  );
  
  /// Replace text in an existing file
  int FileTextReplace(
    String fileName,
    String search,
    String replacement,
  ) => run(
    () => _debugLabels.FileTextReplace(fileName, search, replacement),
    () => _flat.FileTextReplace(
      $.String$.ValueOrNull(fileName),
      $.String$.ValueOrNull(search),
      $.String$.ValueOrNull(replacement),
    ),
  );
  
  /// Find text in existing file
  int FileTextFindIndex(
    String fileName,
    String search,
  ) => run(
    () => _debugLabels.FileTextFindIndex(fileName, search),
    () => _flat.FileTextFindIndex(
      $.String$.ValueOrNull(fileName),
      $.String$.ValueOrNull(search),
    ),
  );
    
  /// Check if file exists
  bool FileExists(
    String fileName,
  ) => run(
    () => _debugLabels.FileExists(fileName),
    () => _flat.FileExists(
      $.String$.ValueOrNull(fileName),
    ),
  );

  /// Check if a directory path exists
  bool DirectoryExists(
    String dirPath,
  ) => run(
    () => _debugLabels.DirectoryExists(dirPath),
    () => _flat.DirectoryExists(
      $.String$.ValueOrNull(dirPath),
    ),
  );

  /// Check file extension (including point: .png, .wav)
  bool IsFileExtension(
    String fileName,
    String ext,
  ) => run(
    () => _debugLabels.IsFileExtension(fileName, ext),
    () => _flat.IsFileExtension(
      $.String$.ValueOrNull(fileName),
      $.String$.ValueOrNull(ext),
    ),
  );

  /// Get file length in bytes
  int GetFileLength(
    String fileName,
  ) => run(
    () => _debugLabels.GetFileLength(fileName),
    () => _flat.GetFileLength(
      $.String$.ValueOrNull(fileName),
    ),
  );

  /// Get extension for a filename (includes dot: '.png')
  String GetFileExtension(
    String fileName,
  ) => run(
    () => _debugLabels.GetFileExtension(fileName),
    () => _flat.GetFileExtension(
      $.String$.ValueOrNull(fileName),
    ).toDartString(),
  );

  /// Get filename for a path string
  String GetFileName(
    String filePath,
  ) => run(
    () => _debugLabels.GetFileName(filePath),
    () => _flat.GetFileName(
      $.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get filename without extension
  String GetFileNameWithoutExt(
    String filePath,
  ) => run(
    () => _debugLabels.GetFileNameWithoutExt(filePath),
    () => _flat.GetFileNameWithoutExt(
      $.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get the file count in a directory
  int GetDirectoryFileCount(
    String dirPath, 
  ) => run(
    () => _debugLabels.GetDirectoryFileCount(dirPath),
    () => _flat.GetDirectoryFileCount(
      $.String$.ValueOrNull(dirPath),
    ),
  );
  
  /// Get the file count in a directory with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  int GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => run(
    () => _debugLabels.GetDirectoryFileCountEx(basePath, filter, scanSubdirs),
    () => _flat.GetDirectoryFileCountEx(
      $.String$.ValueOrNull(basePath),
      $.String$.ValueOrNull(filter),
      scanSubdirs,
    ),
  );

  /// Get full path for a given fileName with path
  String GetDirectoryPath(
    String filePath,
  ) => run(
    () => _debugLabels.GetDirectoryPath(filePath),
    () => _flat.GetDirectoryPath(
      $.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get previous directory path for a given path
  String GetPrevDirectoryPath(
    String dirPath,
  ) => run(
    () => _debugLabels.GetPrevDirectoryPath(dirPath),
    () => _flat.GetPrevDirectoryPath(
      $.String$.ValueOrNull(dirPath),
    ).toDartString(),
  );

  /// Get current working directory
  String GetWorkingDirectory() => run(
    () => _debugLabels.GetWorkingDirectory(),
    () => _flat.GetWorkingDirectory().toDartString(),
  );

  /// Get the directory of the running application
  String GetApplicationDirectory() => run(
    () => _debugLabels.GetApplicationDirectory(),
    () => _flat.GetApplicationDirectory().toDartString(),
  );

  /// Create directories (including full path requested), returns 0 on success
  int MakeDirectory(
    String dirPath,
  ) => run(
    () => _debugLabels.MakeDirectory(dirPath),
    () => _flat.MakeDirectory(
      $.String$.ValueOrNull(dirPath),
    ),
  );

  /// Change working directory, return true on success
  bool ChangeDirectory(
    String dir,
  ) => run(
    () => _debugLabels.ChangeDirectory(dir),
    () => _flat.ChangeDirectory(
      $.String$.ValueOrNull(dir),
    ),
  );

  /// Check if a given path is a file or a directory
  bool IsPathFile(
    String path,
  ) => run(
    () => _debugLabels.IsPathFile(path),
    () => _flat.IsPathFile(
      $.String$.ValueOrNull(path),
    ),
  );

  /// Check if fileName is valid for the platform/OS
  bool IsFileNameValid(
    String fileName,
  ) => run(
    () => _debugLabels.IsFileNameValid(fileName),
    () => _flat.IsFileNameValid(
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load directory filepaths
  FilePathListD LoadDirectoryFiles(
    String dirPath,
  ) => run(
    () => _debugLabels.LoadDirectoryFiles(dirPath),
    () => _flat.LoadDirectoryFiles(
      $.String$.ValueOrNull(dirPath),
    ),
  );
    
  /// Load directory filepaths with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  FilePathListD LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => run(
    () => _debugLabels.LoadDirectoryFilesEx(basePath, filter, scanSubdirs),
    () => _flat.LoadDirectoryFilesEx(
      $.String$.ValueOrNull(basePath),
      $.String$.ValueOrNull(filter),
      scanSubdirs,
    ),
  );

  /// Unload filepaths
  void UnloadDirectoryFiles(
    FilePathListD files,
  ) => run(
    () => _debugLabels.UnloadDirectoryFiles(files),
    () => _flat.UnloadDirectoryFiles(
      files,
    ),
  );
    
  /// Check if a file has been dropped into window
  bool IsFileDropped() => run(
    () => _debugLabels.IsFileDropped(),
    () => _flat.IsFileDropped(),
  );
    
  /// Load dropped filepaths
  FilePathListD LoadDroppedFiles() => run(
    () => _debugLabels.LoadDroppedFiles(),
    () => _flat.LoadDroppedFiles(),
  );

  /// Unload dropped filepaths
  void UnloadDroppedFiles(
    FilePathListD files,
  ) => run(
    () => _debugLabels.UnloadDroppedFiles(files),
    () => _flat.UnloadDroppedFiles(
      files,
    ),
  );

  /// Get file modification time (last write time)
  int GetFileModTime(
    String fileName,
  ) => run(
    () => _debugLabels.GetFileModTime(fileName),
    () => _flat.GetFileModTime(
      $.String$.ValueOrNull(fileName),
    ),
  );

  /// Compress data (DEFLATE algorithm)
  Uint8List CompressData(
    Uint8List data,
  ) => run(
    () => _debugLabels.CompressData(data),
    () {
      final compDataSize = $.Int$.Ref1();
      final compData = _flat.CompressData(
        $.Uint8$.Array(data),
        data.length,
        compDataSize,
      );
      try {
        return $.UnsignedChar$.asTypedList(compData, compDataSize.value);
      } finally {
        compData.free();
      }
    },
  );

  /// Decompress data (DEFLATE algorithm)
  Uint8List DecompressData(
    Uint8List compData,
  ) => run(
    () => _debugLabels.DecompressData(compData),
    () {
      final dataSize = $.Int$.Ref1();
      final data = _flat.DecompressData(
        $.Uint8$.Array(compData),
        compData.length,
        dataSize,
      );
      try {
        return $.UnsignedChar$.asTypedList(data, dataSize.value);
      } finally {
        data.free();
      }
    },
  );

  /// Encode data to Base64 string
  Uint8List EncodeDataBase64(
    Uint8List data,
  ) => run(
    () => _debugLabels.EncodeDataBase64(data),
    () {
      final outputSize = $.Int$.Ref1();
      final outputData = _flat.EncodeDataBase64(
        $.Uint8$.Array(data),
        data.length,
        outputSize,
      );
      try {
        return $.UnsignedChar$.asTypedList(outputData, outputSize.value);
      } finally {
        outputData.free();
      }
    },
  );

  /// Decode Base64 string data
  Uint8List DecodeDataBase64(
    Uint8List data,
  ) => run(
    () => _debugLabels.DecodeDataBase64(data),
    () {
      final outputSize = $.Int$.Ref1();
      final outputData = _flat.DecodeDataBase64(
        $.Int8$.Array(data),
        outputSize,
      );
      try {
        return $.UnsignedChar$.asTypedList(outputData, outputSize.value);
      } finally {
        outputData.free();
      }
    },
  );

  /// Compute CRC32 hash code
  int ComputeCRC32(
    Uint8List data,
  ) => run(
    () => _debugLabels.ComputeCRC32(data),
    () => _flat.ComputeCRC32(
      $.Uint8$.Array(data),
      data.length,
    ),
  );

  /// Compute MD5 hash code
  Uint8List ComputeMD5(
    Uint8List data,
  ) => run(
    () => _debugLabels.ComputeMD5(data),
    () => .fromList($.UnsignedInt$.ToLEBytes(
      _flat.ComputeMD5(
        $.Uint8$.Array(data),
        data.length,
      ),
      rl.Utils.md5Uint32HashLength,
    )),
  );

  /// Compute SHA1 hash code
  Uint8List ComputeSHA1(
    Uint8List data,
  ) => run(
    () => _debugLabels.ComputeSHA1(data),
    () => .fromList($.UnsignedInt$.ToBEBytes(
      _flat.ComputeSHA1(
        $.Uint8$.Array(data),
        data.length,
      ),
      rl.Utils.sha1Uint32HashLength,
    )),
  );

  /// Compute SHA256 hash code
  Uint8List ComputeSHA256(
    Uint8List data,
  ) => run(
    () => _debugLabels.ComputeSHA256(data),
    () => .fromList($.UnsignedInt$.ToBEBytes(
      _flat.ComputeSHA256(
        $.Uint8$.Array(data),
        data.length,
      ),
      rl.Utils.sha256Uint32HashLength,
    )),
  );
    
  /// Load automation events list from file, NULL for empty list
  AutomationEventListD LoadAutomationEventList(
    String? fileName,
  ) => run(
    () => _debugLabels.LoadAutomationEventList(fileName),
    () => _flat.LoadAutomationEventList(
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Unload automation events list from file
  void UnloadAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => _debugLabels.UnloadAutomationEventList(list),
    () => _flat.UnloadAutomationEventList(
      list,
    ),
  );
    
  /// Export automation events list as text file
  bool ExportAutomationEventList(
    AutomationEventListD list,
    String fileName,
  ) => run(
    () => _debugLabels.ExportAutomationEventList(list, fileName),
    () => _flat.ExportAutomationEventList(
      list,
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Set automation event list to record to
  void SetAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => _debugLabels.SetAutomationEventList(list),
    () => _flat.SetAutomationEventList(
      $.AutomationEventList$.Ref1(list),
    ),
  );
    
  /// Set automation event internal base frame to start recording
  void SetAutomationEventBaseFrame(
    int frame,
  ) => run(
    () => _debugLabels.SetAutomationEventBaseFrame(frame),
    () => _flat.SetAutomationEventBaseFrame(
      frame,
    ),
  );
    
  /// Start recording automation events (AutomationEventList must be set)
  void StartAutomationEventRecording() => run(
    () => _debugLabels.StartAutomationEventRecording(),
    () => _flat.StartAutomationEventRecording(),
  );

  /// Stop recording automation events
  void StopAutomationEventRecording() => run(
    () => _debugLabels.StopAutomationEventRecording(),
    () => _flat.StopAutomationEventRecording(),
  );
    
  /// Play a recorded automation event
  void PlayAutomationEvent(
    AutomationEventD event,
  ) => run(
    () => _debugLabels.PlayAutomationEvent(event),
    () => _flat.PlayAutomationEvent(
      event,
    ),
  );

  /// Check if a key has been pressed once
  bool IsKeyPressed(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyPressed(key),
    () => _flat.IsKeyPressed(
      key.value,
    ),
  );

  /// Check if a key has been pressed again
  bool IsKeyPressedRepeat(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyPressedRepeat(key),
    () => _flat.IsKeyPressedRepeat(
      key.value,
    ),
  );

  /// Check if a key is being pressed
  bool IsKeyDown(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyDown(key),
    () => _flat.IsKeyDown(
      key.value,
    ),
  );

  /// Check if a key has been released once
  bool IsKeyReleased(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyReleased(key),
    () => _flat.IsKeyReleased(
      key.value,
    ),
  );

  /// Check if a key is NOT being pressed
  bool IsKeyUp(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyUp(key),
    () => _flat.IsKeyUp(
      key.value,
    ),
  );

  /// Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
  /// 
  /// **[!] Not implemented on WASM**
  String GetKeyName(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.GetKeyName(key),
    () => _flat.GetKeyName(
      key.value,
    ).toDartString(),
  );

  /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  int GetKeyPressed() => run(
    () => _debugLabels.GetKeyPressed(),
    () => _flat.GetKeyPressed(),
  );

  /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  int GetCharPressed() => run(
    () => _debugLabels.GetCharPressed(),
    () => _flat.GetCharPressed(),
  );

  /// Set a custom key to exit program (default is ESC)
  void SetExitKey(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.SetExitKey(key),
    () => _flat.SetExitKey(
      key.value,
    ),
  );

  /// Check if a gamepad is available
  bool IsGamepadAvailable(
    num gamepad,
  ) => run(
    () => _debugLabels.IsGamepadAvailable(gamepad),
    () => _flat.IsGamepadAvailable(
      gamepad.toInt(),
    ),
  );

  /// Get gamepad internal name id
  String GetGamepadName(
    num gamepad,
  ) => run(
    () => _debugLabels.GetGamepadName(gamepad),
    () => _flat.GetGamepadName(
      gamepad.toInt(),
    ).toDartString(),
  );

  /// Check if a gamepad button has been pressed once
  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => _debugLabels.IsGamepadButtonPressed(gamepad, button),
    () => _flat.IsGamepadButtonPressed(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button is being pressed
  bool IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => _debugLabels.IsGamepadButtonDown(gamepad, button),
    () => _flat.IsGamepadButtonDown(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button has been released once
  bool IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => _debugLabels.IsGamepadButtonReleased(gamepad, button),
    () => _flat.IsGamepadButtonReleased(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button is NOT being pressed
  bool IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => _debugLabels.IsGamepadButtonUp(gamepad, button),
    () => _flat.IsGamepadButtonUp(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Get the last gamepad button pressed
  GamepadButton GetGamepadButtonPressed() => run(
    () => _debugLabels.GetGamepadButtonPressed(),
    () => .fromValue(_flat.GetGamepadButtonPressed()),
  );

  /// Get gamepad axis count for a gamepad
  int GetGamepadAxisCount(
    num gamepad,
  ) => run(
    () => _debugLabels.GetGamepadAxisCount(gamepad),
    () => _flat.GetGamepadAxisCount(
      gamepad.toInt(),
    ),
  );

  /// Get axis movement value for a gamepad axis
  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => run(
    () => _debugLabels.GetGamepadAxisMovement(gamepad, axis),
    () => _flat.GetGamepadAxisMovement(
      gamepad.toInt(),
      axis.value,
    ),
  );

  /// Set internal gamepad mappings (SDL_GameControllerDB)
  int SetGamepadMappings(
    String mappings,
  ) => run(
    () => _debugLabels.SetGamepadMappings(mappings),
    () => _flat.SetGamepadMappings(
      $.String$.ValueOrNull(mappings),
    ),
  );
    
  /// Set gamepad vibration for both motors (duration in seconds)
  void SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => run(
    () => _debugLabels.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration),
    () => _flat.SetGamepadVibration(
      gamepad.toInt(),
      leftMotor.toDouble(),
      rightMotor.toDouble(),
      duration.toDouble(),
    ),
  );

  /// Check if a mouse button has been pressed once
  bool IsMouseButtonPressed(
    MouseButton button,
  ) => run(
    () => _debugLabels.IsMouseButtonPressed(button),
    () => _flat.IsMouseButtonPressed(
      button.value,
    ),
  );

  /// Check if a mouse button is being pressed
  bool IsMouseButtonDown(
    MouseButton button,
  ) => run(
    () => _debugLabels.IsMouseButtonDown(button),
    () => _flat.IsMouseButtonDown(
      button.value,
    ),
  );

  /// Check if a mouse button has been released once
  bool IsMouseButtonReleased(
    MouseButton button,
  ) => run(
    () => _debugLabels.IsMouseButtonReleased(button),
    () => _flat.IsMouseButtonReleased(
      button.value,
    ),
  );

  /// Check if a mouse button is NOT being pressed
  bool IsMouseButtonUp(
    MouseButton button,
  ) => run(
    () => _debugLabels.IsMouseButtonUp(button),
    () => _flat.IsMouseButtonUp(
      button.value,
    ),
  );

  /// Get mouse position X
  int GetMouseX() => run(
    () => _debugLabels.GetMouseX(),
    () => _flat.GetMouseX(),
  );

  /// Get mouse position Y
  int GetMouseY() => run(
    () => _debugLabels.GetMouseY(),
    () => _flat.GetMouseY(),
  );

  /// Get mouse position XY
  Vector2D GetMousePosition() => run(
    () => _debugLabels.GetMousePosition(),
    () => _flat.GetMousePosition(),
  );

  /// Get mouse delta between frames
  Vector2D GetMouseDelta() => run(
    () => _debugLabels.GetMouseDelta(),
    () => _flat.GetMouseDelta(),
  );

  /// Set mouse position XY
  void SetMousePosition(
    num x,
    num y,
  ) => run(
    () => _debugLabels.SetMousePosition(x, y),
    () => _flat.SetMousePosition(
      x.toInt(),
      y.toInt(),
    ),
  );

  /// Set mouse offset
  void SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => run(
    () => _debugLabels.SetMouseOffset(offsetX, offsetY),
    () => _flat.SetMouseOffset(
      offsetX.toInt(),
      offsetY.toInt(),
    ),
  );

  /// Set mouse scaling
  void SetMouseScale(
    num scaleX,
    num scaleY,
  ) => run(
    () => _debugLabels.SetMouseScale(scaleX, scaleY),
    () => _flat.SetMouseScale(
      scaleX.toDouble(),
      scaleY.toDouble(),
    ),
  );

  /// Get mouse wheel movement for X or Y, whichever is larger
  double GetMouseWheelMove() => run(
    () => _debugLabels.GetMouseWheelMove(),
    () => _flat.GetMouseWheelMove(),
  );

  /// Get mouse wheel movement for both X and Y
  Vector2D GetMouseWheelMoveV() => run(
    () => _debugLabels.GetMouseWheelMoveV(),
    () => _flat.GetMouseWheelMoveV(),
  );

  /// Set mouse cursor
  void SetMouseCursor(
    MouseCursor cursor,
  ) => run(
    () => _debugLabels.SetMouseCursor(cursor),
    () => _flat.SetMouseCursor(
      cursor.value,
    ),
  );

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX() => run(
    () => _debugLabels.GetTouchX(),
    () => _flat.GetTouchX(),
  );

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY() => run(
    () => _debugLabels.GetTouchY(),
    () => _flat.GetTouchY(),
  );

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2D GetTouchPosition(
    num index,
  ) => run(
    () => _debugLabels.GetTouchPosition(index),
    () => _flat.GetTouchPosition(
      index.toInt(),
    ),
  );

  /// Get touch point identifier for given index
  int GetTouchPointId(
    num index,
  ) => run(
    () => _debugLabels.GetTouchPointId(index),
    () => _flat.GetTouchPointId(
      index.toInt(),
    ),
  );

  /// Get number of touch points
  int GetTouchPointCount() => run(
    () => _debugLabels.GetTouchPointCount(),
    () => _flat.GetTouchPointCount(),
  );

  /// Enable a set of gestures using flags [Gesture]
  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => run(
    () => _debugLabels.SetGesturesEnabled(flags),
    () => _flat.SetGesturesEnabled(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );

  /// Check if a gesture have been detected
  bool IsGestureDetected(
    Gesture key,
  ) => run(
    () => _debugLabels.IsGestureDetected(key),
    () => _flat.IsGestureDetected(
      key.value,
    ),
  );

  /// Get latest detected gesture
  Gesture GetGestureDetected() => run(
    () => _debugLabels.GetGestureDetected(),
    () => .fromValue(_flat.GetGestureDetected()),
  );

  /// Get gesture hold time in seconds
  double GetGestureHoldDuration() => run(
    () => _debugLabels.GetGestureHoldDuration(),
    () => _flat.GetGestureHoldDuration(),
  );

  /// Get gesture drag vector
  Vector2D GetGestureDragVector() => run(
    () => _debugLabels.GetGestureDragVector(),
    () => _flat.GetGestureDragVector(),
  );

  /// Get gesture drag angle
  double GetGestureDragAngle() => run(
    () => _debugLabels.GetGestureDragAngle(),
    () => _flat.GetGestureDragAngle(),
  );

  /// Get gesture pinch delta
  Vector2D GetGesturePinchVector() => run(
    () => _debugLabels.GetGesturePinchVector(),
    () => _flat.GetGesturePinchVector(),
  );

  /// Get gesture pinch angle
  double GetGesturePinchAngle() => run(
    () => _debugLabels.GetGesturePinchAngle(),
    () => _flat.GetGesturePinchAngle(),
  );

  /// Process gesture event and translate it into gestures
  void ProcessGestureEvent(
    GestureEventD event,
  ) => run(
    () => _debugLabels.ProcessGestureEvent(event),
    () => _flat.ProcessGestureEvent(
      event,
    ),
  );
  
  /// Update gestures detected (must be called every frame)
  void UpdateGestures() => run(
    () => _debugLabels.UpdateGestures(),
    () => _flat.UpdateGestures(),
  );
    
  /// Update camera position for selected mode
  void UpdateCamera(
    Camera3DD camera,
    CameraMode mode,
  ) => run(
    () => _debugLabels.UpdateCamera(camera, mode),
    () => _flat.UpdateCamera(
      $.Camera3D$.RefUnique(camera),
      mode.value,
    ),
  );

  /// Update camera movement/rotation
  void UpdateCameraPro(
    Camera3DD camera,
    Vector3D movement,
    Vector3D rotation,
    num zoom,
  ) => run(
    () => _debugLabels.UpdateCameraPro(camera, movement, rotation, zoom),
    () => _flat.UpdateCameraPro(
      $.Camera3D$.Ref1(camera),
      movement,
      rotation,
      zoom.toDouble(),
    ),
  );

  /// Set texture and rectangle to be used on shapes drawing
  void SetShapesTexture(
    TextureD texture,
    RectangleD source,
  ) => run(
    () => _debugLabels.SetShapesTexture(texture, source),
    () => _flat.SetShapesTexture(
      texture,
      source,
    ),
  );

  /// Get texture that is used for shapes drawing
  TextureD GetShapesTexture() => run(
    () => _debugLabels.GetShapesTexture(),
    () => _flat.GetShapesTexture(),
  );

  /// Get texture source rectangle that is used for shapes drawing
  RectangleD GetShapesTextureRectangle() => run(
    () => _debugLabels.GetShapesTextureRectangle(),
    () => _flat.GetShapesTextureRectangle(),
  );

  /// Draw a pixel using geometry [Can be slow, use with care]
  void DrawPixel(
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPixel(posX, posY, color),
    () => _flat.DrawPixel(
      posX.toInt(),
      posY.toInt(),
      color,
    ),
  );

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPixelV(position, color),
    () => _flat.DrawPixelV(
      position,
      color,
    ),
  );
    
  /// Draw a line
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLine(startPosX, startPosY, endPosX, endPosY, color),
    () => _flat.DrawLine(
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      color,
    ),
  );

  /// Draw a line (using gl lines)
  void DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineV(startPos, endPos, color),
    () => _flat.DrawLineV(
      startPos,
      endPos,
      color,
    ),
  );

  /// Draw a line (using triangles/quads)
  void DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineEx(startPos, endPos, thick, color),
    () => _flat.DrawLineEx(
      startPos,
      endPos,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineStrip(points, color),
    () => _flat.DrawLineStrip(
      $.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineBezier(startPos, endPos, thick, color),
    () => _flat.DrawLineBezier(
      startPos,
      endPos,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw a dashed line
  void DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    num dashSize,
    num spaceSize,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color),
    () => _flat.DrawLineDashed(
      startPos,
      endPos,
      dashSize.toInt(),
      spaceSize.toInt(),
      color,
    ),
  );

  /// Draw a color-filled circle
  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircle(centerX, centerY, radius, color),
    () => _flat.DrawCircle(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      color,
    ),
  );

  /// Draw a piece of a circle
  void DrawCircleSector(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleSector(center, radius, startAngle, endAngle, segments, color),
    () => _flat.DrawCircleSector(
      center,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw circle sector outline
  void DrawCircleSectorLines(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color),
    () => _flat.DrawCircleSectorLines(
      center,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw a gradient-filled circle
  void DrawCircleGradient(
    Vector2D center,
    num radius,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => _debugLabels.DrawCircleGradient(center, radius, inner, outer),
    () => _flat.DrawCircleGradient(
      center,
      radius.toDouble(),
      inner,
      outer,
    ),
  );

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleV(center, radius, color),
    () => _flat.DrawCircleV(
      center,
      radius.toDouble(),
      color,
    ),
  );

  /// Draw circle outline
  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleLines(centerX, centerY, radius, color),
    () => _flat.DrawCircleLines(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      color,
    ),
  );

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleLinesV(center, radius, color),
    () => _flat.DrawCircleLinesV(
      center,
      radius.toDouble(),
      color,
    ),
  );
    
  /// Draw ellipse
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawEllipse(centerX, centerY, radiusH, radiusV, color),
    () => _flat.DrawEllipse(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse (Vector version)
  void DrawEllipseV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawEllipseV(center, radiusH, radiusV, color),
    () => _flat.DrawEllipseV(
      center,
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse outline
  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color),
    () => _flat.DrawEllipseLines(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse outline (Vector version)
  void DrawEllipseLinesV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawEllipseLinesV(center, radiusH, radiusV, color),
    () => _flat.DrawEllipseLinesV(
      center,
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
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
  ) => run(
    () => _debugLabels.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color),
    () => _flat.DrawRing(
      center,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
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
  ) => run(
    () => _debugLabels.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color),
    () => _flat.DrawRingLines(
      center,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw a color-filled rectangle
  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangle(posX, posY, width, height, color),
    () => _flat.DrawRectangle(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Draw a color-filled rectangle (Vector version)
  void DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleV(position, size, color),
    () => _flat.DrawRectangleV(
      position,
      size,
      color,
    ),
  );

  /// Draw a color-filled rectangle
  void DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleRec(rec, color),
    () => _flat.DrawRectangleRec(
      rec,
      color,
    ),
  );
    
  /// Draw a color-filled rectangle with pro parameters
  void DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    num rotation,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectanglePro(rec, origin, rotation, color),
    () => _flat.DrawRectanglePro(
      rec,
      origin,
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorD top,
    ColorD bottom,
  ) => run(
    () => _debugLabels.DrawRectangleGradientV(posX, posY, width, height, top, bottom),
    () => _flat.DrawRectangleGradientV(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      top,
      bottom,
    ),
  );

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorD left,
    ColorD right,
  ) => run(
    () => _debugLabels.DrawRectangleGradientH(posX, posY, width, height, left, right),
    () => _flat.DrawRectangleGradientH(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      left,
      right,
    ),
  );

  /// Draw a gradient-filled rectangle with custom vertex colors
  void DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  ) => run(
    () => _debugLabels.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight),
    () => _flat.DrawRectangleGradientEx(
      rec,
      topLeft,
      bottomLeft,
      topRight,
      bottomRight,
    ),
  );

  /// Draw rectangle outline
  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleLines(posX, posY, width, height, color),
    () => _flat.DrawRectangleLines(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(
    RectangleD rec,
    num lineThick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleLinesEx(rec, lineThick, color),
    () => _flat.DrawRectangleLinesEx(
      rec,
      lineThick.toDouble(),
      color,
    ),
  );

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleRounded(rec, roundness, segments, color),
    () => _flat.DrawRectangleRounded(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleRoundedLines(rec, roundness, segments, color),
    () => _flat.DrawRectangleRoundedLines(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(
    RectangleD rec,
    num roundness,
    num segments,
    num lineThick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color),
    () => _flat.DrawRectangleRoundedLinesEx(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      lineThick.toDouble(),
      color,
    ),
  );
    
  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangle(v1, v2, v3, color),
    () => _flat.DrawTriangle(
      v1,
      v2,
      v3,
      color,
    ),
  );

  /// Draw triangle outline (vertex in counter-clockwise order!)
  void DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangleLines(v1, v2, v3, color),
    () => _flat.DrawTriangleLines(
      v1,
      v2,
      v3,
      color,
    ),
  );

  /// Draw a triangle fan defined by points (first vertex is the center)
  void DrawTriangleFan(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangleFan(points, color),
    () => _flat.DrawTriangleFan(
      $.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangleStrip(points, color),
    () => _flat.DrawTriangleStrip(
      $.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw a regular polygon (Vector version)
  void DrawPoly(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPoly(center, sides, radius, rotation, color),
    () => _flat.DrawPoly(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a polygon outline of n sides
  void DrawPolyLines(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPolyLines(center, sides, radius, rotation, color),
    () => _flat.DrawPolyLines(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color),
    () => _flat.DrawPolyLinesEx(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      lineThick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineLinear(points, thick, color),
    () => _flat.DrawSplineLinear(
      $.Vector2$.ArrayStruct(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineBasis(points, thick, color),
    () => _flat.DrawSplineBasis(
      $.Vector2$.ArrayStruct(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineCatmullRom(points, thick, color),
    () => _flat.DrawSplineCatmullRom(
      $.Vector2$.ArrayStruct(points),
      points.length, 
      thick.toDouble(), 
      color,
    ),
  );

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineBezierQuadratic(points, thick, color),
    () => _flat.DrawSplineBezierQuadratic(
      $.Vector2$.ArrayStruct(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineBezierCubic(points, thick, color),
    () => _flat.DrawSplineBezierCubic(
      $.Vector2$.ArrayStruct(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );
    
  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentLinear(p1, p2, thick, color),
    () => _flat.DrawSplineSegmentLinear(
      p1,
      p2,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color),
    () => _flat.DrawSplineSegmentBasis(
      p1,
      p2,
      p3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color),
    () => _flat.DrawSplineSegmentCatmullRom(
      p1,
      p2,
      p3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color),
    () => _flat.DrawSplineSegmentBezierQuadratic(
      p1,
      c2,
      p3,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color),
    () => _flat.DrawSplineSegmentBezierCubic(
      p1,
      c2,
      c3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Get (evaluate) spline point: Linear
  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointLinear(startPos, endPos, t),
    () => _flat.GetSplinePointLinear(
      startPos,
      endPos,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: B-Spline
  Vector2D GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointBasis(p1, p2, p3, p4, t),
    () => _flat.GetSplinePointBasis(
      p1,
      p2,
      p3,
      p4,
      t.toDouble(),
    ),
  );
    
  /// Get (evaluate) spline point: Catmull-Rom
  Vector2D GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointCatmullRom(p1, p2, p3, p4, t),
    () => _flat.GetSplinePointCatmullRom(
      p1,
      p2,
      p3,
      p4,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointBezierQuad(p1, c2, p3, t),
    () => _flat.GetSplinePointBezierQuad(
      p1,
      c2,
      p3,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2D GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointBezierCubic(p1, c2, c3, p4, t),
    () => _flat.GetSplinePointBezierCubic(
      p1,
      c2,
      c3,
      p4,
      t.toDouble(),
    ),
  );

  /// Check collision between two rectangles
  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => _debugLabels.CheckCollisionRecs(rec1, rec2),
    () => _flat.CheckCollisionRecs(
      rec1,
      rec2,
    ),
  );

  /// Check collision between two circles
  bool CheckCollisionCircles(
    Vector2D center1,
    num radius1,
    Vector2D center2,
    num radius2,
  ) => run(
    () => _debugLabels.CheckCollisionCircles(center1, radius1, center2, radius2),
    () => _flat.CheckCollisionCircles(
      center1,
      radius1.toDouble(),
      center2,
      radius2.toDouble(),
    ),
  );

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(
    Vector2D center,
    num radius,
    RectangleD rec,
  ) => run(
    () => _debugLabels.CheckCollisionCircleRec(center, radius, rec),
    () => _flat.CheckCollisionCircleRec(
      center,
      radius.toDouble(),
      rec,
    ),
  );

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(
    Vector2D center,
    num radius,
    Vector2D p1,
    Vector2D p2,
  ) => run(
    () => _debugLabels.CheckCollisionCircleLine(center, radius, p1, p2),
    () => _flat.CheckCollisionCircleLine(
      center,
      radius.toDouble(),
      p1,
      p2,
    ),
  );

  /// Check if point is inside rectangle
  bool CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => run(
    () => _debugLabels.CheckCollisionPointRec(point, rec),
    () => _flat.CheckCollisionPointRec(
      point,
      rec,
    ),
  );
    
  /// Check if point is inside circle
  bool CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    num radius,
  ) => run(
    () => _debugLabels.CheckCollisionPointCircle(point, center, radius),
    () => _flat.CheckCollisionPointCircle(
      point,
      center,
      radius.toDouble(),
    ),
  );

  /// Check if point is inside a triangle
  bool CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  ) => run(
    () => _debugLabels.CheckCollisionPointTriangle(point, p1, p2, p3),
    () => _flat.CheckCollisionPointTriangle(
      point,
      p1,
      p2,
      p3,
    ),
  );

  /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  bool CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    num threshold,
  ) => run(
    () => _debugLabels.CheckCollisionPointLine(point, p1, p2, threshold),
    () => _flat.CheckCollisionPointLine(
      point,
      p1,
      p2,
      threshold.toInt(),
    ),
  );

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(
    Vector2D point,
    List<Vector2D> points,
  ) => run(
    () => _debugLabels.CheckCollisionPointPoly(point, points),
    () => _flat.CheckCollisionPointPoly(
      point,
      $.Vector2$.ArrayStruct(points),
      points.length,
    ),
  );

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  (bool result, Vector2D collisionPoint) CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
  ) => run(
    () => _debugLabels.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2),
    () {
      final collisionPoint = $.Vector2$.Ref5();
      final result = _flat.CheckCollisionLines(
        startPos1,
        endPos1,
        startPos2,
        endPos2,
        collisionPoint,
      );
      return (result, collisionPoint.ref);
    },
  );

  /// Get collision rectangle for two rectangles collision
  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => _debugLabels.GetCollisionRec(rec1, rec2),
    () => _flat.GetCollisionRec(
      rec1,
      rec2,
    ),
  );

  /// Load image from file into CPU memory (RAM)
  ImageD LoadImage(
    String fileName,
  ) => run(
    () => _debugLabels.LoadImage(fileName),
    () => _flat.LoadImage(
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load image from RAW file data
  ImageD LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => run(
    () => _debugLabels.LoadImageRaw(fileName, width, height, format, headerSize),
    () => _flat.LoadImageRaw(
      $.String$.ValueOrNull(fileName),
      width.toInt(),
      height.toInt(),
      format.value,
      headerSize.toInt(),
    ),
  );

  /// Load image sequence from file (frames appended to image.data)
  ImageD LoadImageAnim(
    String fileName,
  ) => run(
    () => _debugLabels.LoadImageAnim(fileName),
    () {
      final frames = $.Int$.Ref1();
      final image = _flat.LoadImageAnim(
        $.String$.ValueOrNull(fileName),
        frames,
      );
      image.frameCount = frames.value;
      return image;
    },
  );

  /// Load image sequence from memory buffer
  ImageD LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => _debugLabels.LoadImageAnimFromMemory(fileType, fileData),
    () {
      final frames = $.Int$.Ref1();
      final image = _flat.LoadImageAnimFromMemory(
        $.String$.ValueOrNull(fileType),
        $.UnsignedChar$.Array(fileData),
        fileData.length,
        frames,
      );
      image.frameCount = frames.value;
      return image;
    },
  );

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  ImageD LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => _debugLabels.LoadImageFromMemory(fileType, fileData),
    () => _flat.LoadImageFromMemory(
      $.String$.ValueOrNull(fileType),
      $.UnsignedChar$.Array(fileData),
      fileData.length,
    ),
  );

  /// Load image from GPU texture data
  ImageD LoadImageFromTexture(
    TextureD texture,
  ) => run(
    () => _debugLabels.LoadImageFromTexture(texture),
    () => _flat.LoadImageFromTexture(
      texture,
    ),
  );

  /// Load image from screen buffer and (screenshot)
  ImageD LoadImageFromScreen() => run(
    () => _debugLabels.LoadImageFromScreen(),
    () => _flat.LoadImageFromScreen(),
  );

  /// Check if an image is valid (data and parameters)
  bool IsImageValid(
    ImageD image,
  ) => run(
    () => _debugLabels.IsImageValid(image),
    () => _flat.IsImageValid(
      image,
    ),
  );

  /// Unload image from CPU memory (RAM)
  void UnloadImage(
    ImageD image,
  ) => run(
    () => _debugLabels.UnloadImage(image),
    () => _flat.UnloadImage(
      image,
    ),
  );

  /// Export image data to file, returns true on success
  bool ExportImage(
    ImageD image,
    String fileName,
  ) => run(
    () => _debugLabels.ExportImage(image, fileName),
    () => _flat.ExportImage(
      image,
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Export image to memory buffer
  (MemoryPointer<RUint8> dataPtr, int dataSize) ExportImageToMemory(
    ImageD image,
    String fileType,
  ) => run(
    () => _debugLabels.ExportImageToMemory(image, fileType),
    () {
      final dataSize = $.Int$.Ref1();
      final dataPtr = _flat.ExportImageToMemory(
        image,
        $.String$.ValueOrNull(fileType),
        dataSize,
      );
      return (dataPtr, dataSize.value);
    },
  );

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(
    ImageD image,
    String fileName,
  ) => run(
    () => _debugLabels.ExportImageAsCode(image, fileName),
    () => _flat.ExportImageAsCode(
      image,
      $.String$.ValueOrNull(fileName),
    ),
  );

  /// Generate image: plain color
  ImageD GenImageColor(
    num width,
    num height,
    ColorD color,
  ) => run(
    () => _debugLabels.GenImageColor(width, height, color),
    () => _flat.GenImageColor(
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  ImageD GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorD start,
    ColorD end,
  ) => run(
    () => _debugLabels.GenImageGradientLinear(width, height, direction, start, end),
    () => _flat.GenImageGradientLinear(
      width.toInt(),
      height.toInt(),
      direction.toInt(),
      start,
      end,
    ),
  );

  /// Generate image: radial gradient
  ImageD GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => _debugLabels.GenImageGradientRadial(width, height, density, inner, outer),
    () => _flat.GenImageGradientRadial(
      width.toInt(),
      height.toInt(),
      density.toDouble(),
      inner,
      outer,
    ),
  );

  /// Generate image: square gradient
  ImageD GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => _debugLabels.GenImageGradientSquare(width, height, density, inner, outer),
    () => _flat.GenImageGradientSquare(
      width.toInt(),
      height.toInt(),
      density.toDouble(),
      inner,
      outer,
    ),
  );

  /// Generate image: checked
  ImageD GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorD col1,
    ColorD col2,
  ) => run(
    () => _debugLabels.GenImageChecked(width, height, checksX, checksY, col1, col2),
    () => _flat.GenImageChecked(
      width.toInt(),
      height.toInt(),
      checksX.toInt(),
      checksY.toInt(),
      col1,
      col2,
    ),
  );

  /// Generate image: white noise
  ImageD GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => run(
    () => _debugLabels.GenImageWhiteNoise(width, height, factor),
    () => _flat.GenImageWhiteNoise(
      width.toInt(),
      height.toInt(),
      factor.toDouble(),
    ),
  );

  /// Generate image: perlin noise
  ImageD GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => run(
    () => _debugLabels.GenImagePerlinNoise(width, height, offsetX, offsetY, scale),
    () => _flat.GenImagePerlinNoise(
      width.toInt(),
      height.toInt(),
      offsetX.toInt(),
      offsetY.toInt(),
      scale.toDouble(),
    ),
  );
    
  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  ImageD GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => run(
    () => _debugLabels.GenImageCellular(width, height, tileSize),
    () => _flat.GenImageCellular(
      width.toInt(),
      height.toInt(),
      tileSize.toInt(),
    ),
  );

  /// Generate image: grayscale image from text data
  ImageD GenImageText(
    num width,
    num height,
    String text,
  ) => run(
    () => _debugLabels.GenImageText(width, height, text),
    () => _flat.GenImageText(
      width.toInt(),
      height.toInt(),
      $.String$.ValueOrNull(text),
    ),
  );

  /// Create an image duplicate (useful for transformations)
  ImageD ImageCopy(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageCopy(image),
    () => _flat.ImageCopy(
      image,
    ),
  );

  /// Create an image from another image piece
  ImageD ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => run(
    () => _debugLabels.ImageFromImage(image, rec),
    () => _flat.ImageFromImage(
      image,
      rec,
    ),
  );

  /// Create an image from a selected channel of another image (GRAYSCALE)
  ImageD ImageFromChannel(
    ImageD image,
    num selectedChannel,
  ) => run(
    () => _debugLabels.ImageFromChannel(image, selectedChannel),
    () => _flat.ImageFromChannel(
      image,
      selectedChannel.toInt(),
    ),
  );

  /// Create an image from text (default font)
  ImageD ImageText(
    String text,
    num fontSize,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageText(text, fontSize, color),
    () => _flat.ImageText(
      $.String$.ValueOrNull(text),
      fontSize.toInt(),
      color,
    ),
  );

  /// Create an image from text (custom sprite font)
  ImageD ImageTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => _debugLabels.ImageTextEx(font, text, fontSize, spacing, tint),
    () => _flat.ImageTextEx(
      font,
      $.String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Convert image data to desired format
  void ImageFormat(
    ImageD image,
    PixelFormat newFormat,
  ) => run(
    () => _debugLabels.ImageFormat(image, newFormat),
    () => _flat.ImageFormat(
      $.Image$.Ref1(image),
      newFormat.value,
    ),
  );
    
  /// Convert image to POT (power-of-two)
  void ImageToPOT(
    ImageD image,
    ColorD fill,
  ) => run(
    () => _debugLabels.ImageToPOT(image, fill),
    () => _flat.ImageToPOT(
      $.Image$.Ref1(image),
      fill,
    ),
  );

  /// Crop an image to a defined rectangle
  void ImageCrop(
    ImageD image,
    RectangleD crop,
  ) => run(
    () => _debugLabels.ImageCrop(image, crop),
    () => _flat.ImageCrop(
      $.Image$.Ref1(image),
      crop,
    ),
  );

  /// Crop image depending on alpha value
  void ImageAlphaCrop(
    ImageD image,
    num threshold,
  ) => run(
    () => _debugLabels.ImageAlphaCrop(image, threshold),
    () => _flat.ImageAlphaCrop(
      $.Image$.Ref1(image),
      threshold.toDouble(),
    ),
  );

  /// Clear alpha channel to desired color
  void ImageAlphaClear(
    ImageD image,
    ColorD color,
    num threshold,
  ) => run(
    () => _debugLabels.ImageAlphaClear(image, color, threshold),
    () => _flat.ImageAlphaClear(
      $.Image$.Ref1(image),
      color,
      threshold.toDouble(),
    ),
  );

  /// Apply alpha mask to image
  void ImageAlphaMask(
    ImageD image,
    ImageD alphaMask,
  ) => run(
    () => _debugLabels.ImageAlphaMask(image, alphaMask),
    () => _flat.ImageAlphaMask(
      $.Image$.Ref1(image),
      alphaMask,
    ),
  );

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageAlphaPremultiply(image),
    () => _flat.ImageAlphaPremultiply(
      $.Image$.Ref1(image),
    ),
  );

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(
    ImageD image,
    num blurSize,
  ) => run(
    () => _debugLabels.ImageBlurGaussian(image, blurSize),
    () => _flat.ImageBlurGaussian(
      $.Image$.Ref1(image),
      blurSize.toInt(),
    ),
  );

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(
    ImageD image,
    List<double> kernel,
  ) => run(
    () => _debugLabels.ImageKernelConvolution(image, kernel),
    () => _flat.ImageKernelConvolution(
      $.Image$.Ref1(image),
      $.Float32$.Array(kernel),
      kernel.length,
    ),
  );

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => run(
    () => _debugLabels.ImageResize(image, newWidth, newHeight),
    () => _flat.ImageResize(
      $.Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
    ),
  );

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => run(
    () => _debugLabels.ImageResizeNN(image, newWidth, newHeight),
    () => _flat.ImageResizeNN(
      $.Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
    ),
  );
    
  /// Resize canvas and fill with color
  void ImageResizeCanvas(
    ImageD image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorD fill,
  ) => run(
    () => _debugLabels.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill),
    () => _flat.ImageResizeCanvas(
      $.Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
      offsetX.toInt(),
      offsetY.toInt(),
      fill,
    ),
  );

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageMipmaps(image),
    () => _flat.ImageMipmaps(
      $.Image$.Ref1(image),
    ),
  );

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(
    ImageD image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => run(
    () => _debugLabels.ImageDither(image, rBpp, gBpp, bBpp, aBpp),
    () => _flat.ImageDither(
      $.Image$.Ref1(image),
      rBpp.toInt(),
      gBpp.toInt(),
      bBpp.toInt(),
      aBpp.toInt(),
    ),
  );

  /// Flip image vertically
  void ImageFlipVertical(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageFlipVertical(image),
    () => _flat.ImageFlipVertical(
      $.Image$.Ref1(image),
    ),
  );

  /// Flip image horizontally
  void ImageFlipHorizontal(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageFlipHorizontal(image),
    () => _flat.ImageFlipHorizontal(
      $.Image$.Ref1(image),
    ),
  );

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(
    ImageD image,
    num degrees,
  ) => run(
    () => _debugLabels.ImageRotate(image, degrees),
    () => _flat.ImageRotate(
      $.Image$.Ref1(image),
      degrees.toInt(),
    ),
  );

  /// Rotate image clockwise 90deg
  void ImageRotateCW(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageRotateCW(image),
    () => _flat.ImageRotateCW(
      $.Image$.Ref1(image),
    ),
  );

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageRotateCCW(image),
    () => _flat.ImageRotateCCW(
      $.Image$.Ref1(image),
    ),
  );
    
  /// Modify image color: tint
  void ImageColorTint(
    ImageD image,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageColorTint(image, color),
    () => _flat.ImageColorTint(
      $.Image$.Ref1(image),
      color,
    ),
  );

  /// Modify image color: invert
  void ImageColorInvert(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageColorInvert(image),
    () => _flat.ImageColorInvert(
      $.Image$.Ref1(image),
    ),
  );

  /// Modify image color: grayscale
  void ImageColorGrayscale(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageColorGrayscale(image),
    () => _flat.ImageColorGrayscale(
      $.Image$.Ref1(image),
    ),
  );

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(
    ImageD image,
    num contrast,
  ) => run(
    () => _debugLabels.ImageColorContrast(image, contrast),
    () => _flat.ImageColorContrast(
      $.Image$.Ref1(image),
      contrast.toDouble(),
    ),
  );

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(
    ImageD image,
    num brightness,
  ) => run(
    () => _debugLabels.ImageColorBrightness(image, brightness),
    () => _flat.ImageColorBrightness(
      $.Image$.Ref1(image),
      brightness.toInt(),
    ),
  );

  /// Modify image color: replace color
  void ImageColorReplace(
    ImageD image,
    ColorD color,
    ColorD replace,
  ) => run(
    () => _debugLabels.ImageColorReplace(image, color, replace),
    () => _flat.ImageColorReplace(
      $.Image$.Ref1(image),
      color,
      replace,
    ),
  );

  /// Load color data from image as a Color array (RGBA - 32bit)
  List<ColorD> LoadImageColors(
    ImageD image,
  ) => run(
    () => _debugLabels.LoadImageColors(image),
    () {
      final colors = _flat.LoadImageColors(
        image,
      );
      try {
        return colors.readArray(image.width * image.height, owned: false);
      } finally {
        _flat.UnloadImageColors(colors);
      }
    },
  );
    
  /// Load colors palette from image as a Color array (RGBA - 32bit)
  List<ColorD> LoadImagePalette(
    ImageD image,
    num maxPaletteSize,
  ) => run(
    () => _debugLabels.LoadImagePalette(image, maxPaletteSize),
    () {
      final colorCount = $.Int$.Ref1();
      final colors = _flat.LoadImagePalette(
        image,
        maxPaletteSize.toInt(),
        colorCount,
      );
      try {
        return colors.readArray(colorCount.value, owned: false);
      } finally {
        _flat.UnloadImagePalette(colors);
      }
    },
  );

  /// Get image alpha border rectangle
  RectangleD GetImageAlphaBorder(
    ImageD image,
    num threshold,
  ) => run(
    () => _debugLabels.GetImageAlphaBorder(image, threshold),
    () => _flat.GetImageAlphaBorder(
      image,
      threshold.toDouble(),
    ),
  );

  /// Get image pixel color at (x, y) position
  ColorD GetImageColor(
    ImageD image,
    num x,
    num y,
  ) => run(
    () => _debugLabels.GetImageColor(image, x, y),
    () => _flat.GetImageColor(
      image,
      x.toInt(),
      y.toInt(),
    ),
  );

  /// Clear image background with given color
  void ImageClearBackground(
    ImageD dst,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageClearBackground(dst, color),
    () => _flat.ImageClearBackground(
      $.Image$.Ref1(dst),
      color,
    ),
  );

  /// Draw pixel within an image
  void ImageDrawPixel(
    ImageD dst,
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawPixel(dst, posX, posY, color),
    () => _flat.ImageDrawPixel(
      $.Image$.Ref1(dst),
      posX.toInt(),
      posY.toInt(),
      color,
    ),
  );

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(
    ImageD dst,
    Vector2D position,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawPixelV(dst, position, color),
    () => _flat.ImageDrawPixelV(
      $.Image$.Ref1(dst),
      position,
      color,
    ),
  );
    
  /// Draw line within an image
  void ImageDrawLine(
    ImageD dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color),
    () => _flat.ImageDrawLine(
      $.Image$.Ref1(dst),
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      color,
    ),
  );

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawLineV(dst, start, end, color),
    () => _flat.ImageDrawLineV(
      $.Image$.Ref1(dst),
      start,
      end,
      color,
    ),
  );

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawLineEx(dst, start, end, thick, color),
    () => _flat.ImageDrawLineEx(
      $.Image$.Ref1(dst),
      start,
      end,
      thick.toInt(),
      color,
    ),
  );

  /// Draw a filled circle within an image
  void ImageDrawCircle(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawCircle(dst, centerX, centerY, radius, color),
    () => _flat.ImageDrawCircle(
      $.Image$.Ref1(dst),
      centerX.toInt(),
      centerY.toInt(),
      radius.toInt(),
      color,
    ),
  );

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawCircleV(dst, center, radius, color),
    () => _flat.ImageDrawCircleV(
      $.Image$.Ref1(dst),
      center,
      radius.toInt(),
      color,
    ),
  );

  /// Draw circle outline within an image
  void ImageDrawCircleLines(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawCircleLines(dst, centerX, centerY, radius, color),
    () => _flat.ImageDrawCircleLines(
      $.Image$.Ref1(dst),
      centerX.toInt(),
      centerY.toInt(),
      radius.toInt(),
      color,
    ),
  );

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawCircleLinesV(dst, center, radius, color),
    () => _flat.ImageDrawCircleLinesV(
      $.Image$.Ref1(dst),
      center,
      radius.toInt(),
      color,
    ),
  );

  /// Draw rectangle within an image
  void ImageDrawRectangle(
    ImageD dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawRectangle(dst, posX, posY, width, height, color),
    () => _flat.ImageDrawRectangle(
      $.Image$.Ref1(dst),
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );
    
  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(
    ImageD dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawRectangleV(dst, position, size, color),
    () => _flat.ImageDrawRectangleV(
      $.Image$.Ref1(dst),
      position,
      size,
      color,
    ),
  );

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(
    ImageD dst,
    RectangleD rec,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawRectangleRec(dst, rec, color),
    () => _flat.ImageDrawRectangleRec(
      $.Image$.Ref1(dst),
      rec,
      color,
    ),
  );

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(
    ImageD dst,
    RectangleD rec,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawRectangleLines(dst, rec, thick, color),
    () => _flat.ImageDrawRectangleLines(
      $.Image$.Ref1(dst),
      rec,
      thick.toInt(),
      color,
    ),
  );

  /// Draw triangle within an image
  void ImageDrawTriangle(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawTriangle(dst, v1, v2, v3, color),
    () => _flat.ImageDrawTriangle(
      $.Image$.Ref1(dst),
      v1,
      v2,
      v3,
      color,
    ),
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
  ) => run(
    () => _debugLabels.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3),
    () => _flat.ImageDrawTriangleEx(
      $.Image$.Ref1(dst),
      v1,
      v2,
      v3,
      c1,
      c2,
      c3,
    ),
  );

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawTriangleLines(dst, v1, v2, v3, color),
    () => _flat.ImageDrawTriangleLines(
      $.Image$.Ref1(dst),
      v1,
      v2,
      v3,
      color,
    ),
  );
    
  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawTriangleFan(dst, points, color),
    () => _flat.ImageDrawTriangleFan(
      $.Image$.Ref1(dst),
      $.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawTriangleStrip(dst, points, color),
    () => _flat.ImageDrawTriangleStrip(
      $.Image$.Ref1(dst),
      $.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(
    ImageD dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  ) => run(
    () => _debugLabels.ImageDraw(dst, src, srcRec, dstRec, tint),
    () => _flat.ImageDraw(
      $.Image$.Ref1(dst),
      src,
      srcRec,
      dstRec,
      tint,
    ),
  );

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(
    ImageD dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawText(dst, text, posX, posY, fontSize, color),
    () => _flat.ImageDrawText(
      $.Image$.Ref1(dst),
      $.String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      color,
    ),
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
  ) => run(
    () => _debugLabels.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint),
    () => _flat.ImageDrawTextEx(
      $.Image$.Ref1(dst),
      font,
      $.String$.ValueOrNull(text),
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Load texture from file into GPU memory (VRAM)
  TextureD LoadTexture(
    String fileName,
  ) => run(
    () => _debugLabels.LoadTexture(fileName),
    () => _flat.LoadTexture(
      $.String$.ValueOrNull(fileName),
    ),
  );

  /// Load texture from image data
  TextureD LoadTextureFromImage(
    ImageD image,
  ) => run(
    () => _debugLabels.LoadTextureFromImage(image),
    () => _flat.LoadTextureFromImage(
      image,
    ),
  );

  /// Load cubemap from image, multiple image cubemap layouts supported
  TextureD LoadTextureCubemap(
    ImageD image,
    CubemapLayout layout,
  ) => run(
    () => _debugLabels.LoadTextureCubemap(image, layout),
    () => _flat.LoadTextureCubemap(
      image,
      layout.value,
    ),
  );

  /// Load texture for rendering (framebuffer)
  RenderTextureD LoadRenderTexture(
    num width,
    num height,
  ) => run(
    () => _debugLabels.LoadRenderTexture(width, height),
    () => _flat.LoadRenderTexture(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Check if a texture is valid (loaded in GPU)
  bool IsTextureValid(
    TextureD texture,
  ) => run(
    () => _debugLabels.IsTextureValid(texture),
    () => _flat.IsTextureValid(
      texture,
    ),
  );

  /// Unload texture from GPU memory (VRAM)
  void UnloadTexture(
    TextureD texture,
  ) => run(
    () => _debugLabels.UnloadTexture(texture),
    () {
      _flat.UnloadTexture(
        texture,
      );
      texture.structMarkDisposed();
    },
  );

  /// Check if a render texture is valid (loaded in GPU)
  bool IsRenderTextureValid(
    RenderTextureD target,
  ) => run(
    () => _debugLabels.IsRenderTextureValid(target),
    () => _flat.IsRenderTextureValid(
      target,
    ),
  );

  /// Unload render texture from GPU memory (VRAM)
  void UnloadRenderTexture(
    RenderTextureD target,
  ) => run(
    () => _debugLabels.UnloadRenderTexture(target),
    () => _flat.UnloadRenderTexture(
      target,
    ),
  );

  /// Update GPU texture with new data
  void UpdateTexture(
    TextureD texture,
    Uint8List pixels,
  ) => run(
    () => _debugLabels.UpdateTexture(texture, pixels),
    () => _flat.UpdateTexture(
      texture,
      $.Uint8$.Array(pixels).cast(),
    ),
  );
    
  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    Uint8List pixels,
  ) => run(
    () => _debugLabels.UpdateTextureRec(texture, rec, pixels),
    () => _flat.UpdateTextureRec(
      texture,
      rec,
      $.Uint8$.Array(pixels).cast(),
    ),
  );

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(
    TextureD texture,
  ) => run(
    () => _debugLabels.GenTextureMipmaps(texture),
    () => _flat.GenTextureMipmaps(
      $.Texture$.Ref1(texture),
    ),
  );

  /// Set texture scaling filter mode
  void SetTextureFilter(
    TextureD texture,
    TextureFilter filter,
  ) => run(
    () => _debugLabels.SetTextureFilter(texture, filter),
    () => _flat.SetTextureFilter(
      texture,
      filter.value,
    ),
  );

  /// Set texture wrapping mode
  void SetTextureWrap(
    TextureD texture,
    TextureWrap wrap,
  ) => run(
    () => _debugLabels.SetTextureWrap(texture, wrap),
    () => _flat.SetTextureWrap(
      texture,
      wrap.value,
    ),
  );

  /// Draw a Texture2D
  void DrawTexture(
    TextureD texture,
    num posX,
    num posY,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTexture(texture, posX, posY, tint),
    () => _flat.DrawTexture(
      texture,
      posX.toInt(),
      posY.toInt(),
      tint,
    ),
  );

  /// Draw a Texture2D with position defined as Vector2
  void DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextureV(texture, position, tint),
    () => _flat.DrawTextureV(
      texture,
      position,
      tint,
    ),
  );
    
  /// Draw a Texture2D with extended parameters
  void DrawTextureEx(
    TextureD texture,
    Vector2D position,
    num rotation,
    num scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextureEx(texture, position, rotation, scale, tint),
    () => _flat.DrawTextureEx(
      texture,
      position,
      rotation.toDouble(),
      scale.toDouble(),
      tint,
    ),
  );

  /// Draw a part of a texture defined by a rectangle
  void DrawTextureRec(
    TextureD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextureRec(texture, source, position, tint),
    () => _flat.DrawTextureRec(
      texture,
      source,
      position,
      tint,
    ),
  );

  /// Draw a part of a texture defined by a rectangle with 'pro' parameters
  void DrawTexturePro(
    TextureD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTexturePro(texture, source, dest, origin, rotation, tint),
    () => _flat.DrawTexturePro(
      texture,
      source,
      dest,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint),
    () => _flat.DrawTextureNPatch(
      texture,
      nPatchInfo,
      dest,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );

  /// Check if two colors are equal
  bool ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => run(
    () => _debugLabels.ColorIsEqual(col1, col2),
    () => _flat.ColorIsEqual(
      col1,
      col2,
    ),
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorD Fade(
    ColorD color,
    num alpha,
  ) => run(
    () => _debugLabels.Fade(color, alpha),
    () => _flat.Fade(
      color,
      alpha.toDouble(),
    ),
  );

  /// Get hexadecimal value for a Color (0xRRGGBBAA)
  int ColorToInt(
    ColorD color,
  ) => run(
    () => _debugLabels.ColorToInt(color),
    () => _flat.ColorToInt(
      color,
    ),
  );

  /// Get Color normalized as float [0..1]
  Vector4D ColorNormalize(
    ColorD color,
  ) => run(
    () => _debugLabels.ColorNormalize(color),
    () => _flat.ColorNormalize(
      color,
    ),
  );

  /// Get Color from normalized values [0..1]
  ColorD ColorFromNormalized(
    Vector4D normalized,
  ) => run(
    () => _debugLabels.ColorFromNormalized(normalized),
    () => _flat.ColorFromNormalized(
      normalized,
    ),
  );

  /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  Vector3D ColorToHSV(
    ColorD color,
  ) => run(
    () => _debugLabels.ColorToHSV(color),
    () => _flat.ColorToHSV(
      color,
    ),
  );

  /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  ColorD ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => run(
    () => _debugLabels.ColorFromHSV(hue, saturation, value),
    () => _flat.ColorFromHSV(
      hue.toDouble(),
      saturation.toDouble(),
      value.toDouble(),
    ),
  );

  /// Get color multiplied with another color
  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  ) => run(
    () => _debugLabels.ColorTint(color, tint),
    () => _flat.ColorTint(
      color,
      tint,
    ),
  );

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  ColorD ColorBrightness(
    ColorD color,
    num factor,
  ) => run(
    () => _debugLabels.ColorBrightness(color, factor),
    () => _flat.ColorBrightness(
      color,
      factor.toDouble(),
    ),
  );

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  ColorD ColorContrast(
    ColorD color,
    num contrast,
  ) => run(
    () => _debugLabels.ColorContrast(color, contrast),
    () => _flat.ColorContrast(
      color,
      contrast.toDouble(),
    ),
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorD ColorAlpha(
    ColorD color,
    num alpha,
  ) => run(
    () => _debugLabels.ColorAlpha(color, alpha),
    () => _flat.ColorAlpha(
      color,
      alpha.toDouble(),
    ),
  );

  /// Get src alpha-blended into dst color with tint
  ColorD ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => run(
    () => _debugLabels.ColorAlphaBlend(dst, src, tint),
    () => _flat.ColorAlphaBlend(
      dst,
      src,
      tint,
    ),
  );

  /// Get color lerp interpolation between two colors, factor [0.0..1.0]
  ColorD ColorLerp(
    ColorD color1,
    ColorD color2,
    num factor,
  ) => run(
    () => _debugLabels.ColorLerp(color1, color2, factor),
    () => _flat.ColorLerp(
      color1,
      color2,
      factor.toDouble(),
    ),
  );

  /// Get Color structure from hexadecimal value
  ColorD GetColor(
    num hexValue,
  ) => run(
    () => _debugLabels.GetColor(hexValue),
    () => _flat.GetColor(
      hexValue.toInt(),
    ),
  );

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => _debugLabels.GetPixelDataSize(width, height, format),
    () => _flat.GetPixelDataSize(
      width.toInt(),
      height.toInt(),
      format.value,
    ),
  );

  /// Get the default Font
  FontD GetFontDefault() => run(
    () => _debugLabels.GetFontDefault(),
    () => _flat.GetFontDefault(),
  );

  /// Load font from file into GPU memory (VRAM)
  FontD LoadFont(
    String fileName,
  ) => run(
    () => _debugLabels.LoadFont(fileName),
    () => _flat.LoadFont(
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  FontD LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  ) => run(
    () => _debugLabels.LoadFontEx(fileName, fontSize, codepoints),
    () => _flat.LoadFontEx(
      $.String$.ValueOrNull(fileName),
      fontSize.toInt(),
      codepoints == null ? MemoryPointer.nullptr() : $.Int$.Array(codepoints).cast(),
      codepointCount?.toInt() ?? codepoints?.length ?? 0,
    ),
  );

  /// Load font from Image (XNA style)
  FontD LoadFontFromImage(
    ImageD image,
    ColorD key,
    num firstChar,
  ) => run(
    () => _debugLabels.LoadFontFromImage(image, key, firstChar),
    () => _flat.LoadFontFromImage(
      image,
      key,
      firstChar.toInt(),
    ),
  );

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  FontD LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => run(
    () => _debugLabels.LoadFontFromMemory(fileType, fileData, fontSize, codepoints),
    () => _flat.LoadFontFromMemory(
      $.String$.ValueOrNull(fileType),
      $.Uint8$.Array(fileData),
      fileData.length,
      fontSize.toInt(),
      $.Int$.Array(codepoints),
      codepoints.length,
    ),
  );

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(
    FontD font,
  ) => run(
    () => _debugLabels.IsFontValid(font),
    () => _flat.IsFontValid(
      font,
    ),
  );

  /// Load font data for further use
  List<GlyphInfoD> LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => run(
    () => _debugLabels.LoadFontData(fileData, fontSize, codepoints, codepointCount, type),
    () {
      final glyphCount = $.Int$.Ref1();
      final glyphs = _flat.LoadFontData(
        $.UnsignedChar$.Array(fileData),
        fileData.length,
        fontSize.toInt(),
        codepoints == null ? MemoryPointer.nullptr() : $.Int$.Array(codepoints).cast(),
        codepointCount?.toInt() ?? codepoints?.length ?? 0,
        type.value,
        glyphCount,
      );
      final requestedCount = (codepointCount == null || codepointCount == 0) 
        ? codepoints?.length ?? glyphCount.value 
        : codepointCount.toInt();
      return glyphs.readArray(requestedCount);
    },
  );

  /// Generate image font atlas using chars info
  (ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
    List<GlyphInfoD> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => run(
    () => _debugLabels.GenImageFontAtlas(glyphs, fontSize, padding, packMethod),
    () {
      final recsPtr = $.Rectangle$.$.Raw();

      try {
        final image = _flat.GenImageFontAtlas(
          glyphs.first.getOp(),
          recsPtr,
          glyphs.length,
          fontSize.toInt(),
          padding.toInt(),
          packMethod.toInt(),
        );

        final innerPtr = recsPtr.readPtr();
        final recs = RectangleD.struct.ptr(innerPtr).readArray(glyphs.length);

        return (image, recs);
      } finally {
        recsPtr.free();
      }
    },
  );

  /// Unload font chars info data (RAM)
  void UnloadFontData(
    List<GlyphInfoD> glyphs,
  ) => run(
    () => _debugLabels.UnloadFontData(glyphs),
    () => _flat.UnloadFontData(
      glyphs.first.getOp(),
      glyphs.length,
    ),
  );
    
  /// Unload font from GPU memory (VRAM)
  void UnloadFont(
    FontD font,
  ) => run(
    () => _debugLabels.UnloadFont(font),
    () => _flat.UnloadFont(
      font,
    ),
  );

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(
    FontD font,
    String fileName,
  ) => run(
    () => _debugLabels.ExportFontAsCode(font, fileName),
    () => _flat.ExportFontAsCode(
      font,
      $.String$.ValueOrNull(fileName),
    ),
  );

  /// Draw current FPS
  void DrawFPS(
    num posX,
    num posY,
  ) => run(
    () => _debugLabels.DrawFPS(posX, posY),
    () => _flat.DrawFPS(
      posX.toInt(),
      posY.toInt(),
    ),
  );

  /// Draw text (using default font)
  void DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawText(text, posX, posY, fontSize, color),
    () => _flat.DrawText(
      $.String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      color,
    ),
  );

  /// Draw text using font and additional parameters
  void DrawTextEx(
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextEx(font, text, position, fontSize, spacing, tint),
    () => _flat.DrawTextEx(
      font,
      $.String$.ValueOrNull(text),
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
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
  ) => run(
    () => _debugLabels.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint),
    () => _flat.DrawTextPro(
      font,
      $.String$.ValueOrNull(text),
      position,
      origin,
      rotation.toDouble(),
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );
    
  /// Draw one character (codepoint)
  void DrawTextCodepoint(
    FontD font,
    num codepoint,
    Vector2D position,
    num fontSize,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextCodepoint(font, codepoint, position, fontSize, tint),
    () => _flat.DrawTextCodepoint(
      font,
      codepoint.toInt(),
      position,
      fontSize.toDouble(),
      tint,
    ),
  );

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(
    FontD font,
    Int32List codepoints,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextCodepoints(font, codepoints, position, fontSize, spacing, tint),
    () => _flat.DrawTextCodepoints(
      font,
      $.Int$.Array(codepoints),
      codepoints.length,
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Set vertical line spacing when drawing with line-breaks
  void SetTextLineSpacing(
    num spacing,
  ) => run(
    () => _debugLabels.SetTextLineSpacing(spacing),
    () => _flat.SetTextLineSpacing(
      spacing.toInt(),
    ),
  );

  /// Measure string width for default font
  int MeasureText(
    String text,
    num fontSize,
  ) => run(
    () => _debugLabels.MeasureText(text, fontSize),
    () => _flat.MeasureText(
      $.String$.ValueOrNull(text),
      fontSize.toInt(),
    ),
  );
    
  /// Measure string size for Font
  Vector2D MeasureTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
  ) => run(
    () => _debugLabels.MeasureTextEx(font, text, fontSize, spacing),
    () => _flat.MeasureTextEx(
      font,
      $.String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
    ),
  );

  /// Measure string size for an existing array of codepoints for Font
  Vector2D MeasureTextCodepoints(
    FontD font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  ) => run(
    () => _debugLabels.MeasureTextCodepoints(font, codepoints, fontSize, spacing),
    () => _flat.MeasureTextCodepoints(
      font,
      $.Int$.Array(codepoints),
      codepoints.length,
      fontSize.toDouble(),
      spacing.toDouble(),
    ),
  );

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(
    FontD font,
    num codepoint,
  ) => run(
    () => _debugLabels.GetGlyphIndex(font, codepoint),
    () => _flat.GetGlyphIndex(
      font,
      codepoint.toInt(),
    ),
  );

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfoD GetGlyphInfo(
    FontD font,
    num codepoint,
  ) => run(
    () => _debugLabels.GetGlyphInfo(font, codepoint),
    () => _flat.GetGlyphInfo(
      font,
      codepoint.toInt(),
    ),
  );

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  RectangleD GetGlyphAtlasRec(
    FontD font,
    num codepoint,
  ) => run(
    () => _debugLabels.GetGlyphAtlasRec(font, codepoint),
    () => _flat.GetGlyphAtlasRec(
      font,
      codepoint.toInt(),
    ),
  );
    
  /// Load UTF-8 text encoded from codepoints array
  String LoadUTF8(
    Int32List codepoints,
  ) => run(
    () => _debugLabels.LoadUTF8(codepoints),
    () {
      final utf8 = _flat.LoadUTF8(
        $.Int$.Array(codepoints),
        codepoints.length,
      );
      try {
        return utf8.toDartString();
      } finally {
        _flat.UnloadUTF8(utf8);
      }
    },
  );

  /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  Int32List LoadCodepoints(
    String text,
  ) => run(
    () => _debugLabels.LoadCodepoints(text),
    () {
      final count = $.Int$.Ref1();
      final result = _flat.LoadCodepoints(
        $.String$.ValueOrNull(text),
        count,
      );
      try {
        return result.asCopy(count.value);
      } finally {
        _flat.UnloadCodepoints(result);
      }
    },
  );

  /// Get total number of codepoints in a UTF-8 encoded string
  int GetCodepointCount(
    String text,
  ) => run(
    () => _debugLabels.GetCodepointCount(text),
    () => _flat.GetCodepointCount(
      $.String$.ValueOrNull(text),
    ),
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepoint(
    String text,
  ) => run(
    () => _debugLabels.GetCodepoint(text),
    () {
      final size = $.Int$.Ref1();
      final codepoint = _flat.GetCodepoint(
        $.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointNext(
    String text,
  ) => run(
    () => _debugLabels.GetCodepointNext(text),
    () {
      final size = $.Int$.Ref1();
      final codepoint = _flat.GetCodepointNext(
        $.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointPrevious(
    String text,
  ) => run(
    () => _debugLabels.GetCodepointPrevious(text),
    () {
      final size = $.Int$.Ref1();
      final codepoint = _flat.GetCodepointPrevious(
        $.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  (String text, int size) CodepointToUTF8(
    num codepoint,
  ) => run(
    () => _debugLabels.CodepointToUTF8(codepoint),
    () {
      final size = $.Int$.Ref1();
      final text = _flat.CodepointToUTF8(
        codepoint.toInt(),
        size,
      );
      return (text.toDartString(), size.value);
    },
  );

  /// Load text as separate lines ('\n')
  List<String> LoadTextLines(
    String text,
  ) => run(
    () => _debugLabels.LoadTextLines(text),
    () {
      final textPtr = $.String$.RawValue(text);
      final lineCountPtr = $.Int$.Ref1();
      try {
        final linesPtr = _flat.LoadTextLines(
          textPtr,
          lineCountPtr,
        );
        final lines = linesPtr.readStringArray(lineCountPtr.value);
        _flat.UnloadTextLines(linesPtr, lineCountPtr.value);
        return lines;
      } finally {
        textPtr.free();
      }
    },
  );
  
  /// Check if two text string are equal
  /// 
  /// **NOT** calling original Raylib function.
  bool TextIsEqual(
    String text1,
    String text2,
  ) => run(
    () => _debugLabels.TextIsEqual(text1, text2),
    () => text1 == text2,
  );

  /// Get text length
  /// 
  /// **NOT** calling original Raylib function.
  int TextLength(
    String text,
  ) => run(
    () => _debugLabels.TextLength(text),
    () => text.length,
  );

  /// Text formatting with variables (sprintf() style)
  /// 
  /// **NOT** calling original Raylib function.
  String TextFormat(
    String text, [
      List<Object?> args = const [],
    ]
  ) => run(
    () => _debugLabels.TextFormat(text, args),
    () => rl.Utils.Format(text, args),
  );

  /// Get a piece of a text string
  /// 
  /// **NOT** calling original Raylib function.
  String TextSubtext(
    String text,
    int position,
    int length,
  ) => run(
    () => _debugLabels.TextSubtext(text, position, length),
    () {
      if (position < 0 || position >= text.length) return '';
      final end = (position + length).clamp(position, text.length);
      return text.substring(position, end);
    },
  );

  /// Remove text spaces, concat words
  /// 
  /// **NOT** calling original Raylib function.
  String TextRemoveSpaces(
    String text,
  ) => run(
    () => _debugLabels.TextRemoveSpaces(text),
    () => text.replaceAll(' ', ''),
  );

  /// Get text between two strings
  /// 
  /// **NOT** calling original Raylib function.
  String GetTextBetween(
    String text,
    String begin,
    String end,
  ) => run(
    () => _debugLabels.GetTextBetween(text, begin, end),
    () {
      final startIdx = text.indexOf(begin);
      if (startIdx == -1) return '';
      final contentStart = startIdx + begin.length;
      final endIdx = text.indexOf(end, contentStart);
      if (endIdx == -1) return '';
      return text.substring(contentStart, endIdx);
    },
  );

  /// Replace text string with new string
  /// 
  /// **NOT** calling original Raylib function.
  String TextReplace(
    String text,
    String search,
    String replacement,
  ) => run(
    () => _debugLabels.TextReplace(text, search, replacement),
    () => search.isEmpty ? text : text.replaceAll(search, replacement),
  );

  /// Replace text between two specific strings
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  ) => run(
    () => _debugLabels.TextReplaceBetween(text, begin, end, replacement),
    () {
      final startIdx = text.indexOf(begin);
      if (startIdx == -1) return text;
      final contentStart = startIdx + begin.length;
      final endIdx = text.indexOf(end, contentStart);
      if (endIdx == -1) return text;
      return text.substring(0, contentStart) + replacement + text.substring(endIdx);
    },
  );

  /// Insert text in a defined byte position
  String TextInsert(
    String text,
    String insert,
    int position,
  ) => run(
    () => _debugLabels.TextInsert(text, insert, position),
    () {
      final pos = position.clamp(0, text.length);
      return text.substring(0, pos) + insert + text.substring(pos);
    },
  );

  /// Join text strings with delimiter ([delimiter] is expected to be length of 1)
  String TextJoin(
    List<String> textList,
    String delimiter,
  ) => run(
    () => _debugLabels.TextJoin(textList, delimiter),
    () {
      assert(delimiter.length > 1);
      return textList.join(delimiter);
    },
  );

  /// Split text into multiple strings
  List<String> TextSplit(
    String text,
    String delimiter,
  ) => run(
    () => _debugLabels.TextSplit(text, delimiter),
    () => delimiter.isEmpty ? [text] : text.split(delimiter),
  );

  /// Append text at specific position and move cursor
  String TextAppend(
    String text,
    String append,
  ) => run(
    () => _debugLabels.TextAppend(text, append),
    () => text + append,
  );

  /// Find first text occurrence within a string, -1 if not found
  int TextFindIndex(
    String text,
    String search,
  ) => run(
    () => _debugLabels.TextFindIndex(text, search),
    () => text.indexOf(search),
  );

  /// Get upper case version of provided string
  String TextToUpper(
    String text,
  ) => run(
    () => _debugLabels.TextToUpper(text),
    () => text.toUpperCase(),
  );
  
  /// Get lower case version of provided string
  String TextToLower(
    String text,
  ) => run(
    () => _debugLabels.TextToLower(text),
    () => text.toLowerCase(),
  );
  
  /// Get Pascal case notation version of provided string
  String TextToPascal(
    String text,
  ) => run(
    () => _debugLabels.TextToPascal(text),
    () => rl.Utils.TextSplitWords(text)
      .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase())
      .join(),
  );
  
  /// Get Snake case notation version of provided string
  String TextToSnake(
    String text,
  ) => run(
    () => _debugLabels.TextToSnake(text),
    () => rl.Utils.TextSplitWords(text).map((w) => w.toLowerCase()).join('_'),
  );
  
  /// Get Camel case notation version of provided string
  String TextToCamel(
    String text,
  ) => run(
    () => _debugLabels.TextToCamel(text),
    () {
      final words = rl.Utils.TextSplitWords(text);
      if (words.isEmpty) return '';
      final first = words.first.toLowerCase();
      final rest = words.skip(1).map(
        (w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase(),
      );
      return first + rest.join();
    },
  );

  /// Get integer value from text
  int TextToInteger(
    String text,
  ) => run(
    () => _debugLabels.TextToInteger(text),
    () => int.tryParse(text.trim()) ?? 0,
  );
  
  /// Get float value from text
  double TextToFloat(
    String text,
  ) => run(
    () => _debugLabels.TextToFloat(text),
    () => double.tryParse(text.trim()) ?? 0,
  );
    
  /// Draw a line in 3D world space
  void DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLine3D(startPos, endPos, color),
    () => _flat.DrawLine3D(
      startPos,
      endPos,
      color,
    ),
  );
    
  /// Draw a point in 3D space, actually a small line
  void DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPoint3D(position, color),
    () => _flat.DrawPoint3D(
      position,
      color,
    ),
  );
    
  /// Draw a circle in 3D world space
  void DrawCircle3D(
    Vector3D center,
    num radius,
    Vector3D rotationAxis,
    num rotationAngle,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color),
    () => _flat.DrawCircle3D(
      center,
      radius.toDouble(),
      rotationAxis,
      rotationAngle.toDouble(),
      color,
    ),
  );
    
  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangle3D(v1, v2, v3, color),
    () => _flat.DrawTriangle3D(
      v1,
      v2,
      v3,
      color,
    ),
  );
    
  /// Draw a triangle strip defined by points
  void DrawTriangleStrip3D(
    List<Vector3D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangleStrip3D(points, color),
    () => _flat.DrawTriangleStrip3D(
      $.Vector3$.ArrayStruct(points),
      points.length,
      color,
    ),
  );
    
  /// Draw cube
  void DrawCube(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCube(position, width, height, length, color),
    () => _flat.DrawCube(
      position,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      color,
    ),
  );
    
  /// Draw cube (Vector version)
  void DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCubeV(position, size, color),
    () => _flat.DrawCubeV(
      position,
      size,
      color,
    ),
  );
    
  /// Draw cube wires
  void DrawCubeWires(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCubeWires(position, width, height, length, color),
    () => _flat.DrawCubeWires(
      position,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      color,
    ),
  );
    
  /// Draw cube wires (Vector version)
  void DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCubeWiresV(position, size, color),
    () => _flat.DrawCubeWiresV(
      position,
      size,
      color,
    ),
  );
    
  /// Draw sphere
  void DrawSphere(
    Vector3D centerPos,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSphere(centerPos, radius, color),
    () => _flat.DrawSphere(
      centerPos,
      radius.toDouble(),
      color,
    ),
  );
    
  /// Draw sphere with extended parameters
  void DrawSphereEx(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSphereEx(centerPos, radius, rings, slices, color),
    () => _flat.DrawSphereEx(
      centerPos,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw sphere wires
  void DrawSphereWires(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSphereWires(centerPos, radius, rings, slices, color),
    () => _flat.DrawSphereWires(
      centerPos,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder/cone
  void DrawCylinder(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color),
    () => _flat.DrawCylinder(
      position,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color),
    () => _flat.DrawCylinderEx(
      startPos,
      endPos,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder/cone wires
  void DrawCylinderWires(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color),
    () => _flat.DrawCylinderWires(
      position,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color),
    () => _flat.DrawCylinderWiresEx(
      startPos,
      endPos,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      color,
    ),
  );
    
  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCapsule(startPos, endPos, radius, slices, rings, color),
    () => _flat.DrawCapsule(
      startPos,
      endPos,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      color,
    ),
  );
    
  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color),
    () => _flat.DrawCapsuleWires(
      startPos,
      endPos,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      color,
    ),
  );
    
  /// Draw a plane XZ
  void DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPlane(centerPos, size, color),
    () => _flat.DrawPlane(
      centerPos,
      size,
      color,
    ),
  );
    
  /// Draw a ray line
  void DrawRay(
    RayD ray,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRay(ray, color),
    () => _flat.DrawRay(
      ray,
      color,
    ),
  );
    
  /// Draw a grid (centered at (0, 0, 0))
  void DrawGrid(
    num slices,
    num spacing,
  ) => run(
    () => _debugLabels.DrawGrid(slices, spacing),
    () => _flat.DrawGrid(
      slices.toInt(),
      spacing.toDouble(),
    ),
  );
    
  /// Load model from files (meshes and materials)
  ModelD LoadModel(
    String fileName,
  ) => run(
    () => _debugLabels.LoadModel(fileName),
    () => _flat.LoadModel(
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load model from generated mesh (default material)
  ModelD LoadModelFromMesh(
    MeshD mesh,
  ) => run(
    () => _debugLabels.LoadModelFromMesh(mesh),
    () => _flat.LoadModelFromMesh(
      mesh,
    ),
  );
    
  /// Check if a model is valid (loaded in GPU, VAO/VBOs)
  bool IsModelValid(
    ModelD model,
  ) => run(
    () => _debugLabels.IsModelValid(model),
    () => _flat.IsModelValid(
      model,
    ),
  );
    
  /// Unload model (including meshes) from memory (RAM and/or VRAM)
  void UnloadModel(
    ModelD model,
  ) => run(
    () => _debugLabels.UnloadModel(model),
    () => _flat.UnloadModel(
      model,
    ),
  );
    
  /// Compute model bounding box limits (considers all meshes)
  BoundingBoxD GetModelBoundingBox(
    ModelD model,
  ) => run(
    () => _debugLabels.GetModelBoundingBox(model),
    () => _flat.GetModelBoundingBox(
      model,
    ),
  );
    
  /// Draw a model (with texture if set)
  void DrawModel(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint
  ) => run(
    () => _debugLabels.DrawModel(model, position, scale, tint),
    () => _flat.DrawModel(
      model,
      position,
      scale.toDouble(),
      tint,
    ),
  );
    
  /// Draw a model with extended parameters
  void DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => _flat.DrawModelEx(
      model,
      position,
      rotationAxis,
      rotationAngle.toDouble(),
      scale,
      tint,
    ),
  );
    
  /// Draw a model wires (with texture if set)
  void DrawModelWires(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawModelWires(model, position, scale, tint),
    () => _flat.DrawModelWires(
      model,
      position,
      scale.toDouble(),
      tint,
    ),
  );
    
  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => _flat.DrawModelWiresEx(
      model,
      position,
      rotationAxis,
      rotationAngle.toDouble(),
      scale,
      tint,
    ),
  );
    
  /// Draw bounding box (wires)
  void DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawBoundingBox(box, color),
    () => _flat.DrawBoundingBox(
      box,
      color,
    ),
  );

  /// Draw a billboard texture
  void DrawBillboard(
    Camera3DD camera,
    TextureD texture,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawBillboard(camera, texture, position, scale, tint),
    () => _flat.DrawBillboard(
      camera,
      texture,
      position,
      scale.toDouble(),
      tint,
    ),
  );

  /// Draw a billboard texture defined by source
  void DrawBillboardRec(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawBillboardRec(camera, texture, source, position, size, tint),
    () => _flat.DrawBillboardRec(
      camera,
      texture,
      source,
      position,
      size,
      tint,
    ),
  );

  /// Draw a billboard texture defined by source and rotation
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
  ) => run(
    () => _debugLabels.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint),
    () => _flat.DrawBillboardPro(
      camera,
      texture,
      source,
      position,
      up,
      size,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );
  
  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(
    MeshD mesh,
    bool dynamic,
  ) => run(
    () => _debugLabels.UploadMesh(mesh, dynamic),
    () => _flat.UploadMesh(
      $.Mesh$.Ref1(mesh),
      dynamic,
    ),
  );
    
  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(
    MeshD mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => run(
    () => _debugLabels.UpdateMeshBuffer(mesh, index, data, offset),
    () => _flat.UpdateMeshBuffer(
      mesh,
      index.toInt(),
      $.TypedDataList$.Array(data),
      data.length,
      offset.toInt(),
    ),
  );
    
  /// Unload mesh data from CPU and GPU
  void UnloadMesh(
    MeshD mesh,
  ) => run(
    () => _debugLabels.UnloadMesh(mesh),
    () => _flat.UnloadMesh(
      mesh,
    ),
  );
    
  /// Draw a 3d mesh with material and transform
  void DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => run(
    () => _debugLabels.DrawMesh(mesh, material, transform),
    () => _flat.DrawMesh(
      mesh,
      material,
      transform,
    ),
  );
    
  /// Draw multiple mesh instances with material and different transforms
  void DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    List<MatrixD> transforms,
  ) => run(
    () => _debugLabels.DrawMeshInstanced(mesh, material, transforms),
    () => _flat.DrawMeshInstanced(
      mesh,
      material,
      $.Matrix$.ArrayStruct(transforms),
      transforms.length,
    ),
  );
    
  /// Compute mesh bounding box limits
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  ) => run(
    () => _debugLabels.GetMeshBoundingBox(mesh),
    () => _flat.GetMeshBoundingBox(
      mesh,
    ),
  );
    
  /// Compute mesh tangents
  void GenMeshTangents(
    MeshD mesh,
  ) => run(
    () => _debugLabels.GenMeshTangents(mesh),
    () => _flat.GenMeshTangents(
      $.Mesh$.Ref1(mesh),
    ),
  );
    
  /// Export mesh data to file, returns true on success
  bool ExportMesh(
    MeshD mesh,
    String fileName,
  ) => run(
    () => _debugLabels.ExportMesh(mesh, fileName),
    () => _flat.ExportMesh(
      mesh,
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(
    MeshD mesh,
    String fileName,
  ) => run(
    () => _debugLabels.ExportMeshAsCode(mesh, fileName),
    () => _flat.ExportMeshAsCode(
      mesh,
      $.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Generate polygonal mesh
  MeshD GenMeshPoly(
    num sides,
    num radius,
  ) => run(
    () => _debugLabels.GenMeshPoly(sides, radius),
    () => _flat.GenMeshPoly(
      sides.toInt(),
      radius.toDouble(),
    ),
  );
    
  /// Generate plane mesh (with subdivisions)
  MeshD GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => run(
    () => _debugLabels.GenMeshPlane(width, length, resX, resZ),
    () => _flat.GenMeshPlane(
      width.toDouble(),
      length.toDouble(),
      resX.toInt(),
      resZ.toInt(),
    ),
  );
    
  /// Generate cuboid mesh
  MeshD GenMeshCube(
    num width,
    num height,
    num length,
  ) => run(
    () => _debugLabels.GenMeshCube(width, height, length),
    () => _flat.GenMeshCube(
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
    ),
  );
    
  /// Generate sphere mesh (standard sphere)
  MeshD GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => _debugLabels.GenMeshSphere(radius, rings, slices),
    () => _flat.GenMeshSphere(
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
    ),
  );
    
  /// Generate half-sphere mesh (no bottom cap)
  MeshD GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => _debugLabels.GenMeshHemiSphere(radius, rings, slices),
    () => _flat.GenMeshHemiSphere(
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
    ),
  );
    
  /// Generate cylinder mesh
  MeshD GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => run(
    () => _debugLabels.GenMeshCylinder(radius, height, slices),
    () => _flat.GenMeshCylinder(
      radius.toDouble(),
      height.toDouble(),
      slices.toInt(),
    ),
  );
    
  /// Generate cone/pyramid mesh
  MeshD GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => run(
    () => _debugLabels.GenMeshCone(radius, height, slices),
    () => _flat.GenMeshCone(
      radius.toDouble(),
      height.toDouble(),
      slices.toInt(),
    ),
  );
    
  /// Generate torus mesh
  MeshD GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => run(
    () => _debugLabels.GenMeshTorus(radius, size, radSeg, sides),
    () => _flat.GenMeshTorus(
      radius.toDouble(),
      size.toDouble(),
      radSeg.toInt(),
      sides.toInt(),
    ),
  );
    
  /// Generate trefoil knot mesh
  MeshD GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => run(
    () => _debugLabels.GenMeshKnot(radius, size, radSeg, sides),
    () => _flat.GenMeshKnot(
      radius.toDouble(),
      size.toDouble(),
      radSeg.toInt(),
      sides.toInt(),
    ),
  );
    
  /// Generate heightmap mesh from image data
  MeshD GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  ) => run(
    () => _debugLabels.GenMeshHeightmap(heightmap, size),
    () => _flat.GenMeshHeightmap(
      heightmap,
      size,
    ),
  );
    
  /// Generate cubes-based map mesh from image data
  MeshD GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => run(
    () => _debugLabels.GenMeshCubicmap(cubicmap, cubeSize),
    () => _flat.GenMeshCubicmap(
      cubicmap,
      cubeSize,
    ),
  );
    
  /// Load materials from model file
  List<MaterialD> LoadMaterials(
    String fileName,
  ) => run(
    () => _debugLabels.LoadMaterials(fileName),
    () {
      final materialCount = $.Int$.Ref1();
      final materials = _flat.LoadMaterials(
        $.String$.ValueOrNull(fileName),
        materialCount,
      );
      return materials.readArray(materialCount.value);
    },
  );
    
  /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  MaterialD LoadMaterialDefault() => run(
    () => _debugLabels.LoadMaterialDefault(),
    () => _flat.LoadMaterialDefault(),
  );
    
  /// Check if a material is valid (shader assigned, map textures loaded in GPU)
  bool IsMaterialValid(
    MaterialD material,
  ) => run(
    () => _debugLabels.IsMaterialValid(material),
    () => _flat.IsMaterialValid(
      material,
    ),
  );
    
  /// Unload material from GPU memory (VRAM)
  void UnloadMaterial(
    MaterialD material,
  ) => run(
    () => _debugLabels.UnloadMaterial(material),
    () => _flat.UnloadMaterial(
      material,
    ),
  );
    
  /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  void SetMaterialTexture(
    MaterialD material,
    MaterialMapIndex mapType,
    TextureD texture,
  ) => run(
    () => _debugLabels.SetMaterialTexture(material, mapType, texture),
    () => material.maps[mapType.value].texture = texture,
  );
    
  /// Set material for a mesh
  void SetModelMeshMaterial(
    ModelD model,
    num meshId,
    num materialId,
  ) => run(
    () => _debugLabels.SetModelMeshMaterial(model, meshId, materialId),
    () {
      if (meshId >= model.meshes.length) {
        TraceLog(.LOG_WARNING, "MESH: Id greater than mesh count");
        return;
      }
      if (materialId >= model.materials.length) {
        TraceLog(.LOG_WARNING, "MATERIAL: Id greater than material count");
        return;
      }
      model.meshMaterial[meshId.toInt()] = materialId.toInt();
    },
  );
    
  /// Load model animations from file
  List<ModelAnimationD> LoadModelAnimations(
    String fileName,
  ) => run(
    () => _debugLabels.LoadModelAnimations(fileName),
    () {
      final animCount = $.Int$.Ref1();
      final anims = _flat.LoadModelAnimations(
        $.String$.ValueOrNull(fileName),
        animCount,
      );
      return anims.readArray(animCount.value);
    },
  );
    
  /// Update model animation pose (CPU)
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => run(
    () => _debugLabels.UpdateModelAnimation(model, anim, frame),
    () => _flat.UpdateModelAnimation(
      model,
      anim,
      frame.toDouble(),
    ),
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
  ) => run(
    () => _debugLabels.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend),
    () => _flat.UpdateModelAnimationEx(
      model,
      animA,
      frameA.toDouble(),
      animB,
      frameB.toDouble(),
      blend.toDouble(),
    ),
  );
    
  /// Unload animation array data
  void UnloadModelAnimations(
    List<ModelAnimationD> animations,
  ) => run(
    () => _debugLabels.UnloadModelAnimations(animations),
    () => _flat.UnloadModelAnimations(
      animations.first.getOp(),
      animations.length,
    ),
  );
    
  /// Check model animation skeleton match
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => run(
    () => _debugLabels.IsModelAnimationValid(model, anim),
    () => _flat.IsModelAnimationValid(
      model,
      anim,
    ),
  );
    
  /// Check collision between two spheres
  bool CheckCollisionSpheres(
    Vector3D center1,
    num radius1,
    Vector3D center2,
    num radius2,
  ) => run(
    () => _debugLabels.CheckCollisionSpheres(center1, radius1, center2, radius2),
    () => _flat.CheckCollisionSpheres(
      center1,
      radius1.toDouble(),
      center2,
      radius2.toDouble(),
    ),
  );
    
  /// Check collision between two bounding boxes
  bool CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => run(
    () => _debugLabels.CheckCollisionBoxes(box1, box2),
    () => _flat.CheckCollisionBoxes(
      box1,
      box2,
    ),
  );
    
  /// Check collision between box and sphere
  bool CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    num radius,
  ) => run(
    () => _debugLabels.CheckCollisionBoxSphere(box, center, radius),
    () => _flat.CheckCollisionBoxSphere(
      box,
      center,
      radius.toDouble(),
    ),
  );
    
  /// Get collision info between ray and sphere
  RayCollisionD GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    num radius,
  ) => run(
    () => _debugLabels.GetRayCollisionSphere(ray, center, radius),
    () => _flat.GetRayCollisionSphere(
      ray,
      center,
      radius.toDouble(),
    ),
  );
    
  /// Get collision info between ray and box
  RayCollisionD GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => run(
    () => _debugLabels.GetRayCollisionBox(ray, box),
    () => _flat.GetRayCollisionBox(
      ray,
      box,
    ),
  );
    
  /// Get collision info between ray and mesh
  RayCollisionD GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => run(
    () => _debugLabels.GetRayCollisionMesh(ray, mesh, transform),
    () => _flat.GetRayCollisionMesh(
      ray,
      mesh,
      transform,
    ),
  );
    
  /// Get collision info between ray and triangle
  RayCollisionD GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => run(
    () => _debugLabels.GetRayCollisionTriangle(ray, p1, p2, p3),
    () => _flat.GetRayCollisionTriangle(
      ray,
      p1,
      p2,
      p3,
    ),
  );
    
  /// Get collision info between ray and quad
  RayCollisionD GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  ) => run(
    () => _debugLabels.GetRayCollisionQuad(ray, p1, p2, p3, p4),
    () => _flat.GetRayCollisionQuad(
      ray,
      p1,
      p2,
      p3,
      p4,
    ),
  );
}
