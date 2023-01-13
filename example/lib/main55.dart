import 'package:country_list_picker/country_list_picker.dart';
import 'package:country_list_picker/model/languages.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    theme: ThemeData(brightness: Brightness.dark),
    home: Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CountryListPicker(
          language: Languages.Korean,
          textDirection: Languages.Korean.textDirection,
          onCountryChanged: ((value) {}),
          onChanged: (value) {},
        ),
      ],
    )),
  ));
}
