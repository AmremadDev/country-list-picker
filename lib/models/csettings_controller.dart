import 'package:flutter/material.dart';
import 'package:getworld/getworld.dart';

// import '../support/countries_codes_en.dart';
// import './country.dart';

class CSettings extends ChangeNotifier {
  int posSelected = -1;
  bool floatbutton = false;
  List<Country> countries = Countries;

  CSettings() {
    // countries = countriesEnglish
    //     .map((s) => Country(
    //           englishName: s['english_name'],
    //           code: s['code'],
    //           dialCode: s['dial_code'],
    //           length: s['length'],
    //           flagUri: 'assets/flags/${s['code'].toLowerCase()}.png',
    //         ))
    //     .toList();


   

    // print("CSettings Constructor");
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
