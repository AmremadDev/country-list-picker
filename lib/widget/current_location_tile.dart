import 'package:country_list_picker/model/languages.dart';
import 'package:flutter/material.dart';
import '../model/country.dart';
import '../theme/country_list_dialog_theme.dart';

class CurrentLocationTile extends StatelessWidget {
  const CurrentLocationTile({
    super.key,
    required this.dialogTheme,
    required this.country,
    required this.language,
  });

  final CountryListDialogTheme dialogTheme;
  final Country country;
  final Languages language;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          color: dialogTheme.tilesTheme.background ?? Theme.of(context).focusColor,
          alignment: (Directionality.of(context) == TextDirection.ltr)
              ? Alignment.centerLeft
              : Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          width: double.infinity,
          height: dialogTheme.tileHeight,
          child: Text(
            dialogTheme.tilesTheme.currentLocationTileTitle,
            style: dialogTheme.tilesTheme.style.copyWith(
              fontSize: dialogTheme.tilesTheme.style.fontSize ?? 16,
              fontWeight: dialogTheme.tilesTheme.style.fontWeight ?? FontWeight.bold,
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
                horizontal: (dialogTheme.alphabetsBarTheme.visible == false ||
                        language == Languages.Chinese ||
                        language == Languages.Korean ||
                        language == Languages.Japanese)
                    ? 0.0
                    : 20.0,
              ),
              child: (dialogTheme.isShowDialCode)
                  ? Text(country.dialing_code,
                      textDirection: TextDirection.ltr,
                      style: dialogTheme.textStyle
                          .copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16))
                  : null,
            ),
            onTap: () {
              Navigator.pop(context, country);
            }),
      ),
    ]);
  }
}
