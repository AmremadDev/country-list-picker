import 'package:flutter/material.dart';
import '../models/country.dart';
import '../themes/country_list_dialog_theme.dart';

class CurrentLocationTile extends StatelessWidget {
  const CurrentLocationTile({Key? key, required this.dialogTheme, required this.countries}) : super(key: key);

  final CountryListDialogTheme dialogTheme;

  final List<Country> countries;

  @override
  Widget build(BuildContext context) {
    Country country =
        countries.singleWhere((element) => element.alpha2 == WidgetsBinding.instance.window.locale.countryCode);

    return Column(children: [
      Container(
          color: dialogTheme.titlesBackground,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15.0),
          width: double.infinity,
          height: dialogTheme.tileHeight,
          child: Text(
            dialogTheme.currentLocationTile.title,
            style: dialogTheme.titlesStyle.copyWith(
              fontSize: dialogTheme.titlesStyle.fontSize ?? 16,
              fontWeight: dialogTheme.titlesStyle.fontWeight ?? FontWeight.bold,
            ),
          )),
      SizedBox(
        height: dialogTheme.tileHeight,
        child: ListTile(
            leading: (dialogTheme.isShowFlage)
                ? Image.asset(
                    "assets/flags/${country.alpha2.toLowerCase()}.png",
                    package: 'country_list_picker',
                    width: dialogTheme.tileHeight * .8,
                  )
                : null,
            title: Text(
              country.englishName.common,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16),
            ),
            trailing: Padding(
              padding: EdgeInsets.only(
                right: (dialogTheme.alphabetsBar.visible == true) ? 20.0 : 0.0,
              ),
              child: (dialogTheme.isShowDialCode)
                  ? Text(country.callingCode,
                      style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16))
                  : null,
            ),
            onTap: () {
              Navigator.pop(context, country);
            }),
      ),
    ]);
  }
}
