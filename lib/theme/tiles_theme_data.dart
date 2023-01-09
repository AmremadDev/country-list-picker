import 'package:flutter/material.dart';

class TilesThemeData {
  ///Titles text style
  final TextStyle style;

  ///Titles background
  final Color? background;

  final String searchTitle;
  final String searchHint;
  final TextStyle searchHintTextStyle;

  final String lastPickTitle;
  final Icon lastPickIcon;

  final String currentLocationTileTitle;

  const TilesThemeData({
    // General
    this.style = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.background,

    // Search Tile
    this.searchTitle = "Search",
    this.searchHint = "name/dial code...",
    this.searchHintTextStyle = const TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),

    // Last Pick Tile
    this.lastPickTitle = "Last Pick",
    this.lastPickIcon = const Icon(Icons.check),

    // Current Location Tile
    this.currentLocationTileTitle = "Current Location",
  });
}
