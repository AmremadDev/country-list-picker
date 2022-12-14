
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
          // Center(
          //   child: ElevatedButton(
          //       child: const Text("Json File"),
          //       onPressed: () async {
          //         Map<String, dynamic> list = await readJsonFile("jsons/countries.json");
          //         print(list.entries.toList()[200]);
          //       }),
          // ),
          Center(
            child: CountryListPicker(
              initialSelection: _code,
              useUiOverlay: true,
              // useSafeArea: true,
              onChanged: (Country? code) {}, 
              // dialogTheme: null,
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
