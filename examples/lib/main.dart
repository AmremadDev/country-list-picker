import 'dart:convert';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart' show rootBundle;
import 'package:xcountry/country_list_picker.dart';

void main() {
  material.runApp(const CountryListPickerApp());
}

Future readJsonFile(String filePath) async {
  var jsonText = await rootBundle.loadString('jsons/countries.json');

  // var input = await File(filePath).readAsString();
  var map = jsonDecode(jsonText);
  return map["countries"];
}

class CountryListPickerApp extends material.StatelessWidget {
  const CountryListPickerApp({super.key});

  // This widget is the root of your application.
  @override
  material.Widget build(material.BuildContext context) {
    return material.MaterialApp(
      title: 'Country List Picker Demo',
      debugShowCheckedModeBanner: false,
      theme: material.ThemeData(
        primarySwatch: material.Colors.purple,
      ),
      home: const HomePage(title: 'Country List Picker Demo'),
    );
  }
}

class HomePage extends material.StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  material.State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends material.State<HomePage> {
  final String _code = "eg";

  @override
  material.Widget build(material.BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(
        title: material.Text(widget.title),
      ),
      body: material.Column(
        mainAxisAlignment: material.MainAxisAlignment.center,
        children: [
          // Center(
          //   child: ElevatedButton(
          //       child: const Text("Json File"),
          //       onPressed: () async {
          //         Map<String, dynamic> list = await readJsonFile("jsons/countries.json");
          //         print(list.entries.toList()[200]);
          //       }),
          // ),
          material.Center(
            child: CountryListPicker(
              initialSelection: _code,
              useUiOverlay: true,
              // useSafeArea: true,
              onChanged: (Country? code) {},
              //   dialogTheme: CDialogTheme(
              //     // appBar: AppBar(
              //     //   title: const Text("Select Country"),
              //     //   actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.flag_outlined))],
              //     // ),
              //     // isShowSearch: false,
              //     // isShowCurrentLocation: false,
              //     // isShowLastPickCountry: false,
              //     // isShowDialCode: false,
              //     // isShowFlage: true,
              //     // isShowAphabetScroll: true,
              //     // isShowFloatButton: false,
              //     // alphabetBackgroundColor: Colors.black ,
              //     // alphabetTextStyle: const TextStyle(color: Colors.red) ,
              //     // alphabetSelectedBackgroundColor: Colors.grey,
              //     // alphabetSelectedTextStyle: const TextStyle(color: Colors.green, fontSize: 16) ,
              //     //  titlesBackground: Colors.green,
              //     //  backgroundColor: Colors.red ,
              //     //  lastPickIcon: const Icon(Icons.safety_check,size: 30, color: Colors.amber,),
              //     // currentLocationText: "local Country",
              //     // lastPickText: "last selection" ,
              //     // searchHintText:  "hint search by dial/name",
              //     // searchText: "Search Here" ,
              //     // rowHeight: 50,
              //     // textStyle: TextStyle(fontSize: 11, color: Colors.green),
              //     // titlesStyle: TextStyle(color: Colors.amber) ,
              //   ),
            ),
          ),
        ],
      ),
      // Center is a layout widget. It takes a single child and positions it
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
