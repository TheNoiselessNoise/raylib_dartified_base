import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibGuiDart get _module => RaylibBase.instance.module();

/// See [RaylibGuiDart.GuiEnable].
void GuiEnable() => _module.GuiEnable();

/// See [RaylibGuiDart.GuiDisable].
void GuiDisable() => _module.GuiDisable();

/// See [RaylibGuiDart.GuiLock].
void GuiLock() => _module.GuiLock();

/// See [RaylibGuiDart.GuiUnlock].
void GuiUnlock() => _module.GuiUnlock();

/// See [RaylibGuiDart.GuiIsLocked].
bool GuiIsLocked() => _module.GuiIsLocked();

/// See [RaylibGuiDart.GuiSetAlpha].
void GuiSetAlpha(
  num alpha,
) => _module.GuiSetAlpha(alpha);

/// See [RaylibGuiDart.GuiSetState].
void GuiSetState(
  GuiState state,
) => _module.GuiSetState(state);

/// See [RaylibGuiDart.GuiGetState].
int GuiGetState() => _module.GuiGetState();

/// See [RaylibGuiDart.GuiSetFont].
void GuiSetFont(
  FontD font,
) => _module.GuiSetFont(font);

/// See [RaylibGuiDart.GuiGetFont].
FontD GuiGetFont() => _module.GuiGetFont();

/// See [RaylibGuiDart.GuiSetStyle].
void GuiSetStyle(
  GuiControl control,
  GuiProperty property,
  num value,
) => _module.GuiSetStyle(control, property, value);

/// See [RaylibGuiDart.GuiGetStyle].
int GuiGetStyle(
  GuiControl control,
  GuiProperty property,
) => _module.GuiGetStyle(control, property);

/// See [RaylibGuiDart.GuiLoadStyle].
void GuiLoadStyle(
  String fileName,
) => _module.GuiLoadStyle(fileName);

/// See [RaylibGuiDart.GuiLoadStyleFromMemory].
void GuiLoadStyleFromMemory(
  Uint8List fileData,
) => _module.GuiLoadStyleFromMemory(fileData);

/// See [RaylibGuiDart.GuiLoadStyleDefault].
void GuiLoadStyleDefault() => _module.GuiLoadStyleDefault();

/// See [RaylibGuiDart.GuiEnableTooltip].
void GuiEnableTooltip() => _module.GuiEnableTooltip();

/// See [RaylibGuiDart.GuiDisableTooltip].
void GuiDisableTooltip() => _module.GuiDisableTooltip();

/// See [RaylibGuiDart.GuiSetTooltip].
void GuiSetTooltip(
  String? tooltip,
) => _module.GuiSetTooltip(tooltip);

/// See [RaylibGuiDart.GuiIconText].
String GuiIconText(
  GuiIconName iconId,
  String? text,
) => _module.GuiIconText(iconId, text);

/// See [RaylibGuiDart.GuiSetIconScale].
void GuiSetIconScale(
  num scale,
) => _module.GuiSetIconScale(scale);

/// See [RaylibGuiDart.GuiGetIcons].
List<int> GuiGetIcons() => _module.GuiGetIcons();

/// See [RaylibGuiDart.GuiLoadIcons].
List<String> GuiLoadIcons(
  String fileName,
  bool loadIconsName,
) => _module.GuiLoadIcons(fileName, loadIconsName);

/// See [RaylibGuiDart.GuiLoadIconsFromMemory].
List<String> GuiLoadIconsFromMemory(
  Uint8List fileData,
  bool loadIconsName,
) => _module.GuiLoadIconsFromMemory(fileData, loadIconsName);

/// See [RaylibGuiDart.GuiDrawIcon].
void GuiDrawIcon(
  GuiIconName iconId,
  num posX,
  num posY,
  num pixelSize,
  ColorD color,
) => _module.GuiDrawIcon(iconId, posX, posY, pixelSize, color);

/// See [RaylibGuiDart.GuiGetTextWidth].
int GuiGetTextWidth(
  String? text,
) => _module.GuiGetTextWidth(text);

/// See [RaylibGuiDart.GuiWindowBox].
GuiResult GuiWindowBox(
  RectangleD bounds,
  String? title,
) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGuiDart.GuiGroupBox].
GuiResult GuiGroupBox(
  RectangleD bounds,
  String? text,
) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGuiDart.GuiLine].
GuiResult GuiLine(
  RectangleD bounds,
  String? text,
) => _module.GuiLine(bounds, text);

/// See [RaylibGuiDart.GuiPanel].
GuiResult GuiPanel(
  RectangleD bounds,
  String? text,
) => _module.GuiPanel(bounds, text);

/// See [RaylibGuiDart.GuiScrollPanel].
GuiResult GuiScrollPanel(
  RectangleD bounds,
  String? text,
  RectangleD content, {
  Vector2D? scroll,
  RectangleD? view,
}) => _module.GuiScrollPanel(bounds, text, content, scroll: scroll, view: view);

/// See [RaylibGuiDart.GuiLabel].
GuiResult GuiLabel(
  RectangleD bounds,
  String? text,
) => _module.GuiLabel(bounds, text);

/// See [RaylibGuiDart.GuiButton].
GuiResult GuiButton(
  RectangleD bounds,
  String? text,
) => _module.GuiButton(bounds, text);

/// See [RaylibGuiDart.GuiLabelButton].
GuiResult GuiLabelButton(
  RectangleD bounds,
  String? text,
) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGuiDart.GuiToggle].
(GuiResult result, bool active) GuiToggle(
  RectangleD bounds,
  String? text,
  bool active,
) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGuiDart.GuiToggleGroup].
(GuiResult result, int active) GuiToggleGroup(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGuiDart.GuiToggleSlider].
(GuiResult result, int active) GuiToggleSlider(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGuiDart.GuiCheckBox].
(GuiResult result, bool checked) GuiCheckBox(
  RectangleD bounds,
  String? text,
  bool checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGuiDart.GuiComboBox].
(GuiResult result, int active) GuiComboBox(
  RectangleD bounds,
  String? text,
  num active,
) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGuiDart.GuiDropdownBox].
(GuiResult result, int active) GuiDropdownBox(
  RectangleD bounds,
  String? text,
  num active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGuiDart.GuiSpinner].
(GuiResult result, int value) GuiSpinner(
  RectangleD bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiDart.GuiValueBox].
(GuiResult result, int value) GuiValueBox(
  RectangleD bounds,
  String? text,
  num value,
  num minValue,
  num maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiDart.GuiValueBoxFloat].
(GuiResult result, double value) GuiValueBoxFloat(
  RectangleD bounds,
  String? text,
  String textValue,
  num value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGuiDart.GuiTextBox].
(GuiResult result, String value) GuiTextBox(
  RectangleD bounds,
  String? text,
  num textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGuiDart.GuiSlider].
(GuiResult result, double value) GuiSlider(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiDart.GuiSliderBar].
(GuiResult result, double value) GuiSliderBar(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiDart.GuiProgressBar].
(GuiResult result, double value) GuiProgressBar(
  RectangleD bounds,
  String? textLeft,
  String? textRight,
  num value,
  num minValue,
  num maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiDart.GuiStatusBar].
GuiResult GuiStatusBar(
  RectangleD bounds,
  String? text,
) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGuiDart.GuiDummyRec].
GuiResult GuiDummyRec(
  RectangleD bounds,
  String? text,
) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGuiDart.GuiGrid].
GuiResult GuiGrid(
  RectangleD bounds,
  num spacing,
  num subdivs, {
  Vector2D? mouseCell,
}) => _module.GuiGrid(bounds, spacing, subdivs, mouseCell: mouseCell);

/// See [RaylibGuiDart.GuiListView].
(GuiResult result, int? scrollIndex, int? active) GuiListView(
  RectangleD bounds,
  String? text, {
  int? scrollIndex,
  int? active,
}) => _module.GuiListView(bounds, text, scrollIndex: scrollIndex, active: active);

/// See [RaylibGuiDart.GuiListViewEx].
(GuiResult result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
  RectangleD bounds,
  List<String>? text, {
  int? scrollIndex,
  int? active,
  int? focus,
}) => _module.GuiListViewEx(bounds, text, scrollIndex: scrollIndex, active: active, focus: focus);

/// See [RaylibGuiDart.GuiTabBar].
(GuiResult result, int active) GuiTabBar(
  RectangleD bounds,
  String? text,
  int active,
) => _module.GuiTabBar(bounds, text, active);

/// See [RaylibGuiDart.GuiTabBarEx].
(GuiResult result, int active) GuiTabBarEx(
  RectangleD bounds,
  List<String>? text, {
  int? active,
}) => _module.GuiTabBarEx(bounds, text, active: active);

/// See [RaylibGuiDart.GuiMessageBox].
(GuiResult result, int btnActive) GuiMessageBox(
  RectangleD bounds,
  String? title,
  String message,
  String btnText,
) => _module.GuiMessageBox(bounds, title, message, btnText);

/// See [RaylibGuiDart.GuiTextInputBox].
(GuiResult result, String value, int btnActive, bool? secretViewActive) GuiTextInputBox(
  RectangleD bounds,
  String? title,
  String? message,
  String? text,
  num textSize,
  String btnText,
  [bool? secretViewActive]
) => _module.GuiTextInputBox(bounds, title, message, text, textSize, btnText, secretViewActive);

/// See [RaylibGuiDart.GuiColorPicker].
(GuiResult result, ColorD color) GuiColorPicker(
  RectangleD bounds,
  ColorD? color,
) => _module.GuiColorPicker(bounds, color);

/// See [RaylibGuiDart.GuiColorPanel].
(GuiResult result, ColorD color) GuiColorPanel(
  RectangleD bounds,
  ColorD color,
) => _module.GuiColorPanel(bounds, color);

/// See [RaylibGuiDart.GuiColorBarAlpha].
(GuiResult result, double alpha) GuiColorBarAlpha(
  RectangleD bounds,
  num alpha,
) => _module.GuiColorBarAlpha(bounds, alpha);

/// See [RaylibGuiDart.GuiColorBarHue].
(GuiResult result, double value) GuiColorBarHue(
  RectangleD bounds,
  num value,
) => _module.GuiColorBarHue(bounds, value);

/// See [RaylibGuiDart.GuiColorPickerHSV].
(GuiResult result, Vector3D hsv) GuiColorPickerHSV(
  RectangleD bounds,
  [Vector3D? colorHsv]
) => _module.GuiColorPickerHSV(bounds, colorHsv);

/// See [RaylibGuiDart.GuiColorPanelHSV].
(GuiResult result, Vector3D hsv) GuiColorPanelHSV(
  RectangleD bounds,
  [Vector3D? colorHsv]
) => _module.GuiColorPanelHSV(bounds, colorHsv);
