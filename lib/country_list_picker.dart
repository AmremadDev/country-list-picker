library country_list_picker;

// imports

import 'package:flutter/material.dart';
import 'package:getworld/getworld.dart' as getworld;
import 'package:getworld/scr/country.dart';
import 'package:xcountry/models/csettings_controller.dart';
import 'package:provider/provider.dart';
import './xselection_list.dart';

import './models/dialog_theme.dart';
import './models/picker_theme.dart';

export 'package:getworld/getworld.dart';

// exports
export './country_list_picker.dart';
export './models/country.dart';
export './models/dialog_theme.dart';

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
  final CDialogTheme dialogTheme;
  final Widget Function(BuildContext context, Country? country)? countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;
  final double? width;

  @override
  CountryListPickerState createState() {
    return CountryListPickerState();
  }
}

// Future getdata() async {
//   // await GetWorld().initialize();
//   // log(GetWorld().Currencies.length.toString());
// }

class CountryListPickerState extends State<CountryListPicker> {
  Country? selectedItem;
  List<Country> elements = [];
  @override
  void initState() {
    // getdata();
    // elements = (widget.pickerTheme?.showEnglishName ?? true ? countriesEnglish : codes)
    //     .map((s) => Country(
    //           englishName: s['english_name'],
    //           code: s['code'],
    //           dialCode: s['dial_code'],
    //           length: s['length'],
    //           flagUri: 'assets/flags/${s['code'].toLowerCase()}.png',
    //         ))
    //     .toList();
    getworld.GetWorld().initialize(
        // languages: false,
        // currencies: false,
        // geographical: false,
        // extra: false,
        // states: false,
        // population: false,
        // alt_spellings: false,
        // cities: false

        );
        
    elements = getworld.Countries.map((e) => e).toList();
    elements.sort((a, b) => a.name.common.toString().compareTo(b.name.common.toString()));
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) =>
              (e.iso_3166_1_alpha3.toUpperCase() == widget.initialSelection!.toUpperCase()) ||
              (e.dialling!.calling_code == widget.initialSelection),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }
    super.initState();

    // print(GetWorld().Countries.length);

    // getworld.GetWorld().initialize();
  }

  void _awaitFromSelectScreen() async {
    final Country? result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<CSettings>(
            create: (context) => CSettings(),
            child: XSelectionList(
              elements,
              initialCountry: selectedItem,
              appBar: widget.dialogTheme.appBar ??
                  AppBar(
                      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                      title: const Text("Select your country")),
              pickerTheme: widget.pickerTheme,
              dialogTheme: widget.dialogTheme,
              dialogBuilder: widget.countryBuilder,
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
    return
        //
        // FutureBuilder<void>(
        //   future: GetWorld().initialize(),
        //   // initialData: InitialData,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     return Container(
        //       decoration: const BoxDecoration(color: Colors.greenAccent),
        //       // width: widget.width,
        //       child: ListView.builder(
        //         itemCount: GetWorld().Countries.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return ListTile(title: Text(GetWorld().Countries[index].name.official),) ;
        //         },
        //       ),

        TextField(
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
                        child: Image.asset(
                            "assets/flags/${selectedItem!.iso_3166_1_alpha2.toLowerCase()}.png",
                            package: "xcountry",
                            width: 32.0)),
                  ),
                if (widget.pickerTheme?.isShowCode ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(selectedItem!.dialling!.calling_code.toString(),
                          style: widget.pickerTheme?.codeTextStyle),
                    ),
                  ),
                if (widget.pickerTheme?.isShowTitle ?? true)
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(selectedItem!.name.common,
                            maxLines: 1, overflow: TextOverflow.ellipsis)),
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
