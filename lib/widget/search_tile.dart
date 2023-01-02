import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/country.dart';
import '../theme/country_list_dialog_theme.dart';
import '../provider/picker_provider.dart';

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
          alignment: (Directionality.of(context) == TextDirection.ltr)
              ? Alignment.centerLeft
              : Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          width: double.infinity,
          height: dialogTheme.tileHeight,
          child: Text(
            dialogTheme.searchTileTheme.title,
            style:
                dialogTheme.titlesStyle.copyWith(fontSize: dialogTheme.titlesStyle.fontSize ?? 16),
          )),
      Container(
        color: dialogTheme.backgroundColor,
        height: dialogTheme.tileHeight,
        child: TextField(
          textInputAction: TextInputAction.search,
          style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16),
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
              hintText: dialogTheme.searchTileTheme.hint,
              hintStyle: dialogTheme.searchTileTheme.hintTextStyle),
          onChanged: ((value) {
            String s = value.toUpperCase();
            context.read<SettingsProvider>().countries = elements
                .where((e) =>
                    e.callingCode.startsWith(s) || e.englishName.common.toUpperCase().startsWith(s))
                .toList();
          }),
        ),
      ),
    ]);
  }
}
