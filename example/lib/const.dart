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

const double titlesFontSize = 18;
const Color lightprimarySwatch = Colors.purple;
const Color darkprimarySwatch = Colors.red;

const List<Widget> screensList = [PickerScreen(), InputScreen(), DialogScreen(), AboutScreen()];

final Map<String, Map<IconData, Widget>> pickerCategoriesList = {
  "Flag": {Icons.flag: const FlagArguments()},
  "Dial Code": {Icons.phone: const DialCodeArguments()},
  "Down Icon": {Icons.arrow_downward: const DownIconArguments()},
  "Country Name": {Icons.straighten_sharp: const CountryNameArguments()},
  "Border": {
    Icons.border_bottom: const SizedBox(
        height: 200,
        child: Center(
            child: Text("Border", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))))
  },
};

final Map<String, Map<IconData, Widget>> inputCategoriesList = {
  "Input": {Icons.flag: const InputArguments()},
  "hint": {Icons.flag: const HintArguments()},
  "Border": {
    Icons.border_bottom: const SizedBox(
        height: 200,
        child: Center(
            child: Text("Border", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)))),
  },
};
