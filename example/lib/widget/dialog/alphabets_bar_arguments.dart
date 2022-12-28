import 'package:country_list_picker_example/controller/dialog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_tile.dart';

class AlphabetsBarArguments extends StatelessWidget {
  const AlphabetsBarArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            XListTile(
                titleAsString: 'Visible',
                toggle: Switch(
                    value: provider.alphabetBar,
                    onChanged: (bool value) {
                      provider.alphabetBar = value;
                    })),
          ],
        );
      },
    );
  }
}
