import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:chat_app_firebase/view/appBackground.dart';
import 'package:chat_app_firebase/view/profile/widget/logoutButton.dart';
import 'package:chat_app_firebase/view/profile/widget/userdata.dart';
import 'package:chat_app_firebase/view_model/controller/authView_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profileview extends StatefulWidget {
  final String? userName;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;

  const Profileview({
    super.key,
    this.userName,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  final controller = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    final userFullName =
        widget.firstName.toString() + widget.lastName.toString();
    final size = MediaQuery.of(context).size;
    return AppBackground(
      appbar: AppBar(
        backgroundColor: AppColor.appBar,
        title: const Text("Profile"),
      ),
      child: Stack(
        children: [
          // Display user avatar and name
          Positioned(
            top: 30,
            right: 20,
            child: Column(
              children: [
                CircleAvatar(
                  radius: size.height * 0.08,
                  child: const Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.userName ??
                      "No Username", // Use userName or default message
                  style: const TextStyle(
                    fontSize: 23,
                    fontFamily: AppStringStyle.irishGrover,
                  ),
                ),
              ],
            ),
          ),
          // Display Full Name of User
          userdata(
            top: size.height * 0.30,
            left: size.width * 0.1,
            title: "Name : ",
            data: userFullName,
            error: "No name",
          ),
          // Display User email
          userdata(
            top: size.height * 0.35,
            left: size.width * 0.1,
            title: "Email : ",
            data: widget.email.toString(),
            error: "No Email",
          ),
          // Display user phone Number
          userdata(
            top: size.height * 0.40,
            left: size.width * 0.1,
            title: "Phone Number : ",
            data: widget.phoneNumber.toString(),
            error: "No Phone",
          ),

          // Logout button
          Positioned(
            top: size.height * 0.48,
            left: size.width * 0.1,
            child: LogoutButton(
              ontap: () {
                controller.logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
