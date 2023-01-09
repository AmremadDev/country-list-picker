import 'tiles_theme_data.dart';
import 'package:flutter/material.dart';

import './alphabets_bar_themes.dart';
export './tiles_theme_data.dart';
export './alphabets_bar_themes.dart';

class CountryListDialogTheme {
  ///An app bar to display at the top of country list dialog.
  final PreferredSizeWidget? appBar;

  ///if true float button will be appear.
  final bool isShowFloatButton;

  ///if true country dial code will be appear.
  final bool isShowDialCode;

  ///if true country flag will be appear.
  final bool isShowFlage;


  final bool isShowSearchTile;
  
  final bool isShowLastPickTile;

  ///Country dialog background color.
  final Color? backgroundColor;

  ///Country text style.
  final TextStyle textStyle;

  ///Height of the tile.
  ///[tileheight] must be greater than 50.0
  final double tileHeight;

  final TilesThemeData tilesTheme;

  ///Alphabets bar Theme.
  ///
  ///Example:
  ///```dart
  /// dialogTheme: const CountryListDialogTheme(
  ///   alphabetsBar: AlphabetsBarThemes(
  ///     backgroundColor: Colors.transparent,
  ///     textStyle: TextStyle(color: Colors.black),
  ///     selectedBackgroundColor: Colors.redAccent,
  ///     selectedTextStyle: TextStyle(color: Colors.white),
  ///   ),
  /// )
  ///```
  ///or to hide Alphabets bar
  ///```dart
  /// dialogTheme: const CountryListDialogTheme(
  ///   alphabetsBar: AlphabetsBarThemes(visible: false),)
  ///```
  final AlphabetsBarThemeData alphabetsBarTheme;

  const CountryListDialogTheme({
    this.tilesTheme = const TilesThemeData(),
    this.alphabetsBarTheme = const AlphabetsBarThemeData(),
    this.isShowLastPickTile = true,
    this.isShowSearchTile = true,
    this.appBar,
    this.isShowFlage = true,
    this.isShowFloatButton = true,
    this.backgroundColor,

    this.isShowDialCode = true,
    this.textStyle = const TextStyle(fontSize: 16),
    this.tileHeight = 50.0,
  }) : assert(tileHeight >= 50.0, "tileheight must be greater than 50.0");
}
