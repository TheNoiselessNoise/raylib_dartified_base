part of '../../raylib_dartified_base.dart';

/// Re-exports [RaylibGuiConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibGuiModuleExtras<R extends RaylibBase> on RaylibModule<R> {
  int get RAYGUI_VERSION_MAJOR => RaylibGuiConstants.RAYGUI_VERSION_MAJOR;
  int get RAYGUI_VERSION_MINOR => RaylibGuiConstants.RAYGUI_VERSION_MINOR;
  int get RAYGUI_VERSION_PATCH => RaylibGuiConstants.RAYGUI_VERSION_PATCH;
  String get RAYGUI_VERSION => RaylibGuiConstants.RAYGUI_VERSION;
  int get RAYGUI_SCROLLBAR_LEFT_SIDE => RaylibGuiConstants.RAYGUI_SCROLLBAR_LEFT_SIDE;
  int get RAYGUI_SCROLLBAR_RIGHT_SIDE => RaylibGuiConstants.RAYGUI_SCROLLBAR_RIGHT_SIDE;
  int get RAYGUI_ICON_SIZE => RaylibGuiConstants.RAYGUI_ICON_SIZE;
  int get RAYGUI_ICON_MAX_ICONS => RaylibGuiConstants.RAYGUI_ICON_MAX_ICONS;
  int get RAYGUI_ICON_MAX_NAME_LENGTH => RaylibGuiConstants.RAYGUI_ICON_MAX_NAME_LENGTH;
  int get RAYGUI_ICON_DATA_ELEMENTS => RaylibGuiConstants.RAYGUI_ICON_DATA_ELEMENTS;
  int get RAYGUI_MAX_CONTROLS => RaylibGuiConstants.RAYGUI_MAX_CONTROLS;
  int get RAYGUI_MAX_PROPS_BASE => RaylibGuiConstants.RAYGUI_MAX_PROPS_BASE;
  int get RAYGUI_MAX_PROPS_EXTENDED => RaylibGuiConstants.RAYGUI_MAX_PROPS_EXTENDED;
  int get RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT => RaylibGuiConstants.RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT;
  int get RAYGUI_GROUPBOX_LINE_THICK => RaylibGuiConstants.RAYGUI_GROUPBOX_LINE_THICK;
  int get RAYGUI_LINE_MARGIN_TEXT => RaylibGuiConstants.RAYGUI_LINE_MARGIN_TEXT;
  int get RAYGUI_LINE_TEXT_PADDING => RaylibGuiConstants.RAYGUI_LINE_TEXT_PADDING;
  int get RAYGUI_PANEL_BORDER_WIDTH => RaylibGuiConstants.RAYGUI_PANEL_BORDER_WIDTH;
  int get RAYGUI_TABBAR_ITEM_WIDTH => RaylibGuiConstants.RAYGUI_TABBAR_ITEM_WIDTH;
  int get RAYGUI_MIN_SCROLLBAR_WIDTH => RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_WIDTH;
  int get RAYGUI_MIN_SCROLLBAR_HEIGHT => RaylibGuiConstants.RAYGUI_MIN_SCROLLBAR_HEIGHT;
  int get RAYGUI_MIN_MOUSE_WHEEL_SPEED => RaylibGuiConstants.RAYGUI_MIN_MOUSE_WHEEL_SPEED;
  int get RAYGUI_TOGGLEGROUP_MAX_ITEMS => RaylibGuiConstants.RAYGUI_TOGGLEGROUP_MAX_ITEMS;
  int get RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN => RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN;
  int get RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY => RaylibGuiConstants.RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY;
  int get RAYGUI_VALUEBOX_MAX_CHARS => RaylibGuiConstants.RAYGUI_VALUEBOX_MAX_CHARS;
  int get RAYGUI_COLORBARALPHA_CHECKED_SIZE => RaylibGuiConstants.RAYGUI_COLORBARALPHA_CHECKED_SIZE;
  int get RAYGUI_MESSAGEBOX_BUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_HEIGHT;
  int get RAYGUI_MESSAGEBOX_BUTTON_PADDING => RaylibGuiConstants.RAYGUI_MESSAGEBOX_BUTTON_PADDING;
  int get RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT;
  int get RAYGUI_TEXTINPUTBOX_BUTTON_PADDING => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_BUTTON_PADDING;
  int get RAYGUI_TEXTINPUTBOX_HEIGHT => RaylibGuiConstants.RAYGUI_TEXTINPUTBOX_HEIGHT;
  double get RAYGUI_GRID_ALPHA => RaylibGuiConstants.RAYGUI_GRID_ALPHA;
  int get RAYGUI_MAX_LINE_BUFFER_SIZE => RaylibGuiConstants.RAYGUI_MAX_LINE_BUFFER_SIZE;
  int get RAYGUI_ICON_TEXT_PADDING => RaylibGuiConstants.RAYGUI_ICON_TEXT_PADDING;
  int get RAYGUI_MAX_TEXT_LINES => RaylibGuiConstants.RAYGUI_MAX_TEXT_LINES;
  int get RAYGUI_TEXTSPLIT_MAX_ITEMS => RaylibGuiConstants.RAYGUI_TEXTSPLIT_MAX_ITEMS;
  int get RAYGUI_TEXTSPLIT_MAX_TEXT_SIZE => RaylibGuiConstants.RAYGUI_TEXTSPLIT_MAX_TEXT_SIZE;
  int get RAYGUI_TEXTFORMAT_MAX_SIZE => RaylibGuiConstants.RAYGUI_TEXTFORMAT_MAX_SIZE;
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

  void GuiEnable();

  void GuiDisable();

  void GuiLock();

  void GuiUnlock();

  bool GuiIsLocked();

  void GuiSetAlpha(
    num alpha,
  );

  void GuiSetState(
    GuiState state,
  );

  int GuiGetState();

  void GuiSetFont(
    FontStructType font,
  );

  FontStructType GuiGetFont();

  void GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  );

  int GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  );

  void GuiLoadStyle(
    String fileName,
  );

  void GuiLoadStyleDefault();

  void GuiEnableTooltip();

  void GuiDisableTooltip();

  void GuiSetTooltip(
    String? tooltip,
  );

  String GuiIconText(
    GuiIconName iconId,
    String? text,
  );

  void GuiSetIconScale(
    num scale,
  );

  List<int> GuiGetIcons();

  List<String> GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  );

  void GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    ColorStructType color,
  );

  int GuiGetTextWidth(
    String? text,
  );

  int GuiWindowBox(
    RectangleStructType bounds,
    String? title,
  );

  int GuiGroupBox(
    RectangleStructType bounds,
    String? text,
  );

  int GuiLine(
    RectangleStructType bounds,
    String? text,
  );

  int GuiPanel(
    RectangleStructType bounds,
    String? text,
  );

  (int tab, int active) GuiTabBar(
    RectangleStructType bounds,
    List<String> text,
  );

  int GuiScrollPanel(
    RectangleStructType bounds,
    String? text,
    RectangleStructType content,
    Vector2StructType scroll,
    [RectangleStructType? view]
  );

  int GuiLabel(
    RectangleStructType bounds,
    String? text,
  );

  int GuiButton(
    RectangleStructType bounds,
    String? text,
  );

  int GuiLabelButton(
    RectangleStructType bounds,
    String? text,
  );

  (int result, bool active) GuiToggle(
    RectangleStructType bounds,
    String? text,
    bool active,
  );

  (int result, int active) GuiToggleGroup(
    RectangleStructType bounds,
    String? text,
    num active,
  );

  (int result, int active) GuiToggleSlider(
    RectangleStructType bounds,
    String? text,
    num active,
  );

  (int result, bool checked) GuiCheckBox(
    RectangleStructType bounds,
    String? text,
    bool checked,
  );

  (int result, int active) GuiComboBox(
    RectangleStructType bounds,
    String? text,
    num active,
  );

  (int result, int active) GuiDropdownBox(
    RectangleStructType bounds,
    String? text,
    num active,
    bool editMode,
  );

  (int result, int value) GuiSpinner(
    RectangleStructType bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  );

  (int result, int value) GuiValueBox(
    RectangleStructType bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  );

  (int result, double value) GuiValueBoxFloat(
    RectangleStructType bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  );

  (int result, String value) GuiTextBox(
    RectangleStructType bounds,
    String? text,
    num textSize,
    bool editMode,
  );

  (int result, double value) GuiSlider(
    RectangleStructType bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  (int result, double value) GuiSliderBar(
    RectangleStructType bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  (int result, double value) GuiProgressBar(
    RectangleStructType bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  );

  int GuiStatusBar(
    RectangleStructType bounds,
    String? text,
  );

  int GuiDummyRec(
    RectangleStructType bounds,
    String? text,
  );

  int GuiGrid(
    RectangleStructType bounds,
    num spacing,
    num subdivs,
    [Vector2StructType? mouseCell]
  );

  (int result, int scrollIndex, int active) GuiListView(
    RectangleStructType bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  );

  (int result, int scrollIndex, int active, int focus) GuiListViewEx(
    RectangleStructType bounds,
    List<String> text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  );

  int GuiMessageBox(
    RectangleStructType bounds,
    String? title,
    String message,
    String buttons,
  );

  (int result, String value, bool? secretViewActive) GuiTextInputBox(
    RectangleStructType bounds,
    String? title,
    String? message,
    String buttons,
    String? text,
    num textMaxSize,
    bool? secretViewActive,
  );

  (int result, ColorStructType color) GuiColorPicker(
    RectangleStructType bounds,
    ColorStructType? color,
  );

  (int result, ColorStructType color) GuiColorPanel(
    RectangleStructType bounds,
    ColorStructType color,
  );

  (int result, double alpha) GuiColorBarAlpha(
    RectangleStructType bounds,
    num alpha,
  );

  (int result, double value) GuiColorBarHue(
    RectangleStructType bounds,
    num value,
  );

  (int result, Vector3StructType hsv) GuiColorPickerHSV(
    RectangleStructType bounds,
    [Vector3StructType? colorHsv]
  );

  (int result, Vector3StructType hsv) GuiColorPanelHSV(
    RectangleStructType bounds,
    [Vector3StructType? colorHsv]
  );
}
