import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //usario actual
  User? getUsarioActual() {
    return _auth.currentUser;
  }

  //hacer logout
  Future<void> hacerLogout() async {
    return await _auth.signOut();
  }

  //hacer login
  Future<String?> loginConEmailPassword(String email, String password) async {
    try {
      UserCredential credencialUsari = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //Comprobamos si el usuario esta dado de alta en la base de datos.

      final QuerySnapshot querySnapshot = await _firestore
          .collection("Usarios")
          .where("emial", isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        
        _firestore.collection("Usarios").doc(credencialUsari.user!.uid).set({
          "uid": credencialUsari.user!.uid,
          "email": email,
          "nombre": "",
        });
      }

      _firestore.collection("Usarios").doc(credencialUsari.user!.uid).set({
        "uid": credencialUsari.user!.uid,
        "email": email,
        "nombre": "",
      });

      return null;
    } on FirebaseAuthException catch (e) {
      return "Error: ${e.message}";
    }
  }

  //hacer registro
  Future<String?> registroConEmailPassword(String email, password) async {
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

      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "El correo ya esta en uso";
        case "invalid-email":
          return "El correo no es valido";
        case "weak-password":
          return "La contraseña es muy debil";
        default:
          return "Error ${e.message}";
      }
    } catch (e) {
      return "Error $e";
    }
  }
}
