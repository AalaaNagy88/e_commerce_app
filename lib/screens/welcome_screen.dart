import 'package:e_commerce_app/controllers/app_lang_controller.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/signup_screen.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: ScreenHelper.giveheight(context, .1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "welcom".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.grey[800]),
                ),
                Text(
                  "bolt".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
            Text(
              "explore".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.grey[800]),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .1),
            ),
            Image.asset("assets/images/welcome.png"),
            SizedBox(
              height: ScreenHelper.giveheight(context, .1),
            ),
            GetBuilder<AppLanguageController>(
              init: AppLanguageController(),
              builder: (_) {
                return DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text("English"),
                      value: "en",
                    ),
                    DropdownMenuItem(
                      child: Text("العربية"),
                      value: "ar",
                    )
                  ],
                  value: _.appLanguage,
                  onChanged: (value) {
                    _.changeLanguage(value);
                    Get.updateLocale(Locale(value));
                  },
                );
              },
            ),
            CustomButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, LoginScreen.routeName),
              title: "login".tr,
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            FlatButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, SignUpScreen.routeName),
                child: Center(
                    child: Text(
                  "signup".tr,
                  style: Theme.of(context).textTheme.headline5,
                ))),
          ],
        ),
      ),
    );
  }
}
