import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemUsari extends StatelessWidget {
  final String emailUsario;
  const ItemUsari({super.key, required this.emailUsario});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(top: 10, left: 40, right: 40),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(emailUsario),
      ),
    );
  }
}
