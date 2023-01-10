import 'package:flutter/material.dart';
import '../model/country.dart';
import '../theme/country_list_dialog_theme.dart';

class AlphabetScroll extends StatelessWidget {
  const AlphabetScroll({
    super.key,
    required this.scrollController,
    required this.alphabet,
    required this.countries,
    required this.selectedChar,
    this.dialogTheme = const CountryListDialogTheme(),
    this.unitsCanceled = 6,
  });
  final ScrollController scrollController;
  final CountryListDialogTheme dialogTheme;
  final List<String> alphabet;
  final List<Country> countries;
  final String? selectedChar;
  final int unitsCanceled;

  @override
  Widget build(BuildContext context) {
    int selectedint = selectedChar != null ? alphabet.indexOf(selectedChar!) : -1;
    String? oldtext;
    return Align(
      alignment: (Directionality.of(context) == TextDirection.ltr)
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                alphabet.length,
                (index) => Expanded(
                      child: InkWell(
                        onTap: () {
                          if (alphabet[index] != oldtext) {
                            int pos = countries.indexWhere(
                                (c) => c.name.common.toUpperCase().startsWith(alphabet[index]));
                            (dialogTheme.tileHeight * (pos + unitsCanceled) + 10 <=
                                    scrollController.position.maxScrollExtent)
                                ? scrollController
                                    .jumpTo(dialogTheme.tileHeight * (pos + unitsCanceled) + 10)
                                : scrollController
                                    .jumpTo(scrollController.position.maxScrollExtent);
                            oldtext = alphabet[index];
                            selectedint = index;
                          }
                        },
                        child: Container(
                          width: 20 * 2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == selectedint
                                ? dialogTheme.alphabetsBarTheme.selectedBackgroundColor
                                : dialogTheme.alphabetsBarTheme.backgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            alphabet[index],
                            textAlign: TextAlign.center,
                            style: (index == selectedint)
                                ? dialogTheme.alphabetsBarTheme.selectedTextStyle.copyWith(
                                    fontSize:
                                        dialogTheme.alphabetsBarTheme.selectedTextStyle.fontSize ??
                                            18,
                                    fontWeight: dialogTheme
                                            .alphabetsBarTheme.selectedTextStyle.fontWeight ??
                                        FontWeight.bold,
                                    color: dialogTheme.alphabetsBarTheme.selectedTextStyle.color ??
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
    );
  }
}
