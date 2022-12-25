import 'package:flutter/cupertino.dart';

class Category {
  final String title;
  final String? subTitles;
  final IconData? icon;
  final List<Widget>? arguments;

  Category({
    required this.title,
    this.subTitles,
    this.icon,
    this.arguments,
  });
}
