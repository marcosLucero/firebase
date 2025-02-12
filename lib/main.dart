import 'package:firebase/paginas/pagina_registro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      home: Scaffold(
        body: PaginaRegistro()
      ),
    );
  }
}


/*
1) tener node.js instalado
  - Comprobar con:
    node -v
    npm -v

2) Pagina de firebase; go to console
  - Cuenta de google

3) Crear un nuevo proyecto
  - Nombre del proyecto

4) Ir al menu compilacion y habilitar: 
    Autenticacion por correo electronico y firestore database

5) en cmd de VScode:
    npm install -g firebase-tools en viusal o cmd (instalar firebase tools)
    poner firebase login y usar el mismo correo de google de antes

6) en terminal del viusal 
  -Flutter pub global activate flutterfire_cli 
  -dart pub global activate flutterfire_cli
    -flutterfire configure
*/