import 'package:country_list_picker/country_list_picker.dart';
import 'package:country_list_picker/widget/search_tile.dart';
import 'package:country_list_picker_example/input_properties.dart';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../clp_provider.dart';
import '../picker_properties.dart';
import '../xbottom_navigation_bar.dart';
import 'dialog_properties.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                      builder: (context, provider, child) {
                        return CountryListPicker(
                          initialCountry: Countries.Egypt,
                          titleTextStyle: TextStyle(color: provider.pickerTextColor),
                          isShowFlag: provider.isShowFlag,
                          isShowCode: provider.isShowCode,
                          isDownIcon: provider.isDownIcon,
                          isShowTitle: provider.isShowTitle,
                          isShowTextField: provider.isShowTextField,
                          dialCodeTextStyle: TextStyle(
                              color: provider.pickerTextColor,
                              fontSize: provider.pickerDialCodeFontSize,
                              fontWeight: (provider.pickerDialCodeFontBold)
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                          border: (provider.pickerBorder == true)
                              ? null
                              : const Border(bottom: BorderSide.none),
                          inputTheme: InputTheme(
                            style: TextStyle(
                                color: provider.inputTextColor,
                                fontSize: provider.inputFontSize,
                                fontWeight:
                                    (provider.inputFontBold) ? FontWeight.bold : FontWeight.normal),
                            hintText: provider.inputHintString,
                            border: (provider.inputBorder == true)
                                ? const OutlineInputBorder(borderSide: BorderSide(width: 1))
                                : InputBorder.none,
                            mask: MaskTextInputFormatter(
                                mask: provider.inputMask, filter: {"#": RegExp(r'[0-9]')}),
                          ),
                          onChanged: ((value) {}),
                          dialogTheme: CountryListDialogTheme(
                            isShowFlage: provider.countryFlag,
                            isShowDialCode: provider.countryDialCode,
                            isShowFloatButton: provider.upActionbutton,
                            alphabetsBar: AlphabetsBarThemes(
                              visible: provider.alphabetBar,
                              // backgroundColor: Colors.transparent,
                              // selectedBackgroundColor: Colors.purple,
                            ),
                            searchTile: SearchTileTheme(
                              visible: provider.searchTile,
                              hint: "",
                              title: "Search",
                            ),
                            currentLocationTile: CurrentLocationTileTheme(
                              visible: provider.currentLocationTile,
                              title: "Current Location",
                            ),
                            lastPickTile: LastPickTileTheme(
                              visible: provider.lastPicktile,
                              title: "Last Pick",
                            ),
                            // backgroundColor: Colors.red,
                            // titlesBackground: Colors.purple,
                          ),
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
                      .map((index, screen) => MapEntry(
                          index, Offstage(offstage: selectedIndex != index, child: screen)))
                      .values
                      .toList(),
                ))
          ],
        ));
  }
}

final _screens = [
  const PickerProperties(),
  InputProperties(),
  const DialogProperties(),
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