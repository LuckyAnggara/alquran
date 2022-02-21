import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quran_ku/controllers/local_storage_controller.dart';
import 'package:quran_ku/views/homepage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalStorageController localStorageController =
        Get.put(LocalStorageController(), tag: 'localStorageController');

    return SimpleBuilder(builder: (_) {
      return GetMaterialApp(
        theme: localStorageController.theme,
        // theme: ThemeData(
        //   textTheme: GoogleFonts.robotoTextTheme(),
        // ),
        home: HomePage(),
      );
    });
  }
}
