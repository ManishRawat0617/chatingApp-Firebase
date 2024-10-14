import 'dart:async';
import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class SplashServices {
  Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      // Handle Firebase initialization errors here
      print("Error initializing Firebase: $e");
      // You can navigate to an error screen or show a message here if needed
    }
  }

  void checkUserLogin() async {
    await initializeFirebase(); // Ensure Firebase is initialized
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    // Redirect based on user login status
    await Future.delayed(Duration(seconds: 4), () {
      _navigateToNextScreen(user);
    });
  }

  void _navigateToNextScreen(User? user) {
    if (user != null) {
      Get.toNamed(RouteName.homeScreen);
    } else {
      Get.toNamed(RouteName.getStartedScreen);
    }
  }
}
