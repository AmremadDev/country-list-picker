import 'package:flutter/widgets.dart';
import 'settings_provider.dart';

class DialogProvider extends ChangeNotifier {
  SettingsProvider _settings = SettingsProvider();

  SettingsProvider get settings => _settings;
  set settings(SettingsProvider value) {
    _settings = value;
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
}
