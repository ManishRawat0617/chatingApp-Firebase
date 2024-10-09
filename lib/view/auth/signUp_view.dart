import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:chat_app_firebase/view/appBackground.dart';
import 'package:chat_app_firebase/view/auth/widget/appName.dart';
import 'package:chat_app_firebase/view/auth/widget/inputField.dart';
import 'package:chat_app_firebase/view/auth/widget/signupButton.dart';
import 'package:chat_app_firebase/view_model/controller/authView_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final signupController = Get.put(AuthViewModel());

 
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        children: [
          const space(
            height: 50,
          ),
          const AppName(),
          const space(
            height: 50,
          ),
          InputField(
              controller: signupController.firstNameController.value,
              hintText: "Enter the first name ",
              msgtitle: "Name",
              msg: "Enter the first name"),
          const space(
            height: 5,
          ),
          InputField(
              controller: signupController.lastNameController.value,
              hintText: "Enter the last name ",
              msgtitle: "Name",
              msg: "Enter the last name"),
          const space(
            height: 5,
          ),
          InputField(
              controller: signupController.emailController.value,
              hintText: "Enter the email address",
              msgtitle: "email",
              msg: "Enter the email address"),
          const space(
            height: 5,
          ),
          InputField(
              controller: signupController.passwordController.value,
              hintText: "Enter the password",
              msgtitle: "email",
              msg: "Enter the password"),
          const space(
            height: 5,
          ),
          InputField(
              controller: signupController.userNameController.value,
              hintText: "Enter the Username ",
              msgtitle: "Username",
              msg: "Enter the Username"),
          const space(
            height: 5,
          ),
          InputField(
              controller: signupController.phoneController.value,
              hintText: "Enter the phone number ",
              msgtitle: "phone",
              msg: "Enter the phone number"),
          const space(
            height: 50,
          ),
          const space(height: 35),
          SignUpButton(
            title: "Sign Up",
            ontap: signupController.signup,
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.loginScreen);
            },
            child: Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Have an account !",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Login",
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

class space extends StatelessWidget {
  final double? height;
  final double? width;
  const space({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
