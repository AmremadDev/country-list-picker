import 'package:country_list_picker_example/controller/dialog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_tile.dart';

class CurrentLocationTileArguments extends StatelessWidget {
  const CurrentLocationTileArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            XListTile(
                titleAsString: 'Visible',
                toggle: Switch(
                    value: provider.currentLocationTile,
                    onChanged: (bool value) {
                      provider.currentLocationTile = value;
                    })),
          ],
        );
      },
    );
  }
}
