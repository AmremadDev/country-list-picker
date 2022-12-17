library country_list_picker;

// imports
import 'package:country_list_picker/models/countries.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contollers/countries_codes.dart';
import '../selection_list.dart';
import '../models/country.dart';
import '../models/csettings_controller.dart';
import '../themes/country_list_dialog_theme.dart';

// exports
export '../country_list_picker.dart';
export '../themes/country_list_picker_theme.dart';
export '../themes/country_list_dialog_theme.dart';
export '../models/country.dart';
export '../models/countries.dart';

class CountryListPicker extends StatefulWidget {
  CountryListPicker({
    super.key,
    this.initialCountry = Countries.Egypt,
    this.isShowTitle = true,
    this.isShowFlag = true,
    this.isShowCode = true,
    this.isDownIcon = true,
    this.onChanged,
    this.pickerBuilder,
    this.dialogBuilder,
    this.width = double.infinity,
    this.useUiOverlay = false,
    this.useSafeArea = false,
    this.dialogTheme = const CountryListDialogTheme(),
  }) : assert(dialogTheme.tileHeight >= 50.0, "tileheight must be greater than 50.0");

  final Countries initialCountry;

  final bool? isShowFlag;
  final bool? isShowTitle;
  final bool? isShowCode;
  final bool? isDownIcon;

  final ValueChanged<Country>? onChanged;

  final Widget Function(BuildContext context, Country? countryCode)? pickerBuilder;
  // final CountryListPickerTheme? pickerTheme;

  final Widget Function(BuildContext context, Country? country)? dialogBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;
  final double? width;

  final CountryListDialogTheme dialogTheme;
  @override
  CountryListPickerState createState() {
    return CountryListPickerState();
  }
}

class CountryListPickerState extends State<CountryListPicker> {
  late Country selectedItem;
  List<Country> countries = [];
  @override
  void initState() {
    countries = countriesList
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
    selectedItem = countries.firstWhere((Country e) => (e.alpha3.toUpperCase() == widget.initialCountry.alpha3.toUpperCase()),
        orElse: () => countries[0]);
    super.initState();
  }

  void _awaitFromSelectScreen() async {
    final Country? result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<CSettings>(
            create: (context) => CSettings(countries),
            child: SelectionList(
              countries,
              initialCountry: selectedItem,
              appBar: widget.dialogTheme.appBar ??
                  AppBar(backgroundColor: Theme.of(context).appBarTheme.backgroundColor, title: const Text("Select your country2")),
              dialogTheme: widget.dialogTheme,
              useUiOverlay: widget.useUiOverlay,
              useSafeArea: widget.useSafeArea,
            ),
          ),
        ));

    setState(() {
      selectedItem = result ?? selectedItem;
      widget.onChanged ?? (selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        InkWell(
            onTap: () {
              _awaitFromSelectScreen();
            },
            child: Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.isShowFlag == true)
                  Flexible(
                      child: Image.asset("assets/flags/${selectedItem.alpha2.toLowerCase()}.png",
                          package: "country_list_picker", width: 40.0)),
                if (widget.isShowCode == true)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      selectedItem.callingCode.toString(),
                      style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
                    ),
                  ),
                if (widget.isShowTitle == true)
                  SizedBox(
                    width: 100,
                    child: Text(
                      selectedItem.englishName.common,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
                    ),
                  ),
                if (widget.isDownIcon == true)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
              ],
            )),
        Flexible(
          child: TextField(
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
              decoration: const InputDecoration(border: InputBorder.none)),
        ),
      ],
    );
  }
}
