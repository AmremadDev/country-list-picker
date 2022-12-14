import 'package:flutter/material.dart';

import './country.dart';

// import '../support/countries_codes_en.dart';
// import './country.dart';

class CSettings extends ChangeNotifier {
  int posSelected = -1;
  bool floatbutton = false;
  List<Country> countries = [];

  CSettings(List<Country> list) {
    countries = list;
  }

  void changeSelectedPosition(int index) {
    if (posSelected != index) {
      posSelected = index;
      notifyListeners();
    }
  }

  void changeIsShowFloatButton(bool value) {
    if (floatbutton != value) {
      floatbutton = value;
      notifyListeners();
    }
  }

  void changeCountries(List<Country> list) {
    countries = list;
    notifyListeners();
  }
}
