import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/clp_provider.dart';
import '../widget/bottom_part.dart';
import '../widget/top_part.dart';

void main() {
  runApp(ChangeNotifierProvider<CLPProvider>(
    create: (context) => CLPProvider(context: context),
    child: const CountryListPickerExample(),
  ));
}

class CountryListPickerExample extends StatelessWidget {
  const CountryListPickerExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<CLPProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          title: 'Country List Picker Demo',
          debugShowCheckedModeBanner: false,
          themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData(
            toggleableActiveColor: Colors.purple,
            fontFamily: "Quicksand",
            primarySwatch: Colors.purple,
            brightness: Brightness.dark,
          ),
          theme: ThemeData(
            fontFamily: "Quicksand",
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Country List Picker Demo"),
              actions: [
                IconButton(
                  onPressed: () => provider.isDarkMode = !provider.isDarkMode,
                  icon: provider.isDarkMode ? const Icon(Icons.dark_mode) : const Icon(Icons.sunny),
                )
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 110,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Card(elevation: 2, child: TopPart()),
                ),
                const Expanded(child: BottomPart()),
              ],
            ),
          ),
        );
      },
    );
  }
}
