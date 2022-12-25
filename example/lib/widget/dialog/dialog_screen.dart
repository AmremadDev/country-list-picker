import 'package:flutter/material.dart';
import '../../const.dart';
import '../expansion_tile.dart';
import 'general_arguments.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

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
            // subtitle: Text(""),
            // childrenPadding: const EdgeInsets.only(top: 0, bottom: 0),
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
  "General": {Icons.flag: const GeneralArguments()},
  "Title": {Icons.flag: const GeneralArguments()},
  "Text": {Icons.flag: const GeneralArguments()},
  "Search Tile": {Icons.flag: const GeneralArguments()},
  "Current Location Tile": {Icons.flag: const GeneralArguments()},
  "Last Pick Tile": {Icons.flag: const GeneralArguments()},
  "Alphabets Bar": {Icons.flag: const GeneralArguments()},
};
