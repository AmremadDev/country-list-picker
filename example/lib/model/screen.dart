import 'package:flutter/material.dart';

class Screen {
  final String title;
  final Widget child;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final List<Argument> arguments;


   const Screen({
    required this.title,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.arguments,
    required this.child,

  });
}

class Argument {
    bool isExpanded ;

  final String title;
  final Widget child;
  // final GlobalKey<State<StatefulWidget>> key;
  GlobalKey<State<StatefulWidget>>? key;

   Argument({
    required this.title,
    required this.child,
          this.isExpanded = false,
    this.key,
  });
}


// final Map<String, Widget> dialogCategoriesList = {
//   "General": const GeneralArguments(),
//   "Title": const GeneralArguments(),
//   "Text": const GeneralArguments(),
//   "Search Tile": const GeneralArguments(),
//   // "Current Location Tile": const GeneralArguments(),
//   // "Last Pick Tile": const GeneralArguments(),
//   // "Alphabets Bar": const GeneralArguments(),
// };
