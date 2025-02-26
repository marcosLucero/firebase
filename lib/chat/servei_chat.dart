
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServeiChat {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsarios() {

    return _firestore.collection("Usarios").snapshots().map((event) {

      return event.docs.map((documento){
        return documento.data();
        
      }
      ).toList();
    });  
  }
}