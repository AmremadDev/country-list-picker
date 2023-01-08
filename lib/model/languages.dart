// ignore_for_file: non_constant_identifier_names, constant_identifier_names
enum Languages {
  Arabic("AR", "ARA", "Arabic"),
  Chinese("ZH", "ZHO", "Chinese"),
  Croatian("HR", "HRV", "Croatian"),
  Czech("CS", "CES", "Czech"),
  English("EN", "ENG", "English"),
  Estonian("ET", "EST", "Estonian"),
  Finnish("FI", "FIN", "Finnish"),
  French("FR", "FRA", "French"),
  German("DE", "DEU", "German"),
  Hungarian("HU", "HUN", "Hungarian"),
  Italian("IT", "ITA", "Italian"),
  Japanese("JA", "JPN", "Japanese"),
  Korean("KO", "KOR", "Korean"),
  Persian("FA", "PER", "Persian (Farsi)"),
  Polish("PL", "POL", "Polish"),
  Portuguese("PT", "POR", "Portuguese"),
  Russian("RU", "RUS", "Russian"),
  Slovak("SK", "SLK", "Slovak"),
  Spanish("ES", "SPA", "Spanish"),
  Swedish("SV", "SWE", "Swedish"),
  Urdu("UR", "URD", "Urdu");

  // Bulgarian("BG", "BUL", "Bulgarian"),
  // Danish("DA", "DAN", "Danish"),
  // Greek("EL", "ELL", "Greek (modern)"),
  // Esperanto("EO", "EPO", "Esperanto"),
  // Basque("EU", "EUS", "Basque"),
  // Armenian("HY", "HYE", "Armenian"),
  // Lithuanian("LT", "LIT", "Lithuanian"),
  // Norwegian("NO", "NOR", "Norwegian"),
  // Romanian("RO", "RON", "Romanian"),
  // Thai("TH", "THA", "Thai"),
  // Ukrainian("UK", "UKR", "Ukrainian");

  const Languages(this.iso_639_1_alpha2, this.iso_639_2_alpha3, this.name);
  final String name;
  final String iso_639_1_alpha2;
  final String iso_639_2_alpha3;
}
