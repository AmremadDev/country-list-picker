import 'package:country_list_picker/country_list_picker.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import '../controller/clp_provider.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CLPProvider>(
      builder: (context, provider, child) {
        return CountryListPicker(
          initialCountry: Countries.Egypt,
          titleTextStyle: TextStyle(color: provider.pickerTextColor),
          isShowFlag: provider.isShowFlag,
          isShowCode: provider.isShowCode,
          isDownIcon: provider.isDownIcon,
          isShowTitle: provider.isShowTitle,
          isShowTextField: provider.isShowTextField,
          dialCodeTextStyle: TextStyle(
              color: provider.pickerTextColor,
              fontSize: provider.pickerDialCodeFontSize,
              fontWeight: (provider.pickerDialCodeFontBold) ? FontWeight.bold : FontWeight.normal),
          border: (provider.pickerBorder == true) ? null : const Border(bottom: BorderSide.none),
          inputTheme: InputTheme(
            style: TextStyle(
                color: provider.inputTextColor,
                fontSize: provider.inputFontSize,
                fontWeight: (provider.inputFontBold) ? FontWeight.bold : FontWeight.normal),
            hintText: provider.inputHintString,
            border: (provider.inputBorder == true)
                ? const OutlineInputBorder(borderSide: BorderSide(width: 1))
                : InputBorder.none,
            mask: MaskTextInputFormatter(mask: provider.inputMask, filter: {"#": RegExp(r'[0-9]')}),
          ),
          onChanged: ((value) {}),
          dialogTheme: CountryListDialogTheme(
            isShowFlage: provider.countryFlag,
            isShowDialCode: provider.countryDialCode,
            isShowFloatButton: provider.upActionbutton,
            alphabetsBar: AlphabetsBarThemes(
              visible: provider.alphabetBar,
              // backgroundColor: Colors.transparent,
              // selectedBackgroundColor: Colors.purple,
            ),
            searchTile: SearchTileTheme(
              visible: provider.searchTile,
              hint: "",
              title: "Search",
            ),
            currentLocationTile: CurrentLocationTileTheme(
              visible: provider.currentLocationTile,
              title: "Current Location",
            ),
            lastPickTile: LastPickTileTheme(
              visible: provider.lastPicktile,
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
