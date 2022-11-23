import 'package:flutter/material.dart';
import 'package:xcountry/country_list_picker.dart';


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
      body: Center(
        child: CountryListPicker(
          initialSelection: _code,
          useUiOverlay: true,
          // useSafeArea: true,
          onChanged: (Country? code) {},
          dialogTheme: CDialogTheme(
            
            appBar: AppBar(
              title: const Text("Select Country"),
              actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.flag_outlined))],
            ),
            isShowSearch: true,
            isShowCurrentLocation: true,
            isShowLastPickCountry: true,
            isShowDialCode: true,
            isShowFlage: true,
            isShowAphabetScroll: true,
            isShowFloatButton: true,

            // alphabetBackgroundColor: ,
            // alphabetSelectedBackgroundColor: ,
            // alphabetSelectedTextStyle: ,
            // alphabetTextStyle: ,
            // backgroundColor: ,
            // checkIcon: ,
            // currentLocationText: ,
            // lastPickText: ,
            // searchHintText: ,
            // searchText: ,
            // titlesBackground: ,
            // titlesStyle: ,
          ),
        ),
      ),
      // Center is a layout widget. It takes a single child and positions it
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
