import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/country.dart';
import '../theme/country_list_dialog_theme.dart';
import '../provider/picker_provider.dart';

// note that need to active GestureDetector ,  must study Drag events
// ignore: must_be_immutable
class AlphabetScroll extends StatelessWidget {
  const AlphabetScroll({
    Key? key,
    required this.scrollController,
    this.dialogTheme = const CountryListDialogTheme(),
    required this.alphabet,
    required this.countries,
    this.unitsCanceled = 6,
  }) : super(key: key);
  final ScrollController scrollController;
  final CountryListDialogTheme dialogTheme;
  final List<String>? alphabet;
  final List<Country> countries;
  final int unitsCanceled;

  @override
  Widget build(BuildContext context) {
    String? oldtext;
    return Selector<SettingsProvider, int>(
        selector: (context, settings) => settings.selectedPosition,
        builder: (context, position, child) => Align(
              alignment: (Directionality.of(context) == TextDirection.ltr) ? Alignment.centerRight : Alignment.centerLeft,

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
                                  if (alphabet![index] != oldtext) {
                                    int pos = countries.indexWhere((c) => c.name.common.toUpperCase().startsWith(alphabet![index]));

                                    (dialogTheme.tileHeight * (pos + unitsCanceled) + 10 <= scrollController.position.maxScrollExtent)
                                        ? scrollController.jumpTo(dialogTheme.tileHeight * (pos + unitsCanceled) + 10)
                                        : scrollController.jumpTo(scrollController.position.maxScrollExtent);
                                    oldtext = alphabet![index];
                                    position = index;
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: dialogTheme.tileHeight,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: index == position
                                        ? dialogTheme.alphabetsBarTheme.selectedBackgroundColor
                                        : dialogTheme.alphabetsBarTheme.backgroundColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    alphabet![index],
                                    textAlign: TextAlign.center,
                                    style: (index == position)
                                        ? dialogTheme.alphabetsBarTheme.selectedTextStyle.copyWith(
                                            fontSize: dialogTheme.alphabetsBarTheme.selectedTextStyle.fontSize ?? 18,
                                            fontWeight: dialogTheme.alphabetsBarTheme.selectedTextStyle.fontWeight ?? FontWeight.bold,
                                            color: dialogTheme.alphabetsBarTheme.selectedTextStyle.color ?? Theme.of(context).colorScheme.primary)
                                        : dialogTheme.alphabetsBarTheme.textStyle
                                            .copyWith(fontSize: (dialogTheme.alphabetsBarTheme.textStyle.fontSize) ?? 12),
                                  ),
                                ),
                              ),
                            ))
                  ],
                ),
              ),

              // ) ,
            ));
  }
}
