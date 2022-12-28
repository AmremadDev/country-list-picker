import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/picker_provider.dart';
import '../list_tile.dart';

class FlagArguments extends StatelessWidget {
  const FlagArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PickerProvider>(
      builder: (context, picker, child) {
        return Column(
          children: [
            XListTile(
              titleAsString: 'Visible',
              // subtitleASString: "isShowFlag = ${picker.isShowFlag}",
              toggle: Switch(
                value: picker.isShowFlag,
                onChanged: (bool value) => picker.isShowFlag = value,
              ),
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
