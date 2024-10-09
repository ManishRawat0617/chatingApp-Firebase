import 'package:chat_app_firebase/resources/assets/images.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final AppBar? appbar;

  AppBackground({
    super.key,
    required this.child,
    this.appbar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.getStartedBg), fit: BoxFit.fill)),
        child: child,
      ),
    );
  }
}
