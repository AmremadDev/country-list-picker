import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

export 'package:flex_color_picker/flex_color_picker.dart';

class XColorPickerDialog extends StatelessWidget {
  final ValueChanged<Color> onColorChanged;
  final Color? value;
  final bool enabled;

  XColorPickerDialog({
    required this.onColorChanged,
    this.enabled = true,
    this.value = Colors.black,
    Key? key,
  }) : super(key: key);

  final Map<ColorSwatch<Object>, String> customSwatches = <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(Colors.white): 'White',
    ColorTools.createPrimarySwatch(Colors.grey): 'Grey',
    ColorTools.createPrimarySwatch(const Color(0xFF424242)): 'Grey-1',
    ColorTools.createPrimarySwatch(const Color(0xFF313030)): 'Grey-2',
    ColorTools.createPrimarySwatch(Colors.black): 'Black',
    ColorTools.createPrimarySwatch(Colors.red): 'Red',
    ColorTools.createPrimarySwatch(Colors.purple): 'purple',
    ColorTools.createPrimarySwatch(Colors.blue): 'Blue',
    ColorTools.createPrimarySwatch(Colors.green): 'Green',
    ColorTools.createPrimarySwatch(Colors.orange): 'Orange',
  };
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width - (40 * 2);

    double size = ((w - (customSwatches.length - 1) * 5)) / customSwatches.length;

    return IgnorePointer(
      ignoring: !enabled,
      child: Center(
        child: ColorPicker(
          elevation: 5,
          color: value!,
          enableShadesSelection: false,
          onColorChanged: onColorChanged,
          width: size,
          height: size,
          borderRadius: 50,
          spacing: size / 6,
          pickersEnabled: const <ColorPickerType, bool>{
            ColorPickerType.both: false,
            ColorPickerType.primary: false,
            ColorPickerType.accent: false,
            ColorPickerType.bw: false,
            ColorPickerType.custom: true,
            ColorPickerType.wheel: false,
          },
          customColorSwatchesAndNames: customSwatches,
        ),
      ),
    );
  }
}
