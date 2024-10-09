import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:flutter/widgets.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppString.appTitle,
      style: TextStyle(fontSize: 40, fontFamily: AppStringStyle.irishGrover),
    );
  }
}
