import 'package:flutter/material.dart';

class CDialogTheme {
  final bool isShowCode;
  final TextStyle titlesStyle;
  final Color titlesBackground;
  final Color backgroundColor;
  // Search Area Area
  final bool isShowSearch;
  final String searchText;
  final String searchHintText;

  // Current Location Area
  final bool isShowCurrentLocation;
  final String currentLocationText;

  //Last Picked Country Area
  final bool isShowLastPickCountry;
  final String lastPickText;
  final Icon checkIcon;

  // alphabet Area
  final Color alphabetBackgroundColor;
  final TextStyle alphabetTextStyle;
  final Color alphabetSelectedBackgroundColor;
  final TextStyle alphabetSelectedTextStyle;
  final bool isShowAphabetScroll ;

  const CDialogTheme({
    this.isShowAphabetScroll = true,
    this.backgroundColor =  Colors.white,
    this.currentLocationText = "Current Location",
    this.titlesStyle =  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.titlesBackground = const Color(0xfff4f4f4),
    this.isShowCode = true,
    this.isShowSearch = true,
    this.searchText = "Search",
    this.searchHintText = "Search...",
    this.isShowCurrentLocation = true,
    this.isShowLastPickCountry = true,
    this.lastPickText = "Last Pick",
    this.alphabetBackgroundColor = Colors.transparent,
    this.alphabetSelectedBackgroundColor = Colors.transparent,
    this.alphabetTextStyle = const TextStyle(fontSize: 12,  fontWeight: FontWeight.w400, color: Colors.black),
    this.alphabetSelectedTextStyle = const TextStyle(fontSize: 18,  fontWeight: FontWeight.bold, color: Colors.blue),
    this.checkIcon = const Icon(Icons.check, color: Colors.green),
  });
}
