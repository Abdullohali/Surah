import 'dart:convert';

import 'package:surah/model/surah_arabic.dart';
import 'package:surah/model/surah_model.dart';
import 'package:http/http.dart' as http;

class SurahService {
  Future<List<SurahModelUzbek>?> fetchSurahUzbek() async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/uzb-muhammadsodikmu.json"),
      );
      if (response.statusCode == 200) {
        List<SurahModelUzbek> data =
            (jsonDecode(response.body)['quran'] as List)
                .map((e) => SurahModelUzbek.fromJson(e))
                .toList();
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      // return e;
    }
  }

  Future<List<SurahArabic>?> fetchSurahArabic() async {
    try {
      var response = await http.get(
        Uri.parse("https://api.alquran.cloud/v1/surah/2/ar.alafasy#"),
      );
      if (response.statusCode == 200) {
        List<SurahArabic>? data =
            (jsonDecode(response.body)['data']['ayahs'] as List)
                .map((e) => SurahArabic.fromJson(e))
                .toList();
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
