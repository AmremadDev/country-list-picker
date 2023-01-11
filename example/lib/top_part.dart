import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_list_picker/country_list_picker.dart';

import '../controller/dialog_provider.dart';
import '../controller/input_provider.dart';
import '../controller/picker_provider.dart';
import '../model/borders.dart';
import '../translation.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer3<PickerProvider, InputProvider, DialogProvider>(
      builder: (context, picker, input, dialog, child) {
        return CountryListPicker(
          // localCountry: Countries.Albania,
          // onCountryChanged: (value) {},
          // onChanged: (value) {},
          initialCountry: Countries.Egypt,
          language: picker.language,
          textDirection: picker.textDirection,
          localCountry: (dialog.currentLocationTile == false) ? null : dialog.localCountry,
          countryNameTextStyle: picker.countryNameTextStyle,
          isShowFlag: picker.isShowFlag,
          flagSize: picker.flagSize,
          isShowDialingCode: picker.isShowDialCode,
          isShowDownIcon: picker.isDownIcon,
          isShowCountryTitle: picker.isShowCountryName,
          isShowInputField: input.isShowTextField,
          iconDown:
              Icon(picker.downIcon.icon, size: picker.downIcon.size, color: picker.downIcon.color),
          dialCodeTextStyle: picker.dialCodeTextStyle,
          border: picker.border == Borders.none
              ? InputBorder.none
              : picker.border == Borders.outline
                  ? OutlineInputBorder(borderSide: BorderSide(width: picker.borderWidth))
                  : UnderlineInputBorder(borderSide: BorderSide(width: picker.borderWidth)),
          inputTheme: InputThemeData(
            obscureText: input.isObscureText,
            obscuringCharacter: input.obscuringCharacter,
            style: input.textStyle,
            hintText: input.hintString.tr,
            hintStyle: input.hintTextStyle,
            border: input.border == Borders.none
                ? InputBorder.none
                : input.border == Borders.outline
                    ? OutlineInputBorder(borderSide: BorderSide(width: input.borderWidth))
                    : UnderlineInputBorder(borderSide: BorderSide(width: input.borderWidth)),
            mask: input.mask,
          ),
          onCountryChanged: ((value) {
            input.hintString = value.local_number_sample;
            input.mask = value.default_number_format;
          }),
          onChanged: (value) {
            print(value);
          },
          dialogTheme: CountryListDialogTheme(
            isShowFlag: dialog.countryFlag,
            isShowDialCode: dialog.countryDialCode,
            isShowFloatButton: dialog.upActionbutton,
            isShowSearchTile: dialog.searchTile,
            isShowLastPickTile: dialog.lastPickTile,
            isShowAlphabetsBar: dialog.alphabetBar,
            backgroundColor: dialog.backgroundColor,
            textStyle: dialog.textStyle,
            appBar: AppBar(title: Text(dialog.appBarTitle.tr)),
            tileHeight: dialog.tileHeight,
            alphabetsBarTheme: AlphabetsBarThemeData(
              backgroundColor: dialog.alphabetUnSelectedBackgroundColor,
              selectedBackgroundColor: dialog.alphabetSelectedBackgroundColor,
              textStyle: dialog.alphabetUnSelectedTextStyle,
              selectedTextStyle: dialog.alphabetSelectedTextStyle,
            ),
            tilesTheme: TilesThemeData(
              background: dialog.titlesBackgroundColor,
              style: dialog.titleTextStyle,
              currentLocationTileTitle: dialog.currentLocationTileTitle.tr,
              lastPickIcon: Icon(dialog.lastPickTileTitleIcon),
              lastPickTitle: dialog.lastPickTileTitle.tr,
              searchHint: dialog.searchTileHintString.tr,
              searchHintTextStyle: dialog.searchTileHintTextStyle,
              searchTitle: dialog.searchTileTitle.tr,
            ),
          ),
        );
      },
    );
  }
}
