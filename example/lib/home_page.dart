import 'package:country_list_picker_example/translation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';
import '../bottom_part.dart';
import '../controller/settings_provider.dart';
import '../top_part.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of(context);
    return Directionality(
      textDirection: settings.textDirection,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Country List Picker Demo".tr),
          actions: [
            IconButton(
              onPressed: () {
                settings.textDirection = (settings.textDirection == TextDirection.ltr)
                    ? TextDirection.rtl
                    : TextDirection.ltr;
              },
              icon: settings.textDirection == TextDirection.ltr
                  ? Icon(
                      Icons.swipe_right,
                      color: settings.isDarkMode ? darkprimarySwatch : Colors.white,
                    )
                  : Icon(
                      Icons.swipe_left,
                      color: settings.isDarkMode ? darkprimarySwatch : Colors.white,
                    ),
            ),
            IconButton(
              onPressed: () => settings.isDarkMode = !settings.isDarkMode,
              icon: settings.isDarkMode
                  ? const Icon(
                      Icons.sunny,
                      color: darkprimarySwatch,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: settings.selectedScreen,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          items: screens
              .map((e) => BottomNavigationBarItem(
                    icon: Icon(e.inactiveIcon),
                    label: e.title.tr,
                    activeIcon: Icon(e.activeIcon),
                  ))
              .toList(),
          onTap: (index) => settings.selectedScreen = index,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 130,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Card(elevation: 2, child: TopPart()),
            ),
            Expanded(
                child: Stack(
              children: screens
                  .asMap()
                  .map((index, screen) => MapEntry(
                      index,
                      Offstage(
                          offstage: settings.selectedScreen != index,
                          child: BottomPart(screen: screen))))
                  .values
                  .toList(),
            )),
          ],
        ),
      ),
    );
  }
}
