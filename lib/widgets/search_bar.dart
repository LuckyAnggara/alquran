import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onPress;
  SearchBar({
    Key? key,
    this.controller,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        color: Colors.black12,
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        decoration: const InputDecoration(
            hintStyle: TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
            hintText: "Enter surah to search.. ",
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black54,
            )),
        onChanged: null,
        onSubmitted: null,
      ),
    );
  }
}
