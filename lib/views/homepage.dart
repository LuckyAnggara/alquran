import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_ku/widgets/homepage/last_read.dart';

import '../controllers/local_storage_controller.dart';
import '../widgets/homepage/list_surah.dart';
import '../widgets/homepage/tab_body.dart';
import '../widgets/homepage/tab_home.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final LocalStorageController localStorageController =
      Get.find(tag: 'localStorageController');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                height: Get.height * .06,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 24,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'QURAN APP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              TabHome(),
              TabBody(
                children: [ListSurah(), Container()],
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     localStorageController.changeTheme(!localStorageController.isDark);
        //   },
        // ),
      ),
    );
  }
}
