import 'package:country_list_picker/model/languages.dart';
import 'package:country_list_picker_example/controller/picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_list_tile.dart';

class GeneralPickerArguments extends StatelessWidget {
  const GeneralPickerArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PickerProvider>(
      builder: (_, picker, child) {
        return Column(
          children: [
            CustomListTile<DropdownButtonFormField, Languages>(
              title: "Languange",
              value: picker.language,
              onLanguagesChanged: (value) => picker.language = value,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
