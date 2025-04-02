import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase/auth/servei_auth.dart';
import 'package:firebase/mongodb/db_conf.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongodb;

class EditarDatosusario extends StatefulWidget {
  const EditarDatosusario({super.key});

  @override
  State<EditarDatosusario> createState() => _EditarDatosusarioState();
}

class _EditarDatosusarioState extends State<EditarDatosusario> {
  mongodb.Db? _db;
  Uint8List? _imagenEnBytes;
  final ImagePicker imagePicker = ImagePicker();

  @override
  void dispose() {
    // TODO: implement dispose
    _db?.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _conectarConMongoDb().then((_) => print("Conectado a MongoDb"));
  }

  Future _conectarConMongoDb() async {
    _db = await mongodb.Db.create(DbConf().conectionString);

    await _db!.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar datos de usuario"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Editar datos de usuario"),

            //Boton para subir imagen o texto.
            _imagenEnBytes != null
                ? Image.memory(_imagenEnBytes!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover)
                : Text("No hay imagen"),

            SizedBox(height: 20),

            ElevatedButton( 
              onPressed: _subirImagen,
              child: Text("Subir imagen"),
            ),

            ElevatedButton(
              onPressed: _recuperarImagen,
              child: Text("Recuperar imagen"),
            ),
          ],
        ),
      ),
    );
  }

  Future _subirImagen() async {
    final imagenSelecionada =
        await imagePicker.pickImage(source: ImageSource.gallery);
      print("iamgen seleccionada: ${imagenSelecionada?.path}");
    //Mirar si ha encontrado una imagen
    if (imagenSelecionada != null) {
      //Para guardar la imagen la convertimos a bytes
      final bytesImagen = await File(imagenSelecionada.path).readAsBytes();
      //Convertimos los bytes a binarios para mongoDB
      final dadtosBinarios = mongodb.BsonBinary.from(bytesImagen);

      //Guardamos la imagen en la base de datos
      final collection = _db!.collection("imagenes_perfils");
      print("colecion selecionada");
      await collection.replaceOne(
        {"id_usuario_firebase": ServeiAuth().getUsarioActual()!.uid},
        {
          "id_usuario_firebase": ServeiAuth().getUsarioActual()!.uid,
          "nombre_foto": "foto_perfil",
          "imagen": dadtosBinarios,
          "data_subida": DateTime.now()
        },
        //Si no encuentra el documento lo crea
        upsert: true,
      );
      print("Imagen subida correctamente");
    }
  }

  Future<void> _recuperarImagen() async {
    try {
      final collection = _db!.collection("imagenes_perfils");
      final doc = await collection.findOne(
        {"id_usuario_firebase": ServeiAuth().getUsarioActual()!.uid},
      );

      //Podemos recuperar la imagen en bytes, pero sigue siendo binario
      if (doc != null && doc["imagen"] != null) {
        final imagenBinaria = doc["imagen"] as mongodb.BsonBinary;
        setState(() {
          _imagenEnBytes = imagenBinaria.byteList;
        });
      } else {
        print("No se ha encontrado la imagen");
      }
    } catch (e) {
      print("Error al recuperar la imagen: $e");
    }
  }
}
