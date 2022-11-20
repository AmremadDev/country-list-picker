mixin ToAlias {}

// @deprecated
// class CElement = Country with ToAlias;

/// Country element. This is the element that contains all the information
class Country {
  /// the name of the country
  String? name;

  /// the flag of the country
  String? flagUri;

  /// the country code (IT,AF..)
  String? code;

  /// the dial code (+39,+93..)
  String? dialCode;

  int? length;

  Country({this.name, this.flagUri, this.code, this.dialCode, this.length});

  @override
  String toString() => "$dialCode";
  String toLongString() => "$dialCode $name";
  String toCountryStringOnly() => '$name';
}
