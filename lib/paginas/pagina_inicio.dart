import 'package:firebase/auth/servei_auth.dart';
import 'package:firebase/chat/servei_chat.dart';
import 'package:firebase/componetes/item_usari.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
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
      body: StreamBuilder(
        stream: ServeiChat().getUsarios(),
        builder: (context, snapshot) {

          //si hay un error
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error en la snapshot"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Cargando datos...");
          }

          //Devuelvo los datos
          return ListView(
            children: snapshot.data!.map<Widget>(
              (dadesUsari) => _construirItemUsario(dadesUsari),
              
              ).toList(),
          );
        },
      ),
    );
  }

  Widget _construirItemUsario(Map<String, dynamic> dadesUsari) {
    return ItemUsari(emailUsario: dadesUsari["email"]);
    }

}
