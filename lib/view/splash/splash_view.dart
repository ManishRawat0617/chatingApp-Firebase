import 'package:chat_app_firebase/resources/assets/icons.dart';
import 'package:chat_app_firebase/resources/assets/images.dart';
import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:chat_app_firebase/view_model/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen size
    final isSmallScreen = size.width < 600; // Check if the screen is small

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.splashScreenBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05), // Responsive padding
              child: Lottie.asset(
                AppIcons.appLogo,
                width: isSmallScreen
                    ? size.width * 0.5
                    : size.width * 0.3, // Responsive Lottie width
                height: isSmallScreen
                    ? size.width * 0.5
                    : size.width * 0.3, // Responsive Lottie height
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: size.height * 0.1), // Responsive height
            AppString.appTitle.text
                .size(isSmallScreen ? 30 : 52) // Responsive font size
                .fontWeight(FontWeight.bold)
                .white
                .fontFamily(AppStringStyle.irishGrover)
                .make(),
          ],
        ),
      ),
    );
  }
}
