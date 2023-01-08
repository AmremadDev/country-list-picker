import 'package:flutter/material.dart';
import '../model/country.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider({required List<Country> elements}) {
    _countries = elements;
  }
  List<Country> _countries = [];
  List<Country> get countries => _countries;
  set countries(List<Country> value) {
    _countries = value;
    notifyListeners();
  }

  int _selectedPositon = -1;
  int get selectedPosition => _selectedPositon;
  set selectedPosition(int value) {
    _selectedPositon = value;
    notifyListeners();
  }

  bool _isShowFloatButton = false;
  bool get isShowFloatButton => _isShowFloatButton;
  set isShowFloatButton(bool value) {
    _isShowFloatButton = value;
    notifyListeners();
  }

  bool _inputOnFocus = false;
  bool get inputOnFocus => _inputOnFocus;
  set inputOnFocus(bool value) {
    _inputOnFocus = value;
    notifyListeners();
  }
}
