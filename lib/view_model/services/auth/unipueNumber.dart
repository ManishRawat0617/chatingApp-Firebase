import 'package:chat_app_firebase/model/signUpModel/userModel.dart';
import 'package:chat_app_firebase/utilis/utilis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signupWithUniQuePhoneAndUsername(
      UserModel userModel, String password) async {
    try {
      // check if thr phone number exists in firestore
      QuerySnapshot phoneNumberExist = await _firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: userModel.phoneNumber)
          .get();
      QuerySnapshot userNameExist = await _firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: userModel.userName)
          .get();
      if (phoneNumberExist.docs.isNotEmpty) {
        Utilis.toastMessage(
            "Phone number already exist . Please use a different phone number ");
        return;
      }
      if (userNameExist.docs.isNotEmpty) {
        Utilis.toastMessage(
            "Phone number already exist . Please use a different phone number ");
        return;
      }

      // If phone number is unique  create a new user with firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userModel.email, password: password);

      // set user Uid
      userModel.uid = userCredential.user!.uid;

      // save the new user to firestore
      await _firestore
          .collection('users')
          .doc(userModel.uid)
          .set(userModel.toMap());
      Utilis.toastMessage("User created message");
    } catch (err) {
      Utilis.toastMessage("Error: ${err.toString()}");
    }
  }
}
