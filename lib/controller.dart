import 'package:flutter/material.dart';

class InfoModel extends ChangeNotifier {
  int posSelected = -1;
  bool floatbutton = false;

  void changeSelectedPosition(int index) {
    posSelected = index;
    notifyListeners();
  }

  void changeIsShowFloatButton(bool value) {
    floatbutton = value;

    notifyListeners();
  }
}
