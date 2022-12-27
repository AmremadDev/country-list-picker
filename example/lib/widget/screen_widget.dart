import 'package:country_list_picker_example/model/screen.dart';
import 'package:flutter/material.dart';
import '../../const.dart';
import '../widget/expansion_tile.dart';

class ScreenWidget extends StatelessWidget {
  final Screen screen;

  const ScreenWidget({required this.screen, super.key});

  @override
  Widget build(BuildContext context) {
    // final tileKeys = [];
    int selectedIndex = 0;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 0),
      separatorBuilder: (context, index) => const SizedBox(height: 2.5),
      itemCount: screen.arguments.length,
      itemBuilder: (context, index) {
        // final tileKey = GlobalKey();
        // tileKeys.add(tileKey);
        screen.arguments[index].key = GlobalKey();
        return Card(
          elevation: 5,
          child: XExpansionTile(
            initiallyExpanded: selectedIndex == index,
            key: screen.arguments[index].key,
            // leading: Icon(categories.values.elementAt(index).keys.elementAt(0)),
            title: Text(screen.arguments[index].title,
                style: const TextStyle(fontSize: titlesFontSize, fontWeight: FontWeight.bold)),
            children: [screen.arguments[index].child],
            onExpansionChanged: (value) {
              screen.arguments.forEach((element) { 
               print( element.key!.runtimeType);
              });
              if (value && index != selectedIndex) {
                State<StatefulWidget>? state = screen.arguments[selectedIndex].key!.currentState;
                // state.closeExpansion();
                // tileKeys[selectedIndex].currentState.closeExpansion();
              }
              selectedIndex = index;
            },
          ),
        );
      },
    );
  }
}
