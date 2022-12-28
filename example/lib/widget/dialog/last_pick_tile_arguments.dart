import 'package:country_list_picker_example/controller/dialog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_tile.dart';

class LastPickTileArguments extends StatelessWidget {
  const LastPickTileArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            XListTile(
                titleAsString: 'Visible',
                toggle: Switch(
                    value: provider.lastPicktile,
                    onChanged: (bool value) {
                      provider.lastPicktile = value;
                    })),
          ],
        );
      },
    );
  }
}
