import 'package:chat_app_firebase/utilis/utilis.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String msgtitle;
  final String msg;

  const InputField({
    super.key,
    this.controller,
    this.hintText,
    required this.msgtitle,
    required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            Utilis.snackBar(msgtitle, msg);
          }
        },
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.amber,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
