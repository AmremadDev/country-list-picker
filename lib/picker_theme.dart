import 'package:flutter/material.dart';

class XPickerTheme {
  // General Settings for Picked Dialog
  // Search Area
  final bool isShowSearch;
  final String? searchText;
  final String? searchHintText;

  // Current Location
  final bool isShowCurrentLocation;

  //Last Picked Country
  final bool isShowLastPickCountry;
  final String? lastPickText;

  // alphabet Area
  final Color? alphabetSelectedBackgroundColor;
  final Color? alphabetTextColor;
  final Color? alphabetSelectedTextColor;

  final String? initialSelection;
  final bool? showEnglishName;
  final Color? labelColor;

  // XCountry Picker Themes
  final bool? isShowFlag;
  final bool? isShowTitle;
  final bool? isShowCode;
  final bool? isDownIcon;

  final TextStyle? codeTextStyle;
  final TextStyle? numberTextStyle;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Border? border;

  // XSelectionList Themes
  XPickerTheme({
    this.isShowSearch = true,
    this.isShowCurrentLocation = true,
    this.isShowLastPickCountry = false,
    this.labelColor,
    this.searchText,
    this.searchHintText,
    this.lastPickText,
    this.alphabetSelectedBackgroundColor,
    this.alphabetTextColor,
    this.alphabetSelectedTextColor,
    this.isShowTitle,
    this.isShowFlag,
    this.isShowCode,
    this.isDownIcon,
    this.initialSelection,
    this.showEnglishName,
    this.codeTextStyle,
    this.padding,
    this.numberTextStyle,
    this.color,
    this.border,
  });
}
