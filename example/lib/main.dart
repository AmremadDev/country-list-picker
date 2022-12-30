import 'package:country_list_picker_example/translation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/settings_provider.dart';
import '../controller/dialog_provider.dart';
import '../controller/input_provider.dart';
import '../controller/picker_provider.dart';
import '../bottom_part.dart';
import '../app_data.dart';
import '../top_part.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // Settings Provider
      ChangeNotifierProvider<SettingsProvider>(create: (ctx) => SettingsProvider()),

      // Picker Provider
      ChangeNotifierProxyProvider<SettingsProvider, PickerProvider>(
          create: (context) => PickerProvider(),
          update: (ctx, settings, picker) => picker!..update(settings)),

      // Input Provider
      ChangeNotifierProxyProvider<SettingsProvider, InputProvider>(
          create: (context) => InputProvider(),
          update: (ctx, settings, input) => input!..update(settings)),

      // dialog Provider
      ChangeNotifierProxyProvider<SettingsProvider, DialogProvider>(
          create: (context) => DialogProvider(),
          update: (ctx, settings, dialog) => dialog!..update(settings)),
    ],
    child: const CountryListPickerExample(),
  ));
}

class CountryListPickerExample extends StatelessWidget {
  const CountryListPickerExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
            title: 'Country List Picker Demo',
            debugShowCheckedModeBanner: false,
            themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: (settings.textDirection == TextDirection.ltr) ? "Quicksand" : "Cairo",
              primarySwatch: darkprimarySwatch as MaterialColor,
              toggleableActiveColor: darkprimarySwatch,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.white,
                selectedItemColor: darkprimarySwatch,
              ),
            ),
            theme: ThemeData(
              brightness: Brightness.light,
              fontFamily: (settings.textDirection == TextDirection.ltr) ? "Quicksand" : "Cairo",
              primarySwatch: lightprimarySwatch as MaterialColor,
              expansionTileTheme: ExpansionTileThemeData(
                  backgroundColor: lightprimarySwatch.withOpacity(.1),
                  collapsedBackgroundColor: lightprimarySwatch.withOpacity(.5)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.black38,
                selectedItemColor: lightprimarySwatch,
              ),
            ),
            home: Directionality(
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
            ));
      },
    );
  }
}
