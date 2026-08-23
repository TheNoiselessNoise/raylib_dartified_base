part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Gui module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibGuiModule<R extends RaylibBase> extends RaylibModule<R> with RaylibGuiModuleExtras<R> {

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibGuiModuleDebugLabels();
  
  RaylibGuiModule(super.rl);

  /// Enable gui controls (global state)
  void GuiEnable();

  /// Disable gui controls (global state)
  void GuiDisable();

  /// Lock gui controls (global state)
  void GuiLock();

  /// Unlock gui controls (global state)
  void GuiUnlock();

  /// Check if gui is locked (global state)
  bool GuiIsLocked();

  /// Set gui controls alpha (global state), alpha goes from 0.0 to 1.0
  void GuiSetAlpha(
    num alpha,
  );

  /// Set gui state (global state)
  void GuiSetState(
    GuiState state,
  );

  /// Get gui state (global state)
  int GuiGetState();

  /// Set gui custom font (global state)
  void GuiSetFont(
    FontD font,
  );

  /// Get gui custom font (global state)
  FontD GuiGetFont();

  /// Set one style property
  void GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  );

  /// Get one style property
  int GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  );

  /// Load style file over global style variable (.rgs)
  void GuiLoadStyle(
    String fileName,
  );

  /// Load style default over global style
  void GuiLoadStyleDefault();

  /// Enable gui tooltips (global state)
  void GuiEnableTooltip();

  /// Disable gui tooltips (global state)
  void GuiDisableTooltip();

  /// Set tooltip string
  void GuiSetTooltip(
    String? tooltip,
  );

  /// Get text with icon id prepended (if supported)
  String GuiIconText(
    GuiIconName iconId,
    String? text,
  );

  /// Set default icon drawing size
  void GuiSetIconScale(
    num scale,
  );

  /// Get raygui icons data
  List<int> GuiGetIcons();

  /// Load raygui icons file (.rgi) into internal icons data
  List<String> GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  );

  /// Draw icon using pixel size at specified position
  void GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    ColorD color,
  );

  /// Get text width considering gui style and icon size (if required)
  int GuiGetTextWidth(
    String? text,
  );

  /// Window Box control, shows a window that can be closed
  int GuiWindowBox(
    RectangleD bounds,
    String? title,
  );

  /// Group Box control with text name
  int GuiGroupBox(
    RectangleD bounds,
    String? text,
  );

  /// Line separator control, could contain text
  int GuiLine(
    RectangleD bounds,
    String? text,
  );

  /// Panel control, useful to group controls
  int GuiPanel(
    RectangleD bounds,
    String? text,
  );

  /// Tab Bar control, returns TAB to be closed or -1
  (int tab, int active) GuiTabBar(
    RectangleD bounds,
    List<String> text,
  );

  /// Scroll Panel control
  int GuiScrollPanel(
    RectangleD bounds,
    String? text,
    RectangleD content,
    Vector2D scroll,
    [RectangleD? view]
  );

  /// Label control
  int GuiLabel(
    RectangleD bounds,
    String? text,
  );

  /// Button control, returns true when clicked
  /// 
  /// Returns `int` rather than `bool` to match Raygui's uniform `result`
  /// convention across all controls.
  /// 
  /// Use `GuiButton(...) == 1` to test for a click.
  int GuiButton(
    RectangleD bounds,
    String? text,
  );

  /// Label button control, returns true when clicked
  /// 
  /// Returns `int` rather than `bool` to match Raygui's uniform `result`
  /// convention across all controls.
  /// 
  /// Use `GuiLabelButton(...) == 1` to test for a click.
  int GuiLabelButton(
    RectangleD bounds,
    String? text,
  );

  /// Toggle Button control
  (int result, bool active) GuiToggle(
    RectangleD bounds,
    String? text,
    bool active,
  );

  /// Toggle Group control
  (int result, int active) GuiToggleGroup(
    RectangleD bounds,
    String? text,
    num active,
  );

  /// Toggle Slider control
  (int result, int active) GuiToggleSlider(
    RectangleD bounds,
    String? text,
    num active,
  );

  /// Check Box control, returns true when active
  (int result, bool checked) GuiCheckBox(
    RectangleD bounds,
    String? text,
    bool checked,
  );

  /// Combo Box control
  (int result, int active) GuiComboBox(
    RectangleD bounds,
    String? text,
    num active,
  );

  /// Dropdown Box control
  (int result, int active) GuiDropdownBox(
    RectangleD bounds,
    String? text,
    num active,
    bool editMode,
  );

  /// Spinner control
  (int result, int value) GuiSpinner(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  );

  /// Value Box control, updates input text with numbers
  (int result, int value) GuiValueBox(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  );

  /// Value box control for float values
  (int result, double value) GuiValueBoxFloat(
    RectangleD bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  );

  /// Text Box control, updates input text
  (int result, String value) GuiTextBox(
    RectangleD bounds,
    String? text,
    num textSize,
    bool editMode,
  );

  /// Slider control
  (int result, double value) GuiSlider(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  /// Slider Bar control
  (int result, double value) GuiSliderBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  /// Progress Bar control
  (int result, double value) GuiProgressBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  /// Status Bar control, shows info text
  int GuiStatusBar(
    RectangleD bounds,
    String? text,
  );

  /// Dummy control for placeholders
  int GuiDummyRec(
    RectangleD bounds,
    String? text,
  );

  /// Grid control
  int GuiGrid(
    RectangleD bounds,
    num spacing,
    num subdivs,
    [Vector2D? mouseCell]
  );

  /// List View control
  (int result, int? scrollIndex, int? active) GuiListView(
    RectangleD bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  );

  /// List View with extended parameters
  (int result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
    RectangleD bounds,
    List<String>? text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  );

  /// Message Box control, displays a message
  int GuiMessageBox(
    RectangleD bounds,
    String? title,
    String message,
    String buttons,
  );

  /// Text Input Box control, ask for text, supports secret
  (int result, String value, bool? secretViewActive) GuiTextInputBox(
    RectangleD bounds,
    String? title,
    String? message,
    String buttons,
    String? text,
    num textMaxSize,
    bool? secretViewActive,
  );

  /// Color Picker control (multiple color controls)
  (int result, ColorD color) GuiColorPicker(
    RectangleD bounds,
    ColorD? color,
  );

  /// Color Panel control
  (int result, ColorD color) GuiColorPanel(
    RectangleD bounds,
    ColorD color,
  );

  /// Color Bar Alpha control
  (int result, double alpha) GuiColorBarAlpha(
    RectangleD bounds,
    num alpha,
  );

  /// Color Bar Hue control
  (int result, double value) GuiColorBarHue(
    RectangleD bounds,
    num value,
  );

  /// Color Picker control that avoids conversion to RGB on each call (multiple color controls)
  (int result, Vector3D hsv) GuiColorPickerHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  );

  /// Color Panel control that updates Hue-Saturation-Value color value, used by GuiColorPickerHSV()
  (int result, Vector3D hsv) GuiColorPanelHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  );
}
