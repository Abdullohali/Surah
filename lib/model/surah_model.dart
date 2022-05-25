// To parse this JSON data, do
//
//     final surahModel = surahModelFromJson(jsonString);

import 'dart:convert';

List<SurahModelUzbek> surahModelFromJson(String str) =>
    List<SurahModelUzbek>.from(json.decode(str).map((x) => SurahModelUzbek.fromJson(x)));

String surahModelToJson(List<SurahModelUzbek> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurahModelUzbek {
  SurahModelUzbek({
    this.chapter,
    this.verse,
    this.text,
  });

  String? chapter;
  int? verse;
  String? text;

  factory SurahModelUzbek.fromJson(Map<String, dynamic> json) => SurahModelUzbek(
        chapter: json["chapter"] == null ? null : json["chapter"],
        verse: json["verse"] == null ? null : json["verse"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "chapter": chapter == null ? null : chapter,
        "verse": verse == null ? null : verse,
        "text": text == null ? null : text,
      };
}
