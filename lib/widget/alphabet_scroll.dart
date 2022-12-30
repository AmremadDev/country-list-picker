import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/country.dart';
import '../contollers/country_list_picker_controller.dart';
import '../themes/country_list_dialog_theme.dart';

// note that need to active GestureDetector ,  must study Drag events
// ignore: must_be_immutable
class AlphabetScroll extends StatelessWidget {
  AlphabetScroll({
    Key? key,
    required this.scrollController,
    this.dialogTheme = const CountryListDialogTheme(),
    required this.alphabet,
    required this.countries,
    // this.unitHeight = 50.0,
    this.unitsCanceled = 6,
  }) : super(key: key);
  final ScrollController scrollController;
  final CountryListDialogTheme dialogTheme;
  final List<String>? alphabet;
  final List<Country> countries;
  final int unitsCanceled;
  String? _oldtext;
  @override
  Widget build(BuildContext context) {
    return Consumer<CLPProvider>(
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
                              int pos = countries.indexWhere((c) =>
                                  c.englishName.common.toUpperCase().startsWith(alphabet![index]));

                              (dialogTheme.tileHeight * (pos + unitsCanceled) + 10 <=
                                      scrollController.position.maxScrollExtent)
                                  ? scrollController
                                      .jumpTo(dialogTheme.tileHeight * (pos + unitsCanceled) + 10)
                                  : scrollController
                                      .jumpTo(scrollController.position.maxScrollExtent);
                              _oldtext = alphabet![index];
                              value.changeSelectedPosition(index);
                            }
                          },
                          child: Container(
                            width: 40,
                            height: dialogTheme.tileHeight,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == value.posSelected
                                  ? dialogTheme.alphabetsBarTheme.selectedBackgroundColor
                                  : dialogTheme.alphabetsBarTheme.backgroundColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              alphabet![index],
                              textAlign: TextAlign.center,
                              style: (index == value.posSelected)
                                  ? dialogTheme.alphabetsBarTheme.selectedTextStyle.copyWith(
                                      fontSize: dialogTheme
                                              .alphabetsBarTheme.selectedTextStyle.fontSize ??
                                          18,
                                      fontWeight: dialogTheme
                                              .alphabetsBarTheme.selectedTextStyle.fontWeight ??
                                          FontWeight.bold,
                                      color:
                                          dialogTheme.alphabetsBarTheme.selectedTextStyle.color ??
                                              Theme.of(context).colorScheme.primary)
                                  : dialogTheme.alphabetsBarTheme.textStyle.copyWith(
                                      fontSize:
                                          (dialogTheme.alphabetsBarTheme.textStyle.fontSize) ?? 12),
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
