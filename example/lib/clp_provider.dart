import 'package:flutter/material.dart';

class CLPProvider extends ChangeNotifier {
  bool isShowFlag = true;
  bool isShowTitle = true;
  bool isShowCode = true;
  bool isDownIcon = true;
  bool isShowTextField = true;

  void isShowFlagUpdate( bool value) {
    isShowFlag = value;

    notifyListeners();
  }
}
