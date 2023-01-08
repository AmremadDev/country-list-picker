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
    "Obscure Text": "Obscure Text",
    "Obscuring Character": "Obscuring Character",
    "Type": "Type",
    "SKIP": "SKIP",
    "NEXT": "NEXT",
    "FINISH": "FINISH",
    "Easy and Fast": "Easy and Fast",
    "Easy to use, minimum code and least effort": "Easy to use, minimum code and least effort",
    "Flexible": "Flexible",
    "Customize the Country List Picker Settings": "Customize the Country List Picker Settings",
    "Open Source": "Open Source",
    "Open source  to developers can modify and share because its design is publicly accessible":
        "Open source  to developers can modify and share because its design is publicly accessible",
    "Tested and Documentation": "Tested and Documentation",
    "A guide to reference and documentation": "A guide to reference and documentation",
    "Enter your phone number": "Enter your phone number",
    "Select your country": "Select your country",
    "Search by name/dial code": "Search by name/dial code",
    "Current Location": "Current Location",
    "Last Pick": "Last Pick",
    "Search": "Search",
    "Local Country": "Local Country",
    "Country List Picker": "Country List Picker",
    "Version": "Version",
    "Last Update": "Last Update",
    "January 2023": "January 2023",
    "Description": "Description",
    "Flutter Widget": "Flutter Widget",
    "Desinged by": "Desinged by",
    "Amr Emad Eldin Lotfy": "Amr Emad Eldin Lotfy",
    "Email": "Email",
    "Phone": "Phone",
    "Language": "Language"
  },
  "ar": {
    "Country List Picker Demo": "قائمة إختيار الدول",
    "Picker": "أداة الإختيار",
    "Input": "أداة الإدخال",
    "Dialog": "مربع الإختيار",
    "About": "حول",
    "Flag": "علم الدولة",
    "Dial Code": "كود الإتصال",
    "Down Icon": "أيقونة الإخنيار",
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
    "Hint": "ملحوظة مربع الإدخال",
    "Input Hint": "نص الملحوظة",
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
    "Search Tile": "مربع البحث",
    "Current Location Tile": "مربع المكان الحالي",
    "Last Pick Tile": "مربع أخر إختيار",
    "Alphabets Bar": "شريط الحروف الهجائية",
    "Title String": "نص العنوان",
    "Hint String": "نص الملاحظة",
    "Icon": "أيقونة الإختيار",
    "Unselected Background": "خلفية الحرف الغير محدد",
    "Unselected Font Bold": "خط سميك للحرف الغير محدد",
    "Unselected Font Size": "مقاس الحرف الغير مجدد",
    "Unselected Font Color": "لون الخط الغير محدد",
    "Selected Background": "خلفية الحرف المحدد",
    "Selected Font Bold": "خط سميك للحرف المحدد",
    "Selected Font Size": "مقاس الحرف المحدد",
    "Selected Font Color": "لون الخط المحدد",
    "Obscure Text": "نص غامض",
    "Obscuring Character": "الحرف الغامض",
    "Type": "النوع",
    "SKIP": "تجاوز",
    "NEXT": "التالي",
    "FINISH": "إنهاء",
    "Easy and Fast": "سهولة وسرعة",
    "Easy to use, minimum code and least effort": "سهل الاستخدام ، وأقل كود وأقل جهد",
    "Flexible": "المرونة",
    "Customize the Country List Picker Settings": "تخصيص إعدادات قائمة إختيار الدول",
    "Open Source": "مصدر مفتوح",
    "Open source  to developers can modify and share because its design is publicly accessible":
        "يمكن للمطورين تعديل المصدر المفتوح ومشاركته لأن تصميمه متاح للجميع",
    "Tested and Documentation": "الإختبار والتوثيق",
    "A guide to reference and documentation": "دليل مرجعي وتوثيق",
    "Enter your phone number": "أدخل رقم هاتفك",
    "Select your country": "اختر دولتك",
    "Search by name/dial code": "بحث بالأسم/كود الإتصال",
    "Current Location": "المكان الحالي",
    "Last Pick": "أخر إختيار",
    "Search": "مربع البحث",
    "Local Country": "الدولة الحالية",
    "Country List Picker": "أداة إختيار الدول",
    "Version": "رقم الإصدار",
    "Last Update": "تاريخ أخر تحديث",
    "January 2023": "يناير 2023",
    "Description": "الوصف",
    "Flutter Widget": "أداة فلاتر",
    "Desinged by": "تم التصميم بواسطة",
    "Amr Emad Eldin Lotfy": "عمرو عماد الدين لطفي",
    "Email": "البريد الإلكتروني",
    "Phone": "رقم الهاتف",
    "Language": "اللغة"
  }
};
