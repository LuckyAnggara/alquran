import 'package:get/get.dart';
import 'package:quran_ku/models/surah_model.dart';
import 'package:quran_ku/services/http_services.dart';

class SurahController extends GetxController {
  var isLoading = true.obs;
  RxList surahList = [].obs;
  final HttpServices _httpServices = HttpServices();

  @override
  void onInit() {
    fetchSurah();
    super.onInit();
  }

  void fetchSurah() async {
    try {
      isLoading(true);
      var surah = await _httpServices.fetchSurah();
      if (surah != null) {
        surahList.value = surah.data!;
      }
    } finally {
      isLoading(false);
    }
  }
}
