import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_list_picker/country_list_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../controller/dialog_provider.dart';
import '../controller/input_provider.dart';
import '../controller/picker_provider.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer3<PickerProvider, InputProvider, DialogProvider>(
      builder: (context, picker, input, dialog, child) {
        return CountryListPicker(
          initialCountry: Countries.Egypt,
          countryNameTextStyle: picker.countryNameTextStyle,
          isShowFlag: picker.isShowFlag,
          flagSize: picker.flagSize,
          isShowCode: picker.isShowDialCode,
          isDownIcon: picker.isDownIcon,
          isShowCountryTitle: picker.isShowCountryName,
          isShowTextField: input.isShowTextField,
          iconDown: Icon(picker.downIcon.icon, size: picker.downIcon.size, color: picker.downIcon.color),
          dialCodeTextStyle: picker.dialCodeTextStyle,
          border: (picker.border == true) ? null : const Border(bottom: BorderSide.none),
          inputTheme: InputThemeData(
            style: input.textStyle,
            hintText: input.ihintString,
            hintStyle: input.hintTextStyle,
            border: (input.border == true)
                ? const OutlineInputBorder(borderSide: BorderSide(width: 1))
                : InputBorder.none,
            mask: MaskTextInputFormatter(mask: input.mask, filter: {"#": RegExp(r'[0-9]')}),
          ),
          onChanged: ((value) {}),
          dialogTheme: CountryListDialogTheme(
            isShowFlage: dialog.countryFlag,
            isShowDialCode: dialog.countryDialCode,
            isShowFloatButton: dialog.upActionbutton,

            backgroundColor: dialog.backgroundColor,
            titlesBackground: dialog.titlesBackgroundColor,
            textStyle: dialog.textStyle,
            titlesStyle: dialog.titleTextStyle,
            appBar: AppBar(
              title: Text(dialog.appBarTitle),
            ),
            // tileHeight: ,
            // useSafeArea: ,
            // useUiOverlay: ,

            alphabetsBar: AlphabetsBarThemeData(
              visible: dialog.alphabetBar,

               backgroundColor: dialog.alphabetUnSelectedBackgroundColor ,
              selectedBackgroundColor: dialog.alphabetSelectedBackgroundColor ,
             textStyle: dialog.alphabetUnSelectedTextStyle ,
              selectedTextStyle: dialog.alphabetSelectedTextStyle ,

            ),
            searchTile: SearchTileThemeData(
              visible: dialog.searchTile,
              title: dialog.searchTileTitle,
              hint: dialog.searchTileHintString,
              hintTextStyle: dialog.searchTileHintTextStyle,
            ),
            currentLocationTile: CurrentLocationTileThemeData(
              visible: dialog.currentLocationTile,
              title: dialog.currentLocationTileTitle,
            ),
            lastPickTile: LastPickTileTheme(
              visible: dialog.lastPickTile,
              title: dialog.lastPickTileTitle,
            ),

          ),
        );
      },
    );
  }
}
