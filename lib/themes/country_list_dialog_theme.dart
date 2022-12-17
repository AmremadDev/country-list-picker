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
  final PreferredSizeWidget? appBar;
  final bool isShowFloatButton;
  final bool isShowDialCode;
  final bool isShowFlage;

  final TextStyle titlesStyle;
  final Color titlesBackground;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double tileHeight;

  final AlphabetsBarThemes alphabetsBar;
  final CurrentLocationTileTheme currentLocationTile;
  final LastPickTileTheme lastPickTile;
  final SearchTileTheme searchTile;

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
  });
}
