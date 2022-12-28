import 'package:flutter/material.dart';
class Argument {
  bool isExpanded;

  final String title;
  final Widget child;
  var key;
  Argument({
    required this.title,
    required this.child,
    this.isExpanded = false,

  });
}
