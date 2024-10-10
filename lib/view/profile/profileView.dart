import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:chat_app_firebase/view/appBackground.dart';
import 'package:chat_app_firebase/view/profile/widget/logoutButton.dart';
import 'package:chat_app_firebase/view_model/controller/authView_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  final controller = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBackground(
        appbar: AppBar(
          backgroundColor: AppColor.appBar,
          title: Text("Profile "),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 30,
                right: 20,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: size.height * 0.08,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "User Name",
                      style: TextStyle(
                          fontSize: 23, fontFamily: AppStringStyle.irishGrover),
                    )
                  ],
                )),
            Positioned(
              top: size.height * 0.3,
              left: size.width * 0.1,
              child: const Text(
                "User email",
                style: TextStyle(
                    fontSize: 23, fontFamily: AppStringStyle.irishGrover),
              ),
            ),
            Positioned(
                top: size.height * 0.37,
                left: size.width * 0.1,
                child: LogoutButton(
                  ontap: () {
                    controller.logout();
                  },
                ))
          ],
        ));
  }
}
