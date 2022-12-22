import 'package:country_list_picker_example/xcolor_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../clp_provider.dart';
import 'xswitch_list_tile.dart';

class InputProperties extends StatelessWidget {
  InputProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CLPProvider>(
      builder: (context, provider, child) {
        return ListView(
          children: [
            XListTile(
              title: 'Input field',
              subtitle: Text("isShowTextField = ${provider.isShowTextField}"),
              toggle: Switch(
                value: provider.isShowTextField,
                onChanged: (bool value) {
                  provider.isShowTextField = value;
                  provider.isShowTextField = value;
                },
              ),
            ),
            XListTile(
              title: "Text Color",
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.inputTextColor,
                    onColorChanged: (Color color) => provider.inputTextColor = color),
              ),
            ),
            XListTile(
              title: "Font size",
              subtitle: Slider(
                  divisions: 18,
                  min: 12,
                  max: 30,
                  label: provider.inputFontSize.toInt().toString(),
                  value: provider.inputFontSize,
                  onChanged: (value) => provider.inputFontSize = value),
            ),
            XListTile(
              title: 'Font Bold',
              toggle: Switch(
                value: provider.inputFontBold,
                onChanged: (bool value) {
                  provider.inputFontBold = value;
                  provider.inputFontBold = value;
                },
              ),
            ),
            XListTile(
              title: 'Mask format',
              subtitle: TextField(
                onChanged: ((value) {
                  provider.inputMask = value;
                }),
              ),
            ),
            XListTile(
              title: "Input Hint",
              subtitle: TextField(
                controller: TextEditingController()..text = provider.inputHintString,
                onChanged: ((value) => provider.inputHintString = value),
              ),
            ),
          ],
        );
      },
    );
  }
}
