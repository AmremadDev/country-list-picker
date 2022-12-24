import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier {
  int _selectedScreen = 0;
  int get selectedScreen => _selectedScreen;
  set selectedScreen(int value) {
    _selectedScreen = value;
    notifyListeners();
  }

  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
