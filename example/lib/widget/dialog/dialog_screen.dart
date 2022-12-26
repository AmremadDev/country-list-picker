import 'package:flutter/material.dart';
import '../../const.dart';
import '../expansion_tile.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tileKeys = [];
    int selectedIndex = 0;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 0),
      separatorBuilder: (context, index) => const SizedBox(height: 2.5),
      itemCount: dialogCategoriesList.length,
      itemBuilder: (context, index) {
        final tileKey = GlobalKey();
        tileKeys.add(tileKey);

        return Card(
          elevation: 5,
          child: XExpansionTile(
            initiallyExpanded: selectedIndex == index,
            key: tileKey,
            // leading: Icon(categories.values.elementAt(index).keys.elementAt(0)),
            title: Text(dialogCategoriesList.keys.elementAt(index),
                style: const TextStyle(fontSize: titlesFontSize, fontWeight: FontWeight.bold)),
            children: [dialogCategoriesList.values.elementAt(index)],
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
