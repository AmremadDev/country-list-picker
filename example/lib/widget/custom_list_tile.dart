import 'package:country_list_picker_example/translation.dart';
import 'package:country_list_picker_example/widget/color_picker.dart';
import 'package:flutter/material.dart';

class CustomListTile<Object, T> extends StatelessWidget {
  final bool enabled;
  final String title;
  final String? subTitle;
  final T value;
  final ValueChanged<T>? onChanged;
  final ValueChanged<IconData?>? onChanged2;
  //Slider arguments
  final double min;
  final double max;
  final String? sliderLabel;
  final int? divisions;
  final List<IconData> iconsList;

  const CustomListTile({
    super.key,
    required this.title,
    this.subTitle,
    this.enabled = true,
    required this.value,
    this.onChanged,
    this.onChanged2,
    this.min = 1,
    this.max = 100,
    this.sliderLabel,
    this.divisions,
    this.iconsList = const [
      Icons.check,
      Icons.star,
      Icons.circle,
      Icons.ac_unit,
      Icons.add,
      Icons.arrow_back,
      Icons.arrow_back_ios_new,
      Icons.arrow_circle_left_outlined,
      Icons.keyboard_double_arrow_left_rounded,
      Icons.subdirectory_arrow_left_outlined
    ],
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
      case DropdownButtonFormField:
        return _buildDropdownButtonFormField(context);

      default:
        return const SizedBox.shrink();
    }
  }

  ListTile _buildColorPickerTile(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title.tr,
          style: TextStyle(
              color: enabled == true ? null : Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold)),
      subtitle: ColorPicker(
        enabled: enabled,
        value: value as Color,
        onColorChanged: onChanged as ValueChanged<Color>,
      ),
    );
  }

  Widget _buildDropdownButtonFormField(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title.tr,
          style: TextStyle(
              color: enabled == true ? null : Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold)),
      subtitle: DropdownButtonFormField<IconData>(
        decoration: const InputDecoration(
            counter: Text(" "),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2))),
        value: value as IconData,
        items: iconsList
            .map<DropdownMenuItem<IconData>>(
              (e) => DropdownMenuItem<IconData>(
                  value: e, child: Icon(e, color: Theme.of(context).colorScheme.primary)),
            )
            .toList(),
        onChanged: onChanged as ValueChanged<IconData?>,
      ),
    );
  }

  ListTile _buildSlideristTile(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title.tr,
          style: TextStyle(
              color: enabled == true ? null : Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold)),
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
      title: Text(title.tr,
          style: TextStyle(
              color: enabled == true ? null : Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold)),
      trailing: Switch(
        value: value as bool,
        onChanged: (enabled) ? onChanged as ValueChanged<bool> : null,
      ),
    );
  }

  ListTile _buildTextFormFiled(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title.tr,
          style: TextStyle(
              color: enabled == true ? null : Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold)),
      subtitle: TextFormField(
        initialValue: value as String,
        enabled: enabled,
        onChanged: (enabled) ? onChanged as ValueChanged<String> : null,
      ),
    );
  }
}
