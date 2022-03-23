import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_ku/models/surah_model.dart';
import 'package:quran_ku/services/http_services.dart';

class AudioController extends GetxController {
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void play(url) async {
    await player.setUrl(url);
    player.play();
  }
}
