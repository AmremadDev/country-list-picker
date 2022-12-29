import 'package:flutter/material.dart';
import '../widget/color_picker.dart';
export '../widget/color_picker.dart';

class CustomListTile<Object, T> extends StatelessWidget {
  final bool enabled;
  final String title;
  final String? subTitle;
  final T value;
  final ValueChanged<T>? onChanged;

  //Slider arguments
  final double min;
  final double max;
  final String? sliderLabel;
  final int? divisions;
  const CustomListTile({
    super.key,
    required this.title,
    this.subTitle,
    this.enabled = true,
    required this.value,
    this.onChanged,
    this.min = 1,
    this.max = 100,
    this.sliderLabel,
    this.divisions,
  });
  @override
  Widget build(BuildContext context) {
    switch (Object) {
      case TextFormField:
        return _buildTextFormFiled(context);
      case ColorPicker:
        return _buildColorPickerTile(context);
      case Switch:
        return _buildSwitchListTile(context);
      case Slider:
        return _buildSlideristTile(context);
      default:
        return const SizedBox.shrink();
    }
  }

  ListTile _buildColorPickerTile(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title,
          style:
              TextStyle(color: enabled == true ? null : Theme.of(context).disabledColor, fontWeight: FontWeight.bold)),
      subtitle: XColorPickerDialog(
        enabled: enabled,
        value: value as Color,
        onColorChanged: onChanged as ValueChanged<Color>,
      ),
    );
  }

  ListTile _buildSlideristTile(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title,
          style:
              TextStyle(color: enabled == true ? null : Theme.of(context).disabledColor, fontWeight: FontWeight.bold)),
      subtitle: Slider(
        divisions: divisions,
        label: sliderLabel,
        min: min,
        max: max,
        value: value as double,
        onChanged: (enabled) ? onChanged as ValueChanged<double> : null,
      ),
    );
  }

  ListTile _buildSwitchListTile(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title,
          style:
              TextStyle(color: enabled == true ? null : Theme.of(context).disabledColor, fontWeight: FontWeight.bold)),
      trailing: Switch(
        value: value as bool,
        onChanged: (enabled) ? onChanged as ValueChanged<bool> : null,
      ),
    );
  }

  ListTile _buildTextFormFiled(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title,
          style:
              TextStyle(color: enabled == true ? null : Theme.of(context).disabledColor, fontWeight: FontWeight.bold)),
      subtitle: TextFormField(
        initialValue: value as String,
        enabled: enabled,
        onChanged: (enabled) ? onChanged as ValueChanged<String> : null,
      ),
    );
  }
}