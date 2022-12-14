// mixin ToAlias {}

// class Country {
//   final String? localName;
//   final String? englishName;
//   final String? flagUri;
//   final String? code;
//   final String? dialCode;
//   final int? length;

//   Country({
//     this.localName,
//     this.englishName, this.flagUri, this.code, this.dialCode, this.length});

//   @override
//   String toString() => "$dialCode";
//   String toLongString() => "$dialCode $englishName";
//   String toCountryStringOnly() => '$englishName';
// }

class Country {
  final String alpha2;
  final String alpha3;
  final Name englishName;
  final Name nativeName;
  final String callingCode;
  final int numberlength;
  String flagUri;
  Country({
    required this.alpha2,
    required this.alpha3,
    required this.callingCode,
    required this.numberlength,
    required this.englishName,
    required this.nativeName,
    this.flagUri = "",
  });

  Map toJson() {
    return {
      "iso_3166_1_alpha2": alpha2,
      "iso_3166_1_alpha3": alpha3,
      "englishName": englishName.toJson(),
      "natives": nativeName.toJson(),
      "callingCode": callingCode,
      "numberlength": numberlength,
    };
  }
}

class Name {
  final String common;
  final String official;

  Name({
    required this.common,
    required this.official,
  });
  Map toJson() => {
        "official": official,
        "common": common,
      };
}
