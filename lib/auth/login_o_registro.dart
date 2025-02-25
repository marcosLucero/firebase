import 'package:firebase/paginas/pagina_login.dart';
import 'package:firebase/paginas/pagina_registro.dart';
import 'package:flutter/material.dart';

class LoginORegistro extends StatefulWidget {
  const LoginORegistro({super.key});

  @override
  State<LoginORegistro> createState() => _LoginORegistroState();
}

class _LoginORegistroState extends State<LoginORegistro> {

  bool mostrarPaginaLogin = true;

  void intercambiarPagina() {
    setState(() {
      mostrarPaginaLogin = !mostrarPaginaLogin;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (mostrarPaginaLogin) {
      return PaginaLogin(hacerClic: intercambiarPagina,);
    } else {
      return PaginaRegistro(hacerClic: intercambiarPagina,);
    }
  }
}