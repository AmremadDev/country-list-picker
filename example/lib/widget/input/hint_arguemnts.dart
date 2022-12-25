import 'package:country_list_picker_example/controller/input_provider.dart';
import 'package:country_list_picker_example/widget/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_tile.dart';

class HintArguments extends StatelessWidget {
  const HintArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InputProvider>(
      builder: (context, input, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: "Input Hint",
              subtitleASWidge: TextFormField(
                enabled: input.isShowTextField,
                initialValue: input.inputHintString,
                onChanged: ((value) => input.inputHintString = value),
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
                      value: input.hintTextStyle.color,
                      onColorChanged: (Color color) =>
                          input.hintTextStyle = input.hintTextStyle.copyWith(color: color)),
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
                    label: input.hintTextStyle.fontSize?.toInt().toString(),
                    value: input.hintTextStyle.fontSize!,
                    onChanged: input.isShowTextField == true
                        ? (value) => input.hintTextStyle =
                            input.hintTextStyle.copyWith(fontSize: value, color: Colors.red)
                        : null,
                  )
                ],
              ),
            ),
            XListTile(
              enabled: input.isShowTextField,
              titleAsString: 'Font Bold',
              toggle: Switch(
                  value: input.hintTextStyle.fontWeight == FontWeight.bold,
                  onChanged: input.isShowTextField
                      ? (bool value) => input.hintTextStyle = input.hintTextStyle.copyWith(
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
