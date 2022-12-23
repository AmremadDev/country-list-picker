import 'package:country_list_picker_example/widget/xcolor_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/clp_provider.dart';
import '../widget/xswitch_list_tile.dart';

class DialogProperties extends StatelessWidget {
  const DialogProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CLPProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            // Borders
            XListTile(
                title: 'Search Tile',
                subtitle: const Text("Allow user to search in country list"),
                toggle: Switch(
                    value: provider.searchTile,
                    onChanged: (bool value) {
                      provider.searchTile = value;
                      provider.searchTile = value;
                    })),
            XListTile(
                title: 'Current Location Tile',
                subtitle: const Text("detrmine the current location"),
                toggle: Switch(
                    value: provider.currentLocationTile,
                    onChanged: (bool value) {
                      provider.currentLocationTile = value;
                      provider.currentLocationTile = value;
                    })),
            XListTile(
                title: 'Last Pick Tile',
                subtitle: const Text("display previous country selection by user"),
                toggle: Switch(
                    value: provider.lastPicktile,
                    onChanged: (bool value) {
                      provider.lastPicktile = value;
                      provider.lastPicktile = value;
                    })),
            XListTile(
                title: 'Alphabets Bar',
                subtitle: const Text("Show/Hide Alphabets bar"),
                toggle: Switch(
                    value: provider.alphabetBar,
                    onChanged: (bool value) {
                      provider.alphabetBar = value;
                      provider.alphabetBar = value;
                    })),
            XListTile(
                title: 'Country Flag',
                subtitle: const Text("Show/Hide country flag"),
                toggle: Switch(
                    value: provider.countryFlag,
                    onChanged: (bool value) {
                      provider.countryFlag = value;
                      provider.countryFlag = value;
                    })),
            XListTile(
                title: 'Country dial codes',
                subtitle: const Text("Show/Hide country dial codes"),
                toggle: Switch(
                    value: provider.countryDialCode,
                    onChanged: (bool value) {
                      provider.countryDialCode = value;
                      provider.countryDialCode = value;
                    })),
            XListTile(
                title: 'App action button',
                subtitle: const Text("Show/Hide float up button"),
                toggle: Switch(
                    value: provider.upActionbutton,
                    onChanged: (bool value) {
                      provider.upActionbutton = value;
                      provider.upActionbutton = value;
                    })),
            // Color

            XListTile(
              title: "Background",
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.pickerTextColor,
                    onColorChanged: (Color color) {
                      provider.pickerTextColor = color;
                    }),
              ),
            ),
            XListTile(
              title: "Title background",
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.pickerTextColor,
                    onColorChanged: (Color color) {
                      provider.pickerTextColor = color;
                    }),
              ),
            ),
            XListTile(
              title: "AlphabetBar Background",
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.pickerTextColor,
                    onColorChanged: (Color color) {
                      provider.pickerTextColor = color;
                    }),
              ),
            ),
            XListTile(
              title: "AlphabetBar selected Background",
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.pickerTextColor,
                    onColorChanged: (Color color) {
                      provider.pickerTextColor = color;
                    }),
              ),
            ),
            XListTile(
              title: "AlphabetBar selected Background",
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.pickerTextColor,
                    onColorChanged: (Color color) {
                      provider.pickerTextColor = color;
                    }),
              ),
            ),
            XListTile(
              title: "AlphabetBar selected Background",
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: XColorPickerDialog(
                    value: provider.pickerTextColor,
                    onColorChanged: (Color color) {
                      provider.pickerTextColor = color;
                    }),
              ),
            ),
          ],
        );
      },
    );
  }
}
