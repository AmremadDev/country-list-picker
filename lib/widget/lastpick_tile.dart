import 'package:flutter/material.dart';
import '../model/country.dart';
import '../theme/country_list_dialog_theme.dart';
import '../model/languages.dart';

class LastPickTile extends StatelessWidget {
  final CountryListDialogTheme dialogTheme;
  final Country country;
  final Languages language;
  const LastPickTile({
    super.key,
    required this.dialogTheme,
    required this.country,
    required this.language,
  });

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
            dialogTheme.tilesTheme.lastPickTitle,
            style: dialogTheme.tilesTheme.style
                .copyWith(fontSize: dialogTheme.tilesTheme.style.fontSize ?? 16),
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
                child: Icon(
                  dialogTheme.tilesTheme.lastPickIcon.icon,
                  color: (dialogTheme.tilesTheme.lastPickIcon.color) ??
                      Theme.of(context).colorScheme.primary,
                  size: dialogTheme.tilesTheme.lastPickIcon.size ?? dialogTheme.tileHeight * .6,
                )),
            onTap: null),
      )
    ]);
  }
}
