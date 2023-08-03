import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/pallete.dart';

class AuthFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const AuthFiled(
      {super.key, required this.controller, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Pallete.blueColor,
              width: 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Pallete.greyColor,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18),
          contentPadding: const EdgeInsets.all(22.0)),
    );
  }
}
