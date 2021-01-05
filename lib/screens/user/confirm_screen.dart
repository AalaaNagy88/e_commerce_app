import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/user/home_screen.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
            "confirmation".tr,
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.black54),
          ),
          Text(
            "confirmMessage".tr,
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
            title: "backhome".tr,
          )
        ],
      ),
    );
  }
}
