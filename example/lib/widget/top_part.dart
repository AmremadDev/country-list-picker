import 'package:country_list_picker/country_list_picker.dart';
import 'package:country_list_picker_example/controller/dialog_provider.dart';
import 'package:country_list_picker_example/controller/input_provider.dart';
import 'package:country_list_picker_example/controller/picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

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
          isShowCode: picker.isShowCode,
          isDownIcon: picker.isDownIcon,
          isShowCountryTitle: picker.isShowCountryName,
          isShowTextField: input.isShowTextField,
          iconDown: Icon(
            picker.downIcon.icon,
            size: picker.downIcon.size,
            color: picker.downIcon.color,
          ),
          dialCodeTextStyle: picker.dialCodeTextStyle,

          // TextStyle(
          //     color: picker.pickerTextColor,
          //     fontSize: picker.pickerDialCodeFontSize,
          //     fontWeight: (picker.pickerDialCodeFontBold) ? FontWeight.bold : FontWeight.normal),

          border: (picker.pickerBorder == true) ? null : const Border(bottom: BorderSide.none),
          inputTheme: InputTheme(
            style: TextStyle(
                color: input.inputTextColor,
                fontSize: input.inputFontSize,
                fontWeight: (input.inputFontBold) ? FontWeight.bold : FontWeight.normal),
            hintText: input.inputHintString,
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
            alphabetsBar: AlphabetsBarThemes(
              visible: dialog.alphabetBar,
              // backgroundColor: Colors.transparent,
              // selectedBackgroundColor: Colors.purple,
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
