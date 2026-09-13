part of '../../raylib_dartified_base.dart';

class _RaylibGuiModuleDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibGuiModule.GuiEnable].
  String GuiEnable() => 'GuiEnable()';

  /// Label for [RaylibGuiModule.GuiDisable].
  String GuiDisable() => 'GuiDisable()';

  /// Label for [RaylibGuiModule.GuiLock].
  String GuiLock() => 'GuiLock()';

  /// Label for [RaylibGuiModule.GuiUnlock].
  String GuiUnlock() => 'GuiUnlock()';

  /// Label for [RaylibGuiModule.GuiIsLocked].
  String GuiIsLocked() => 'GuiIsLocked()';

  /// Label for [RaylibGuiModule.GuiSetAlpha].
  String GuiSetAlpha(
    num alpha,
  ) => 'GuiSetAlpha($alpha)';

  /// Label for [RaylibGuiModule.GuiSetState].
  String GuiSetState(
    GuiState state,
  ) => 'GuiSetState($state)';

  /// Label for [RaylibGuiModule.GuiGetState].
  String GuiGetState() => 'GuiGetState()';

  /// Label for [RaylibGuiModule.GuiSetFont].
  String GuiSetFont(
    FontD font,
  ) => 'GuiSetFont($font)';

  /// Label for [RaylibGuiModule.GuiGetFont].
  String GuiGetFont() => 'GuiGetFont()';

  /// Label for [RaylibGuiModule.GuiSetStyle].
  String GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  ) => 'GuiSetStyle(${control.name}, ${property.name}, $value)';

  /// Label for [RaylibGuiModule.GuiGetStyle].
  String GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  ) => 'GuiGetStyle(${control.name}, ${property.name})';

  /// Label for [RaylibGuiModule.GuiLoadStyle].
  String GuiLoadStyle(
    String fileName,
  ) => 'GuiLoadStyle($fileName)';

  /// Label for [RaylibGuiModule.GuiLoadStyleFromMemory].
  String GuiLoadStyleFromMemory(
    Uint8List fileData,
  ) => 'GuiLoadStyleFromMemory(data: ${fileData.length})';

  /// Label for [RaylibGuiModule.GuiLoadStyleDefault].
  String GuiLoadStyleDefault() => 'GuiLoadStyleDefault()';

  /// Label for [RaylibGuiModule.GuiEnableTooltip].
  String GuiEnableTooltip() => 'GuiEnableTooltip()';

  /// Label for [RaylibGuiModule.GuiDisableTooltip].
  String GuiDisableTooltip() => 'GuiDisableTooltip()';

  /// Label for [RaylibGuiModule.GuiSetTooltip].
  String GuiSetTooltip(
    String? tooltip,
  ) => 'GuiSetTooltip($tooltip)';

  /// Label for [RaylibGuiModule.GuiIconText].
  String GuiIconText(
    GuiIconName iconId,
    String? text,
  ) => 'GuiIconText(${iconId.name}, $text)';

  /// Label for [RaylibGuiModule.GuiSetIconScale].
  String GuiSetIconScale(
    num scale,
  ) => 'GuiSetIconScale($scale)';

  /// Label for [RaylibGuiModule.GuiGetIcons].
  String GuiGetIcons() => 'GuiGetIcons()';

  /// Label for [RaylibGuiModule.GuiLoadIcons].
  String GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  ) => 'GuiLoadIcons($fileName, $loadIconsName)';

  /// Label for [RaylibGuiModule.GuiLoadIconsFromMemory].
  String GuiLoadIconsFromMemory(
    Uint8List fileData,
    bool loadIconsName,
  ) => 'GuiLoadIconsFromMemory(fileData: ${fileData.length}, $loadIconsName)';

  /// Label for [RaylibGuiModule.GuiDrawIcon].
  String GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    ColorD color,
  ) => 'GuiDrawIcon(${iconId.name}, $posX, $posY, $pixelSize, $color)';

  /// Label for [RaylibGuiModule.GuiGetTextWidth].
  String GuiGetTextWidth(
    String? text,
  ) => 'GuiGetTextWidth($text)';

  /// Label for [RaylibGuiModule.GuiWindowBox].
  String GuiWindowBox(
    RectangleD bounds,
    String? title,
  ) => 'GuiWindowBox($bounds, $title)';

  /// Label for [RaylibGuiModule.GuiGroupBox].
  String GuiGroupBox(
    RectangleD bounds,
    String? text,
  ) => 'GuiGroupBox($bounds, $text)';

  /// Label for [RaylibGuiModule.GuiLine].
  String GuiLine(
    RectangleD bounds,
    String? text,
  ) => 'GuiLine($bounds, $text)';

  /// Label for [RaylibGuiModule.GuiPanel].
  String GuiPanel(
    RectangleD bounds,
    String? text,
  ) => 'GuiPanel($bounds, $text)';

  /// Label for [RaylibGuiModule.GuiScrollPanel].
  String GuiScrollPanel(
    RectangleD bounds,
    String? text,
    RectangleD content, {
    Vector2D? scroll,
    RectangleD? view,
  }) => 'GuiScrollPanel($bounds, $text, $content, scroll: $scroll, view: $view)';

  /// Label for [RaylibGuiModule.GuiLabel].
  String GuiLabel(
    RectangleD bounds,
    String? text,
  ) => 'GuiLabel($bounds, $text)';

  /// Label for [RaylibGuiModule.GuiButton].
  String GuiButton(
    RectangleD bounds,
    String? text,
  ) => 'GuiButton($bounds, $text)';

  /// Label for [RaylibGuiModule.GuiLabelButton].
  String GuiLabelButton(
    RectangleD bounds,
    String? text,
  ) => 'GuiLabelButton($bounds, $text)';

  /// Label for [RaylibGuiModule.GuiToggle].
  String GuiToggle(
    RectangleD bounds,
    String? text,
    bool active,
  ) => 'GuiToggle($bounds, $text, $active)';

  /// Label for [RaylibGuiModule.GuiToggleGroup].
  String GuiToggleGroup(
    RectangleD bounds,
    String? text,
    num active,
  ) => 'GuiToggleGroup($bounds, $text, $active)';

  /// Label for [RaylibGuiModule.GuiToggleSlider].
  String GuiToggleSlider(
    RectangleD bounds,
    String? text,
    num active,
  ) => 'GuiToggleSlider($bounds, $text, $active)';

  /// Label for [RaylibGuiModule.GuiCheckBox].
  String GuiCheckBox(
    RectangleD bounds,
    String? text,
    bool checked,
  ) => 'GuiCheckBox($bounds, $text, $checked)';

  /// Label for [RaylibGuiModule.GuiComboBox].
  String GuiComboBox(
    RectangleD bounds,
    String? text,
    num active,
  ) => 'GuiComboBox($bounds, $text, $active)';

  /// Label for [RaylibGuiModule.GuiDropdownBox].
  String GuiDropdownBox(
    RectangleD bounds,
    String? text,
    num active,
    bool editMode,
  ) => 'GuiDropdownBox($bounds, $text, $active, $editMode)';

  /// Label for [RaylibGuiModule.GuiSpinner].
  String GuiSpinner(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => 'GuiSpinner($bounds, $text, $value, $minValue, $maxValue, $editMode)';

  /// Label for [RaylibGuiModule.GuiValueBox].
  String GuiValueBox(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => 'GuiValueBox($bounds, $text, $value, $minValue, $maxValue, $editMode)';

  /// Label for [RaylibGuiModule.GuiValueBoxFloat].
  String GuiValueBoxFloat(
    RectangleD bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => 'GuiValueBoxFloat($bounds, $text, $textValue, $value, $editMode)';

  /// Label for [RaylibGuiModule.GuiTextBox].
  String GuiTextBox(
    RectangleD bounds,
    String? text,
    num textSize,
    bool editMode,
  ) => 'GuiTextBox($bounds, $text, $textSize, $editMode)';

  /// Label for [RaylibGuiModule.GuiSlider].
  String GuiSlider(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiSlider($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiModule.GuiSliderBar].
  String GuiSliderBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiSliderBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiModule.GuiProgressBar].
  String GuiProgressBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => 'GuiProgressBar($bounds, $textLeft, $textRight, $value, $minValue, $maxValue)';

  /// Label for [RaylibGuiModule.GuiStatusBar].
  String GuiStatusBar(
    RectangleD bounds,
    String? text,
  ) => 'GuiStatusBar($bounds, $text)';

  /// Label for [RaylibGuiModule.GuiDummyRec].
  String GuiDummyRec(
    RectangleD bounds,
    String? text,
  ) => 'GuiDummyRec($bounds, $text)';

  /// Label for [RaylibGuiModule.GuiGrid].
  String GuiGrid(
    RectangleD bounds,
    num spacing,
    num subdivs, {
    Vector2D? mouseCell
  }) => 'GuiGrid($bounds, $spacing, $subdivs, mouseCell: $mouseCell)';

  /// Label for [RaylibGuiModule.GuiListView].
  String GuiListView(
    RectangleD bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  ) => 'GuiListView($bounds, $text, $scrollIndex, $active)';

  /// Label for [RaylibGuiModule.GuiListViewEx].
  String GuiListViewEx(
    RectangleD bounds,
    List<String>? text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  ) => 'GuiListViewEx($bounds, $text, $scrollIndex, $active, $focus)';

  /// Label for [RaylibGuiModule.GuiTabBar].
  String GuiTabBar(
    RectangleD bounds,
    String? text, {
    int? active,
  }) => 'GuiTabBar($bounds, text: $text, active: $active)';

  /// Label for [RaylibGuiModule.GuiTabBarEx].
  String GuiTabBarEx(
    RectangleD bounds,
    List<String>? text, {
    int? active,
  }) => 'GuiTabBarEx($bounds, text: ${text?.length}, active: $active)';

  /// Label for [RaylibGuiModule.GuiMessageBox].
  String GuiMessageBox(
    RectangleD bounds,
    String? title,
    String message,
    String buttons,
  ) => 'GuiMessageBox($bounds, $title, $message, $buttons)';

  /// Label for [RaylibGuiModule.GuiTextInputBox].
  String GuiTextInputBox(
    RectangleD bounds,
    String? title,
    String? message,
    String? text,
    num textSize,
    String btnText,
    [bool? secretViewActive]
  ) => 'GuiTextInputBox($bounds, $title, $message, $text, $textSize, $btnText, $secretViewActive)';

  /// Label for [RaylibGuiModule.GuiColorPicker].
  String GuiColorPicker(
    RectangleD bounds,
    ColorD? color,
  ) => 'GuiColorPicker($bounds, $color)';

  /// Label for [RaylibGuiModule.GuiColorPanel].
  String GuiColorPanel(
    RectangleD bounds,
    ColorD color,
  ) => 'GuiColorPanel($bounds, $color)';

  /// Label for [RaylibGuiModule.GuiColorBarAlpha].
  String GuiColorBarAlpha(
    RectangleD bounds,
    num alpha,
  ) => 'GuiColorBarAlpha($bounds, $alpha)';

  /// Label for [RaylibGuiModule.GuiColorBarHue].
  String GuiColorBarHue(
    RectangleD bounds,
    num value,
  ) => 'GuiColorBarHue($bounds, $value)';

  /// Label for [RaylibGuiModule.GuiColorPickerHSV].
  String GuiColorPickerHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  ) => 'GuiColorPickerHSV($bounds, $colorHsv)';

  /// Label for [RaylibGuiModule.GuiColorPanelHSV].
  String GuiColorPanelHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  ) => 'GuiColorPanelHSV($bounds, $colorHsv)';
  
}
