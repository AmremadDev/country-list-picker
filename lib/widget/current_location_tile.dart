import 'package:flutter/material.dart';
import '../models/country.dart';

import '../models/dialog_theme.dart';
import '../widget/country_listtile.dart';
import '../widget/ctitle.dart';

class CurrentLocationTile extends StatelessWidget {
  const CurrentLocationTile({
    Key? key,
    required this.dialogTheme,

    required this.countries
  }) : super(key: key);

  final CDialogTheme dialogTheme;

  final List<Country> countries;

  @override
  Widget build(BuildContext context) {
    Country country = countries.singleWhere((element) => element.alpha2 == WidgetsBinding.instance.window.locale.countryCode);
    return Column(children: [
      CTitle(
          title: dialogTheme.currentLocationTile.title,
          background: dialogTheme.titlesBackground,
          titlesStyle: dialogTheme.titlesStyle,
          height: dialogTheme.tileHeight),
      CountryListTile(country: country, dialogTheme: dialogTheme),
    ]);
  }
}
