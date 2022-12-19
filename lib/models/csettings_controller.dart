import 'package:flutter/material.dart';
import './country.dart';

class CSettings extends ChangeNotifier {
  int posSelected = -1;
  bool floatbutton = false;

  late Country selectedItem;

  List<Country> countries = [];

  CSettings({required this.countries, required this.selectedItem}) ;
 
  
  void changeselectedItem(Country country){
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
