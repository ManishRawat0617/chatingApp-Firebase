import 'dart:async';

import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class SplashServices {
  void isUserLogin() {
  //   final auth = FirebaseAuth.instance;
  // final user = auth.currentUser;
    // if(user !=null){
    //   Timer(Duration(seconds: 4), () =>  Get.toNamed(RouteName.homeScreen));
   
    // }
    // else{
     Timer(Duration(seconds: 4), () => Get.toNamed(RouteName.getStartedScreen));

    // }
   
  }
}
