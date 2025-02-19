import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //hacer registro
  Future<UserCredential> registroConEmailPassword(
      String email, password) async {
    try {
      UserCredential credencialUsari =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore.collection("Usarios").doc(credencialUsari.user!.uid).set({
        "uid": credencialUsari.user!.uid,
        "email": email,
        "nombre": "",
      });

      return credencialUsari;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
