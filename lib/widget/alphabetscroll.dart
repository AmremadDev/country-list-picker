import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/country.dart';
import '../models/csettings_controller.dart';
import '../models/dialog_theme.dart';

// note that need to active GestureDetector ,  must study Drag events
// ignore: must_be_immutable
class XAlphabetScroll extends StatelessWidget {
   XAlphabetScroll({
    Key? key,
    required this.scrollController,
     this.dialogTheme = const CDialogTheme(),
    required this.alphabet,
    required this.countries,
    // this.unitHeight = 50.0,
    this.unitsCanceled = 6,
  }) : super(key: key);
  final ScrollController scrollController;
  final CDialogTheme dialogTheme;
  final List<String>? alphabet;
  final List<Country> countries;
  // final double unitHeight;
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
        child: Container(
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
                              int pos = countries
                                  .indexWhere((c) => c.englishName.common.toUpperCase().startsWith(alphabet![index]));

                              (dialogTheme.rowHeight * (pos + unitsCanceled) + 10 <=
                                      scrollController.position.maxScrollExtent)
                                  ? scrollController.jumpTo(dialogTheme.rowHeight * (pos + unitsCanceled) + 10)
                                  : scrollController.jumpTo(scrollController.position.maxScrollExtent);
                              _oldtext = alphabet![index];
                              value.changeSelectedPosition(index);
                            }
                          },
                          child: Container(
                            width: 40,
                            height: dialogTheme.rowHeight,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == value.posSelected
                                  ? dialogTheme.alphabetsBar.selectedBackgroundColor
                                  : dialogTheme.alphabetsBar.backgroundColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(alphabet![index],
                                textAlign: TextAlign.center,
                                style: (index == value.posSelected)
                                    ? dialogTheme.alphabetsBar.textStyle.copyWith(
                                        fontSize: dialogTheme.alphabetsBar.textStyle.fontSize ?? 18,
                                        fontWeight: dialogTheme.alphabetsBar.textStyle.fontWeight ?? FontWeight.bold,
                                        color: dialogTheme.alphabetsBar.textStyle.color ??
                                            Theme.of(context).primaryColor)
                                    : dialogTheme.alphabetsBar.textStyle
                                        .copyWith(fontSize: (dialogTheme.alphabetsBar.textStyle.fontSize) ?? 12)),
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
