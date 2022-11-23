import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/country.dart';
import '../models/csettings_controller.dart';
import '../models/dialog_theme.dart';
import './xtitle.dart';

class XSearchField extends StatelessWidget {
  const XSearchField({
    Key? key,
    required this.dialogTheme,
    this.height = 50.0,
    required this.controller,
    required this.elements,
  }) : super(key: key);

  final CDialogTheme dialogTheme;
  final double height;
  final TextEditingController controller;
  final List<Country> elements;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      XTitle(
        title: dialogTheme.searchText,
        background: dialogTheme.titlesBackground,
        titlesStyle: dialogTheme.titlesStyle,
        height: height,
      ),
      Container(
        color: Colors.white,
        height: height,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
              hintText: dialogTheme.searchHintText),
          onChanged: ((value) {
            String s = value.toUpperCase();
            context
                .read<CSettings>()
                .changeCountries(elements.where((e) => e.dialCode!.startsWith(s) || e.englishName!.toUpperCase().startsWith(s)).toList());
          }),
        ),
      ),
    ]);
  }
}
