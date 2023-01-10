
![version](https://img.shields.io/badge/version-1.0.0-purple.svg) ![version](https://img.shields.io/badge/NullSefety-True-brightgreen)
[![pub package](https://img.shields.io/pub/v/country_list_picker.svg)](https://pub.dev/packages/country_list_picker)


"CountryListPicker for Flutter: A fast and customizable country selection package with multilingual support, open-source and well-documented"

CountryListPicker is a customizable country picker for Flutter. The CountryListPicker can show many different languages. The sizes and styles used for the picker items can be customized.

The CountryListPicker for Flutter is a feature-rich package that provides an easy and fast solution for selecting countries within the application. The package offers flexibility in terms of customization options, allowing users to adjust various aspects of the picker, such as its size, style and colors, with ease. Additionally, it is multilingual, making it accessible for users around the world. The package has been thoroughly tested and offers comprehensive documentation making it easy to understand and implement. Furthermore, it is open source, making it accessible to developers everywhere.

## Installation
Run this command:

With Flutter:
```shell
 $ flutter pub add country_list_picker
```
This will add a line like this to your package's pubspec.yaml (and run an implicit  `flutter pub get`):
```yaml
dependencies:
  country_list_picker: ^1.0.0
```
Alternatively, your editor might support  `flutter pub get`. Check the docs for your editor to learn more.

Now in your Dart code, you can use:
```dart
import 'package:country_list_picker/country_list_picker.dart'
```

### Usage

```dart
import  'package:country_list_picker/country_list_picker.dart';
void  main() async {
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
later


