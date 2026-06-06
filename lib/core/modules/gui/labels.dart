part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Gui module function call,
/// logged to the console when debug output is enabled.
class RaylibGuiModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibGuiModuleBase.GuiEnable].
  String GuiEnable() => 'GuiEnable()';

  /// Label for [RaylibGuiModuleBase.GuiDisable].
  String GuiDisable() => 'GuiDisable()';

  /// Label for [RaylibGuiModuleBase.GuiLock].
  String GuiLock() => 'GuiLock()';

  /// Label for [RaylibGuiModuleBase.GuiUnlock].
  String GuiUnlock() => 'GuiUnlock()';

  /// Label for [RaylibGuiModuleBase.GuiIsLocked].
  String GuiIsLocked() => 'GuiIsLocked()';

  /// Label for [RaylibGuiModuleBase.GuiSetAlpha].
  String GuiSetAlpha(
    num alpha,
  ) => 'GuiSetAlpha($alpha)';

  /// Label for [RaylibGuiModuleBase.GuiSetState].
  String GuiSetState(
    GuiState state,
  ) => 'GuiSetState($state)';

  /// Label for [RaylibGuiModuleBase.GuiGetState].
  String GuiGetState() => 'GuiGetState()';

  /// Label for [RaylibGuiModuleBase.GuiSetFont].
  String GuiSetFont(
    FontBase font,
  ) => 'GuiSetFont($font)';

  /// Label for [RaylibGuiModuleBase.GuiGetFont].
  String GuiGetFont() => 'GuiGetFont()';

  /// Label for [RaylibGuiModuleBase.GuiSetStyle].
  String GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  ) => 'GuiSetStyle(${control.name}, ${property.name}, $value)';

  /// Label for [RaylibGuiModuleBase.GuiGetStyle].
  String GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  ) => 'GuiGetStyle(${control.name}, ${property.name})';

  /// Label for [RaylibGuiModuleBase.GuiLoadStyle].
  String GuiLoadStyle(
    String fileName,
  ) => 'GuiLoadStyle($fileName)';

  /// Label for [RaylibGuiModuleBase.GuiLoadStyleDefault].
  String GuiLoadStyleDefault() => 'GuiLoadStyleDefault()';

  /// Label for [RaylibGuiModuleBase.GuiEnableTooltip].
  String GuiEnableTooltip() => 'GuiEnableTooltip()';

  /// Label for [RaylibGuiModuleBase.GuiDisableTooltip].
  String GuiDisableTooltip() => 'GuiDisableTooltip()';

  /// Label for [RaylibGuiModuleBase.GuiSetTooltip].
  String GuiSetTooltip(
    String? tooltip,
  ) => 'GuiSetTooltip($tooltip)';

  /// Label for [RaylibGuiModuleBase.GuiIconText].
  String GuiIconText(
    GuiIconName iconId,
    String? text,
  ) => 'GuiIconText(${iconId.name}, $text)';

  /// Label for [RaylibGuiModuleBase.GuiSetIconScale].
  String GuiSetIconScale(
    num scale,
  ) => 'GuiSetIconScale($scale)';

  /// Label for [RaylibGuiModuleBase.GuiGetIcons].
  String GuiGetIcons() => 'GuiGetIcons()';

  /// Label for [RaylibGuiModuleBase.GuiLoadIcons].
  String GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  ) => 'GuiLoadIcons($fileName, $loadIconsName)';

  /// Label for [RaylibGuiModuleBase.GuiDrawIcon].
  String GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    ColorBase color,
  ) => 'GuiDrawIcon(${iconId.name}, $posX, $posY, $pixelSize, $color)';

  /// Label for [RaylibGuiModuleBase.GuiGetTextWidth].
  String GuiGetTextWidth(
    String? text,
  ) => 'GuiGetTextWidth($text)';

  /// Label for [RaylibGuiModuleBase.GuiWindowBox].
  String GuiWindowBox(
    RectangleBase bounds,
    String? title,
  ) => 'GuiWindowBox($bounds, $title)';

  /// Label for [RaylibGuiModuleBase.GuiGroupBox].
  String GuiGroupBox(
    RectangleBase bounds,
    String? text,
  ) => 'GuiGroupBox($bounds, $text)';

  /// Label for [RaylibGuiModuleBase.GuiLine].
  String GuiLine(
    RectangleBase bounds,
    String? text,
  ) => 'GuiLine($bounds, $text)';

  /// Label for [RaylibGuiModuleBase.GuiPanel].
  String GuiPanel(
    RectangleBase bounds,
    String? text,
  ) => 'GuiPanel($bounds, $text)';

  /// Label for [RaylibGuiModuleBase.GuiTabBar].
  String GuiTabBar(
    RectangleBase bounds,
    List<String> text,
  ) => 'GuiTabBar($bounds, text: ${text.length})';

  /// Label for [RaylibGuiModuleBase.GuiScrollPanel].
  String GuiScrollPanel(
    RectangleBase bounds,
    String? text,
    RectangleBase content,
    Vector2Base scroll,
    [RectangleBase? view]
  ) => 'GuiScrollPanel($bounds, $text, $content, $scroll, $view)';

  /// Label for [RaylibGuiModuleBase.GuiLabel].
  String GuiLabel(
    RectangleBase bounds,
    String? text,
  ) => 'GuiLabel($bounds, $text)';

  /// Label for [RaylibGuiModuleBase.GuiButton].
  String GuiButton(
    RectangleBase bounds,
    String? text,
  ) => 'GuiButton($bounds, $text)';

  /// Label for [RaylibGuiModuleBase.GuiLabelButton].
  String GuiLabelButton(
    RectangleBase bounds,
    String? text,
  ) => 'GuiLabelButton($bounds, $text)';

  /// Label for [RaylibGuiModuleBase.GuiToggle].
  String GuiToggle(
    RectangleBase bounds,
    String? text,
    bool active,
  ) => 'GuiToggle($bounds, $text, $active)';

  /// Label for [RaylibGuiModuleBase.GuiToggleGroup].
  String GuiToggleGroup(
    RectangleBase bounds,
    String? text,
    num active,
  ) => 'GuiToggleGroup($bounds, $text, $active)';

  /// Label for [RaylibGuiModuleBase.GuiToggleSlider].
  String GuiToggleSlider(
    RectangleBase bounds,
    String? text,
    num active,
  ) => 'GuiToggleSlider($bounds, $text, $active)';

  /// Label for [RaylibGuiModuleBase.GuiCheckBox].
  String GuiCheckBox(
    RectangleBase bounds,
    String? text,
    bool checked,
  ) => 'GuiCheckBox($bounds, $text, $checked)';

  /// Label for [RaylibGuiModuleBase.GuiComboBox].
  String GuiComboBox(
    RectangleBase bounds,
    String? text,
    num active,
  ) => 'GuiComboBox($bounds, $text, $active)';

  /// Label for [RaylibGuiModuleBase.GuiDropdownBox].
  String GuiDropdownBox(
    RectangleBase bounds,
    String? text,
    num active,
    bool editMode,
  ) => 'GuiDropdownBox($bounds, $text, $active, $editMode)';

  /// Label for [RaylibGuiModuleBase.GuiSpinner].
  String GuiSpinner(
    RectangleBase bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => 'GuiSpinner($bounds, $text, $value, $minValue, $maxValue, $editMode)';

  /// Label for [RaylibGuiModuleBase.GuiValueBox].
  String GuiValueBox(
    RectangleBase bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => 'GuiValueBox($bounds, $text, $value, $minValue, $maxValue, $editMode)';

  /// Label for [RaylibGuiModuleBase.GuiValueBoxFloat].
  String GuiValueBoxFloat(
    RectangleBase bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => 'GuiValueBoxFloat($bounds, $text, $textValue, $value, $editMode)';

  /// Label for [RaylibGuiModuleBase.GuiTextBox].
  String GuiTextBox(
    RectangleBase bounds,
    String? text,
    num textSize,
    bool editMode,
  ) => 'GuiTextBox($bounds, $text, $textSize, $editMode)';

  /// Label for [RaylibGuiModuleBase.GuiSlider].
  String GuiSlider(
    RectangleBase bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiSlider($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiModuleBase.GuiSliderBar].
  String GuiSliderBar(
    RectangleBase bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiSliderBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiModuleBase.GuiProgressBar].
  String GuiProgressBar(
    RectangleBase bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiProgressBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiModuleBase.GuiStatusBar].
  String GuiStatusBar(
    RectangleBase bounds,
    String? text,
  ) => 'GuiStatusBar($bounds, $text)';

  /// Label for [RaylibGuiModuleBase.GuiDummyRec].
  String GuiDummyRec(
    RectangleBase bounds,
    String? text,
  ) => 'GuiDummyRec($bounds, $text)';

  /// Label for [RaylibGuiModuleBase.GuiGrid].
  String GuiGrid(
    RectangleBase bounds,
    num spacing,
    num subdivs,
    [Vector2Base? mouseCell]
  ) => 'GuiGrid($bounds, $spacing, $subdivs, $mouseCell)';

  /// Label for [RaylibGuiModuleBase.GuiListView].
  String GuiListView(
    RectangleBase bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  ) => 'GuiListView($bounds, $text, $scrollIndex, $active)';

  /// Label for [RaylibGuiModuleBase.GuiListViewEx].
  String GuiListViewEx(
    RectangleBase bounds,
    List<String>? text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  ) => 'GuiListViewEx($bounds, $text, $scrollIndex, $active, $focus)';

  /// Label for [RaylibGuiModuleBase.GuiMessageBox].
  String GuiMessageBox(
    RectangleBase bounds,
    String? title,
    String message,
    String buttons,
  ) => 'GuiMessageBox($bounds, $title, $message, $buttons)';

  /// Label for [RaylibGuiModuleBase.GuiTextInputBox].
  String GuiTextInputBox(
    RectangleBase bounds,
    String? title,
    String? message,
    String buttons,
    String? text,
    num textMaxSize,
    bool? secretViewActive,
  ) => 'GuiTextInputBox($bounds, $title, $message, $buttons, $text, $textMaxSize, $secretViewActive)';

  /// Label for [RaylibGuiModuleBase.GuiColorPicker].
  String GuiColorPicker(
    RectangleBase bounds,
    ColorBase? color,
  ) => 'GuiColorPicker($bounds, $color)';

  /// Label for [RaylibGuiModuleBase.GuiColorPanel].
  String GuiColorPanel(
    RectangleBase bounds,
    ColorBase color,
  ) => 'GuiColorPanel($bounds, $color)';

  /// Label for [RaylibGuiModuleBase.GuiColorBarAlpha].
  String GuiColorBarAlpha(
    RectangleBase bounds,
    num alpha,
  ) => 'GuiColorBarAlpha($bounds, $alpha)';

  /// Label for [RaylibGuiModuleBase.GuiColorBarHue].
  String GuiColorBarHue(
    RectangleBase bounds,
    num value,
  ) => 'GuiColorBarHue($bounds, $value)';

  /// Label for [RaylibGuiModuleBase.GuiColorPickerHSV].
  String GuiColorPickerHSV(
    RectangleBase bounds,
    [Vector3Base? colorHsv]
  ) => 'GuiColorPickerHSV($bounds, $colorHsv)';

  /// Label for [RaylibGuiModuleBase.GuiColorPanelHSV].
  String GuiColorPanelHSV(
    RectangleBase bounds,
    [Vector3Base? colorHsv]
  ) => 'GuiColorPanelHSV($bounds, $colorHsv)';
  
}
