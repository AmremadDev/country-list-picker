import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputTheme {
  final EdgeInsets contentPadding;
  final InputBorder? border;
  final String? hintText;
  final TextStyle hintStyle;
  final TextStyle style;
  // final int? maxLength;

  final MaskTextInputFormatter? mask;

  const InputTheme({
    this.contentPadding = const EdgeInsets.only(left: 12),
    this.border = InputBorder.none,
    this.hintStyle = const TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),
    this.hintText = "Enter you number",
    this.style = const TextStyle(fontSize: 16),
    // this.maxLength = 15,

    ///
    ///Defualt value
    ///
    ///MaskTextInputFormatter(mask: "### #### ###", filter: {"#": RegExp(r'[0-9]')})
    this.mask,
  });
}
