mixin ToAlias {}

class Country {
  final String? localName;
  final String? englishName;
  final String? flagUri;
  final String? code;
  final String? dialCode;
  final int? length;

  Country({
    this.localName,
    this.englishName, this.flagUri, this.code, this.dialCode, this.length});

  @override
  String toString() => "$dialCode";
  String toLongString() => "$dialCode $englishName";
  String toCountryStringOnly() => '$englishName';
}
