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

  /// Load style from memory (binary only)
  void GuiLoadStyleFromMemory(
    Uint8List fileData,
  ) => run(
    () => _debugLabels.GuiLoadStyleFromMemory(fileData),
    () => rl.GuiFlat.GuiLoadStyleFromMemory(
      rl.Temp.UnsignedChar$.Array(fileData),
      fileData.length,
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
      try {
        return values.readStringArray(iconCount);
      } finally {
        values.readPtrArray(iconCount).forEach((p) => p.free());
        values.free();
      }
    },
  );

  /// Load raygui icons file (.rgi) from memory into internal icons data
  List<String> GuiLoadIconsFromMemory(
    Uint8List fileData,
    bool loadIconsName,
  ) => run(
    () => _debugLabels.GuiLoadIconsFromMemory(fileData, loadIconsName),
    () {
      final values = rl.GuiFlat.GuiLoadIconsFromMemory(
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
        loadIconsName,
      );
      if (!loadIconsName || values.isNull) return [];
      if (fileData.length < 10) return [];

      // read iconCount from fileData (2 bytes short at offset 8)
      final iconCount = fileData.buffer.asByteData().getInt16(8, Endian.little);
      try {
        return values.readStringArray(iconCount);
      } finally {
        values.readPtrArray(iconCount).forEach((p) => p.free());
        values.free();
      }
    }
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
  GuiResult GuiWindowBox(
    RectangleD bounds,
    String? title,
  ) => run(
    () => _debugLabels.GuiWindowBox(bounds, title),
    () => .fromValue(rl.GuiFlat.GuiWindowBox(
      bounds,
      rl.Temp.String$.ValueOrNull(title),
    )),
  );

  /// Group Box control with text name
  GuiResult GuiGroupBox(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiGroupBox(bounds, text),
    () => .fromValue(rl.GuiFlat.GuiGroupBox(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    )),
  );

  /// Line separator control, could contain text
  GuiResult GuiLine(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiLine(bounds, text),
    () => .fromValue(rl.GuiFlat.GuiLine(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    )),
  );

  /// Panel control, useful to group controls
  GuiResult GuiPanel(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiPanel(bounds, text),
    () => .fromValue(rl.GuiFlat.GuiPanel(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    )),
  );

  /// Scroll Panel control
  GuiResult GuiScrollPanel(
    RectangleD bounds,
    String? text,
    RectangleD content, {
    Vector2D? scroll,
    RectangleD? view,
  }) => run(
    () => _debugLabels.GuiScrollPanel(bounds, text, content, scroll: scroll, view: view),
    () => .fromValue(rl.GuiFlat.GuiScrollPanel(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
      content,
      rl.Temp.Vector2$.RefUnique(scroll),
      rl.Temp.Rectangle$.RefUnique(view),
    )),
  );

  /// Label control
  GuiResult GuiLabel(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiLabel(bounds, text),
    () => .fromValue(rl.GuiFlat.GuiLabel(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    )),
  );

  /// Button control, returns true when clicked
  GuiResult GuiButton(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiButton(bounds, text),
    () => .fromValue(rl.GuiFlat.GuiButton(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    )),
  );

  /// Label button control, returns true when clicked
  GuiResult GuiLabelButton(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiLabelButton(bounds, text),
    () => .fromValue(rl.GuiFlat.GuiLabelButton(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    )),
  );

  /// Toggle Button control
  (GuiResult result, bool active) GuiToggle(
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
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Toggle Group control
  (GuiResult result, int active) GuiToggleGroup(
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
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Toggle Slider control
  (GuiResult result, int active) GuiToggleSlider(
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
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Check Box control, returns true when active
  (GuiResult result, bool checked) GuiCheckBox(
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
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Combo Box control
  (GuiResult result, int active) GuiComboBox(
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
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Dropdown Box control
  (GuiResult result, int active) GuiDropdownBox(
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
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Spinner control
  (GuiResult result, int value) GuiSpinner(
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
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Value Box control, updates input text with numbers
  (GuiResult result, int value) GuiValueBox(
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
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Value box control for float values
  (GuiResult result, double value) GuiValueBoxFloat(
    RectangleD bounds,
    String? text,
    String textValue,
    num value,
    bool editMode,
  ) => run(
    () => _debugLabels.GuiValueBoxFloat(bounds, text, textValue, value, editMode),
    () {
      final valuePtr = rl.Temp.Float$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiValueBoxFloat(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        rl.Temp.String$.ValueOrNull(textValue),
        valuePtr,
        editMode,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Text Box control, updates input text
  (GuiResult result, String value) GuiTextBox(
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
      return (.fromValue(result), valuePtr.toDartString());
    },
  );

  /// Slider control
  (GuiResult result, double value) GuiSlider(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => _debugLabels.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiSlider(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Slider Bar control
  (GuiResult result, double value) GuiSliderBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => _debugLabels.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiSliderBar(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Progress Bar control
  (GuiResult result, double value) GuiProgressBar(
    RectangleD bounds,
    String? textLeft,
    String? textRight,
    num value,
    num minValue,
    num maxValue,
  ) => run(
    () => _debugLabels.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue),
    () {
      final valuePtr = rl.Temp.Float$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiProgressBar(
        bounds,
        rl.Temp.String$.ValueOrNull(textLeft),
        rl.Temp.String$.ValueOrNull(textRight),
        valuePtr,
        minValue.toDouble(),
        maxValue.toDouble(),
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Status Bar control, shows info text
  GuiResult GuiStatusBar(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiStatusBar(bounds, text),
    () => .fromValue(rl.GuiFlat.GuiStatusBar(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    )),
  );

  /// Dummy control for placeholders
  GuiResult GuiDummyRec(
    RectangleD bounds,
    String? text,
  ) => run(
    () => _debugLabels.GuiDummyRec(bounds, text),
    () => .fromValue(rl.GuiFlat.GuiDummyRec(
      bounds,
      rl.Temp.String$.ValueOrNull(text),
    )),
  );

  /// Grid control
  GuiResult GuiGrid(
    RectangleD bounds,
    num spacing,
    num subdivs, {
    Vector2D? mouseCell,
  }) => run(
    () => _debugLabels.GuiGrid(bounds, spacing, subdivs, mouseCell: mouseCell),
    () => .fromValue(rl.GuiFlat.GuiGrid(
      bounds,
      MemoryPointer.nullptr(), // `text` is not used at all
      spacing.toDouble(),
      subdivs.toInt(),
      rl.Temp.Vector2$.RefUnique(mouseCell),
    )),
  );

  /// List View control
  (GuiResult result, int? scrollIndex, int? active) GuiListView(
    RectangleD bounds,
    String? text, {
    int? scrollIndex,
    int? active,
  }) => run(
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
        .fromValue(result),
        scrollIndex == null ? null : scrollIndexPtr.value,
        active == null ? null : activePtr.value,
      );
    },
  );

  /// List View control, using text entries list and returning focus entry
  (GuiResult result, int? scrollIndex, int? active, int? focus) GuiListViewEx(
    RectangleD bounds,
    List<String>? text, {
    int? scrollIndex,
    int? active,
    int? focus,
  }) => run(
    () => _debugLabels.GuiListViewEx(bounds, text, scrollIndex: scrollIndex, active: active, focus: focus),
    () {
      final scrollIndexPtr = rl.Temp.Int$.RefOrNull1(scrollIndex);
      final activePtr = rl.Temp.Int$.RefOrNull2(active);
      final focusPtr = rl.Temp.Int$.RefOrNull3(focus);
      final result = rl.GuiFlat.GuiListViewEx(
        bounds,
        text == null ? MemoryPointer.nullptr() : rl.Temp.String$.Array(text).cast(),
        text?.length ?? 0,
        scrollIndexPtr,
        activePtr,
        focusPtr,
      );
      return (
        .fromValue(result),
        scrollIndex == null ? null : scrollIndexPtr.value,
        active == null ? null : activePtr.value,
        focus == null ? null : focusPtr.value,
      );
    },
  );

  /// Tab Bar control
  (GuiResult result, int active) GuiTabBar(
    RectangleD bounds,
    String? text,
    int active,
  ) => run(
    () => _debugLabels.GuiTabBar(bounds, text, active: active),
    () {
      final activePtr = rl.Temp.Int$.Ref1(active);
      final result = rl.GuiFlat.GuiTabBar(
        bounds,
        rl.Temp.String$.ValueOrNull(text),
        MemoryPointer.nullptr(), // `hscroll` is not used at all
        activePtr,
      );
      return (.fromValue(result), activePtr.value);
    },
  );

  /// Tab Bar control, using text entries list and returning focus entry
  (GuiResult result, int active) GuiTabBarEx(
    RectangleD bounds,
    List<String>? text, {
    int? active,
  }) => run(
    () => _debugLabels.GuiTabBarEx(bounds, text, active: active),
    () {
      final activePtr = rl.Temp.Int$.RefOrNull1(active);
      final result = rl.GuiFlat.GuiTabBarEx(
        bounds,
        text == null ? MemoryPointer.nullptr() : rl.Temp.String$.Array(text).cast(),
        text?.length ?? 0,
        MemoryPointer.nullptr(), // `hscroll` is not used at all
        activePtr,
        MemoryPointer.nullptr(), // `focus` is not used at all
      );
      return (.fromValue(result), activePtr.value);
    },
  );

  /// Message Box control, displays a message
  (GuiResult result, int btnActive) GuiMessageBox(
    RectangleD bounds,
    String? title,
    String message,
    String btnText,
  ) => run(
    () => _debugLabels.GuiMessageBox(bounds, title, message, btnText),
    () {
      final btnActivePtr = rl.Temp.Int$.Ref1();
      int result = rl.GuiFlat.GuiMessageBox(
        bounds,
        rl.Temp.String$.ValueOrNull(title),
        rl.Temp.String$.ValueOrNull(message),
        rl.Temp.String$.ValueOrNull(btnText),
        btnActivePtr,
      );
      return (.fromValue(result), btnActivePtr.value);
    },
  );

  /// Text Input Box control, ask for text, supports secret
  (GuiResult result, String value, int btnActive, bool? secretViewActive) GuiTextInputBox(
    RectangleD bounds,
    String? title,
    String? message,
    String? text,
    num textSize,
    String btnText,
    [bool? secretViewActive]
  ) => run(
    () => _debugLabels.GuiTextInputBox(bounds, title, message, text, textSize, btnText, secretViewActive),
    () {
      final textPtr = rl.Temp.String$.Ref1(text, textSize.toInt());
      final btnActivePtr = rl.Temp.Int$.Ref1();
      final secretViewActivePtr = rl.Temp.Bool$.RefOrNull1(secretViewActive);
      final result = rl.GuiFlat.GuiTextInputBox(
        bounds,
        rl.Temp.String$.ValueOrNull(title),
        rl.Temp.String$.ValueOrNull(message),
        textPtr,
        textSize.toInt(),
        rl.Temp.String$.ValueOrNull(btnText),
        btnActivePtr,
        secretViewActivePtr,
      );
      return (
        .fromValue(result),
        textPtr.toDartString(),
        btnActivePtr.value,
        secretViewActive == null ? null : secretViewActivePtr.value,
      );
    },
  );

  /// Color Picker control, includes Color bar controls
  (GuiResult result, ColorD color) GuiColorPicker(
    RectangleD bounds,
    ColorD? color,
  ) => run(
    () => _debugLabels.GuiColorPicker(bounds, color),
    () {
      final valuePtr = rl.Temp.Color$.Ref1(color);
      final result = rl.GuiFlat.GuiColorPicker(
        bounds,
        MemoryPointer.nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Panel control
  (GuiResult result, ColorD color) GuiColorPanel(
    RectangleD bounds,
    ColorD color,
  ) => run(
    () => _debugLabels.GuiColorPanel(bounds, color),
    () {
      final valuePtr = rl.Temp.Color$.Ref1(color);
      final result = rl.GuiFlat.GuiColorPanel(
        bounds,
        MemoryPointer.nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Bar Alpha control
  (GuiResult result, double alpha) GuiColorBarAlpha(
    RectangleD bounds,
    num alpha,
  ) => run(
    () => _debugLabels.GuiColorBarAlpha(bounds, alpha),
    () {
      final valuePtr = rl.Temp.Float$.Ref1(alpha.toDouble());
      final result = rl.GuiFlat.GuiColorBarAlpha(
        bounds,
        MemoryPointer.nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Bar Hue control
  (GuiResult result, double value) GuiColorBarHue(
    RectangleD bounds,
    num value,
  ) => run(
    () => _debugLabels.GuiColorBarHue(bounds, value),
    () {
      final valuePtr = rl.Temp.Float$.Ref1(value.toDouble());
      final result = rl.GuiFlat.GuiColorBarHue(
        bounds,
        MemoryPointer.nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Picker control, using Hue-Saturation-Value color data, includes Color bar controls
  (GuiResult result, Vector3D hsv) GuiColorPickerHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  ) => run(
    () => _debugLabels.GuiColorPickerHSV(bounds, colorHsv),
    () {
      final valuePtr = rl.Temp.Vector3$.Ref1(colorHsv);
      final result = rl.GuiFlat.GuiColorPickerHSV(
        bounds,
        MemoryPointer.nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );

  /// Color Panel control, using Hue-Saturation-Value color data
  (GuiResult result, Vector3D hsv) GuiColorPanelHSV(
    RectangleD bounds,
    [Vector3D? colorHsv]
  ) => run(
    () => _debugLabels.GuiColorPanelHSV(bounds, colorHsv),
    () {
      final valuePtr = rl.Temp.Vector3$.Ref1(colorHsv);
      final result = rl.GuiFlat.GuiColorPanelHSV(
        bounds,
        MemoryPointer.nullptr(), // `text` is not used at all
        valuePtr,
      );
      return (.fromValue(result), valuePtr.value);
    },
  );
}
