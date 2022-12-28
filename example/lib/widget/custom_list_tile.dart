import 'dart:html';

import 'package:flutter/material.dart';

class CustomListTile<T> extends StatelessWidget {
  const CustomListTile({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
     T type;
    return Container(
      // child: ListTile(title: Text(type!.runtimeType.toString()),)
    );
  }
}