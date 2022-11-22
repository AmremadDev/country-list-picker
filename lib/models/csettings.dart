import 'package:flutter/material.dart';
import '../support/countries_codes_en.dart';
import './country.dart';

class CSettings extends ChangeNotifier {
  int posSelected = -1;
  bool floatbutton = false;
  List<Country> countries =countriesEnglish
        .map((s) => Country(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              length: s['length'],
              flagUri: 'flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

  void changeSelectedPosition(int index) {
    posSelected = index;
    notifyListeners();
  }

  void changeIsShowFloatButton(bool value) {
    floatbutton = value;

    notifyListeners();
  }
  void changeCountries(List<Country> list) {
    list.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
    countries = list;
    notifyListeners();

  }
  
}
