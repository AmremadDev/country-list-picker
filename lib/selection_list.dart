import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/country.dart';
import '../model/languages.dart';
import '../provider/picker_provider.dart';
import '../widget/lastpick_tile.dart';
import '../widget/alphabet_scroll.dart';
import '../widget/current_location_tile.dart';
import '../widget/country_list_tile.dart';
import '../widget/search_tile.dart';
import '../theme/dialog_theme.dart';

class SelectionList extends StatelessWidget {
  SelectionList(
    this.elements, {
    super.key,
    required this.selectedCountry,
    this.localCountry,
    this.appBar,
    this.dialogTheme = const DialogThemeData(),
    this.textDirection = TextDirection.ltr,
    required this.language,
  });

  final PreferredSizeWidget? appBar;
  final List<Country> elements;
  final Country selectedCountry;
  final Country? localCountry;
  final TextDirection textDirection;
  final Languages language;
  final DialogThemeData dialogTheme;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int boxes = 0;
    ScrollController controllerScroll = ScrollController();

    controllerScroll.addListener(() {
      SettingsProvider settings = context.read<SettingsProvider>();
      settings.isShowFloatButton = controllerScroll.position.pixels != 0;
      int scrollPosition = ((controllerScroll.position.pixels) / dialogTheme.tileHeight).round();

      if (scrollPosition < boxes) {
        settings.selectedCharacter = null;
      } else if (scrollPosition >= boxes && scrollPosition <= elements.length) {
        settings.selectedCharacter = elements.elementAt(scrollPosition - boxes).name.common[0];
      }
    });

    if (dialogTheme.isShowSearchTile == true) boxes += 2;
    if (localCountry != null) boxes += 2;
    if (dialogTheme.isShowLastPickTile == true) boxes += 2;

    return Directionality(
      textDirection: textDirection,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: dialogTheme.isShowFloatButton
              ? Selector<SettingsProvider, bool>(
                  selector: (_, settings) => settings.isShowFloatButton,
                  builder: (_, show, child) => show
                      ? FloatingActionButton(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          elevation: 0,
                          mini: true,
                          child: const Icon(Icons.arrow_upward),
                          onPressed: () => controllerScroll.jumpTo(0))
                      : const SizedBox.shrink(),
                )
              : null,
          appBar: appBar,
          body: Container(
              color: dialogTheme.backgroundColor ?? Theme.of(context).colorScheme.surface,
              child: Stack(
                children: <Widget>[
                  CustomScrollView(
                    controller: controllerScroll,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(children: [
                          if (dialogTheme.isShowSearchTile)
                            SearchTile(
                                dialogTheme: dialogTheme,
                                controller: _controller,
                                elements: elements),
                          if (localCountry != null)
                            CurrentLocationTile(
                              dialogTheme: dialogTheme,
                              country: localCountry!,
                              language: language,
                            ),
                          if (dialogTheme.isShowLastPickTile)
                            LastPickTile(
                              dialogTheme: dialogTheme,
                              country: selectedCountry,
                              language: language,
                            ),
                          (boxes == 0)
                              ? const SizedBox.shrink()
                              : Container(
                                  height: 10,
                                  color: dialogTheme.tilesTheme.backgroundColor ??
                                      Theme.of(context).focusColor,
                                )
                        ]),
                      ),
                      Selector<SettingsProvider, List<Country>>(
                        selector: (_, settings) => settings.countries,
                        builder: (_, countries, child) => SliverList(
                          delegate: SliverChildBuilderDelegate((context, index) {
                            return CountryListTile(
                              country: countries.elementAt(index),
                              language: language,
                              dialogTheme: dialogTheme,
                            );
                          }, childCount: countries.length),
                        ),
                      ),
                    ],
                  ),
                  (dialogTheme.isShowAlphabetsBar == false ||
                          language == Languages.Chinese ||
                          language == Languages.Korean ||
                          language == Languages.Japanese)
                      ? const SizedBox.shrink()
                      : Consumer<SettingsProvider>(builder: (context, settings, child) {
                          return AlphabetScroll(
                            scrollController: controllerScroll,
                            selectedChar: settings.selectedCharacter,
                            dialogTheme: dialogTheme,
                            alphabet: elements.map((e) => e.name.common[0]).toSet().toList(),
                            countries: elements,
                            unitsCanceled: boxes,
                          );
                        }),
                ],
              ))),
    );
  }
}
