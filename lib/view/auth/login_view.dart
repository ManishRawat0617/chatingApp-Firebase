import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:chat_app_firebase/view/appBackground.dart';
import 'package:chat_app_firebase/view/auth/widget/appName.dart';
import 'package:chat_app_firebase/view/auth/widget/inputField.dart';
import 'package:chat_app_firebase/view/auth/widget/loginButton.dart';
import 'package:chat_app_firebase/view_model/controller/authView_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(AuthViewModel());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBackground(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          AppName(),
          SizedBox(
            height: size.height * 0.07,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                    hintText: "Enter your email",
                    controller: loginController.emailController.value,
                    msgtitle: "Error",
                    msg: "Please enter your email",
                  ),
                  InputField(
                    hintText: "Enter your password",
                    controller: loginController.passwordController.value,
                    msgtitle: "Error",
                    msg: "Please enter your password",
                  )
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          LoginButton(
            ontap: () {
              if (_formKey.currentState!.validate()) {
                loginController.login(context);
              }
            },
            title: "Login",
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.signUpScreen);
            },
            child: Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account !",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 23, color: AppColor.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
