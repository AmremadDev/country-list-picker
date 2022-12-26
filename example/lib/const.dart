import 'package:flutter/material.dart';

import '../widget/picker/picker_screen.dart';
import '../widget/picker/down_icon_arguments.dart';
import '../widget/picker/flag_arguments.dart';
import '../widget/picker/dial_code_arguments.dart';
import '../widget/picker/country_name_arguments.dart';
import '../widget/input/input_screen.dart';
import '../widget/input/input_arguemnts.dart';
import '../widget/input/hint_arguemnts.dart';
import '../widget/dialog/dialog_screen.dart';
import '../widget/about/about_screen.dart';
import '../model/screen.dart';
import '../widget/dialog/general_arguments.dart';

const double titlesFontSize = 18;
const Color lightprimarySwatch = Colors.purple;
const Color darkprimarySwatch = Colors.red;

const List<Screen> screens = [
  Screen(
    title: "Picker",
    activeIcon: Icons.home,
    inactiveIcon: Icons.home_outlined,
    child: PickerScreen(),
  ),
  Screen(
      title: "Input",
      activeIcon: Icons.text_fields,
      inactiveIcon: Icons.text_fields_outlined,
      child: InputScreen()),
  Screen(
      title: "Dialog",
      activeIcon: Icons.list_alt,
      inactiveIcon: Icons.list_alt_outlined,
      child: DialogScreen()),
  Screen(
      title: "About",
      activeIcon: Icons.info,
      inactiveIcon: Icons.info_outline,
      child: AboutScreen()),
];

final Map<String, Widget> pickerCategoriesList = {
  "Flag": const FlagArguments(),
  "Dial Code": const DialCodeArguments(),
  "Down Icon": const DownIconArguments(),
  "Country Name": const CountryNameArguments(),
  "Border": const SizedBox(
      height: 200,
      child: Center(
          child: Text("Border", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)))),
};

final Map<String, Widget> inputCategoriesList = {
  "Input": const InputArguments(),
  "hint": const HintArguments(),
  "Border": const SizedBox(
      height: 200,
      child: Center(
          child: Text("Border", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)))),
};

final Map<String, Widget> dialogCategoriesList = {
  "General": const GeneralArguments(),
  "Title": const GeneralArguments(),
  "Text": const GeneralArguments(),
  "Search Tile": const GeneralArguments(),
  // "Current Location Tile": const GeneralArguments(),
  // "Last Pick Tile": const GeneralArguments(),
  // "Alphabets Bar": const GeneralArguments(),
};
