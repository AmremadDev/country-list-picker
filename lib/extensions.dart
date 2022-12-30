import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

extension StringExtensions on String {
  String get getUnmaskedText => MaskTextInputFormatter(
      mask: "### #### ###4", initialText: this, filter: {"#": RegExp(r'[0-9]')}).getUnmaskedText();
}
