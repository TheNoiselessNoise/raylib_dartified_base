import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibGuiFlat get _module => RaylibBase.instance.module();

/// See [RaylibGuiFlat.GuiEnable].
void GuiEnable() => _module.GuiEnable();

/// See [RaylibGuiFlat.GuiDisable].
void GuiDisable() => _module.GuiDisable();

/// See [RaylibGuiFlat.GuiLock].
void GuiLock() => _module.GuiLock();

/// See [RaylibGuiFlat.GuiUnlock].
void GuiUnlock() => _module.GuiUnlock();

/// See [RaylibGuiFlat.GuiIsLocked].
bool GuiIsLocked() => _module.GuiIsLocked();

/// See [RaylibGuiFlat.GuiSetAlpha].
void GuiSetAlpha(
  double alpha,
) => _module.GuiSetAlpha(alpha);

/// See [RaylibGuiFlat.GuiSetState].
void GuiSetState(
  int state,
) => _module.GuiSetState(state);

/// See [RaylibGuiFlat.GuiGetState].
int GuiGetState() => _module.GuiGetState();

/// See [RaylibGuiFlat.GuiSetFont].
void GuiSetFont(
  Font font,
) => _module.GuiSetFont(font);

/// See [RaylibGuiFlat.GuiGetFont].
Font GuiGetFont() => _module.GuiGetFont();

/// See [RaylibGuiFlat.GuiSetStyle].
void GuiSetStyle(
  int control,
  int property,
  int value,
) => _module.GuiSetStyle(control, property, value);

/// See [RaylibGuiFlat.GuiGetStyle].
int GuiGetStyle(
  int control,
  int property,
) => _module.GuiGetStyle(control, property);

/// See [RaylibGuiFlat.GuiLoadStyle].
void GuiLoadStyle(
  MemoryPointer<RChar> fileName,
) => _module.GuiLoadStyle(fileName);

/// See [RaylibGuiFlat.GuiLoadStyle].
void GuiLoadStyleFromMemory(
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
) => _module.GuiLoadStyleFromMemory(fileData, dataSize);

/// See [RaylibGuiFlat.GuiLoadStyleDefault].
void GuiLoadStyleDefault() => _module.GuiLoadStyleDefault();

/// See [RaylibGuiFlat.GuiEnableTooltip].
void GuiEnableTooltip() => _module.GuiEnableTooltip();

/// See [RaylibGuiFlat.GuiDisableTooltip].
void GuiDisableTooltip() => _module.GuiDisableTooltip();

/// See [RaylibGuiFlat.GuiSetTooltip].
void GuiSetTooltip(
  MemoryPointer<RChar> tooltip,
) => _module.GuiSetTooltip(tooltip);

/// See [RaylibGuiFlat.GuiIconText].
MemoryPointer<RChar> GuiIconText(
  int iconId,
  MemoryPointer<RChar> text,
) => _module.GuiIconText(iconId, text);

/// See [RaylibGuiFlat.GuiSetIconScale].
void GuiSetIconScale(
  int scale,
) => _module.GuiSetIconScale(scale);

/// See [RaylibGuiFlat.GuiGetIcons].
MemoryPointer<RUnsignedInt> GuiGetIcons() => _module.GuiGetIcons();

/// See [RaylibGuiFlat.GuiLoadIcons].
MemoryPointer<RPointer<RChar>> GuiLoadIcons(
  MemoryPointer<RChar> fileName,
  bool loadIconsName,
) => _module.GuiLoadIcons(fileName, loadIconsName);

/// See [RaylibGuiFlat.GuiLoadIconsFromMemory].
MemoryPointer<RPointer<RChar>> GuiLoadIconsFromMemory(
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
  bool loadIconsName,
) => _module.GuiLoadIconsFromMemory(fileData, dataSize, loadIconsName);

/// See [RaylibGuiFlat.GuiDrawIcon].
void GuiDrawIcon(
  int iconId,
  int posX,
  int posY,
  int pixelSize,
  Color color,
) => _module.GuiDrawIcon(iconId, posX, posY, pixelSize, color);

/// See [RaylibGuiFlat.GuiGetTextWidth].
int GuiGetTextWidth(
  MemoryPointer<RChar> text,
) => _module.GuiGetTextWidth(text);

/// See [RaylibGuiFlat.GuiWindowBox].
int GuiWindowBox(
  Rectangle bounds,
  MemoryPointer<RChar> title,
) => _module.GuiWindowBox(bounds, title);

/// See [RaylibGuiFlat.GuiGroupBox].
int GuiGroupBox(
  Rectangle bounds,
  MemoryPointer<RChar> text,
) => _module.GuiGroupBox(bounds, text);

/// See [RaylibGuiFlat.GuiLine].
int GuiLine(
  Rectangle bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLine(bounds, text);

/// See [RaylibGuiFlat.GuiPanel].
int GuiPanel(
  Rectangle bounds,
  MemoryPointer<RChar> text,
) => _module.GuiPanel(bounds, text);

/// See [RaylibGuiFlat.GuiScrollPanel].
int GuiScrollPanel(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  Rectangle content,
  StructPointer<Vector2> scroll,
  StructPointer<Rectangle> view,
) => _module.GuiScrollPanel(bounds, text, content, scroll, view);

/// See [RaylibGuiFlat.GuiLabel].
int GuiLabel(
  Rectangle bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLabel(bounds, text);

/// See [RaylibGuiFlat.GuiButton].
int GuiButton(
  Rectangle bounds,
  MemoryPointer<RChar> text,
) => _module.GuiButton(bounds, text);

/// See [RaylibGuiFlat.GuiLabelButton].
int GuiLabelButton(
  Rectangle bounds,
  MemoryPointer<RChar> text,
) => _module.GuiLabelButton(bounds, text);

/// See [RaylibGuiFlat.GuiToggle].
int GuiToggle(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RBool> active,
) => _module.GuiToggle(bounds, text, active);

/// See [RaylibGuiFlat.GuiToggleGroup].
int GuiToggleGroup(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiToggleGroup(bounds, text, active);

/// See [RaylibGuiFlat.GuiToggleSlider].
int GuiToggleSlider(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiToggleSlider(bounds, text, active);

/// See [RaylibGuiFlat.GuiCheckBox].
int GuiCheckBox(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RBool> checked,
) => _module.GuiCheckBox(bounds, text, checked);

/// See [RaylibGuiFlat.GuiComboBox].
int GuiComboBox(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
) => _module.GuiComboBox(bounds, text, active);

/// See [RaylibGuiFlat.GuiDropdownBox].
int GuiDropdownBox(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> active,
  bool editMode,
) => _module.GuiDropdownBox(bounds, text, active, editMode);

/// See [RaylibGuiFlat.GuiSpinner].
int GuiSpinner(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> value,
  int minValue,
  int maxValue,
  bool editMode,
) => _module.GuiSpinner(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiFlat.GuiValueBox].
int GuiValueBox(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> value,
  int minValue,
  int maxValue,
  bool editMode,
) => _module.GuiValueBox(bounds, text, value, minValue, maxValue, editMode);

/// See [RaylibGuiFlat.GuiValueBoxFloat].
int GuiValueBoxFloat(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> textValue,
  MemoryPointer<RFloat> value,
  bool editMode,
) => _module.GuiValueBoxFloat(bounds, text, textValue, value, editMode);

/// See [RaylibGuiFlat.GuiTextBox].
int GuiTextBox(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  int textSize,
  bool editMode,
) => _module.GuiTextBox(bounds, text, textSize, editMode);

/// See [RaylibGuiFlat.GuiSlider].
int GuiSlider(
  Rectangle bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlat.GuiSliderBar].
int GuiSliderBar(
  Rectangle bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlat.GuiProgressBar].
int GuiProgressBar(
  Rectangle bounds,
  MemoryPointer<RChar> textLeft,
  MemoryPointer<RChar> textRight,
  MemoryPointer<RFloat> value,
  double minValue,
  double maxValue,
) => _module.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue);

/// See [RaylibGuiFlat.GuiStatusBar].
int GuiStatusBar(
  Rectangle bounds,
  MemoryPointer<RChar> text,
) => _module.GuiStatusBar(bounds, text);

/// See [RaylibGuiFlat.GuiDummyRec].
int GuiDummyRec(
  Rectangle bounds,
  MemoryPointer<RChar> text,
) => _module.GuiDummyRec(bounds, text);

/// See [RaylibGuiFlat.GuiGrid].
int GuiGrid(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  double spacing,
  int subdivs,
  StructPointer<Vector2> mouseCell,
) => _module.GuiGrid(bounds, text, spacing, subdivs, mouseCell);

/// See [RaylibGuiFlat.GuiListView].
int GuiListView(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> scrollIndex,
  MemoryPointer<RInt> active,
) => _module.GuiListView(bounds, text, scrollIndex, active);

/// See [RaylibGuiFlat.GuiListViewEx].
int GuiListViewEx(
  Rectangle bounds,
  MemoryPointer<RPointer<RChar>> text,
  int count,
  MemoryPointer<RInt> scrollIndex,
  MemoryPointer<RInt> active,
  MemoryPointer<RInt> focus,
) => _module.GuiListViewEx(bounds, text, count, scrollIndex, active, focus);

/// See [RaylibGuiFlat.GuiTabBar].
int GuiTabBar(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> hscroll,
  MemoryPointer<RInt> active,
) => _module.GuiTabBar(bounds, text, hscroll, active);

/// See [RaylibGuiFlat.GuiTabBarEx].
int GuiTabBarEx(
  Rectangle bounds,
  MemoryPointer<RPointer<RChar>> text,
  int count,
  MemoryPointer<RInt> hscroll,
  MemoryPointer<RInt> active,
  MemoryPointer<RInt> focus,
) => _module.GuiTabBarEx(bounds, text, count, hscroll, active, focus);

/// See [RaylibGuiFlat.GuiMessageBox].
int GuiMessageBox(
  Rectangle bounds,
  MemoryPointer<RChar> title,
  MemoryPointer<RChar> message,
  MemoryPointer<RChar> btnText,
  MemoryPointer<RInt> btnActive,
) => _module.GuiMessageBox(bounds, title, message, btnText, btnActive);

/// See [RaylibGuiFlat.GuiTextInputBox].
int GuiTextInputBox(
  Rectangle bounds,
  MemoryPointer<RChar> title,
  MemoryPointer<RChar> message,
  MemoryPointer<RChar> text,
  int textSize,
  MemoryPointer<RChar> btnText,
  MemoryPointer<RInt> btnActive,
  MemoryPointer<RBool> secretViewActive,
) => _module.GuiTextInputBox(bounds, title, message, text, textSize, btnText, btnActive, secretViewActive);

/// See [RaylibGuiFlat.GuiColorPicker].
int GuiColorPicker(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  StructPointer<Color> color,
) => _module.GuiColorPicker(bounds, text, color);

/// See [RaylibGuiFlat.GuiColorPanel].
int GuiColorPanel(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  StructPointer<Color> color,
) => _module.GuiColorPanel(bounds, text, color);

/// See [RaylibGuiFlat.GuiColorBarAlpha].
int GuiColorBarAlpha(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RFloat> alpha,
) => _module.GuiColorBarAlpha(bounds, text, alpha);

/// See [RaylibGuiFlat.GuiColorBarHue].
int GuiColorBarHue(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  MemoryPointer<RFloat> value,
) => _module.GuiColorBarHue(bounds, text, value);

/// See [RaylibGuiFlat.GuiColorPickerHSV].
int GuiColorPickerHSV(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  StructPointer<Vector3> colorHsv,
) => _module.GuiColorPickerHSV(bounds, text, colorHsv);

/// See [RaylibGuiFlat.GuiColorPanelHSV].
int GuiColorPanelHSV(
  Rectangle bounds,
  MemoryPointer<RChar> text,
  StructPointer<Vector3> colorHsv,
) => _module.GuiColorPanelHSV(bounds, text, colorHsv);