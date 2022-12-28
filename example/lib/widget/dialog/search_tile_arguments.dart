import 'package:country_list_picker_example/controller/dialog_provider.dart';
import 'package:country_list_picker_example/controller/input_provider.dart';
import 'package:country_list_picker_example/widget/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_tile.dart';

class SearchTileArguments extends StatelessWidget {
  const SearchTileArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, dialog, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Visible',
              toggle: Switch(
                value: dialog.searchTile,
                onChanged: (bool value) => dialog.searchTile = value,
              ),
            ),
            XListTile(
              titleAsString: "Tile Label",
              subtitleASWidge: TextFormField(
                initialValue: dialog.hintString,
                onChanged: ((value) => dialog.hintString = value),
              ),
            ),
            XListTile(
              titleAsString: "Search Hint",
              subtitleASWidge: TextFormField(
                initialValue: dialog.hintString,
                onChanged: ((value) => dialog.hintString = value),
              ),
            ),
            XListTile(
              titleAsString: "Font Color",
              subtitleASWidge: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XColorPickerDialog(
                      value: dialog.hintTextStyle.color,
                      onColorChanged: (Color color) =>
                          dialog.hintTextStyle = dialog.hintTextStyle.copyWith(color: color)),
                ],
              ),
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
                    label: dialog.hintTextStyle.fontSize?.toInt().toString(),
                    value: dialog.hintTextStyle.fontSize!,
                    onChanged: (value) => dialog.hintTextStyle =
                        dialog.hintTextStyle.copyWith(fontSize: value, color: dialog.hintTextStyle.color),
                  )
                ],
              ),
            ),
            XListTile(
              titleAsString: 'Font Bold',
              toggle: Switch(
                  value: dialog.hintTextStyle.fontWeight == FontWeight.bold,
                  onChanged: (bool value) => dialog.hintTextStyle = dialog.hintTextStyle
                      .copyWith(fontWeight: (value == false) ? FontWeight.normal : FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
