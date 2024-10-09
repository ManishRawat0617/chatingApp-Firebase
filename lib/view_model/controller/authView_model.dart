import 'dart:io';

import 'package:chat_app_firebase/data/app_exception.dart';
import 'package:chat_app_firebase/utilis/utilis.dart';
import 'package:chat_app_firebase/view/home/homeView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class AuthViewModel extends GetxController {
  final emailController = TextEditingController().obs;

  final passwordController = TextEditingController().obs;

  final firstNameController = TextEditingController().obs;

  final lastNameController = TextEditingController().obs;

  final userNameController = TextEditingController().obs;

  final phoneController = TextEditingController().obs;

  void login(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      auth
          .signInWithEmailAndPassword(
              email: emailController.value.text,
              password: passwordController.value.text)
          .then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeView()));
        print(value.user);
      });
      emailController.value.clear();
      passwordController.value.clear();
    } catch (e) {
      print(e);
    }
    print(emailController.value.text.toString());
  }

  void signup() {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      auth
          .createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      )
          .then((value) {
        Utilis.snackBar("Create User", value.user!.email.toString());
      });

      emailController.value.clear();
      passwordController.value.clear();
      lastNameController.value.clear();
      firstNameController.value.clear();
      phoneController.value.clear();
      phoneController.value.clear();
    } on SocketException {
      throw InternetException;
    } catch (err) {
      Utilis.toastMessage(err.toString());
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
