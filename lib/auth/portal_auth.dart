import 'package:firebase/auth/login_o_registro.dart';
import 'package:firebase/paginas/pagina_inicio.dart';
import 'package:firebase/paginas/pagina_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PortalAuth extends StatelessWidget {
  const PortalAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          
          if (snapshot.hasData) {
            return PaginaInicio();
          } else {
            return LoginORegistro();
          }

        },
      ),
    );
  }
}
