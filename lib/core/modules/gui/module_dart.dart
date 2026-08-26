part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Gui module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
final class RaylibGuiModule<R extends RaylibBase<R>> extends RaylibModule<R> with RaylibGuiModuleExtras<R> {

  final _debugLabels = _RaylibGuiModuleDebugLabels();
  
  RaylibGuiModule(super.rl);

  /// Enable gui controls (global state)
  void GuiEnable() => run(
    () => _debugLabels.GuiEnable(),
    () => rl.GuiFlat.GuiEnable(),
  );

  /// Disable gui controls (global state)
  void GuiDisable() => run(
    () => _debugLabels.GuiDisable(),
    () => rl.GuiFlat.GuiDisable(),
  );

  /// Lock gui controls (global state)
  void GuiLock() => run(
    () => _debugLabels.GuiLock(),
    () => rl.GuiFlat.GuiLock(),
  );

  /// Unlock gui controls (global state)
  void GuiUnlock() => run(
    () => _debugLabels.GuiUnlock(),
    () => rl.GuiFlat.GuiUnlock(),
  );

  /// Check if gui is locked (global state)
  bool GuiIsLocked() => run(
    () => _debugLabels.GuiIsLocked(),
    () => rl.GuiFlat.GuiIsLocked(),
  );

  /// Set gui controls alpha (global state), alpha goes from 0.0 to 1.0
  void GuiSetAlpha(
    num alpha,
  ) => run(
    () => _debugLabels.GuiSetAlpha(alpha),
    () => rl.GuiFlat.GuiSetAlpha(
      alpha.toDouble(),
    ),
  );

  /// Set gui state (global state)
  void GuiSetState(
    GuiState state,
  ) => run(
    () => _debugLabels.GuiSetState(state),
    () => rl.GuiFlat.GuiSetState(
      state.value,
    ),
  );

  /// Get gui state (global state)
  int GuiGetState() => run(
    () => _debugLabels.GuiGetState(),
    () => rl.GuiFlat.GuiGetState(),
  );

  /// Set gui custom font (global state)
  void GuiSetFont(
    FontD font,
  ) => run(
    () => _debugLabels.GuiSetFont(font),
    () => rl.GuiFlat.GuiSetFont(
      font,
    ),
  );

  /// Get gui custom font (global state)
  FontD GuiGetFont() => run(
    () => _debugLabels.GuiGetFont(),
    () => rl.GuiFlat.GuiGetFont(),
  );

  /// Set one style property
  void GuiSetStyle(
    GuiControl control,
    GuiProperty property,
    num value,
  ) => run(
    () => _debugLabels.GuiSetStyle(control, property, value),
    () => rl.GuiFlat.GuiSetStyle(
      control.value,
      property.value,
      value.toInt(),
    ),
  );

  /// Get one style property
  int GuiGetStyle(
    GuiControl control,
    GuiProperty property,
  ) => run(
    () => _debugLabels.GuiGetStyle(control, property),
    () => rl.GuiFlat.GuiGetStyle(
      control.value,
      property.value,
    ),
  );

  /// Load style file over global style variable (.rgs)
  void GuiLoadStyle(
    String fileName,
  ) => run(
    () => _debugLabels.GuiLoadStyle(fileName),
    () => rl.GuiFlat.GuiLoadStyle(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load style default over global style
  void GuiLoadStyleDefault() => run(
    () => _debugLabels.GuiLoadStyleDefault(),
    () => rl.GuiFlat.GuiLoadStyleDefault(),
  );

  /// Enable gui tooltips (global state)
  void GuiEnableTooltip() => run(
    () => _debugLabels.GuiEnableTooltip(),
    () => rl.GuiFlat.GuiEnableTooltip(),
  );

  /// Disable gui tooltips (global state)
  void GuiDisableTooltip() => run(
    () => _debugLabels.GuiDisableTooltip(),
    () => rl.GuiFlat.GuiDisableTooltip(),
  );

  /// Set tooltip string
  void GuiSetTooltip(
    String? tooltip,
  ) => run(
    () => _debugLabels.GuiSetTooltip(tooltip),
    () => rl.GuiFlat.GuiSetTooltip(
      rl.Temp.String$.ValueOrNull(tooltip),
    ),
  );

  /// Get text with icon id prepended (if supported)
  String GuiIconText(
    GuiIconName iconId,
    String? text,
  ) => run(
    () => _debugLabels.GuiIconText(iconId, text),
    () => rl.GuiFlat.GuiIconText(
      iconId.value,
      rl.Temp.String$.ValueOrNull(text),
    ).toDartString(),
  );

  /// Set default icon drawing size
  void GuiSetIconScale(
    num scale,
  ) => run(
    () => _debugLabels.GuiSetIconScale(scale),
    () => rl.GuiFlat.GuiSetIconScale(
      scale.toInt(),
    ),
  );

  /// Get raygui icons data
  List<int> GuiGetIcons() => run(
    () => _debugLabels.GuiGetIcons(),
    () {
      final values = rl.GuiFlat.GuiGetIcons();
      return values.readArray(RAYGUI_ICON_MAX_ICONS*RAYGUI_ICON_DATA_ELEMENTS);
    },
  );

  /// Load raygui icons file (.rgi) into internal icons data
  List<String> GuiLoadIcons(
    String fileName,
    bool loadIconsName,
  ) => run(
    () => _debugLabels.GuiLoadIcons(fileName, loadIconsName),
    () {
      final fileNamePtr = rl.Temp.String$.ValueOrNull(fileName);
      final values = rl.GuiFlat.GuiLoadIcons(
        fileNamePtr,
        loadIconsName,
      );
      if (!loadIconsName || values.isNull) return [];

      final dataSize = rl.Temp.Int$.Ref1();
      final bytes = rl.CoreFlat.LoadFileData(fileNamePtr, dataSize);
      if (dataSize.value < 10) return [];

      // read iconCount from file header (2 bytes short at offset 8)
      final iconCount = bytes.readInt16(8);
      final icons = values.readStringArray(iconCount);
      values.free();
      return icons;
    },
  );

  /// Draw icon using pixel size at specified position
  void GuiDrawIcon(
    GuiIconName iconId,
    num posX,
    num posY,
    num pixelSize,
    ColorD color,
  ) => run(
    () => _debugLabels.GuiDrawIcon(iconId, posX, posY, pixelSize, color),
    () => rl.GuiFlat.GuiDrawIcon(
      iconId.value,
      posX.toInt(),
      posY.toInt(),
      pixelSize.toInt(),
      color,
    ),
  );

  /// Get text width considering gui style and icon size (if required)
  int GuiGetTextWidth(
    String? text,
  ) => run(
    () => _debugLabels.GuiGetTextWidth(text),
    () => rl.GuiFlat.GuiGetTextWidth(
      rl.Temp.String$.ValueOrNull(text), 
    ),
  );

  /// Window Box control, shows a window that can be closed
  int GuiWindowBox(
    RectangleD bounds,
    String? title,
  ) => run(
    () => _debugLabels.GuiWindowBox(bounds, title),
    () => rl.GuiFlat.GuiWindowBox(
      bounds,
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  /// Group Box control with text name
  int GuiGroupBox(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiGroupBox(bounds, text),
    () => rl.GuiFlat.GuiGroupBox(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Line separator control, could contain text
  int GuiLine(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiLine(bounds, text),
    () => rl.GuiFlat.GuiLine(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Panel control, useful to group controls
  int GuiPanel(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiPanel(bounds, text),
    () => rl.GuiFlat.GuiPanel(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Tab Bar control, returns TAB to be closed or -1
  (int tab, int active) GuiTabBar(
    RectangleD bounds,
    List<String> text,
  ) => run(
    () => _debugLabels.GuiTabBar(bounds, text),
    () {
      final active = rl.Temp.Int$.Ref1();
      final currentTabClosingRequested = rl.GuiFlat.GuiTabBar(
        bounds,
        rl.Temp.String$.Array(text).cast(),
        text.length,
        active,
      );
      return (currentTabClosingRequested, active.value);
    },
  );

  /// Scroll Panel control
  int GuiScrollPanel(
    RectangleD bounds,
    String? text,
    RectangleD content,
    Vector2D scroll,
    [RectangleD? view]
  ) => run(
    () => _debugLabels.GuiScrollPanel(bounds, text, content, scroll, view),
    () => rl.Temp.Vector2$.RefUpdate1(scroll,
      (ps) => rl.Temp.Rectangle$.RefUpdate1(view,
        (pv) => rl.GuiFlat.GuiScrollPanel(
          bounds,
          rl.Temp.String$.ValueOrNull(text),
          content,
          ps,
          pv,
        ),
      ),
    ),
  );

  /// Label control
  int GuiLabel(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiLabel(bounds, text),
    () => rl.GuiFlat.GuiLabel(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Button control, returns true when clicked
  int GuiButton(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiButton(bounds, text),
    () => rl.GuiFlat.GuiButton(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Label button control, returns true when clicked
  int GuiLabelButton(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiLabelButton(bounds, text),
    () => rl.GuiFlat.GuiLabelButton(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Toggle Button control
  (int result, bool active) GuiToggle(
    RectangleD bounds,
    String? text,
    bool active,
  ) => run(
    () => _debugLabels.GuiToggle(bounds, text, active),
    () {
      final valuePtr = rl.Temp.Bool$.Ref1(active);
      final result = rl.GuiFlat.GuiToggle(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  /// Toggle Group control
  (int result, int active) GuiToggleGroup(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => _debugLabels.GuiToggleGroup(bounds, text, active),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(active.toInt());
      final result = rl.GuiFlat.GuiToggleGroup(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  /// Toggle Slider control
  (int result, int active) GuiToggleSlider(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => _debugLabels.GuiToggleSlider(bounds, text, active),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(active.toInt());
      final result = rl.GuiFlat.GuiToggleSlider(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  /// Check Box control, returns true when active
  (int result, bool checked) GuiCheckBox(
    RectangleD bounds,
    String? text,
    bool checked,
  ) => run(
    () => _debugLabels.GuiCheckBox(bounds, text, checked),
    () {
      final valuePtr = rl.Temp.Bool$.Ref1(checked);
      final result = rl.GuiFlat.GuiCheckBox(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  /// Combo Box control
  (int result, int active) GuiComboBox(
    RectangleD bounds,
    String? text,
    num active,
  ) => run(
    () => _debugLabels.GuiComboBox(bounds, text, active),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(active.toInt());
      final result = rl.GuiFlat.GuiComboBox(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  /// Dropdown Box control
  (int result, int active) GuiDropdownBox(
    RectangleD bounds,
    String? text,
    num active,
    bool editMode,
  ) => run(
    () => _debugLabels.GuiDropdownBox(bounds, text, active, editMode),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(active.toInt());
      final result = rl.GuiFlat.GuiDropdownBox(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  /// Spinner control
  (int result, int value) GuiSpinner(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => run(
    () => _debugLabels.GuiSpinner(bounds, text, value, minValue, maxValue, editMode),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(value.toInt());
      final result = rl.GuiFlat.GuiSpinner(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
        minValue.toInt(),
        maxValue.toInt(),
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  /// Value Box control, updates input text with numbers
  (int result, int value) GuiValueBox(
    RectangleD bounds,
    String? text,
    num value,
    num minValue,
    num maxValue,
    bool editMode,
  ) => run(
    () => _debugLabels.GuiValueBox(bounds, text, value, minValue, maxValue, editMode),
    () {
      final valuePtr = rl.Temp.Int$.Ref1(value.toInt());
      final result = rl.GuiFlat.GuiValueBox(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        valuePtr,
        minValue.toInt(),
        maxValue.toInt(),
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  /// Value box control for float values
  (int result, double value) GuiValueBoxFloat(
    RectangleD bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => run(
    () => _debugLabels.GuiValueBoxFloat(bounds, text, textValue, value, editMode),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiValueBoxFloat(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        rl.Temp.String$.ValueOrNull(textValue),
        valuePtr,
        editMode,
      );
      return (result, valuePtr.value);
    },
  );

  /// Text Box control, updates input text
  (int result, String value) GuiTextBox(
    RectangleD bounds,
    String? text,
    num textSize,
    bool editMode,
  ) => run(
    () => _debugLabels.GuiTextBox(bounds, text, textSize, editMode),
    () {
      final valuePtr = rl.Temp.String$.Ref1(text ?? '', textSize.toInt());
      final result = rl.GuiFlat.GuiTextBox(
        bounds,
        valuePtr,
        textSize.toInt(),
        editMode,
      );
      return (result, valuePtr.toDartString());
    },
  );

  /// Slider control
  (int result, double value) GuiSlider(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => _debugLabels.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiSlider(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  /// Slider Bar control
  (int result, double value) GuiSliderBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => _debugLabels.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiSliderBar(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  /// Progress Bar control
  (int result, double value) GuiProgressBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => _debugLabels.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiProgressBar(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (result, valuePtr.value);
    },
  );

  /// Status Bar control, shows info text
  int GuiStatusBar(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiStatusBar(bounds, text),
    () => rl.GuiFlat.GuiStatusBar(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Dummy control for placeholders
  int GuiDummyRec(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiDummyRec(bounds, text),
    () => rl.GuiFlat.GuiDummyRec(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Grid control
  int GuiGrid(
    RectangleD bounds,
    num spacing,
    num subdivs,
    [Vector2D? mouseCell]
  ) => run(
    () => _debugLabels.GuiGrid(bounds, spacing, subdivs, mouseCell),
    () => rl.Temp.Vector2$.RefUpdate1(mouseCell,
      (pv) => rl.GuiFlat.GuiGrid(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        spacing.toDouble(),
        subdivs.toInt(),
        pv,
      ),
    ),
  );

  /// List View control
  (int result, int? scrollIndex, int? active) GuiListView(
    RectangleD bounds,
    String? text, {
      int? scrollIndex,
      int? active,
    }
  ) => run(
    () => _debugLabels.GuiListView(bounds, text, scrollIndex: scrollIndex, active: active),
    () {
      final scrollIndexPtr = rl.Temp.Int$.RefOrNull1(scrollIndex);
      final activePtr = rl.Temp.Int$.RefOrNull2(active);
      final result = rl.GuiFlat.GuiListView(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        scrollIndexPtr,
        activePtr,
      );
      return (
        result,
        scrollIndex == null ? null : scrollIndexPtr.value,
        active == null ? null : activePtr.value,
      );
    },
  );

  /// List View with extended parameters
  (int result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
    RectangleD bounds,
    List<String>? text, {
      int? scrollIndex,
      int? active,
      int? focus,
    }
  ) => run(
    () => _debugLabels.GuiListViewEx(bounds, text, scrollIndex: scrollIndex, active: active, focus: focus),
    () {
      final scrollIndexPtr = rl.Temp.Int$.RefOrNull1(scrollIndex);
      final activePtr = rl.Temp.Int$.RefOrNull2(active);
      final focusPtr = rl.Temp.Int$.RefOrNull3(focus);
      final result = rl.GuiFlat.GuiListViewEx(
        bounds,
        (text == null ? MemoryPointer.nullptr : rl.Temp.String$.Array(text)).cast(),
        text?.length ?? 0,
        scrollIndexPtr,
        activePtr,
        focusPtr,
      );
      return (
        result,
        scrollIndex == null ? null : scrollIndexPtr.value,
        active == null ? null : activePtr.value,
        focus == null ? null : focusPtr.value,
      );
    },
  );

  /// Message Box control, displays a message
  int GuiMessageBox(
    RectangleD bounds,
    String? title,
    String message,
    String buttons,
  ) => run(
    () => _debugLabels.GuiMessageBox(bounds, title, message, buttons),
    () => rl.GuiFlat.GuiMessageBox(
      bounds,
      rl.Temp.String$.ValueOrNull(title),
      rl.Temp.String$.ValueOrNull(message),
      rl.Temp.String$.ValueOrNull(buttons),
    ),
  );

  /// Text Input Box control, ask for text, supports secret
  (int result, String value, bool? secretViewActive) GuiTextInputBox(
    RectangleD bounds,
    String? title,
    String? message,
    String buttons,
    String? text,
    num textMaxSize,
    bool? secretViewActive,
  ) => run(
    () => _debugLabels.GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive),
    () {
      final valuePtr = rl.Temp.String$.Ref1(text, textMaxSize.toInt());
      final secretViewActivePtr = rl.Temp.Bool$.RefOrNull1(secretViewActive);
      final result = rl.GuiFlat.GuiTextInputBox(
        bounds,
        rl.Temp.String$.ValueOrNull(title),
        rl.Temp.String$.ValueOrNull(message),
        rl.Temp.String$.ValueOrNull(buttons),
        valuePtr,
        textMaxSize.toInt(),
        secretViewActivePtr,
      );
      return (result, valuePtr.toDartString(), secretViewActive == null ? null : secretViewActivePtr.value);
    },
  );

  /// Color Picker control (multiple color controls)
  (int result, ColorD color) GuiColorPicker(
    RectangleD bounds,
    ColorD? color,
  ) => run(
    () => _debugLabels.GuiColorPicker(bounds, color),
    () {
      final valuePtr = rl.Temp.Color$.Ref1(color);
      final result = rl.GuiFlat.GuiColorPicker(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.ref);
    },
  );

  /// Color Panel control
  (int result, ColorD color) GuiColorPanel(
    RectangleD bounds,
    ColorD color,
  ) => run(
    () => _debugLabels.GuiColorPanel(bounds, color),
    () {
      final valuePtr = rl.Temp.Color$.Ref1(color);
      final result = rl.GuiFlat.GuiColorPanel(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.ref);
    },
  );

  /// Color Bar Alpha control
  (int result, double alpha) GuiColorBarAlpha(
    RectangleD bounds,
    num alpha,
  ) => run(
    () => _debugLabels.GuiColorBarAlpha(bounds, alpha),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(alpha.toDouble());
      final result = rl.GuiFlat.GuiColorBarAlpha(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  /// Color Bar Hue control
  (int result, double value) GuiColorBarHue(
    RectangleD bounds,
    num value,
  ) => run(
    () => _debugLabels.GuiColorBarHue(bounds, value),
    () {
      final valuePtr = rl.Temp.Float32$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiColorBarHue(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.value);
    },
  );

  /// Color Picker control that avoids conversion to RGB on each call (multiple color controls)
  (int result, Vector3D hsv) GuiColorPickerHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  ) => run(
    () => _debugLabels.GuiColorPickerHSV(bounds, colorHsv),
    () {
      final valuePtr = rl.Temp.Vector3$.Ref1(colorHsv);
      final result = rl.GuiFlat.GuiColorPickerHSV(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.ref);
    },
  );

  /// Color Panel control that updates Hue-Saturation-Value color value, used by GuiColorPickerHSV()
  (int result, Vector3D hsv) GuiColorPanelHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  ) => run(
    () => _debugLabels.GuiColorPanelHSV(bounds, colorHsv),
    () {
      final valuePtr = rl.Temp.Vector3$.Ref1(colorHsv);
      final result = rl.GuiFlat.GuiColorPanelHSV(
        bounds,
        MemoryPointer.nullptr.cast(), // `text`, it's not used at all
        valuePtr,
      );
      return (result, valuePtr.ref);
    },
  );
}
