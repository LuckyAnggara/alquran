import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran_ku/controllers/surah_controller.dart';
import 'package:quran_ku/models/surah_model.dart';

import '../../constant.dart';
import '../../views/readpage.dart';

class ListSurah extends StatelessWidget {
  final SurahController surahController = Get.put(SurahController());

  ListSurah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (surahController.isLoading.value) {
        return Center(
          child: SpinKitCircle(
            color: Colors.black,
          ),
        );
      } else {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: surahController.surahList.length,
          itemBuilder: (ctx, x) {
            var data = surahController.surahList[x];
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => ReadPage(),
                  arguments: {"numSurah": data.number},
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: Stack(
                        children: [
                          Center(
                            child: Text(data.number.toString(),
                                style: blackFontStyle3),
                          ),
                          SvgPicture.asset('assets/svg/hexagon_star.svg',
                              color: Colors.amber,
                              semanticsLabel: 'A red up arrow'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name.transliteration.id,
                          style: blackFontStyle2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              data.revelation.id,
                              style: gyreyFontStyle,
                            ),
                            Text(
                              ' - ',
                              style: gyreyFontStyle,
                            ),
                            Text(
                              '${data.numberOfVerses} Ayat',
                              style: gyreyFontStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      data.name.short,
                      style: blackFontStyleArabic,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 2.0,
            );
          },
        );
      }
      return Text('aaaa');
    });
  }
}
