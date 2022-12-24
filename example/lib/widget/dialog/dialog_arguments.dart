import 'package:country_list_picker_example/controller/dialog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_tile.dart';

class DialogArguments extends StatelessWidget {
  const DialogArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            // Borders
            XListTile(
                titleAsString: 'Search Tile',
                subtitleASString: "Allow user to search in country list",
                toggle: Switch(
                    value: provider.searchTile,
                    onChanged: (bool value) {
                      provider.searchTile = value;
                    })),
            XListTile(
                titleAsString: 'Current Location Tile',
                subtitleASString: "detrmine the current location",
                toggle: Switch(
                    value: provider.currentLocationTile,
                    onChanged: (bool value) {
                      provider.currentLocationTile = value;
                    })),
            XListTile(
                titleAsString: 'Last Pick Tile',
                subtitleASString: "display previous country selection by user",
                toggle: Switch(
                    value: provider.lastPicktile,
                    onChanged: (bool value) {
                      provider.lastPicktile = value;
                    })),
            XListTile(
                titleAsString: 'Alphabets Bar',
                subtitleASString: "Show/Hide Alphabets bar",
                toggle: Switch(
                    value: provider.alphabetBar,
                    onChanged: (bool value) {
                      provider.alphabetBar = value;
                    })),
            XListTile(
                titleAsString: 'Country Flag',
                subtitleASString: "Show/Hide country flag",
                toggle: Switch(
                    value: provider.countryFlag,
                    onChanged: (bool value) {
                      provider.countryFlag = value;
                    })),
            XListTile(
                titleAsString: 'Country dial codes',
                subtitleASString: "Show/Hide country dial codes",
                toggle: Switch(
                    value: provider.countryDialCode,
                    onChanged: (bool value) {
                      provider.countryDialCode = value;
                    })),
            XListTile(
                titleAsString: 'App action button',
                subtitleASString: "Show/Hide float up button",
                toggle: Switch(
                    value: provider.upActionbutton,
                    onChanged: (bool value) {
                      provider.upActionbutton = value;
                    })),
            // Color

            // XListTile(
            //   title: "Background",
            //   subtitle: Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: XColorPickerDialog(
            //         value: provider.pickerTextColor,
            //         onColorChanged: (Color color) {
            //           provider.pickerTextColor = color;
            //         }),
            //   ),
            // ),
            // XListTile(
            //   title: "Title background",
            //   subtitle: Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: XColorPickerDialog(
            //         value: provider.pickerTextColor,
            //         onColorChanged: (Color color) {
            //           provider.pickerTextColor = color;
            //         }),
            //   ),
            // ),
            // XListTile(
            //   title: "AlphabetBar Background",
            //   subtitle: Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: XColorPickerDialog(
            //         value: provider.pickerTextColor,
            //         onColorChanged: (Color color) {
            //           provider.pickerTextColor = color;
            //         }),
            //   ),
            // ),
            // XListTile(
            //   title: "AlphabetBar selected Background",
            //   subtitle: Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: XColorPickerDialog(
            //         value: provider.pickerTextColor,
            //         onColorChanged: (Color color) {
            //           provider.pickerTextColor = color;
            //         }),
            //   ),
            // ),
            // XListTile(
            //   title: "AlphabetBar selected Background",
            //   subtitle: Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: XColorPickerDialog(
            //         value: provider.pickerTextColor,
            //         onColorChanged: (Color color) {
            //           provider.pickerTextColor = color;
            //         }),
            //   ),
            // ),
            // XListTile(
            //   title: "AlphabetBar selected Background",
            //   subtitle: Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: XColorPickerDialog(
            //         value: provider.pickerTextColor,
            //         onColorChanged: (Color color) {
            //           provider.pickerTextColor = color;
            //         }),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
