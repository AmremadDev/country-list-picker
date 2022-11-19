import 'package:country_list_picker/xPickerTheme.dart';
import 'package:flutter/material.dart';
import 'package:country_list_picker/country_list_picker.dart';
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
      home: const HomePage(title: 'Flutter Demo Home Page'),
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
 
   String? _code = "IN";



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
          pickerTheme: XPickerTheme(
            isShowFlag: true,
            isShowTitle: false,
            isShowCode: true,
            codeTextStyle: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            numberTextStyle: const TextStyle(color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
            isDownIcon: false,
            showEnglishName: true,
            alphabetSelectedBackgroundColor: Colors.transparent,
            alphabetSelectedTextColor: Colors.blue,
            lastPickText: "Last Picked Country",
            labelColor: Colors.black,
            searchText: "Search",
            color: Colors.amber,
            isShowSearch: true,
      
    
          ),

          initialSelection: _code,
          useUiOverlay: false,
          onChanged: (Country? code) {

          },
        ),
      ),
        // Center is a layout widget. It takes a single child and positions it
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
