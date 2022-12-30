import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';
import '../controller/settings_provider.dart';

extension TranslationExtension on String {
  String get tr {
    String? trans;
    if (textDirectionShared == TextDirection.rtl) {
      trans =
          transaltionList["ar"]?.entries.firstWhereOrNull((element) => element.key == this)?.value;
    } else {
      trans =
          transaltionList["en"]?.entries.firstWhereOrNull((element) => element.key == this)?.value;
    }

    return trans ?? this;
  }
}

Map<String, Map<String, String>> transaltionList = {
  "en": {
    "Country List Picker Demo": "Country List Picker Demo",
    "Picker": "Picker",
    "Input": "Input",
    "Dialog": "Dialog",
    "About": "About",
    "Flag": "Flag",
    "Dial Code": "Dial Code",
    "Down Icon": "Down Icon",
    "Country Name": "Country Name",
    "Border": "Border",
    "Visible": "Visible",
    "Width": "Width",
    "Height": "Height",
    "Font Bold": "Font Bold",
    "Font Size": "Font Size",
    "Font Color": "Font Color",
    "Icon Size": "Icon Size",
    "Icon Color": "Icon Color",
    "Mask format": "Mask format",
    "Hint": "Hint",
    "Input Hint": "Input Hint",
    "General": "General",
    "App Bar Title": "App Bar Title",
    "Country Flag": "Country Flag",
    "Country dial code": "Country dial code",
    "Up action button": "Up action button",
    "Tile height": "Tile height",
    "Background Color": "Background Color",
    "Titles Background Color": "Tile Background Color",
    "Title TextStyle": "Title TextStyle",
    "TextStyle": "TextStyle",
    "Search Tile": "Search Tile",
    "Current Location Tile": "Current Location Tile",
    "Last Pick Tile": "Last Pick Tile",
    "Alphabets Bar": "Alphabets Bar",
    "Title String": "Title String",
    "Hint String": "Hint String",
    "Icon": "Icon",
    "Unselected Background": "Unselected Background",
    "Unselected Font Bold": "Unselected Font Bold",
    "Unselected Font Size": "Unselected Font Size",
    "Unselected Font Color": "Unselected Font Color",
    "Selected Background": "Selected Background",
    "Selected Font Bold": "Selected Font Bold",
    "Selected Font Size": "Selected Font Size",
    "Selected Font Color": "Selected Font Color",
  },
  "ar": {
    "Country List Picker Demo": "قائمة إختيار الدول",
    "Picker": "أداة الإدخال",
    "Input": "اداة الإدخال",
    "Dialog": "مربع الإختيار",
    "About": "حول",
    "Flag": "العلم",
    "Dial Code": "كود الإتصال",
    "Down Icon": "أيكون الإخنيار",
    "Country Name": "أسم الدولة",
    "Border": "الحدود",
    "Visible": "مرئي",
    "Width": "العرض",
    "Height": "الطول",
    "Font Bold": "خط سميك",
    "Font Size": "مقاس الخط",
    "Font Color": "لون الخط",
    "Icon Size": "مقاس الأيكونة",
    "Icon Color": "لون الأيكون",
    "Mask format": "قناع رقم الهاتف",
    "Hint": "الملحوظة",
    "Input Hint": "ملحوظة الإدخال",
    "General": "عام",
    "App Bar Title": "أسم شريط العنوان",
    "Country Flag": "علم الدولة",
    "Country dial code": "كود إتصال الدولة",
    "Up action button": "زر أول الصفحة",
    "Tile height": "إرتفاع الوحدة",
    "Background Color": "لون الخلفية",
    "Titles Background Color": "اللون الخلفي للعنوانين",
    "Title TextStyle": "نمط خط العنوان",
    "TextStyle": "نمط الخط",
    "Search Tile": "وحدة البحث",
    "Current Location Tile": "وحدة المكان الحالي",
    "Last Pick Tile": "وحدة أخر إختيار",
    "Alphabets Bar": "شريط الحروف الهجائية",
    "Title String": "نص العنوان",
    "Hint String": "نص الملاحظة",
    "Icon": "الأيكونة",
    "Unselected Background": "خلفية الحرف الغير محدد",
    "Unselected Font Bold": "خط سميك للحرف الغير محدد",
    "Unselected Font Size": "مقاس الحرف الغير مجدد",
    "Unselected Font Color": "لون الخط الغير محدد",
    "Selected Background": "خلفية الحرف المحدد",
    "Selected Font Bold": "خط سميك للحرف المحدد",
    "Selected Font Size": "مقاس الحرف المحدد",
    "Selected Font Color": "لون الخط المحدد",
  }
};
