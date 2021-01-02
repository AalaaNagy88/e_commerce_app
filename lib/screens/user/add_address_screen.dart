import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'all_addresses_screen.dart';

// ignore: must_be_immutable
class AddAdressScreen extends StatelessWidget {
  static String routeName = "AddAdressScreen";
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _addressLane, _city, _postalCode, _phoneNumber;
  UserOperations _userOperations = UserOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            SizedBox(
              height: ScreenHelper.giveheight(context, .05),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.givewidth(context, .05)),
              child: Text(
                "Add Address",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "Adress Lane",
              onSaved: (value) {
                _addressLane = value;
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "City",
              onSaved: (value) {
                _city = value;
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "Postal Code",
              isNumbersOnly: true,
              onSaved: (value) {
                _postalCode = value.trim();
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "Phone Number",
              isNumbersOnly: true,
              onSaved: (value) {
                _phoneNumber = value.trim();
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .1),
            ),
            Builder(
              builder: (context) => CustomButton(
                title: "Add Address",
                onPressed: () async {
                  if (_globalKey.currentState.validate()) {
                    _globalKey.currentState.save();
                    try {
                      String fullAddress = "$_addressLane,$_city-$_postalCode";

                      Provider.of<UserInfoProvider>(context, listen: false)
                          .user
                          .address
                          .add(fullAddress);
                      Provider.of<UserInfoProvider>(context, listen: false)
                          .user
                          .phone = _phoneNumber;
                      _userOperations.updateUserData(context);
                      Navigator.pushReplacementNamed(
                          context, AllAdressesScreen.routeName);
                    } catch (e) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("${e.message}"),
                      ));
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
