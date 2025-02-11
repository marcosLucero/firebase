import 'package:flutter/material.dart';

class TextfieldAuth extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  const TextfieldAuth({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
      child: TextField(
        cursorColor: Colors.yellow,
        style: const TextStyle(color: Colors.yellow), 
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
          fillColor: Colors.blue, filled: true
        ),
      ),
      
    );
  }
}