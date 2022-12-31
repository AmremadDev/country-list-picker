import 'package:country_list_picker/provider/picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../widget/lastpick_tile.dart';
import '../widget/alphabet_scroll.dart';
import 'theme/country_list_dialog_theme.dart';
import '../widget/country_list_tile.dart';
import '../model/country.dart';
import '../widget/current_location_tile.dart';
import '../widget/search_tile.dart';

// ignore: must_be_immutable
class SelectionList extends StatelessWidget {
  SelectionList(
    this.elements, {
    Key? key,
    required this.initialCountry,
    this.appBar,
    this.dialogTheme = const CountryListDialogTheme(),
    this.dialogBuilder,
    this.useUiOverlay = true,
    this.useSafeArea = false,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final List<Country> elements;
  final Country initialCountry;
  final CountryListDialogTheme dialogTheme;
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
        floatingActionButton: dialogTheme.isShowFloatButton
            ? Selector<SettingsProvider, bool>(
                selector: (context, settings) => settings.isShowFloatButton,
                builder: (context, show, child) => show
                    ? FloatingActionButton(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        elevation: 0,
                        mini: true,
                        child: const Icon(Icons.arrow_upward),
                        onPressed: () => _controllerScroll.jumpTo(0))
                    : const SizedBox.shrink(),
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
                        if (dialogTheme.searchTileTheme.visible)
                          SearchTile(
                              dialogTheme: dialogTheme,
                              controller: _controller,
                              elements: elements),
                        if (dialogTheme.currentLocationTileTheme.visible)
                          CurrentLocationTile(dialogTheme: dialogTheme, countries: elements),
                        if (dialogTheme.lastPickTileTheme.visible)
                          LastPickTile(dialogTheme: dialogTheme, country: initialCountry),
                        (_boxes == 0)
                            ? const SizedBox.shrink()
                            : Container(height: 10, color: dialogTheme.titlesBackground)
                      ]),
                    ),
                    Selector<SettingsProvider, List<Country>>(
                      selector: (context, settings) => settings.countries,
                      builder: (context, countries, child) => SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return dialogBuilder != null
                              ? dialogBuilder!(context, countries.elementAt(index))
                              : CountryListTile(
                                  country: countries.elementAt(index),
                                  dialogTheme: dialogTheme,
                                );
                        }, childCount: countries.length),
                      ),
                    ),
                  ],
                ),
                (dialogTheme.alphabetsBarTheme.visible == false)
                    ? const SizedBox.shrink()
                    : AlphabetScroll(
                        scrollController: _controllerScroll,
                        dialogTheme: dialogTheme,
                        alphabet: elements.map((e) => e.englishName.common[0]).toSet().toList(),
                        countries: elements,
                        unitsCanceled: _boxes,
                      )
              ],
            )));
    return useSafeArea ? SafeArea(child: scaffold) : scaffold;
  }

  void _intialValues(BuildContext context) {
    _boxes = 0;
    if (dialogTheme.searchTileTheme.visible == true) _boxes += 2;
    if (dialogTheme.currentLocationTileTheme.visible == true) _boxes += 2;
    if (dialogTheme.lastPickTileTheme.visible == true) _boxes += 2;

    if (useUiOverlay) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.primary,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Theme.of(context).colorScheme.primary,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.blue,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarContrastEnforced: true));
    }

    _controllerScroll.addListener(() {
      SettingsProvider settings = context.read<SettingsProvider>();
      settings.isShowFloatButton = _controllerScroll.position.pixels != 0;

      int scrollPosition = ((_controllerScroll.position.pixels) / dialogTheme.tileHeight).round();

      if (scrollPosition < _boxes) {
        settings.selectedPosition = -1;
      } else if (scrollPosition >= _boxes && scrollPosition <= settings.countries.length) {
        int newPos = settings.countries
                .elementAt(scrollPosition - _boxes)
                .englishName
                .common[0]
                .toUpperCase()
                .codeUnitAt(0) -
            'A'.codeUnitAt(0);
        if (newPos != settings.selectedPosition) settings.selectedPosition = newPos;
      }
    });
  }
}
