import 'package:flutter/material.dart';
import 'settings_provider.dart';

class DialogProvider extends ChangeNotifier {
  SettingsProvider _settings = SettingsProvider();

  void update(SettingsProvider settings) {
    _settings = settings;
    notifyListeners();
  }

  // ****************************************************************************************************
  String _dialogAppBarTitle = "Select your country";
  String get dialogAppBarTitle => _dialogAppBarTitle;
  set dialogAppBarTitle(String value) {
    _dialogAppBarTitle = value;
    notifyListeners();
  }

  Color? _backgroundColor; // =  const Colors.red;
  Color get backgroundColor =>
      _backgroundColor ?? (_settings.isDarkMode == true ? const Color(0xff2196f3) : Colors.white);
  set backgroundColor(Color value) {
    _backgroundColor = value;
    notifyListeners();
  }

  // ****************************************************************************************************
  bool _searchTile = true;
  bool get searchTile => _searchTile;
  set searchTile(bool value) {
    _searchTile = value;
    notifyListeners();
  }

  bool _currentLocationTile = true;
  bool get currentLocationTile => _currentLocationTile;
  set currentLocationTile(bool value) {
    _currentLocationTile = value;
    notifyListeners();
  }

  bool _lastPicktile = true;
  bool get lastPicktile => _lastPicktile;
  set lastPicktile(bool value) {
    _lastPicktile = value;
    notifyListeners();
  }

  bool _alphabetBar = true;
  bool get alphabetBar => _alphabetBar;
  set alphabetBar(bool value) {
    _alphabetBar = value;
    notifyListeners();
  }

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
}
