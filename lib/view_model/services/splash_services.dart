import 'dart:async';

import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:get/get.dart';

class SplashServices {
  void isUserLogin() {
    Timer(Duration(seconds: 4), () => Get.toNamed(RouteName.getStartedScreen));
  }
}
