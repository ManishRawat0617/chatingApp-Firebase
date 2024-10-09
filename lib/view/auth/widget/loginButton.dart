import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback ontap;
  final String title;
  const LoginButton({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: Get.height * 0.065,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
            color: AppColor.appBar, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: AppColor.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: AppStringStyle.irishGrover),
          ),
        ),
      ),
    );
  }
}
