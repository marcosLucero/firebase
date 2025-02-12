import 'package:flutter/material.dart';

class BotoAuth extends StatelessWidget {
  final String texto;
  final Function() onTap;

  const BotoAuth({
    super.key,
    required this.texto,
    required this.onTap,
    });



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 4),),
        ),
      ),
    );
  }
}