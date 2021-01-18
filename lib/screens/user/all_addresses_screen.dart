import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:e_commerce_app/screens/user/add_address_screen.dart';
import 'package:e_commerce_app/screens/user/check_out_screen.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AllAdressesScreen extends StatefulWidget {
  static String routeName = "AllAdressesScreen";

  @override
  _AllAdressesScreenState createState() => _AllAdressesScreenState();
}

class _AllAdressesScreenState extends State<AllAdressesScreen> {
  String _groupValue = "";
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserInfoProvider>(context).user;
    return DefaultScreen(
      title: "Address".tr,
      children: user.address.length == 0
          ? [Center(child: Text("emptyAddress".tr)), Spacer(), _screenButtons()]
          : [
              Container(
                height: ScreenHelper.givewidth(context, 1),
                child: ListView.builder(
                  itemCount: user.address.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(user.address[i].toString()),
                      trailing: Radio(
                        value: user.address[i].toString(),
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = user.address[i].toString();
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Expanded(child: _screenButtons())
            ],
    );
  }

  _screenButtons() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.givewidth(context, .1)),
          child: DottedBorder(
              dashPattern: [4, 2],
              strokeWidth: 2,
              color: kMainColor,
              child: Center(
                child: ListTile(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, AddAdressScreen.routeName),
                  title: Text(
                    "addAddress".tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: kMainColor),
                  ),
                  leading:
                      Icon(Icons.add_location_alt_rounded, color: kMainColor),
                ),
              )),
        ),
        SizedBox(
          height: ScreenHelper.giveheight(context, .03),
        ),
        CustomButton(
          title: "Checkout".tr,
          onPressed: () => _groupValue != ""
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckOutScreen(
                            selectedAddress: _groupValue,
                          )))
              : showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                          content: Text("selectAdressMesg".tr),
                          actions: [
                            TextButton(
                                child: Text("okay".tr),
                                onPressed: () => Navigator.pop(context)),
                          ])),
        )
      ],
    );
  }
}
