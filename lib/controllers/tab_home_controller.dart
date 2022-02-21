import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<String> tabList = [
    'Surah',
    'Juz',
  ];

  TabController? controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: tabList.length);
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
