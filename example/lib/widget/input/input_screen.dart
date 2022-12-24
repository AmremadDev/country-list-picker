import 'package:flutter/material.dart';
import '../../const.dart';
import '../expansion_tile.dart';
import '../input/input_arguemnts.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tileKeys = [];
    int selectedIndex = 0;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 0),
      separatorBuilder: (context, index) => const SizedBox(height: 2.5),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final tileKey = GlobalKey();
        tileKeys.add(tileKey);
        return Card(
          elevation: 5,
          child: XExpansionTile(
            initiallyExpanded: selectedIndex == index,
            key: tileKey,
            // leading: Icon(categories.values.elementAt(index).keys.elementAt(0)),
            title: Text(categories.keys.elementAt(index),
                style: const TextStyle(fontSize: titlesFontSize, fontWeight: FontWeight.bold)),
            children: [categories.values.elementAt(index).values.elementAt(0)],
            onExpansionChanged: (value) {
              if (value && index != selectedIndex) {
                tileKeys[selectedIndex].currentState.closeExpansion();
              }
              selectedIndex = index;
            },
          ),
        );
      },
    );
  }
}

Map<String, Map<IconData, Widget>> categories = {
  "Input": {Icons.flag: const InputArguments()},
  "hint": {Icons.flag: const InputArguments()},
  "Border": {
    Icons.border_bottom: const SizedBox(
      height: 200,
      child: Center(
          child: Text(
        "Border",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      )),
    ),
  },
};
