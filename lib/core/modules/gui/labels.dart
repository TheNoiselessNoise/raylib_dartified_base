part of '../../raylib_dartified_base.dart';

/// Produces human-readable debug strings for each Gui module function call,
/// logged to the console when debug output is enabled.
class RaylibGuiModuleDebugLabels extends RaylibDebugLabelsBase {
  
  String GuiEnable() => 'GuiEnable()';

  String GuiDisable() => 'GuiDisable()';

  String GuiLock() => 'GuiLock()';

  String GuiUnlock() => 'GuiUnlock()';

  String GuiIsLocked() => 'GuiIsLocked()';

  String GuiSetAlpha(
    num alpha,
  ) => 'GuiSetAlpha($alpha)';

  String GuiSetState(
    GuiState state,
  ) => 'GuiSetState($state)';

  String GuiGetState() => 'GuiGetState()';

  String GuiSetFont(
    FontBase font,
  ) => 'GuiSetFont($font)';

  String GuiGetFont() => 'GuiGetFont()';

  String GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  ) => 'GuiSetStyle(${control.name}, ${property.name}, $value)';

  String GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  ) => 'GuiGetStyle(${control.name}, ${property.name})';

  String GuiLoadStyle(
    String fileName,
  ) => 'GuiLoadStyle($fileName)';

  String GuiLoadStyleDefault() => 'GuiLoadStyleDefault()';

  String GuiEnableTooltip() => 'GuiEnableTooltip()';

  String GuiDisableTooltip() => 'GuiDisableTooltip()';

  String GuiSetTooltip(
    String? tooltip,
  ) => 'GuiSetTooltip($tooltip)';

  String GuiIconText(
    GuiIconName iconId,
    String? text,
  ) => 'GuiIconText(${iconId.name}, $text)';

  String GuiSetIconScale(
    num scale,
  ) => 'GuiSetIconScale($scale)';

  String GuiGetIcons() => 'GuiGetIcons()';

  String GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  ) => 'GuiLoadIcons($fileName, $loadIconsName)';

  String GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    ColorBase color,
  ) => 'GuiDrawIcon(${iconId.name}, $posX, $posY, $pixelSize, $color)';

  String GuiGetTextWidth(
    String? text,
  ) => 'GuiGetTextWidth($text)';

  String GuiWindowBox(
    RectangleBase bounds,
    String? title,
  ) => 'GuiWindowBox($bounds, $title)';

  String GuiGroupBox(
    RectangleBase bounds,
    String? text,
  ) => 'GuiGroupBox($bounds, $text)';

  String GuiLine(
    RectangleBase bounds,
    String? text,
  ) => 'GuiLine($bounds, $text)';

  String GuiPanel(
    RectangleBase bounds,
    String? text,
  ) => 'GuiPanel($bounds, $text)';

  String GuiTabBar(
    RectangleBase bounds,
    List<String> text,
  ) => 'GuiTabBar($bounds, text: ${text.length})';

  String GuiScrollPanel(
    RectangleBase bounds,
    String? text,
    RectangleBase content,
    Vector2Base scroll,
    [RectangleBase? view]
  ) => 'GuiScrollPanel($bounds, $text, $content, $scroll, $view)';

  String GuiLabel(
    RectangleBase bounds,
    String? text,
  ) => 'GuiLabel($bounds, $text)';

  String GuiButton(
    RectangleBase bounds,
    String? text,
  ) => 'GuiButton($bounds, $text)';

  String GuiLabelButton(
    RectangleBase bounds,
    String? text,
  ) => 'GuiLabelButton($bounds, $text)';

  String GuiToggle(
    RectangleBase bounds,
    String? text,
    bool active,
  ) => 'GuiToggle($bounds, $text, $active)';

  String GuiToggleGroup(
    RectangleBase bounds,
    String? text,
    num active,
  ) => 'GuiToggleGroup($bounds, $text, $active)';

  String GuiToggleSlider(
    RectangleBase bounds,
    String? text,
    num active,
  ) => 'GuiToggleSlider($bounds, $text, $active)';

  String GuiCheckBox(
    RectangleBase bounds,
    String? text,
    bool checked,
  ) => 'GuiCheckBox($bounds, $text, $checked)';

  String GuiComboBox(
    RectangleBase bounds,
    String? text,
    num active,
  ) => 'GuiComboBox($bounds, $text, $active)';

  String GuiDropdownBox(
    RectangleBase bounds,
    String? text,
    num active,
    bool editMode,
  ) => 'GuiDropdownBox($bounds, $text, $active, $editMode)';

  String GuiSpinner(
    RectangleBase bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => 'GuiSpinner($bounds, $text, $value, $minValue, $maxValue, $editMode)';

  String GuiValueBox(
    RectangleBase bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => 'GuiValueBox($bounds, $text, $value, $minValue, $maxValue, $editMode)';

  String GuiValueBoxFloat(
    RectangleBase bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => 'GuiValueBoxFloat($bounds, $text, $textValue, $value, $editMode)';

  String GuiTextBox(
    RectangleBase bounds,
    String? text,
    num textSize,
    bool editMode,
  ) => 'GuiTextBox($bounds, $text, $textSize, $editMode)';

  String GuiSlider(
    RectangleBase bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiSlider($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  String GuiSliderBar(
    RectangleBase bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiSliderBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  String GuiProgressBar(
    RectangleBase bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiProgressBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  String GuiStatusBar(
    RectangleBase bounds,
    String? text,
  ) => 'GuiStatusBar($bounds, $text)';

  String GuiDummyRec(
    RectangleBase bounds,
    String? text,
  ) => 'GuiDummyRec($bounds, $text)';

  String GuiGrid(
    RectangleBase bounds,
    num spacing,
    num subdivs,
    [Vector2Base? mouseCell]
  ) => 'GuiGrid($bounds, $spacing, $subdivs, $mouseCell)';

  String GuiListView(
    RectangleBase bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  ) => 'GuiListView($bounds, $text, $scrollIndex, $active)';

  String GuiListViewEx(
    RectangleBase bounds,
    List<String> text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  ) => 'GuiListViewEx($bounds, $text, $scrollIndex, $active, $focus)';

  String GuiMessageBox(
    RectangleBase bounds,
    String? title,
    String message,
    String buttons,
  ) => 'GuiMessageBox($bounds, $title, $message, $buttons)';

  String GuiTextInputBox(
    RectangleBase bounds,
    String? title,
    String? message,
    String buttons,
    String? text,
    num textMaxSize,
    bool? secretViewActive,
  ) => 'GuiTextInputBox($bounds, $title, $message, $buttons, $text, $textMaxSize, $secretViewActive)';

  String GuiColorPicker(
    RectangleBase bounds,
    ColorBase? color,
  ) => 'GuiColorPicker($bounds, $color)';

  String GuiColorPanel(
    RectangleBase bounds,
    ColorBase color,
  ) => 'GuiColorPanel($bounds, $color)';

  String GuiColorBarAlpha(
    RectangleBase bounds,
    num alpha,
  ) => 'GuiColorBarAlpha($bounds, $alpha)';

  String GuiColorBarHue(
    RectangleBase bounds,
    num value,
  ) => 'GuiColorBarHue($bounds, $value)';

  String GuiColorPickerHSV(
    RectangleBase bounds,
    [Vector3Base? colorHsv]
  ) => 'GuiColorPickerHSV($bounds, $colorHsv)';

  String GuiColorPanelHSV(
    RectangleBase bounds,
    [Vector3Base? colorHsv]
  ) => 'GuiColorPanelHSV($bounds, $colorHsv)';
  
}
