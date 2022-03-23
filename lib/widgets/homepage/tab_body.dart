import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_ku/controllers/tab_home_controller.dart';

class TabBody extends StatelessWidget {
  final List<Widget>? children;
  TabBody({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabHomeController _tabX = Get.find(tag: 'tabHomeController');

    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: TabBarView(
          controller: _tabX.controller,
          children: children!,
        ),
      ),
    );
  }
}
