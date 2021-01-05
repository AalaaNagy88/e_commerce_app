import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _auth = Auth();
  UserOperations _userOperations = UserOperations();

  String _email, _password, _name;
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
                  "signup".tr,
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
                label: "name".tr,
                onSaved: (value) {
                  _name = value.trim();
                },
              ),
              SizedBox(
                height: ScreenHelper.giveheight(context, .02),
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
                height: ScreenHelper.giveheight(context, .1),
              ),
              Builder(
                builder: (context) => CustomButton(
                  title: "signup".tr,
                  onPressed: () async {
                    _isLoading(true);
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      try {
                        UserCredential result =
                            await _auth.signUp(_email, _password);
                        UserModel user = UserModel(
                            id: result.user.uid, name: _name, email: _email);
                        _userOperations.addUser(user);
                        _isLoading(false);
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      } catch (e) {
                        _isLoading(false);
                        Scaffold.of(context).showSnackBar(SnackBar(
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
                    "have account".tr,
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    child: Text(
                      "login".tr,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _isLoading(value) {
    setState(() {
      _loading = value;
    });
  }
}
