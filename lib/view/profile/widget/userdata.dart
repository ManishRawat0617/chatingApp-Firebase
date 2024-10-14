import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:flutter/widgets.dart';

class userdata extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final String title;
  final String data;
  final String error;
  const userdata({
    super.key,
    this.top,
    required this.title,
    required this.data,
    this.left,
    required this.error,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Row(
        children: [
          Text(
            title, // Use email or default message
            style: const TextStyle(
              fontSize: 23,
              fontFamily: AppStringStyle.irishGrover,
            ),
          ),
         const  SizedBox(
            width: 20,
          ),
          Text(
            data ?? error, // Use email or default message
            style: const TextStyle(
              fontSize: 23,
              fontFamily: AppStringStyle.irishGrover,
            ),
          ),
        ],
      ),
    );
  }
}
