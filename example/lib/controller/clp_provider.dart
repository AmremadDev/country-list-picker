import 'package:flutter/material.dart';

class CLPProvider extends ChangeNotifier {
  BuildContext context;
  CLPProvider({required this.context});

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  bool _isShowFlag = true;
  bool get isShowFlag => _isShowFlag;
  set isShowFlag(bool value) {
    _isShowFlag = value;
    if (_isShowCode == false && value == false) isShowCode = true;
    notifyListeners();
  }

  bool _isShowTitle = true;
  bool get isShowTitle => _isShowTitle;
  set isShowTitle(bool value) {
    _isShowTitle = value;
    notifyListeners();
  }

  bool _isShowCode = true;
  bool get isShowCode => _isShowCode;
  set isShowCode(bool value) {
    _isShowCode = value;
    if (_isShowFlag == false && value == false) isShowFlag = true;
    notifyListeners();
  }

  bool _isDownIcon = true;
  bool get isDownIcon => _isDownIcon;
  set isDownIcon(bool value) {
    _isDownIcon = value;
    notifyListeners();
  }

  bool _isShowTextField = true;
  bool get isShowTextField => _isShowTextField;
  set isShowTextField(bool value) {
    _isShowTextField = value;
    notifyListeners();
  }

  bool _borderBorder = true;
  bool get pickerBorder => _borderBorder;
  set pickerBorder(bool value) {
    if (_inputBorder == true && value == true) _inputBorder = false;
    _borderBorder = value;
    notifyListeners();
  }

  bool _inputBorder = false;
  bool get inputBorder => _inputBorder;
  set inputBorder(bool value) {
    if (_borderBorder == true && value == true) _borderBorder = false;
    _inputBorder = value;
    notifyListeners();
  }

  // Color _pickerTextColor = Colors.black;
  // Color get pickerTextColor => _pickerTextColor;
  // set pickerTextColor(Color value) {
  //   _pickerTextColor = value;
  //   notifyListeners();
  // }

  Color? _pickerTextColor;
  Color get pickerTextColor =>
      _pickerTextColor ?? (isDarkMode == true ? Colors.white : Colors.black);
  set pickerTextColor(Color value) {
    _pickerTextColor = value;
    notifyListeners();
  }

  Color? _inputTextColor;
  Color get inputTextColor => _inputTextColor ?? (isDarkMode == true ? Colors.white : Colors.black);
  set inputTextColor(Color value) {
    _inputTextColor = value;
    notifyListeners();
  }

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

  double _pickerDialCodeFontSize = 16;
  double get pickerDialCodeFontSize => _pickerDialCodeFontSize;
  set pickerDialCodeFontSize(double value) {
    _pickerDialCodeFontSize = value;
    notifyListeners();
  }

  bool _pickerDialCodeFontBold = true;
  bool get pickerDialCodeFontBold => _pickerDialCodeFontBold;
  set pickerDialCodeFontBold(bool value) {
    _pickerDialCodeFontBold = value;
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
