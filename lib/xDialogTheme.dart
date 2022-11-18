import 'package:flutter/material.dart';

class XDialogTheme {

  final bool isShowCode;
  
  // Search Area Area
  final bool isShowSearch;
  final String? searchText;
  final String? searchHintText;

  // Current Location Area
  final bool isShowCurrentLocation;

  //Last Picked Country Area
  final bool isShowLastPickCountry;
  final String? lastPickText;
  final Icon? checkIcon;

  // alphabet Area
  final TextStyle? alphabetBackgroundColor;
  final TextStyle? alphabetTextStyle;
  final TextStyle? alphabetSelectedBackgroundColor;
  final TextStyle? alphabetSelectedTextStyle;

  XDialogTheme({
    this.isShowCode = true,
    this.isShowSearch = true,
    this.searchText,
    this.searchHintText,
    this.isShowCurrentLocation = true,
    this.isShowLastPickCountry = false,
    this.lastPickText,
    this.alphabetBackgroundColor,
    this.alphabetSelectedBackgroundColor,
    this.alphabetTextStyle,
    this.alphabetSelectedTextStyle,
    this.checkIcon = const Icon(Icons.check, color: Colors.green),
  });
}
