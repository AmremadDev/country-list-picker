import 'package:flutter/material.dart';

class XBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int>? onTap;
  final int currentIndex;

  final bool isShowFlag;
  final bool isShowTitle;
  final bool isShowCode;
  final bool isDownIcon;
  final bool isShowTextField;
  const XBottomNavigationBar({
    Key? key,
    this.onTap,
    this.currentIndex = 0,
    this.isShowFlag = true,
    this.isShowCode = true,
    this.isDownIcon = true,
    this.isShowTextField = true,
    this.isShowTitle = true,
  }) : super(key: key);

  @override
  State<XBottomNavigationBar> createState() => _XBottomNavigationBarState();
}

class _XBottomNavigationBarState extends State<XBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        elevation: 0,
        iconSize: 26,
        backgroundColor: Colors.white,
        onTap: widget.onTap,
        currentIndex: widget.currentIndex,
        // type: BottomNavigationBarType.shifting,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Picker",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi_outlined),
            label: "Input",
            activeIcon: Icon(Icons.text_fields_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: "Dialog",
            activeIcon: Icon(Icons.list_alt),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
            activeIcon: Icon(Icons.info),
          ),
        ]);
  }
}
