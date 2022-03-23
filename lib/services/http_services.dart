import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quran_ku/models/surah_detail_model.dart';

import '../models/surah_model.dart';

class HttpServices {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.quran.sutanlab.id';

  Future<SurahModel> fetchSurah() async {
    var response = await _dio.get('$_baseUrl/surah');
    if (response.statusCode == 200) {
      // var data = json.decode(response.data);
      var data = response.data;
      return SurahModel.fromJson(data);
    } else {
      throw Exception();
    }
  }

  Future<SurahDetailModel> fetchDetailSurah(int numSurah) async {
    var response = await _dio.get('$_baseUrl/surah/$numSurah');
    if (response.statusCode == 200) {
      var data = response.data;
      return SurahDetailModel.fromMap(data);
    } else {
      throw Exception();
    }
  }
}
