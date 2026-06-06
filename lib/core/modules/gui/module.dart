part of '../../raylib_dartified_base.dart';

/// Re-exports [RaylibGuiConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibGuiModuleExtras<R extends RaylibBase> on RaylibModule<R> {

  /// See [RaylibGuiConstants.RAYGUI_VERSION_MAJOR].
  int get RAYGUI_VERSION_MAJOR => RaylibGuiConstants.RAYGUI_VERSION_MAJOR;

  /// See [RaylibGuiConstants.RAYGUI_VERSION_MINOR].
  int get RAYGUI_VERSION_MINOR => RaylibGuiConstants.RAYGUI_VERSION_MINOR;

  /// See [RaylibGuiConstants.RAYGUI_VERSION_PATCH].
  int get RAYGUI_VERSION_PATCH => RaylibGuiConstants.RAYGUI_VERSION_PATCH;

  /// See [RaylibGuiConstants.RAYGUI_VERSION].
  String get RAYGUI_VERSION => RaylibGuiConstants.RAYGUI_VERSION;

  /// See [RaylibGuiConstants.RAYGUI_SCROLLBAR_LEFT_SIDE].
  int get RAYGUI_SCROLLBAR_LEFT_SIDE => RaylibGuiConstants.RAYGUI_SCROLLBAR_LEFT_SIDE;

  /// See [RaylibGuiConstants.RAYGUI_SCROLLBAR_RIGHT_SIDE].
  int get RAYGUI_SCROLLBAR_RIGHT_SIDE => RaylibGuiConstants.RAYGUI_SCROLLBAR_RIGHT_SIDE;

  /// See [RaylibGuiConstants.RAYGUI_ICON_SIZE].
  int get RAYGUI_ICON_SIZE => RaylibGuiConstants.RAYGUI_ICON_SIZE;

  /// See [RaylibGuiConstants.RAYGUI_ICON_MAX_ICONS].
  int get RAYGUI_ICON_MAX_ICONS => RaylibGuiConstants.RAYGUI_ICON_MAX_ICONS;

  /// See [RaylibGuiConstants.RAYGUI_ICON_MAX_NAME_LENGTH].
  int get RAYGUI_ICON_MAX_NAME_LENGTH => RaylibGuiConstants.RAYGUI_ICON_MAX_NAME_LENGTH;

  /// See [RaylibGuiConstants.RAYGUI_ICON_DATA_ELEMENTS].
  int get RAYGUI_ICON_DATA_ELEMENTS => RaylibGuiConstants.RAYGUI_ICON_DATA_ELEMENTS;

  /// See [RaylibGuiConstants.RAYGUI_MAX_CONTROLS].
  int get RAYGUI_MAX_CONTROLS => RaylibGuiConstants.RAYGUI_MAX_CONTROLS;

  /// See [RaylibGuiConstants.RAYGUI_MAX_PROPS_BASE].
  int get RAYGUI_MAX_PROPS_BASE => RaylibGuiConstants.RAYGUI_MAX_PROPS_BASE;

  /// See [RaylibGuiConstants.RAYGUI_MAX_PROPS_EXTENDED].
  int get RAYGUI_MAX_PROPS_EXTENDED => RaylibGuiConstants.RAYGUI_MAX_PROPS_EXTENDED;

  /// See [RaylibGuiConstants.RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT].
  int get RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT => RaylibGuiConstants.RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_GROUPBOX_LINE_THICK].
  int get RAYGUI_GROUPBOX_LINE_THICK => RaylibGuiConstants.RAYGUI_GROUPBOX_LINE_THICK;

  /// See [RaylibGuiConstants.RAYGUI_LINE_MARGIN_TEXT].
  int get RAYGUI_LINE_MARGIN_TEXT => RaylibGuiConstants.RAYGUI_LINE_MARGIN_TEXT;

  /// See [RaylibGuiConstants.RAYGUI_LINE_TEXT_PADDING].
  int get RAYGUI_LINE_TEXT_PADDING => RaylibGuiConstants.RAYGUI_LINE_TEXT_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_PANEL_BORDER_WIDTH].
  int get RAYGUI_PANEL_BORDER_WIDTH => RaylibGuiConstants.RAYGUI_PANEL_BORDER_WIDTH;

  /// See [RaylibGuiConstants.RAYGUI_TABBAR_ITEM_WIDTH].
  int get RAYGUI_TABBAR_ITEM_WIDTH => RaylibGuiConstants.RAYGUI_TABBAR_ITEM_WIDTH;

  /// See [RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_WIDTH].
  int get RAYGUI_MIN_SCROLLBAR_WIDTH => RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_WIDTH;

  /// See [RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_HEIGHT].
  int get RAYGUI_MIN_SCROLLBAR_HEIGHT => RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_MIN_MOUSE_WHEEL_SPEED].
  int get RAYGUI_MIN_MOUSE_WHEEL_SPEED => RaylibGuiConstants.RAYGUI_MIN_MOUSE_WHEEL_SPEED;

  /// See [RaylibGuiConstants.RAYGUI_TOGGLEGROUP_MAX_ITEMS].
  int get RAYGUI_TOGGLEGROUP_MAX_ITEMS => RaylibGuiConstants.RAYGUI_TOGGLEGROUP_MAX_ITEMS;

  /// See [RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN].
  int get RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN => RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN;

  /// See [RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY].
  int get RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY => RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY;

  /// See [RaylibGuiConstants.RAYGUI_VALUEBOX_MAX_CHARS].
  int get RAYGUI_VALUEBOX_MAX_CHARS => RaylibGuiConstants.RAYGUI_VALUEBOX_MAX_CHARS;

  /// See [RaylibGuiConstants.RAYGUI_COLORBARALPHA_CHECKED_SIZE].
  int get RAYGUI_COLORBARALPHA_CHECKED_SIZE => RaylibGuiConstants.RAYGUI_COLORBARALPHA_CHECKED_SIZE;

  /// See [RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_HEIGHT].
  int get RAYGUI_MESSAGEBOX_BUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_PADDING].
  int get RAYGUI_MESSAGEBOX_BUTTON_PADDING => RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT].
  int get RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_PADDING].
  int get RAYGUI_TEXTINPUTBOX_BUTTON_PADDING => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_HEIGHT].
  int get RAYGUI_TEXTINPUTBOX_HEIGHT => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_HEIGHT;

  /// See [RaylibGuiConstants.RAYGUI_GRID_ALPHA].
  double get RAYGUI_GRID_ALPHA => RaylibGuiConstants.RAYGUI_GRID_ALPHA;

  /// See [RaylibGuiConstants.RAYGUI_MAX_LINE_BUFFER_SIZE].
  int get RAYGUI_MAX_LINE_BUFFER_SIZE => RaylibGuiConstants.RAYGUI_MAX_LINE_BUFFER_SIZE;

  /// See [RaylibGuiConstants.RAYGUI_ICON_TEXT_PADDING].
  int get RAYGUI_ICON_TEXT_PADDING => RaylibGuiConstants.RAYGUI_ICON_TEXT_PADDING;

  /// See [RaylibGuiConstants.RAYGUI_MAX_TEXT_LINES].
  int get RAYGUI_MAX_TEXT_LINES => RaylibGuiConstants.RAYGUI_MAX_TEXT_LINES;

  /// See [RaylibGuiConstants.RAYGUI_TEXTSPLIT_MAX_ITEMS].
  int get RAYGUI_TEXTSPLIT_MAX_ITEMS => RaylibGuiConstants.RAYGUI_TEXTSPLIT_MAX_ITEMS;

  /// See [RaylibGuiConstants.RAYGUI_TEXTSPLIT_MAX_TEXT_SIZE].
  int get RAYGUI_TEXTSPLIT_MAX_TEXT_SIZE => RaylibGuiConstants.RAYGUI_TEXTSPLIT_MAX_TEXT_SIZE;

  /// See [RaylibGuiConstants.RAYGUI_TEXTFORMAT_MAX_SIZE].
  int get RAYGUI_TEXTFORMAT_MAX_SIZE => RaylibGuiConstants.RAYGUI_TEXTFORMAT_MAX_SIZE;

  /// See [RaylibGuiConstants.RAYGUI_ICONS].
  List<int> get RAYGUI_ICONS => RaylibGuiConstants.RAYGUI_ICONS;

}

/// Backend-agnostic contract for the Raylib Gui module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full Core API surface across different backends.
abstract class RaylibGuiModuleBase<
  R extends RaylibBase,

  // types
  ColorStructType extends ColorBase<ColorStructType>,
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
  MatrixStructType extends MatrixBase<
    MatrixStructType,
    Vector3StructType,
    QuaternionStructType,
    Vector4StructType
  >,
  QuaternionStructType extends QuaternionBase<
    QuaternionStructType,
    MatrixStructType,
    Vector3StructType,
    Vector4StructType
  >,
  RectangleStructType extends RectangleBase<RectangleStructType>,
  TextureStructType extends TextureBase<TextureStructType>,
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
  >

> extends RaylibModule<R> with RaylibGuiModuleExtras<R> {

  /// Debug label generator for this module's function calls.
  final RaylibDebugLabels = RaylibGuiModuleDebugLabels();
  
  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = RaylibGuiModuleCaptureIds();

  RaylibGuiModuleBase(super.rl);

  /// Enable gui controls (global state)
  void GuiEnable();

  /// Disable gui controls (global state
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
    FontStructType font,
  );

  /// Get gui custom font (global state)
  FontStructType GuiGetFont();

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
    ColorStructType color,
  );

  /// Get text width considering gui style and icon size (if required)
  int GuiGetTextWidth(
    String? text,
  );

  /// Window Box control, shows a window that can be closed
  int GuiWindowBox(
    RectangleStructType bounds,
    String? title,
  );

  /// Group Box control with text name
  int GuiGroupBox(
    RectangleStructType bounds,
    String? text,
  );

  /// Line separator control, could contain text
  int GuiLine(
    RectangleStructType bounds,
    String? text,
  );

  /// Panel control, useful to group controls
  int GuiPanel(
    RectangleStructType bounds,
    String? text,
  );

  /// Tab Bar control, returns TAB to be closed or -1
  (int tab, int active) GuiTabBar(
    RectangleStructType bounds,
    List<String> text,
  );

  /// Scroll Panel control
  int GuiScrollPanel(
    RectangleStructType bounds,
    String? text,
    RectangleStructType content,
    Vector2StructType scroll,
    [RectangleStructType? view]
  );

  /// Label control
  int GuiLabel(
    RectangleStructType bounds,
    String? text,
  );

  /// Button control, returns true when clicked
  /// 
  /// Returns `int` rather than `bool` to match Raygui's uniform `result`
  /// convention across all controls.
  /// 
  /// Use `GuiButton(...) == 1` to test for a click.
  int GuiButton(
    RectangleStructType bounds,
    String? text,
  );

  /// Label button control, returns true when clicked
  /// 
  /// Returns `int` rather than `bool` to match Raygui's uniform `result`
  /// convention across all controls.
  /// 
  /// Use `GuiLabelButton(...) == 1` to test for a click.
  int GuiLabelButton(
    RectangleStructType bounds,
    String? text,
  );

  /// Toggle Button control
  (int result, bool active) GuiToggle(
    RectangleStructType bounds,
    String? text,
    bool active,
  );

  /// Toggle Group control
  (int result, int active) GuiToggleGroup(
    RectangleStructType bounds,
    String? text,
    num active,
  );

  /// Toggle Slider control
  (int result, int active) GuiToggleSlider(
    RectangleStructType bounds,
    String? text,
    num active,
  );

  /// Check Box control, returns true when active
  (int result, bool checked) GuiCheckBox(
    RectangleStructType bounds,
    String? text,
    bool checked,
  );

  /// Combo Box control
  (int result, int active) GuiComboBox(
    RectangleStructType bounds,
    String? text,
    num active,
  );

  /// Dropdown Box control
  (int result, int active) GuiDropdownBox(
    RectangleStructType bounds,
    String? text,
    num active,
    bool editMode,
  );

  /// Spinner control
  (int result, int value) GuiSpinner(
    RectangleStructType bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  );

  /// Value Box control, updates input text with numbers
  (int result, int value) GuiValueBox(
    RectangleStructType bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  );

  /// Value box control for float values
  (int result, double value) GuiValueBoxFloat(
    RectangleStructType bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  );

  /// Text Box control, updates input text
  (int result, String value) GuiTextBox(
    RectangleStructType bounds,
    String? text,
    num textSize,
    bool editMode,
  );

  /// Slider control
  (int result, double value) GuiSlider(
    RectangleStructType bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  /// Slider Bar control
  (int result, double value) GuiSliderBar(
    RectangleStructType bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  /// Progress Bar control
  (int result, double value) GuiProgressBar(
    RectangleStructType bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  /// Status Bar control, shows info text
  int GuiStatusBar(
    RectangleStructType bounds,
    String? text,
  );

  /// Dummy control for placeholders
  int GuiDummyRec(
    RectangleStructType bounds,
    String? text,
  );

  /// Grid control
  int GuiGrid(
    RectangleStructType bounds,
    num spacing,
    num subdivs,
    [Vector2StructType? mouseCell]
  );

  /// List View control
  (int result, int? scrollIndex, int? active) GuiListView(
    RectangleStructType bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  );

  /// List View with extended parameters
  (int result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
    RectangleStructType bounds,
    List<String>? text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  );

  /// Message Box control, displays a message
  int GuiMessageBox(
    RectangleStructType bounds,
    String? title,
    String message,
    String buttons,
  );

  /// Text Input Box control, ask for text, supports secret
  (int result, String value, bool? secretViewActive) GuiTextInputBox(
    RectangleStructType bounds,
    String? title,
    String? message,
    String buttons,
    String? text,
    num textMaxSize,
    bool? secretViewActive,
  );

  /// Color Picker control (multiple color controls)
  (int result, ColorStructType color) GuiColorPicker(
    RectangleStructType bounds,
    ColorStructType? color,
  );

  /// Color Panel control
  (int result, ColorStructType color) GuiColorPanel(
    RectangleStructType bounds,
    ColorStructType color,
  );

  /// Color Bar Alpha control
  (int result, double alpha) GuiColorBarAlpha(
    RectangleStructType bounds,
    num alpha,
  );

  /// Color Bar Hue control
  (int result, double value) GuiColorBarHue(
    RectangleStructType bounds,
    num value,
  );

  /// Color Picker control that avoids conversion to RGB on each call (multiple color controls)
  (int result, Vector3StructType hsv) GuiColorPickerHSV(
    RectangleStructType bounds,
    [Vector3StructType? colorHsv]
  );

  /// Color Panel control that updates Hue-Saturation-Value color value, used by GuiColorPickerHSV()
  (int result, Vector3StructType hsv) GuiColorPanelHSV(
    RectangleStructType bounds,
    [Vector3StructType? colorHsv]
  );
}
