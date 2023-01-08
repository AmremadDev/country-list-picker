import 'package:country_list_picker/model/languages.dart';
import 'package:country_list_picker/support/countires_multi_languages_list.dart';
import 'package:flutter/material.dart';
import '../model/countries.dart';
import '../model/country.dart';

class SettingsProvider extends ChangeNotifier {
  Countries initialCountry;
  Languages language;
  SettingsProvider({required this.initialCountry, required this.language}) {
    // initialCountry = Countries.Egypt;
    // print(countries[0].runtimeType);
    countries = countriesMultiLanguagesList
        .map((element) => Country(
              iso_3166_1_alpha2: element['iso_3166_1_alpha2'],
              iso_3166_1_alpha3: element['iso_3166_1_alpha3'],
              name: (element[language.iso_639_2_alpha3].runtimeType == String)
                  ? Name(common: element[language.iso_639_2_alpha3], official: element[language.iso_639_2_alpha3])
                  : Name(common: element[language.iso_639_2_alpha3]['common'], official: element[language.iso_639_2_alpha3]['official']),
              dialing_code: (element['dialing_code'] == null) ? "" : element['dialing_code'],
              default_number_length: element['default_number_length'],
              default_number_format: element['default_number_format'],
              local_number_sample: element['local_number_sample'],
              flagUri: 'assets/flags/${element['iso_3166_1_alpha2'].toLowerCase()}.png',
            ))
        .toList();

    countries.sort((a, b) => a.name.common.compareTo(b.name.common));

    selectedCountry = countries.firstWhere((Country e) => (e.iso_3166_1_alpha3.toUpperCase() == initialCountry.iso_3166_1_alpha3.toUpperCase()),
        orElse: () => countries[0]);
  }

  late Country _selectedCountry;
  Country get selectedCountry => _selectedCountry;
  set selectedCountry(Country value) {
    _selectedCountry = value;
    notifyListeners();
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
