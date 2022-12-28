import 'package:flutter/material.dart';
import '../controller/settings_provider.dart';

class DialogProvider extends ChangeNotifier {
  SettingsProvider _settings = SettingsProvider();

  void update(SettingsProvider settings) {
    _settings = settings;
    notifyListeners();
  }

  // ****************************************************************************************************
  bool _countryFlag = true;
  bool get countryFlag => _countryFlag;
  set countryFlag(bool value) {
    _countryFlag = value;
    notifyListeners();
  }

  bool _countryDialCode = true;
  bool get countryDialCode => _countryDialCode;
  set countryDialCode(bool value) {
    _countryDialCode = value;
    notifyListeners();
  }

  bool _upActionbutton = true;
  bool get upActionbutton => _upActionbutton;
  set upActionbutton(bool value) {
    _upActionbutton = value;
    notifyListeners();
  }

  String _dialogAppBarTitle = "Select your country";
  String get dialogAppBarTitle => _dialogAppBarTitle;
  set dialogAppBarTitle(String value) {
    _dialogAppBarTitle = value;
    notifyListeners();
  }

  Color? _backgroundColor; // =  const Colors.red;
  Color get backgroundColor =>
      _backgroundColor ?? (_settings.isDarkMode == true ?   const Color(0xFF424242) : Colors.white);
  set backgroundColor(Color value) {
    _backgroundColor = value;
    notifyListeners();
  }

  Color? _titlesBackgroundColor; // =  const Colors.red;
  Color get titlesBackgroundColor =>
      _titlesBackgroundColor ?? (_settings.isDarkMode == true ?  const Color(0xFF313030) : const Color(0xFFE9E9E9));
  set titlesBackgroundColor(Color value) {
    _titlesBackgroundColor = value;
    notifyListeners();
  }

  TextStyle _textStyle = const TextStyle(fontWeight: FontWeight.normal, fontSize: 16);
  TextStyle get textStyle =>
      _textStyle.copyWith(color: _textStyle.color ?? (_settings.isDarkMode == true ? Colors.white : Colors.black));
  set textStyle(TextStyle value) {
    _textStyle = value;
    notifyListeners();
  }

  TextStyle _titleTextStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  TextStyle get titleTextStyle => _titleTextStyle.copyWith(
      color: _titleTextStyle.color ?? (_settings.isDarkMode == true ? Colors.white : Colors.black));
  set titleTextStyle(TextStyle value) {
    _titleTextStyle = value;
    notifyListeners();
  }

  // ****************************************************************************************************
  bool _searchTile = true;
  bool get searchTile => _searchTile;
  set searchTile(bool value) {
    _searchTile = value;
    notifyListeners();
  }

  String _hintString = "Enger your Phone number";
  String get hintString => _hintString;
  set hintString(String value) {
    _hintString = value;
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
  bool _currentLocationTile = true;
  bool get currentLocationTile => _currentLocationTile;
  set currentLocationTile(bool value) {
    _currentLocationTile = value;
    notifyListeners();
  }

  // ****************************************************************************************************
  bool _lastPicktile = true;
  bool get lastPicktile => _lastPicktile;
  set lastPicktile(bool value) {
    _lastPicktile = value;
    notifyListeners();
  }

  // ****************************************************************************************************
  bool _alphabetBar = true;
  bool get alphabetBar => _alphabetBar;
  set alphabetBar(bool value) {
    _alphabetBar = value;
    notifyListeners();
  }
}
