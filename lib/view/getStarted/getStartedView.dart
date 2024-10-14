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
    // Get the screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.getStartedBg),
            fit: BoxFit.cover, // Changed to cover for better scaling
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.1, horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space items evenly
            children: [
              Column(
                children: [
                  AppString.welcomeText.text
                      .size(screenHeight * 0.05) // Responsive font size
                      .align(TextAlign.center)
                      .color(AppColor.white)
                      .fontFamily(AppStringStyle.irishGrover)
                      .make(),
                  const SizedBox(height: 10), // Reduced spacing for better fit
                  AppString.text2.text
                      .size(screenHeight * 0.04) // Responsive font size
                      .align(TextAlign.left)
                      .color(AppColor.white)
                      .fontFamily(AppStringStyle.irishGrover)
                      .make(),
                  AppString.text3.text
                      .size(screenHeight * 0.04) // Responsive font size
                      .align(TextAlign.right)
                      .color(AppColor.white)
                      .fontFamily(AppStringStyle.irishGrover)
                      .make(),
                ],
              ),
              Expanded(
                child: Center(
                  child: Image(image: AssetImage(AppImage.getStartedImg)),
                ),
              ),
              Column(
                children: [
                  AppString.text4.text
                      .size(screenHeight * 0.025) // Responsive font size
                      .align(TextAlign.center)
                      .color(AppColor.white)
                      .fontFamily(AppStringStyle.irishGrover)
                      .make(),
                  SizedBox(height: screenHeight * 0.02), // Dynamic spacing
                  GetStartedButton(
                    ontap: () {
                      Get.toNamed(RouteName.loginScreen);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
