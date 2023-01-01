import 'package:flutter/material.dart';
import '../model/screen.dart';
import '../model/onboarding.dart';

import '../widget/picker/down_icon_arguments.dart';
import '../widget/picker/flag_arguments.dart';
import '../widget/picker/dial_code_arguments.dart';
import '../widget/picker/country_name_arguments.dart';
import '../widget/input/input_border.arguments.dart';
import '../widget/picker/picker_border_arguments.dart';

import '../widget/input/input_arguemnts.dart';
import '../widget/input/hint_arguemnts.dart';

import '../widget/dialog/general_arguments.dart';
import '../widget/dialog/search_tile_arguments.dart';
import '../widget/dialog/textstyle_argement.dart';
import '../widget/dialog/title_textstyle_argements.dart';
import '../widget/dialog/alphabets_bar_arguments.dart';
import '../widget/dialog/current_location_tile_arguments.dart';
import '../widget/dialog/last_pick_tile_arguments.dart';

import '../widget/about/about_screen.dart';

export '../model/screen.dart';
export '../model/onboarding.dart';

export '../widget/picker/down_icon_arguments.dart';
export '../widget/picker/flag_arguments.dart';
export '../widget/picker/dial_code_arguments.dart';
export '../widget/picker/country_name_arguments.dart';
export '../widget/input/input_border.arguments.dart';
export '../widget/picker/picker_border_arguments.dart';

export '../widget/input/input_arguemnts.dart';
export '../widget/input/hint_arguemnts.dart';

export '../widget/dialog/general_arguments.dart';
export '../widget/dialog/search_tile_arguments.dart';
export '../widget/dialog/textstyle_argement.dart';
export '../widget/dialog/title_textstyle_argements.dart';
export '../widget/dialog/alphabets_bar_arguments.dart';
export '../widget/dialog/current_location_tile_arguments.dart';
export '../widget/dialog/last_pick_tile_arguments.dart';

export '../widget/about/about_screen.dart';

const double titlesFontSize = 18;
const Color lightprimarySwatch = Colors.purple;
const Color darkprimarySwatch = Colors.green;

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
  Argument(title: "Border", child: const PickerBorderArguments()),
];

List<Argument> inputArguments = [
  Argument(title: "Input", child: const InputArguments()),
  Argument(title: "Hint", child: const HintArguments()),
  Argument(title: "Border", child: const InputBorderArguments())
];

List<Argument> dialogArguments = [
  Argument(title: "General", child: const GeneralArguments()),
  Argument(title: "Title TextStyle", child: const TitleTextStyleArguments()),
  Argument(title: "TextStyle", child: const TextStyleArguments()),
  Argument(title: "Search Tile", child: const SearchTileArguments()),
  Argument(title: "Current Location Tile", child: const CurrentLocationTileArguments()),
  Argument(title: "Last Pick Tile", child: const LastPickTileArguments()),
  Argument(title: "Alphabets Bar", child: const AlphabetsBarArguments()),
];

List<Onboarding> listOnboarding = [
  Onboarding(
      title: "Easy",
      image: "assets/onborading/onborading-1.png",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
  Onboarding(
      title: "Fast",
      image: "assets/onborading/onborading-2.png",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
  Onboarding(
      title: "Flexible",
      image: "assets/onborading/onborading-3.png",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
  Onboarding(
      title: "Open Source",
      image: "assets/onborading/onborading-4.png",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
  Onboarding(
      title: "Documentation",
      image: "assets/onborading/onborading-4.png",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
];
