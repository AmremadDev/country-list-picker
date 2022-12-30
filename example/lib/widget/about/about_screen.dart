import 'package:flutter/material.dart';
import '../../model/screen.dart';

class AboutScreen extends StatelessWidget {
  final Screen? screen;
  const AboutScreen({this.screen, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Powered By Amr Emad",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
