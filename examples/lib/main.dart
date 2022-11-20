import 'package:country_list_picker/country_list_picker.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
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
      body: Center(
        child: CountryListPicker(
          // dialogTheme: XDialogTheme(
          //   // titlesStyle: TextStyle(color: Colors.red),
          //   // titlesBackground: Colors.red,

          //   isShowCurrentLocation: true,
          //   isShowSearch: true,
          //   titlesStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
          //   // titlesBackground: Colors.grey
          // ),

          // countryBuilder: (context, country) {
          //   return SizedBox(
          //     height: 50,
          //     child: ListTile(
          //       title: Text(country.name!),
          //     ),
          //   );
          // },

        
          initialSelection: _code,
          useUiOverlay: true,
          onChanged: (Country? code) {},
        ),
      ),
      // Center is a layout widget. It takes a single child and positions it
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
