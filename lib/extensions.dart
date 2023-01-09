
import './widget/mask_text_input_formtter.dart';

extension StringExtensions on String {
  String get getUnmaskedText => MaskTextInputFormatter(
      mask: "### #### ###4", initialText: this, filter: {"#": RegExp(r'[0-9]')}).getUnmaskedText();
}
