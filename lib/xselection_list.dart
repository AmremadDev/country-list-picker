import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getworld/scr/country.dart';
import 'package:provider/provider.dart';
import 'package:xcountry/widget/xcurrent_location_field.dart';

import './widget/alphabetscroll.dart';
import './models/picker_theme.dart';
import './models/dialog_theme.dart';
import './models/csettings_controller.dart';

import './widget/country_listtile.dart';
import './widget/xtitle.dart';
import './widget/xsearch_field.dart';

// ignore: must_be_immutable
class XSelectionList extends StatelessWidget {
  XSelectionList(
    this.elements, {
    Key? key,
    this.initialCountry,
    this.appBar,
    this.pickerTheme,
    this.dialogTheme = const CDialogTheme(),
    this.dialogBuilder,
    this.useUiOverlay = true,
    this.useSafeArea = false,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final List<Country> elements;
  final Country? initialCountry;
  final CPickerTheme? pickerTheme;
  final CDialogTheme dialogTheme;
  final Widget Function(BuildContext context, Country? country)? dialogBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  final TextEditingController _controller = TextEditingController();
  final ScrollController _controllerScroll = ScrollController();

  int _boxes = 0;

  @override
  Widget build(BuildContext context) {
    _intialValues(context);
    Widget scaffold = Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: (dialogTheme.isShowFloatButton && context.watch<CSettings>().floatbutton)
            ? FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                mini: true,
                child: const Icon(Icons.arrow_upward),
                onPressed: () {
                  _controllerScroll.jumpTo(0);
                },
              )
            : null,
        appBar: appBar,
        body: Container(
            color: dialogTheme.backgroundColor,
            child: Stack(
              children: <Widget>[
                CustomScrollView(
                  controller: _controllerScroll,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(children: [
                        (dialogTheme.isShowSearch)
                            ? XSearchField(dialogTheme: dialogTheme, controller: _controller, elements: elements)
                            : const SizedBox.shrink(),
                        (dialogTheme.isShowCurrentLocation)
                            ? XCurrentLocationField(dialogTheme: dialogTheme, countries: elements)
                            : const SizedBox.shrink(),
                        (dialogTheme.isShowLastPickCountry)
                            ? Column(children: [
                                XTitle(
                                  title: dialogTheme.lastPickText,
                                  background: dialogTheme.titlesBackground,
                                  titlesStyle: dialogTheme.titlesStyle,
                                  height: dialogTheme.rowHeight,
                                ),
                                CountryListTile(
                                  country: initialCountry!,
                                  dialogTheme: dialogTheme,
                                  isLastpick: true,
                                ),
                              ])
                            : const SizedBox.shrink(),
                        (_boxes == 0) ? const SizedBox.shrink() : Container(height: 10, color: dialogTheme.titlesBackground)
                      ]),
                    ),
                    Selector<CSettings, List<Country>>(
                      selector: (context, model) => model.countries,
                      builder: (context, value, child) => SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return dialogBuilder != null
                              ? dialogBuilder!(context, value.elementAt(index))
                              : CountryListTile(
                                  country: value.elementAt(index),
                                  dialogTheme: dialogTheme,
                                );
                        }, childCount: value.length),
                      ),
                    )
                  ],
                ),
                (dialogTheme.isShowAphabetScroll == false)
                    ? const SizedBox.shrink()
                    : XAlphabetScroll(
                        scrollController: _controllerScroll,
                        dialogTheme: dialogTheme,
                        alphabet: elements.map((e) => e.name.common[0]).toSet().toList(),
                        countries: elements,
                        unitsCanceled: _boxes,
                      )
              ],
            )));

    return useSafeArea ? SafeArea(child: scaffold) : scaffold;
  }

  void _intialValues(BuildContext context) {
    _boxes = 0;
    if (dialogTheme.isShowSearch == true) _boxes += 2;
    if (dialogTheme.isShowCurrentLocation == true) _boxes += 2;
    if (dialogTheme.isShowLastPickCountry == true) _boxes += 2;

    if (useUiOverlay) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Theme.of(context).primaryColor,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.blue,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarContrastEnforced: true));
    }

    _controllerScroll.addListener(() {
      CSettings settings = context.read<CSettings>();
      settings.changeIsShowFloatButton(_controllerScroll.position.pixels != 0);

      int scrollPosition = ((_controllerScroll.position.pixels) / dialogTheme.rowHeight).round();

      if (scrollPosition < _boxes) {
        settings.changeSelectedPosition(-1);
      } else if (scrollPosition >= _boxes && scrollPosition <= settings.countries.length) {
        int newPos = settings.countries.elementAt(scrollPosition - _boxes).name.common[0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
        if (newPos != settings.posSelected) settings.changeSelectedPosition(newPos);
      }
    });
  }
}
