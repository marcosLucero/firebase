import 'package:firebase/auth/servei_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina de inicio"),
        actions: [
          IconButton(
            onPressed: () {
              ServeiAuth().hacerLogout();
              },
             icon: Icon(Icons.logout),
          )
        ],
      ),
      body: const Text("Pagina de inicio"),
    );
  }
}
