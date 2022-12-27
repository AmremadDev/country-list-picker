import 'package:flutter/material.dart';

import '../../const.dart';
import '../../model/screen.dart';

class BottomPartSample extends StatefulWidget {
  final Screen screen;

   const BottomPartSample({

    required this.screen,
    }) ;

  @override
  State<BottomPartSample> createState() => _BottomPartSampleState();
}

class _BottomPartSampleState extends State<BottomPartSample> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ExpansionPanelList(
          elevation: 1,
          dividerColor: Colors.red,
          animationDuration: const Duration(milliseconds: 500),
          expandedHeaderPadding: EdgeInsets.all(20),
          expansionCallback: (panelIndex, isExpanded) {
            for (Argument element in widget.screen.arguments) {
              element.isExpanded = false;
            }
           widget.screen.arguments[panelIndex].isExpanded = true;
      
            setState(() {});
          },
          children: widget.screen.arguments
              .map((arg) => ExpansionPanel(
                backgroundColor: Colors.pinkAccent,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(arg.title),
                    ),
                    body: arg.child,
                    isExpanded: arg.isExpanded,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
