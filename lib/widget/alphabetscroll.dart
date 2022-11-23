import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dialog_theme.dart';
import '../models/country.dart';
import '../models/csettings_controller.dart';

// note that need to active GestureDetector ,  must study Drag events
// ignore: must_be_immutable
class XAlphabetScroll extends StatelessWidget {
  XAlphabetScroll({
    Key? key,
    required this.scrollController,
    required this.dialogTheme,
    required this.alphabet,
    required this.countries,
    this.unitHeight = 50.0,
    this.unitsCanceled = 6,
  }) : super(key: key);
  final ScrollController scrollController;
  final CDialogTheme dialogTheme;
  final List<String>? alphabet;
  final List<Country> countries;
  final double unitHeight;
  final int unitsCanceled;
  String? _oldtext;

  // late double _offsetContainer = 0.0;
  // late double diff;
  // late double _heightscroller;
  // late double _sizeheightcontainer;

  @override
  Widget build(BuildContext context) {
    return Consumer<CSettings>(
      builder: (context, value, child) => Align(
        alignment: Alignment.centerRight,
        child:

            // LayoutBuilder(
            //   builder: (BuildContext context, BoxConstraints constraints) {

            //         diff = MediaQuery.of(context).size.height - constraints.biggest.height;
            //         _heightscroller = (constraints.biggest.height) / alphabet!.length;
            //         _sizeheightcontainer = (constraints.biggest.height);
            //     return GestureDetector(

            //   onVerticalDragUpdate: (details) {
            //     scrollController.jumpTo(details.localPosition.dy*5);
            //     if ((_offsetContainer + details.delta.dy) >= 0 &&
            //         (_offsetContainer + details.delta.dy) <= (_sizeheightcontainer - _heightscroller)) {
            //       _offsetContainer += details.delta.dy;

            //     value.posSelected = ((_offsetContainer / _heightscroller) % alphabet!.length).round();

            //     if (alphabet![value.posSelected] != _oldtext) {
            //       int pos = value.countries.indexWhere((c) => c.englishName!.toUpperCase().startsWith(alphabet![value.posSelected]));
            //       ((pos + unitsCanceled) * unitHeight <= scrollController.position.maxScrollExtent)
            //           ? scrollController.jumpTo((pos + unitsCanceled) * unitHeight)
            //           : scrollController.jumpTo(scrollController.position.maxScrollExtent);
            //       _oldtext = alphabet![value.posSelected];
            //     }}
            //   },
            //   onVerticalDragStart: (details) {
            //     _offsetContainer = details.globalPosition.dy - diff;
            //   },

            // child:

            Container(
          height: MediaQuery.of(context).size.height * 0.8,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  alphabet!.length,
                  (index) => Expanded(
                        child: InkWell(
                          onTap: () {
                            if (alphabet![index] != _oldtext) {
                              int pos = countries.indexWhere((c) => c.englishName!.toUpperCase().startsWith(alphabet![index]));

                              (unitHeight * (pos + unitsCanceled) + 10 <= scrollController.position.maxScrollExtent)
                                  ? scrollController.jumpTo(unitHeight * (pos + unitsCanceled) + 10)
                                  : scrollController.jumpTo(scrollController.position.maxScrollExtent);
                              _oldtext = alphabet![index];
                              value.changeSelectedPosition(index);
                            }
                          },
                          child: Container(
                            width: 40,
                            height: unitHeight,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == value.posSelected ? dialogTheme.alphabetSelectedBackgroundColor : dialogTheme.alphabetBackgroundColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              alphabet![index],
                              textAlign: TextAlign.center,
                              style: (index == value.posSelected)
                                  ? (dialogTheme.alphabetSelectedTextStyle) ??
                                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)
                                  : (dialogTheme.alphabetTextStyle) ?? const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ))
            ],
          ),
        ),

        // );},
        // ),
      ),
    );
  }
}
