import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //hacer registro
  Future<UserCredential> registroConEmailPassword(
      String email, password) async {
    try {
      UserCredential credencialUsari =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credencialUsari;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
