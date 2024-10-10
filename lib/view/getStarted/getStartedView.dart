import 'package:chat_app_firebase/resources/assets/images.dart';
import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:chat_app_firebase/view/getStarted/widget/getStartedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.getStartedBg), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              AppString.welcomeText.text
                  .size(45)
                  .align(TextAlign.center)
                  .color(AppColor.white)
                  .fontFamily(AppStringStyle.irishGrover)
                  .make(),
              const SizedBox(
                height: 20,
              ),
              AppString.text2.text
                  .size(27)
                  .align(TextAlign.left)
                  .color(AppColor.white)
                  .fontFamily(AppStringStyle.irishGrover)
                  .make(),
              AppString.text3.text
                  .size(27)
                  .align(TextAlign.right)
                  .color(AppColor.white)
                  .fontFamily(AppStringStyle.irishGrover)
                  .make(),
              const Image(image: AssetImage(AppImage.getStartedImg)),
              AppString.text4.text
                  .size(20)
                  .align(TextAlign.center)
                  .color(AppColor.white)
                  .fontFamily(AppStringStyle.irishGrover)
                  .make(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GetStartedButton(
                ontap: () {
                  Get.toNamed(RouteName.loginScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
