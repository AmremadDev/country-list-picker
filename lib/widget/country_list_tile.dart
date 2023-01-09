import 'package:flutter/material.dart';
import '../model/country.dart';
import '../model/languages.dart';
import '../theme/country_list_dialog_theme.dart';

class CountryListTile extends StatelessWidget {
  const CountryListTile({
    super.key,
    required this.country,
    required this.language,
    this.dialogTheme = const CountryListDialogTheme(),
  });

  final Country country;
  final Languages language;
  final CountryListDialogTheme dialogTheme;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            overflow: TextOverflow.clip,
            maxLines: 1,
            softWrap: false,
            style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16),
          ),
          // subtitle: Text(
          //   country.name.official,
          //   overflow: TextOverflow.clip,
          //   // maxLines: 1,
          //   softWrap: false,
          //   style: dialogTheme.textStyle.copyWith(color: Colors.grey.shade500, fontSize: 14),
          // ),
          trailing: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (dialogTheme.alphabetsBarTheme.visible == false ||
                      language == Languages.Chinese ||
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
    );
  }
}
