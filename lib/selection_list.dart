import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './models/picker_theme.dart';
import './models/dialog_theme.dart';
import 'models/csettings_controller.dart';
import './models/country.dart';
import './widget/ctitle.dart';

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

  final double itemsizeheight = 50.0;

  final TextEditingController _controller = TextEditingController();
  final ScrollController _controllerScroll = ScrollController();

  late double diff;
  late double _sizeheightcontainer;
  late double _heightscroller;
  String? _oldtext;

  late double _offsetContainer = 0.0;
  List<String>? _alphabet;

  late int boxes;

  @override
  Widget build(BuildContext context) {
    _intialValues(context);
    Widget scaffold = Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Selector<CSettings, bool>(
        selector: (context, model) => model.floatbutton,
        builder: (context, value, child) => (dialogTheme.isShowFloatButton && value)
            ? FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                mini: true,
                child: const Icon(Icons.arrow_upward),
                onPressed: () {
                  _controllerScroll.jumpTo(0);
                },
              )
            : const SizedBox.shrink(),
      ),
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
                      (dialogTheme.isShowSearch) ? _buildSearchBox(context) : const SizedBox.shrink(),
                      (dialogTheme.isShowCurrentLocation) ? _buildCurrentLocationBox(context) : const SizedBox.shrink(),
                      (dialogTheme.isShowLastPickCountry) ? _buildLastPickCountryBox(context) : const SizedBox.shrink(),
                      (boxes == 0)
                          ? const SizedBox.shrink()
                          : Container(height: 10, color: dialogTheme.titlesBackground)
                    ]),
                  ),
                  Selector<CSettings, List<Country>>(
                    selector: (context, model) => model.countries,
                    builder: (context, value, child) => SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return dialogBuilder != null
                            ? dialogBuilder!(context, value.elementAt(index))
                            : _buildCountryListTile(context, value.elementAt(index));
                      }, childCount: value.length),
                    ),
                  )
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
    // print("Initial Values");
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
    _alphabet = elements.map((e) => e.englishName![0]).toSet().toList();

    _controllerScroll.addListener(() {
      CSettings settings = context.read<CSettings>();
      settings.changeIsShowFloatButton(_controllerScroll.position.pixels != 0);

      int scrollPosition = ((_controllerScroll.position.pixels) / itemsizeheight).round();

      if (scrollPosition < boxes) {
        settings.changeSelectedPosition(-1);
      } else if (scrollPosition >= boxes && scrollPosition <= settings.countries.length) {
        int newPos = settings.countries.elementAt(scrollPosition - boxes).englishName![0].toUpperCase().codeUnitAt(0) -
            'A'.codeUnitAt(0);
        if (newPos != settings.posSelected) settings.changeSelectedPosition(newPos);
      }
    });
  }

  Widget _buildAlphabetItems(BuildContext context) {
    CSettings settings = context.read<CSettings>();
    // print("_buildAlphabetItems");
    return (dialogTheme.isShowAphabetScroll == true)
        ? Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if ((_offsetContainer + details.delta.dy) >= 0 &&
                      (_offsetContainer + details.delta.dy) <= (_sizeheightcontainer - _heightscroller)) {
                    _offsetContainer += details.delta.dy;

                    settings.posSelected = ((_offsetContainer / _heightscroller) % _alphabet!.length).round();

                    if (_alphabet![settings.posSelected] != _oldtext) {
                      int pos = settings.countries
                          .indexWhere((c) => c.englishName!.toUpperCase().startsWith(_alphabet![settings.posSelected]));
                      ((pos + boxes) * itemsizeheight <= _controllerScroll.position.maxScrollExtent)
                          ? _controllerScroll.jumpTo((pos + boxes) * itemsizeheight)
                          : _controllerScroll.jumpTo(_controllerScroll.position.maxScrollExtent);
                      _oldtext = _alphabet![settings.posSelected];
                    }
                  }
                },
                onVerticalDragStart: (details) {
                  _offsetContainer = details.globalPosition.dy - diff;
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Colors.transparent,
                  child: Selector<CSettings, List<Country>>(
                    selector: (context, model) => model.countries,
                    builder: (context, value, child) => Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(_alphabet!.length, (index) => _buildAlphabetItem(context, value, index))
                      ],
                    ),
                  ),
                )),
          )
        : const SizedBox.shrink();
  }

  Column _buildSearchBox(BuildContext context) {
    // print("_buildSearchBox");
    return Column(children: [
      CTitle(
          title: dialogTheme.searchText,
          background: dialogTheme.titlesBackground,
          titlesStyle: dialogTheme.titlesStyle,
          height: itemsizeheight),
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
            Provider.of<CSettings>(context, listen: false).changeCountries(
                elements.where((e) => e.dialCode!.startsWith(s) || e.englishName!.toUpperCase().startsWith(s)).toList());
          }),
        ),
      ),
    ]);
  }

  Column _buildCurrentLocationBox(BuildContext context) {
    print("_buildCurrentLocationBox");
    Country country =
        elements.singleWhere((element) => element.code == WidgetsBinding.instance.window.locale.countryCode);
    return Column(children: [
      CTitle(
          title: dialogTheme.currentLocationText,
          background: dialogTheme.titlesBackground,
          titlesStyle: dialogTheme.titlesStyle,
          height: itemsizeheight),
      _buildCountryListTile(context, country),
    ]);
  }

  Column _buildLastPickCountryBox(BuildContext context) {
    // print("_buildLastPickCountryBox");
    return Column(children: [
      CTitle(
          title: dialogTheme.lastPickText,
          background: dialogTheme.titlesBackground,
          titlesStyle: dialogTheme.titlesStyle,
          height: itemsizeheight),
      _buildCountryListTile(context, initialSelection!, true),
    ]);
  }

  SizedBox _buildCountryListTile(BuildContext context, country, [bool lastpick = false]) {
    // print("_buildCountryListTile");
    return SizedBox(
      height: itemsizeheight,
      child: ListTile(
          leading: (dialogTheme.isShowFlage)
              ? Image.asset(country.flagUri!, package: 'country_list_picker', width: 30.0)
              : null,
          title: Text("${country.englishName!}", overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: false),
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

  Widget _buildAlphabetItem(BuildContext context, List<Country> countries, int index) {
    return Consumer<CSettings>(
        // selector: (context, model) => model.posSelected,
        builder: (context, value, child) => Expanded(
            child: InkWell(
                onTap: () {
                  if (_alphabet![index] != _oldtext) {
                    int pos = countries.indexWhere((c) => c.englishName!.toUpperCase().startsWith(_alphabet![index]));

                    (itemsizeheight * (pos + boxes) + 10 <= _controllerScroll.position.maxScrollExtent)
                        ? _controllerScroll.jumpTo(itemsizeheight * (pos + boxes) + 10)
                        : _controllerScroll.jumpTo(_controllerScroll.position.maxScrollExtent);
                    _oldtext = _alphabet![index];
                    value.changeSelectedPosition(index);
                    // value = index;
                  }
                },
                child: Container(
                    width: 40,
                    height: itemsizeheight,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index == value.posSelected
                          ? dialogTheme.alphabetSelectedBackgroundColor
                          : dialogTheme.alphabetBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      _alphabet![index],
                      textAlign: TextAlign.center,
                      style: (index == value.posSelected)
                          ? (dialogTheme.alphabetSelectedTextStyle) ??
                              TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)
                          : (dialogTheme.alphabetTextStyle) ?? const TextStyle(fontSize: 12),
                    )))));
  }
}
