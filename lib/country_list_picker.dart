library x_country_list_picker;


import 'package:flutter/material.dart';
import './xSelectionList.dart';
import './support/code_country.dart';
import './xDialogTheme.dart';
import './xPickerTheme.dart';
import './support/code_countries_en.dart';
import './support/code_countrys.dart';
export './support/code_country.dart';


class CountryListPicker extends StatefulWidget {
  const CountryListPicker(
      {super.key,
      this.onChanged,
      this.initialSelection,
      this.appBar,
      this.pickerBuilder,
      this.countryBuilder,
      this.pickerTheme,
      this.dialogTheme,
      this.width,
      this.useUiOverlay = true,
      this.useSafeArea = false});

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
  // ignore: no_logic_in_create_state, library_private_types_in_public_api
  _CountryListPickerState createState() {
    List<Map> jsonList = pickerTheme?.showEnglishName ?? true ? countriesEnglish : codes;

    List<Country> elements = jsonList
        .map((s) => Country(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              Length: s['length'],
              flagUri: 'flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();
    return _CountryListPickerState(elements);
  }
}

class _CountryListPickerState extends State<CountryListPicker> {
  Country? selectedItem;
  List<Country> elements = [];

  _CountryListPickerState(this.elements);

  @override
  void initState() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) =>
              (e.code!.toUpperCase() == widget.initialSelection!.toUpperCase()) ||
              (e.dialCode == widget.initialSelection),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    super.initState();
  }

  void _awaitFromSelectScreen(BuildContext context, PreferredSizeWidget? appBar, XPickerTheme? pickerTheme,XDialogTheme? dialogTheme) async {
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
          
        decoration: BoxDecoration(
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
                      child: Image.asset(
                        
                        selectedItem!.flagUri!, 
                        package: "country_list_picker",
                        width: 32.0),
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



