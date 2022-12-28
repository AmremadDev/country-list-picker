
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/dialog_provider.dart';
import '../color_picker.dart';
import '../list_tile.dart';

class TextStyleArguments extends StatelessWidget {
  const TextStyleArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, dialog, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Font Bold',
              toggle: Switch(
                  value: dialog.textStyle.fontWeight == FontWeight.bold,
                  onChanged: (bool value) => dialog.textStyle = dialog.textStyle
                      .copyWith(fontWeight: (value == false) ? FontWeight.normal : FontWeight.bold)),
            ),
            XListTile(
              titleAsString: 'Font Size',
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                    divisions: 18,
                    min: 12,
                    max: 30,
                    label: dialog.textStyle.fontSize?.toInt().toString(),
                    value: dialog.textStyle.fontSize!,
                    onChanged: (value) => dialog.textStyle = dialog.textStyle.copyWith(fontSize: value),
                  )
                ],
              ),
            ),
            XListTile(
              titleAsString: "Font Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XColorPickerDialog(
                      value: dialog.textStyle.color,
                      onColorChanged: (Color color) =>
                          dialog.textStyle = dialog.textStyle.copyWith(color: color)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
