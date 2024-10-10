import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback? ontap;
  const GetStartedButton({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: Get.height * 0.08,
        width: Get.width * 0.8,
        decoration: BoxDecoration(
            color: AppColor.appBar, borderRadius: BorderRadius.circular(35)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppString.getStarted,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: AppStringStyle.irishGrover,
                  color: AppColor.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.double_arrow,
              size: 30,
              color: AppColor.white,
            )
          ],
        ),
      ),
    );
  }
}
