import 'package:flutter/cupertino.dart';

class SearchTileThemeData {
  final bool visible;
  final String title;
  final String hint;
  final TextStyle hintTextStyle;
  const SearchTileThemeData({
    this.visible = true,
    this.title = "Search",
    this.hint = "name/dial code...",
    this.hintTextStyle =const TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),
  });
}
