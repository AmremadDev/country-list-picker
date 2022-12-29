import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/dialog_provider.dart';
import '../custom_list_tile.dart';

class CurrentLocationTileArguments extends StatelessWidget {
  const CurrentLocationTileArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, dialog, child) {
        return Column(
          children: [
            CustomListTile<Switch, bool>(
              title: "Visible",
              value: dialog.currentLocationTile,
              onChanged: (bool value) => dialog.currentLocationTile = value,
            ),
                                    CustomListTile<TextFormField, String>(
              title: "Title String",
              value: dialog.currentLocationTileTitle,
              onChanged: (String value) => dialog.currentLocationTileTitle = value,
            ),
           const SizedBox(height: 20,),
          ],
        );
      },
    );
  }
}
