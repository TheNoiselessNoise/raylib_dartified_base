import 'dart:typed_data';
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

/// See [RaylibGuiModule.GuiLoadStyleFromMemory].
void GuiLoadStyleFromMemory(
  Uint8List fileData,
) => _module.GuiLoadStyleFromMemory(fileData);

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

/// See [RaylibGuiModule.GuiLoadIconsFromMemory].
List<String> GuiLoadIconsFromMemory(
  Uint8List fileData,
  bool loadIconsName,
) => _module.GuiLoadIconsFromMemory(fileData, loadIconsName);

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
GuiResult GuiWindowBox(
  RectangleD bounds,
  String? title,
) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGuiModule.GuiGroupBox].
GuiResult GuiGroupBox(
  RectangleD bounds,
  String? text,
) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGuiModule.GuiLine].
GuiResult GuiLine(
  RectangleD bounds,
  String? text,
) => _module.GuiLine(bounds, text);

/// See [RaylibGuiModule.GuiPanel].
GuiResult GuiPanel(
  RectangleD bounds,
  String? text,
) => _module.GuiPanel(bounds, text);

/// See [RaylibGuiModule.GuiScrollPanel].
GuiResult GuiScrollPanel(
  RectangleD bounds,
  String? text,
  RectangleD content, {
  Vector2D? scroll,
  RectangleD? view,
}) => _module.GuiScrollPanel(bounds, text, content, scroll: scroll, view: view);

/// See [RaylibGuiModule.GuiLabel].
GuiResult GuiLabel(
  RectangleD bounds,
  String? text,
) => _module.GuiLabel(bounds, text);

/// See [RaylibGuiModule.GuiButton].
GuiResult GuiButton(
  RectangleD bounds,
  String? text,
) => _module.GuiButton(bounds, text);

/// See [RaylibGuiModule.GuiLabelButton].
GuiResult GuiLabelButton(
  RectangleD bounds,
  String? text,
) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGuiModule.GuiToggle].
(GuiResult result, bool active) GuiToggle(
  RectangleD bounds,
  String? text,
  bool active,
) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGuiModule.GuiToggleGroup].
(GuiResult result, int active) GuiToggleGroup(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGuiModule.GuiToggleSlider].
(GuiResult result, int active) GuiToggleSlider(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGuiModule.GuiCheckBox].
(GuiResult result, bool checked) GuiCheckBox(
  RectangleD bounds,
  String? text,
  bool checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGuiModule.GuiComboBox].
(GuiResult result, int active) GuiComboBox(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGuiModule.GuiDropdownBox].
(GuiResult result, int active) GuiDropdownBox(
  RectangleD bounds,
  String? text,
  num active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGuiModule.GuiSpinner].
(GuiResult result, int value) GuiSpinner(
  RectangleD bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiModule.GuiValueBox].
(GuiResult result, int value) GuiValueBox(
  RectangleD bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiModule.GuiValueBoxFloat].
(GuiResult result, double value) GuiValueBoxFloat(
  RectangleD bounds,
  String? text,
  String textValue,
  num value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGuiModule.GuiTextBox].
(GuiResult result, String value) GuiTextBox(
  RectangleD bounds,
  String? text,
  num textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGuiModule.GuiSlider].
(GuiResult result, double value) GuiSlider(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiModule.GuiSliderBar].
(GuiResult result, double value) GuiSliderBar(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiModule.GuiProgressBar].
(GuiResult result, double value) GuiProgressBar(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiModule.GuiStatusBar].
GuiResult GuiStatusBar(
  RectangleD bounds,
  String? text,
) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGuiModule.GuiDummyRec].
GuiResult GuiDummyRec(
  RectangleD bounds,
  String? text,
) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGuiModule.GuiGrid].
GuiResult GuiGrid(
  RectangleD bounds,
  num spacing,
  num subdivs, {
  Vector2D? mouseCell,
}) => _module.GuiGrid(bounds, spacing, subdivs, mouseCell: mouseCell);

/// See [RaylibGuiModule.GuiListView].
(GuiResult result, int? scrollIndex, int? active) GuiListView(
  RectangleD bounds,
  String? text, {
  int? scrollIndex,
  int? active,
}) => _module.GuiListView(bounds, text, scrollIndex: scrollIndex, active: active);

/// See [RaylibGuiModule.GuiListViewEx].
(GuiResult result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
  RectangleD bounds,
  List<String>? text, {
  int? scrollIndex,
  int? active,
  int? focus,
}) => _module.GuiListViewEx(bounds, text, scrollIndex: scrollIndex, active: active, focus: focus);

/// See [RaylibGuiModule.GuiTabBar].
(GuiResult result, int active) GuiTabBar(
  RectangleD bounds,
  String? text,
  int active,
) => _module.GuiTabBar(bounds, text, active);

/// See [RaylibGuiModule.GuiTabBarEx].
(GuiResult result, int active) GuiTabBarEx(
  RectangleD bounds,
  List<String>? text, {
  int? active,
}) => _module.GuiTabBarEx(bounds, text, active: active);

/// See [RaylibGuiModule.GuiMessageBox].
(GuiResult result, int btnActive) GuiMessageBox(
  RectangleD bounds,
  String? title,
  String message,
  String btnText,
) => _module.GuiMessageBox(bounds, title, message, btnText);

/// See [RaylibGuiModule.GuiTextInputBox].
(GuiResult result, String value, int btnActive, bool? secretViewActive) GuiTextInputBox(
  RectangleD bounds,
  String? title,
  String? message,
  String? text,
  num textSize,
  String btnText,
  [bool? secretViewActive]
) => _module.GuiTextInputBox(bounds, title, message, text, textSize, btnText, secretViewActive);

/// See [RaylibGuiModule.GuiColorPicker].
(GuiResult result, ColorD color) GuiColorPicker(
  RectangleD bounds,
  ColorD? color,
) => _module.GuiColorPicker(bounds, color);

/// See [RaylibGuiModule.GuiColorPanel].
(GuiResult result, ColorD color) GuiColorPanel(
  RectangleD bounds,
  ColorD color,
) => _module.GuiColorPanel(bounds, color);

/// See [RaylibGuiModule.GuiColorBarAlpha].
(GuiResult result, double alpha) GuiColorBarAlpha(
  RectangleD bounds,
  num alpha,
) => _module.GuiColorBarAlpha(bounds, alpha);

/// See [RaylibGuiModule.GuiColorBarHue].
(GuiResult result, double value) GuiColorBarHue(
  RectangleD bounds,
  num value,
) => _module.GuiColorBarHue(bounds, value);

/// See [RaylibGuiModule.GuiColorPickerHSV].
(GuiResult result, Vector3D hsv) GuiColorPickerHSV(
  RectangleD bounds,
  [Vector3D? colorHsv]
) => _module.GuiColorPickerHSV(bounds, colorHsv);

/// See [RaylibGuiModule.GuiColorPanelHSV].
(GuiResult result, Vector3D hsv) GuiColorPanelHSV(
  RectangleD bounds,
  [Vector3D? colorHsv]
) => _module.GuiColorPanelHSV(bounds, colorHsv);
