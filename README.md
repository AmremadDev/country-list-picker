
![version](https://img.shields.io/badge/version-1.0.0-purple.svg) ![version](https://img.shields.io/badge/NullSefety-True-brightgreen)

"CountryListPicker for Flutter: A fast and customizable country selection package with multilingual support, open-source and well-documented"


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
later


