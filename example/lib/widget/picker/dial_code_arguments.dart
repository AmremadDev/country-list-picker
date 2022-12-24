import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/picker_provider.dart';
import '../color_picker.dart';
import '../list_tile.dart';

class DialCodeArguments extends StatelessWidget {
  const DialCodeArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PickerProvider>(
      builder: (context, picker, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Show/Hide',
              toggle: Switch(
                  value: picker.isShowCode, onChanged: (bool value) => picker.isShowCode = value),
            ),
            XListTile(
              enabled: picker.isShowCode,
              titleAsString: 'Font Bold',
              toggle: Switch(
                  value: picker.dialCodeTextStyle.fontWeight == FontWeight.normal,
                  onChanged: picker.isShowCode
                      ? (bool value) => picker.dialCodeTextStyle = picker.dialCodeTextStyle
                          .copyWith(fontWeight: value == true ? FontWeight.normal : FontWeight.bold)
                      : null),
            ),
            XListTile(
              enabled: picker.isShowCode,
              titleAsString: 'Font Size',
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                    divisions: 18,
                    min: 12,
                    max: 30,
                    label: picker.dialCodeTextStyle.fontSize?.toInt().toString(),
                    value: picker.dialCodeTextStyle.fontSize!,
                    onChanged: picker.isShowCode == true
                        ? (value) => picker.dialCodeTextStyle =
                            picker.dialCodeTextStyle.copyWith(fontSize: value)
                        : null,
                  )
                ],
              ),
            ),

            // Color
            XListTile(
              enabled: picker.isShowCode,
              titleAsString: "Font Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XColorPickerDialog(
                      enabled: picker.isShowCode,
                      value: picker.dialCodeTextStyle.color,
                      onColorChanged: (Color color) => picker.dialCodeTextStyle =
                          picker.dialCodeTextStyle.copyWith(color: color)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
