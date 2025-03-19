import 'dart:ffi';
import 'dart:typed_data';

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

  Future _conectarConMongoDb() async{

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
          ],
        ),
      ),
    );
  }
}
