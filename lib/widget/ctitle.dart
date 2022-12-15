import 'package:flutter/material.dart';

class CTitle extends StatelessWidget {
  const CTitle({
    Key? key,
    required this.title,
    required this.background,
    required this.titlesStyle,
    this.height = 50.0,
  }) : super(key: key);
  final String title;
  final Color background;
  final double height;
  final TextStyle titlesStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: height,
      child: Text(title, 
      style: titlesStyle.copyWith(fontSize: titlesStyle.fontSize??16),
      
      ),
    );
    
  }
}
