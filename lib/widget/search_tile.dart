import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/country.dart';
import '../contollers/countrylistPicker_controller.dart';
import '../themes/country_list_dialog_theme.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    Key? key,
    required this.dialogTheme,
    required this.controller,
    required this.elements,
  }) : super(key: key);

  final CountryListDialogTheme dialogTheme;
  final TextEditingController controller;
  final List<Country> elements;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          color: dialogTheme.titlesBackground,
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          height: dialogTheme.tileHeight,
          child: Text(
            dialogTheme.searchTile.title,
            style:
                dialogTheme.titlesStyle.copyWith(fontSize: dialogTheme.titlesStyle.fontSize ?? 16),
          )),
      Container(
        color: dialogTheme.backgroundColor,
        height: dialogTheme.tileHeight,
        child: TextField(
          style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16),
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
              hintText: dialogTheme.searchTile.hint,
              hintStyle: dialogTheme.textStyle.copyWith(color: Colors.grey[500])),
          onChanged: ((value) {
            String s = value.toUpperCase();
            context.read<CountryListPickerController>().changeCountries(elements
                .where((e) =>
                    e.callingCode.startsWith(s) || e.englishName.common.toUpperCase().startsWith(s))
                .toList());
          }),
        ),
      ),
    ]);
  }
}
