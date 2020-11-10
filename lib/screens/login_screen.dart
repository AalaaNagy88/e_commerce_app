import 'package:e_commerce_app/core/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/signup_screen.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'admin/admin_panal.dart';


// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  static String routeName = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();

  final _auth=Auth();

  String _email,_password;

  bool _loading=false;

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
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .08),
            ),
            CustomTextFormField(label: "Email",onSaved: (value){_email=value;},),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "Password",
              isPassword: true,
              onSaved: (value){
                _password=value;
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .1),
            ),
            Builder(
              builder: (context)=> CustomButton(
                onPressed: ()async{
                  _isLoading(true);
                  if(_globalKey.currentState.validate()){
                    _globalKey.currentState.save();
                   try{
                     UserCredential result=await _auth.signIn(_email, _password);
                     _isLoading(false);
                     if(result.user.uid=="DaNtyvAV0TaESYJULzghyMyV83T2"){
                       Navigator.pushReplacementNamed(context, AdminPanal.routeName);
                     }
                   }catch(e){
                     _isLoading(false);
                     Scaffold.of(context).showSnackBar(SnackBar(content: Text("${e.message}"),));
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
                  "Don\'t have an ancount ?",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  child: Text(
                    "Sign Up",
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
    setState((){
      _loading=value;
    });
  }
}
