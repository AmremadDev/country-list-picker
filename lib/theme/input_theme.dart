import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputThemeData {
  final EdgeInsets contentPadding;
  final InputBorder border;
  final String? hintText;
  final TextStyle hintStyle;
  final TextStyle style;
  final String obscuringCharacter;
  final bool obscureText;
  // final int? maxLength;

  ///
  ///Defualt value
  ///
  ///```dart
  /// mask: MaskTextInputFormatter(mask: "### #### ###", filter: {"#": RegExp(r'[0-9]')})
  ///```
  final MaskTextInputFormatter? mask;

  const InputThemeData({
    this.contentPadding = const EdgeInsets.only(left: 12),
    this.border = InputBorder.none,
    this.hintStyle = const TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),
    this.hintText = "Enter your phone number",
    this.style = const TextStyle(fontSize: 16),
    // this.maxLength = 15,

    this.mask,
    this.obscuringCharacter = '•',
    this.obscureText = false,
  });
}
