import 'package:flutter/material.dart';

class AlphabetsBarThemeData {
  /// Background of unselected alphabet.
  final Color backgroundColor;

  /// Background of selected alphabet.
  final Color selectedBackgroundColor;

  /// Text style of unselected alphabet.
  final TextStyle textStyle;

  /// Text style of selected alphabet.
  final TextStyle selectedTextStyle;

  const AlphabetsBarThemeData({
    this.backgroundColor = Colors.transparent,
    this.selectedBackgroundColor = Colors.transparent,
    this.textStyle = const TextStyle(fontSize: 12),
    this.selectedTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  });
}
