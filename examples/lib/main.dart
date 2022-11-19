import 'package:country_list_picker/country_list_picker.dart';
import 'package:country_list_picker/dialog_theme.dart';
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
      title: 'Flutter Demo',
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
          width: 300,
          appBar: AppBar(
            elevation: 0,
            title: const Text('Pick your country'),
          ),

          // countryBuilder: (context, countryCode) {
          //   return Material(
          //     color: Colors.white,
          //     child: ListTile(
          //       selectedColor: Colors.white,
          //       leading: Image.asset("${countryCode.flagUri}", package: 'country_list_pick', scale: 10),
          //       title: Stack(children: [
          //         Text("${countryCode.name}"),
          //         Positioned(right: 25, child: Text("${countryCode.dialCode}"))
          //       ]),
          //       onTap: () {
          //         _code = countryCode.code;
          //         print(_code);
          //         Navigator.pop(context);

          //         setState(() {});
          //       },
          //     ),
          //   );
          // },

          // pickerBuilder: (context, countryCode) {
          //   return null;
          // },
          // dialogTheme: XDialogTheme(checkIcon: Icon(Icons.person)),
          // pickerTheme: XPickerTheme(
          //   isShowFlag: true,
          //   isShowTitle: false,
          //   isShowCode: true,
          //   codeTextStyle: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          //   numberTextStyle: const TextStyle(color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
          //   isDownIcon: false,
          //   showEnglishName: true,
          //   alphabetSelectedBackgroundColor: Colors.transparent,
          //   alphabetSelectedTextColor: Colors.blue,
          //   lastPickText: "Last Picked Country",
          //   labelColor: Colors.black,
          //   searchText: "Search",
          //   color: Colors.amber,
          //   isShowSearch: true,
          // ),
          dialogTheme: XDialogTheme(
            titlesStyle: TextStyle(color: Colors.red),
            // titlesBackground: Colors.red,
            isShowCurrentLocation: true,
            isShowSearch: true,
          ),
          initialSelection: _code,
          useUiOverlay: false,
          onChanged: (Country? code) {},
        ),
      ),
      // Center is a layout widget. It takes a single child and positions it
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
