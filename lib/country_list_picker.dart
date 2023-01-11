library country_list_picker;

// imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/picker_provider.dart';
import '../model/languages.dart';
import '../support/countires_multi_languages_list.dart';
import '../selection_list.dart';
import '../model/country.dart';
import '../model/countries.dart';
import '../theme/country_list_dialog_theme.dart';
import '../theme/input_theme.dart';
import '../widget/input_filed.dart';

// exports
export '../theme/country_list_dialog_theme.dart';
export '../theme/input_theme.dart';
export '../model/country.dart';
export '../model/countries.dart';
export '../extensions.dart';
export '../widget/mask_text_input_formtter.dart';

class CountryListPicker extends StatefulWidget {
  const CountryListPicker({
    super.key,
    // Initial
    this.initialCountry = Countries.Egypt,
    this.localCountry,
    this.language = Languages.English,
    this.textDirection,
    // Main
    this.isShowCountryTitle = true,
    this.isShowFlag = true,
    this.flagSize = const Size(40.0, 40.0),
    this.isShowDialingCode = true,
    this.iconDown = const Icon(Icons.keyboard_arrow_down, size: 24),
    this.isShowDownIcon = true,
    this.isShowTextField = true,
    // Style
    this.margin = const EdgeInsets.all(5.0),
    this.padding = const EdgeInsets.all(0.0),
    this.border = const UnderlineInputBorder(),
    this.dialCodeTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.countryNameTextStyle = const TextStyle(fontSize: 15, color: Colors.grey),
    this.dialogTheme = const CountryListDialogTheme(),
    this.inputTheme = const InputThemeData(),
    // Events
    this.onCountryChanged,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.controller,
  }) : assert(isShowFlag == true || isShowDialingCode == true, "Both isShowFlag and isShowCode can't be false");

  ///Use with the [Countries] Enumration Type to show specific contry.
  ///Countries are identified by their name as listed below, e.g. [Countries.Egypt].
  ///default value is [Countries.Egypt]
  final Countries initialCountry;

  ///Use with the [Countries] Enumration Type to show specific contry.
  ///Countries are identified by their name as listed below, e.g. [Countries.Egypt].
  ///default value is [null]
  final Countries? localCountry;

  ///Use with the [Languages] Enumration Type to show specific language.
  ///Languages are identified by their name as listed below, e.g. [Language.Arabic].
  ///default value is [Language.English]
  final Languages language;

  /// A direction in which text flows.
  ///
  /// Some languages are written from the left to the right (for example, English,
  /// Tamil, or Chinese), while others are written from the right to the left (for
  /// example Aramaic, Hebrew, or Urdu). Some are also written in a mixture, for
  /// example Arabic is mostly written right-to-left, with numerals written
  /// left-to-right.
  ///
  /// The text direction must be provided to APIs that render text or lay out
  /// boxes horizontally, so that they can determine which direction to start in:
  /// either right-to-left, [TextDirection.rtl]; or left-to-right,
  /// [TextDirection.ltr].
  final TextDirection? textDirection;

  ///[isShowFlag] is a [bool] variable that determines whether or not to display the flag of the country.
  ///If set to true, the flage will be shown, and if set to false, the flag will be hidden.
  ///This variable is declared as final, indicating that it can't be reassigned after being initialized.
  final bool isShowFlag;

  ///[flagSize] is a [Size] variable that stores the size of the flag to be displayed.
  final Size flagSize;

  ///[isShowCountryTitle] is a [bool] variable that determines whether or not to display the title of the country.
  ///If set to true, the title will be shown, and if set to false, the title will be hidden.
  ///This variable is declared as final, indicating that it can't be reassigned after being initialized.
  final bool isShowCountryTitle;

  ///[isShowDialingCode] is a [bool] variable that determines whether or not to display the dialing code of the country.
  ///If set to true, the dialing code will be shown, and if set to false, the dialing code will be hidden.
  ///This variable is declared as final, indicating that it can't be reassigned after being initialized.
  final bool isShowDialingCode;

  ///[isShowDownIcon] is a [bool] variable that determines whether or not to display the down icon.
  ///If set to true, the down icon will be shown, and if set to false, the down icon will be hidden.
  ///This variable is declared as final, indicating that it can't be reassigned after being initialized.
  final bool isShowDownIcon;
  
  final Icon iconDown;

  final bool isShowTextField;

  // Style

  final EdgeInsets margin;

  /// The amount of space by which to inset the child.
  final EdgeInsets padding;

  final InputBorder border;

  final TextStyle dialCodeTextStyle;

  final TextStyle countryNameTextStyle;

  final CountryListDialogTheme dialogTheme;

  final InputThemeData inputTheme;

  // Events
  final ValueChanged<Country>? onCountryChanged;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;

  @override
  State<CountryListPicker> createState() => _CountryListPickerState();
}

class _CountryListPickerState extends State<CountryListPicker> {
  Country? selectedCountry;
  bool inputOnFocus = false;
  FocusNode focusNode = FocusNode();
  List<Country> countries = [];

  @override
  Widget build(BuildContext context) {
    countriesMultiLanguagesList.removeWhere((element) => element['dialing_code'] == null);
    countries = countriesMultiLanguagesList.map((element) {
      return Country(
        iso_3166_1_alpha2: element['iso_3166_1_alpha2'],
        iso_3166_1_alpha3: element['iso_3166_1_alpha3'],
        name: (element[widget.language.iso_639_2_alpha3].runtimeType == String)
            ? Name(
                common: element[widget.language.iso_639_2_alpha3], official: element[widget.language.iso_639_2_alpha3])
            : Name(
                common: element[widget.language.iso_639_2_alpha3]['common'],
                official: element[widget.language.iso_639_2_alpha3]['official']),
        dialing_code: (element['dialing_code'] == null) ? "" : element['dialing_code'],
        default_number_length: element['default_number_length'],
        default_number_format: element['default_number_format'],
        local_number_sample: element['local_number_sample'],
        flagUri: 'assets/flags/${element['iso_3166_1_alpha2'].toLowerCase()}.png',
      );
    }).toList();
    countries.removeWhere((element) => element.name.common[0] == "F");
    countries.sort((a, b) => a.name.common.compareTo(b.name.common));

    selectedCountry = selectedCountry == null
        ? countries.firstWhere(
            (Country e) => (e.iso_3166_1_alpha3.toUpperCase() == widget.initialCountry.iso_3166_1_alpha3.toUpperCase()),
            orElse: () => countries[0])
        : countries.firstWhere((element) => element.iso_3166_1_alpha3 == selectedCountry!.iso_3166_1_alpha3);
    return Directionality(
      textDirection: widget.textDirection ?? Directionality.of(context),
      child: Scaffold(
        body: Container(
          margin: widget.margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: widget.padding.top,
                  right: widget.padding.right + 5.0,
                  bottom: widget.padding.bottom,
                  left: widget.padding.left + 5.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: widget.border.isOutline ? BorderRadius.circular(4) : null,
                    border: (widget.inputTheme.border == InputBorder.none || widget.isShowTextField == false) &&
                            widget.border != InputBorder.none
                        ? widget.border.isOutline
                            ? inputOnFocus == true || widget.isShowTextField == false
                                ? Border.all(
                                    color: Theme.of(context).colorScheme.primary, width: widget.border.borderSide.width)
                                : Border.all(color: Theme.of(context).hintColor, width: 1)
                            : inputOnFocus == true || widget.isShowTextField == false
                                ? Border(
                                    bottom: BorderSide(
                                        color: Theme.of(context).colorScheme.primary,
                                        width: widget.border.borderSide.width))
                                : Border(bottom: BorderSide(color: Theme.of(context).hintColor, width: 1))
                        : null),
                child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  InkWell(
                    onTap: (widget.onCountryChanged == null) ? null : () async => await _onTapEvent(context),
                    child: _buildMainPart(selectedCountry!),
                  ),
                  if (widget.isShowTextField == true)
                    InputField(
                      inputTheme: widget.inputTheme,
                      onChanged: widget.onChanged,
                      onEditingComplete: widget.onEditingComplete,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      onSaved: widget.onSaved,
                      onTap: widget.onTap,
                      focusNode: focusNode
                        ..addListener(() {
                          inputOnFocus = focusNode.hasFocus;
                          setState(() {});
                        }),
                    ),
                ]),
              ),
              if (widget.isShowCountryTitle == true)
                Text(
                  selectedCountry != null
                      ? selectedCountry!.name.common
                      : countries
                          .firstWhere(
                              (Country e) => (e.iso_3166_1_alpha3.toUpperCase() ==
                                  widget.initialCountry.iso_3166_1_alpha3.toUpperCase()),
                              orElse: () => countries[0])
                          .name
                          .common,
                  style: widget.countryNameTextStyle.copyWith(
                      fontWeight: widget.countryNameTextStyle.fontWeight,
                      fontSize: widget.countryNameTextStyle.fontSize ?? 15,
                      color: widget.countryNameTextStyle.color ?? Colors.grey,
                      overflow: TextOverflow.ellipsis),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapEvent(BuildContext context) async {
    final Country? result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<SettingsProvider>(
                  create: (_) => SettingsProvider(elements: countries),
                  builder: (_, child) {
                    return SelectionList(
                      countries,
                      language: widget.language,
                      textDirection: widget.textDirection ?? Directionality.of(context),
                      selectedCountry: selectedCountry!,
                      localCountry: (widget.localCountry == null)
                          ? null
                          : countries.firstWhere(
                              (Country e) => (e.iso_3166_1_alpha3.toUpperCase() ==
                                  widget.localCountry!.iso_3166_1_alpha3.toUpperCase()),
                            ),
                      appBar: widget.dialogTheme.appBar ??
                          AppBar(
                              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                              title: const Text("Select your country")),
                      dialogTheme: widget.dialogTheme,
                    );
                  },
                )));

    if (result != null) {
      selectedCountry = result;
      if (widget.onCountryChanged != null) widget.onCountryChanged!(selectedCountry!);
      setState(() {});
    }
  }

  Row _buildMainPart(Country country) {
    return Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
      //flage
      if (widget.isShowFlag == true)
        Flexible(
            child: Image.asset("assets/flags/${country.iso_3166_1_alpha2.toLowerCase()}.png",
                package: "country_list_picker",
                fit: BoxFit.fill,
                height: widget.flagSize.height,
                width: widget.flagSize.width)),
      //code
      if (widget.isShowDialingCode == true)
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(country.dialing_code.toString(),
                  style: widget.dialCodeTextStyle.copyWith(
                      color: widget.dialCodeTextStyle.color ?? Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: widget.dialCodeTextStyle.fontSize ?? 16,
                      fontWeight: widget.dialCodeTextStyle.fontWeight ?? FontWeight.bold)),
            )),

      //down icon
      if (widget.isShowDownIcon == true)
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: Icon(
              widget.iconDown.icon,
              size: widget.iconDown.size,
              color: (widget.iconDown.color) ?? Theme.of(context).colorScheme.primary,
              semanticLabel: widget.iconDown.semanticLabel,
              textDirection: widget.iconDown.textDirection,
              shadows: widget.iconDown.shadows,
              key: widget.iconDown.key,
            )),
    ]);
  }
}
