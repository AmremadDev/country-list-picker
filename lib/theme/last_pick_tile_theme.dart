import 'package:flutter/material.dart';

class LastPickTileTheme {
  final bool visible;
  final String title;
  final Icon icon;
  const LastPickTileTheme({
    this.visible = true,
    this.title = "Last Pick",
    this.icon = const Icon(Icons.check),
  });
}
