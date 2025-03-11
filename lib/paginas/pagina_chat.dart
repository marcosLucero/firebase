import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/auth/servei_auth.dart';
import 'package:firebase/chat/servei_chat.dart';
import 'package:firebase/componetes/borbuja_mensaje.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaChat extends StatefulWidget {
  final String idReceptor;

  const PaginaChat({
    super.key,
    required this.idReceptor,
  });

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {
  final TextEditingController tecMensaje = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Sala chat"),
      ),
      body: Column(
        children: [
          //zona mensajes
          _crearZonaMostrarMensajes(),

          //zona enviar mensaje
          _crearZonaEnviarMensaje(),
        ],
      ),
    );
  }

  Widget _crearZonaMostrarMensajes() {
    return Expanded(child: StreamBuilder(
      stream: ServeiChat().getMensajes(
        ServeiAuth().getUsarioActual()!.uid,
        widget.idReceptor,
      ),
      builder: (context, snapshot) {

        //caso de error
        if (snapshot.hasError) {
          return Text("Error en la carga de mesnajes");
          //caso de cargando datos
         
        }
         if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Cargando mensajes..."),
            );
          }
        //caso de datos cargados
        return ListView(
          children: snapshot.data!.docs.map((document) => _contruirItemMensaje(document)).toList(),
          );
    },
    ),
    );
  }
  Widget _contruirItemMensaje(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    return BorbujaMensaje(mensaje: data["mensaje"],);//Text(data["mensaje"]);
  }

  Widget _crearZonaEnviarMensaje() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: tecMensaje,
            decoration: InputDecoration(
              hintText: "Escribe un mensaje...",
              filled: true,
              fillColor: Colors.yellow,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: enviarMensaje,
          icon: Icon(Icons.send),
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green)),
        )
      ]),
    );
  }

  void enviarMensaje() {
    if (tecMensaje.text.isNotEmpty) {
      ServeiChat().enviarMensaje(
        widget.idReceptor,
        tecMensaje.text,
      );

      tecMensaje.clear();
    }
  }
}
