import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/dialog_provider.dart';
import '../custom_list_tile.dart';

class LastPickTileArguments extends StatelessWidget {
  const LastPickTileArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, dialog, child) {
        return Column(
          children: [
            CustomListTile<Switch, bool>(
              title: "Visible",
              value: dialog.lastPickTile,
              onChanged: (bool value) => dialog.lastPickTile = value,
            ),
                        CustomListTile<TextFormField, String>(
              title: "Title String",
              value: dialog.lastPickTileTitle,
              onChanged: (String value) => dialog.lastPickTileTitle = value,
            ),
              const SizedBox(height: 20,),
          ],
        );
      },
    );
  }
}
