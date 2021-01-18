import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'all_addresses_screen.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
                "addAddress".tr,
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
              label: "adressLane".tr,
              onSaved: (value) {
                _addressLane = value;
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "city".tr,
              onSaved: (value) {
                _city = value;
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "postalCode".tr,
              isNumbersOnly: true,
              onSaved: (value) {
                _postalCode = value.trim();
              },
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "phoneNumber".tr,
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
                title: "addAddress".tr,
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
