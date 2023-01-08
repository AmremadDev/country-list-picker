// ignore_for_file: non_constant_identifier_names, constant_identifier_names
enum Languages {
  English("EN", "ENG", "English"),
  Czech("CS", "CES", "Czech"),
  German("DE", "DEU", "German"),
  Estonian("ET", "EST", "Estonian"),
  Finnish("FI", "FIN", "Finnish"),
  French("FR", "FRA", "French"),
  Croatian("HR", "HRV", "Croatian"),
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
  Urdu("UR", "URD", "Urdu"),
  Chinese("ZH", "ZHO", "Chinese"),
  Arabic("AR", "ARA", "Arabic"),
  Bulgarian("BG", "BUL", "Bulgarian"),
  Danish("DA", "DAN", "Danish"),
  Greek("EL", "ELL", "Greek (modern)"),
  Esperanto("EO", "EPO", "Esperanto"),
  Basque("EU", "EUS", "Basque"),
  Armenian("HY", "HYE", "Armenian"),
  Lithuanian("LT", "LIT", "Lithuanian"),
  Norwegian("NO", "NOR", "Norwegian"),
  Romanian("RO", "RON", "Romanian"),
  Thai("TH", "THA", "Thai"),
  Ukrainian("UK", "UKR", "Ukrainian");

  const Languages(this.iso_639_1_alpha2, this.iso_639_2_alpha3, this.name);
  final String name;
  final String iso_639_1_alpha2;
  final String iso_639_2_alpha3;
}
