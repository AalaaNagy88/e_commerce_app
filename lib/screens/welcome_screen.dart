import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/signup_screen.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "WelcomeScreen";
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
                  "Welcome to ",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.grey[800]),
                ),
                Text(
                  "Bolt",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
            Text(
              "Explore Us",
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
              height: ScreenHelper.giveheight(context, .2),
            ),
            CustomButton(onPressed: ()=>Navigator.pushNamed(context, LoginScreen.routeName),),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            FlatButton(
                onPressed: ()=>Navigator.pushNamed(context, SignUpScreen.routeName),
                child: Center(
                    child: Text(
                  "Signup",
                  style: Theme.of(context).textTheme.headline5,
                ))),
          ],
        ),
      ),
    );
  }
}
