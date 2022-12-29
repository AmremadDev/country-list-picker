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

  TextStyle _textStyle = const TextStyle(fontWeight: FontWeight.normal, fontSize: 16);
  TextStyle get textStyle => _textStyle.copyWith(
      color: _textStyle.color ?? (_settings.isDarkMode == true ? Colors.white : Colors.black));
  set textStyle(TextStyle value) {
    _textStyle = value;
    notifyListeners();
  }

  String _mask = "(###) #### ###";
  String get mask => _mask;
  set mask(String value) {
    _mask = value;

    notifyListeners();
  }

// ****************************************************************************************************
  String _hintString = "Enger your Phone number";
  String get ihintString => _hintString;
  set ihintString(String value) {
    _hintString = value;
    notifyListeners();
  }

  TextStyle _hintTextStyle =
     const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color:  Colors.grey);
  TextStyle get hintTextStyle =>_hintTextStyle;
  
  set hintTextStyle(TextStyle value) {
    _hintTextStyle = value;
    notifyListeners();
  }
// ****************************************************************************************************

  bool _border = false;
  bool get border => _border;
  set border(bool value) {
    _border = value;
    notifyListeners();
  }
  // ****************************************************************************************************
}
