import 'package:flutter/material.dart';
import 'package:xcountry/country_list_picker.dart';
import 'package:xcountry/models/country.dart';

void main() {
  runApp(const CountryListPickerApp());
}

class CountryListPickerApp extends StatelessWidget {
  const CountryListPickerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country List Picker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(title: 'Country List Picker Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _code = "eg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CountryListPicker(
              initialSelection: _code,
              useUiOverlay: true,
              onChanged: (Country? code) {},

              dialogTheme: const CDialogTheme(
                alphabetsBar: AlphabetsBar(backgroundColor: Colors.red , visible: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
