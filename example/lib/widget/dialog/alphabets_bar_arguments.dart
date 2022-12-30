import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/dialog_provider.dart';
import '../custom_list_tile.dart';
import '../color_picker.dart';

class AlphabetsBarArguments extends StatelessWidget {
  const AlphabetsBarArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, dialog, child) {
        return Column(
          children: [
            CustomListTile<Switch, bool>(
              title: "Visible",
              value: dialog.alphabetBar,
              onChanged: (bool value) => dialog.alphabetBar = value,
            ),
            CustomListTile<ColorPicker, Color>(
              title: "Unselected Background",
              enabled: dialog.alphabetBar,
              value: dialog.alphabetUnSelectedBackgroundColor,
              onChanged: (Color color) => dialog.alphabetUnSelectedBackgroundColor = color,
            ),

            // unselected
            CustomListTile<Switch, bool>(
              title: "Unselected Font Bold",
              value: dialog.alphabetUnSelectedTextStyle.fontWeight == FontWeight.bold,
              onChanged: (bool value) => dialog.alphabetUnSelectedTextStyle = dialog
                  .alphabetUnSelectedTextStyle
                  .copyWith(fontWeight: (value == false) ? FontWeight.normal : FontWeight.bold),
            ),
            CustomListTile<Slider, double>(
              title: "Unselected Font Size",
              min: 12,
              max: 30,
              divisions: 18,
              value: dialog.alphabetUnSelectedTextStyle.fontSize!,
              sliderLabel: dialog.alphabetUnSelectedTextStyle.fontSize?.toInt().toString(),
              onChanged: (value) => dialog.alphabetUnSelectedTextStyle = dialog
                  .alphabetUnSelectedTextStyle
                  .copyWith(fontSize: value, color: dialog.alphabetUnSelectedTextStyle.color),
            ),
            CustomListTile<ColorPicker, Color>(
              title: "Unselected Font Color",
              value: dialog.alphabetUnSelectedTextStyle.color!,
              onChanged: (Color color) => dialog.alphabetUnSelectedTextStyle =
                  dialog.alphabetUnSelectedTextStyle.copyWith(color: color),
            ),

            // selected
            CustomListTile<ColorPicker, Color>(
              title: "Selected Background",
              enabled: dialog.alphabetBar,
              value: dialog.alphabetSelectedBackgroundColor,
              onChanged: (Color color) => dialog.alphabetSelectedBackgroundColor = color,
            ),
            CustomListTile<Switch, bool>(
              title: "Selected Font Bold",
              value: dialog.alphabetSelectedTextStyle.fontWeight == FontWeight.bold,
              onChanged: (bool value) => dialog.alphabetSelectedTextStyle = dialog
                  .alphabetSelectedTextStyle
                  .copyWith(fontWeight: (value == false) ? FontWeight.normal : FontWeight.bold),
            ),
            CustomListTile<Slider, double>(
              title: "Selected Font Size",
              min: 12,
              max: 30,
              divisions: 18,
              value: dialog.alphabetSelectedTextStyle.fontSize!,
              sliderLabel: dialog.alphabetSelectedTextStyle.fontSize?.toInt().toString(),
              onChanged: (value) => dialog.alphabetSelectedTextStyle = dialog
                  .alphabetSelectedTextStyle
                  .copyWith(fontSize: value, color: dialog.alphabetSelectedTextStyle.color),
            ),
            CustomListTile<ColorPicker, Color>(
              title: "Selected Font Color",
              value: dialog.alphabetSelectedTextStyle.color!,
              onChanged: (Color color) => dialog.alphabetSelectedTextStyle =
                  dialog.alphabetSelectedTextStyle.copyWith(color: color),
            ),
          ],
        );
      },
    );
  }
}
