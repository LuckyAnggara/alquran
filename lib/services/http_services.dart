import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/surah_model.dart';

class HttpServices {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.quran.sutanlab.id';

  Future<SurahModel> fetchSurah() async {
    var response = await _dio.get('$_baseUrl/surah');

    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      return SurahModel.fromJson(data);
    } else {
      throw Exception();
    }
  }
}
