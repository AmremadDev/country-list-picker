import 'package:country_list_picker_example/controller/onboarding_provider.dart';
import 'package:country_list_picker_example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/settings_provider.dart';
import '../controller/dialog_provider.dart';
import '../controller/input_provider.dart';
import '../controller/picker_provider.dart';
import '../app_data.dart';

enum Borders {
  none("None"),
  underline("Underline Border"),
  outline("Outline Border");

  const Borders(this.name);
  final String name;
}

void main() {
  runApp(MultiProvider(
    providers: [
      // Settings Provider
      ChangeNotifierProvider<SettingsProvider>(create: (ctx) => SettingsProvider()),

      // Onborading Provider
      ChangeNotifierProvider<OnboardingProvider>(create: (ctx) => OnboardingProvider()),

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
            home: const HomePage());
      },
    );
  }
}
