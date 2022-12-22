import 'package:country_list_picker_example/xcolor_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../clp_provider.dart';
import 'xswitch_list_tile.dart';

class PickerProperties extends StatelessWidget {
  const PickerProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CLPProvider>(
      builder: (context, provider, child) {
        return ListView(
          children: [
            // show/hide properties
            XListTile(
              title: 'Country flag',
              subtitle: Text("isShowFlag = ${provider.isShowFlag}"),
              toggle: Switch(
                  value: provider.isShowFlag,
                  onChanged: (bool value) => provider.isShowFlag = value),
            ),
            XListTile(
              title: 'Country dial code',
              subtitle: Text("isShowCode = ${provider.isShowCode}"),
              toggle: Switch(
                  value: provider.isShowCode,
                  onChanged: (bool value) => provider.isShowCode = value),
            ),
            XListTile(
              title: 'Down Icon',
              subtitle: Text("isDownIcon = ${provider.isDownIcon}"),
              toggle: Switch(
                  value: provider.isDownIcon,
                  onChanged: (bool value) => provider.isDownIcon = value),
            ),
            XListTile(
              title: 'Country Name',
              subtitle: Text("isShowTitle = ${provider.isShowTitle}"),
              toggle: Switch(
                  value: provider.isShowTitle,
                  onChanged: (bool value) => provider.isShowTitle = value),
            ),

            XListTile(
              title: "Dial code font size",
              subtitle: Slider(
                  divisions: 18,
                  min: 12,
                  max: 30,
                  label: provider.pickerDialCodeFontSize.toInt().toString(),
                  value: provider.pickerDialCodeFontSize,
                  onChanged: (value) => provider.pickerDialCodeFontSize = value),
            ),
            XListTile(
              title: 'Dial code font bold',
              toggle: Switch(
                  value: provider.pickerDialCodeFontBold,
                  onChanged: (bool value) => provider.pickerDialCodeFontBold = value),
            ),
            // Borders
            XListTile(
                title: 'Picker Border',
                // subtitle: Text("isShowTextField = ${provider.isShowTextField}"),
                toggle: Switch(
                    value: provider.pickerBorder,
                    onChanged: (bool value) {
                      provider.pickerBorder = value;
                    })),
            XListTile(
                title: 'Input Border',
                // subtitle: Text("isShowTextField = ${provider.isShowTextField}"),
                toggle: Switch(
                    value: provider.inputBorder,
                    onChanged: (bool value) => provider.inputBorder = value)),
            // Color
            XListTile(
              title: "Text Color",
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.pickerTextColor,
                    onColorChanged: (Color color) => provider.pickerTextColor = color),
              ),
            ),
          ],
        );
      },
    );
  }
}
