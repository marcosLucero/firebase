import 'package:firebase/auth/servei_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BorbujaMensaje extends StatelessWidget {
  final String mensaje;
  final String idAuthor;

  const BorbujaMensaje({
    super.key,
    required this.mensaje,
    required this.idAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Align(
        alignment: idAuthor == ServeiAuth().getUsarioActual()!.uid
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: idAuthor == ServeiAuth().getUsarioActual()!.uid
                ? Colors.green
                : Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(mensaje),
          ),
        ),
      ),
    );
  }
}
