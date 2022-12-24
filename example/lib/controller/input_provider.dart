import 'package:flutter/material.dart';
import '../controller/settings_provider.dart';

class InputProvider extends ChangeNotifier {
  SettingsProvider _settings = SettingsProvider();

  void update(SettingsProvider settings) {
    _settings = settings;
    notifyListeners();
  }

  bool _isShowTextField = true;
  bool get isShowTextField => _isShowTextField;
  set isShowTextField(bool value) {
    _isShowTextField = value;
    notifyListeners();
  }

  bool _inputBorder = false;
  bool get inputBorder => _inputBorder;
  set inputBorder(bool value) {
    _inputBorder = value;
    notifyListeners();
  }

  Color? _inputTextColor;
  Color get inputTextColor =>
      _inputTextColor ?? (_settings.isDarkMode == true ? Colors.white : Colors.black);
  set inputTextColor(Color value) {
    _inputTextColor = value;
    notifyListeners();
  }

  double _inputFontSize = 16;
  double get inputFontSize => _inputFontSize;
  set inputFontSize(double value) {
    _inputFontSize = value;
    notifyListeners();
  }

  bool _inputFontBold = false;
  bool get inputFontBold => _inputFontBold;
  set inputFontBold(bool value) {
    _inputFontBold = value;
    notifyListeners();
  }

  String _inputMask = "(###) #### ###";
  String get inputMask => _inputMask;
  set inputMask(String value) {
    _inputMask = value;

    notifyListeners();
  }

  String _inputHintString = "Enger your Phone number";
  String get inputHintString => _inputHintString;
  set inputHintString(String value) {
    _inputHintString = value;
    notifyListeners();
  }
}
