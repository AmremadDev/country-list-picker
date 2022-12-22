import 'package:country_list_picker/country_list_picker.dart';
import 'package:country_list_picker_example/clp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'xsetting_list_tile.dart';

class PickerProperties extends StatefulWidget {
  PickerProperties({Key? key}) : super(key: key);
  @override
  State<PickerProperties> createState() => _PickerPropertiesState();
}

class _PickerPropertiesState extends State<PickerProperties> {
  bool isShowFlag = true;
  bool isShowTitle = true;
  bool isShowCode = true;
  bool isDownIcon = true;
  bool isShowTextField = true;
  @override
  Widget build(BuildContext context) {
    print("build");
    return Container(
      // color: Theme.of(context).primaryColor.withAlpha(100),
      child: ListView(
        children: [
          XSettingListTile(
            title: 'isShowFlag',
            subtitle: "Show/Hide Flag",
            toggle: Switch(
              value: isShowFlag,
              onChanged: (bool value) {
                setState(() {
                  isShowFlag = value;
                  context.read<CLPProvider>().isShowFlagUpdate(value);
                });
              },
            ),
          ),
          XSettingListTile(
            title: 'isShowCode',
            subtitle: "Show/Hide Flag",
            toggle: Switch(onChanged: (bool value) {}, value: true),
          ),
          XSettingListTile(
            title: 'isDownIcon',
            subtitle: "Show/Hide Flag",
            toggle: Switch(onChanged: (bool value) {}, value: true),
          ),
          XSettingListTile(
            title: 'isShowTitle',
            subtitle: "Show/Hide Flag",
            toggle: Switch(onChanged: (bool value) {}, value: true),
          ),
          XSettingListTile(
            title: 'isShowTextField',
            subtitle: "Show/Hide Flag",
            toggle: Switch(onChanged: (bool value) {}, value: true),
          ),
        ],
      ),
    );
  }
}


        // CountryListPicker(
        //   border: ,
        //   dialCodeTextStyle: ,
        //   dialogBuilder: ,
        //   dialogTheme: ,
        //   initialCountry: ,
        //   inputBorder: ,
        //   inputTheme: ,
        //   isDownIcon: ,
        //   isShowCode: ,
        //   isShowFlag: ,
        //   isShowTextField: ,
        //   isShowTitle: ,
        //   margin: ,
        //   onChanged: ,
        //   key: ,
        //   padding: ,
        //   pickerBuilder: ,
        //   textFieldTextStyle: ,
        //   titleTextStyle: ,
        //   useSafeArea: ,
        //   useUiOverlay: ,
        // )