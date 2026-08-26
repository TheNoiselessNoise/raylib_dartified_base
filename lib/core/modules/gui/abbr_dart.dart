import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibGuiModule get _module => RaylibBase.instance.GuiDart;

/// See [RaylibGuiModule.GuiEnable].
void GuiEnable() => _module.GuiEnable();

/// See [RaylibGuiModule.GuiDisable].
void GuiDisable() => _module.GuiDisable();

/// See [RaylibGuiModule.GuiLock].
void GuiLock() => _module.GuiLock();

/// See [RaylibGuiModule.GuiUnlock].
void GuiUnlock() => _module.GuiUnlock();

/// See [RaylibGuiModule.GuiIsLocked].
bool GuiIsLocked() => _module.GuiIsLocked();

/// See [RaylibGuiModule.GuiSetAlpha].
void GuiSetAlpha(
  num alpha,
) => _module.GuiSetAlpha(alpha);

/// See [RaylibGuiModule.GuiSetState].
void GuiSetState(
  GuiState state,
) => _module.GuiSetState(state);

/// See [RaylibGuiModule.GuiGetState].
int GuiGetState() => _module.GuiGetState();

/// See [RaylibGuiModule.GuiSetFont].
void GuiSetFont(
  FontD font,
) => _module.GuiSetFont(font);

/// See [RaylibGuiModule.GuiGetFont].
FontD GuiGetFont() => _module.GuiGetFont();

/// See [RaylibGuiModule.GuiSetStyle].
void GuiSetStyle(
  GuiControl control,
  GuiProperty property,
  num value,
) => _module.GuiSetStyle(control, property, value);

/// See [RaylibGuiModule.GuiGetStyle].
int GuiGetStyle(
  GuiControl control,
  GuiProperty property,
) => _module.GuiGetStyle(control, property);

/// See [RaylibGuiModule.GuiLoadStyle].
void GuiLoadStyle(
  String fileName,
) => _module.GuiLoadStyle(fileName);

/// See [RaylibGuiModule.GuiLoadStyleDefault].
void GuiLoadStyleDefault() => _module.GuiLoadStyleDefault();

/// See [RaylibGuiModule.GuiEnableTooltip].
void GuiEnableTooltip() => _module.GuiEnableTooltip();

/// See [RaylibGuiModule.GuiDisableTooltip].
void GuiDisableTooltip() => _module.GuiDisableTooltip();

/// See [RaylibGuiModule.GuiSetTooltip].
void GuiSetTooltip(
  String? tooltip,
) => _module.GuiSetTooltip(tooltip);

/// See [RaylibGuiModule.GuiIconText].
String GuiIconText(
  GuiIconName iconId,
  String? text,
) => _module.GuiIconText(iconId, text);

/// See [RaylibGuiModule.GuiSetIconScale].
void GuiSetIconScale(
  num scale,
) => _module.GuiSetIconScale(scale);

/// See [RaylibGuiModule.GuiGetIcons].
List<int> GuiGetIcons() => _module.GuiGetIcons();

/// See [RaylibGuiModule.GuiLoadIcons].
List<String> GuiLoadIcons(
  String fileName,
  bool loadIconsName,
) => _module.GuiLoadIcons(fileName, loadIconsName);

/// See [RaylibGuiModule.GuiDrawIcon].
void GuiDrawIcon(
  GuiIconName iconId,
  num posX,
  num posY,
  num pixelSize,
  ColorD color,
) => _module.GuiDrawIcon(iconId, posX, posY, pixelSize, color);

/// See [RaylibGuiModule.GuiGetTextWidth].
int GuiGetTextWidth(
  String? text,
) => _module.GuiGetTextWidth(text);

/// See [RaylibGuiModule.GuiWindowBox].
int GuiWindowBox(
  RectangleD bounds,
  String? title,
) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGuiModule.GuiGroupBox].
int GuiGroupBox(
  RectangleD bounds,
  String? text,
) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGuiModule.GuiLine].
int GuiLine(
  RectangleD bounds,
  String? text,
) => _module.GuiLine(bounds, text);

/// See [RaylibGuiModule.GuiPanel].
int GuiPanel(
  RectangleD bounds,
  String? text,
) => _module.GuiPanel(bounds, text);

/// See [RaylibGuiModule.GuiTabBar].
(int tab, int active) GuiTabBar(
  RectangleD bounds,
  List<String> text,
) => _module.GuiTabBar(bounds, text);

/// See [RaylibGuiModule.GuiScrollPanel].
int GuiScrollPanel(
  RectangleD bounds,
  String? text,
  RectangleD content,
  Vector2D scroll,
  [RectangleD? view]
) => _module.GuiScrollPanel(bounds, text, content, scroll, view);

/// See [RaylibGuiModule.GuiLabel].
int GuiLabel(
  RectangleD bounds,
  String? text,
) => _module.GuiLabel(bounds, text);

/// See [RaylibGuiModule.GuiButton].
int GuiButton(
  RectangleD bounds,
  String? text,
) => _module.GuiButton(bounds, text);

/// See [RaylibGuiModule.GuiLabelButton].
int GuiLabelButton(
  RectangleD bounds,
  String? text,
) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGuiModule.GuiToggle].
(int result, bool active) GuiToggle(
  RectangleD bounds,
  String? text,
  bool active,
) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGuiModule.GuiToggleGroup].
(int result, int active) GuiToggleGroup(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGuiModule.GuiToggleSlider].
(int result, int active) GuiToggleSlider(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGuiModule.GuiCheckBox].
(int result, bool checked) GuiCheckBox(
  RectangleD bounds,
  String? text,
  bool checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGuiModule.GuiComboBox].
(int result, int active) GuiComboBox(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGuiModule.GuiDropdownBox].
(int result, int active) GuiDropdownBox(
  RectangleD bounds,
  String? text,
  num active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGuiModule.GuiSpinner].
(int result, int value) GuiSpinner(
  RectangleD bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiModule.GuiValueBox].
(int result, int value) GuiValueBox(
  RectangleD bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiModule.GuiValueBoxFloat].
(int result, double value) GuiValueBoxFloat(
  RectangleD bounds,
  String? text,
  String textValue,
  num value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGuiModule.GuiTextBox].
(int result, String value) GuiTextBox(
  RectangleD bounds,
  String? text,
  num textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGuiModule.GuiSlider].
(int result, double value) GuiSlider(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiModule.GuiSliderBar].
(int result, double value) GuiSliderBar(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiModule.GuiProgressBar].
(int result, double value) GuiProgressBar(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiModule.GuiStatusBar].
int GuiStatusBar(
  RectangleD bounds,
  String? text,
) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGuiModule.GuiDummyRec].
int GuiDummyRec(
  RectangleD bounds,
  String? text,
) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGuiModule.GuiGrid].
int GuiGrid(
  RectangleD bounds,
  num spacing,
  num subdivs,
  [Vector2D? mouseCell]
) => _module.GuiGrid(bounds, spacing, subdivs, mouseCell);

/// See [RaylibGuiModule.GuiListView].
(int result, int? scrollIndex, int? active) GuiListView(
  RectangleD bounds,
  String? text, {
    int? scrollIndex,
    int? active,
  }
) => _module.GuiListView(bounds, text, scrollIndex: scrollIndex, active: active);

/// See [RaylibGuiModule.GuiListViewEx].
(int result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
  RectangleD bounds,
  List<String>? text, {
    int? scrollIndex,
    int? active,
    int? focus,
  }
) => _module.GuiListViewEx(bounds, text, scrollIndex: scrollIndex, active: active, focus: focus);

/// See [RaylibGuiModule.GuiMessageBox].
int GuiMessageBox(
  RectangleD bounds,
  String? title,
  String message,
  String buttons,
) => _module.GuiMessageBox(bounds, title, message, buttons);

/// See [RaylibGuiModule.GuiTextInputBox].
(int result, String value, bool? secretViewActive) GuiTextInputBox(
  RectangleD bounds,
  String? title,
  String? message,
  String buttons,
  String? text,
  num textMaxSize,
  bool? secretViewActive,
) => _module.GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive);

/// See [RaylibGuiModule.GuiColorPicker].
(int result, ColorD color) GuiColorPicker(
  RectangleD bounds,
  ColorD? color,
) => _module.GuiColorPicker(bounds, color);

/// See [RaylibGuiModule.GuiColorPanel].
(int result, ColorD color) GuiColorPanel(
  RectangleD bounds,
  ColorD color,
) => _module.GuiColorPanel(bounds, color);

/// See [RaylibGuiModule.GuiColorBarAlpha].
(int result, double alpha) GuiColorBarAlpha(
  RectangleD bounds,
  num alpha,
) => _module.GuiColorBarAlpha(bounds, alpha);

/// See [RaylibGuiModule.GuiColorBarHue].
(int result, double value) GuiColorBarHue(
  RectangleD bounds,
  num value,
) => _module.GuiColorBarHue(bounds, value);

/// See [RaylibGuiModule.GuiColorPickerHSV].
(int result, Vector3D hsv) GuiColorPickerHSV(
  RectangleD bounds,
  [Vector3D? colorHsv]
) => _module.GuiColorPickerHSV(bounds, colorHsv);

/// See [RaylibGuiModule.GuiColorPanelHSV].
(int result, Vector3D hsv) GuiColorPanelHSV(
  RectangleD bounds,
  [Vector3D? colorHsv]
) => _module.GuiColorPanelHSV(bounds, colorHsv);
