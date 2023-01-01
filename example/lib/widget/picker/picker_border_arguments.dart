import 'package:country_list_picker_example/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/picker_provider.dart';
import '../color_picker.dart';
import '../custom_list_tile.dart';

class PickerBorderArguments extends StatelessWidget {
  const PickerBorderArguments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PickerProvider>(
      builder: (context, picker, child) {
        return Column(
          children: [
            CustomListTile<DropdownButtonFormField, Borders>(
              title: "Type",
              value: Borders.underline,
              onStringChanged: (value) {
                  picker.border = value;
              },
            ),
            CustomListTile<Slider, double>(
              title: "Width",
              enabled: picker.border != Borders.none,
              min: 1,
              max: 5,
              divisions: 4,
              value:picker.borderWidth,
              sliderLabel: picker.borderWidth.toInt().toString(),
              onChanged: (value) => picker.borderWidth = value,
            ),

            CustomListTile<ColorPicker, Color>(
              title: "Font Color",
              enabled:  picker.border != Borders.none,
              value: picker.borderColor,
              onChanged: (Color color) =>
                  picker.borderColor = picker.borderColor,
            ),
          ],
        );
      },
    );
  }
}
