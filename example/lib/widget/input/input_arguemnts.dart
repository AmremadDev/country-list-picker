import 'package:country_list_picker_example/controller/input_provider.dart';
import 'package:country_list_picker_example/widget/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_tile.dart';

class InputArguments extends StatelessWidget {
  const InputArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InputProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Input field',
              subtitleASString: "isShowTextField = ${provider.isShowTextField}",
              toggle: Switch(
                value: provider.isShowTextField,
                onChanged: (bool value) => provider.isShowTextField = value,
              ),
            ),
            XListTile(
              titleAsString: "Text Color",
              subtitleASWidge: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.inputTextColor,
                    onColorChanged: (Color color) {
                      provider.inputTextColor = color;
                    }),
              ),
            ),
            XListTile(
              titleAsString: "Font size",
              subtitleASWidge: Slider(
                  divisions: 18,
                  min: 12,
                  max: 30,
                  label: provider.inputFontSize.toInt().toString(),
                  value: provider.inputFontSize,
                  onChanged: (value) => provider.inputFontSize = value),
            ),
            XListTile(
              titleAsString: 'Font Bold',
              toggle: Switch(
                value: provider.inputFontBold,
                onChanged: (bool value) => provider.inputFontBold = value,
              ),
            ),
            XListTile(
              titleAsString: 'Mask format',
              subtitleASWidge: TextFormField(
                initialValue: provider.inputMask,
                onChanged: ((value) => provider.inputMask = value),
              ),
            ),
            XListTile(
              titleAsString: "Input Hint",
              subtitleASWidge: TextFormField(
                initialValue: provider.inputHintString,
                onChanged: ((value) => provider.inputHintString = value),
              ),
            ),
          ],
        );
      },
    );
  }
}
