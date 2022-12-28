import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/picker_provider.dart';
import '../custom_list_tile.dart';
import '../list_tile.dart';

class FlagArguments extends StatelessWidget {
  const FlagArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PickerProvider>(
      builder: (context, picker, child) {
        return Column(
          children: [
            CustomListTile<Switch, bool>(
              value: picker.isShowFlag,
              enabled: true,
              title: "Visible -> New ListTile",
              onChanged: (bool value) => picker.isShowFlag = value,
            ),
            XListTile(
              titleAsString: 'Visible',
              toggle: Switch(
                value: picker.isShowFlag,
                onChanged: (bool value) => picker.isShowFlag = value,
              ),
            ),
            CustomListTile<Slider, double>(
              value: picker.flagSize.width,
              enabled: true,
              min: 10,
              max: 100,
              title: "Visible  -> New ListTile",
              onChanged: (value) => picker.flagSize = Size(value, picker.flagSize.height),
            ),
            XListTile(
              enabled: picker.isShowFlag,
              titleAsString: "Width",
              subtitleASWidge: Slider(
                  divisions: 18,
                  min: 10,
                  max: 100,
                  label: picker.flagSize.width.toString(),
                  value: picker.flagSize.width,
                  onChanged: picker.isShowFlag == false
                      ? null
                      : (value) => picker.flagSize = Size(value, picker.flagSize.height)),
            ),
            XListTile(
              enabled: picker.isShowFlag,
              titleAsString: "Hight",
              subtitleASWidge: Slider(
                divisions: 4,
                min: 10,
                max: 50,
                label: picker.flagSize.height.toString(),
                value: picker.flagSize.height,
                onChanged: picker.isShowFlag == false
                    ? null
                    : (value) => picker.flagSize = Size(picker.flagSize.width, value),
              ),
            ),
          ],
        );
      },
    );
  }
}
