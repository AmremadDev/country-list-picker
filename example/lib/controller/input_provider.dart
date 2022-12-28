import 'package:flutter/material.dart';
import '../controller/settings_provider.dart';

class InputProvider extends ChangeNotifier {
  SettingsProvider _settings = SettingsProvider();

  void update(SettingsProvider settings) {
    _settings = settings;
    notifyListeners();
  }

// ****************************************************************************************************
  bool _isShowTextField = true;
  bool get isShowTextField => _isShowTextField;
  set isShowTextField(bool value) {
    _isShowTextField = value;
    notifyListeners();
  }

  TextStyle _inputTextStyle = const TextStyle(fontWeight: FontWeight.normal, fontSize: 16);
  TextStyle get inputTextStyle => _inputTextStyle.copyWith(
      color: _inputTextStyle.color ?? (_settings.isDarkMode == true ? Colors.white : Colors.black));
  set inputTextStyle(TextStyle value) {
    _inputTextStyle = value;
    notifyListeners();
  }

  String _inputMask = "(###) #### ###";
  String get inputMask => _inputMask;
  set inputMask(String value) {
    _inputMask = value;

    notifyListeners();
  }

// ****************************************************************************************************
  String _inputHintString = "Enger your Phone number";
  String get inputHintString => _inputHintString;
  set inputHintString(String value) {
    _inputHintString = value;
    notifyListeners();
  }

  TextStyle _hintTextStyle =
     const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color:  Color(0xFF424242));
  TextStyle get hintTextStyle => _hintTextStyle.copyWith(
      color: _hintTextStyle.color ?? (_settings.isDarkMode == true ? const Color(0xFF424242): Colors.black));
  set hintTextStyle(TextStyle value) {
    _hintTextStyle = value;
    notifyListeners();
  }
// ****************************************************************************************************

  bool _inputBorder = false;
  bool get inputBorder => _inputBorder;
  set inputBorder(bool value) {
    _inputBorder = value;
    notifyListeners();
  }
  // ****************************************************************************************************
}
