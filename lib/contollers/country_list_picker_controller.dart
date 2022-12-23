import 'package:flutter/material.dart';
import '../models/countries.dart';
import '../models/country.dart';
import '../support/countries_codes.dart';

class CLPProvider extends ChangeNotifier {
  int posSelected = -1;
  bool floatbutton = false;
  late Country selectedItem;
  List<Country> countries = [];

  final Countries initialCountry;

  CLPProvider({this.initialCountry = Countries.Egypt}) {
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

    selectedItem = countries.firstWhere(
        (Country e) => (e.alpha3.toUpperCase() == initialCountry.alpha3.toUpperCase()),
        orElse: () => countries[0]);
  }

  void changeselectedItem(Country country) {
    if (selectedItem != country) {
      selectedItem = country;
      notifyListeners();
    }
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
