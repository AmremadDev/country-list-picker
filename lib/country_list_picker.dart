library country_list_picker;

// imports

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../selection_list.dart';
import '../models/country.dart';
import '../contollers/countrylistPicker_controller.dart';
import '../themes/country_list_dialog_theme.dart';
import '../models/countries.dart';

// exports
export '../themes/country_list_dialog_theme.dart';
export '../models/country.dart';
export '../models/countries.dart';

class CountryListPicker extends StatelessWidget {
  /// Creates a country list picker widget.
  ///
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
    this.dialCodeTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.textFieldTextStyle = const TextStyle(fontSize: 16),
    this.titleTextStyle = const TextStyle(fontSize: 15, color: Colors.grey),
    this.onChanged,
    this.pickerBuilder,
    this.dialogBuilder,
    this.useUiOverlay = false,
    this.useSafeArea = false,
    this.dialogTheme = const CountryListDialogTheme(),
  })  : assert(dialogTheme.tileHeight >= 50.0, "tileheight must be greater than 50.0"),
        assert(isShowFlag == true || isShowCode == true,
            "Both isShowFlag and isShowCode can't be false");

  ///Use with the [Countries] Enumration Type to show specific contry. countries are identified by their name as listed below, e.g. [Countries.Egypt].
  final Countries initialCountry;

  /// If true country flag will be appear.
  /// Both [isShowFlag] and [isShowCode] can't be false
  final bool isShowFlag;

  /// If true country title will be appear at left bottom.
  /// Both [isShowFlag] and [isShowCode] can't be false
  final bool isShowTitle;

  /// If true country dial code will be appear.
  final bool isShowCode;

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
  ///
  /// Follows the [shape] and [borderRadius].
  ///
  /// Use [Border] objects to describe borders that do not depend on the reading
  /// direction.
  ///
  /// Use [BoxBorder] objects to describe borders that should flip their left
  /// and right edges based on whether the text is being read left-to-right or
  /// right-to-left.
  final BoxBorder? border;

  ///Country dial Code Text Style.
  final TextStyle dialCodeTextStyle;

  ///Phone TextFiled Text Style.
  final TextStyle textFieldTextStyle;

  ///Country title Text Style.
  final TextStyle titleTextStyle;

  /// {@template country_list_picker.onChanged}
  /// Called when the user selects an item.
  ///
  /// If the [onChanged] callback is null then clickable part will be disabled.
  final ValueChanged<Country>? onChanged;

  ///
  final Widget Function(BuildContext context, Country? countryCode)? pickerBuilder;

  ///
  final Widget Function(BuildContext context, Country? country)? dialogBuilder;

  ///Whether to allow the widget to set a custom UI overlay
  final bool useUiOverlay;

  ///Whether the country list picker should be wrapped in a SafeArea
  final bool useSafeArea;

  ///
  ///[tileheight] must be greater than 50.0
  final CountryListDialogTheme dialogTheme;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountryListPickerController>(
      create: (context) => CountryListPickerController(initialCountry: Countries.Egypt),
      builder: (context, child) {
        return Container(
          margin: margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: padding.top,
                    right: padding.right + 5.0,
                    bottom: padding.bottom,
                    left: padding.left + 5.0),
                decoration: BoxDecoration(
                    border: border ?? Border.all(width: 1, color: Theme.of(context).primaryColor)),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (onChanged == null)
                            ? null
                            : () => _onChangeEvent(
                                context,
                                context.read<CountryListPickerController>().countries,
                                context.read<CountryListPickerController>().selectedItem),
                        child: _buildMainPart(),
                      ),
                      if (isShowTextField == true)
                        Flexible(
                          child: TextField(
                            style: textFieldTextStyle.copyWith(
                                fontSize: textFieldTextStyle.fontSize ?? 16),
                            maxLength: 15,
                            decoration:
                                const InputDecoration(border: InputBorder.none, counterText: ""),
                          ),
                        )
                    ]),
              ),
              if (isShowTitle == true)
                Selector<CountryListPickerController, Country>(
                    selector: (context, model) => model.selectedItem,
                    builder: (context, value, child) => Text(
                          value.englishName.common,
                          style: titleTextStyle.copyWith(
                              fontSize: titleTextStyle.fontSize ?? 15,
                              color: titleTextStyle.color ?? Colors.grey),
                        )),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onChangeEvent(
      BuildContext context, List<Country> countries, Country selectedItem) async {
    CountryListPickerController controller = context.read<CountryListPickerController>();
    final Country? result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<CountryListPickerController>(
                  create: (context) => CountryListPickerController(initialCountry: Countries.Egypt),
                  builder: (context, child) {
                    return SelectionList(
                      countries,
                      initialCountry: controller.selectedItem,
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
    controller.changeselectedItem(result ?? selectedItem);
    if (onChanged != null) onChanged!(selectedItem);
  }

  Selector<CountryListPickerController, Country> _buildMainPart() {
    return Selector<CountryListPickerController, Country>(
        selector: (context, model) => model.selectedItem,
        builder: (context, value, child) => Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                            style: dialCodeTextStyle.copyWith(
                                fontSize: dialCodeTextStyle.fontSize ?? 16,
                                fontWeight: dialCodeTextStyle.fontWeight ?? FontWeight.bold))),
                  //down icon
                  if (isDownIcon == true)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor),
                    ),
                ]));
  }
}
