import 'package:e_commerce_app/screens/reset_password_screen.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'change_language_screen.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "SettingsScreen";
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultScreen(
        title: "settings".tr,
        children: [
          ListTile(
              title: Text("language".tr),
              onTap: () => Get.toNamed(ChangeLanguageScreen.routeName)),
          ListTile(
            title: Text("resetPassword".tr),
            onTap: () =>
                Navigator.pushNamed(context, ResetPasswordScreen.routeName),
          ),
        ],
      ),
    );
  }
}
