import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/picker_provider.dart';
import '../color_picker.dart';
import '../list_tile.dart';

class CountryNameArguments extends StatelessWidget {
  const CountryNameArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PickerProvider>(
      builder: (context, picker, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Visible',
              toggle: Switch(
                  value: picker.isShowCountryName,
                  onChanged: (bool value) => picker.isShowCountryName = value),
            ),
            XListTile(
              enabled: picker.isShowCountryName,
              titleAsString: 'Font Bold',
              toggle: Switch(
                  value: picker.countryNameTextStyle.fontWeight == FontWeight.bold,
                  onChanged: picker.isShowCountryName
                      ? (bool value) => picker.countryNameTextStyle = picker.countryNameTextStyle
                          .copyWith(
                              fontWeight: value == false ? FontWeight.normal : FontWeight.bold)
                      : null),
            ),
            XListTile(
              enabled: picker.isShowCountryName,
              titleAsString: 'Font Size',
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                    divisions: 18,
                    min: 12,
                    max: 30,
                    label: picker.countryNameTextStyle.fontSize?.toInt().toString(),
                    value: picker.countryNameTextStyle.fontSize!,
                    onChanged: picker.isShowCountryName == true
                        ? (value) => picker.countryNameTextStyle =
                            picker.countryNameTextStyle.copyWith(fontSize: value)
                        : null,
                  )
                ],
              ),
            ),

            // Color
            XListTile(
              enabled: picker.isShowCountryName,
              titleAsString: "Font Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XColorPickerDialog(
                      enabled: picker.isShowCountryName,
                      value: picker.countryNameTextStyle.color,
                      onColorChanged: (Color color) => picker.countryNameTextStyle =
                          picker.countryNameTextStyle.copyWith(color: color)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
