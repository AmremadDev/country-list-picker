import 'package:flutter/material.dart';

class InputThemeData {
  final EdgeInsets contentPadding;
  final InputBorder border;
  final String? hintText;
  final TextStyle hintStyle;
  final TextStyle style;
  final String obscuringCharacter;
  final bool obscureText;
  final String? mask;

  const InputThemeData({
    this.contentPadding = const EdgeInsets.only(left: 12),
    this.border = InputBorder.none,
    this.hintStyle = const TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),
    this.hintText = "Enter your phone number",
    this.style = const TextStyle(fontSize: 16),
    this.mask = "### #### ###",
    this.obscuringCharacter = '•',
    this.obscureText = false,
  });
}
