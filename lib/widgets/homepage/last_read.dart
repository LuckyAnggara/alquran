import 'package:flutter/material.dart';

class LastReadCard extends StatelessWidget {
  const LastReadCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/al_quran.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
