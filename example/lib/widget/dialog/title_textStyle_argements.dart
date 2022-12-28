import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/dialog_provider.dart';
import '../color_picker.dart';
import '../list_tile.dart';

class TitleTextStyleArguments extends StatelessWidget {
  const TitleTextStyleArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, dialog, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Font Bold',
              toggle: Switch(
                  value: dialog.titleTextStyle.fontWeight == FontWeight.bold,
                  onChanged: (bool value) => dialog.titleTextStyle = dialog.titleTextStyle
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
                    label: dialog.titleTextStyle.fontSize?.toInt().toString(),
                    value: dialog.titleTextStyle.fontSize!,
                    onChanged: (value) => dialog.titleTextStyle = dialog.titleTextStyle.copyWith(fontSize: value),
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
                      value: dialog.titleTextStyle.color,
                      onColorChanged: (Color color) =>
                          dialog.titleTextStyle = dialog.titleTextStyle.copyWith(color: color)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
