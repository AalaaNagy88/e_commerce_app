import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  static String routeName = "ResetPasswordScreen";
  ResetPasswordScreen({Key key}) : super(key: key);
  TextEditingController _email = TextEditingController();
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(title: "resetPassword".tr, children: [
      CustomTextFormField(
        label: "email".tr,
        controller: _email,
      ),
      SizedBox(
        height: ScreenHelper.giveheight(context, .1),
      ),
      CustomButton(
        onPressed: () {
          _auth.changePassword(_email.text);
          showDialog(
              context: context,
              builder: (_) =>
                  AlertDialog(content: Text("resetPasswordMesg".tr), actions: [
                    TextButton(
                        child: Text("okay".tr),
                        onPressed: () => Navigator.popUntil(
                              context,
                              ModalRoute.withName(LoginScreen.routeName),
                            ))
                  ]));
        },
        title: "resetPassword".tr,
      )
    ]);
  }
}
