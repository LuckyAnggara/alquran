import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class LocalStorageController extends GetxController {
  final box = GetStorage();

  bool get isDark => box.read('darkmode') ?? false;

  double get arabFontSize => box.read('arabFontSize') ?? 30;

  ThemeData get theme => isDark
      ? ThemeData.dark().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.robotoTextTheme(),
        )
      : ThemeData.light().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.robotoTextTheme(),
        );
  void changeTheme(bool val) => box.write('darkmode', val);
}
