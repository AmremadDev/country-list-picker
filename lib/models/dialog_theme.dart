import 'package:flutter/material.dart';
import 'package:xcountry/country_list_picker.dart';

class CDialogTheme {
  final PreferredSizeWidget? appBar;
  final bool isShowFloatButton;
  final bool isShowDialCode;
  final bool isShowFlage;

  final TextStyle titlesStyle;
  final Color titlesBackground;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double rowHeight;

 final AlphabetsBar alphabetsBar;
final CurrentLocationTile currentLocationTile;
final LastPickTile lastPickTile;
final SearchTile searchTile;
  //  = AlphabetsBar(
  //     visible: true,
  //     backgroundColor: Colors.transparent,
  //     selectedBackgroundColor: Colors.transparent,
  //     textStyle: const TextStyle(fontSize: 12),
  //     selectedTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   );

  // // Search Area Area
  // final bool isShowSearch;
  // final String searchText;
  // final String searchHintText;

  // // Current Location Area
  // final bool isShowCurrentLocation;
  // final String currentLocationText;

  // //Last Picked Country Area
  // final bool isShowLastPickCountry;
  // final String lastPickText;
  // final Icon lastPickIcon;

  // // alphabet Area
  // final Color alphabetBackgroundColor;
  // final Color alphabetSelectedBackgroundColor;
  // final TextStyle alphabetTextStyle;
  // final TextStyle alphabetSelectedTextStyle;
  // final bool isShowAphabetScroll;

  // final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
  const CDialogTheme({
    this.alphabetsBar = const AlphabetsBar(),
    this.currentLocationTile = const CurrentLocationTile(),
    this.lastPickTile = const LastPickTile(),
    this.searchTile = const SearchTile(),

    this.appBar,
    this.isShowFlage = true,
    this.isShowFloatButton = true,
    // this.isShowAphabetScroll = true,
    this.backgroundColor = Colors.transparent,
    // this.currentLocationText = "Current Location",
    this.titlesStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.titlesBackground = const Color(0xfff4f4f4),
    this.isShowDialCode = true,
    // this.isShowSearch = true,
    // this.searchText = "Search",
    // this.searchHintText = "name/dial code...",
    // this.isShowCurrentLocation = true,
    // this.isShowLastPickCountry = true,
    // this.lastPickText = "Last Pick",
    // this.alphabetBackgroundColor = Colors.transparent,
    // this.alphabetSelectedBackgroundColor = Colors.transparent,
    // this.alphabetTextStyle = const TextStyle(fontSize: 12),
    // this.alphabetSelectedTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    // this.lastPickIcon = const Icon(Icons.check),
    this.textStyle = const TextStyle(fontSize: 16),
    this.rowHeight = 50.0,
  }) ;
  // {
  //   alphabetsBar  = AlphabetsBar(
  //     visible: true,
  //     backgroundColor: Colors.transparent,
  //     selectedBackgroundColor: Colors.transparent,
  //     textStyle: const TextStyle(fontSize: 12),
  //     selectedTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   );
  // }
}

class AlphabetsBar {
  final bool visible;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;

  const AlphabetsBar({
    this.visible = true,
    this.backgroundColor = Colors.transparent,
    this.selectedBackgroundColor = Colors.transparent,
    this.textStyle = const TextStyle(fontSize: 12),
    this.selectedTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  });
}

class CurrentLocationTile {
  final bool visible;
  final String title;
 const CurrentLocationTile({
    this.visible = true,
    this.title = "Current Location",
  });
}

class LastPickTile {
  final bool visible;
  final String title;
  final Icon icon;
 const LastPickTile({
    this.visible = true,
    this.title = "Last Pick",
    this.icon = const Icon(Icons.check),
  });
}

class SearchTile {
  final bool visible;
  final String title;
  final String hint;
 const  SearchTile({
    this.visible = true,
    this.title = "Search",
    this.hint = "name/dial code...",
  });
}
