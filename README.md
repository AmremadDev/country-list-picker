
![version](https://img.shields.io/badge/version-1.0.2-purple.svg) ![version](https://img.shields.io/badge/NullSefety-True-brightgreen)

CountryListPicker is flutter package for customizable country selection package with multi-languages support.

<p align="center">
  <img src="https://user-images.githubusercontent.com/62204927/212409609-eb9103ad-0c48-440c-a191-cc51f324db01.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409608-dff8732c-d8f0-495d-b7e7-c5aaaf0be193.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409624-0e87f7b9-dfc3-43a8-8eed-cdfbad19705f.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409620-52af8c07-1406-4f3c-ac6d-0c2fbbc87b3b.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409600-346e2db8-6389-475b-98f1-9c33b1309e9c.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409641-c416b802-ca16-4f8c-aebc-4cc8fb1f9cac.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409639-b69aa347-b322-46b4-8dab-b90ecdb3dba6.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409657-eb67257d-a402-48a1-8aa1-8c0c5c23853e.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409605-c12dfb06-32f2-4e49-aee3-1e03cb268ffe.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409643-63b4fa52-c6c7-4704-a991-5834d418dea0.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409612-348dfcc6-b021-4f57-bbaf-1166abea819f.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409616-87cea505-4249-486f-94a6-066addbe4925.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409629-17b07a70-740b-4f7b-a790-bee9c4e4d600.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409633-8acae86d-89f1-424d-bd33-b9e0efdceced.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409638-96f469fd-336b-4105-8e96-c383bf5d1d83.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409642-1c2ca8bd-93bb-48b4-8d32-1b5c5a8035b8.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409647-cf626037-edb8-4469-a388-46afbdd9a887.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409649-8175270f-0374-4e1e-93eb-5447e5c6673a.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409652-acfe8698-9e20-4d85-8df0-a78fedf14a2e.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409654-236470bf-5236-4db8-a97c-f9ce39d6f761.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409661-8a08a36f-2dc7-4694-bb0d-a7dbe3abb046.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409668-4e177214-21ac-417d-aa67-bf9362acd56a.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409672-522196a1-2cef-4e31-97f2-db27aa0bba8d.png" width="150">
  <img src="https://user-images.githubusercontent.com/62204927/212409673-61158fab-2a49-456b-a4d2-7fed2cedc486.png" width="150">
</p>



## Installation
Run this command:

With Flutter:
```shell
 $ flutter pub add country_list_picker
```
This will add a line like this to your package's pubspec.yaml (and run an implicit  `flutter pub get`):
```yaml
dependencies:
  country_list_picker: ^1.0.2
```
Alternatively, your editor might support  `flutter pub get`. Check the docs for your editor to learn more.

Now in your Dart code, you can use:
```dart
import 'package:country_list_picker/country_list_picker.dart'
```

### Usage

```dart
import  'package:country_list_picker/country_list_picker.dart';
void  main() {
    //simple code
    CountryListPicker(
          onCountryChanged: ((value) {
              // do something
          }),
          onChanged: (value) {
             // do something
          },
}
```


## Getting started
Supported 250 countries with common/offical name, iso_3166_1_alpha2, iso_3166_1_alpha3, dialing_code, default_number_length, default_number_format, local_number_sample.

Supported languages:
 - Arabic
 - Chinese
 - Croatian
 - Czech
 - English
 - Estonian
 - Finnish
 - French
 - German
 - Hungarian
 - Italian
 - Japanese
 - Korean
 - Persian
 - Polish
 - Portuguese
 - Russian
 - Slovak
 - Spanish
 - Swedish
 - Urdu
 <!-- - Bulgarian
 - Danish
 - Greek
 - Esperanto
 - Basque
 - Armenian
 - Lithuanian
 - Norwegian
 - Romanian
 - Thai
 - Ukrainian -->
### Picker Paramters
| Parameter              	| Type              	| Default                                                	| Description                                                                                                                                                        	|
|------------------------	|-------------------	|--------------------------------------------------------	|--------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| `onCountryChanged`     	| `ValueChanged?`   	| `null`                                                 	| This is a callback function that is invoked when the selected country is changed,  which can be used to access the newly selected country.                         	|
| `onChanged`            	| `ValueChanged?`   	| `null`                                                 	| This is a callback function that is invoked when the phone number in the input field changes,  which can be used to access the new phone number.                   	|
| `initialCountry`       	| `Countries`       	| `Countries.Egypt`                                      	| Sets the initial country that is selected when the widget is first rendered.                                                                                       	|
| `language`             	| `Languages`       	| `Languages.English`                                    	| Sets the display language for the widget.                                                                                                                          	|
| `textDirection`        	| `TextDirection`   	| --                                                     	| Sets the text direction for the widget depending on the language direction.                                                                                        	|
| `displayName`          	| `Names`           	| `Names.common`                                         	| Determines whether the country name displayed is common or official.                                                                                               	|
| `localCountry`         	| `Countries`       	| `null`                                                 	| Refer to local device which will define by you.                                                                                                                    	|
| `countryNameTextStyle` 	| `TextStyle`       	| `TextStyle(fontSize: 15, color: Colors.grey)`          	| Text style for the country name display.                                                                                                                           	|
| `isShowFlag`           	| `bool`            	| `true`                                                 	| Determines the visibility of the flag icon.  A value of true will display the flag icon, while a value of false will hide it.                                      	|
| `flagSize`             	| `Size`            	| `true`                                                 	| size of the flag icon. It has a default value Size (40,40)                                                                                                         	|
| `isShowDiallingCode`   	| `bool`            	| `true`                                                 	| Determines whether the dialling code should be displayed or not.  If true, the dialling code will be displayed. If false, it will be hidden.                       	|
| `isShowDownIcon`       	| `bool`            	| `true`                                                 	| Determines whether the flag icon should be displayed or not.  If true, the flag icon will be displayed. If false, it will be hidden.                               	|
| `isShowCountryName`   	| `bool`            	| `true`                                                 	| Determines whether the country name should be displayed or not.  If true, the country name will be displayed. If false, it will be hidden.                       	|
| `isShowInputField`     	| `bool`            	| `true`                                                 	| Determines whether the phone number input field should be displayed or not.  If true, the phone number input field will be displayed. If false, it will be hidden. 	|
| `iconDown`             	| `Icon`            	| `Icon(Icons.keyboard_arrow_down, size: 24)`            	| Determines whether the dropdown arrow icon should be displayed or not.  If true, the dropdown arrow icon will be displayed. If false, it will be hidden.           	|
| `diallCodeStyle`       	| `TextStyle`       	| `TextStyle(fontSize: 16, fontWeight: FontWeight.bold)` 	| Text style for the dialling code display.                                                                                                                          	|
| `border`               	| `InputBorder`     	| `UnderlineInputBorder()`                               	| Border of the phone number input field.                                                                                                                            	|
| `inputTheme`           	| `InputThemeData`  	| See Input Paramters section                            	| Theme data for the phone number input field.                                                                                                                       	|
| `dialogTheme`          	| `DialogThemeData` 	| See Dialog Paramters section                           	| Theme data for the country selection dialog.                                                                                                                       	|

```dart
    CountryListPicker(
        onCountryChanged: ((value) {
            // do something
        }),
        onChanged: (value) {
            // do something
        },
        initialCountry: Countries.Egypt,
        language: Languages.Arabic,
        isShowDownIcon: picker.isDownIcon,
        isShowCountryTitle: false,   // if you need to hide country title
        displayName: Names.offical,  // if you need to display country offical name
    )
```
### Input Paramters

| Parameter            	| Type          	| Default                                             	| Description                                                  	|
|----------------------	|---------------	|-----------------------------------------------------	|--------------------------------------------------------------	|
| `obscureText`        	| `bool`        	| `false`                                             	| Determines if the text input should be obscured or not.      	|
| `obscuringCharacter` 	| `String`      	| "*"                                                 	| The character used to obscure the text input.                	|
| `style`              	| `TextStyle`   	| `TextStyle(fontSize: 16)`                           	| The text style for the input field.                          	|
| `hintText`           	| `String`      	| `Enter your phone number`                           	| The hint text to be displayed when the input field is empty. 	|
| `hintStyle`          	| `TextStyle`   	| `TextStyle(fontSize: 16, color: Color(0xFF9E9E9E))` 	| text style for the hint text.                                	|
| `border`             	| `InputBorder` 	| `InputBorder.none`                                  	| The border style for the input field.                        	|
| `mask`               	| `String`      	| "### #### ###"                                      	| The mask used to format the text input.                      	|


you can set mask and hintString to default value of each country using onCountryChanged.
```dart
    String _hintString ="";
    String _mask ="";
    CountryListPicker(
        onCountryChanged: ((value) {
            _hintString = value.local_number_sample;
            _mask = value.default_number_format;lue
            // do something
        }),
        onChanged: (value) {
            // do something
        },
        inputTheme: InputThemeData(
            hintText: _hintString
            hintStyle: input.hintTextStyle,
            border:  InputBorder.UnderlineInputBorder
            mask: _mask,
          ),
    )
```
### Dialog Paramters

| Parameter            	| Type                    	| Default 	| Description                                                                                                                                        	|
|----------------------	|-------------------------	|---------	|----------------------------------------------------------------------------------------------------------------------------------------------------	|
| `isShowFlag`         	| `bool`                  	|         	| Determines whether the flag icon should be displayed. A value of true will display the flag icon, while a value of false will hide it.             	|
| `isShowDiallCode`    	| `bool`                  	|         	| Determines whether the dialling code should be displayed. A value of true will display the dialling code, while a value of false will hide it.     	|
| `isShowFloatButton`  	| `bool`                  	|         	| Determines whether the floating button should be displayed. A value of true will display the floating button, while a value of false will hide it. 	|
| `isShowSearchTile`   	| `bool`                  	|         	| Determines whether the search tile should be displayed. A value of true will display the search tile, while a value of false will hide it.         	|
| `isShowLastPickTile` 	| `bool`                  	|         	| Determines whether the last pick tile should be displayed. A value of true will display the last pick tile, while a value of false will hide it.   	|
| `isShowAlphabetsBar` 	| `bool`                  	|         	| Determines whether the alphabets bar should be displayed. A value of true will display the alphabets bar, while a value of false will hide it.     	|
| `backgroundColor`    	| `Color`                 	|         	| background color for the dialog.                                                                                                                   	|
| `textStyle`          	| `TextStyle`             	|         	| text style for the text displayed in the dialog. The default value is `TextStyle(fontSize: 16)`.                                                   	|
| `appBar`             	| `PreferredSizeWidget`   	|         	| Appbar dialog to be displayed on top of the screen.                                                                                                	|
| `tileHeight`         	| `double`                	|         	| height of the tiles. The default value is `50`                                                                                                     	|
| `alphabetsBarTheme`  	| `AlphabetsBarThemeData` 	|         	| theme data for the alphabets bar.                                                                                                                  	|
| `tilesTheme`         	| `TilesThemeData`        	|         	| theme data for the tiles.                                                                                                                          	|

```dart
    CountryListPicker(
        onCountryChanged: ((value) {
            // do something
        }),
        onChanged: (value) {
            // do something
        },
        dialogTheme: DialogThemeData(
            isShowFlag: false,          // <- hide dialog flags 
            isShowDialCode: false,      // <- hide dial code 
            isShowFloatButton: false,   // <- hide float button 
            isShowSearchTile: false,    // <- hide search tile 
            isShowLastPickTile: false,  // <- hide last pick tile
            isShowAlphabetsBar: false,  // <- hide alphabets bar 
    )
```
### Alphabets Paramters

| Parameter                 	| Type        	| Default                                               	| Description                                        	|
|---------------------------	|-------------	|-------------------------------------------------------	|----------------------------------------------------	|
| `backgroundColor`         	| `Color`     	| `Colors.transparent`                                  	| The background color of unselected alphabet item   	|
| `style`                   	| `TextStyle` 	| `TextStyle(fontSize: 12)`                             	| The text style of the alphabet item text.          	|
| `selectedBackgroundColor` 	| `Color`     	| `Colors.transparent`                                  	| The background color of alphabet item.             	|
| `selectedStyle`           	| `TextStyle` 	| `TextStyl(fontSize: 18, fontWeight: FontWeight.bold)` 	| The text style of the selected alphabet item text. 	|

Note that: the Country List Picker doesn't support alpabets bar with Chinese, Japanese and Korean languages.
 
 ```dart
    CountryListPicker(
        onCountryChanged: ((value) {
            // do something
        }),
        onChanged: (value) {
            // do something
        },
        dialogTheme: DialogThemeData(
            alphabetsBarTheme: AlphabetsBarThemeData(
              backgroundColor: Colors.transparent,
              selectedBackgroundColor: Colors.green,  //<- change background of selected item
              // style: ,           // to change unselected alphabet items text style
              // selectedStyle: ,   // to change selected alphabet items text style
            ),
    )
```
### Dialog Tiles Paramters

| Parameter                  	| Type        	| Default                                                	| Description                                 	|
|----------------------------	|-------------	|--------------------------------------------------------	|---------------------------------------------	|
| `backgroundColor`          	| `Color`     	| `Theme.of(context).colorScheme.surface`                	| The background color of the tile.           	|
| `style`                    	| `TextStyle` 	| `TextStyle(fontSize: 16, fontWeight: FontWeight.bold)` 	| The text style of the title text.           	|
| `currentLocationTileTitle` 	| `String`    	| "Current Location"                                     	| The title of the tile for current location. 	|
| `lastPickIcon`             	| `Icon`      	| `Icon(Icons.check)`                                    	| The icon for the last pick tile.            	|
| `lastPickTitle`            	| `String`    	| "Last Pick"                                            	| The title of the last pick tile.            	|
| `searchHint`               	| `String`    	| "name/dial code..."                                    	| The hint text for the search bar.           	|
| `searchHintStyle`          	| `TextStyle` 	| `TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)`     	| The text style of the search hint text.     	|
| `searchTitle`              	| `String`    	| "Search"                                               	| The title of the search bar.                	|

if you need to show CurrentLocationTile, you must set the localCountry value to country what you want.
## Features and bugs
Please file feature requests and bugs at the [issue tracker][tracker].
[issue tracker](https://github.com/AmremadDev/country-list-picker/issues)
## References.
 1. [**country_list_pick**](https://pub.dev/packages/country_list_pick)
 2. [**getworld**](https://pub.dev/packages/getworld)]
 3. [**mask_text_input_formatter**](https://pub.dev/packages/mask_text_input_formatter)


