import 'package:flutter/material.dart';
import 'package:getworld/scr/country.dart';
import 'package:provider/provider.dart';
import '../models/csettings_controller.dart';
import '../models/dialog_theme.dart';
import './xtitle.dart';

class XSearchField extends StatelessWidget {
  const XSearchField({
    Key? key,
    required this.dialogTheme,
    required this.controller,
    required this.elements,
  }) : super(key: key);

  final CDialogTheme dialogTheme;
  final TextEditingController controller;
  final List<Country> elements;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      XTitle(
        title: dialogTheme.searchText,
        background: dialogTheme.titlesBackground,
        titlesStyle: dialogTheme.titlesStyle,
        height: dialogTheme.rowHeight,
      ),
      Container(
        
        color: dialogTheme.backgroundColor,
        height: dialogTheme.rowHeight,
        child: TextField(
          style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16),
          
          controller: controller,
          decoration: InputDecoration(
          
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
              hintText: dialogTheme.searchHintText,
              hintStyle:dialogTheme.textStyle.copyWith(color: Colors.grey[500])
              ),
              
          onChanged: ((value) {
            String s = value.toUpperCase();
            context
                .read<CSettings>()
                .changeCountries(elements.where((e) => e.dialling!.calling_code.startsWith(s) || e.name.common.toUpperCase().startsWith(s)).toList());
          }),
        ),
      ),
    ]);
  }
}
