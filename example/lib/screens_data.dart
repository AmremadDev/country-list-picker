import 'package:flutter/material.dart';

import '../model/screen.dart';
import '../model/argument.dart';

import '../widget/picker/down_icon_arguments.dart';
import '../widget/picker/flag_arguments.dart';
import '../widget/picker/dial_code_arguments.dart';
import '../widget/picker/country_name_arguments.dart';
import '../widget/input/input_arguemnts.dart';
import '../widget/input/hint_arguemnts.dart';
import '../widget/about/about_screen.dart';
import '../widget/dialog/general_arguments.dart';

const double titlesFontSize = 18;
const Color lightprimarySwatch = Colors.purple;
const Color darkprimarySwatch = Colors.red;

List<Screen> screens = [
  Screen(
    title: "Picker",
    activeIcon: Icons.home,
    inactiveIcon: Icons.home_outlined,
    child: const AboutScreen(),
    arguments: pickerArguments,
  ),
  Screen(
    title: "Input",
    activeIcon: Icons.text_fields,
    inactiveIcon: Icons.text_fields_outlined,
    arguments: inputArguments,
  ),
  Screen(
    title: "Dialog",
    activeIcon: Icons.list_alt,
    inactiveIcon: Icons.list_alt_outlined,
    arguments: dialogArguments,
  ),
  const Screen(
    title: "About",
    activeIcon: Icons.info,
    inactiveIcon: Icons.info_outline,
    child: AboutScreen(),
  ),
];

List<Argument> pickerArguments = [
  Argument(title: "Flag", child: const FlagArguments()),
  Argument(title: "Dial Code", child: const DialCodeArguments()),
  Argument(title: "Down Icon", child: const DownIconArguments()),
  Argument(title: "Country Name", child: const CountryNameArguments()),
  Argument(
      title: "Border",
      child: const SizedBox(
          height: 200,
          child: Center(child: Text("Border", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))))),
];

List<Argument> inputArguments = [
  Argument(title: "Input", child: const InputArguments()),
  Argument(title: "hint", child: const HintArguments()),
  Argument(
      title: "Border",
      child: const SizedBox(
          height: 200,
          child: Center(child: Text("Border", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)))))
];
List<Argument> dialogArguments = [
  Argument(title: "General", child: const GeneralArguments()),
  Argument(title: "Title", child: const HintArguments()),
  Argument(title: "Text", child: const HintArguments()),
  Argument(title: "Search Tile", child: const HintArguments()),
  Argument(title: "Current Location Tile", child: const HintArguments()),
  Argument(title: "Last Pick Tile", child: const HintArguments()),
  Argument(title: "Alphabets Bar", child: const HintArguments()),
];

final Map<String, Widget> pickerCategoriesList = {
  "Flag": const FlagArguments(),
  "Dial Code": const DialCodeArguments(),
  "Down Icon": const DownIconArguments(),
  "Country Name": const CountryNameArguments(),
  "Border": const SizedBox(
      height: 200, child: Center(child: Text("Border", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)))),
};

final Map<String, Widget> inputCategoriesList = {
  "Input": const InputArguments(),
  "hint": const HintArguments(),
  "Border": const SizedBox(
      height: 200, child: Center(child: Text("Border", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)))),
};

final Map<String, Widget> dialogCategoriesList = {
  "General": const GeneralArguments(),
  "Title": const GeneralArguments(),
  "Text": const GeneralArguments(),
  "Search Tile": const GeneralArguments(),
  "Current Location Tile": const GeneralArguments(),
  "Last Pick Tile": const GeneralArguments(),
  "Alphabets Bar": const GeneralArguments(),
};
