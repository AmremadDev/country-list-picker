import 'package:flutter/material.dart';
import '../controller/settings_provider.dart';
import '../app_data.dart';

class DialogProvider extends ChangeNotifier {
  SettingsProvider _settings = SettingsProvider();

  void update(SettingsProvider settings) {
    _settings = settings;
    notifyListeners();
  }

  // ****************************************************************************************************
  String _appBarTitle = "Select your country";
  String get appBarTitle => _appBarTitle;
  set appBarTitle(String value) {
    _appBarTitle = value;
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

  double _tileHeight = 50;
  double get tileHeight => _tileHeight;
  set tileHeight(double value) {
    _tileHeight = value;
    notifyListeners();
  }

  Color? _backgroundColor; // =  const Colors.red;
  Color get backgroundColor =>
      _backgroundColor ?? (_settings.isDarkMode == true ? const Color(0xFF424242) : Colors.white);
  set backgroundColor(Color value) {
    _backgroundColor = value;
    notifyListeners();
  }

  Color? _titlesBackgroundColor; // =  const Colors.red;
  Color get titlesBackgroundColor =>
      _titlesBackgroundColor ?? (_settings.isDarkMode == true ? const Color(0xFF313030) : const Color(0xFFE9E9E9));
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

  String _searchTileTitle = "Search";
  String get searchTileTitle => _searchTileTitle;
  set searchTileTitle(String value) {
    _searchTileTitle = value;
    notifyListeners();
  }

  String _searchTileHintString = "Search by name/dial code";
  String get searchTileHintString => _searchTileHintString;
  set searchTileHintString(String value) {
    _searchTileHintString = value;
    notifyListeners();
  }

  TextStyle _searchTileHintTextStyle = const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.grey);
  TextStyle get searchTileHintTextStyle => _searchTileHintTextStyle;
  set searchTileHintTextStyle(TextStyle value) {
    _searchTileHintTextStyle = value;
    notifyListeners();
  }

  // ****************************************************************************************************
  bool _currentLocationTile = true;
  bool get currentLocationTile => _currentLocationTile;
  set currentLocationTile(bool value) {
    _currentLocationTile = value;
    notifyListeners();
  }

  String _currentLocationTileTitle = "Current Location";
  String get currentLocationTileTitle => _currentLocationTileTitle;
  set currentLocationTileTitle(String value) {
    _currentLocationTileTitle = value;
    notifyListeners();
  }

  // ****************************************************************************************************
  bool _lastPickTile = true;
  bool get lastPickTile => _lastPickTile;
  set lastPickTile(bool value) {
    _lastPickTile = value;
    notifyListeners();
  }

  String _lastPickTileTitle = "Last Pick";
  String get lastPickTileTitle => _lastPickTileTitle;
  set lastPickTileTitle(String value) {
    _lastPickTileTitle = value;
    notifyListeners();
  }

  // ****************************************************************************************************
  bool _alphabetBar = true;
  bool get alphabetBar => _alphabetBar;
  set alphabetBar(bool value) {
    _alphabetBar = value;
    notifyListeners();
  }

  Color? _alphabetUnSelectedBackgroundColor; // =  const Colors.red;
  Color get alphabetUnSelectedBackgroundColor =>
      _alphabetUnSelectedBackgroundColor ?? (_settings.isDarkMode == true ? const Color(0xFF424242) : Colors.white);
  set alphabetUnSelectedBackgroundColor(Color value) {
    _alphabetUnSelectedBackgroundColor = value;
    notifyListeners();
  }

  Color? _alphabetSelectedBackgroundColor; // =  const Colors.red;
  Color get alphabetSelectedBackgroundColor =>
      _alphabetSelectedBackgroundColor ?? (_settings.isDarkMode == true ? const Color(0xFF424242) : Colors.white);
  set alphabetSelectedBackgroundColor(Color value) {
    _alphabetSelectedBackgroundColor = value;
    notifyListeners();
  }

  TextStyle _alphabetSelectedTextStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: lightprimarySwatch);
  TextStyle get alphabetSelectedTextStyle => _alphabetSelectedTextStyle.copyWith(
      color:
          _alphabetSelectedTextStyle.color ?? (_settings.isDarkMode == true ? darkprimarySwatch : lightprimarySwatch));
  set alphabetSelectedTextStyle(TextStyle value) {
    _alphabetSelectedTextStyle = value;
    notifyListeners();
  }

  TextStyle _alphabetUnSelectedTextStyle =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black);
  TextStyle get alphabetUnSelectedTextStyle => _alphabetUnSelectedTextStyle.copyWith(
      color: _alphabetUnSelectedTextStyle.color ?? (_settings.isDarkMode == true ? Colors.white : Colors.black));
  set alphabetUnSelectedTextStyle(TextStyle value) {
    _alphabetUnSelectedTextStyle = value;
    notifyListeners();
  }
}