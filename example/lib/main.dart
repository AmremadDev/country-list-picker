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
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountryListPicker(
            border: Border.all(width: 2, style: BorderStyle.none),
            onChanged: (value) => print(value.englishName.official),
          ),
          CountryListPicker(
            isShowTextField: false,
            isDownIcon: false,
            isShowCode: true,
            isShowFlag: true,
            isShowTitle: true,
            border: Border.all(width: 2, color: Colors.red),
          ),
          Divider(),
          CountryListPicker(
            codeTextStyle: const TextStyle(color: Colors.blue, fontSize: 16),
            textFieldTextStyle: const TextStyle(fontSize: 16),
            countryNameTextStyle: const TextStyle(color: Colors.amber),
          ),
          CountryListPicker(
            //intial value
            initialCountry: Countries.Oman,
            isShowFlag: true,
            isDownIcon: true,
            isShowCode: true,
            isShowTitle: false,
            isShowTextField: false,

            useUiOverlay: true,
            onChanged: (Country? code) {},
            dialogTheme: const CountryListDialogTheme(
                // //appBar
                // appBar: AppBar(title: const Text("new appbar title"), backgroundColor: Colors.pink),

                // //AlphabetsBarThemes
                // alphabetsBar: const AlphabetsBarThemes(backgroundColor: Colors.transparent, visible: true),

                // //LastPickTileTheme
                // lastPickTile: const LastPickTileTheme(visible: true, title: "last country picked", icon: Icon(Icons.check)),

                // //CurrentLocationTileTheme
                // currentLocationTile: const CurrentLocationTileTheme(visible: true, title: "current country"),

                // //SearchTileTheme
                // searchTile: const SearchTileTheme(visible: true, title: "my search", hint: "by code/name"),

                // //show/hide options
                // isShowDialCode: true,
                // isShowFlage: true,
                // isShowFloatButton: false,

                // //Styles and colors
                // backgroundColor: Colors.white,
                // titlesBackground: Colors.pink,
                // titlesStyle: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                // textStyle: const TextStyle(color: Colors.pink),

                // //Tile height
                // tileHeight: 50,
                ),
          ),
        ],
      ),
    );
  }
}
