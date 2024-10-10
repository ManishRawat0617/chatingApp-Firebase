import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/routes/routeName.dart';
import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:chat_app_firebase/view/getStarted/getStartedView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBar,
        leading: const Icon(
          Icons.menu,
          size: 30,
          color: AppColor.white,
        ),
        title: const Text(
          AppString.appTitle,
          style: TextStyle(
              color: AppColor.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.profileView);
            },
            child: const Icon(
              Icons.person,
              size: 30,
              color: AppColor.white,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(GetStartedView());
      }),
    );
  }
}
