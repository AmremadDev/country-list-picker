import 'package:flutter/material.dart';

class AlphabetsBarThemes {
  final bool visible;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;

  const AlphabetsBarThemes({
    this.visible = true,
    this.backgroundColor = Colors.transparent,
    this.selectedBackgroundColor = Colors.transparent,
    this.textStyle = const TextStyle(fontSize: 12),
    this.selectedTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  });
}
