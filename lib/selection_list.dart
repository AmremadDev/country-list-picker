import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './models/picker_theme.dart';
import './models/dialog_theme.dart';
import 'models/csettings.dart';
import './models/country.dart';
import 'widget/ctitle.dart';

class SelectionList extends StatelessWidget {
  SelectionList(
    this.elements, {
    Key? key,
    this.initialSelection,
    this.appBar,
    this.pickerTheme,
    this.dialogTheme = const CDialogTheme(),
    this.dialogBuilder,
    this.useUiOverlay = true,
    this.useSafeArea = false,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final List<Country> elements;
  final Country? initialSelection;
  final CPickerTheme? pickerTheme;
  final CDialogTheme dialogTheme;
  final Widget Function(BuildContext context, Country? country)? dialogBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  late List<Country> countries;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _controllerScroll = ScrollController();

  late double diff;
  late double _sizeheightcontainer;
  late double _heightscroller;
  String? _oldtext;
  final double itemsizeheight = 50.0;
  double _offsetContainer = 0.0;
  List<String>? _alphabet;

  late int boxes;

  @override
  Widget build(BuildContext context) {
    _intialValues(context);
    Widget scaffold = Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: (dialogTheme.isShowFloatButton && context.read<CSettings>().floatbutton)
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              mini: true,
              child: const Icon(Icons.arrow_upward),
              onPressed: () async {
                await _controllerScroll.animateTo(0,duration: const Duration(milliseconds: 500),curve: Curves.bounceInOut);
              },
            )
          : null,
      appBar: appBar,
      body: Container(
        color: dialogTheme.backgroundColor,
        child: LayoutBuilder(builder: (context, contrainsts) {
          if (dialogTheme.isShowAphabetScroll == true) {
            diff = MediaQuery.of(context).size.height - contrainsts.biggest.height;
            _heightscroller = (contrainsts.biggest.height) / _alphabet!.length;
            _sizeheightcontainer = (contrainsts.biggest.height);
          }
          return Stack(
            children: <Widget>[
              CustomScrollView(
                controller: _controllerScroll,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(children: [
                      (dialogTheme.isShowSearch) ? _buildSearchBox() : const SizedBox.shrink(),
                      (dialogTheme.isShowCurrentLocation) ? _buildCurrentLocationBox(context) : const SizedBox.shrink(),
                      (dialogTheme.isShowLastPickCountry) ? _buildLastPickCountryBox(context) : const SizedBox.shrink(),
                      (boxes == 0) ? const SizedBox.shrink() : Container(height: 10, color: dialogTheme.titlesBackground)
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return dialogBuilder != null
                          ? dialogBuilder!(context, countries.elementAt(index))
                          : _buildCountryListTile(context, countries.elementAt(index));
                    }, childCount: countries.length),
                  ),
                 
                ],
              ),
               _buildAlphabetItems(context),
            ],
          );
        }),
      ),
    );

    return useSafeArea ? SafeArea(child: scaffold) : scaffold;
  }

  void _intialValues(BuildContext context) {
    boxes = 0;
    if (dialogTheme.isShowSearch == true) boxes += 2;
    if (dialogTheme.isShowCurrentLocation == true) boxes += 2;
    if (dialogTheme.isShowLastPickCountry == true) boxes += 2;

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
    countries = elements;
    countries.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
    _alphabet = countries.map((e) => e.name![0]).toSet().toList();
    _controllerScroll.addListener(() {
      context.read<CSettings>().changeIsShowFloatButton(_controllerScroll.position.pixels != 0);
      int newPos;
      int scrollPosition = ((_controllerScroll.position.pixels) / itemsizeheight).round();
      if (scrollPosition < boxes) {
        context.read<CSettings>().changeSelectedPosition(-1);
      } else if (scrollPosition >= boxes && scrollPosition <= countries.length) {
        newPos = countries.elementAt(scrollPosition - boxes).name![0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
        if (newPos != context.read<CSettings>().posSelected) context.read<CSettings>().changeSelectedPosition(newPos);
      }
    });
  }


  Widget _buildAlphabetItems(BuildContext context) {
    
    return (dialogTheme.isShowAphabetScroll == true)
        ? Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if ((_offsetContainer + details.delta.dy) >= 0 && (_offsetContainer + details.delta.dy) <= (_sizeheightcontainer - _heightscroller)) {
                  _offsetContainer += details.delta.dy;

                  context.read<CSettings>().posSelected = ((_offsetContainer / _heightscroller) % _alphabet!.length).round();

                  if (_alphabet![context.read<CSettings>().posSelected] != _oldtext) {
                    int pos = countries.indexWhere((c) => c.name!.toUpperCase().startsWith(_alphabet![context.read<CSettings>().posSelected]));
                    ((pos + boxes) * itemsizeheight <= _controllerScroll.position.maxScrollExtent)
                        ? _controllerScroll.jumpTo((pos + boxes) * itemsizeheight)
                        : _controllerScroll.jumpTo(_controllerScroll.position.maxScrollExtent);
                    _oldtext = _alphabet![context.read<CSettings>().posSelected];
                  }
                }
              },
              onVerticalDragStart: (details) {
                _offsetContainer = details.globalPosition.dy - diff;
              },
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Colors.transparent,
                  child: Consumer<CSettings>(
                    builder: (context, value, child) => Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [...List.generate(_alphabet!.length, (index) => _buildAlphabetItem(context, value, index))],
                    ),
                  )),
            ),
          )
        : const SizedBox.shrink();
  }

  Column _buildSearchBox() {
    return Column(children: [
      CTitle(title: dialogTheme.searchText, background: dialogTheme.titlesBackground, titlesStyle: dialogTheme.titlesStyle, height: 50),
      Container(
        color: Colors.white,
        height: itemsizeheight,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
              hintText: dialogTheme.searchHintText),
          onChanged: ((value) {
            String s = value.toUpperCase();

            countries = elements.where((e) => e.dialCode!.startsWith(s) || e.name!.toUpperCase().startsWith(s)).toList();
          }),
        ),
      ),
    ]);
  }

  Column _buildCurrentLocationBox(BuildContext context) {
    Country country = elements.singleWhere((element) => element.code == WidgetsBinding.instance.window.locale.countryCode);
    return Column(children: [
      CTitle(title: dialogTheme.currentLocationText, background: dialogTheme.titlesBackground, titlesStyle: dialogTheme.titlesStyle, height: 50),
      _buildCountryListTile(context, country),
    ]);
  }

  Column _buildLastPickCountryBox(BuildContext context) {
    return Column(children: [
      CTitle(title: dialogTheme.lastPickText, background: dialogTheme.titlesBackground, titlesStyle: dialogTheme.titlesStyle, height: 50),
      _buildCountryListTile(context, initialSelection!, true),
    ]);
  }

  SizedBox _buildCountryListTile(BuildContext context, Country country, [bool lastpick = false]) {
    return SizedBox(
      height: itemsizeheight,
      child: ListTile(
          leading: (dialogTheme.isShowFlage) ? Image.asset(country.flagUri!, package: 'country_list_picker', width: 30.0) : null,
          title: Text(overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: false, country.name!),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: lastpick
                ? Icon(
                    dialogTheme.lastPickIcon,
                    color: Theme.of(context).primaryColor,
                  )
                : (dialogTheme.isShowDialCode)
                    ? Text(country.dialCode!)
                    : null,
          ),
          onTap: () {
            Navigator.pop(context, country);
          }),
    );
  }

  Widget _buildAlphabetItem(BuildContext context, CSettings settings, int index) {
    return Expanded(
        child: InkWell(
            onTap: () {
              if (_alphabet![index] != _oldtext) {
                int pos = countries.indexWhere((c) => c.name!.toUpperCase().startsWith(_alphabet![index]));

                (itemsizeheight * (pos + boxes) + 10 <= _controllerScroll.position.maxScrollExtent)
                    ? _controllerScroll.jumpTo(itemsizeheight * (pos + boxes) + 10)
                    : _controllerScroll.jumpTo(_controllerScroll.position.maxScrollExtent);
                _oldtext = _alphabet![index];
                settings.changeSelectedPosition(index);
              }
            },
            child: Container(
                width: 50,
                height: itemsizeheight,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == settings.posSelected ? dialogTheme.alphabetSelectedBackgroundColor : dialogTheme.alphabetBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  _alphabet![index],
                  textAlign: TextAlign.center,
                  style: (index == settings.posSelected)
                      ? (dialogTheme.alphabetSelectedTextStyle) ??
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)
                      : (dialogTheme.alphabetTextStyle) ?? const TextStyle(fontSize: 12),
                ))));
  }
}
