import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/tab_home_controller.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabHomeController _tabX =
        Get.put(TabHomeController(), tag: 'tabHomeController');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: TabBar(
        controller: _tabX.controller,
        indicatorWeight: 4,
        physics: const BouncingScrollPhysics(),
        tabs: List<Widget>.generate(_tabX.tabList.length, (int index) {
          return Tab(
            child: Text(
              _tabX.tabList[index],
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          );
        }),
      ),
    );
  }
}
