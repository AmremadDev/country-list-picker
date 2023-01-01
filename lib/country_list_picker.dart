library country_list_picker;

// imports

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/picker_provider.dart';
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

/// Shows a bottom sheet containing a list of countries to select one.
///
/// The callback function [onSelect] call when the user select a country.
/// The function called with parameter the country that the user has selected.
/// If the user cancels the bottom sheet, the function is not call.
///
///  An optional [exclude] argument can be used to exclude(remove) one ore more
///  country from the countries list. It takes a list of country code(iso2).
///
/// An optional [countryFilter] argument can be used to filter the
/// list of countries. It takes a list of country code(iso2).
/// Note: Can't provide both [countryFilter] and [exclude]
///
/// An optional [favorite] argument can be used to show countries
/// at the top of the list. It takes a list of country code(iso2).
///
/// An optional [showPhoneCode] argument can be used to show phone code.
///
/// [countryListTheme] can be used to customizing the country list bottom sheet.
///
/// [onClosed] callback which is called when CountryPicker is dismiss,
/// whether a country is selected or not.
///
/// [searchAutofocus] can be used to initially expand virtual keyboard
///
/// An optional [showSearch] argument can be used to show/hide the search bar.
///
/// The `context` argument is used to look up the [Scaffold] for the bottom
/// sheet. It is only used when the method is called. Its corresponding widget
/// can be safely removed from the tree before the bottom sheet is closed.
class CountryListPicker extends StatelessWidget {
  /// Creates a country list picker widget.
  ///
  const CountryListPicker(
      {super.key,
      this.initialCountry = Countries.Egypt,
      this.localCountry,
      this.isShowCountryTitle = true,
      this.isShowFlag = true,
      this.flagSize = const Size(40.0, 40.0),
      this.isShowCode = true,
      this.iconDown = const Icon(Icons.keyboard_arrow_down, size: 24),
      this.isDownIcon = true,
      this.isShowTextField = true,
      this.margin = const EdgeInsets.all(5.0),
      this.padding = const EdgeInsets.all(0.0),
      this.border = const UnderlineInputBorder(),
      this.dialCodeTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      this.countryNameTextStyle = const TextStyle(fontSize: 15, color: Colors.grey),
      this.onCountryChanged,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.onTap,
      this.controller,
      this.dialogTheme = const CountryListDialogTheme(),
      this.inputTheme = const InputThemeData()})
      : assert(isShowFlag == true || isShowCode == true, "Both isShowFlag and isShowCode can't be false");

  ///Use with the [Countries] Enumration Type to show specific contry.
  ///countries are identified by their name as listed below, e.g. [Countries.Egypt].
  final Countries initialCountry;

  ///Use with the [Countries] Enumration Type to show specific contry.
  ///countries are identified by their name as listed below, e.g. [Countries.Egypt].
  final Countries? localCountry;

  /// If true country flag will be appear.
  /// Both [isShowFlag] and [isShowCode] can't be false
  final bool isShowFlag;

  final Size flagSize;

  /// If true country title will be appear at left bottom.
  /// Both [isShowFlag] and [isShowCode] can't be false
  final bool isShowCountryTitle;

  /// If true country dial code will be appear.
  final bool isShowCode;

  final Icon iconDown;

  /// If true country flag down icon be appear.
  final bool isDownIcon;

  ///If true country TextField will be appear.
  final bool isShowTextField;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsets margin;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  ///
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  final EdgeInsets padding;

  /// A border to draw above the background [color], [gradient], or [image].
  /// Use [Border] objects to describe borders that do not depend on the reading
  /// direction.
  final InputBorder border;

  // final InputBorder inputBorder;

  ///Country dial Code Text Style.
  final TextStyle dialCodeTextStyle;

  ///Country title Text Style.
  final TextStyle countryNameTextStyle;

  /// {@template country_list_picker.onChanged}
  /// Called when the user selects an item.
  ///
  /// If the [onCountryChanged] callback is null then clickable part will be disabled.
  final ValueChanged<Country>? onCountryChanged;

  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;

  // ///
  // final Widget Function(BuildContext context, Country? countryCode)? pickerBuilder;

  // ///
  // final Widget Function(BuildContext context, Country? country)? dialogBuilder;

  ///
  ///[tileheight] must be greater than 50.0
  final CountryListDialogTheme dialogTheme;

  final InputThemeData inputTheme;

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return ChangeNotifierProvider<SettingsProvider>(
      create: (context) => SettingsProvider(),
      builder: (context, child) {
        return Container(
          margin: margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<SettingsProvider>(
                builder: (context, settings, child) => Container(
                  padding: EdgeInsets.only(
                    top: padding.top,
                    right: padding.right + 5.0,
                    bottom: padding.bottom,
                    left: padding.left + 5.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: border.isOutline ? BorderRadius.circular(4) : null,
                      border: (inputTheme.border == InputBorder.none || isShowTextField == false) &&
                              border != InputBorder.none
                          ? border.isOutline
                              ? settings.inputOnFocus == true || isShowTextField == false
                                  ? Border.all(color: Theme.of(context).colorScheme.primary, width: border.borderSide.width )
                                  : Border.all(color: Theme.of(context).hintColor, width: 1)
                              : settings.inputOnFocus == true || isShowTextField == false
                                  ? Border(bottom: BorderSide(color: Theme.of(context).colorScheme.primary, width: border.borderSide.width))
                                  : Border(bottom: BorderSide(color: Theme.of(context).hintColor, width: 1))
                          : null),
                  child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    InkWell(
                      onTap: (onCountryChanged == null) ? null : () async => await _onTapEvent(context),
                      child: _buildMainPart(),
                    ),
                    if (isShowTextField == true)
                      InputField(
                        inputTheme: inputTheme,
                        onChanged: onChanged,
                        onEditingComplete: onEditingComplete,
                        onFieldSubmitted: onFieldSubmitted,
                        onSaved: onSaved,
                        onTap: onTap,
                        focusNode: focusNode
                          ..addListener(() {
                            settings.inputOnFocus = focusNode.hasFocus;
                          }),
                      ),
                  ]),
                ),
              ),
              if (isShowCountryTitle == true)
                Selector<SettingsProvider, Country>(
                  selector: (context, settings) => settings.selectedCountry,
                  builder: (context, country, child) => Text(
                    country.englishName.common,
                    style: countryNameTextStyle.copyWith(
                        fontWeight: countryNameTextStyle.fontWeight,
                        fontSize: countryNameTextStyle.fontSize ?? 15,
                        color: countryNameTextStyle.color ?? Colors.grey,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  Future<void> _onTapEvent(BuildContext context) async {
    SettingsProvider settings = context.read<SettingsProvider>();
    final Country? result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<SettingsProvider>(
                  create: (context) => SettingsProvider(),
                  builder: (context, child) {
                    return SelectionList(
                      settings.countries,
                      initialCountry: settings.selectedCountry,
                      appBar: dialogTheme.appBar ??
                          AppBar(
                              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                              title: const Text("Select your country")),
                      dialogTheme: dialogTheme,
                    );
                  },
                )));
    settings.selectedCountry = result ?? settings.selectedCountry;
    if (onCountryChanged != null) onCountryChanged!(settings.selectedCountry);
  }

  Selector<SettingsProvider, Country> _buildMainPart() {
    return Selector<SettingsProvider, Country>(
        selector: (context, settings) => settings.selectedCountry,
        builder: (context, country, child) =>
            Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
              //flage
              if (isShowFlag == true)
                Flexible(
                    child: Image.asset("assets/flags/${country.alpha2.toLowerCase()}.png",
                        package: "country_list_picker",
                        fit: BoxFit.fill,
                        height: flagSize.height,
                        width: flagSize.width)),
              //code
              if (isShowCode == true)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.5),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(country.callingCode.toString(),
                          style: dialCodeTextStyle.copyWith(
                              color: dialCodeTextStyle.color ?? Theme.of(context).textTheme.titleLarge?.color,
                              fontSize: dialCodeTextStyle.fontSize ?? 16,
                              fontWeight: dialCodeTextStyle.fontWeight ?? FontWeight.bold)),
                    )),

              //down icon
              if (isDownIcon == true)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.5),
                    child: Icon(
                      iconDown.icon,
                      size: iconDown.size,
                      color: (iconDown.color) ?? Theme.of(context).colorScheme.primary,
                      semanticLabel: iconDown.semanticLabel,
                      textDirection: iconDown.textDirection,
                      shadows: iconDown.shadows,
                      key: iconDown.key,
                    )),
            ]));
  }
}
