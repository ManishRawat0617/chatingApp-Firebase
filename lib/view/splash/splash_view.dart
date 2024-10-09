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
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
   
    super.initState();
    splashServices.isUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImage.splashScreenBg,
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Lottie.asset(AppIcons.appLogo),
            ),
            VxBox().height(size.height * 0.2).make(),
            AppString.appTitle.text
                .size(52)
                .fontWeight(FontWeight.bold)
                .white
                .fontFamily(AppStringStyle.irishGrover)
                .make()
          ],
        ),
      ),
    );
  }
}
