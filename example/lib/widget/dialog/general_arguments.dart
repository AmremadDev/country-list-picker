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
              titleAsString: "AppBar Title",
              subtitleASWidge: TextFormField(
                initialValue: dialog.dialogAppBarTitle,
                onChanged: ((value) => dialog.dialogAppBarTitle = value),
              ),
            ),
            XListTile(
                titleAsString: 'Country Flag',
                toggle: Switch(
                    value: dialog.countryFlag,
                    onChanged: (bool value) {
                      dialog.countryFlag = value;
                    })),
            XListTile(
                titleAsString: 'Country Dial Code',
                toggle: Switch(
                    value: dialog.countryDialCode,
                    onChanged: (bool value) {
                      dialog.countryDialCode = value;
                    })),
            XListTile(
                titleAsString: 'Top Action Button',
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
                      onColorChanged: (Color color) =>
                          dialog.backgroundColor = dialog.backgroundColor),
                ],
              ),
            ),
            XListTile(
              titleAsString: "Title Background Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XColorPickerDialog(
                      value: dialog.backgroundColor,
                      onColorChanged: (Color color) =>
                          dialog.backgroundColor = dialog.backgroundColor),
                ],
              ),
            )

            //                     XListTile(
            //   enabled: input.isShowTextField,
            //   titleAsString: "Font Color",
            //   subtitleASWidge: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       XColorPickerDialog(
            //           enabled: input.isShowTextField,
            //           value: input.inputTextStyle.color,
            //           onColorChanged: (Color color) =>
            //               input.inputTextStyle = input.inputTextStyle.copyWith(color: color)),
            //     ],
            //   ),
            // ),
            // XListTile(
            //   enabled: input.isShowTextField,
            //   titleAsString: 'Font Size',
            //   subtitleASWidge: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Slider(
            //         divisions: 18,
            //         min: 12,
            //         max: 30,
            //         label: input.inputTextStyle.fontSize?.toInt().toString(),
            //         value: input.inputTextStyle.fontSize!,
            //         onChanged: input.isShowTextField == true
            //             ? (value) =>
            //                 input.inputTextStyle = input.inputTextStyle.copyWith(fontSize: value)
            //             : null,
            //       )
            //     ],
            //   ),
            // ),
            // XListTile(
            //   enabled: input.isShowTextField,
            //   titleAsString: 'Font Bold',
            //   toggle: Switch(
            //       value: input.inputTextStyle.fontWeight == FontWeight.bold,
            //       onChanged: input.isShowTextField
            //           ? (bool value) => input.inputTextStyle = input.inputTextStyle.copyWith(
            //               fontWeight: (value == false) ? FontWeight.normal : FontWeight.bold)
            //           : null),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
          ],
        );
      },
    );
  }
}
