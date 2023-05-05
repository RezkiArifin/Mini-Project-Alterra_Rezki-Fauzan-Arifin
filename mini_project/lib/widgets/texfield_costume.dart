import 'dart:async';

import 'package:flutter/material.dart';

class TextFieldCostume extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIconWidget;

  const TextFieldCostume({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIconWidget,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
