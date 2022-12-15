library country_list_picker;

// imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../support/countries_codes.dart';
import '../selection_list.dart';
import '../models/picker_theme.dart';
import '../models/country.dart';
import '../models/csettings_controller.dart';
import '../models/dialog_theme.dart';

// exports
export '../country_list_picker.dart';
export '../models/dialog_theme.dart';

class CountryListPicker extends StatefulWidget {
  const CountryListPicker({
    super.key,
    required this.onChanged,
    required this.initialSelection,
    this.appBar,
    this.pickerBuilder,
    this.countryBuilder,
    this.pickerTheme,
    this.dialogTheme = const CDialogTheme(),
    this.width,
    this.useUiOverlay = false,
    this.useSafeArea = false,
  });

  final String? initialSelection;
  final ValueChanged<Country?> onChanged;
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, Country? countryCode)? pickerBuilder;
  final CPickerTheme? pickerTheme;
  final CDialogTheme  dialogTheme;
  final Widget Function(BuildContext context, Country? country)? countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;
  final double? width;

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

    if (widget.initialSelection != null) {
      selectedItem = countries.firstWhere(
          (Country e) =>
              (e.alpha3.toUpperCase() == widget.initialSelection!.toUpperCase()) ||
              (e.callingCode == widget.initialSelection),
          orElse: () => countries[0]);
    } else {
      selectedItem = countries[0];
    }
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
                  AppBar(
                      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                      title: const Text("Select your country")),
              pickerTheme: widget.pickerTheme,
              dialogTheme: widget.dialogTheme,
              // dialogBuilder: widget.countryBuilder,
              useUiOverlay: widget.useUiOverlay,
              useSafeArea: widget.useSafeArea,
            ),
          ),
        ));

    setState(() {
      selectedItem = result ?? selectedItem;
      widget.onChanged(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: _buildCountryCodeSelector(),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }

  TextButton _buildCountryCodeSelector() {
    return TextButton(
      onPressed: () {
        _awaitFromSelectScreen();
      },
      child: widget.pickerBuilder != null
          ? widget.pickerBuilder!(context, selectedItem)
          : Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (widget.pickerTheme?.isShowFlag ?? true == true)
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset("assets/flags/${selectedItem.alpha2.toLowerCase()}.png",
                            package: "xcountry", width: 32.0)),
                  ),
                if (widget.pickerTheme?.isShowCode ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(selectedItem.callingCode.toString(), style: widget.pickerTheme?.codeTextStyle),
                    ),
                  ),
                if (widget.pickerTheme?.isShowTitle ?? true)
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(selectedItem.englishName.common, maxLines: 1, overflow: TextOverflow.ellipsis)),
                  ),
                if (widget.pickerTheme?.isDownIcon ?? true)
                  const Flexible(
                    child: Icon(Icons.keyboard_arrow_down),
                  )
              ],
            ),
    );
  }
}
