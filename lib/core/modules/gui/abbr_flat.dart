import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibGuiFlatModule get _module => RaylibBase.instance.GuiFlat;

/// See [RaylibGuiFlatModule.GuiEnable].
void GuiEnable() => _module.GuiEnable();

/// See [RaylibGuiFlatModule.GuiDisable].
void GuiDisable() => _module.GuiDisable();

/// See [RaylibGuiFlatModule.GuiLock].
void GuiLock() => _module.GuiLock();

/// See [RaylibGuiFlatModule.GuiUnlock].
void GuiUnlock() => _module.GuiUnlock();

/// See [RaylibGuiFlatModule.GuiIsLocked].
bool GuiIsLocked() => _module.GuiIsLocked();

/// See [RaylibGuiFlatModule.GuiSetAlpha].
void GuiSetAlpha(
  double alpha,
) => _module.GuiSetAlpha(alpha);

/// See [RaylibGuiFlatModule.GuiSetState].
void GuiSetState(
  int state,
) => _module.GuiSetState(state);

/// See [RaylibGuiFlatModule.GuiGetState].
int GuiGetState() => _module.GuiGetState();

/// See [RaylibGuiFlatModule.GuiSetFont].
void GuiSetFont(
  FontD font,
) => _module.GuiSetFont(font);

/// See [RaylibGuiFlatModule.GuiGetFont].
FontD GuiGetFont() => _module.GuiGetFont();

/// See [RaylibGuiFlatModule.GuiSetStyle].
void GuiSetStyle(
  int control,
  int property,
  int value,
) => _module.GuiSetStyle(control, property, value);

/// See [RaylibGuiFlatModule.GuiGetStyle].
int GuiGetStyle(
  int control,
  int property,
) => _module.GuiGetStyle(control, property);

/// See [RaylibGuiFlatModule.GuiLoadStyle].
void GuiLoadStyle(
  MemoryPointer<RChar> fileName,
) => _module.GuiLoadStyle(fileName);

/// See [RaylibGuiFlatModule.GuiLoadStyleDefault].
void GuiLoadStyleDefault() => _module.GuiLoadStyleDefault();

/// See [RaylibGuiFlatModule.GuiEnableTooltip].
void GuiEnableTooltip() => _module.GuiEnableTooltip();

/// See [RaylibGuiFlatModule.GuiDisableTooltip].
void GuiDisableTooltip() => _module.GuiDisableTooltip();

/// See [RaylibGuiFlatModule.GuiSetTooltip].
void GuiSetTooltip(
  MemoryPointer<RChar> tooltip,
) => _module.GuiSetTooltip(tooltip);

/// See [RaylibGuiFlatModule.GuiIconText].
MemoryPointer<RChar> GuiIconText(
  int iconId,
  MemoryPointer<RChar> text,
) => _module.GuiIconText(iconId, text);

/// See [RaylibGuiFlatModule.GuiSetIconScale].
void GuiSetIconScale(
  int scale,
) => _module.GuiSetIconScale(scale);

/// See [RaylibGuiFlatModule.GuiGetIcons].
MemoryPointer<RUnsignedInt> GuiGetIcons() => _module.GuiGetIcons();

/// See [RaylibGuiFlatModule.GuiLoadIcons].
MemoryPointer<RPointer<RChar>> GuiLoadIcons(
  MemoryPointer<RChar> fileName,
  bool loadIconsName,
) => _module.GuiLoadIcons(fileName, loadIconsName);

/// See [RaylibGuiFlatModule.GuiDrawIcon].
void GuiDrawIcon(
  int iconId,
  int posX,
  int posY,
  int pixelSize,
  ColorD color,
) => _module.GuiDrawIcon(iconId, posX, posY, pixelSize, color);

/// See [RaylibGuiFlatModule.GuiGetTextWidth].
int GuiGetTextWidth(
  MemoryPointer<RChar> text,
) => _module.GuiGetTextWidth(text);

/// See [RaylibGuiFlatModule.GuiWindowBox].
int GuiWindowBox(
  RectangleD bounds,
  MemoryPointer<RChar> title,
) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGuiFlatModule.GuiGroupBox].
int GuiGroupBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGuiFlatModule.GuiLine].
int GuiLine(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLine(bounds, text);

/// See [RaylibGuiFlatModule.GuiPanel].
int GuiPanel(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiPanel(bounds, text);

/// See [RaylibGuiFlatModule.GuiTabBar].
int GuiTabBar(
  RectangleD bounds,
  MemoryPointer<RPointer<RChar>> text,
  int count,
  MemoryPointer<RInt> active,
) => _module.GuiTabBar(bounds, text, count, active);

/// See [RaylibGuiFlatModule.GuiScrollPanel].
int GuiScrollPanel(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  RectangleD content,
  StructPointer<Vector2D> scroll,
  StructPointer<RectangleD> view,
) => _module.GuiScrollPanel(bounds, text, content, scroll, view);

/// See [RaylibGuiFlatModule.GuiLabel].
int GuiLabel(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLabel(bounds, text);

/// See [RaylibGuiFlatModule.GuiButton].
int GuiButton(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiButton(bounds, text);

/// See [RaylibGuiFlatModule.GuiLabelButton].
int GuiLabelButton(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGuiFlatModule.GuiToggle].
int GuiToggle(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RBool> active,
) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGuiFlatModule.GuiToggleGroup].
int GuiToggleGroup(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGuiFlatModule.GuiToggleSlider].
int GuiToggleSlider(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGuiFlatModule.GuiCheckBox].
int GuiCheckBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RBool> checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGuiFlatModule.GuiComboBox].
int GuiComboBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGuiFlatModule.GuiDropdownBox].
int GuiDropdownBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGuiFlatModule.GuiSpinner].
int GuiSpinner(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> value,
  int minValue,
  int maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiFlatModule.GuiValueBox].
int GuiValueBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> value,
  int minValue,
  int maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiFlatModule.GuiValueBoxFloat].
int GuiValueBoxFloat(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> textValue,
  MemoryPointer<RFloat> value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGuiFlatModule.GuiTextBox].
int GuiTextBox(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  int textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGuiFlatModule.GuiSlider].
int GuiSlider(
  RectangleD bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlatModule.GuiSliderBar].
int GuiSliderBar(
  RectangleD bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlatModule.GuiProgressBar].
int GuiProgressBar(
  RectangleD bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlatModule.GuiStatusBar].
int GuiStatusBar(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGuiFlatModule.GuiDummyRec].
int GuiDummyRec(
  RectangleD bounds,
  MemoryPointer<RChar> text,
) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGuiFlatModule.GuiGrid].
int GuiGrid(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  double spacing,
  int subdivs,
  StructPointer<Vector2D> mouseCell,
) => _module.GuiGrid(bounds, text, spacing, subdivs, mouseCell);

/// See [RaylibGuiFlatModule.GuiListView].
int GuiListView(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> scrollIndex,
  MemoryPointer<RInt> active,
) => _module.GuiListView(bounds, text, scrollIndex, active);

/// See [RaylibGuiFlatModule.GuiListViewEx].
int GuiListViewEx(
  RectangleD bounds,
  MemoryPointer<RPointer<RChar>> text,
  int count,
  MemoryPointer<RInt> scrollIndex,
  MemoryPointer<RInt> active,
  MemoryPointer<RInt> focus,
) => _module.GuiListViewEx(bounds, text, count, scrollIndex, active, focus);

/// See [RaylibGuiFlatModule.GuiMessageBox].
int GuiMessageBox(
  RectangleD bounds,
  MemoryPointer<RChar> title,
  MemoryPointer<RChar> message,
  MemoryPointer<RChar> buttons,
) => _module.GuiMessageBox(bounds, title, message, buttons);

/// See [RaylibGuiFlatModule.GuiTextInputBox].
int GuiTextInputBox(
  RectangleD bounds,
  MemoryPointer<RChar> title,
  MemoryPointer<RChar> message,
  MemoryPointer<RChar> buttons,
  MemoryPointer<RChar> text,
  int textMaxSize,
  MemoryPointer<RBool> secretViewActive,
) => _module.GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive);

/// See [RaylibGuiFlatModule.GuiColorPicker].
int GuiColorPicker(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  StructPointer<ColorD> color,
) => _module.GuiColorPicker(bounds, text, color);

/// See [RaylibGuiFlatModule.GuiColorPanel].
int GuiColorPanel(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  StructPointer<ColorD> color,
) => _module.GuiColorPanel(bounds, text, color);

/// See [RaylibGuiFlatModule.GuiColorBarAlpha].
int GuiColorBarAlpha(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RFloat> alpha,
) => _module.GuiColorBarAlpha(bounds, text, alpha);

/// See [RaylibGuiFlatModule.GuiColorBarHue].
int GuiColorBarHue(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RFloat> value,
) => _module.GuiColorBarHue(bounds, text, value);

/// See [RaylibGuiFlatModule.GuiColorPickerHSV].
int GuiColorPickerHSV(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  StructPointer<Vector3D> colorHsv,
) => _module.GuiColorPickerHSV(bounds, text, colorHsv);

/// See [RaylibGuiFlatModule.GuiColorPanelHSV].
int GuiColorPanelHSV(
  RectangleD bounds,
  MemoryPointer<RChar> text,
  StructPointer<Vector3D> colorHsv,
) => _module.GuiColorPanelHSV(bounds, text, colorHsv);