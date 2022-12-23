import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class XColorPickerDialog extends StatelessWidget {
  final ValueChanged<Color> onColorChanged;
  final Color? value;

  XColorPickerDialog({required this.onColorChanged, this.value = Colors.black, Key? key})
      : super(key: key);

  final Map<ColorSwatch<Object>, String> customSwatches = <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(Colors.white): 'White',
    ColorTools.createPrimarySwatch(Colors.black): 'Black',
    ColorTools.createPrimarySwatch(Colors.red): 'Red',
    ColorTools.createPrimarySwatch(Colors.pink): 'Pink',
    ColorTools.createPrimarySwatch(Colors.purple): 'purple',
    ColorTools.createPrimarySwatch(Colors.blue): 'Blue',
    ColorTools.createPrimarySwatch(Colors.cyan): 'Cyan',
    ColorTools.createPrimarySwatch(Colors.green): 'Green',
    ColorTools.createPrimarySwatch(Colors.orange): 'Orange',
  };
  @override
  Widget build(BuildContext context) {
    return ColorPicker(
      elevation: 5,
      color: value!,
      enableShadesSelection: false,
      onColorChanged: onColorChanged,
      width: 30,
      height: 30,
      borderRadius: 20,
      spacing: 10,
      padding: const EdgeInsets.all(0),
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: false,
      },
      customColorSwatchesAndNames: customSwatches,
    );
  }
}
