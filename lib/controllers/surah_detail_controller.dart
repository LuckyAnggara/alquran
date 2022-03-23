import 'package:get/get.dart';
import 'package:quran_ku/models/surah_model.dart';
import 'package:quran_ku/services/http_services.dart';

import '../models/surah_detail_model.dart';

class SurahDetailController extends GetxController {
  var isLoading = true.obs;
  var dataSurah = DataSurah().obs;
  final HttpServices _httpServices = HttpServices();

  void fetchDetail(int numSurah) async {
    try {
      isLoading(true);
      var ayah = await _httpServices.fetchDetailSurah(numSurah);
      if (ayah != null) {
        dataSurah.value = ayah.data!;
      }
    } finally {
      isLoading(false);
    }
  }
}
