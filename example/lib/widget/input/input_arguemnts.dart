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
      builder: (context, input, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Visible',
              toggle: Switch(
                value: input.isShowTextField,
                onChanged: (bool value) => input.isShowTextField = value,
              ),
            ),
            XListTile(
              enabled: input.isShowTextField,
              titleAsString: 'Mask format',
              subtitleASWidge: TextFormField(
                enabled: input.isShowTextField,
                initialValue: input.inputMask,
                onChanged: ((value) => input.inputMask = value),
              ),
            ),
            XListTile(
              enabled: input.isShowTextField,
              titleAsString: "Font Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XColorPickerDialog(
                      enabled: input.isShowTextField,
                      value: input.inputTextStyle.color,
                      onColorChanged: (Color color) =>
                          input.inputTextStyle = input.inputTextStyle.copyWith(color: color)),
                ],
              ),
            ),
            XListTile(
              enabled: input.isShowTextField,
              titleAsString: 'Font Size',
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                    divisions: 18,
                    min: 12,
                    max: 30,
                    label: input.inputTextStyle.fontSize?.toInt().toString(),
                    value: input.inputTextStyle.fontSize!,
                    onChanged: input.isShowTextField == true
                        ? (value) =>
                            input.inputTextStyle = input.inputTextStyle.copyWith(fontSize: value)
                        : null,
                  )
                ],
              ),
            ),
            XListTile(
              enabled: input.isShowTextField,
              titleAsString: 'Font Bold',
              toggle: Switch(
                  value: input.inputTextStyle.fontWeight == FontWeight.bold,
                  onChanged: input.isShowTextField
                      ? (bool value) => input.inputTextStyle = input.inputTextStyle.copyWith(
                          fontWeight: (value == false) ? FontWeight.normal : FontWeight.bold)
                      : null),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
