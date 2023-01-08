import 'package:flutter/material.dart';
import '../model/country.dart';
import '../theme/country_list_dialog_theme.dart';

class CurrentLocationTile extends StatelessWidget {
  const CurrentLocationTile({Key? key, required this.dialogTheme, required this.country}) : super(key: key);

  final CountryListDialogTheme dialogTheme;

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          color: dialogTheme.titlesBackground,
          alignment: (Directionality.of(context) == TextDirection.ltr) ? Alignment.centerLeft : Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          width: double.infinity,
          height: dialogTheme.tileHeight,
          child: Text(
            dialogTheme.currentLocationTileTheme.title,
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
                    "assets/flags/${country.iso_3166_1_alpha2.toLowerCase()}.png",
                    package: 'country_list_picker',
                    width: dialogTheme.tileHeight * .8,
                  )
                : null,
            title: Text(
              country.name.common,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16),
            ),
            trailing: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (dialogTheme.alphabetsBarTheme.visible == true) ? 20.0 : 0.0,
              ),
              child: (dialogTheme.isShowDialCode)
                  ? Text(country.dialing_code,
                      textDirection: TextDirection.ltr, style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16))
                  : null,
            ),
            onTap: () {
              Navigator.pop(context, country);
            }),
      ),
    ]);
  }
}
