import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tiktok_clone/constant.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  String labelText;
  bool isObs = false;
  IconData icon;
  TextInputField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.isObs,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObs,
      decoration: InputDecoration(
          label: Text(labelText),
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: borderColor))),
    );
  }
}
