// To parse this JSON data, do
//
//     final xCountry = xCountryFromJson(jsonString);

import 'dart:convert';

XCountry xCountryFromJson(String str) => XCountry.fromJson(json.decode(str));
String xCountryToJson(XCountry data) => json.encode(data.toJson());

class XCountry {
  XCountry({
    required this.countires,
  });

  List<Countire> countires;

  factory XCountry.fromJson(Map<String, dynamic> json) => XCountry(
        countires: List<Countire>.from(json["countires"].map((x) => Countire.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countires": List<dynamic>.from(countires.map((x) => x.toJson())),
      };
}

class Countire {
  Countire({
    this.name,
    this.demonym,
    this.capital,
    this.iso31661Alpha2,
    this.iso31661Alpha3,
    this.iso31661Numeric,
    this.currency,
    this.tld,
    this.altSpellings,
    this.languages,
    this.translations,
    this.geo,
    this.dialling,
    this.extra,
    this.population,
    this.wikiLink,
    this.isOutlinesImgExist,
    this.isCoatOfArmsImgExist,
  });

  Name? name;
  String? demonym;
  String? capital;
  String? iso31661Alpha2;
  String? iso31661Alpha3;
  String? iso31661Numeric;
  dynamic currency;
  List<String>? tld;
  List<String>? altSpellings;
  dynamic languages;
  dynamic translations;
  Geo? geo;
  Dialling? dialling;
  Extra? extra;
  Population? population;
  String? wikiLink;
  bool? isOutlinesImgExist;
  bool? isCoatOfArmsImgExist;

  factory Countire.fromJson(Map<String, dynamic> json) => Countire(
        name: Name.fromJson(json["name"]),
        demonym: json["demonym"],
        capital: json["capital"],
        iso31661Alpha2: json["iso_3166_1_alpha2"],
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661Numeric: json["iso_3166_1_numeric"],
        currency: json["currency"],
        tld: json["tld"] == null ? null : List<String>.from(json["tld"].map((x) => x)),
        altSpellings: json["alt_spellings"] == null ? null : List<String>.from(json["alt_spellings"].map((x) => x)),
        languages: json["languages"],
        translations: json["translations"],
        geo: Geo.fromJson(json["geo"]),
        dialling: Dialling.fromJson(json["dialling"]),
        extra: Extra.fromJson(json["extra"]),
        population: Population.fromJson(json["population"]),
        wikiLink: json["wikiLink"],
        isOutlinesImgExist: json["isOutlinesImgExist"],
        isCoatOfArmsImgExist: json["isCoatOfArmsImgExist"],
      );

  Map<String, dynamic> toJson() => {
        "name": name!.toJson(),
        "demonym": demonym,
        "capital": capital,
        "iso_3166_1_alpha2": iso31661Alpha2,
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1_numeric": iso31661Numeric,
        "currency": currency,
        "tld": tld == null ? null : List<dynamic>.from(tld!.map((x) => x)),
        "alt_spellings": altSpellings == null ? null : List<dynamic>.from(altSpellings!.map((x) => x)),
        "languages": languages,
        "translations": translations,
        "geo": geo!.toJson(),
        "dialling": dialling!.toJson(),
        "extra": extra!.toJson(),
        "population": population!.toJson(),
        "wikiLink": wikiLink,
        "isOutlinesImgExist": isOutlinesImgExist,
        "isCoatOfArmsImgExist": isCoatOfArmsImgExist,
      };
}

class CurrencyClass {
  CurrencyClass({
    this.awg,
    this.afn,
    this.aoa,
    this.xcd,
    this.eur,
    this.all,
    this.aed,
    this.ars,
    this.amd,
    this.usd,
    this.aud,
    this.azn,
    this.bif,
    this.xof,
    this.bdt,
    this.bgn,
    this.bhd,
    this.bsd,
    this.bam,
    this.byr,
    this.bzd,
    this.bmd,
    this.bov,
    this.bob,
    this.brl,
    this.bbd,
    this.bnd,
    this.btn,
    this.inr,
    this.nok,
    this.bwp,
    this.xaf,
    this.cad,
    this.che,
    this.chw,
    this.chf,
    this.clf,
    this.clp,
    this.cny,
    this.cdf,
    this.nzd,
    this.cop,
    this.kmf,
    this.cve,
    this.crc,
    this.cuc,
    this.cup,
    this.ang,
    this.kyd,
    this.czk,
    this.djf,
    this.dkk,
    this.dop,
    this.dzd,
    this.egp,
    this.ern,
    this.mro,
    this.mad,
    this.etb,
    this.fjd,
    this.fkp,
    this.gbp,
    this.gel,
    this.ghs,
    this.gip,
    this.gnf,
    this.gmd,
    this.gtq,
    this.gyd,
    this.hkd,
    this.hnl,
    this.hrk,
    this.htg,
    this.huf,
    this.idr,
    this.irr,
    this.iqd,
    this.isk,
    this.ils,
    this.jmd,
    this.jod,
    this.jpy,
    this.kzt,
    this.kes,
    this.kgs,
    this.khr,
    this.krw,
    this.kwd,
    this.lak,
    this.lbp,
    this.lrd,
    this.lyd,
    this.lkr,
    this.lsl,
    this.zar,
    this.mop,
    this.mdl,
    this.mga,
    this.mvr,
    this.mxn,
    this.mkd,
    this.mmk,
    this.mnt,
    this.mzn,
    this.mur,
    this.mwk,
    this.myr,
    this.nad,
    this.xpf,
    this.ngn,
    this.nio,
    this.npr,
    this.omr,
    this.pkr,
    this.pab,
    this.pen,
    this.php,
    this.pgk,
    this.pln,
    this.kpw,
    this.pyg,
    this.qar,
    this.ron,
    this.rub,
    this.rwf,
    this.sar,
    this.sdg,
    this.sgd,
    this.sbd,
    this.sll,
    this.svc,
    this.sos,
    this.rsd,
    this.ssp,
    this.std,
    this.srd,
    this.sek,
    this.szl,
    this.scr,
    this.syp,
    this.thb,
    this.tjs,
    this.tmt,
    this.top,
    this.ttd,
    this.tnd,
    this.currencyTry,
    this.twd,
    this.tzs,
    this.ugx,
    this.uah,
    this.uyi,
    this.uyu,
    this.usn,
    this.uss,
    this.uzs,
    this.vef,
    this.vnd,
    this.vuv,
    this.wst,
    this.yer,
    this.zmw,
    this.zwl,
    this.shp,
  });

  Aud? awg;
  Aud? afn;
  Aud? aoa;
  Aud? xcd;
  Aud? eur;
  Aud? all;
  Aud? aed;
  Aud? ars;
  Aud? amd;
  Aud? usd;
  Aud? aud;
  Aud? azn;
  Aud? bif;
  Aud? xof;
  Aud? bdt;
  Aud? bgn;
  Aud? bhd;
  Aud? bsd;
  Aud? bam;
  Aud? byr;
  Aud? bzd;
  Aud? bmd;
  Aud? bov;
  Bob? bob;
  Aud? brl;
  Aud? bbd;
  Aud? bnd;
  Bob? btn;
  Aud? inr;
  Aud? nok;
  Aud? bwp;
  Aud? xaf;
  Aud? cad;
  Aud? che;
  Aud? chw;
  Aud? chf;
  Aud? clf;
  Aud? clp;
  Aud? cny;
  Aud? cdf;
  Aud? nzd;
  Aud? cop;
  Aud? kmf;
  Aud? cve;
  Aud? crc;
  Aud? cuc;
  Aud? cup;
  Aud? ang;
  Aud? kyd;
  Aud? czk;
  Aud? djf;
  Aud? dkk;
  Aud? dop;
  Aud? dzd;
  Aud? egp;
  Aud? ern;
  Aud? mro;
  Aud? mad;
  Aud? etb;
  Aud? fjd;
  Aud? fkp;
  Aud? gbp;
  Aud? gel;
  Aud? ghs;
  Aud? gip;
  Aud? gnf;
  Aud? gmd;
  Aud? gtq;
  Aud? gyd;
  Aud? hkd;
  Aud? hnl;
  Aud? hrk;
  Aud? htg;
  Aud? huf;
  Aud? idr;
  Aud? irr;
  Aud? iqd;
  Aud? isk;
  Aud? ils;
  Aud? jmd;
  Aud? jod;
  Aud? jpy;
  Aud? kzt;
  Aud? kes;
  Aud? kgs;
  Aud? khr;
  Aud? krw;
  Aud? kwd;
  Aud? lak;
  Aud? lbp;
  Aud? lrd;
  Aud? lyd;
  Aud? lkr;
  Aud? lsl;
  Aud? zar;
  Aud? mop;
  Aud? mdl;
  Aud? mga;
  Aud? mvr;
  Aud? mxn;
  Aud? mkd;
  Aud? mmk;
  Aud? mnt;
  Aud? mzn;
  Aud? mur;
  Aud? mwk;
  Aud? myr;
  Aud? nad;
  Aud? xpf;
  Aud? ngn;
  Aud? nio;
  Aud? npr;
  Aud? omr;
  Aud? pkr;
  Aud? pab;
  Aud? pen;
  Aud? php;
  Aud? pgk;
  Aud? pln;
  Aud? kpw;
  Aud? pyg;
  Aud? qar;
  Aud? ron;
  Aud? rub;
  Aud? rwf;
  Aud? sar;
  Aud? sdg;
  Aud? sgd;
  Aud? sbd;
  Aud? sll;
  Aud? svc;
  Aud? sos;
  Aud? rsd;
  Aud? ssp;
  Aud? std;
  Aud? srd;
  Aud? sek;
  Aud? szl;
  Aud? scr;
  Aud? syp;
  Aud? thb;
  Aud? tjs;
  Aud? tmt;
  Aud? top;
  Aud? ttd;
  Aud? tnd;
  Aud? currencyTry;
  Aud? twd;
  Aud? tzs;
  Aud? ugx;
  Aud? uah;
  Aud? uyi;
  Aud? uyu;
  Aud? usn;
  Aud? uss;
  Aud? uzs;
  Aud? vef;
  Aud? vnd;
  Aud? vuv;
  Aud? wst;
  Aud? yer;
  Aud? zmw;
  Aud? zwl;
  Aud? shp;

  factory CurrencyClass.fromJson(Map<String, dynamic> json) => CurrencyClass(
        awg: json["AWG"] == null ? null : Aud.fromJson(json["AWG"]),
        afn: json["AFN"] == null ? null : Aud.fromJson(json["AFN"]),
        aoa: json["AOA"] == null ? null : Aud.fromJson(json["AOA"]),
        xcd: json["XCD"] == null ? null : Aud.fromJson(json["XCD"]),
        eur: json["EUR"] == null ? null : Aud.fromJson(json["EUR"]),
        all: json["ALL"] == null ? null : Aud.fromJson(json["ALL"]),
        aed: json["Aud?"] == null ? null : Aud.fromJson(json["Aud?"]),
        ars: json["ARS"] == null ? null : Aud.fromJson(json["ARS"]),
        amd: json["AMD"] == null ? null : Aud.fromJson(json["AMD"]),
        usd: json["USD"] == null ? null : Aud.fromJson(json["USD"]),
        aud: json["AUD"] == null ? null : Aud.fromJson(json["AUD"]),
        azn: json["AZN"] == null ? null : Aud.fromJson(json["AZN"]),
        bif: json["BIF"] == null ? null : Aud.fromJson(json["BIF"]),
        xof: json["XOF"] == null ? null : Aud.fromJson(json["XOF"]),
        bdt: json["BDT"] == null ? null : Aud.fromJson(json["BDT"]),
        bgn: json["BGN"] == null ? null : Aud.fromJson(json["BGN"]),
        bhd: json["BHD"] == null ? null : Aud.fromJson(json["BHD"]),
        bsd: json["BSD"] == null ? null : Aud.fromJson(json["BSD"]),
        bam: json["BAM"] == null ? null : Aud.fromJson(json["BAM"]),
        byr: json["BYR"] == null ? null : Aud.fromJson(json["BYR"]),
        bzd: json["BZD"] == null ? null : Aud.fromJson(json["BZD"]),
        bmd: json["BMD"] == null ? null : Aud.fromJson(json["BMD"]),
        bov: json["BOV"] == null ? null : Aud.fromJson(json["BOV"]),
        bob: json["BOB"] == null ? null : Bob.fromJson(json["BOB"]),
        brl: json["BRL"] == null ? null : Aud.fromJson(json["BRL"]),
        bbd: json["BBD"] == null ? null : Aud.fromJson(json["BBD"]),
        bnd: json["BND"] == null ? null : Aud.fromJson(json["BND"]),
        btn: json["BTN"] == null ? null : Bob.fromJson(json["BTN"]),
        inr: json["INR"] == null ? null : Aud.fromJson(json["INR"]),
        nok: json["NOK"] == null ? null : Aud.fromJson(json["NOK"]),
        bwp: json["BWP"] == null ? null : Aud.fromJson(json["BWP"]),
        xaf: json["XAF"] == null ? null : Aud.fromJson(json["XAF"]),
        cad: json["CAD"] == null ? null : Aud.fromJson(json["CAD"]),
        che: json["CHE"] == null ? null : Aud.fromJson(json["CHE"]),
        chw: json["CHW"] == null ? null : Aud.fromJson(json["CHW"]),
        chf: json["CHF"] == null ? null : Aud.fromJson(json["CHF"]),
        clf: json["CLF"] == null ? null : Aud.fromJson(json["CLF"]),
        clp: json["CLP"] == null ? null : Aud.fromJson(json["CLP"]),
        cny: json["CNY"] == null ? null : Aud.fromJson(json["CNY"]),
        cdf: json["CDF"] == null ? null : Aud.fromJson(json["CDF"]),
        nzd: json["NZD"] == null ? null : Aud.fromJson(json["NZD"]),
        cop: json["COP"] == null ? null : Aud.fromJson(json["COP"]),
        kmf: json["KMF"] == null ? null : Aud.fromJson(json["KMF"]),
        cve: json["CVE"] == null ? null : Aud.fromJson(json["CVE"]),
        crc: json["CRC"] == null ? null : Aud.fromJson(json["CRC"]),
        cuc: json["CUC"] == null ? null : Aud.fromJson(json["CUC"]),
        cup: json["CUP"] == null ? null : Aud.fromJson(json["CUP"]),
        ang: json["ANG"] == null ? null : Aud.fromJson(json["ANG"]),
        kyd: json["KYD"] == null ? null : Aud.fromJson(json["KYD"]),
        czk: json["CZK"] == null ? null : Aud.fromJson(json["CZK"]),
        djf: json["DJF"] == null ? null : Aud.fromJson(json["DJF"]),
        dkk: json["DKK"] == null ? null : Aud.fromJson(json["DKK"]),
        dop: json["DOP"] == null ? null : Aud.fromJson(json["DOP"]),
        dzd: json["DZD"] == null ? null : Aud.fromJson(json["DZD"]),
        egp: json["EGP"] == null ? null : Aud.fromJson(json["EGP"]),
        ern: json["ERN"] == null ? null : Aud.fromJson(json["ERN"]),
        mro: json["MRO"] == null ? null : Aud.fromJson(json["MRO"]),
        mad: json["MAD"] == null ? null : Aud.fromJson(json["MAD"]),
        etb: json["ETB"] == null ? null : Aud.fromJson(json["ETB"]),
        fjd: json["FJD"] == null ? null : Aud.fromJson(json["FJD"]),
        fkp: json["FKP"] == null ? null : Aud.fromJson(json["FKP"]),
        gbp: json["GBP"] == null ? null : Aud.fromJson(json["GBP"]),
        gel: json["GEL"] == null ? null : Aud.fromJson(json["GEL"]),
        ghs: json["GHS"] == null ? null : Aud.fromJson(json["GHS"]),
        gip: json["GIP"] == null ? null : Aud.fromJson(json["GIP"]),
        gnf: json["GNF"] == null ? null : Aud.fromJson(json["GNF"]),
        gmd: json["GMD"] == null ? null : Aud.fromJson(json["GMD"]),
        gtq: json["GTQ"] == null ? null : Aud.fromJson(json["GTQ"]),
        gyd: json["GYD"] == null ? null : Aud.fromJson(json["GYD"]),
        hkd: json["HKD"] == null ? null : Aud.fromJson(json["HKD"]),
        hnl: json["HNL"] == null ? null : Aud.fromJson(json["HNL"]),
        hrk: json["HRK"] == null ? null : Aud.fromJson(json["HRK"]),
        htg: json["HTG"] == null ? null : Aud.fromJson(json["HTG"]),
        huf: json["HUF"] == null ? null : Aud.fromJson(json["HUF"]),
        idr: json["IDR"] == null ? null : Aud.fromJson(json["IDR"]),
        irr: json["IRR"] == null ? null : Aud.fromJson(json["IRR"]),
        iqd: json["IQD"] == null ? null : Aud.fromJson(json["IQD"]),
        isk: json["ISK"] == null ? null : Aud.fromJson(json["ISK"]),
        ils: json["ILS"] == null ? null : Aud.fromJson(json["ILS"]),
        jmd: json["JMD"] == null ? null : Aud.fromJson(json["JMD"]),
        jod: json["JOD"] == null ? null : Aud.fromJson(json["JOD"]),
        jpy: json["JPY"] == null ? null : Aud.fromJson(json["JPY"]),
        kzt: json["KZT"] == null ? null : Aud.fromJson(json["KZT"]),
        kes: json["KES"] == null ? null : Aud.fromJson(json["KES"]),
        kgs: json["KGS"] == null ? null : Aud.fromJson(json["KGS"]),
        khr: json["KHR"] == null ? null : Aud.fromJson(json["KHR"]),
        krw: json["KRW"] == null ? null : Aud.fromJson(json["KRW"]),
        kwd: json["KWD"] == null ? null : Aud.fromJson(json["KWD"]),
        lak: json["LAK"] == null ? null : Aud.fromJson(json["LAK"]),
        lbp: json["LBP"] == null ? null : Aud.fromJson(json["LBP"]),
        lrd: json["LRD"] == null ? null : Aud.fromJson(json["LRD"]),
        lyd: json["LYD"] == null ? null : Aud.fromJson(json["LYD"]),
        lkr: json["LKR"] == null ? null : Aud.fromJson(json["LKR"]),
        lsl: json["LSL"] == null ? null : Aud.fromJson(json["LSL"]),
        zar: json["ZAR"] == null ? null : Aud.fromJson(json["ZAR"]),
        mop: json["MOP"] == null ? null : Aud.fromJson(json["MOP"]),
        mdl: json["MDL"] == null ? null : Aud.fromJson(json["MDL"]),
        mga: json["MGA"] == null ? null : Aud.fromJson(json["MGA"]),
        mvr: json["MVR"] == null ? null : Aud.fromJson(json["MVR"]),
        mxn: json["MXN"] == null ? null : Aud.fromJson(json["MXN"]),
        mkd: json["MKD"] == null ? null : Aud.fromJson(json["MKD"]),
        mmk: json["MMK"] == null ? null : Aud.fromJson(json["MMK"]),
        mnt: json["MNT"] == null ? null : Aud.fromJson(json["MNT"]),
        mzn: json["MZN"] == null ? null : Aud.fromJson(json["MZN"]),
        mur: json["MUR"] == null ? null : Aud.fromJson(json["MUR"]),
        mwk: json["MWK"] == null ? null : Aud.fromJson(json["MWK"]),
        myr: json["MYR"] == null ? null : Aud.fromJson(json["MYR"]),
        nad: json["NAD"] == null ? null : Aud.fromJson(json["NAD"]),
        xpf: json["XPF"] == null ? null : Aud.fromJson(json["XPF"]),
        ngn: json["NGN"] == null ? null : Aud.fromJson(json["NGN"]),
        nio: json["NIO"] == null ? null : Aud.fromJson(json["NIO"]),
        npr: json["NPR"] == null ? null : Aud.fromJson(json["NPR"]),
        omr: json["OMR"] == null ? null : Aud.fromJson(json["OMR"]),
        pkr: json["PKR"] == null ? null : Aud.fromJson(json["PKR"]),
        pab: json["PAB"] == null ? null : Aud.fromJson(json["PAB"]),
        pen: json["PEN"] == null ? null : Aud.fromJson(json["PEN"]),
        php: json["PHP"] == null ? null : Aud.fromJson(json["PHP"]),
        pgk: json["PGK"] == null ? null : Aud.fromJson(json["PGK"]),
        pln: json["PLN"] == null ? null : Aud.fromJson(json["PLN"]),
        kpw: json["KPW"] == null ? null : Aud.fromJson(json["KPW"]),
        pyg: json["PYG"] == null ? null : Aud.fromJson(json["PYG"]),
        qar: json["QAR"] == null ? null : Aud.fromJson(json["QAR"]),
        ron: json["RON"] == null ? null : Aud.fromJson(json["RON"]),
        rub: json["RUB"] == null ? null : Aud.fromJson(json["RUB"]),
        rwf: json["RWF"] == null ? null : Aud.fromJson(json["RWF"]),
        sar: json["SAR"] == null ? null : Aud.fromJson(json["SAR"]),
        sdg: json["SDG"] == null ? null : Aud.fromJson(json["SDG"]),
        sgd: json["SGD"] == null ? null : Aud.fromJson(json["SGD"]),
        sbd: json["SBD"] == null ? null : Aud.fromJson(json["SBD"]),
        sll: json["SLL"] == null ? null : Aud.fromJson(json["SLL"]),
        svc: json["SVC"] == null ? null : Aud.fromJson(json["SVC"]),
        sos: json["SOS"] == null ? null : Aud.fromJson(json["SOS"]),
        rsd: json["RSD"] == null ? null : Aud.fromJson(json["RSD"]),
        ssp: json["SSP"] == null ? null : Aud.fromJson(json["SSP"]),
        std: json["STD"] == null ? null : Aud.fromJson(json["STD"]),
        srd: json["SRD"] == null ? null : Aud.fromJson(json["SRD"]),
        sek: json["SEK"] == null ? null : Aud.fromJson(json["SEK"]),
        szl: json["SZL"] == null ? null : Aud.fromJson(json["SZL"]),
        scr: json["SCR"] == null ? null : Aud.fromJson(json["SCR"]),
        syp: json["SYP"] == null ? null : Aud.fromJson(json["SYP"]),
        thb: json["THB"] == null ? null : Aud.fromJson(json["THB"]),
        tjs: json["TJS"] == null ? null : Aud.fromJson(json["TJS"]),
        tmt: json["TMT"] == null ? null : Aud.fromJson(json["TMT"]),
        top: json["TOP"] == null ? null : Aud.fromJson(json["TOP"]),
        ttd: json["TTD"] == null ? null : Aud.fromJson(json["TTD"]),
        tnd: json["TND"] == null ? null : Aud.fromJson(json["TND"]),
        currencyTry: json["TRY"] == null ? null : Aud.fromJson(json["TRY"]),
        twd: json["TWD"] == null ? null : Aud.fromJson(json["TWD"]),
        tzs: json["TZS"] == null ? null : Aud.fromJson(json["TZS"]),
        ugx: json["UGX"] == null ? null : Aud.fromJson(json["UGX"]),
        uah: json["UAH"] == null ? null : Aud.fromJson(json["UAH"]),
        uyi: json["UYI"] == null ? null : Aud.fromJson(json["UYI"]),
        uyu: json["UYU"] == null ? null : Aud.fromJson(json["UYU"]),
        usn: json["USN"] == null ? null : Aud.fromJson(json["USN"]),
        uss: json["USS"] == null ? null : Aud.fromJson(json["USS"]),
        uzs: json["UZS"] == null ? null : Aud.fromJson(json["UZS"]),
        vef: json["VEF"] == null ? null : Aud.fromJson(json["VEF"]),
        vnd: json["VND"] == null ? null : Aud.fromJson(json["VND"]),
        vuv: json["VUV"] == null ? null : Aud.fromJson(json["VUV"]),
        wst: json["WST"] == null ? null : Aud.fromJson(json["WST"]),
        yer: json["YER"] == null ? null : Aud.fromJson(json["YER"]),
        zmw: json["ZMW"] == null ? null : Aud.fromJson(json["ZMW"]),
        zwl: json["ZWL"] == null ? null : Aud.fromJson(json["ZWL"]),
        shp: json["SHP"] == null ? null : Aud.fromJson(json["SHP"]),
      );

  Map<String, dynamic> toJson() => {
        "AWG": awg == null ? null : awg!.toJson(),
        "AFN": afn == null ? null : afn!.toJson(),
        "AOA": aoa == null ? null : aoa!.toJson(),
        "XCD": xcd == null ? null : xcd!.toJson(),
        "EUR": eur == null ? null : eur!.toJson(),
        "ALL": all == null ? null : all!.toJson(),
        "Aud?": aud == null ? null : aud!.toJson(),
        "ARS": ars == null ? null : ars!.toJson(),
        "AMD": amd == null ? null : amd!.toJson(),
        "USD": usd == null ? null : usd!.toJson(),
        "AUD": aud == null ? null : aud!.toJson(),
        "AZN": azn == null ? null : azn!.toJson(),
        "BIF": bif == null ? null : bif!.toJson(),
        "XOF": xof == null ? null : xof!.toJson(),
        "BDT": bdt == null ? null : bdt!.toJson(),
        "BGN": bgn == null ? null : bgn!.toJson(),
        "BHD": bhd == null ? null : bhd!.toJson(),
        "BSD": bsd == null ? null : bsd!.toJson(),
        "BAM": bam == null ? null : bam!.toJson(),
        "BYR": byr == null ? null : byr!.toJson(),
        "BZD": bzd == null ? null : bzd!.toJson(),
        "BMD": bmd == null ? null : bmd!.toJson(),
        "BOV": bov == null ? null : bov!.toJson(),
        "BOB": bob == null ? null : bob!.toJson(),
        "BRL": brl == null ? null : brl!.toJson(),
        "BBD": bbd == null ? null : bbd!.toJson(),
        "BND": bnd == null ? null : bnd!.toJson(),
        "BTN": btn == null ? null : btn!.toJson(),
        "INR": inr == null ? null : inr!.toJson(),
        "NOK": nok == null ? null : nok!.toJson(),
        "BWP": bwp == null ? null : bwp!.toJson(),
        "XAF": xaf == null ? null : xaf!.toJson(),
        "CAD": cad == null ? null : cad!.toJson(),
        "CHE": che == null ? null : che!.toJson(),
        "CHW": chw == null ? null : chw!.toJson(),
        "CHF": chf == null ? null : chf!.toJson(),
        "CLF": clf == null ? null : clf!.toJson(),
        "CLP": clp == null ? null : clp!.toJson(),
        "CNY": cny == null ? null : cny!.toJson(),
        "CDF": cdf == null ? null : cdf!.toJson(),
        "NZD": nzd == null ? null : nzd!.toJson(),
        "COP": cop == null ? null : cop!.toJson(),
        "KMF": kmf == null ? null : kmf!.toJson(),
        "CVE": cve == null ? null : cve!.toJson(),
        "CRC": crc == null ? null : crc!.toJson(),
        "CUC": cuc == null ? null : cuc!.toJson(),
        "CUP": cup == null ? null : cup!.toJson(),
        "ANG": ang == null ? null : ang!.toJson(),
        "KYD": kyd == null ? null : kyd!.toJson(),
        "CZK": czk == null ? null : czk!.toJson(),
        "DJF": djf == null ? null : djf!.toJson(),
        "DKK": dkk == null ? null : dkk!.toJson(),
        "DOP": dop == null ? null : dop!.toJson(),
        "DZD": dzd == null ? null : dzd!.toJson(),
        "EGP": egp == null ? null : egp!.toJson(),
        "ERN": ern == null ? null : ern!.toJson(),
        "MRO": mro == null ? null : mro!.toJson(),
        "MAD": mad == null ? null : mad!.toJson(),
        "ETB": etb == null ? null : etb!.toJson(),
        "FJD": fjd == null ? null : fjd!.toJson(),
        "FKP": fkp == null ? null : fkp!.toJson(),
        "GBP": gbp == null ? null : gbp!.toJson(),
        "GEL": gel == null ? null : gel!.toJson(),
        "GHS": ghs == null ? null : ghs!.toJson(),
        "GIP": gip == null ? null : gip!.toJson(),
        "GNF": gnf == null ? null : gnf!.toJson(),
        "GMD": gmd == null ? null : gmd!.toJson(),
        "GTQ": gtq == null ? null : gtq!.toJson(),
        "GYD": gyd == null ? null : gyd!.toJson(),
        "HKD": hkd == null ? null : hkd!.toJson(),
        "HNL": hnl == null ? null : hnl!.toJson(),
        "HRK": hrk == null ? null : hrk!.toJson(),
        "HTG": htg == null ? null : htg!.toJson(),
        "HUF": huf == null ? null : huf!.toJson(),
        "IDR": idr == null ? null : idr!.toJson(),
        "IRR": irr == null ? null : irr!.toJson(),
        "IQD": iqd == null ? null : iqd!.toJson(),
        "ISK": isk == null ? null : isk!.toJson(),
        "ILS": ils == null ? null : ils!.toJson(),
        "JMD": jmd == null ? null : jmd!.toJson(),
        "JOD": jod == null ? null : jod!.toJson(),
        "JPY": jpy == null ? null : jpy!.toJson(),
        "KZT": kzt == null ? null : kzt!.toJson(),
        "KES": kes == null ? null : kes!.toJson(),
        "KGS": kgs == null ? null : kgs!.toJson(),
        "KHR": khr == null ? null : khr!.toJson(),
        "KRW": krw == null ? null : krw!.toJson(),
        "KWD": kwd == null ? null : kwd!.toJson(),
        "LAK": lak == null ? null : lak!.toJson(),
        "LBP": lbp == null ? null : lbp!.toJson(),
        "LRD": lrd == null ? null : lrd!.toJson(),
        "LYD": lyd == null ? null : lyd!.toJson(),
        "LKR": lkr == null ? null : lkr!.toJson(),
        "LSL": lsl == null ? null : lsl!.toJson(),
        "ZAR": zar == null ? null : zar!.toJson(),
        "MOP": mop == null ? null : mop!.toJson(),
        "MDL": mdl == null ? null : mdl!.toJson(),
        "MGA": mga == null ? null : mga!.toJson(),
        "MVR": mvr == null ? null : mvr!.toJson(),
        "MXN": mxn == null ? null : mxn!.toJson(),
        "MKD": mkd == null ? null : mkd!.toJson(),
        "MMK": mmk == null ? null : mmk!.toJson(),
        "MNT": mnt == null ? null : mnt!.toJson(),
        "MZN": mzn == null ? null : mzn!.toJson(),
        "MUR": mur == null ? null : mur!.toJson(),
        "MWK": mwk == null ? null : mwk!.toJson(),
        "MYR": myr == null ? null : myr!.toJson(),
        "NAD": nad == null ? null : nad!.toJson(),
        "XPF": xpf == null ? null : xpf!.toJson(),
        "NGN": ngn == null ? null : ngn!.toJson(),
        "NIO": nio == null ? null : nio!.toJson(),
        "NPR": npr == null ? null : npr!.toJson(),
        "OMR": omr == null ? null : omr!.toJson(),
        "PKR": pkr == null ? null : pkr!.toJson(),
        "PAB": pab == null ? null : pab!.toJson(),
        "PEN": pen == null ? null : pen!.toJson(),
        "PHP": php == null ? null : php!.toJson(),
        "PGK": pgk == null ? null : pgk!.toJson(),
        "PLN": pln == null ? null : pln!.toJson(),
        "KPW": kpw == null ? null : kpw!.toJson(),
        "PYG": pyg == null ? null : pyg!.toJson(),
        "QAR": qar == null ? null : qar!.toJson(),
        "RON": ron == null ? null : ron!.toJson(),
        "RUB": rub == null ? null : rub!.toJson(),
        "RWF": rwf == null ? null : rwf!.toJson(),
        "SAR": sar == null ? null : sar!.toJson(),
        "SDG": sdg == null ? null : sdg!.toJson(),
        "SGD": sgd == null ? null : sgd!.toJson(),
        "SBD": sbd == null ? null : sbd!.toJson(),
        "SLL": sll == null ? null : sll!.toJson(),
        "SVC": svc == null ? null : svc!.toJson(),
        "SOS": sos == null ? null : sos!.toJson(),
        "RSD": rsd == null ? null : rsd!.toJson(),
        "SSP": ssp == null ? null : ssp!.toJson(),
        "STD": std == null ? null : std!.toJson(),
        "SRD": srd == null ? null : srd!.toJson(),
        "SEK": sek == null ? null : sek!.toJson(),
        "SZL": szl == null ? null : szl!.toJson(),
        "SCR": scr == null ? null : scr!.toJson(),
        "SYP": syp == null ? null : syp!.toJson(),
        "THB": thb == null ? null : thb!.toJson(),
        "TJS": tjs == null ? null : tjs!.toJson(),
        "TMT": tmt == null ? null : tmt!.toJson(),
        "TOP": top == null ? null : top!.toJson(),
        "TTD": ttd == null ? null : ttd!.toJson(),
        "TND": tnd == null ? null : tnd!.toJson(),
        "TRY": currencyTry == null ? null : currencyTry!.toJson(),
        "TWD": twd == null ? null : twd!.toJson(),
        "TZS": tzs == null ? null : tzs!.toJson(),
        "UGX": ugx == null ? null : ugx!.toJson(),
        "UAH": uah == null ? null : uah!.toJson(),
        "UYI": uyi == null ? null : uyi!.toJson(),
        "UYU": uyu == null ? null : uyu!.toJson(),
        "USN": usn == null ? null : usn!.toJson(),
        "USS": uss == null ? null : uss!.toJson(),
        "UZS": uzs == null ? null : uzs!.toJson(),
        "VEF": vef == null ? null : vef!.toJson(),
        "VND": vnd == null ? null : vnd!.toJson(),
        "VUV": vuv == null ? null : vuv!.toJson(),
        "WST": wst == null ? null : wst!.toJson(),
        "YER": yer == null ? null : yer!.toJson(),
        "ZMW": zmw == null ? null : zmw!.toJson(),
        "ZWL": zwl == null ? null : zwl!.toJson(),
        "SHP": shp == null ? null : shp!.toJson(),
      };
}

class Aed {
  Aed({
    this.iso4217Code,
    this.iso4217Numeric,
    this.iso4217Name,
    this.iso4217MinorUnit,
  });

  String? iso4217Code;
  int? iso4217Numeric;
  String? iso4217Name;
  int? iso4217MinorUnit;

  factory Aed.fromJson(Map<String, dynamic> json) => Aed(
        iso4217Code: json["iso_4217_code"],
        iso4217Numeric: json["iso_4217_numeric"],
        iso4217Name: json["iso_4217_name"],
        iso4217MinorUnit: json["iso_4217_minor_unit"],
      );

  Map<String, dynamic> toJson() => {
        "iso_4217_code": iso4217Code,
        "iso_4217_numeric": iso4217Numeric,
        "iso_4217_name": iso4217Name,
        "iso_4217_minor_unit": iso4217MinorUnit,
      };
}

class Aud {
  Aud({
    this.iso4217Code,
    this.iso4217Numeric,
    this.iso4217Name,
    this.iso4217MinorUnit,
  });

  Iso4217Code? iso4217Code;
  dynamic iso4217Numeric;
  String? iso4217Name;
  int? iso4217MinorUnit;

  factory Aud.fromJson(Map<String, dynamic> json) => Aud(
        iso4217Code: iso4217CodeValues.map[json["iso_4217_code"]],
        iso4217Numeric: json["iso_4217_numeric"],
        iso4217Name: json["iso_4217_name"],
        iso4217MinorUnit: json["iso_4217_minor_unit"],
      );

  Map<String, dynamic> toJson() => {
        "iso_4217_code": iso4217CodeValues.reverse[iso4217Code],
        "iso_4217_numeric": iso4217Numeric,
        "iso_4217_name": iso4217Name,
        "iso_4217_minor_unit": iso4217MinorUnit,
      };
}

enum Iso4217Code { aud, dzd }

final iso4217CodeValues = EnumValues({"AUD": Iso4217Code.aud, "DZD": Iso4217Code.dzd});

class Bob {
  Bob({
    this.iso4217Code,
    this.iso4217Numeric,
    this.iso4217Name,
    this.iso4217MinorUnit,
  });

  String? iso4217Code;
  String? iso4217Numeric;
  String? iso4217Name;
  int? iso4217MinorUnit;

  factory Bob.fromJson(Map<String, dynamic> json) => Bob(
        iso4217Code: json["iso_4217_code"],
        iso4217Numeric: json["iso_4217_numeric"],
        iso4217Name: json["iso_4217_name"],
        iso4217MinorUnit: json["iso_4217_minor_unit"],
      );

  Map<String, dynamic> toJson() => {
        "iso_4217_code": iso4217Code,
        "iso_4217_numeric": iso4217Numeric,
        "iso_4217_name": iso4217Name,
        "iso_4217_minor_unit": iso4217MinorUnit,
      };
}

class Dialling {
  Dialling({
    this.callingCode,
    this.nationalPrefix,
    this.nationalNumberLengths,
    this.nationalDestinationCodeLengths,
    this.internationalPrefix,
  });

  List<String>? callingCode;
  String? nationalPrefix;
  List<int>? nationalNumberLengths;
  List<int>? nationalDestinationCodeLengths;
  dynamic internationalPrefix;

  factory Dialling.fromJson(Map<String, dynamic> json) => Dialling(
        callingCode: json["calling_code"] == null ? null : List<String>.from(json["calling_code"].map((x) => x)),
        nationalPrefix: json["national_prefix"],
        nationalNumberLengths: json["national_number_lengths"] == null
            ? null
            : List<int>.from(json["national_number_lengths"].map((x) => x)),
        nationalDestinationCodeLengths: json["national_destination_code_lengths"] == null
            ? null
            : List<int>.from(json["national_destination_code_lengths"].map((x) => x)),
        internationalPrefix: json["international_prefix"],
      );

  Map<String, dynamic> toJson() => {
        "calling_code": callingCode == null ? null : List<dynamic>.from(callingCode!.map((x) => x)),
        "national_prefix": nationalPrefix,
        "national_number_lengths":
            nationalNumberLengths == null ? null : List<dynamic>.from(nationalNumberLengths!.map((x) => x)),
        "national_destination_code_lengths": nationalDestinationCodeLengths == null
            ? null
            : List<dynamic>.from(nationalDestinationCodeLengths!.map((x) => x)),
        "international_prefix": internationalPrefix,
      };
}

class Extra {
  Extra({
    this.geonameid,
    this.edgar,
    this.itu,
    this.marc,
    this.wmo,
    this.ds,
    this.fifa,
    this.fips,
    this.gaul,
    this.ioc,
    this.cowc,
    this.cown,
    this.fao,
    this.imf,
    this.ar5,
    this.addressFormat,
    this.euMember,
    this.vatRates,
  });

  int? geonameid;
  dynamic edgar;
  dynamic itu;
  dynamic marc;
  dynamic wmo;
  dynamic ds;
  dynamic fifa;
  dynamic fips;
  int? gaul;
  dynamic ioc;
  dynamic cowc;
  int? cown;
  int? fao;
  int? imf;
  dynamic ar5;
  String? addressFormat;
  bool? euMember;
  VatRates? vatRates;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        geonameid: json["geonameid"],
        edgar: json["edgar"],
        itu: json["itu"],
        marc: json["marc"],
        wmo: json["wmo"],
        ds: json["ds"],
        fifa: json["fifa"],
        fips: json["fips"],
        gaul: json["gaul"],
        ioc: json["ioc"],
        cowc: json["cowc"],
        cown: json["cown"],
        fao: json["fao"],
        imf: json["imf"],
        ar5: json["ar5"],
        addressFormat: json["address_format"],
        euMember: json["eu_member"],
        vatRates: VatRates.fromJson(json["vat_rates"]),
      );

  Map<String, dynamic> toJson() => {
        "geonameid": geonameid,
        "edgar": edgar,
        "itu": itu,
        "marc": marc,
        "wmo": wmo,
        "ds": ds,
        "fifa": fifa,
        "fips": fips,
        "gaul": gaul,
        "ioc": ioc,
        "cowc": cowc,
        "cown": cown,
        "fao": fao,
        "imf": imf,
        "ar5": ar5,
        "address_format": addressFormat,
        "eu_member": euMember,
        "vat_rates": vatRates == null ? null : vatRates!.toJson(),
      };
}

enum Ar5Enum { lam, asia, maf, oecd1990, eit }

final ar5EnumValues = EnumValues(
    {"ASIA": Ar5Enum.asia, "EIT": Ar5Enum.eit, "LAM": Ar5Enum.lam, "MAF": Ar5Enum.maf, "OECD1990": Ar5Enum.oecd1990});

class VatRates {
  VatRates({
    this.standard,
    this.reduced,
    this.superReduced,
    this.parking,
  });

  int? standard;
  List<double>? reduced;
  double? superReduced;
  double? parking;

  factory VatRates.fromJson(Map<String, dynamic> json) => VatRates(
        standard: json["standard"],
        reduced: List<double>.from(json["reduced"].map((x) => x.toDouble())),
        superReduced: json["super_reduced"].toDouble(),
        parking: json["parking"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "standard": standard,
        "reduced": List<dynamic>.from(reduced!.map((x) => x)),
        "super_reduced": superReduced,
        "parking": parking,
      };
}

class Geo {
  Geo({
    this.continent,
    this.postalCode,
    this.latitude,
    this.latitudeDec,
    this.longitude,
    this.longitudeDec,
    this.maxLatitude,
    this.maxLongitude,
    this.minLatitude,
    this.minLongitude,
    this.area,
    this.region,
    this.subregion,
    this.worldRegion,
    this.regionCode,
    this.subregionCode,
    this.landlocked,
    this.borders,
    this.independent,
  });

  Continent? continent;
  bool? postalCode;
  String? latitude;
  String? latitudeDec;
  String? longitude;
  String? longitudeDec;
  String? maxLatitude;
  String? maxLongitude;
  String? minLatitude;
  String? minLongitude;
  double? area;
  Region? region;
  String? subregion;
  WorldRegion? worldRegion;
  String? regionCode;
  String? subregionCode;
  bool? landlocked;
  List<String>? borders;
  String? independent;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        continent: Continent.fromJson(json["continent"]),
        postalCode: json["postal_code"],
        latitude: json["latitude"],
        latitudeDec: json["latitude_dec"],
        longitude: json["longitude"],
        longitudeDec: json["longitude_dec"],
        maxLatitude: json["max_latitude"],
        maxLongitude: json["max_longitude"],
        minLatitude: json["min_latitude"],
        minLongitude: json["min_longitude"],
        area: json["area"].toDouble(),
        region: regionValues.map[json["region"]],
        subregion: json["subregion"],
        worldRegion: json["world_region"] == null ? null : worldRegionValues.map[json["world_region"]],
        regionCode: json["region_code"],
        subregionCode: json["subregion_code"],
        landlocked: json["landlocked"],
        borders: json["borders"] == null ? null : List<String>.from(json["borders"].map((x) => x)),
        independent: json["independent"],
      );

  Map<String, dynamic> toJson() => {
        "continent": continent!.toJson(),
        "postal_code": postalCode,
        "latitude": latitude,
        "latitude_dec": latitudeDec,
        "longitude": longitude,
        "longitude_dec": longitudeDec,
        "max_latitude": maxLatitude,
        "max_longitude": maxLongitude,
        "min_latitude": minLatitude,
        "min_longitude": minLongitude,
        "area": area,
        "region": regionValues.reverse[region],
        "subregion": subregion,
        "world_region": worldRegion == null ? null : worldRegionValues.reverse[worldRegion],
        "region_code": regionCode,
        "subregion_code": subregionCode,
        "landlocked": landlocked,
        "borders": borders == null ? null : List<dynamic>.from(borders!.map((x) => x)),
        "independent": independent,
      };
}

class Continent {
  Continent({
    this.na,
    this.continentAs,
    this.af,
    this.eu,
    this.sa,
    this.oc,
    this.an,
  });

  Na? na;
  Region? continentAs;
  Region? af;
  Region? eu;
  Sa? sa;
  Region? oc;
  String? an;

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        na: naValues.map[json["NA"]],
        continentAs: json["AS"] == null ? null : regionValues.map[json["AS"]],
        af: json["AF"] == null ? null : regionValues.map[json["AF"]],
        eu: json["EU"] == null ? null : regionValues.map[json["EU"]],
        sa: json["SA"] == null ? null : saValues.map[json["SA"]],
        oc: json["OC"] == null ? null : regionValues.map[json["OC"]],
        an: json["AN"],
      );

  Map<String, dynamic> toJson() => {
        "NA": na == null ? null : naValues.reverse[na],
        "AS": continentAs == null ? null : regionValues.reverse[continentAs],
        "AF": af == null ? null : regionValues.reverse[af],
        "EU": eu == null ? null : regionValues.reverse[eu],
        "SA": sa == null ? null : saValues.reverse[sa],
        "OC": oc == null ? null : regionValues.reverse[oc],
        "AN": an,
      };
}

enum Region { africa, americas, asia, europe, oceania, empty }

final regionValues = EnumValues({
  "Africa": Region.africa,
  "Americas": Region.americas,
  "Asia": Region.asia,
  "": Region.empty,
  "Europe": Region.europe,
  "Oceania": Region.oceania
});

enum Na { northAmerica }

final naValues = EnumValues({"North America": Na.northAmerica});

enum Sa { southAmerica }

final saValues = EnumValues({"South America": Sa.southAmerica});

enum WorldRegion { amer, apac, emea }

final worldRegionValues = EnumValues({"AMER": WorldRegion.amer, "APAC": WorldRegion.apac, "EMEA": WorldRegion.emea});

class Name {
  Name({
    this.common,
    this.official,
    this.native,
    this.wiki,
  });

  String? common;
  String? official;
  Map<String, Native>? native;
  String? wiki;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        native: Map.from(json["native"]).map((k, v) => MapEntry<String, Native>(k, Native.fromJson(v))),
        wiki: json["wiki"],
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "native": Map.from(native!).map((k, v) => MapEntry<String, dynamic>(k, v!.toJson())),
        "wiki": wiki,
      };
}

class Native {
  Native({
    this.official,
    this.common,
  });

  String? official;
  String? common;

  factory Native.fromJson(Map<String, dynamic> json) => Native(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class Population {
  Population({
    this.count,
    this.worldPercentage,
  });

  int? count;
  double? worldPercentage;

  factory Population.fromJson(Map<String, dynamic> json) => Population(
        count: json["count"],
        worldPercentage: json["worldPercentage"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "worldPercentage": worldPercentage,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
// To parse this JSON data, do
//
//     final xCountry = xCountryFromJson(jsonString);
