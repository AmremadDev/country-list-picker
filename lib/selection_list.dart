import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './country_list_picker.dart';
import './models/picker_theme.dart';
import './models/dialog_theme.dart';

class SelectionList extends StatefulWidget {
  const SelectionList(
    this.elements, {
    Key? key,
    this.initialSelection,
    this.appBar,
    this.pickerTheme,
    this.dialogTheme = const CDialogTheme(),
    this.countryBuilder,
    this.useUiOverlay = true,
    this.useSafeArea = false,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final List<Country> elements;
  final Country? initialSelection;
  final CPickerTheme? pickerTheme;
  final CDialogTheme dialogTheme;
  final Widget Function(BuildContext context, Country)? countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  @override
  SelectionListState createState() => SelectionListState();
}

class SelectionListState extends State<SelectionList> {
  late List<Country> countries;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _controllerScroll = ScrollController();

  int posSelected = -1;
  late double diff ;
  late double _sizeheightcontainer;
  late double _heightscroller;
  String? _oldtext;
  final double itemsizeheight = 50.0;
  double _offsetContainer = 0.0;
  List<String>? _alphabet;


  late int boxes;
  bool _floatbutton = false;

  @override
  void initState() {
    countries = widget.elements;
    
    _alphabet = countries.map((e) => e.name![0]).toSet().toList();
    countries.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
    _controllerScroll.addListener(_scrollListener);

    boxes = 0;
    if (widget.dialogTheme.isShowSearch == true) boxes += 2;
    if (widget.dialogTheme.isShowCurrentLocation == true) boxes += 2;
    if (widget.dialogTheme.isShowLastPickCountry == true) boxes += 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.useUiOverlay) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: !kIsWeb ? Brightness.dark : Brightness.light,
      ));
    }

   
    Widget scaffold = Scaffold(
      floatingActionButton: (_floatbutton)
          ? FloatingActionButton(
              mini: true,
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                _controllerScroll.jumpTo(0);
              },
            )
          : null,
      appBar: widget.appBar,
      body: Container(
        color: widget.dialogTheme.backgroundColor,
        child: LayoutBuilder(builder: (context, contrainsts) {
          diff = MediaQuery.of(context).size.height - contrainsts.biggest.height;
          _heightscroller = (contrainsts.biggest.height) / _alphabet!.length;
          _sizeheightcontainer = (contrainsts.biggest.height);
          return Stack(
            children: <Widget>[
              CustomScrollView(
                controller: _controllerScroll,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(children: [
                      _buildSearchBox(),
                      _buildCurrentLocationBox(),
                      _buildLastPickCountryBox(),
                      Container(
                        height: 10,
                        color: widget.dialogTheme.titlesBackground,
                      )
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return widget.countryBuilder != null
                          ? widget.countryBuilder!(context, countries.elementAt(index))
                          : _buildListCountry(index + 1, countries.elementAt(index));
                    }, childCount: countries.length),
                  )
                ],
              ),
              if (widget.dialogTheme.isShowAphabetScroll == true)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragStart: _onVerticalDragStart,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [...List.generate(_alphabet!.length, (index) => _buildAlphabetItem(index))],
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
    return widget.useSafeArea ? SafeArea(child: scaffold) : scaffold;
  }

  Container _buildTitle(String title) {
    return Container(
      color: widget.dialogTheme.titlesBackground,
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: itemsizeheight,
      child: Text(title, style: widget.dialogTheme.titlesStyle),
    );
  }

  Widget _buildSearchBox() {
    List<Widget> list = [
      _buildTitle(widget.dialogTheme.searchText),
      Container(
        color: Colors.white,
        height: itemsizeheight,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
              hintText: widget.dialogTheme.searchHintText),
          onChanged: ((value) {
            String s = value.toUpperCase();
            setState(() {
              countries = widget.elements
                  .where((e) => e.dialCode!.startsWith(s) || e.name!.toUpperCase().startsWith(s))
                  .toList();
              // this line to minmize alphabet to filter counteries
              // _alphabet = countries.map((e) => e.name![0]).toSet().toList();
            });
          }),
        ),
      ),
    ];
    return (widget.dialogTheme.isShowSearch == true) ? Column(children: list) : const SizedBox.shrink();
  }

  Widget _buildCurrentLocationBox() {
    List<Widget> list = [
      _buildTitle(widget.dialogTheme.currentLocationText),
      Container(
        color: Colors.white,
        height: itemsizeheight,
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            leading: Image.asset(
              'flags/${WidgetsBinding.instance.window.locale.countryCode!.toLowerCase()}.png',
              package: 'country_list_picker',
              width: 32.0,
            ),
            title: Stack(children: [
              Text(
                "${widget.elements.singleWhere((element) => element.code == WidgetsBinding.instance.window.locale.countryCode).name}",
              ),
              Positioned(
                  right: 25,
                  child: Text(
                      "${widget.elements.singleWhere((element) => element.code == WidgetsBinding.instance.window.locale.countryCode).dialCode}"))
            ]),
          ),
        ),
      ),
    ];
    return (widget.dialogTheme.isShowCurrentLocation == true) ? Column(children: list) : const SizedBox.shrink();
  }

  Widget _buildLastPickCountryBox() {
    List<Widget> list = [
      _buildTitle(widget.dialogTheme.lastPickText),
      Container(
        color: Colors.white,
        height: itemsizeheight,
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            leading: Image.asset(widget.initialSelection!.flagUri!, package: 'country_list_picker', width: 32.0),
            title: Text(widget.initialSelection!.name!),
            trailing: Padding(padding: const EdgeInsets.only(right: 20.0), child: widget.dialogTheme.checkIcon),
          ),
        ),
      ),
    ];
    return (widget.dialogTheme.isShowLastPickCountry == true) ? Column(children: list) : const SizedBox.shrink();
  }

  Widget _buildListCountry(int index, Country country) {
    return SizedBox(
      height: itemsizeheight,
      child: ListTile(
          leading: Image.asset(country.flagUri!, package: 'country_list_picker', width: 30.0),
          title: Text(overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: false, "${index + 5}. ${country.name}"),
          trailing: Padding(padding: const EdgeInsets.only(right: 20.0), child: Text("${country.dialCode}")),
          onTap: () {
            Navigator.pop(context, country);
          }),
    );
  }

 Widget _buildAlphabetItem(int index) {
    return Expanded(
      child: InkWell(
        //(countries.indexWhere((c) => c.name!.toUpperCase().startsWith("Y"))  == 0 )
        onTap: () {
          // if (_controllerScroll.position.pixels >= _controllerScroll.position.maxScrollExtent) return;
          posSelected = index;
          if (_alphabet![index] != _oldtext) {
            int pos = countries.indexWhere((c) => c.name!.toUpperCase().startsWith(_alphabet![index]));
            (itemsizeheight * (pos + boxes) + 10 <= _controllerScroll.position.maxScrollExtent)
                ? _controllerScroll.jumpTo(itemsizeheight * (pos + boxes) + 10)
                : _controllerScroll.jumpTo(_controllerScroll.position.maxScrollExtent);
            _oldtext = _alphabet![index];
          }
          setState(() {});
        },
        child: Container(
          width: 50,
          height: itemsizeheight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index == posSelected
                ? widget.dialogTheme.alphabetSelectedBackgroundColor
                : widget.dialogTheme.alphabetBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Text(
            _alphabet![index],
            textAlign: TextAlign.center,
            style: (index == posSelected)
                ? widget.dialogTheme.alphabetSelectedTextStyle
                : widget.dialogTheme.alphabetTextStyle
              
          ),
        ),
      ),
    );
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if ((_offsetContainer + details.delta.dy) >= 0 &&
        (_offsetContainer + details.delta.dy) <= (_sizeheightcontainer - _heightscroller)) {
      _offsetContainer += details.delta.dy;
      posSelected = ((_offsetContainer / _heightscroller) % _alphabet!.length).round();
      if (_alphabet![posSelected] != _oldtext) {
        int pos = countries.indexWhere((c) => c.name!.toUpperCase().startsWith(_alphabet![posSelected]));
        ((pos + boxes) * itemsizeheight <= _controllerScroll.position.maxScrollExtent)
            ? _controllerScroll.jumpTo((pos + boxes) * itemsizeheight)
            : _controllerScroll.jumpTo(_controllerScroll.position.maxScrollExtent);
        _oldtext = _alphabet![posSelected];
      }
    }
    setState(() {});
  }

  void _onVerticalDragStart(DragStartDetails details) {
    _offsetContainer = details.globalPosition.dy - diff;
  }

  void _scrollListener() {
    _floatbutton = (_controllerScroll.position.pixels != 0);
    int scrollPosition = ((_controllerScroll.position.pixels) / itemsizeheight).round();
    if (scrollPosition < boxes) {
      posSelected = -1;
    } else if (scrollPosition >= boxes && scrollPosition <= countries.length) {
      posSelected =
          countries.elementAt(scrollPosition - boxes).name![0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
    }
    setState(() {});
  }
}
