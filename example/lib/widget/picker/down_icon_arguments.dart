import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/picker_provider.dart';
import '../color_picker.dart';
import '../list_tile.dart';

class DownIconArguments extends StatelessWidget {
  const DownIconArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PickerProvider>(
      builder: (context, picker, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Visible',
              // subtitleASString: "isShowCode = ${picker.isShowCode}",
              toggle: Switch(
                  value: picker.isDownIcon, onChanged: (bool value) => picker.isDownIcon = value),
            ),
            XListTile(
              enabled: picker.isDownIcon,
              titleAsString: 'Icon Size',
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("isShowCode = ${picker.isShowCode}"),
                  Slider(
                    divisions: 5,
                    min: 20,
                    max: 40,
                    label: picker.downIcon.size!.toInt().toString(),
                    value: picker.downIcon.size!,
                    onChanged: picker.isDownIcon == true
                        ? (value) => picker.downIcon = picker.downIcon =
                            Icon(picker.downIcon.icon, color: picker.downIcon.color, size: value)
                        : null,
                  )
                ],
              ),
            ),

            // Color
            XListTile(
              enabled: picker.isDownIcon,
              titleAsString: "Icon Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("isShowCode = ${picker.pickerTextColor}"),
                  XColorPickerDialog(
                    enabled: picker.isDownIcon,
                    value: picker.downIcon.color ?? Theme.of(context).primaryColor,
                    onColorChanged: (Color color) => picker.downIcon = Icon(
                      picker.downIcon.icon,
                      color: color,
                      size: picker.downIcon.size,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
