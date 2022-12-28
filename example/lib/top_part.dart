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
          border: (picker.pickerBorder == true) ? null : const Border(bottom: BorderSide.none),
          inputTheme: InputTheme(
            style: input.inputTextStyle,
            hintText: input.inputHintString,
            hintStyle: input.hintTextStyle,
            border: (input.inputBorder == true)
                ? const OutlineInputBorder(borderSide: BorderSide(width: 1))
                : InputBorder.none,
            mask: MaskTextInputFormatter(mask: input.inputMask, filter: {"#": RegExp(r'[0-9]')}),
          ),
          onChanged: ((value) {}),
          dialogTheme: CountryListDialogTheme(
            isShowFlage: dialog.countryFlag,
            isShowDialCode: dialog.countryDialCode,
            isShowFloatButton: dialog.upActionbutton,

            appBar: AppBar(
              title: Text(dialog.dialogAppBarTitle),
            ),
            // backgroundColor: dialog.ba ckgroundColor,
            // textStyle: ,
            // tileHeight: ,
            // titlesBackground: ,
            // titlesStyle: ,
            // useSafeArea: ,
            // useUiOverlay: ,

            alphabetsBar: AlphabetsBarThemes(
              visible: dialog.alphabetBar,
            ),
            searchTile: SearchTileTheme(
              visible: dialog.searchTile,
              hint: "",
              title: "Search",
            ),
            currentLocationTile: CurrentLocationTileTheme(
              visible: dialog.currentLocationTile,
              title: "Current Location",
            ),
            lastPickTile: LastPickTileTheme(
              visible: dialog.lastPicktile,
              title: "Last Pick",
            ),
            // backgroundColor: Colors.red,
            // titlesBackground: Colors.purple,
          ),
        );
      },
    );
  }
}
