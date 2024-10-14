import 'package:chat_app_firebase/view_model/services/auth/unipueNumber.dart';
import 'package:chat_app_firebase/model/signUpModel/userModel.dart';
import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:chat_app_firebase/utilis/utilis.dart';
import 'package:chat_app_firebase/view/home/homeView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      await auth
          .signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      )
          .then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeView()));
        print(value.user);
      });

      // Clear input fields after login
      emailController.value.clear();
      passwordController.value.clear();
    } catch (e) {
      print(e);
      Utilis.toastMessage(e.toString());
    }
  }





  void signup() async {
    AuthServices authServices = AuthServices();
   

// collect inputs from these data
    final String email = emailController.value.text;
    final String firstName = firstNameController.value.text;
    final String lastName = lastNameController.value.text;
    final String userName = userNameController.value.text;
    final String phoneNumber = phoneController.value.text;

    UserModel newUser = UserModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        phoneNumber: phoneNumber);

try{
  authServices.signupWithUniQuePhoneAndUsername(newUser, passwordController.value.text);
    emailController.value.clear();
      passwordController.value.clear();
      lastNameController.value.clear();
      firstNameController.value.clear();
      phoneController.value.clear();

}catch(err){
   Utilis.toastMessage(err.toString());
}
  }
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed(RouteName.loginScreen);
  }

}
