import 'package:e_commerce_app/controllers/user_session_controller.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/loading.dart';
import 'package:e_commerce_app/screens/reset_password_screen.dart';
import 'package:e_commerce_app/screens/signup_screen.dart';
// import 'package:e_commerce_app/screens/user/home_screen.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'admin/admin_panal_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  static String routeName = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _auth = Auth();

  String _email, _password;

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: _loading,
      child: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.grey[700],
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.givewidth(context, .05)),
              child: Text(
                "login".tr,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .08),
            ),
            CustomTextFormField(
              label: "email".tr,
              onSaved: (value) {
                _email = value.trim();
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "password".tr,
              isPassword: true,
              onSaved: (value) {
                _password = value.trim();
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.givewidth(context, .05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, ResetPasswordScreen.routeName),
                      child: Text("forgetPassword".tr)),
                ],
              ),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .05),
            ),
            GetBuilder<UserSessionController>(
              init: UserSessionController(),
              builder: (_) => CustomButton(
                title: "login".tr,
                onPressed: () async {
                  _isLoading(true);
                  if (_globalKey.currentState.validate()) {
                    _globalKey.currentState.save();
                    try {
                      UserCredential result =
                          await _auth.signIn(_email, _password);
                      if (result.user.uid == "DaNtyvAV0TaESYJULzghyMyV83T2") {
                        _isLoading(false);
                        Navigator.pushReplacementNamed(
                            context, AdminPanalScreen.routeName);
                      } else {
                        Get.find<UserSessionController>().changeUser(_email);
                        _isLoading(false);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loading(
                                      email: _email,
                                    )));
                      }
                    } catch (e) {
                      _isLoading(false);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${e.message}"),
                      ));
                    }
                  }
                  _isLoading(false);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "haven't account".tr,
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  child: Text(
                    "signup".tr,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  void _isLoading(value) {
    setState(() {
      _loading = value;
    });
  }
}
