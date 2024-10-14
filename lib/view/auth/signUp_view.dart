import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:chat_app_firebase/view/appBackground.dart';
import 'package:chat_app_firebase/view/auth/widget/appName.dart';
import 'package:chat_app_firebase/view/auth/widget/inputField.dart';
import 'package:chat_app_firebase/view/auth/widget/signupButton.dart';
import 'package:chat_app_firebase/view_model/controller/authView_model.dart';
import 'package:flutter/material.dart';
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
    // Get the screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBackground(
      child: SingleChildScrollView(
        // Allow scrolling if the content is too long
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05), // Responsive spacing
            const AppName(),
            SizedBox(height: screenHeight * 0.05), // Responsive spacing
            InputField(
              controller: signupController.firstNameController.value,
              hintText: "Enter the first name ",
              msgtitle: "Name",
              msg: "Enter the first name",
            ),
            SizedBox(height: screenHeight * 0.01), // Responsive spacing
            InputField(
              controller: signupController.lastNameController.value,
              hintText: "Enter the last name ",
              msgtitle: "Name",
              msg: "Enter the last name",
            ),
            SizedBox(height: screenHeight * 0.01), // Responsive spacing
            InputField(
              controller: signupController.emailController.value,
              hintText: "Enter the email address",
              msgtitle: "Email",
              msg: "Enter the email address",
            ),
            SizedBox(height: screenHeight * 0.01), // Responsive spacing
            InputField(
              controller: signupController.passwordController.value,
              hintText: "Enter the password",
              msgtitle: "Password",
              msg: "Enter the password",
            ),
            SizedBox(height: screenHeight * 0.01), // Responsive spacing
            InputField(
              controller: signupController.userNameController.value,
              hintText: "Enter the Username ",
              msgtitle: "Username",
              msg: "Enter the Username",
            ),
            SizedBox(height: screenHeight * 0.01), // Responsive spacing
            InputField(
              controller: signupController.phoneController.value,
              hintText: "Enter the phone number ",
              msgtitle: "Phone",
              msg: "Enter the phone number",
            ),
            SizedBox(height: screenHeight * 0.05), // Responsive spacing
            SizedBox(height: screenHeight * 0.05), // Additional spacing
            SignUpButton(
              title: "Sign Up",
              ontap: signupController.signup,
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.loginScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: TextStyle(
                        fontSize: screenWidth * 0.05), // Responsive font size
                  ),
                  SizedBox(width: screenWidth * 0.02), // Responsive spacing
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: screenWidth * 0.055, // Responsive font size
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: screenHeight * 0.05), // Bottom padding for extra space
          ],
        ),
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
