import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/user/home_screen.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  static String routeName = "ConfirmScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/confirm.jpg"),
          Text(
            "Confirmation",
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.black54),
          ),
          Text(
            "You have successfully\ncompleted your order procedure",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: ScreenHelper.giveheight(context, .2),
          ),
          CustomButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
            title: "Back to Home",
          )
        ],
      ),
    );
  }
}
