import 'package:flutter/material.dart';

class Screen {
  final String title;
  final Widget child;
  final IconData activeIcon;
  final IconData inactiveIcon;

  const Screen({
    required this.title,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.child,
  });
}
