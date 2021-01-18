import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/signup_screen.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/languages_droup_down_list.dart';
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
            LanguagesDroupDownList(),
            CustomButton(
              onPressed: () =>
                  Navigator.pushNamed(context, LoginScreen.routeName),
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
