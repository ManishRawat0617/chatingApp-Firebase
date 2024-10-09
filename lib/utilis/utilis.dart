import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utilis {
  static void feildFoucsChange(
      BuildContext context, FocusNode current, FocusNode nextNode) {
    current.unfocus();
    FocusScope.of(context).requestFocus();
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.appColorBlack,
        gravity: ToastGravity.BOTTOM);
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: AppColor.appColorBlack);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: AppColor.white, duration: const Duration(seconds: 4));
  }
}
