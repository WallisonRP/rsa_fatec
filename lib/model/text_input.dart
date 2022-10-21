import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final controller;
  const TextInput({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 280,
      maxLines: 5,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3.0, color: Colors.blue),
              borderRadius: BorderRadius.circular(15.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3.0, color: Colors.blue),
              borderRadius: BorderRadius.circular(15.0))),
    );
  }
}
