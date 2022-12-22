import 'package:country_list_picker/country_list_picker.dart';
import 'package:country_list_picker_example/clp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'picker_properties.dart';
import 'xbottom_navigation_bar.dart';

void main() {
  runApp(ChangeNotifierProvider<CLPProvider>(
    create: (context) => CLPProvider(),
    child: const CountryListPickerExample(),
  ));
}

class CountryListPickerExample extends StatelessWidget {
  const CountryListPickerExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country List Picker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isShowFlag = true;
  bool isShowTitle = true;
  bool isShowCode = true;
  bool isDownIcon = true;
  bool isShowTextField = true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Country List Picker Demo"),
        ),
        bottomNavigationBar: XBottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<CLPProvider>(
                      builder: (context, data, child) {
                        return CountryListPicker(
                          isShowFlag: data.isShowFlag,
                          isShowCode: isShowCode,
                          isDownIcon: isDownIcon,
                          isShowTitle: isShowTitle,
                          isShowTextField: isShowTextField,
                        );
                      },
                    )
                  ],
                )),
            Container(),
            Expanded(
                flex: 6,
                child: Stack(
                  children: _screens
                      .asMap()
                      .map(
                          (index, screen) => MapEntry(index, Offstage(offstage: selectedIndex != index, child: screen)))
                      .values
                      .toList(),
                ))
          ],
        ));
  }
}

final _screens = [
  PickerProperties(

      // isShowFlag: isShowFlag,
      //       isShowCode: isShowCode,
      //       isDownIcon: isDownIcon,
      //       isShowTitle: isShowTitle,
      //       isShowTextField: isShowTextField
      ),
  const Scaffold(
    body: Center(
        child: Text(
      "Input",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    )),
  ),
  const Scaffold(
    body: Center(
        child: Text(
      "Dialog",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    )),
  ),
  const Scaffold(
    body: Center(
        child: Text(
      "About",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    )),
  ),
];

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     // TextFormField(
      //     //   inputFormatters: [
      //     //     MaskTextInputFormatter(mask: "### #### ####", filter: {"#": RegExp(r'[0-9]')}),
      //     //   ],
      //     //   onChanged: (value) => print(value),
      //     // ),
      //     CountryListPicker(
      //       // textFieldTextStyle: TextStyle(color: Colors.red),
      //       border: Border.all(width: 2, color: Theme.of(context).primaryColor),
      //       inputTheme: const InputTheme(border: OutlineInputBorder()),
      //     ),
      //     CountryListPicker(
      //       // border: const Border(
      //       //   left: BorderSide(),
      //       //   bottom: BorderSide(width: 1)),
      //       isShowTitle: false,
      //       onChanged: (value) {
      //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //           content: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [Text(value.englishName.official), Text(value.callingCode)],
      //           ),
      //           duration: const Duration(seconds: 1),
      //           backgroundColor: Theme.of(context).primaryColor,
      //         ));
      //       },
      //       dialogTheme: const CountryListDialogTheme(
      //         alphabetsBar: AlphabetsBarThemes(
      //           visible: true,
      //           backgroundColor: Colors.transparent,
      //           textStyle: TextStyle(color: Colors.black),
      //           selectedBackgroundColor: Colors.redAccent,
      //           selectedTextStyle: TextStyle(color: Colors.white),
      //         ),

      //         //LastPickTileTheme
      //         lastPickTile: LastPickTileTheme(
      //           title: "Last Pick",
      //           icon: Icon(Icons.check_circle_outline_outlined),
      //         ),

      //         //CurrentLocationTileTheme
      //         currentLocationTile: CurrentLocationTileTheme(
      //           visible: true,
      //           title: "Current Location",
      //         ),

      //         //SearchTileTheme
      //         searchTile: SearchTileTheme(
      //           visible: true,
      //           title: "my search",
      //           hint: "by code/name",
      //         ),
      //       ),
      //     ),
      //   ],
      // ),