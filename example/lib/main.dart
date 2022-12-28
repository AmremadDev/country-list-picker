
import 'package:country_list_picker_example/bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/settings_provider.dart';
import '../widget/bottom_navigation_bar.dart';
import '../controller/dialog_provider.dart';
import '../controller/input_provider.dart';
import '../controller/picker_provider.dart';
import '../screens_data.dart';
import '../top_part.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      // Settings Provider
      ChangeNotifierProvider<SettingsProvider>(create: (ctx) => SettingsProvider()),

      // Picker Provider
      ChangeNotifierProxyProvider<SettingsProvider, PickerProvider>(
          create: (context) => PickerProvider(), update: (ctx, settings, picker) => picker!..update(settings)),

      // Input Provider
      ChangeNotifierProxyProvider<SettingsProvider, InputProvider>(
          create: (context) => InputProvider(), update: (ctx, settings, input) => input!..update(settings)),

      // dialog Provider
      ChangeNotifierProxyProvider<SettingsProvider, DialogProvider>(
          create: (context) => DialogProvider(), update: (ctx, settings, dialog) => dialog!..update(settings)),
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
            fontFamily: "Quicksand",
            primarySwatch: darkprimarySwatch as MaterialColor,
            toggleableActiveColor: darkprimarySwatch,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedItemColor: Colors.white,
              selectedItemColor: darkprimarySwatch,
            ),
          ),
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: "Quicksand",
            primarySwatch: lightprimarySwatch as MaterialColor,
            expansionTileTheme: ExpansionTileThemeData(
                backgroundColor: Colors.purple.shade50, collapsedBackgroundColor: Colors.purple.shade100),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedItemColor: Colors.black38,
              selectedItemColor: lightprimarySwatch,
            ),
          ),
          home: Scaffold(
              // backgroundColor: Colors.green,
              appBar: AppBar(
                title: const Text("Country List Picker Demo"),
                actions: [
                  IconButton(
                    onPressed: () => settings.isDarkMode = !settings.isDarkMode,
                    icon: settings.isDarkMode
                        ? const Icon(
                            Icons.sunny,
                            color: Colors.yellow,
                          )
                        : const Icon(
                            Icons.dark_mode,
                            color: Colors.white,
                          ),
                  )
                ],
              ),
              bottomNavigationBar: XBottomNavigationBar(
                  currentIndex: settings.selectedScreen, onTap: (index) => settings.selectedScreen = index),
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
                        .map((index, screen) => MapEntry(index,
                            Offstage(offstage: settings.selectedScreen != index, 
                            child: BottomPart(screen: screen))))
                        .values
                        .toList(),
                  )),
                ],
              ),)
        );
      },
    );
  }
}
