library country_list_picker;

// imports
import 'package:country_list_picker/models/countries.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contollers/countries_codes.dart';
import '../selection_list.dart';
import '../models/country.dart';
import '../supports/csettings_controller.dart';
import '../themes/country_list_dialog_theme.dart';

// exports
export '../country_list_picker.dart';
export '../themes/country_list_dialog_theme.dart';
export '../models/country.dart';
export '../models/countries.dart';

class CountryListPicker extends StatelessWidget {
  CountryListPicker({
    super.key,
    this.initialCountry = Countries.Egypt,
    this.isShowTitle = true,
    this.isShowFlag = true,
    this.isShowCode = true,
    this.isDownIcon = true,
    this.isShowTextField = true,
    this.margin = const EdgeInsets.all(5.0),
    this.padding = const EdgeInsets.all(0.0),
    this.border,
    this.codeTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.textFieldTextStyle = const TextStyle(fontSize: 16),
    this.countryNameTextStyle = const TextStyle(fontSize: 15, color: Colors.grey),
    this.onChanged,
    this.pickerBuilder,
    this.dialogBuilder,
    this.width = double.infinity,
    this.useUiOverlay = false,
    this.useSafeArea = false,
    this.dialogTheme = const CountryListDialogTheme(),
  })  : assert(dialogTheme.tileHeight >= 50.0, "tileheight must be greater than 50.0"),
        assert(isShowFlag == true || isShowCode == true, "Both isShowFlag and isShowCode can't be false");

  final Countries initialCountry;
  final bool isShowFlag;
  final bool isShowTitle;
  final bool isShowCode;
  final bool isDownIcon;
  final bool isShowTextField;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxBorder? border;
  final TextStyle codeTextStyle;
  final TextStyle textFieldTextStyle;
  final TextStyle countryNameTextStyle;
  final ValueChanged<Country>? onChanged;
  final Widget Function(BuildContext context, Country? countryCode)? pickerBuilder;
  final Widget Function(BuildContext context, Country? country)? dialogBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;
  final double? width;
  final CountryListDialogTheme dialogTheme;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    List<Country> countries = countriesList
        .map((s) => Country(
              alpha2: s['iso_3166_1_alpha2'],
              alpha3: s['iso_3166_1_alpha3'],
              englishName: Name(common: s['englishName']['common'], official: s['englishName']['official']),
              nativeName: Name(common: s['nativeName']['common'], official: s['nativeName']['official']),
              callingCode: s['callingCode'],
              numberlength: s['numberlength'],
              flagUri: 'assets/flags/${s['iso_3166_1_alpha2'].toLowerCase()}.png',
            ))
        .toList();

    countries.sort((a, b) => a.englishName.common.compareTo(b.englishName.common));

    Country selectedItem = countries.firstWhere(
        (Country e) => (e.alpha3.toUpperCase() == initialCountry.alpha3.toUpperCase()),
        orElse: () => countries[0]);

    return ChangeNotifierProvider<CSettings>(
      create: (context) => CSettings(countries: countries, selectedItem: selectedItem),
      builder: (context, child) {
        return Container(
          margin: margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: padding.top, right: padding.right + 5.0, bottom: padding.bottom, left: padding.left + 5.0),
                decoration:
                    BoxDecoration(border: border ?? Border.all(width: 1, color: Theme.of(context).primaryColor)),
                child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  InkWell(
                    onTap: (onChanged == null) ? null : () => _onChangeEvent(context, countries, selectedItem),
                    child: _buildMainPart(),
                  ),
                  if (isShowTextField == true)
                    Flexible(
                      child: TextField(
                        style: textFieldTextStyle.copyWith(fontSize: textFieldTextStyle.fontSize ?? 16),
                        maxLength: 15,
                        decoration: const InputDecoration(border: InputBorder.none, counterText: ""),
                      ),
                    )
                ]),
              ),
              if (isShowTitle == true)
                Selector<CSettings, Country>(
                    selector: (context, model) => model.selectedItem,
                    builder: (context, value, child) => Text(
                          value.englishName.common,
                          style: countryNameTextStyle.copyWith(
                              fontSize: countryNameTextStyle.fontSize ?? 15,
                              color: countryNameTextStyle.color ?? Colors.grey),
                        )),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onChangeEvent(BuildContext context, List<Country> countries, Country selectedItem) async {
    CSettings settings = context.read<CSettings>();
    final Country? result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<CSettings>(
                  create: (context) => CSettings(countries: countries, selectedItem: selectedItem),
                  builder: (context, child) {
                    return SelectionList(
                      countries,
                      initialCountry: context.read<CSettings>().selectedItem,
                      appBar: dialogTheme.appBar ??
                          AppBar(
                              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                              title: const Text("Select your country")),
                      dialogTheme: dialogTheme,
                      useUiOverlay: useUiOverlay,
                      useSafeArea: useSafeArea,
                    );
                  },
                )));
    settings.changeselectedItem(result ?? selectedItem);
    if (onChanged != null) onChanged!(selectedItem);
  }

  Selector<CSettings, Country> _buildMainPart() {
    return Selector<CSettings, Country>(
        selector: (context, model) => model.selectedItem,
        builder: (context, value, child) =>
            Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
              //flage
              if (isShowFlag == true)
                Flexible(
                    child: Image.asset("assets/flags/${value.alpha2.toLowerCase()}.png",
                        package: "country_list_picker", width: 40.0)),
              //code
              if (isShowCode == true)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.5),
                    child: Text(value.callingCode.toString(),
                        style: codeTextStyle.copyWith(
                            fontSize: codeTextStyle.fontSize ?? 16,
                            fontWeight: codeTextStyle.fontWeight ?? FontWeight.bold))),
              //down icon
              if (isDownIcon == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor),
                ),
            ]));
  }
}
