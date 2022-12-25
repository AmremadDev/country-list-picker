import 'package:flutter/material.dart';
import '../models/country.dart';
import '../themes/country_list_dialog_theme.dart';

class LastPickTile extends StatelessWidget {
  final CountryListDialogTheme dialogTheme;
  final Country country;
  const LastPickTile({
    super.key,
    required this.dialogTheme,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          color: dialogTheme.titlesBackground,
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          height: dialogTheme.tileHeight,
          child: Text(
            dialogTheme.lastPickTile.title,
            style:
                dialogTheme.titlesStyle.copyWith(fontSize: dialogTheme.titlesStyle.fontSize ?? 16),
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
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(
                  dialogTheme.lastPickTile.icon.icon,
                  color: (dialogTheme.lastPickTile.icon.color) ??
                      Theme.of(context).colorScheme.primary,
                  size: dialogTheme.lastPickTile.icon.size ?? dialogTheme.tileHeight * .6,
                )),
            onTap: null),
      )
    ]);
  }
}
