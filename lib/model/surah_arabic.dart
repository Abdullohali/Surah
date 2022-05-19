// To parse this JSON data, do
//
//     final surahArabic = surahArabicFromJson(jsonString);

import 'dart:convert';

List<SurahArabic> surahArabicFromJson(String str) => List<SurahArabic>.from(
    json.decode(str).map((x) => SurahArabic.fromJson(x)));

String surahArabicToJson(List<SurahArabic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurahArabic {
  SurahArabic({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  int? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  factory SurahArabic.fromJson(Map<String, dynamic> json) => SurahArabic(
        number: json["number"] == null ? null : json["number"],
        audio: json["audio"] == null ? null : json["audio"],
        audioSecondary: json["audioSecondary"] == null
            ? null
            : List<String>.from(json["audioSecondary"].map((x) => x)),
        text: json["text"] == null ? null : json["text"],
        numberInSurah:
            json["numberInSurah"] == null ? null : json["numberInSurah"],
        juz: json["juz"] == null ? null : json["juz"],
        manzil: json["manzil"] == null ? null : json["manzil"],
        page: json["page"] == null ? null : json["page"],
        ruku: json["ruku"] == null ? null : json["ruku"],
        hizbQuarter: json["hizbQuarter"] == null ? null : json["hizbQuarter"],
        sajda: json["sajda"] == null ? null : json["sajda"],
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "audio": audio == null ? null : audio,
        "audioSecondary": audioSecondary == null
            ? null
            : List<dynamic>.from(audioSecondary!.map((x) => x)),
        "text": text == null ? null : text,
        "numberInSurah": numberInSurah == null ? null : numberInSurah,
        "juz": juz == null ? null : juz,
        "manzil": manzil == null ? null : manzil,
        "page": page == null ? null : page,
        "ruku": ruku == null ? null : ruku,
        "hizbQuarter": hizbQuarter == null ? null : hizbQuarter,
        "sajda": sajda == null ? null : sajda,
      };
}
