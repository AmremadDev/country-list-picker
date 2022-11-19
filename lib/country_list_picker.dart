library country_list_picker;

import 'package:flutter/material.dart';
import './selection_list.dart';
import './support/country.dart';
import './dialog_theme.dart';
import './picker_theme.dart';
import './support/countries_codes_en.dart';
import './support/countries_codes_local.dart';
export './support/country.dart';

class CountryListPicker extends StatefulWidget {
  const CountryListPicker({
    super.key,
    this.onChanged,
    this.initialSelection,
    this.appBar,
    this.pickerBuilder,
    this.countryBuilder,
    this.pickerTheme,
    this.dialogTheme,
    this.width,
    this.useUiOverlay = true,
    this.useSafeArea = false,
  });

  final String? initialSelection;
  final ValueChanged<Country?>? onChanged;
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, Country? countryCode)? pickerBuilder;
  final XPickerTheme? pickerTheme;
  final XDialogTheme? dialogTheme;
  final Widget Function(BuildContext context, Country countryCode)? countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;
  final double? width;

  @override
  CountryListPickerState createState() {
    return CountryListPickerState();
  }
}

class CountryListPickerState extends State<CountryListPicker> {
  Country? selectedItem;
  List<Country> elements = [];

  // CountryListPickerState();

  @override
  void initState() {
     elements = (widget.pickerTheme?.showEnglishName ?? true ? countriesEnglish : codes)
        .map((s) => Country(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              length: s['length'],
              flagUri: 'flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) => (e.code!.toUpperCase() == widget.initialSelection!.toUpperCase()) || (e.dialCode == widget.initialSelection),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    super.initState();
  }

  void _awaitFromSelectScreen(BuildContext context, PreferredSizeWidget? appBar, XPickerTheme? pickerTheme, XDialogTheme? dialogTheme) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectionList(
            elements,
            selectedItem,
            appBar: widget.appBar ??
                AppBar(
                  backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                  title: const Text("Select Country"),
                ),
            pickerTheme: pickerTheme,
            dialogTheme: dialogTheme,
            countryBuilder: widget.countryBuilder,
            useUiOverlay: widget.useUiOverlay,
            useSafeArea: widget.useSafeArea,
          ),
        ));

    setState(() {
      selectedItem = result ?? selectedItem;
      widget.onChanged!(result ?? selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            // color: widget.pickerTheme!.color,
            // border: widget.pickerTheme!.border,

            ),
        width: widget.width,
        // padding: widget.pickerTheme!.padding,
        child: TextField(
          autofocus: true,
          // style: widget.pickerTheme!.codeTextStyle,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            prefixIcon: _buildCountryCodeSelector(context),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ));
  }

  TextButton _buildCountryCodeSelector(BuildContext context) {
    return TextButton(
      onPressed: () {
        _awaitFromSelectScreen(context, widget.appBar, widget.pickerTheme, widget.dialogTheme);
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
                      child: Image.asset(selectedItem!.flagUri!, package: "country_list_picker", width: 32.0),
                    ),
                  ),
                if (widget.pickerTheme?.isShowCode ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        selectedItem.toString(),
                        style: widget.pickerTheme?.codeTextStyle,
                      ),
                    ),
                  ),
                if (widget.pickerTheme?.isShowTitle ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(selectedItem!.toCountryStringOnly()),
                    ),
                  ),
                if (widget.pickerTheme?.isDownIcon ?? true == true)
                  const Flexible(
                    child: Icon(Icons.keyboard_arrow_down),
                  )
              ],
            ),
    );
  }
}
