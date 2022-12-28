import 'package:country_list_picker_example/controller/dialog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../color_picker.dart';
import '../list_tile.dart';

class GeneralArguments extends StatelessWidget {
  const GeneralArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, dialog, child) {
        return Column(
          children: [
            XListTile(
                titleAsString: 'Country Flag',
                toggle: Switch(
                    value: dialog.countryFlag,
                    onChanged: (bool value) {
                      dialog.countryFlag = value;
                    })),
            XListTile(
                titleAsString: 'Country dial codes',
                toggle: Switch(
                    value: dialog.countryDialCode,
                    onChanged: (bool value) {
                      dialog.countryDialCode = value;
                    })),
            XListTile(
                titleAsString: 'App action button',
                toggle: Switch(
                    value: dialog.upActionbutton,
                    onChanged: (bool value) {
                      dialog.upActionbutton = value;
                    })),
            XListTile(
              titleAsString: "Background Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XColorPickerDialog(
                    value: dialog.backgroundColor,
                    onColorChanged: (Color color) => dialog.backgroundColor = color,
                  ),
                ],
              ),
            ),
            XListTile(
              titleAsString: "Titles Background Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XColorPickerDialog(
                    value: dialog.titlesBackgroundColor,
                    onColorChanged: (Color color) => dialog.titlesBackgroundColor = color,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
