import 'dart:io';

import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:chat_app_firebase/view/auth/login_view.dart';
import 'package:chat_app_firebase/view/auth/signUp_view.dart';
import 'package:chat_app_firebase/view/getStarted/getStartedView.dart';
import 'package:chat_app_firebase/view/home/homeView.dart';
import 'package:chat_app_firebase/view/profile/profileView.dart';
import 'package:chat_app_firebase/view/splash/splash_view.dart';
import 'package:get/get.dart';

class AppRoute {
  static approute() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashView(),
        ),
        GetPage(
            name: RouteName.getStartedScreen,
            page: () => const GetStartedView()),
        GetPage(name: RouteName.loginScreen, page: () => const LoginView()),
        GetPage(name: RouteName.signUpScreen, page: () => const SignUpView()),
        GetPage(name: RouteName.homeScreen, page: () => const HomeView()),
        GetPage(name: RouteName.profileView, page: () => const Profileview())
      ];
}
