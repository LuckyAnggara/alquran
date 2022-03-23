import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_ku/controllers/audio_controller.dart';
import 'package:quran_ku/controllers/surah_detail_controller.dart';
import 'package:supercharged/supercharged.dart';
import 'package:just_audio/just_audio.dart';

import '../constant.dart';
import '../controllers/local_storage_controller.dart';

class ReadPage extends StatelessWidget {
  int numSurah = Get.arguments['numSurah'];
  final player = AudioPlayer();

  final SurahDetailController surahDetailController =
      Get.put(SurahDetailController());
  final AudioController audioController = Get.put(AudioController());
  final LocalStorageController localStorageController =
      Get.find(tag: 'localStorageController');

  @override
  Widget build(BuildContext context) {
    surahDetailController.fetchDetail(numSurah);
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          var dataSurah = surahDetailController.dataSurah.value;
          if (surahDetailController.isLoading.value) {
            return Center(
              child: SpinKitCircle(
                color: Colors.black,
              ),
            );
          } else {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                  color: '#007AFF'.toColor(),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Back',
                                  style: GoogleFonts.openSans().copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: '#007AFF'.toColor(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${dataSurah.name!.transliteration!.id}',
                            style: GoogleFonts.openSans().copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Filter',
                            style: GoogleFonts.openSans().copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: '#007AFF'.toColor(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (x, i) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  dataSurah.verses![i].text!.arab!,
                                  style: blackFontStyleArabic2.copyWith(
                                      fontSize:
                                          localStorageController.arabFontSize),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  dataSurah.verses![i].translation!.id!,
                                  style: blackFontStyleArabic2.copyWith(
                                      fontSize: 18),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: "#EEEEEF".toColor(),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: "#BB9D3E".toColor(),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(90),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            dataSurah.verses![i].number!.inSurah
                                                .toString(),
                                            style:
                                                blackFontStyleArabic2.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            child:
                                                Icon(Icons.play_circle_outline),
                                            onTap: () {
                                              audioController.play(dataSurah
                                                  .verses![i].audio!.primary);
                                            },
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.share),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.bookmark_border,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: dataSurah.verses!.length,
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
