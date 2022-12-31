import 'package:flutter/material.dart';
import '../model/countries.dart';
import '../model/country.dart';
import '../support/countries_codes.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider() {
    _initialCountry = Countries.Egypt;
    countries = countriesList
        .map((s) => Country(
              alpha2: s['iso_3166_1_alpha2'],
              alpha3: s['iso_3166_1_alpha3'],
              englishName:
                  Name(common: s['englishName']['common'], official: s['englishName']['official']),
              nativeName:
                  Name(common: s['nativeName']['common'], official: s['nativeName']['official']),
              callingCode: s['callingCode'],
              numberlength: s['numberlength'],
              flagUri: 'assets/flags/${s['iso_3166_1_alpha2'].toLowerCase()}.png',
            ))
        .toList();

    countries.sort((a, b) => a.englishName.common.compareTo(b.englishName.common));

    selectedCountry = countries.firstWhere(
        (Country e) => (e.alpha3.toUpperCase() == initialCountry.alpha3.toUpperCase()),
        orElse: () => countries[0]);
  }

  late Country _selectedCountry;
  Country get selectedCountry => _selectedCountry;
  set selectedCountry(Country value) {
    _selectedCountry = value;
    notifyListeners();
  }

  late Countries _initialCountry;
  Countries get initialCountry => _initialCountry;

  List<Country> _countries = [];
  List<Country> get countries => _countries;
  set countries(List<Country> value) {
    _countries = value;
    notifyListeners();
  }

  int _selectedPositon = -1;
  int get selectedPositon => _selectedPositon;
  set selectedPositon(int value) {
    _selectedPositon = value;
    notifyListeners();
  }

  bool _isShowFloatButton = true;
  bool get isShowFloatButton => _isShowFloatButton;
  set isShowFloatButton(bool value) {
    _isShowFloatButton = value;
    notifyListeners();
  }
}
