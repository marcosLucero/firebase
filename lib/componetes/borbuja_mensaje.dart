import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BorbujaMensaje extends StatelessWidget {
final String mensaje;

  const BorbujaMensaje({super.key,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(mensaje),
        ),
      ),
    );
  }
}