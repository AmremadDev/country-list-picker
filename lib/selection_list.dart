import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'country_list_picker.dart';
import 'picker_theme.dart';
import 'dialog_theme.dart';

class SelectionList extends StatefulWidget {
  const SelectionList(
    this.elements,
    this.initialSelection, {
    Key? key,
    this.appBar,
    this.pickerTheme,
    this.dialogTheme,
    this.countryBuilder,
    this.useUiOverlay = true,
    this.useSafeArea = false,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final List<Country> elements;
  final Country? initialSelection;
  final XPickerTheme? pickerTheme;
  final XDialogTheme? dialogTheme;
  final Widget Function(BuildContext context, Country)? countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  @override
  SelectionListState createState() => SelectionListState();
}

class SelectionListState extends State<SelectionList> {
  late List<Country> countries;
  final TextEditingController _controller = TextEditingController();
  ScrollController? _controllerScroll;
  var diff = 0.0;
  var posSelected = 0;
  var height = 0.0;
  late double _sizeheightcontainer;
  late double _heightscroller;
  String? _text;
  String? _oldtext;
  final double _itemsizeheight = 50.0;
  double _offsetContainer = 0.0;

  bool isShow = true;

  @override
  void initState() {
    countries = widget.elements;
    countries.sort((a, b) {
      return a.name.toString().compareTo(b.name.toString());
    });
    _controllerScroll = ScrollController();
    _controllerScroll!.addListener(_scrollListener);
    super.initState();
  }

  void _sendDataBack(BuildContext context, Country initialSelection) {
    Navigator.pop(context, initialSelection);
  }

  final List _alphabet = List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));

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
    height = MediaQuery.of(context).size.height;
    Widget scaffold = Scaffold(
      appBar: widget.appBar,
      body: Container(
        color: const Color(0xfff4f4f4),
        child: LayoutBuilder(builder: (context, contrainsts) {
          diff = height - contrainsts.biggest.height;
          _heightscroller = (contrainsts.biggest.height) / _alphabet.length;
          _sizeheightcontainer = (contrainsts.biggest.height);
          return Stack(
            children: <Widget>[
              CustomScrollView(
                controller: _controllerScroll,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSearchBox(),
                        _buildCurrentLocationBox(countries),
                        Container(
                          width: double.infinity,
                          color: (widget.dialogTheme != null) ? widget.dialogTheme!.titlesBackground : null,
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            widget.pickerTheme?.lastPickText ?? 'Last Pick',
                            style: (widget.dialogTheme != null)
                                ? widget.dialogTheme!.titlesStyle
                                : Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Image.asset(
                                widget.initialSelection!.flagUri!,
                                package: 'country_list_picker',
                                width: 32.0,
                              ),
                              title: Text(widget.initialSelection!.name!),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: (widget.dialogTheme != null) ? widget.dialogTheme!.checkIcon! : const Icon(Icons.check),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15, width: double.infinity)
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return widget.countryBuilder != null
                          ? widget.countryBuilder!(context, countries.elementAt(index))
                          : _buildListCountry(countries.elementAt(index));
                    }, childCount: countries.length),
                  )
                ],
              ),

              // alphabet selector
              if (isShow == true)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragStart: _onVerticalDragStart,
                    child: Container(
                      height: 20.0 * 30,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [...List.generate(_alphabet.length, (index) => _getAlphabetItem(index))],
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

  Widget _buildSearchBox() {
    List<Widget> list = [
      Container(
        color: (widget.dialogTheme != null) ? widget.dialogTheme!.titlesBackground : null,
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        child: Text(
          widget.dialogTheme?.searchText ?? 'Search',
          style: (widget.dialogTheme != null)
              ? widget.dialogTheme!.titlesStyle
              : Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        color: Colors.white,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
            hintText: widget.dialogTheme?.searchHintText ?? "Search...",
          ),
          onChanged: _filterElements,
        ),
      ),
    ];
    return (widget.dialogTheme != null)
        ? (widget.dialogTheme!.isShowSearch == true)
            ? Column(children: list)
            : const SizedBox.shrink()
        : Column(children: list);
  }

  Widget _buildCurrentLocationBox(List<Country> countires) {
    List<Widget> list = [
      Container(
        width: double.infinity,
        color: (widget.dialogTheme != null) ? widget.dialogTheme!.titlesBackground : null,
        padding: const EdgeInsets.all(15.0),
        child: Text(
          'Current Location',
          style: (widget.dialogTheme != null && widget.dialogTheme!.titlesStyle != null)
              ? widget.dialogTheme!.titlesStyle
              : Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        color: Colors.white,
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
                "${countries.singleWhere((element) => element.code == WidgetsBinding.instance.window.locale.countryCode).name}",
              ),
              Positioned(
                  right: 25,
                  child: Text("${countries.singleWhere((element) => element.code == WidgetsBinding.instance.window.locale.countryCode).dialCode}"))
            ]),
          ),
        ),
      ),
    ];

    return (widget.dialogTheme != null)
        ? (widget.dialogTheme!.isShowCurrentLocation == true)
            ? Column(children: list)
            : const SizedBox.shrink()
        : Column(children: list);
  }

  Widget _buildListCountry(Country e) {
    return Material(
      // color: Colors.white,
      child: ListTile(
        leading: Image.asset(
          e.flagUri!,
          package: 'country_list_picker',
          width: 30.0,
        ),
        title: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
          "${e.name}",
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text("${e.dialCode}"),
        ),
        onTap: () {
          _sendDataBack(context, e);
        },
      ),
    );
  }

  _getAlphabetItem(int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            // posSelected = index;
            _text = _alphabet[index];
            if (_text != _oldtext) {
              for (var i = 0; i < countries.length; i++) {
                if (_text.toString().compareTo(countries[i].name.toString().toUpperCase()[0]) == 0) {
                  _controllerScroll!.jumpTo((i * _itemsizeheight) + 110);
                  break;
                }
              }
              _oldtext = _text;
            }
          });
        },
        child: Container(
          width: 40,
          height: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index == posSelected ? widget.pickerTheme?.alphabetSelectedBackgroundColor ?? Colors.blue : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            _alphabet[index],
            textAlign: TextAlign.center,
            style: (index == posSelected)
                ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: widget.pickerTheme?.alphabetSelectedTextColor ?? Colors.white)
                : TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: widget.pickerTheme?.alphabetTextColor ?? Colors.black),
          ),
        ),
      ),
    );
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      countries = widget.elements.where((e) => e.code!.contains(s) || e.dialCode!.contains(s) || e.name!.toUpperCase().contains(s)).toList();
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if ((_offsetContainer + details.delta.dy) >= 0 && (_offsetContainer + details.delta.dy) <= (_sizeheightcontainer - _heightscroller)) {
        _offsetContainer += details.delta.dy;
        posSelected = ((_offsetContainer / _heightscroller) % _alphabet.length).round();
        _text = _alphabet[posSelected];
        if (_text != _oldtext) {
          for (var i = 0; i < countries.length; i++) {
            if (_text.toString().compareTo(countries[i].name.toString().toUpperCase()[0]) == 0) {
              _controllerScroll!.jumpTo((i * _itemsizeheight) + 10);
              break;
            }
          }
          _oldtext = _text;
        }
      }
    });
  }

  void _onVerticalDragStart(DragStartDetails details) {
    _offsetContainer = details.globalPosition.dy - diff;
  }

  _scrollListener() {
    int scrollPosition = (_controllerScroll!.position.pixels / _itemsizeheight).round();
    if (scrollPosition < countries.length) {
      String? countryName = countries.elementAt(scrollPosition).name;
      setState(() {
        posSelected = countryName![0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
      });
    }

    if ((_controllerScroll!.offset) >= (_controllerScroll!.position.maxScrollExtent)) {}
    if (_controllerScroll!.offset <= _controllerScroll!.position.minScrollExtent && !_controllerScroll!.position.outOfRange) {}
  }
}
