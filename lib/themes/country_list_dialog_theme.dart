import 'package:flutter/material.dart';

import './current_location_tile_theme.dart';
import './alphabets_bar_themes.dart';
import './last_pick_tile_theme.dart';
import './search_tile_theme.dart';

export './current_location_tile_theme.dart';
export './alphabets_bar_themes.dart';
export './last_pick_tile_theme.dart';
export './search_tile_theme.dart';

class CountryListDialogTheme {
  ///An app bar to display at the top of country list dialog.
  final PreferredSizeWidget? appBar;

  ///if true float button will be appear.
  final bool isShowFloatButton;

  ///if true country dial code will be appear.
  final bool isShowDialCode;

  ///if true country flag will be appear.
  final bool isShowFlage;

  ///Titles text style
  final TextStyle titlesStyle;

  ///Titles background
  final Color titlesBackground;

  ///Country dialog background color.
  final Color backgroundColor;

  ///Country text style.
  final TextStyle textStyle;

  ///Height of the tile.
  ///[tileheight] must be greater than 50.0
  final double tileHeight;

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
  final AlphabetsBarThemes alphabetsBar;

  ///Current Location Tile Theme.
  ///
  ///Example:
  ///```dart
  /// dialogTheme: const CountryListDialogTheme(
  ///   currentLocationTile: CurrentLocationTileTheme(
  ///     visible: true,
  ///     title: "Current Location",
  ///   ),
  /// )
  ///```
  ///or to hide Current Location Tile
  ///```dart
  /// dialogTheme: const CountryListDialogTheme(
  ///   currentLocationTile: CurrentLocationTileTheme(visible: false),)
  ///```
  final CurrentLocationTileTheme currentLocationTile;

  ///LastPick Tile Theme.
  ///
  ///Example:
  ///```dart
  /// dialogTheme: const CountryListDialogTheme(
  ///   lastPickTile: LastPickTileTheme(
  ///     title: "Last Pick",
  ///     icon: Icon(Icons.check_circle_outline_outlined),
  ///   ),
  /// )
  ///```
  ///or to hide LastPick Tile
  ///```dart
  /// dialogTheme: const CountryListDialogTheme(
  ///   lastPickTile: LastPickTileTheme(visible: false),
  /// )
  ///```
  final LastPickTileTheme lastPickTile;

  ///Search Tile Theme.
  ///
  ///Example:
  ///```dart
  /// dialogTheme: const CountryListDialogTheme(
  ///   searchTile: SearchTileTheme(
  ///     visible: true,
  ///     title: "Search",
  ///     hint: "type code/name",
  ///   ),
  /// )
  ///```
  ///Or to hide Search Tile
  ///```dart
  /// dialogTheme: const CountryListDialogTheme(
  ///   searchTile: SearchTileTheme(visible: false),
  /// )
  ///```
  final SearchTileTheme searchTile;

  ///Whether to allow the widget to set a custom UI overlay
  final bool useUiOverlay;

  ///Whether the country list picker should be wrapped in a SafeArea
  final bool useSafeArea;

  const CountryListDialogTheme({
    this.alphabetsBar = const AlphabetsBarThemes(),
    this.currentLocationTile = const CurrentLocationTileTheme(),
    this.lastPickTile = const LastPickTileTheme(),
    this.searchTile = const SearchTileTheme(),
    this.appBar,
    this.isShowFlage = true,
    this.isShowFloatButton = true,
    this.backgroundColor = Colors.transparent,
    this.titlesStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.titlesBackground = const Color(0x6CDDDDDD),
    this.isShowDialCode = true,
    this.textStyle = const TextStyle(fontSize: 16),
    this.tileHeight = 50.0,
    this.useUiOverlay = false,
    this.useSafeArea = false,
  }) : assert(tileHeight >= 50.0, "tileheight must be greater than 50.0");
}
