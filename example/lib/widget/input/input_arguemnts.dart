import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/input_provider.dart';
import '../custom_list_tile.dart';
import '../color_picker.dart';

class InputArguments extends StatelessWidget {
  const InputArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InputProvider>(
      builder: (context, input, child) {
        return Column(
          children: [
            CustomListTile<Switch, bool>(
              title: "Visible",
              value: input.isShowTextField,
              onChanged: (bool value) => input.isShowTextField = value,
            ),
            CustomListTile<TextFormField, String>(
              title: "Mask format",
              enabled: input.isShowTextField,
              value: input.mask,
              onChanged: (value) => input.mask = value,
            ),
            CustomListTile<Switch, bool>(
              title: "Font Bold",
              enabled: input.isShowTextField,
              value: input.textStyle.fontWeight == FontWeight.bold,
              onChanged: (bool value) => input.textStyle = input.textStyle
                  .copyWith(fontWeight: (value == false) ? FontWeight.normal : FontWeight.bold),
            ),
            CustomListTile<Slider, double>(
              title: "Font Size",
              enabled: input.isShowTextField,
              min: 12,
              max: 30,
              divisions: 18,
              value: input.textStyle.fontSize!,
              sliderLabel: input.textStyle.fontSize?.toInt().toString(),
              onChanged: (value) => input.textStyle = input.textStyle.copyWith(fontSize: value),
            ),
            CustomListTile<ColorPicker, Color>(
              title: "Font Color",
              enabled: input.isShowTextField,
              value: input.textStyle.color!,
              onChanged: (Color color) => input.textStyle = input.textStyle.copyWith(color: color),
            ),
          ],
        );
      },
    );
  }
}
