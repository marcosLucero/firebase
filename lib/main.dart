import 'package:firebase/auth/portal_auth.dart';
import 'package:firebase/firebase_options.dart';
import 'package:firebase/paginas/pagina_login.dart';
import 'package:firebase/paginas/pagina_registro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      home: PortalAuth(),
    );
  }
}


/*
1) tener node.js instalado
  - Comprobar en cmd de W10:
    node -v
    npm -v

2) Pagina de firebase: 
  -go to console
  - Cuenta de google

3) Crear un nuevo proyecto
  - Nombre del proyecto

4) Ir al menu compilacion y habilitar: 
    -Autenticacion por correo electronico  
    -firestore database crear base de datos en modo prueba.

5) En terminal de VScode:
    npm install -g firebase-tools
    en viusal o cmd (instalar firebase tools)
    poner firebase login y luego usar el mismo correo de google de antes

6) En terminal del viusal 
  -Flutter pub global activate flutterfire_cli 
  -dart pub global activate flutterfire_cli
    -flutterfire configure (si no va se tiene que añadir al path)

7) istalar dependencias de firebase 
  -flutter pub add firebase_core
  -flutter pub add firebase_auth
*/