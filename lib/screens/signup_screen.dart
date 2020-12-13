import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      "Signup",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: ScreenHelper.giveheight(context, .08),
                  ),
                  CustomTextFormField(label: "Name"),
                  SizedBox(
                    height: ScreenHelper.giveheight(context, .02),
                  ),
                  CustomTextFormField(label: "Email",onSaved: (value){_email=value;},),
                  SizedBox(
                    height: ScreenHelper.giveheight(context, .02),
                  ),
                  CustomTextFormField(
                    label: "Password",
                    isPassword: true,
                    onSaved: (value){_password=value;},
                  ),
                  SizedBox(
                    height: ScreenHelper.giveheight(context, .1),
                  ),
                  Builder(
                    builder:(context)=> CustomButton(
                      title: "Sign Up",
                      onPressed: ()async{
                        _isLoading(true);
                        if(_globalKey.currentState.validate()){
                          _globalKey.currentState.save();
                          try {
                            await _auth.signUp(_email, _password);
                            _isLoading(false);
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
                        "Already have an ancount ?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        child: Text(
                          "Sign in",
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
    setState((){
      _loading=value;
    });
  }
}
