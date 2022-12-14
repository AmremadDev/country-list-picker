import 'package:flutter/material.dart';
import '../models/country.dart';
import '../models/dialog_theme.dart';

class CountryListTile extends StatelessWidget {
  const CountryListTile({
    Key? key,
    required this.country,
    this.dialogTheme = const CDialogTheme(),
    this.isLastpick = false,
  }) : super(key: key);

  final Country country;
  final bool isLastpick;
  final CDialogTheme dialogTheme;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dialogTheme.rowHeight,
      child: ListTile(
          leading: (dialogTheme.isShowFlage)
              ? Image.asset("assets/flags/${country.alpha2.toLowerCase()}.png", package: 'xcountry', width: 30.0)
              : null,
          title: Text(
            country.englishName.common,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16),
          ),
          // subtitle: Text(country.nativeName.common,style: TextStyle(color: Colors.blue),),
          // contentPadding: EdgeInsets.all(10),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: isLastpick
                ? Icon(
                    dialogTheme.lastPickTile.icon.icon,
                    color: (dialogTheme.lastPickTile.icon.color) ?? Theme.of(context).primaryColor,
                    size: dialogTheme.lastPickTile.icon.size,
                  )
                : (dialogTheme.isShowDialCode)
                    ? Text(country.callingCode,
                        style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16))
                    : null,
          ),
          onTap: () {
            Navigator.pop(context, country);
          }),
    );
  }
}
