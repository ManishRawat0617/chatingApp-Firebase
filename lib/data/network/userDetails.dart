
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDetails {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> userName() async {
    final uid = _auth.currentUser!.uid;
    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(uid).get();
    final result = userDoc.data() as Map<String, dynamic>;
    
    return userDoc.data() as Map<String, dynamic>;
  }
}
