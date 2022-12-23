import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/dialog_properties.dart';
import './/widget/input_properties.dart';
import './/widget/picker_properties.dart';
import './/widget/xexpansion_tile.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    final tileKeys = [];
    int selectedIndex = 0;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final tileKey = GlobalKey();
            tileKeys.add(tileKey);
            return Consumer(
              builder: (context, value, child) {
                return XExpansionTile(
                  key: tileKey,
                  title: Text(
                    data.keys.elementAt(index),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  children: [data.values.elementAt(index)],
                  onExpansionChanged: (value) {
                    if (value && index != selectedIndex) {
                      tileKeys[selectedIndex].currentState.closeExpansion();
                    }
                    selectedIndex = index;
                  },
                );
              },
            );
          },
        ));
  }
}

Map<String, Widget> data = {
  "Picker argements": const PickerProperties(),
  "Input argements": const InputProperties(),
  "Dailog argements": const DialogProperties(),
};
